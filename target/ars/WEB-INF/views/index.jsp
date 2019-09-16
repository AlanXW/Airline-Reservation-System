<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>ARS</title>
  <link href="https://fonts.googleapis.com/css?family=Cabin:400,600" rel="stylesheet">
  <link rel="stylesheet" href="/assets/styles/style.css">
  <link rel="stylesheet" href="/assets/styles/jock-citypicker-2.0.css">
</head>

<body>
<header id="masthead" class="site-header site-header--layout-1 site-header--fluid site-header--absolute">
  <div class="d-lg-flex justify-content-lg-between align-items-lg-center site-header__container">
    <div class="d-lg-flex align-items-lg-center">
      <form class="d-none d-xl-block top-search-form" action="index.jsp">
        <input type="search" name="s" class="top-search-form__input" placeholder="Search places or anything...">
      </form>
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
<section class="page-banner page-banner--layout-1 parallax">
  <div class="container">
    <div class="page-banner__container animated fadeInUp">
      <div class="page-banner__textcontent t-center">
        <h2 class="page-banner__title c-white">Airline Reservation System</h2>
        <p class="page-banner__subtitle c-white">Find the best travel.</p>
      </div><!-- .page-banner__textcontent -->

      <div class="main-search-container">
        <form class="main-search main-search--layout-1 bg-mirage" action="/flight" method="get">
          <div class="main-search__group main-search__group--secondary">
            <label class="c-white">Departure</label>
            <input type="text" name="departure" id="city1" value="" readOnly="readOnly" class="form-input" placeholder="From">
          </div><!-- .main-search__group -->

          <div class="main-search__group main-search__group--secondary">
            <label class="c-white">Arrival</label>
            <input type="text" name="arrival" id="city2" value="" readOnly="readOnly" class="form-input" placeholder="To">
          </div><!-- .main-search__group -->

          <div class="main-search__group main-search__group--primary">
            <label class="c-white">Date</label>
            <input type="date" name="departure-time" id="time1" value="" class="form-input" placeholder="San Francisco">
          </div><!-- .main-search__group -->

          <div class="main-search__group main-search__group--tertiary">
            <button type="submit" class="button button--medium button--square button--primary">
              <i class="fa fa-search"></i> Search
            </button>
          </div>
        </form>
      </div><!-- .main-search-container -->
    </div><!-- .page-banner__container -->
  </div><!-- .container -->
</section><!-- .page-banner -->
<section class="category-container page-section bg-wild-sand">

    <h2 class="page-section__title t-center">Where do you need to go?</h2>
    <div class="listing-header-map-container js-map-container">
      <div id="listing-map" class="map"  style="margin-left: 10%; margin-right: 10%"></div>
      <ul class="min-list map-controls">
        <li class="map-control reset">
          <button class="button map-control-button">
            <i class="fa fa-undo"></i>
          </button>
        </li>
        <li class="map-control toggle-fullscreen">
          <button class="button map-control-button">
            <i class="fa fa-expand"></i>
          </button>
        </li>
      </ul><!-- map-control -->
</div><!-- listing-header-map-container -->
      

</section><!-- .category -->

<script type="text/javascript">
window.onload = function(){
  var a = document.getElementById("city1");
  var b = document.getElementById("city2");

  a.onclick = function(){
    citypicker.show({left: 620, top : 420}, function(data){
      a.value = data;
    });
  };

  var p = {left: 680, top : 420};
  var fn1 = function(city){
    b.value = city;
  };
  
  b.onclick = function(){
    citypicker.bind(fn1).fix(p).show();
  };
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmLG_UuFMteDLB4pVVO7yR7CCAb6pTGjc&language=en-US"></script>
<script src="https://cdn.rawgit.com/googlemaps/v3-utility-library/master/infobox/src/infobox.js"></script>
<script src="/assets/scripts/app.js"></script>
<script src="/assets/scripts/jock-citypicker-2.0.js"></script>
</body>
</html>
