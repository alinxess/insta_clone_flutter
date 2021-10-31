const { ApolloServer, gql } = require('apollo-server');
//const resolvers= require('./resolvers');
const typeDefs = require('./server_api');
const admin = require("firebase-admin");

const serviceAccount = require('../service-account.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://insta-4eaaf.firebaseio.com"
});


const getMe = async (req) => {
// Get the user token from the headers.
  const idToken = req.headers.authorization || '';
  console.log("token from request : "+idToken);

 const token = idToken.split(' ');
 console.log("Without Bearer :"+token[1]);

 const validuid = await admin.auth().verifyIdToken(token[1])
         .then(function(decodedToken){
          console.log("decoded token : "+decodedToken);
           return decodedToken.uid;
         }).catch(function(error){
            console.log(error);
            return null;
         });
        console.log("valid uid : "+validuid);


return validuid;

};

const resolvers = {
    Query:{
      async getUserData(parent,args,context){

              if(!context.user){
              console.log(" Not Authenticated as user")
              }
             const currentuser = context.user;
              console.log(" user in resolver: " + currentuser);



              const userRef=  admin.firestore().collection('users').doc(currentuser);
              const dataExtracted = await userRef.get()
                          .then(function(doc){
                           console.log(doc.data());
                           const userdata = doc.data();
                           return userdata;
                          });

               return dataExtracted;

            }


      }

}

const server = new ApolloServer({
 typeDefs,
 resolvers,

 context: async({req}) => {


     // Get the user token from the headers.
       const user = await getMe(req);
       console.log("got userid from decoded token : " + user);

       if (!user) throw new AuthenticationError('you must be logged in');

       // add the user to the context
       return {user};
},

 playground: true,
 introspection: true});

server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
});


