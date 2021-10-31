const { gql } = require('apollo-server');

const typeDefs = gql`

type Users{
    email:String!,
    fullname:String,
    user_id:String!,
    username:String
    }


    type Query {
      getUserData: Users

    }

`;

module.exports = typeDefs;