$().ready(function() {
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
             fullname: "Please enter your fullname *",
 
             username: {
                 required: "Please enter a username *",
                 minlength: "Your username must consist of at least 2 characters *"
             },
             origpassword: {
                 required: "Please provide a password *",
                 minlength: "Your password must be at least 5 characters long *"
             },
             confirm_password: {
                 required: "Please provide a confirm password *",
                 minlength: "Your password must be at least 5 characters long *",
                 equalTo: "Please enter the same password as above *"
             },
             emailid: "Please enter a valid email address *",
 
         }
     });
     /*
     $("#username").focus(function() {
          var fullname = $("#emailid").val();
          
          if (fullname && !this.value) {
               this.value = fullname ;
          }
     });
     */
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
                 required: "Please enter your Username/Emailid *",
                 minlength: "Enter minimum 4 characters *"
             },
             loginpassword: {
                 required: "Please provide your password *",
             }
         }
     });
     // $.validator.addMethod('customphone', function(value, element) {
     //     return this.optional(element) || /^\d{10}$/.test(value);
     // }, "Enter valid 10 digit number *");
 
     $("#addcontactform").validate({
         rules: {
             firstname: "required",
             lastname: "required",
             title: "required",
             gender: "required",
             dob: "required",
             email: {
                 required: true,
                 email: true
             },
               phone: {
                    required: true,
                    digits: true,
                    minlength: 10,
                    maxlength: 10
               },
             address: "required",
             street: "required",
             pincode: {
                 required: true,
                  digits: true,
                  minlength: 4,
                  maxlength: 6
             }
         },
         messages: {
             firstname: "Firstname Required *",
             lastname: "Lastname Required *",
             title: "Title Required *",
             gender: "Select Gender *",
             dob: "DOB Required *",
             email: "Valid Email Required *",
             phone: {
                   required:" Pin Required *",
                   minlength: "Enter min 10 characters *",
                   maxlength: "Enter max 10 characters *"
              },
             address: "Address Required *",
             street: "Street Required *",
              pincode: {
               required:"Pincode Required *",
                   minlength: "Enter min 4 characters *",
                   maxlength: "Enter max 4 characters *"
              }
         },
     });
 });
 
 // $('#exampleModal').on('hidden.bs.modal', function () {
 //      alert("ji");
 // })
 // $('#exampleModal').on('hidden.bs.modal', function (event) {
 //      alert("ji");
 // })
 //var validator = $( "#myform" ).validate();
 //validator.resetForm();
 
 $(document).on('hide.bs.modal', '#exampleModal', function() {
     var validator = $("#addcontactform").validate();
      validator.resetForm();
      $('form#addcontactform').trigger("reset");
 });

 $(document).on('click', '.editbtn', function() {
     $("#modheading").html("EDIT CONTACT");
 
     var _contactid = $(this).data('conid');
     $.ajax({
         type: "post",
         url: 'components/backend.cfc?method=displaydata',
         data: {
             editid: _contactid
         },
         beforeSend: function() {
             $("#subcontact").attr("disabled", true);
         },
         success: function(response) {
             p = JSON.parse(response);
             $("#updatedata").val(p.DATA[0][0]);
             $("#title").val(p.DATA[0][1]).change();
             $("#firstname").val(p.DATA[0][2]);
             $("#lastname").val(p.DATA[0][3]);
             $("#gender").val(p.DATA[0][4]).change();
             let dateStr = new Date(p.DATA[0][5]);
             var now = new Date(p.DATA[0][5]);
             var day = ("0" + now.getDate()).slice(-2);
             var month = ("0" + (now.getMonth() + 1)).slice(-2);
             var today = now.getFullYear() + "-" + (month) + "-" + (day);
             $('#dob').val(today);
             $("#email").val(p.DATA[0][6]);
             $("#phone").val(p.DATA[0][7]);
             $("#address").val(p.DATA[0][8]);
             $("#street").val(p.DATA[0][9]);
             $("#oldphoto").val(p.DATA[0][10]);
             $("#pincode").val(p.DATA[0][11]);
               //    var newSrc = "./contactimgs/" + p.DATA[0][10];
               // console.log(p.DATA[0][10]);
               if (p.DATA[0][10] == "noimage.png") {
                    var newSrc = "./images/" + p.DATA[0][10];
               }
               else {
                    var newSrc = "./contactimgs/" + p.DATA[0][10];
               }
              $("#theimage").attr('src', newSrc);
              $("#subcontact").removeAttr("disabled");
         }
     });
 });

 $(document).on('click', '.viewbtn', function() {
     var _contactid = $(this).data('conid');
     $.ajax({
         type: "post",
         url: 'components/backend.cfc?method=displaydata',
         data: {
             editid: _contactid
         },
         success: function(response) {
             p = JSON.parse(response);
             // $("#coid").html(p.DATA[0][0]);
             $("#cname").html(p.DATA[0][1] + '. ' + p.DATA[0][2] + ' ' + p.DATA[0][3]);
             $("#cgen").html(p.DATA[0][4]);
             let dateStr = new Date(p.DATA[0][5]);
             var now = new Date(p.DATA[0][5]);
             var day = ("0" + now.getDate()).slice(-2);
             var month = ("0" + (now.getMonth() + 1)).slice(-2);
             var today = now.getFullYear() + "-" + (month) + "-" + (day);
             $('#cbday').html(today);
             $("#cem").html(p.DATA[0][6]);
             $("#cph").html(p.DATA[0][7]);
             $("#cadd").html(p.DATA[0][8] + ",<br>" + p.DATA[0][9]);
             $("#cpin").html(p.DATA[0][11]);
          //     console.log(p.DATA[0][10]);
              if (p.DATA[0][10] == "noimage.png") {
                   var newSrc = "./images/" + p.DATA[0][10];
              }
              else {
                   var newSrc = "./contactimgs/" + p.DATA[0][10];
              }

             $("#theimageview").attr('src', newSrc);
         }
     });
 });
 
$(document).ready(function () {
     var _contactid = $("#updatedata").val();
    
     if (_contactid == "" || _contactid == null)
     {
          $('form#addcontactform').trigger("reset");
     }
     $('input[type=file]#FiletoUpload').change(function() {
         const [file] = FiletoUpload.files
         if (file) {
             theimage.src = URL.createObjectURL(file)
         }
     });
 
     function readURL(input) {
         //console.log(input);
         if (input.files && input.files[0]) {
             var reader = new FileReader();
             reader.onload = function(e) {
                 $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
                 $('#imagePreview').hide();
                 $('#imagePreview').fadeIn(650);
             }
             reader.readAsDataURL(input.files[0]);
             _userid = $("#picuserid").val();
             _pic = input.files[0].name;
             // console.log("uid"+_userid);
             // console.log("foto"+_pic);
             var form = $('#form1')[0];
             var data = new FormData(form);
             data.append("photo", _pic);
             data.append("uid", _userid);
             $.ajax({
                 type: "post",
                 url: 'components/backend.cfc?method=updateprofilepic',
                 // data: { photo : _pic,uid : _userid }, 
                 //enctype: 'multipart/form-data',
                 data: data,
                 cache: false,
                 contentType: false,
                 processData: false,
                 success: function(response) {
                     p = JSON.parse(response);
                     //  console.log(p.SERVERFILE);
                     // var newSrc = "./profilepics/"+p.DATA[0][10];
                     //$("#imagePreview").attr('src', newSrc);
                     $('#imagePreview').css("background-image", "url('profilepics/'" + p.SERVERFILE + ")");
                 }
             });
         }
     }
 
     $("#imageUpload").change(function(e) {
         e.preventDefault();
         readURL(this);
     });
 });
 
 
 $(document).ready(function() {
     window.setTimeout(function() {
         $(".alert1").fadeTo(1000, 0).slideUp(1000, function() {
             $(this).remove();
         });
     }, 1500);
 
 });

     
          $(document).on("blur","#emailid",function() {
          
          var email = $('#emailid').val();
          if (email == '') {
               email_state = false;
               return;
          }
          $.ajax({
               url: 'components/backend.cfc?method=checkUsername',
               type: 'post',
               data: {
                    'userinput': email,
                    'userinputtype': 'em'
               },
               success: function (response) {
                    console.log(response);
                    if (response == "true") {
                         email_state = false;
                         $('#emailid').parent().removeClass();
                         $('#emailid').parent().addClass("form_error");
                         $('#emailid').siblings("span").text('Sorry... Email already taken');
                         $("#regbtn").attr("disabled", true);
                    } else if (response == "false") {
                         email_state = true;
                         $("#regbtn").removeAttr("disabled");
                         $('#emailid').parent().removeClass();
                         $('#emailid').parent().addClass("form_success");
                         $('#emailid').siblings("span").text('Email available');
                    }
               }
          });
     });

   
          $(document).on("blur","#username",function() {
          
          var username = $('#username').val();
          if (username == '') {
               username_state = false;
               return;
          }
          $.ajax({
               url: 'components/backend.cfc?method=checkUsername',
               type: 'post',
               data: {
                    'userinput': username,
                    'userinputtype': 'un'
               },
               success: function (response) {
                    if (response == 'true') {
                         username_state = false;

                         $('#username').parent().removeClass();
                         $('#username').parent().addClass("form_error");
                         $('#username').siblings("span").text('Sorry... Username already taken');
                         $("#regbtn").attr("disabled", true);
                    } else if (response == 'false') {
                         username_state = true;
                         $("#regbtn").removeAttr("disabled");
                         $('#username').parent().removeClass();
                         $('#username').parent().addClass("form_success");
                         $('#username').siblings("span").text('Username available');

                    }
               }
          });
     });
    



 
 /*
 function PrintDocument() {
      // $("#employee th:nth-child(5)").hide();
 
      //      $("#employee td:nth-child(5)").hide();
      //        $("#employee td:nth-child(6)").hide();
      //          $("#employee td:nth-child(7)").hide();
    
              var divToPrint  = document.getElementById("employee");
      window.print();
 //     newWin = window.open("");
      //  newWin.document.write(divToPrint.outerHTML);
      //  newWin.print();
      //  newWin.close()
     
           //Or show hidden columns again
 //           $("#employee th:nth-child(5)").show();
 //          $("#employee td:nth-child(5)").show();
 //  $("#employee td:nth-child(6)").show();
 //     $("#employee td:nth-child(7)").show();
 
          
       }   
       */




