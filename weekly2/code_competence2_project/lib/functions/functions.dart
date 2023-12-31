  Map nameValidator({
    required String val,
  }){
    String? errorTextName;
    bool isNameValid;

    if(val.isEmpty){
      errorTextName = "Name must be filled";
      isNameValid = false;
    } else if(RegExp(r'[0-9!@#$%^&*()_+{}\[\]:;<>,.?/~\\-]').hasMatch(val)){
      errorTextName = "Nama must be alphabet";
      isNameValid = false;
    } else if(RegExp(r'\b[a-z][a-z]*\b').hasMatch(val)){
      errorTextName = "Name must be capital";
      isNameValid = false;
    } else {
      errorTextName = null;
      isNameValid = true;
    }
    return {"errorTextName" : errorTextName, "isNameValid" : isNameValid};
  }

  Map emailValidator({
    required String val,
  }){
    String? errorTextEmail;
    bool isEmailValid;

    if(val.isEmpty){
      errorTextEmail = "Email must be filled";
      isEmailValid = false;
    } else if(RegExp(r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$').hasMatch(val)){
      errorTextEmail = null;
      isEmailValid = true;
    } else {
      errorTextEmail = "Invalid email format";
      isEmailValid = false;
    }
    return {"errorTextEmail" : errorTextEmail, "isEmailValid" : isEmailValid};
  }

  Map<String,String> submitData({
    required String firstNameValue,
    required String lastNameValue,
    required String emailValue,
    required String messageValue
  }){
    Map<String,String> data = {
      "firstName": firstNameValue,
      "lastName": lastNameValue,
      "email": emailValue,
      "message": messageValue
    };
    return data;
  }