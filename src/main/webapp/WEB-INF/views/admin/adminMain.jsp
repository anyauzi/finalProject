<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

.b-meta {
	height: 150px;
}
.degree{
	margin-top: 10px;
}
.yesterday{
	width: 100px;
    left: 288px;
    bottom: 50px;
    display: flex;
    position: relative;
    flex-direction: column;
}
.upDownRate {
	right: 10px;
    position: relative;
}
.updownMark {
	width: 20px;
}
.info-meta {
    width: 385px;
    height: 100px;
    border-bottom: 3px solid #a389d4;
    padding-bottom: 20px;
}

/* 스와이퍼 */
.swiper-box-1 {
	border: 1px solid red;
}
.swiper-box-1 > .container {
	max-width: 1174px;
	border: 1px solid orange;
	margin-left: auto; margin-right: auto;
	position: relative;
}
.swiper {
    max-width: 1300px;
	height: 260px;
}

.swiper-slide {
	background-color: white;
}

.swiper-box-1 .swiper-button-prev {
	border: 1px solid red;
	left: 1%; top: 50%;
	transform: translateY(-50%);
	width: 50px; height: 50px;
	font-size: 40px;
	color:rgba(0,0,0,0.8);
}

.swiper-box-1 .swiper-button-next::after {
	display: none;
}

.swiper-box-1 .swiper-button-next {
	border: 1px solid red;
	right: 1%; top: 50%;
	transform: translateY(-50%);
	width: 50px; height: 50px;
	font-size: 40px;
	color:rgba(0,0,0,0.8);
}
.swiper-box-1 .swiper-button-prev:after {
	display: none;
}

.swiper-button-prev{
    top: 111px;
    left: -25px;
}

.swiper-button-next{
	top: 111px;
    right: -25px;
}

.central-meta {
	margin-top:30px;
	height: 200px;
}

.swiper-slide {
	height: 170px;
	border-radius: 8px;
	width: 509.73px !important;
}

.admin-swiper, .admin-mySwiper {
	min-width: 1588px;
}

.swiper-area {
	padding: 2px;
}

/* 스와이퍼 끝 */

/* 통계시작 */
#statistic-area{
	border-radius: 5px;
    position: relative;
    left: -13px;
    height: 500px;
    background-color: white;
    min-width: 1582px;
    margin-bottom: 30px;
}
/* 통계 끝 */
.db-col {
	margin-top: 30px;
    display: flex;
    flex-direction: row;
    background-color: white;
    height: 400px;
    align-items: center;
    justify-content: space-evenly;
    border-radius: 15px;
}

#order-area {
	height: 300px;
    background-color: white;
    display: flex;
    flex-direction: row;
    align-items: center;
}

#delivery-area {
	height: 200px;
/* 	background-color: blue; */
}

#change-area {
	height: 200px;
/* 	background-color: blue; */
}

#inquiry-area {
	height: 300px;
	background-color: white;
}

.admin-card{
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-evenly;
    padding-right: 75px;
}

.adminProfile {
	height: 100px;
}

.admin-info {
	display: flex;
    flex-direction: column;
    align-items: flex-start;
}

.admin-role {
    color: black;
	display: inline-block;
	margin-top: 10px;
	margin-bottom: 10px;
}

.admin-name {
	color: black;
	font-size: larger;
	font-weight: bolder;
}

.admin-telno {
	color: black;
}

.mega-post-info{
	display: flex;
	flex-direction: column;
	justify-content: center;
	text-align: center;
}

.col-lg-5{
	border-radius: 20px;
	border: 1px solid gray;
}

.mega-style1 > div {
    border-right: 2px solid darkgray;
}

.counts {
	text-decoration: underline;
	transition: color 0.5s ease;
}

.counts:hover {
	color: rgb(112, 16, 249);
}

#inquiryCount {
    position: relative;
    color: black;
    left: 520px;
    top: -5px;
    font-size: 15px;
}

.widget {
	margin-top: 10px;
	min-height: 405px;
}

.col-6-padding:first-child{
	padding-left: 0px;
	padding-right: 10px;
} 

.col-6-padding:last-child{
	padding-left: 10px;
	padding-right: 0px;
} 

.cart-table {
	position: relative;
	top: -30px;
}

.sales-chart {
	margin-top: 35px;
}

#container_salesChart {
    width: 1525px;
    height: 600px;
    overflow: hidden;
}


</style>

<div class="info-section">
	<div class="panel-widget">
		<div class="b-meta">
			<i class="icon-people"></i>
			<div class="info-meta">
				<div>금일 접속자 수</div>
				<h4 class="degree">
					<fmt:formatNumber value="72" pattern="#,###" />
				</h4>
				<div class="yesterday">
					<span>전일대비</span> 
					<span class="upDownRate"> 
						<img class="updownMark" src="${pageContext.request.contextPath }/resources/stock/up.png">
						17.28%
					</span>
				</div>
			</div>
		</div>
	</div>

	<div class="panel-widget">
		<c:choose>
			<c:when test="${statMap.increaseRate lt 0}">
				<c:set var="absoluteValue" value="${-1 * statMap.increaseRate}" />
				<c:set var="increaseColor" value="blue" />
				<c:set var="upDown" value="down" />
			</c:when>
			<c:otherwise>
				<c:set var="absoluteValue" value="${statMap.increaseRate}" />
				<c:set var="increaseColor" value="red" />
				<c:set var="upDown" value="up" />
			</c:otherwise>
		</c:choose>
		<div class="b-meta">
			<i class="icon-login"></i>
			<div class="info-meta">
				<div>금일 가입자 수</div>
				<h4 class="degree">
					<fmt:formatNumber value="${statMap.todayRegister }" pattern="#,###" />
				</h4>
				<div class="yesterday">
					<span>전일대비</span> <span class="upDownRate"> 
						<img class="updownMark" src="${pageContext.request.contextPath }/resources/stock/${upDown }.png">
						<c:set var="number" value="${statMap.increaseRate }" /> 
						<span style='color:"${increaseColor}"'>
							<c:choose>
								<c:when test="${statMap.todayRegister == 0 }">
									<c:out value="0" />%
								</c:when>
								<c:otherwise>
									<c:out value="${absoluteValue}" />%
								</c:otherwise>
							</c:choose>
							
						</span>
					</span>
				</div>
			</div>
		</div>
	</div>

	<div class="panel-widget">
		<c:choose>
			<c:when test="${statMap.increaseRate_sales lt 0}">
				<c:set var="absoluteValue_sales"
					value="${-1 * statMap.increaseRate_sales}" />
				<c:set var="increaseColor" value="blue" />
				<c:set var="upDown" value="down" />
			</c:when>
			<c:otherwise>
				<c:set var="absoluteValue_sales"
					value="${statMap.increaseRate_sales}" />
				<c:set var="increaseColor" value="red" />
				<c:set var="upDown" value="up" />
			</c:otherwise>
		</c:choose>
		<div class="b-meta">
			<i class="fa fa-won"></i>
			<div class="info-meta">
				<div>금일 판매금액</div>
				<h4 class="degree">
					<fmt:formatNumber value="${statMap.todaySales}" pattern="#,###" />
				</h4>
				<div class="yesterday">
					<span>전일대비</span> <span class="upDownRate"> <img
						class="updownMark" alt=""
						src="${pageContext.request.contextPath}/resources/stock/${upDown}.png">
						<c:set var="number" value="${statMap.increaseRate_sales}" /> 
						<span style='color: ${increaseColor}'> 
						<fmt:formatNumber value="${absoluteValue_sales}" pattern="#,##0.00" maxFractionDigits="2"/>%
						</span>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>

<!--관리자 명단 스와이퍼 시작  -->
<div class="col-lg-12 swiper-area">
	<div class="central-meta postbox">
		<!-- Slider main container -->
		<div class="container admin-swiper">
			<!-- Swiper -->
			<div class="swiper mySwiper admin-mySwiper">
				<div class="swiper-wrapper" pagination="true"
					pagination-clickable="true" navigation="true" space-between="30"
					centered-slides="true">
					
					<div class="swiper-slide swiper-slide-1 admin-card" >
						<div class="">
							<img class="adminProfile" src="${pageContext.request.contextPath }/resources/wellSeeProfile/jinYoung.jpg">
						</div> 
						<div class="admin-info">
							<span class="admin-name">홍진영</span>
							<span class="admin-role">통합 관리자</span>
							<span class="admin-telno">042-625-2862</span>
						</div>
					</div>
					
					<div class="swiper-slide swiper-slide-2 admin-card" >
						<div class="">
							<img class="adminProfile" src="${pageContext.request.contextPath }/resources/wellSeeProfile/auJin.jpg">
						</div> 
						<div class="admin-info">
							<span class="admin-name">서어진</span>
							<span class="admin-role">엔터테인 관리자</span>
							<span class="admin-telno">042-625-2812</span>
						</div>
					</div>
					
					<div class="swiper-slide swiper-slide-3 admin-card" >
						<div class="">
							<img class="adminProfile" src="${pageContext.request.contextPath }/resources/wellSeeProfile/eSu.png">
						</div> 
						<div class="admin-info">
							<span class="admin-name">성이수</span>
							<span class="admin-role">굿즈샵 관리자</span>
							<span class="admin-telno">042-125-2362</span>
						</div>
					</div>
					
					<div class="swiper-slide swiper-slide-4 admin-card" >
						<div class="">
							<img class="adminProfile" src="${pageContext.request.contextPath }/resources/wellSeeProfile/suJin.JPG">
						</div> 
						<div class="admin-info">
							<span class="admin-name">이수진</span>
							<span class="admin-role">엔터테인 관리자</span>
							<span class="admin-telno">042-621-1864</span>
						</div>
					</div>
					
					<div class="swiper-slide swiper-slide-5 admin-card" >
						<div class="">
							<img class="adminProfile" src="${pageContext.request.contextPath }/resources/wellSeeProfile/minHyeok.jpg">
						</div> 
						<div class="admin-info">
							<span class="admin-name">임민혁</span>
							<span class="admin-role">커뮤니티 관리자</span>
							<span class="admin-telno">042-623-4167</span>
						</div>
					</div>
					
					<div class="swiper-slide swiper-slide-6 admin-card" >
						<div class="">
							<img class="adminProfile" src="${pageContext.request.contextPath }/resources/wellSeeProfile/jaeHoon.jpg">
						</div> 
						<div class="admin-info">
							<span class="admin-name">조재훈</span>
							<span class="admin-role">굿즈샵 관리자</span>
							<span class="admin-telno">042-224-2212</span>
						</div>
					</div>
					
				</div>
			</div>
			<!-- If we need navigation buttons -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
	</div>
</div>
<!-- 관리자 명단 스와이퍼 끝  -->

<!-- 통계 시작 -->
<div class="col-lg-12">
	<div class="row">
		<div class="col-lg-6 col-6-padding">
			<div class="widget">
				<div class="widget-title no-margin">
					<h4 class="sub-title">관심사 분석</h4>
					<input type="hidden" id="keywords" value="${statMap.keywords }">
				</div>
				<div class="widget">
					<div class="revenue-chart line">
						<div id="container_keyword"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-6-padding">
			<div class="widget">
				<div class="widget-title no-margin">
					<h4 class="sub-title">가입자 분석</h4>
					<input type="hidden" id="memberRates" value="${statMap.memberRates }">
				</div>
				<div class="widget">
					<div class="revenue-chart line">
   						 <div id="container_register" style="width:100%; height:400px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 매출 분석 -->
<div class="widget sales-chart">
	<div class="widget-title">
		<h4 class="sub-title">굿즈샵 매출분석</h4>
	</div>
	<div class="widget-peding">
		<div class="revenue-chart">
			<!-- 그래프 추가 영역 -->
			<div id="container_salesChart"></div>
			<input type="hidden" id="goodsSalesList" value="${statMap.goodsSalesList }">
		</div>
	</div>
</div>

<!-- 통계 끝 -->


<div class="col-lg-12 db-col">

	<!-- 주문 관련 시작 -->
	<div class="col-lg-5 row mega-style1" id="order-area">
		<div class="col-md-6">
			<div class="mega-post-info" id="delivery-area">
				<span class="notYetOrder" style="font-size: 25px;">미배송 처리</span>
				<span class="counts" style="font-size: 45px;"><a href="/goods/order/adminDeliveryBeforeList.do">${statMap.deliveryCount }</a></span>
			</div>
		</div>
		<div class="col-md-6">
			<div class="mega-post-info" id="change-area">
				<span class="notYetOrder" style="font-size: 25px;">미교환 처리</span>
				<span class="counts" style="font-size: 45px;"><a href="/goods/order/adminChangelist.do">${statMap.changeCount }</a></span>
			</div>
		</div>
	</div>
	<!-- 주문 관련 끝 -->
	
	<!-- 문의 관련 시작 -->
	<div class="col-lg-5 inner-bg" id="inquiry-area">
		<div class="element-title">
			<h4 class="counts" style="font-size: 19px;">
				<a href="/goods/inquiry/list.do">> 미답변 문의</a>
			</h4>
			<span id="inquiryCount">${statMap.inquriryCount }건</span>
		</div>
		<table class="cart-table table table-responsive">
			<thead>
				<tr>
					<th>문의자ID</th>
					<th colspan="3">제목</th>
					<th>문의날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty statMap.giList }">
						<td colspan="5" style="text-align: center;">미답변 문의 내역이 존재하지 않습니다.</td>
					</c:when>
					<c:otherwise>
						<c:forEach items="${statMap.giList }" var="gi">
							<tr>
								<td>${gi.userId }</td>
								<td colspan="3">${gi.giTitle }</td>
								<fmt:parseDate value="${gi.giRegdate}" var="giRegdate" pattern="yyyy-MM-dd" />
				            	<td><fmt:formatDate value="${giRegdate}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<!-- 문의 관련 끝 -->
	
</div>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script> -->
<script src="https://code.highcharts.com/modules/pictorial.js"></script> <!-- 가입자 비율 차트 모듈 추가 -->
<script src="https://code.highcharts.com/modules/wordcloud.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script>
$(function(){
	//swiper 
	var swiper = new Swiper(".mySwiper", {
		loop: true,
		slidesPerView: 3,
// 		autoplay : true, //자동 재생 여부 
		spaceBetween: 20,
		// Navigation arrows
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});
	$(".swiper-slide").css("width", "509.73px").css("margin-right", "27px");
	

	// 단어 추출 및 빈도수 계산
	const text = $("#keywords").val();
	console.log("keywords : ", text);
	
	if(text.length < 200){ // 키워드가 너무 적을 경우에는 분석할 데이터가 부족하다는 멘트로 대체한다.
		$("#container_keyword").text("분석할 데이터가 부족합니다.").css({
	        "font-size": "20px",
	        "position": "relative",
	        "top": "160px",
	        "text-align": "center",
	        "font-weight": "bold"
	    });
	} else {
		const lines = text.replace(/[():'?0-9]+/g, '').split(/[,\. ]+/g);
		const data = lines.reduce((arr, word) => {
		    // 단어의 길이가 2 이상이고, 빈도수가 3 이상인 경우에만 처리
		    if (word.length >= 2 && lines.filter(w => w === word).length >= 3) {
		        let obj = Highcharts.find(arr, obj => obj.name === word);
		        if (obj) {
		            obj.weight += 1;
		        } else {
		            obj = {
		                name: word,
		                weight: 1,
		            };
		            arr.push(obj);
		        }
		    }
		    return arr;
		}, []);
	
		Highcharts.chart('container_keyword', {
		    accessibility: {
		        screenReaderSection: {
		            beforeChartFormat: '<h5>{chartTitle}</h5>' +
		                '<div>{chartSubtitle}</div>' +
		                '<div>{chartLongdesc}</div>' +
		                '<div>{viewTableButton}</div>'
		        }
		    },
		    accessibility: {
		        enabled: true
		    },
		    series: [{
		        type: 'wordcloud',
		        data,
		        name: 'Occurrences'
		    }],
		    title: {
		        text: '최근 한달, 팬피드 내에서 가장 빈도수가 높은 키워드',
		        align: 'center'
		    },
		    subtitle: {
		        text: '',
		        align: 'left'
		    },
		    tooltip: {
		        headerFormat: '<span style="font-size: 16px"><b>{point.key}</b></span><br>'
		    }
		});
		/* 관심사 분석 끝 */
	}
	
	// 가입자 분석
	var memberRates = JSON.parse($("#memberRates").val());
	
	console.log("@@@ : ", $("#memberRates").val());			
// 	console.log("@@@ : ", $("#memberRates").val()[0]);   

// 	var maxVal = 0;

// 	// dataList의 각 요소를 순회하며 최댓값 계산
// 	for (var i = 0; i < memberRates.length; i++) {
// 	    var sum = memberRates[i][0] + memberRates[i][1]; // 여성과 담당의 합
// 	    if (sum > maxVal) {
// 	        maxVal = sum;
// 	    }
// 	}

	const maxMale = Math.max(...memberRates.map(item => item[1]));
		
	Highcharts.chart('container_register', {
    chart: {
        type: 'pictorial'
    },

    title: {
        text: '성별 & 연령대별 가입자 현황',
        fontFamily: 'Pretendard-Regular, sans-serif'
    },

    accessibility: {
        screenReaderSection: {
            beforeChartFormat: '<{headingTagName}>{chartTitle}</{headingTagName}><p>{typeDescription}</p><p>{chartLongdesc}</p>'
        },
        point: {
            valueDescriptionFormat: '{value}.'
        },
        series: {
            descriptionFormat: ''
        },
        landmarkVerbosity: 'one'
    },

    xAxis: {
        categories: ['여성', '남성'],
        lineWidth: 0,
        opposite: true
    },

    yAxis: {
        visible: false,
        stackShadow: {
            enabled: true
        },
        max: 31
    },

    legend: {
        itemMarginTop: 15,
        itemMarginBottom: 15,
        layout: 'vertical',
        padding: 0,
        verticalAlign: 'middle',
        align: 'center',
        margin: 0
    },

    tooltip: {
        headerFormat: ''
    },

    plotOptions: {
        series: {
            pointPadding: 0,
            groupPadding: 0,
            dataLabels: {
                enabled: true,
                align: 'center',
                format: '{point.percentage:.1f} %'
            },
            stacking: 'normal',
            paths: [{
                definition: 'm 656.59433,740.097 c -0.634,-1.435 -13.566,-15.425 -33.487,-23.292 -4.568,-1.94 -4.545,2.705 -16.944,-34.925 -26.957,-72.647 -5.661,-112.736 -51.135,-200.791 -6.888,-14.322 -9.901,-24.921 -16.16,-50.12 -25.397,-104.478 -6.032,-90.98 -15.87,-135.251 -17.961,-63.049 -50.754,-59.498 -71.782,-59.155 -16.944,0.378 -45.224,-11.699 -52.936,-19.746 -10.555,-11.486 -17.912,-20.548 -11.679,-58.855 0,0 7.037,-12.141 9.078,-34.125 9.284,11.287 24.572,-33.84 16.065,-42.691 -1.745,-1.867 -5.169,-1.236 -6.289,1.015 -1.292,1.484 -1.315,3.695 -2.888,4.964 -2,-9.359 3.289,-28.498 -7.935,-56.968 -5.541,-12.289 -11.235,-15.496 -21.547,-22.44 -8.401,-6.048 -28.842,-7.595 -29.842,-7.717 h -9.461 c -1,0.122 -21.441,1.669 -29.842,7.717 -10.312,6.944 -16.006,10.151 -21.547,22.44 -11.224,28.47 -5.935,47.609 -7.935,56.968 -1.573,-1.269 -1.596,-3.48 -2.888,-4.964 -1.12,-2.251 -4.544,-2.882 -6.289,-1.015 -8.507,8.851 6.781,53.978 16.065,42.691 2.041,21.984 9.078,34.125 9.078,34.125 6.233,38.307 -1.124,47.369 -11.679,58.855 -7.712,8.047 -35.992,20.124 -52.935,19.746 -21.029,-0.343 -53.822,-3.894 -71.782,59.155 -9.838,44.271 9.527,30.773 -15.87,135.251 -6.259,25.199 -9.272,35.798 -16.16,50.12 -45.474004,88.055 -24.178004,128.144 -51.135004,200.791 -12.399,37.63 -12.376,32.985 -16.944,34.925 -19.921,7.867 -32.853,21.857 -33.487,23.292 -8.923,20.454 -23.3280004,27.412 -19.92100038,33.844 0.89599998,1.702 3.31799998,2.588 4.94399998,1.381 5.1890004,0.91 12.7380004,-4.808 16.1270004,-8.599 4.102,-4.706 3.375,-7.457 11.332,-13.86 1.824,2.047 -2.155,20.335 -3.12,23.398 -4.877,14.729 -26.5670004,49.619 -17.595,54.417 0.945,0.4 2.227,0.955 3.073,0.089 1.553,-1.53 3.53,-2.604 4.841,-4.372 8.025,-10.218 17.566,-34.36 24.059,-39.238 3.279,0.224 1.596,2.346 -4.475,22.532 -3.673,13.084 -5.142,19.941 -5.142,19.941 -10.126,30.466 6.229,25.716 11.501,6.808 0.448,-1.537 9.722,-26.912 10.129,-28.16 1.241,-3.291 4.602,-17.806 8.801,-14.872 0.646,2.469 -0.335,3.044 -3.536,31.521 -2.6,21.813 -3.236,8.789 -2.713,26.425 0.079,2.164 4.439,3.257 6.282,2.115 10.539,-9.723 12.692,-57.611 18.074,-61.022 3.669,4.293 4.272,33.754 5.982,39.221 2.652,9.705 7.446,4.802 7.981,3.239 3.825004,-9.324 -0.19,-30.536 0.628,-45.388 0,0 4.369004,-14.53 7.198004,-38.676 4.176,-45.514 -17.861004,13.267 48.59,-167.185 0,0 5.299,-10.218 13.794,-30.791 9.81,-21.31 5.988,-35.652 19.766,-73.451 0.361,-1 16.239,-47.758 24.363,-68.15 45.673,232.645 -9.743,77.068 -28.904,331.531 -5.708,105.042 1.862,76.707 18.19,223.544 31.719,289.304 -15.087,130.161 35.652,384.312 10.99,51.495 9.837,44.86 11.854,56.284 2.28,21.363 -1.788,21.528 -1.679,31.313 -0.699,24.031 5.964,8.574 -1.712,52.53 -4.993,24.181 -4.913,9.214 -7.677,37.417 -3.463,13.977 -13.912,52.732 0.856,52.45 1.286,7.64 5.541,9.156 9.756,6.712 -0.684,2.455 1.381,4.293 2.766,6.011 4.813,1.322 4.76,1.029 6.828,-0.555 1.495,5.791 5.173,5.742 6.748,6.16 4.768,1.476 5.904,-11.237 6.781,-16.16 0.856,-0.046 1.705,-0.096 2.551,-0.129 -1.072,3.151 -7.161,15.833 2.634,16.835 7.651,1.238 8.542,0.168 12.727,-3.791 6.992,-7.01 5.41,-8.94 6.623,-20.685 0.191,-2.384 5.685,-6.58 0.872,-37.642 -1.855,-15.952 -0.832,2.69 0.304,-35.715 0.371,-16.594 5.685,-19.576 6.408,-31.349 -6.493,-27.396 -1.465,-14.55 -4.045,-30.51 -6.145,-34.313 -7.105,-27.255 0.575,-107.316 6.987,-65.839 14.147,-68.677 7.72,-136.864 -14.296,-110.15 -0.224,-68.945 1.451,-126.216 1.503,-67.36 -4.198,-108.808 3.103,-168.203 4.314,-34.735 12.351,-68.835 12.215,-90.227 2.948,-3.639 4.984,-7.885 7.168,-11.993 3.172,-6.203 2.655,-0.513 2.627,-35.675 1.424,-0.218 2.885,-0.281 4.27,-0.677 0.162,-0.334 0.307,-0.661 0.436,-0.985 0.007,0.007 0.014,0.015 0.022,0.023 0.008,-0.008 0.015,-0.016 0.022,-0.023 0.129,0.324 0.274,0.651 0.436,0.985 1.385,0.396 2.846,0.459 4.27,0.677 -0.028,35.162 -0.545,29.472 2.627,35.675 2.184,4.108 4.22,8.354 7.168,11.993 -0.136,21.392 7.901,55.493 12.215,90.227 7.301,59.394 1.6,100.842 3.103,168.203 1.675,57.27 15.747,16.066 1.451,126.216 -6.427,68.186 0.733,71.025 7.72,136.864 7.68,80.061 6.72,73.003 0.575,107.316 -2.58,15.96 2.448,3.114 -4.045,30.51 0.723,11.773 6.037,14.755 6.408,31.349 1.136,38.405 2.159,19.763 0.304,35.715 -4.813,31.062 0.681,35.258 0.872,37.642 1.213,11.745 -0.369,13.675 6.623,20.685 4.185,3.959 5.076,5.029 12.727,3.791 9.795,-1.002 3.706,-13.684 2.634,-16.835 0.846,0.033 1.695,0.083 2.551,0.129 0.877,4.923 2.013,17.636 6.781,16.16 1.575,-0.418 5.253,-0.369 6.748,-6.16 2.068,1.584 2.015,1.877 6.828,0.555 1.385,-1.718 3.45,-3.556 2.766,-6.011 4.215,2.444 8.47,0.928 9.756,-6.712 14.768,0.282 4.319,-38.473 0.856,-52.45 -2.764,-28.203 -2.684,-13.236 -7.677,-37.417 -7.676,-43.956 -1.013,-28.499 -1.712,-52.53 0.109,-9.785 -3.959,-9.95 -1.679,-31.313 2.017,-11.424 0.864,-4.789 11.854,-56.284 50.739,-254.151 3.933,-95.007 35.652,-384.312 16.328,-146.837 23.898,-118.502 18.19,-223.544 -19.161,-254.463 -74.576,-98.886 -28.904,-331.531 8.124,20.392 24.002,67.15 24.363,68.15 13.778,37.8 9.956,52.142 19.766,73.451 8.495,20.573 13.794,30.791 13.794,30.791 66.451,180.451 44.414,121.671 48.59,167.185 2.829,24.146 7.198,38.676 7.198,38.676 0.818,14.852 -3.197,36.064 0.628,45.388 0.535,1.563 5.329,6.466 7.981,-3.239 1.71,-5.467 2.313,-34.928 5.982,-39.221 5.382,3.411 7.535,51.3 18.074,61.022 1.843,1.142 6.203,0.049 6.282,-2.115 0.523,-17.636 -0.113,-4.612 -2.713,-26.425 -3.201,-28.477 -4.182,-29.052 -3.536,-31.521 4.199,-2.934 7.56,11.581 8.801,14.872 0.407,1.248 9.681,26.623 10.129,28.16 5.272,18.908 21.627,23.658 11.501,-6.808 0,0 -1.469,-6.857 -5.142,-19.941 -6.071,-20.186 -7.754,-22.308 -4.475,-22.532 6.493,4.878 16.034,29.02 24.059,39.238 1.311,1.768 3.288,2.842 4.841,4.372 0.846,0.866 2.128,0.311 3.073,-0.089 8.972,-4.798 -12.718,-39.688 -17.595,-54.417 -0.965,-3.063 -4.944,-21.351 -3.12,-23.398 7.957,6.403 7.23,9.154 11.332,13.86 3.389,3.791 10.938,9.509 16.127,8.599 1.626,1.207 4.048,0.321 4.944,-1.381 3.403,-6.432 -11.002,-13.39 -19.925,-33.844 z'
            }, {
                definition: 'm 288.24306,919.66652 c -2.887,-37.612 3.116,-111.464 -6.141,-106.729 0,0 -1.513,6.585 -1.773,8.642 -1.752,13.994 -0.121,74.406 -2.134,96.522 0,0 -7.163,57.876 -11.151,74.107 -3.988,16.22798 -11.166,115.22698 -19.144,139.57398 -7.976,24.345 -16.75,56.8 -8.774,81.958 7.976,25.157 16.752,67.352 8.774,105.492 -7.976,38.14 -16.75,91.288 -11.964,118.069 3.521,19.706 4.786,38.546 7.978,42.603 3.188,4.057 0,12.169 0,22.721 0,10.547 1.594,33.271 -1.995,41.793 0,6.082 5.183,22.719 2.394,30.427 -2.793,7.711 0,12.174 -3.591,15.417 -3.589,3.247 -9.572,11.77 -22.733,8.525 -7.978,-2.438 -8.375,-8.525 -7.178,-9.742 1.195,-1.216 -4.389,-0.402 -4.389,-0.402 -2.78,5.181 -12.76,6.868 -17.548,-0.406 -0.796,-1.218 -3.587,4.461 -9.969,3.243 -6.382,-1.218 -3.589,-4.055 -3.589,-4.055 0,0 -8.377,0.404 -10.37,-4.463 -0.399,1.216 -4.387,2.839 -7.579,-0.406 -3.19,-3.245 -2.791,-13.793 -1.594,-19.07 1.195,-5.277 6.796,-14.401 8.774,-17.854 2.791,-4.867 13.161,-23.533 12.762,-28.806 -0.248,-3.263 0.796,-27.998 3.19,-34.081 2.394,-6.089 2.793,-13.391 2.793,-21.505 0,-8.116 1.995,-53.965 -13.959,-110.363 -15.954,-56.396 -23.531,-83.984 -23.928,-122.938 -0.399,-38.952 17.147,-62.483 6.777,-121.312 -10.368,-58.836 -14.755,-97.785 -15.952,-101.439 -1.197,-3.647 -7.675,-87.08798 -7.675,-87.08798 -0.914,-90.865 2.12,-75.593 3.35,-108.574 2.353,-63.252 1.051,-52.022 10.05,-88.612 1.577,-12.158 2.454,-23.04 4.031,-35.203 0.657,-5.071 2.01,-11.418 2.669,-16.489 9.196,-31.653 9.142,-25.304 5.191,-54.251 -2.61,-19.17 0.658,-16.691 2.614,-36.464 0.344,-3.505 3.794,-65.532 -2.78,-99.005 -4.466,-13.066 -8.932,-26.134 -13.4,-39.197 h -0.557 c 0.201,32.151 -11.049,55.538 -16.752,82.933 -1.867,13.001 -2.392,23.885 -4.297,36.877 -0.585,4.014 -1.713,6.857 -2.315,10.995 -2.596,17.861 2.82,24.968 -3.437,57.216 -7.242,37.317 -22.927002,69.907 -30.150002,107.358 -1.197,6.198 -0.553,12.864 -0.316,18.911 0.585,4.031 1.615,6.33 2.475,10.552 1.195,5.861 1.78,13.168 2.863,18.818 1.334,6.942 1.438,15.31 1.664,23.435 0.207,7.346 1.037,12.54 0.288,21.87 -0.218,2.72 -0.033,36.328 -3.134,48.688 -1.434,5.7 -4.692,5.273 -6.077,4.279 -5.716,-7.654 -0.615,-25.119 -6.28,-43.599 -0.559,0.38 -0.559,0.046 -1.118,0.425 0.084,4.047 -0.667,9.273 -0.179,15.482 0.779,9.977 0.378,14.142 0.07,18.034 -0.832,10.572 -1.344,19.719 -3.924,25.218 -1.395,2.974 -5.2,5.59 -8.669,1.478 -1.937,-3.302 -2.208,-8.173 -2.411,-15.058 -0.878,-30.054 -0.969,-20.294 -1.334,-26.969 -0.388,-7.183 -0.61,-12.768 -0.61,-12.768 -0.89,-0.236 -1.494,-0.354 -2.345,-0.022 -2.167,19.698 -0.178,15.719 -2.96,39.445 -0.491,4.187 -0.139,12.028 -1.225,17.079 -2.229,10.363 -11.671,9.05 -12.444,1.027 -0.265,-2.74 -0.886,-5.687 -1.238,-8.086 -0.38,-2.592 -0.164,-6.26 -0.254,-8.989 -0.139,-4.209 -0.565,-7.888 -0.888,-12.069 -0.373,-4.839 2.084,-17.895 0.023,-27.551 -0.026,0 -1.142,0 -1.116,0 -0.734,4.359 -2.245,10.954 -3.969,19.445 -0.265,1.309 -0.399,3.632 -0.681,4.975 -1.549,7.394 -1.393,11.575 -2.166,16.148 -1.214,7.224 0.053,8.318 -2.505,13.124 -2.791,5.249 -7.135,2.857 -8.296,0.08 -1.801,-4.311 -2.814,-11.342 -2.795,-19.975 0.037,-15.995 2.716,-19.356 2.825,-40.619 0.023,-4.404 0.267,-8.277 -0.282,-12.349 v 2.129 c -2.435,4.109 -3.373,8.129 -7.8160001,10.222 -2.213,0.79 -4.001,1.246 -5.663,0.365 -1.62399996,-0.853 -2.71799996,-0.523 -2.11899996,-3.736 0.461,-2.47 1.58999996,-5.861 2.01399996,-8.907 0.638,-4.582 0.555,-8.698 1.641,-13.506 0.632,-2.789 2.368,-6.204 3.203,-8.885 1.366,-4.384 1.958,-10.449 3.1560001,-12.473 0.903,-1.533 3.004,-3.975 4.31,-5.698 0.346,-0.457 8.944,-13.182 12.286,-17.574 3.356,-4.409 5.699,-8.14 5.699,-8.14 0.051,-11.746 3.059,-18.778 2.08,-30.076 -1.692,-19.557 -0.495,1.76 -2.339,-121.232 4.78,-68.261 11.045,-49.621 17.136,-111.518 4.058,-41.052 4.798,-56.274 7.364,-64.797 2.452,-8.147 6.34,-29.092 5.657,-43.675 -0.459,-9.801 -0.45,-14.221 -1.543,-20.477 -2.05,-11.754 -1.431,-42.739 11.725,-69.299 11.477,-23.175 27.318,-34.048 49.629002,-43.289 15.531,-6.434 14.433,-2.79 42.978,-18.213 17.074,-9.227 57.814,-33.258 65.621,-50.863 0.124,-16.319 -0.366,-14.443 0.009,-29.778 0,0 -3.213,-13.298 -4.53,-22.591 -6.854,-0.074 -10.769,-6.449 -13.127,-14.318 -2.094,-6.98 -1.877,-19.262 -1.918,-20.897999 -0.163,-6.367 -0.441,-12.45 4.995,-14.77 1.445,-0.341 1.701,-0.376 2.351,-0.208 0.836,0.213 1.278,1.131 2.115,1.344 -1.056,-33.236 4.238,-59.246 25.686,-73.844 38.147,-25.962 84.194,-4.385 96.595,31.244 4.15,11.926 4.212,28.343 2.791,42.601 h 0.557 c 1.212,-1.02 1.445,-1.628 3.877,-1.237 4.303,1.889 5.591,6.919 5.712,15.963999 0.177,13.445 -0.6,22.432 -9.367,31.903 -2.189,2.366 -4.282,2.09 -7.477,3.358 -0.207,4.645 -2.703,18.616 -2.703,18.616 0,0 -1.703,28.168 -0.651,31.938 4.364,15.563 55.746,47.859 85.792,61.08 17.748,7.814 48.444,11.768 69.031,44.574 13.863,22.079 19.151,53.497 15.704,74.476 -1.369,8.304 -2.896,28.95 -0.455,42.944 10.918,54.033 5.22,16.283 12.421,88.953 3.703,37.295 4.626,32.485 12.068,67.063 0.877,4.079 0.794,6.836 1.346,12.065 1.663,15.866 5.62,30.424 2.492,104.929 -2.799,66.377 -3.96,53.491 -0.943,68.354 1.208,5.992 -3.063,8.431 14.057,30.796 1.5,1.958 3.088,4.873 4.581,6.495 1.694,1.845 3.269,2.407 4.457,4.93 1.314,2.802 0.723,5.179 1.38,8.273 0.807,3.74 1.647,6.727 4.105,12.349 1.013,2.327 -0.075,8.781 0.653,13.461 0.41,2.637 1.961,5.16 2.388,7.739 0.002,0.022 0.939,1.3 0.762,2.483 -0.256,1.687 -2.004,3.38 -5.381,2.653 -6.446,-1.04 -7.101,-6.232 -10.611,-10.035 0.08,5.339 -0.595,7.281 1.099,29.728 0.427,5.661 3.893,30.336 -1.199,40.461 -1.756,3.495 -5.721,2.996 -7.803,0.51 -5.565,-6.642 -0.373,-10.685 -8.925,-51.36 -1.116,-5.271 -2.349,-0.61 -2.349,-0.61 -0.16,25.464 1.666,13.068 -0.25,31.836 -0.942,9.126 -0.375,27.282 -5.445,28.639 -4.658,1.253 -7.366,-2.318 -8.181,-5.416 -2.122,-8.108 -1.956,-18.062 -2.014,-19.063 -0.154,-2.729 -1.026,-9.119 -1.135,-11.913 -0.365,-9.214 0.497,-12.819 -1.302,-26.917 -0.143,-1.174 -1.462,-1.35 -1.462,-1.35 -1.961,1.819 -0.851,8.454 -1.186,11.551 -3.15,28.922 0.442,32.063 -4.351,43.031 -1.628,3.721 -6.48,3.881 -8.433,0.491 -1.442,-2.512 -1.526,-5.726 -1.705,-6.352 -1.756,-6.089 -1.334,-12.805 -1.863,-18.569 -0.354,-3.81 -0.926,-4.884 -0.856,-7.958 0.233,-10.437 2.309,-16.964 0.412,-27.651 -0.373,-0.187 -0.747,-0.378 -1.118,-0.564 -0.745,1.157 -0.459,2.19 -0.832,3.716 -1.212,4.928 -1.404,12.154 -2.204,17.859 -1.259,9.017 0.911,20.359 -4.784,22.732 -2.791,-0.191 -2.603,-0.38 -4.274,-2.084 -5.376,-13.557 -1.805,-31.088 -3.117,-47.522 -1.586,-19.77 -0.064,-18.681 0.35,-25.185 1.917,-31.072 0.966,-16.394 3.205,-32.181 2.262,-15.944 3.054,-13.863 4.133,-21.228 2.059,-14.053 -0.666,-20.851 -4.999,-37.704 -0.491,-1.921 -1.163,-3.497 -1.622,-5.483 -2.089,-8.967 -5.855,-19.003 -8.234,-27.605 -19.318,-69.827 -14.488,-54.078 -17.153,-72.648 -1.286,-8.943 -1.133,-5.494 -0.113,-35.667 -0.809,-5.598 -2.364,-10.439 -3.177,-16.035 -1.797,-12.391 -2.844,-25.539 -4.639,-37.927 -5.657,-26.218 -15.956,-48.792 -16.193,-80.094 -0.369,0.189 -0.743,0.378 -1.116,0.569 -2.808,11.112 -8.142,23.815 -12.783,35.175 -2.405,5.894 -0.418,6.326 -2.522,15.378 -2.886,12.424 -4.145,63.823 -0.885,88.047 0.927,6.952 1.197,1.809 2.793,20.448 0.284,3.354 -0.164,5.8 -0.448,9.638 -0.233,3.137 -0.224,7.706 -0.638,10.272 -1.468,9.087 -3.239,15.532 -1.15,24.966 2.02,9.109 2.677,4.255 8.751,34.942 0.994,5.012 0.751,7.619 1.466,13.365 0.565,4.546 2.078,12.258 2.836,16.265 0.745,3.916 1.063,8.954 1.788,12.814 1.568,8.348 8.083,29.891 8.46,62.064 0.704,59.53 4.476,55.504 4.024,102.244 -0.614,56.92 -8.584,147.53898 -14.226,174.12198 -7.577,35.704 -12.762,81.961 -9.967,90.885 2.787,8.926 12.363,79.119 6.775,111.58 -5.582,32.455 -34.296,139.976 -33.897,161.887 0.397,21.911 -5.919,41.448 0.397,55.584 3.99,8.926 1.199,27.188 2.793,32.459 1.596,5.275 3.589,20.288 9.173,24.751 5.584,4.465 15.154,27.184 13.161,34.489 -1.995,7.302 -5.185,12.983 -10.37,10.956 -4.385,4.869 -9.971,3.651 -11.166,3.245 -1.197,-0.406 -4.387,8.926 -13.959,1.624 -2.392,3.649 -5.582,6.488 -12.365,3.649 -6.779,-2.839 -4.784,-3.649 -4.784,-3.649 l -5.185,0.81 c 0,0 0.796,10.55 -8.776,10.55 -9.57,0 -23.529,-6.493 -22.731,-17.04 0.796,-10.552 -0.798,-24.753 3.988,-39.358 -4.786,-10.144 -5.185,-26.372 -2.791,-34.085 2.392,-7.704 0,-17.85 -0.401,-23.123 -0.399,-5.277 7.579,-37.33 7.579,-46.254 0,-8.93 0.798,-90.483 -4.786,-102.654 -5.584,-12.169 -12.762,-60.049 -4.387,-93.316 0,0 10.11,-48.282 10.37,-60.455 0.397,-18.666 -20.341,-75.874 -20.341,-98.593 0,-22.723 -13.56,-109.14698 -15.154,-115.63998 -1.594,-6.492 -9.109,-49.82 -9.109,-49.82'
            }]
        }
    },

    series: [{
        name: '50대 이상',
        data: memberRates[0],
    	color: '#3C0A6D'
    		
    }, {
        name: '40대',
        data: memberRates[1],
    	color: '#5A1999'
    },
    {
        name: '30대',
        data: memberRates[2],
    	color: '#9D4EDD'
    }, {
        name: '20대',
        data: memberRates[3],
    	color: '#C67DFF'
    },
    {
        name: '10대',
        data: memberRates[4],
    	color: '#E0AAFE'
    }
    ],

    responsive: {
        rules: [{
            condition: {
                maxWidth: 800
            },
            chartOptions: {
                legend: {
                    padding: 8,
                    margin: 12,
                    itemMarginTop: 0,
                    itemMarginBottom: 0,
                    verticalAlign: 'bottom',
                    layout: 'horizontal'
                }
            }
        }, {
            condition: {
                maxWidth: 400
            },
            chartOptions: {
                legend: {
                    layout: 'vertical'
                }
            }
        }]
    }
});
	
	// 매출 통계
	var goodsSalesList = $("#goodsSalesList").val();

	// 아티스트 이름과 숫자를 각각 큰따옴표로 감싸는 정규표현식을 사용하여 문자열을 수정
	var modifiedDataString = goodsSalesList.replace(/\b(\w+(\s+\w+)*)\b/g, '"$1"').replace(/"(\d+)"/g, "$1");

	// 수정된 문자열을 JSON으로 파싱
	var goodsSales = JSON.parse(modifiedDataString);
	console.log(goodsSales);

	Highcharts.chart('container_salesChart', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: '아티스트별 굿즈샵 판매액'
	    },
	    subtitle: {
	        text: '단위 : 원',
	        align: 'right'
	    },
	    xAxis: {
	        type: 'category',
	        labels: {
	            autoRotation: [-45, -90],
	            style: {
	                fontSize: '13px',
	                fontFamily: 'Pretendard-Regular, sans-serif'
	            }
	        }
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: ''
	        },
	        labels: {
	            formatter: function() {
	                return Highcharts.numberFormat(this.value, 0, '', ','); // #,### 포맷팅 적용
	            }
	        }
	    },
	    legend: {
	        enabled: false
	    },
	    tooltip: {
	        formatter: function() {
	            return '<b>' + this.point.name + '</b><br/>판매액: ' + Highcharts.numberFormat(this.point.y, 0, '', ',') + '원'; // #,### 포맷팅 적용
	        }
	    },
	    series: [{
	        name: 'Population',
	        colors: [
	            '#9b20d9', '#9215ac', '#861ec9', '#7a17e6', '#7010f9', '#691af3',
	            '#6225ed', '#5b30e7', '#533be1', '#4c46db', '#4551d5', '#3e5ccf',
	            '#3667c9', '#2f72c3', '#277dbd', '#1f88b7', '#1693b1', '#0a9eaa',
	            '#03c69b',  '#00f194'
	        ],
	        colorByPoint: true,
	        groupPadding: 0,
	        data: goodsSales,
	        dataLabels: {
	            enabled: true,
	            rotation: -90,
	            color: '#FFFFFF',
	            inside: true,
	            verticalAlign: 'top',
	            format: '{point.name}', // 아티스트 이름 표시
	            y: 10, 
	            style: {
	                fontSize: '13px',
	                fontFamily: 'Pretendard-Regular, sans-serif'
	            }
	        }
	    }]
	});
	
	// 하이차트 링크 삭제
	$(".highcharts-credits").hide();
	$(".sub-title").css("font-weight", "600").css("font-size", "22px");
	
});
</script>