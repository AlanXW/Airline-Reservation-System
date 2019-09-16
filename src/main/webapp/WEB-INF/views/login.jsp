<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>ARS</title>
  <link href="https://fonts.googleapis.com/css?family=Cabin:400,600" rel="stylesheet">
  <link rel="stylesheet" href="/assets/styles/style.css">
</head>

<body>
<header id="masthead" class="site-header site-header--fluid bg-primary">
  <div class="d-lg-flex justify-content-lg-between align-items-lg-center site-header__container">
    <div class="d-lg-flex align-items-lg-center">
      <div class="site-header__logo">
        <a href="/">
          <h1 class="screen-reader-text">ARS</h1>
        </a>
      </div>
    </div>
    <div class="d-lg-flex align-items-lg-center">
      <ul class="min-list main-navigation main-navigation--white">
        <li>
          <a href="/">Home</a>
        </li>
        <li>
          <a href="/flight/user">My Tickets</a>
        </li>
      </ul><!-- .main-navigation -->

      <div class="user-action">
        <c:choose>
          <c:when test="${sessionScope.user.username==null}">
            <a href="/user/login" class="sign-in c-white">
              <i class="fa fa-user"></i>
              Sign in
            </a>
          </c:when>
          <c:otherwise>
            <a href="/user/login" class="sign-in c-white">
              <i class="fa fa-user"></i>
                ${sessionScope.user.username}
            </a>
            <button class="button button--small button--pill button--primary d-none d-lg-inline-block" onclick="location.href='/user/logout'">Log out</button>
          </c:otherwise>
        </c:choose>
      </div><!-- .user-action -->
    </div>

    <div class="d-lg-none nav-mobile">
      <a href="#" class="nav-toggle js-nav-toggle nav-toggle--white">
        <span></span>
      </a><!-- .nav-toggle -->
    </div><!-- .nav-mobile -->
  </div><!-- .site-header__container -->
</header><!-- #masthead -->
<div class="page-content">
  <div class="breadcrumbs-container">
  <div class="container">
    <ul class="breadcrumbs min-list inline-list">
      <li class="breadcrumbs__item">
        <a href="/" class="breadcrumbs__link">
          <span class="breadcrumbs__title">Home</span>
        </a>
      </li>
      <li class="breadcrumbs__item">
        <span class="breadcrumbs__page c-gray">Login/Signup</span>
      </li>
    </ul><!-- .breadcrumbs -->
  </div><!-- .container -->
</div>
  <div class="container">
  <div class="row">
    <div class="col-md-5 offset-md-4">
      <div class="form-login js-login-form">
        <div class="form-login__block js-form-block is-selected" id="signin">
          <form action="/user/login" method="post">
            <div class="form-container">
              <h3 class="form-title t-center">Sign In</h3>
              <div class="form-group">
                <label for="login-user">Username or Email</label>
                <input
                  type="text"
                  name="username"
                  id="login-user"
                  class="form-input form-input--pill form-input--border-c-gallery"
                  required
                  placeholder="username"
                >
              </div><!-- .form-group -->

              <div class="form-group">
                <label for="login-password">Password</label>
                <input
                  type="password"
                  name="password"
                  id="login-password"
                  class="form-input form-input--pill form-input--border-c-gallery"
                  required
                  placeholder="******"
                >
              </div><!-- .form-group -->

              <div class="form-group">
                <div class="form-group__container">
                  <label for="remember-me" class="icheck_label">
                    <input type="checkbox" id="remember-me" name="iCheck">
                    Remember Me
                  </label>
                  <a href="#reset" class="c-gray js-block-trigger">Forgot Password?</a>
                </div><!-- .form-group__container -->
              </div><!-- .form-group -->

              <div class="form-group--submit">
                <button
                  class="button button--primary button--pill button--large button--block button--submit"
                  type="submit"
                >
                  Log In
                </button>
              </div>

              <div class="form-group--footer">
            <span class="c-gray">
              Don't have an account? <a href="#signup" class="c-secondary t-underline js-block-trigger">Register</a>
            </span>
              </div>
            </div><!-- .form-container -->
          </form><!-- .signin -->
        </div><!-- .form-login__block -->

        <div class="form-login__block js-form-block" id="signup">
          <form action="/user/register" method="post">
            <div class="form-container">
              <h3 class="form-title t-center">Sign Up</h3>
              <div class="form-social">
                <label for="signup-email">Email *</label>
                <input
                  type="email"
                  name="username"
                  id="signup-email"
                  class="form-input form-input--pill form-input--border-c-gallery"
                  required
                  placeholder="***@gmail.com"
                >
              </div><!-- .form-group -->

              <div class="form-group">
                <label for="signup-name">Password *</label>
                <input
                  type="password"
                  name="password"
                  id="signup-name"
                  class="form-input form-input--pill form-input--border-c-gallery"
                  required
                  placeholder="John Doe"
                >
              </div><!-- .form-group -->

              <div class="form-group">
                <label for="signup-password">Confirm password *</label>
                <input
                  type="password"
                  name="confirmPwd"
                  id="signup-password"
                  class="form-input form-input--pill form-input--border-c-gallery"
                  required
                  placeholder="******"
                >
              </div><!-- .form-group -->

              <div class="form-group">
              <span class="c-gray">
                By creating an account your agree to our <a href="#" class="t-underline">Terms and Conditions</a>
                and our <a href="#" class="t-underline">Privacy Policy</a>
              </span>
              </div><!-- .form-group -->

              <div class="form-group--submit">
                <button
                  class="button button--primary button--pill button--large button--block button--submit"
                  type="submit"
                >
                  Sign Up
                </button>
              </div>

              <div class="form-group--footer">
              <span class="c-gray">
                Already have an account?
                <a href="#signin" class="c-secondary t-underline js-block-trigger">Sign in</a>
              </span>
              </div>
            </div><!-- .form-container -->
          </form><!-- .signup -->
        </div><!-- .form-login__block -->

        <div class="form-login__block js-form-block" id="reset">
          <form action="/" method="post">
            <div class="form-container">
              <div class="form-group">
                <label for="reset-password">Email</label>
                <input
                  type="email"
                  name="reset-password"
                  id="reset-password"
                  class="form-input form-input--pill form-input--border-c-gallery"
                  placeholder="johndoe@gmail.com"
                  required
                >
              </div><!-- .form-group -->

              <div class="form-group--submit">
                <button
                  class="button button--primary button--pill button--large button--block button--submit"
                  type="submit"
                >
                  Reset Password
                </button>
              </div>

              <div class="form-group--footer">
                <a href="#signin" class="c-secondary t-underline js-block-trigger">Back to Sign in</a>
              </div>
            </div><!-- .form-container -->
          </form><!-- .reset -->
        </div><!-- .form-login__block -->
      </div><!-- .form-login -->
    </div><!-- .col -->
  </div><!-- .row -->
</div><!-- .container -->
</div><!-- .page-content -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDyCxHyc8z9gMA5IlipXpt0c33Ajzqix4"></script>
<script src="https://cdn.rawgit.com/googlemaps/v3-utility-library/master/infobox/src/infobox.js"></script>
<script src="/assets/scripts/app.js"></script>
<script>
  if ('${status}' != '') {
    if ('${status}' == 0) {
      alert('Wrong password!')
    }else if ('${status}' == 1) {
      alert('Username is existed!');
    }
    else if ('${status}' == 2) {
      alert('Two passwords input are different!')
    }
  }
</script>
</body>
</html>
