
$().ready(function() {

     // validate signup form on keyup and submit
     $("#signupForm").validate({
          rules: {
               fullname: "required",
     
               username: {
                    required: true,
                    minlength: 2
               },
               origpassword: {
                    required: true,
                    minlength: 5
               },
               confirm_password: {
                    required: true,
                    minlength: 5,
                    equalTo: "#origpassword"
               },
               emailid: {
                    required: true,
                    email: true
               }
          },
          messages: {
               fullname: "Please enter your fullname",

               username: {
                    required: "Please enter a username",
                    minlength: "Your username must consist of at least 2 characters"
               },
               origpassword: {
                    required: "Please provide a password",
                    minlength: "Your password must be at least 5 characters long"
               },
               confirm_password: {
                    required: "Please provide a confirm password",
                    minlength: "Your password must be at least 5 characters long",
                    equalTo: "Please enter the same password as above"
               },
               emailid: "Please enter a valid email address",
               
          }
     });
     // propose username by combining first- and lastname
     $("#username").focus(function() {
          var fullname = $("#emailid").val();
          
          if (fullname && !this.value) {
               this.value = fullname ;
          }
     });


     $("#signinForm").validate({
          rules: {
               
               loginid: {
                    required: true,
                    minlength: 4
               },
               loginpassword: {
                    required: true,
                    minlength: 5
               }
          },
          messages: {
               loginid: {
                    required: "Please enter your Username/Emailid",
                    minlength: "Enter minimum 4 characters"
               },
               loginpassword: {
                    required: "Please provide Your password",
               }
          }
     });


     
     $("#addcontactform").validate({
          rules: {
               firstname: "required",
               lastname: "required",
               title: "required",
               gender: "required",
               dob: "required",
               email: "required",
               phone: "required",
               address: "required",
               street: "required",
               pincode:"required"
          },
          messages: {
               firstname: "Firstname Required *",
               lastname: "Lastname Required *",
               title: "Title Required *",
               gender: "Select Gender *",
               dob: "DOB Required *",
               email: "Email Required *",
               phone: "Phone Required *",
               address: "Address Required *",
               street: "Street Required *",
               pincode: "Pincode Required *"
          },
          
     });
});