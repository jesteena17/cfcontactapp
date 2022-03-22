<html>
<head>
  <title>Bootstrap 5 Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
          <!---<meta name="viewport" content="width=device-width, initial-scale=1">--->
          <meta name="description" content="Login Page">
          <meta name="author" content="SitePoint">
          <meta http-equiv="cache-control" content="max-age=0" />
          <meta http-equiv="cache-control" content="no-cache" />
          <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
          <meta http-equiv="expires" content="0" />
          <meta http-equiv="pragma" content="no-cache" />
          <cfheader name="cache-control" value="no-cache, no-store, must-revalidate"> 
          <cfheader name="pragma" value="no-cache">
          <cfheader name="expires" value="#getHttpTimeString(now())#">
  <link href="css/bootstrap.css" rel="stylesheet">
  <link href="css/all.css" rel="stylesheet">
  <link href="css/styles.css" rel="stylesheet"/>
    <script src="js/jquery-3.6.0.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-primary ">
    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.cfm">
                    <i class="fa-regular fa-address-book"></i>CONTACT BOOK
                </a>
            </li>
          <!--  <li class="nav-item">
                <a class="nav-link" href="//codeply.com">Codeply</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>-->
        </ul>
    </div>
    <!--<div class="mx-auto order-0">
        <a class="navbar-brand mx-auto" href="#">Navbar 2</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div> -->
    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2 nvcolor">
        <ul class="navbar-nav ml-auto">
           <li  class="nav-item"><a class="nav-link" href="signup.cfm"><i class="fa fa-user"></i>Sign up</a></li><br>
          <li class="nav-item"><a class="nav-link" href="signin.cfm"><i class="fa-solid fa-right-to-bracket"></i>Login</a></li>
        </ul>
    </div>
</nav>