import 'package:haggle_x/model/user.dart';

class QueryMutation {
  String login(String email, String password) {
    return '''
   mutation{
  login(data:{
    input: "$email"
    password: "$password" 
    
    
  }){
    user{
      _id
      username
      email
    }
    token
    twoFactorAuth
      
    
  }
}   
    
     ''';
  }

  String resendCode(String email) {
    return '''
    query{
      resendVerificationCode(
      data:{
           email:"$email"
    
  })
     
    }   
    
     ''';
  }

  String verifyUser(int code) {
    return '''
    mutation{
     verifyUser(
      data:{    
        code:$code  
    }){
      user{
        _id,
         email,
     username
      phonenumber
  }
    
  }
  
}
    
     ''';
  }

  String register(User user) {
    return """ 
      mutation{
        register(
        data:{
          email: "${user.email}",
          username: "${user.username}",
          password: "${user.password}",
          phonenumber: "${user.phonenumber}",
          referralCode: "${user.referralCode}",
          country: "${user.country}",
          currency:"${user.currency}"
        }) {
        user{
         _id
        email
        username
        
        
        }
        token
          
        }
      }
    """;
  }

  String getCountries() {
    return ''' 
    query{
  getActiveCountries{
    callingCode,
    name,
    currencyCode,
    flag
    
  }
}
    
    
    ''';
  }
}
