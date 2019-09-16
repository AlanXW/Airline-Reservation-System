<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

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
<div class="listing-header-map-container js-map-container">
  <div id="listing-map" class="map"></div>
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
  </ul><!-- .map-control -->
</div><!-- .listing-header-map-container -->
<div class="page-content page-content--no-t-bottom">
  <div class="container">
  <div class="row">
    <div class="col-md-12 listing-search-container listing-search-container--on-map">
      <div class="listing-keyword listing-keyword--on-map">
        Suggestion from <span class="keyword">${param.departure}</span> to <span class="keyword">${param.arrival}</span>
      </div><!-- .listing-keyword -->

      <div class="listing-search bg-white">
        <div class="d-lg-flex justify-content-lg-between align-items-lg-center">
          <div class="listing-filter-container">
            <div class="d-lg-flex">
              <ul class="min-list d-flex listing-filter listing-filter--group">
                <li>
                  <a onclick="location.href='/flight?departure=${list[0].departureCity}&arrival=${list[0].arrivalCity}&departure-time=2019-10-20'">10-20</a>
                </li>

                <li>
                  <a onclick="location.href='/flight?departure=${list[0].departureCity}&arrival=${list[0].arrivalCity}&departure-time=2019-10-21'">10-21</a>
                </li>

                <li>
                  <a onclick="location.href='/flight?departure=${list[0].departureCity}&arrival=${list[0].arrivalCity}&departure-time=2019-10-22'">10-22</a>
                </li>
              </ul><!-- .listing-filter -->

              <ul class="min-list d-flex listing-filter listing-filter--group">
                <li>
                  <a onclick="location.href='/flight/clazz?clazz=economy'">Economy Class</a>
                </li>

                <li>
                  <a onclick="location.href='/flight/clazz?clazz=business'">Business Class</a>
                </li>

                <li>
                  <a onclick="location.href='/flight/clazz?clazz=first'">First Class</a>
                </li>
              </ul><!-- .listing-filter -->

              <ul class="min-list inline-list listing-filter listing-filter--list">
                <li>
                  <a onclick="location.href='/flight/time'">
                    <i class="fa fa-clock-o"></i>
                    Flight Time
                  </a>
                </li>
                <li>
                  <a onclick="location.href='/flight/price/low'">
                    &pound;
                    Low Price
                  </a>
                </li>
                <li>
                  <a onclick="location.href='/flight/price/high'">
                    &pound;
                    High Price
                  </a>
                </li>
              </ul><!-- .listing-filter -->

    </div><!-- .listing-search-container -->
  </div><!-- .row -->
</div><!-- .container -->

<section class="listing-list listing-list--layout-1">
  <div class="container">
    <div class="row">
      <c:choose>
          <c:when test="${clazz eq 'economy'}">
            <c:forEach items="${list}" var="flight">
              <c:if test="${flight.ticketClass eq 'Economy'}">
                <div class="col-md-4">
                  <div class="listing hover-effect">
                    <div class="listing__wrapper">
                      <div class="listing__detail" style="height: 95px">
                        <c:choose>
                          <c:when test="${flight.transitNumber == 0 }">
                            <span class="label label--primary" style="background-color: #2BC06A">Direct Flight</span>
                            <span class="label label--primary" style="right: 85px; background-color: darkturquoise">${flight.ticketClass}</span>
                            <img src="/assets/images/airline${flight.airlineId}.jpg"  style="position: absolute; top:30px; left:30px">
                            <h3 class="listing__title" style="position: absolute; top: 22px; left:80px">${flight.airline}</h3>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 30%">${flight.departureTime}</h3>
                            <p class="listing__location" style="position: absolute; top: 22px; left: 40%">== directly ==></p>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 50%">${flight.arrivalTime}</h3>
                            <c:if test="${flight.departureDate != flight.arrivalDate}"><p style="position: absolute; top: 22px; left: 60%">next day</p></c:if>
                            <p class="listing__location" style="position: absolute; top: 22px; left: 67%">${flight.duration}</p>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 76%; color: #f15636">&pound;${flight.price}</h3>
                            <p class="listing__location c-dusty-gray" style="position: absolute; top: 50px; left: 80px">Boeing 787</p>
                            <p class="listing__location" style="position: absolute; top: 50px; left: 30%">${flight.departureAirport}</p>
                            <p class="listing__location" style="position: absolute; top: 50px; left: 50%">${flight.arrivalAirport}</p>
                          </c:when>
                          <c:otherwise>
                            <span class="label label--primary">Need Transit</span>
                            <span class="label label--primary" style="right: 85px; background-color: darkturquoise">${flight.ticketClass}</span>
                            <img src="/assets/images/airline${flight.airlineId}.jpg"  style="position: absolute; top:30px; left:30px">
                            <h3 class="listing__title" style="position: absolute; top: 22px; left:80px">${flight.airline}</h3>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 30%">${flight.departureTime}</h3>
                            <p class="listing__location" style="position: absolute; top: 22px; left: 40%">== transit ${flight.transitNumber} ==></p>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 50%">${flight.arrivalTime}</h3>
                            <c:if test="${flight.departureDate != flight.arrivalDate}"><p style="position: absolute; top: 22px; left: 60%">next day</p></c:if>
                            <p class="listing__location" style="position: absolute; top: 22px; left: 67%">${flight.duration}</p>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 76%; color: #f15636">&pound;${flight.price}</h3>
                            <p class="listing__location c-dusty-gray" style="position: absolute; top: 50px; left: 80px">Boeing 787</p>
                            <p class="listing__location" style="position: absolute; top: 58px; left: 30%">${flight.departureAirport}</p>
                            <p class="listing__location c-dusty-gray" style="position: absolute; top: 45px; left: 40%"><i class="fa fa-map-marker"></i>${flight.transitAirport}</p>
                            <p class="listing__location" style="position: absolute; top: 58px; left: 50%">${flight.arrivalAirport}</p>
                          </c:otherwise>
                        </c:choose>
                        <p style="position: absolute; top: 55px; right: 175px">${flight.ticketNumber} tickets left</p>
                        <c:choose>
                          <c:when test="${flight.ticketNumber == 0}"><button class="button button--primary button--small button--pill" style="position: absolute; top: 45px; right: 45px;" onclick="location.href='/booking/queue?flightId=${flight.id}'">Queue up</button></c:when>
                          <c:otherwise><button class="button button--primary button--small button--pill" style="position: absolute; top: 45px; right: 45px;" onclick="location.href='/booking/add?flightId=${flight.id}'">Booking</button></c:otherwise>
                        </c:choose>
                      </div><!-- .listing__detail -->
                    </div><!-- .listing__wrapper -->
                  </div><!-- .listing -->
                </div><!-- .col -->
             </c:if>
            </c:forEach>
          </c:when>
          <c:when test="${clazz eq 'business'}">
            <c:forEach items="${list}" var="flight">
              <c:if test="${flight.ticketClass eq 'Business'}">
                <div class="col-md-4">
                  <div class="listing hover-effect">
                    <div class="listing__wrapper">
                      <div class="listing__detail" style="height: 95px">
                        <c:choose>
                          <c:when test="${flight.transitNumber == 0 }">
                            <span class="label label--primary" style="background-color: #2BC06A">Direct Flight</span>
                            <span class="label label--primary" style="right: 85px; background-color: darkturquoise">${flight.ticketClass}</span>
                            <img src="/assets/images/airline${flight.airlineId}.jpg"  style="position: absolute; top:30px; left:30px">
                            <h3 class="listing__title" style="position: absolute; top: 22px; left:80px">${flight.airline}</h3>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 30%">${flight.departureTime}</h3>
                            <p class="listing__location" style="position: absolute; top: 22px; left: 40%">== directly ==></p>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 50%">${flight.arrivalTime}</h3>
                            <c:if test="${flight.departureDate != flight.arrivalDate}"><p style="position: absolute; top: 22px; left: 60%">next day</p></c:if>
                            <p class="listing__location" style="position: absolute; top: 22px; left: 67%">${flight.duration}</p>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 76%; color: #f15636">&pound;${flight.price}</h3>
                            <p class="listing__location c-dusty-gray" style="position: absolute; top: 50px; left: 80px">Boeing 787</p>
                            <p class="listing__location" style="position: absolute; top: 50px; left: 30%">${flight.departureAirport}</p>
                            <p class="listing__location" style="position: absolute; top: 50px; left: 50%">${flight.arrivalAirport}</p>
                          </c:when>
                          <c:otherwise>
                            <span class="label label--primary">Need Transit</span>
                            <span class="label label--primary" style="right: 85px; background-color: darkturquoise">${flight.ticketClass}</span>
                            <img src="/assets/images/airline${flight.airlineId}.jpg"  style="position: absolute; top:30px; left:30px">
                            <h3 class="listing__title" style="position: absolute; top: 22px; left:80px">${flight.airline}</h3>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 30%">${flight.departureTime}</h3>
                            <p class="listing__location" style="position: absolute; top: 22px; left: 40%">== transit ${flight.transitNumber} ==></p>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 50%">${flight.arrivalTime}</h3>
                            <c:if test="${flight.departureDate != flight.arrivalDate}"><p style="position: absolute; top: 22px; left: 60%">next day</p></c:if>
                            <p class="listing__location" style="position: absolute; top: 22px; left: 67%">${flight.duration}</p>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 76%; color: #f15636">&pound;${flight.price}</h3>
                            <p class="listing__location c-dusty-gray" style="position: absolute; top: 50px; left: 80px">Boeing 787</p>
                            <p class="listing__location" style="position: absolute; top: 58px; left: 30%">${flight.departureAirport}</p>
                            <p class="listing__location c-dusty-gray" style="position: absolute; top: 45px; left: 40%"><i class="fa fa-map-marker"></i>${flight.transitAirport}</p>
                            <p class="listing__location" style="position: absolute; top: 58px; left: 50%">${flight.arrivalAirport}</p>
                          </c:otherwise>
                        </c:choose>
                        <p style="position: absolute; top: 55px; right: 175px">${flight.ticketNumber} tickets left</p>
                        <c:choose>
                          <c:when test="${flight.ticketNumber == 0}"><button class="button button--primary button--small button--pill" style="position: absolute; top: 45px; right: 45px;" onclick="location.href='/booking/queue?flightId=${flight.id}'">Queue up</button></c:when>
                          <c:otherwise><button class="button button--primary button--small button--pill" style="position: absolute; top: 45px; right: 45px;" onclick="location.href='/booking/add?flightId=${flight.id}'">Booking</button></c:otherwise>
                        </c:choose>
                      </div><!-- .listing__detail -->
                    </div><!-- .listing__wrapper -->
                  </div><!-- .listing -->
                </div><!-- .col -->
              </c:if>
            </c:forEach>
          </c:when>
          <c:when test="${clazz eq 'first'}">
            <c:forEach items="${list}" var="flight">
              <c:if test="${flight.ticketClass eq 'First'}">
                <div class="col-md-4">
                  <div class="listing hover-effect">
                    <div class="listing__wrapper">
                      <div class="listing__detail" style="height: 95px">
                        <c:choose>
                          <c:when test="${flight.transitNumber == 0 }">
                            <span class="label label--primary" style="background-color: #2BC06A">Direct Flight</span>
                            <span class="label label--primary" style="right: 85px; background-color: darkturquoise">${flight.ticketClass}</span>
                            <img src="/assets/images/airline${flight.airlineId}.jpg"  style="position: absolute; top:30px; left:30px">
                            <h3 class="listing__title" style="position: absolute; top: 22px; left:80px">${flight.airline}</h3>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 30%">${flight.departureTime}</h3>
                            <p class="listing__location" style="position: absolute; top: 22px; left: 40%">== directly ==></p>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 50%">${flight.arrivalTime}</h3>
                            <c:if test="${flight.departureDate != flight.arrivalDate}"><p style="position: absolute; top: 22px; left: 60%">next day</p></c:if>
                            <p class="listing__location" style="position: absolute; top: 22px; left: 67%">${flight.duration}</p>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 76%; color: #f15636">&pound;${flight.price}</h3>
                            <p class="listing__location c-dusty-gray" style="position: absolute; top: 50px; left: 80px">Boeing 787</p>
                            <p class="listing__location" style="position: absolute; top: 50px; left: 30%">${flight.departureAirport}</p>
                            <p class="listing__location" style="position: absolute; top: 50px; left: 50%">${flight.arrivalAirport}</p>
                          </c:when>
                          <c:otherwise>
                            <span class="label label--primary">Need Transit</span>
                            <span class="label label--primary" style="right: 85px; background-color: darkturquoise">${flight.ticketClass}</span>
                            <img src="/assets/images/airline${flight.airlineId}.jpg"  style="position: absolute; top:30px; left:30px">
                            <h3 class="listing__title" style="position: absolute; top: 22px; left:80px">${flight.airline}</h3>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 30%">${flight.departureTime}</h3>
                            <p class="listing__location" style="position: absolute; top: 22px; left: 40%">== transit ${flight.transitNumber} ==></p>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 50%">${flight.arrivalTime}</h3>
                            <c:if test="${flight.departureDate != flight.arrivalDate}"><p style="position: absolute; top: 22px; left: 60%">next day</p></c:if>
                            <p class="listing__location" style="position: absolute; top: 22px; left: 67%">${flight.duration}</p>
                            <h3 class="listing__title" style="position: absolute; top: 22px; left: 76%; color: #f15636">&pound;${flight.price}</h3>
                            <p class="listing__location c-dusty-gray" style="position: absolute; top: 50px; left: 80px">Boeing 787</p>
                            <p class="listing__location" style="position: absolute; top: 58px; left: 30%">${flight.departureAirport}</p>
                            <p class="listing__location c-dusty-gray" style="position: absolute; top: 45px; left: 40%"><i class="fa fa-map-marker"></i>${flight.transitAirport}</p>
                            <p class="listing__location" style="position: absolute; top: 58px; left: 50%">${flight.arrivalAirport}</p>
                          </c:otherwise>
                        </c:choose>
                        <p style="position: absolute; top: 55px; right: 175px">${flight.ticketNumber} tickets left</p>
                        <c:choose>
                          <c:when test="${flight.ticketNumber == 0}"><button class="button button--primary button--small button--pill" style="position: absolute; top: 45px; right: 45px;" onclick="location.href='/booking/queue?flightId=${flight.id}'">Queue up</button></c:when>
                          <c:otherwise><button class="button button--primary button--small button--pill" style="position: absolute; top: 45px; right: 45px;" onclick="location.href='/booking/add?flightId=${flight.id}'">Booking</button></c:otherwise>
                        </c:choose>
                      </div><!-- .listing__detail -->
                    </div><!-- .listing__wrapper -->
                  </div><!-- .listing -->
                </div><!-- .col -->
              </c:if>
            </c:forEach>
          </c:when>
      <c:otherwise>
        <c:forEach items="${list}" var="flight">
          <div class="col-md-4">
            <div class="listing hover-effect">
              <div class="listing__wrapper">
                <div class="listing__detail" style="height: 95px">
                  <c:choose>
                    <c:when test="${flight.transitNumber == 0 }">
                      <span class="label label--primary" style="background-color: #2BC06A">Direct Flight</span>
                      <span class="label label--primary" style="right: 85px; background-color: darkturquoise">${flight.ticketClass}</span>
                      <img src="/assets/images/airline${flight.airlineId}.jpg"  style="position: absolute; top:30px; left:30px">
                      <h3 class="listing__title" style="position: absolute; top: 22px; left:80px">${flight.airline}</h3>
                      <h3 class="listing__title" style="position: absolute; top: 22px; left: 30%">${flight.departureTime}</h3>
                      <p class="listing__location" style="position: absolute; top: 22px; left: 40%">== directly ==></p>
                      <h3 class="listing__title" style="position: absolute; top: 22px; left: 50%">${flight.arrivalTime}</h3>
                      <c:if test="${flight.departureDate != flight.arrivalDate}"><p style="position: absolute; top: 22px; left: 60%">next day</p></c:if>
                      <p class="listing__location" style="position: absolute; top: 22px; left: 67%">${flight.duration}</p>
                      <h3 class="listing__title" style="position: absolute; top: 22px; left: 76%; color: #f15636">&pound;${flight.price}</h3>
                      <p class="listing__location c-dusty-gray" style="position: absolute; top: 50px; left: 80px">Boeing 787</p>
                      <p class="listing__location" style="position: absolute; top: 50px; left: 30%">${flight.departureAirport}</p>
                      <p class="listing__location" style="position: absolute; top: 50px; left: 50%">${flight.arrivalAirport}</p>
                    </c:when>
                    <c:otherwise>
                      <span class="label label--primary">Need Transit</span>
                      <span class="label label--primary" style="right: 85px; background-color: darkturquoise">${flight.ticketClass}</span>
                      <img src="/assets/images/airline${flight.airlineId}.jpg"  style="position: absolute; top:30px; left:30px">
                      <h3 class="listing__title" style="position: absolute; top: 22px; left:80px">${flight.airline}</h3>
                      <h3 class="listing__title" style="position: absolute; top: 22px; left: 30%">${flight.departureTime}</h3>
                      <p class="listing__location" style="position: absolute; top: 22px; left: 40%">== transit ${flight.transitNumber} ==></p>
                      <h3 class="listing__title" style="position: absolute; top: 22px; left: 50%">${flight.arrivalTime}</h3>
                      <c:if test="${flight.departureDate != flight.arrivalDate}"><p style="position: absolute; top: 22px; left: 60%">next day</p></c:if>
                      <p class="listing__location" style="position: absolute; top: 22px; left: 67%">${flight.duration}</p>
                      <h3 class="listing__title" style="position: absolute; top: 22px; left: 76%; color: #f15636">&pound;${flight.price}</h3>
                      <p class="listing__location c-dusty-gray" style="position: absolute; top: 50px; left: 80px">Boeing 787</p>
                      <p class="listing__location" style="position: absolute; top: 58px; left: 30%">${flight.departureAirport}</p>
                      <p class="listing__location c-dusty-gray" style="position: absolute; top: 45px; left: 40%"><i class="fa fa-map-marker"></i>${flight.transitAirport}</p>
                      <p class="listing__location" style="position: absolute; top: 58px; left: 50%">${flight.arrivalAirport}</p>
                    </c:otherwise>
                  </c:choose>
                  <p style="position: absolute; top: 55px; right: 175px">${flight.ticketNumber} tickets left</p>
                  <c:choose>
                    <c:when test="${flight.ticketNumber == 0}"><button class="button button--primary button--small button--pill" style="position: absolute; top: 45px; right: 45px;" onclick="location.href='/booking/queue?flightId=${flight.id}'">Queue up</button></c:when>
                    <c:otherwise><button class="button button--primary button--small button--pill" style="position: absolute; top: 45px; right: 45px;" onclick="location.href='/booking/add?flightId=${flight.id}'">Booking</button></c:otherwise>
                  </c:choose>
                </div><!-- .listing__detail -->
              </div><!-- .listing__wrapper -->
            </div><!-- .listing -->
          </div><!-- .col -->
        </c:forEach>
       </c:otherwise>
      </c:choose>
        <c:forEach items="${list_connect}" var="f" step="2" varStatus="loop">
          <div class="col-md-4">
            <div class="listing hover-effect">
              <div class="listing__wrapper">
                <div class="listing__detail" style="height: 190px">
                  <c:choose>
                    <c:when test="${f.transitNumber == 0 }">
                      <span class="label label--primary" style="background-color: #2BC06A">Flex Combo</span>
                      <span class="label label--primary" style="right: 85px; background-color: darkturquoise">Economy</span>
                      <img src="/assets/images/airline${f.airlineId}.jpg"  style="position: absolute; top:30px; left:30px">
                      <h3 class="listing__title" style="position: absolute; top: 22px; left:80px">${f.airline}</h3>
                      <h3 class="listing__title" style="position: absolute; top: 22px; left: 30%">${f.departureTime}</h3>
                      <p class="listing__location" style="position: absolute; top: 22px; left: 40%">== directly ==></p>
                      <h3 class="listing__title" style="position: absolute; top: 22px; left: 50%">${f.arrivalTime}</h3>
                      <c:if test="${f.departureDate != f.arrivalDate}"><p style="position: absolute; top: 22px; left: 60%">next day</p></c:if>
                      <p class="listing__location" style="position: absolute; top: 22px; left: 67%">${f.duration}</p>
                      <h3 class="listing__title" style="position: absolute; top: 22px; left: 76%; color: #f15636">&pound;${f.price}</h3>
                      <p class="listing__location c-dusty-gray" style="position: absolute; top: 50px; left: 80px">Boeing 787</p>
                      <p class="listing__location" style="position: absolute; top: 50px; left: 30%">${f.departureAirport}</p>
                      <p class="listing__location" style="position: absolute; top: 50px; left: 50%">${f.arrivalAirport}</p>

                      <img src="/assets/images/airline${list_connect[loop.count].airlineId}.jpg"  style="position: absolute; top:125px; left:30px">
                      <h3 class="listing__title" style="position: absolute; top: 117px; left:80px">${list_connect[loop.count].airline}</h3>
                      <h3 class="listing__title" style="position: absolute; top: 117px; left: 30%">${list_connect[loop.count].departureTime}</h3>
                      <p class="listing__location" style="position: absolute; top: 117px; left: 40%">== directly ==></p>
                      <h3 class="listing__title" style="position: absolute; top: 117px; left: 50%">${list_connect[loop.count].arrivalTime}</h3>
                      <c:if test="${list_connect[loop.count].departureDate != list_connect[loop.count].arrivalDate}"><p style="position: absolute; top: 117px; left: 60%">next day</p></c:if>
                      <p class="listing__location" style="position: absolute; top: 117px; left: 67%">${list_connect[loop.count].duration}</p>
                      <h3 class="listing__title" style="position: absolute; top: 117px; left: 76%; color: #f15636">&pound;${list_connect[loop.count].price}</h3>
                      <p class="listing__location c-dusty-gray" style="position: absolute; top: 145px; left: 80px">Boeing 787</p>
                      <p class="listing__location" style="position: absolute; top: 145px; left: 30%">${list_connect[loop.count].departureAirport}</p>
                      <p class="listing__location" style="position: absolute; top: 145px; left: 50%">${list_connect[loop.count].arrivalAirport}</p>
                    </c:when>
                    <c:otherwise>
                      <span class="label label--primary" style="background-color: #2BC06A">Flex Combo</span>
                      <span class="label label--primary" style="right: 85px; background-color: darkturquoise">Economy</span>
                      <img src="/assets/images/airline${f.airlineId}.jpg"  style="position: absolute; top:30px; left:30px">
                      <h3 class="listing__title" style="position: absolute; top: 22px; left:80px">${f.airline}</h3>
                      <h3 class="listing__title" style="position: absolute; top: 22px; left: 30%">${f.departureTime}</h3>
                      <p class="listing__location" style="position: absolute; top: 22px; left: 40%">== transit ${f.transitNumber} ==></p>
                      <h3 class="listing__title" style="position: absolute; top: 22px; left: 50%">${f.arrivalTime}</h3>
                      <c:if test="${f.departureDate != f.arrivalDate}"><p style="position: absolute; top: 22px; left: 60%">next day</p></c:if>
                      <p class="listing__location" style="position: absolute; top: 22px; left: 67%">${f.duration}</p>
                      <h3 class="listing__title" style="position: absolute; top: 22px; left: 76%; color: #f15636">&pound;${f.price}</h3>
                      <p class="listing__location c-dusty-gray" style="position: absolute; top: 50px; left: 80px">Boeing 787</p>
                      <p class="listing__location" style="position: absolute; top: 58px; left: 30%">${f.departureAirport}</p>
                      <p class="listing__location c-dusty-gray" style="position: absolute; top: 45px; left: 40%"><i class="fa fa-map-marker"></i>${f.transitAirport}</p>
                      <p class="listing__location" style="position: absolute; top: 58px; left: 50%">${f.arrivalAirport}</p>

                      <img src="/assets/images/airline${list_connect[loop.count].airlineId}.jpg"  style="position: absolute; top:125px; left:30px">
                      <h3 class="listing__title" style="position: absolute; top: 117px; left:80px">${list_connect[loop.count].airline}</h3>
                      <h3 class="listing__title" style="position: absolute; top: 117px; left: 30%">${list_connect[loop.count].departureTime}</h3>
                      <p class="listing__location" style="position: absolute; top: 117px; left: 40%">== directly ==></p>
                      <h3 class="listing__title" style="position: absolute; top: 117px; left: 50%">${list_connect[loop.count].arrivalTime}</h3>
                      <c:if test="${list_connect[loop.count].departureDate != list_connect[loop.count].arrivalDate}"><p style="position: absolute; top: 117px; left: 60%">next day</p></c:if>
                      <p class="listing__location" style="position: absolute; top: 117px; left: 67%">${list_connect[loop.count].duration}</p>
                      <h3 class="listing__title" style="position: absolute; top: 117px; left: 76%; color: #f15636">&pound;${list_connect[loop.count].price}</h3>
                      <p class="listing__location c-dusty-gray" style="position: absolute; top: 145px; left: 80px">Boeing 787</p>
                      <p class="listing__location" style="position: absolute; top: 145px; left: 30%">${list_connect[loop.count].departureAirport}</p>
                      <p class="listing__location" style="position: absolute; top: 145px; left: 50%">${list_connect[loop.count].arrivalAirport}</p>
                    </c:otherwise>
                  </c:choose>
                  <button class="button button--primary button--small button--pill" style="position: absolute; top: 45px; right: 45px;" onclick="location.href='/booking/add?flightId=${f.id}'">Booking</button>
                  <button class="button button--primary button--small button--pill" style="position: absolute; top: 90px; right: 45px;" onclick="location.href='/booking/add?flightId=${list_connect[loop.count].id}'">Booking</button>
                </div><!-- .listing__detail -->
              </div><!-- .listing__wrapper -->
            </div><!-- .listing -->
          </div><!-- .col -->
        </c:forEach>
    </div><!-- .row -->
    <div class="t-center load-more">
      <button class="button button--primary button--medium button--pill" onclick="location.href='/flight/connect'">View Flex Combo</button>
    </div>
  </div><!-- .container -->
</section><!-- .listing-list -->
</div>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAmLG_UuFMteDLB4pVVO7yR7CCAb6pTGjc&language=en-US"></script>
<script src="https://cdn.rawgit.com/googlemaps/v3-utility-library/master/infobox/src/infobox.js"></script>
<script src="/assets/scripts/app.js"></script>
</body>
</html>
