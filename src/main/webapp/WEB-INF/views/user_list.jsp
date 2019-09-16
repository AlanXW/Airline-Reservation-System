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
        <a href="index.html">
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
        <a href="index.html" class="breadcrumbs__link">
          <span class="breadcrumbs__title">Home</span>
        </a>
      </li>

      <li class="breadcrumbs__item">
        <a href="#" class="breadcrumbs__link">
          <span class="breadcrumbs__title">Pages</span>
        </a>
      </li>

      <li class="breadcrumbs__item">
        <span class="breadcrumbs__page c-gray">My Tickets</span>
      </li>
    </ul><!-- .breadcrumbs -->
  </div><!-- .container -->
</div>
  <div class="container">
    <div class="row">
    

<div class="col-lg-9">
<table class="listing-table">
  <tr class="listing-row c-white bg-primary">
    <th>
      <i class="fa fa-clipboard"></i>
      Tickets
    </th>
    <th></th>
  </tr><!-- .listing-row -->
<c:forEach items="${flightList}" var="flight" varStatus="loop">
  <tr class="listing-row">
    <td class="listing listing-cell">
      <div class="listing__wrapper">
        <div class="listing__thumbnail">
            <div class="listing__detail" style="height: 115px">
              <c:choose>
              <c:when test="${flight.transitNumber == 0 }">
                <img src="/assets/images/airline${flight.airlineId}.jpg"  style="position: absolute; top: 10px; left: 10px">
                <h3 class="listing__title" style="position: absolute; top: 10px; left: 50px">${flight.airline}</h3>
                <h3 class="listing__title" style="position: absolute; top: 10px; left: 300px">${flight.departureTime}</h3>
                <h3 class="listing__title" style="position: absolute; top: 10px; left: 520px">${flight.arrivalTime}</h3>
                <c:if test="${flight.departureDate != flight.arrivalDate}"><p style="position: absolute; top: 10px; left: 610px">next day</p></c:if>
                <p class="listing__location" style="position: absolute; top: 80px; left: 300px">${flight.duration}</p>
                <h3 class="listing__title" style="position: absolute; top: 10px; left: 750px; color: #f15636">&pound;${flight.price}</h3>
                  <p class="listing__location c-dusty-gray" style="position: absolute; top: 45px; left: 50px">${flight.departureDate}</p>
                  <p class="listing__location" style="position: absolute; top: 45px; left: 270px">${flight.departureAirport}</p>
                  <p class="listing__location" style="position: absolute; top: 45px; left: 530px">${flight.arrivalAirport}</p>
                <p class="listing__location" style="position: absolute; top: 80px; left: 500px">Booked at  ${bookingList[loop.count-1].datetime}</p>
                  <p class="listing__location" style="position: absolute; top: 45px; left: 750px">${flight.ticketClass}</p>
              </c:when>
              <c:otherwise>
                <img src="/assets/images/airline${flight.airlineId}.jpg"  style="position: absolute; top: 10px; left: 10px">
                <h3 class="listing__title" style="position: absolute; top: 10px; left: 50px">${flight.airline}</h3>
                <h3 class="listing__title" style="position: absolute; top: 10px; left: 300px">${flight.departureTime}</h3>
                <p class="listing__location" style="position: absolute; top: 10px; left: 400px">== transit ${flight.transitNumber} ==></p>
                <h3 class="listing__title" style="position: absolute; top: 10px; left: 520px">${flight.arrivalTime}</h3>
                <c:if test="${flight.departureDate != flight.arrivalDate}"><p style="position: absolute; top: 10px; left: 610px">next day</p></c:if>
                <p class="listing__location" style="position: absolute; top: 80px; left: 300px">${flight.duration}</p>
                <h3 class="listing__title" style="position: absolute; top: 10px; left: 750px; color: #f15636">&pound;${flight.price}</h3>
                <p class="listing__location c-dusty-gray" style="position: absolute; top: 45px; left: 50px">${flight.departureDate}</p>
                <p class="listing__location" style="position: absolute; top: 45px; left: 270px">${flight.departureAirport}</p>
                <p class="listing__location c-dusty-gray" style="position: absolute; top: 45px; left: 400px"><i class="fa fa-map-marker"></i>${flight.transitAirport}</p>
                <p class="listing__location" style="position: absolute; top: 45px; left: 530px">${flight.arrivalAirport}</p>
                <p class="listing__location" style="position: absolute; top: 80px; left: 500px">Booked at  ${bookingList[loop.count-1].datetime}</p>
                <p class="listing__location" style="position: absolute; top: 45px; left: 750px">${flight.ticketClass}</p>
              </c:otherwise>
              </c:choose>
                <ul class="min-list">
                  <li style="position: absolute; top: 45px; right: 10px">
                    <button class="action remove" type="button" onclick="location.href='/booking/delete?bookingId=${bookingList[loop.count-1].id}'">
                      <i class="fa fa-trash"></i>
                        Refund
                    </button>
                  </li>
	             </ul>
            </div><!-- .listing__detail -->
      </div>
      </div>
	    </td>
  </tr><!-- .listing-row -->
</c:forEach>
  <c:forEach items="${flightListQueue}" var="flightQueue" varStatus="loop">
    <tr class="listing-row">
      <td class="listing listing-cell">
        <div class="listing__wrapper">
          <div class="listing__thumbnail">
            <div class="listing__detail" style="height: 115px">
              <c:choose>
                <c:when test="${flightQueue.transitNumber == 0 }">
                  <img src="/assets/images/airline${flightQueue.airlineId}.jpg"  style="position: absolute; top: 10px; left: 10px">
                  <h3 class="listing__title" style="position: absolute; top: 10px; left: 50px">${flightQueue.airline}</h3>
                  <h3 class="listing__title" style="position: absolute; top: 10px; left: 300px">${flightQueue.departureTime}</h3>
                  <h3 class="listing__title" style="position: absolute; top: 10px; left: 520px">${flightQueue.arrivalTime}</h3>
                  <c:if test="${flightQueue.departureDate != flightQueue.arrivalDate}"><p style="position: absolute; top: 10px; left: 610px">next day</p></c:if>
                  <p class="listing__location" style="position: absolute; top: 80px; left: 300px">${flightQueue.duration}</p>
                  <h3 class="listing__title" style="position: absolute; top: 10px; left: 750px; color: #f15636">&pound;${flightQueue.price}</h3>
                  <p class="listing__location c-dusty-gray" style="position: absolute; top: 45px; left: 50px">${flightQueue.departureDate}</p>
                  <p class="listing__location" style="position: absolute; top: 45px; left: 270px">${flightQueue.departureAirport}</p>
                  <p class="listing__location" style="position: absolute; top: 45px; left: 530px">${flightQueue.arrivalAirport}</p>
                  <p class="listing__location" style="position: absolute; top: 80px; left: 500px">Queuing...</p>
                  <p class="listing__location" style="position: absolute; top: 45px; left: 750px">${flightQueue.ticketClass}</p>
                </c:when>
                <c:otherwise>
                  <img src="/assets/images/airline${flightQueue.airlineId}.jpg"  style="position: absolute; top: 10px; left: 10px">
                  <h3 class="listing__title" style="position: absolute; top: 10px; left: 50px">${flightQueue.airline}</h3>
                  <h3 class="listing__title" style="position: absolute; top: 10px; left: 300px">${flightQueue.departureTime}</h3>
                  <p class="listing__location" style="position: absolute; top: 10px; left: 400px">== transit ${flightQueue.transitNumber} ==></p>
                  <h3 class="listing__title" style="position: absolute; top: 10px; left: 520px">${flightQueue.arrivalTime}</h3>
                  <c:if test="${flightQueue.departureDate != flightQueue.arrivalDate}"><p style="position: absolute; top: 10px; left: 610px">next day</p></c:if>
                  <p class="listing__location" style="position: absolute; top: 80px; left: 300px">${flightQueue.duration}</p>
                  <h3 class="listing__title" style="position: absolute; top: 10px; left: 750px; color: #f15636">&pound;${flightQueue.price}</h3>
                  <p class="listing__location c-dusty-gray" style="position: absolute; top: 45px; left: 50px">${flightQueue.departureDate}</p>
                  <p class="listing__location" style="position: absolute; top: 45px; left: 270px">${flightQueue.departureAirport}</p>
                  <p class="listing__location c-dusty-gray" style="position: absolute; top: 45px; left: 400px"><i class="fa fa-map-marker"></i>${flightQueue.transitAirport}</p>
                  <p class="listing__location" style="position: absolute; top: 45px; left: 530px">${flightQueue.arrivalAirport}</p>
                  <p class="listing__location" style="position: absolute; top: 80px; left: 500px">Queuing...</p>
                  <p class="listing__location" style="position: absolute; top: 45px; left: 750px">${flightQueue.ticketClass}</p>
                </c:otherwise>
              </c:choose>
              <ul class="min-list">
                <li style="position: absolute; top: 45px; right: 10px">
                  <button class="action remove" type="button" onclick="location.href='/booking/cancel?transactionId=${transactionList[loop.count-1].id}'">
                    <i class="fa fa-trash"></i>
                    Cancel
                  </button>
                </li>
              </ul>
            </div><!-- .listing__detail -->
          </div>
        </div>
      </td>
    </tr><!-- .listing-row -->
  </c:forEach>
 </table><!-- .listing-table -->
      </div><!-- .col -->
    </div><!-- .row -->
  </div><!-- .container -->
</div><!-- .page-content -->
</footer><!-- #colophone -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDyCxHyc8z9gMA5IlipXpt0c33Ajzqix4"></script>
<script src="https://cdn.rawgit.com/googlemaps/v3-utility-library/master/infobox/src/infobox.js"></script>
<script src="/assets/scripts/app.js"></script>
</body>
</html>
