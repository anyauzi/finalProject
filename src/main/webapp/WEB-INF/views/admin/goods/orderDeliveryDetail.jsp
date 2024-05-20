<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/sweetAlertCustom/sweetAlertCustom.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
.orderdetailBtn {
	cursor: pointer ;
	font-weight: 700;
	text-decoration: underline !important;
	font-size: 14px;
}
.cpBtn {
	cursor: pointer;
	font-weight: 700;
	border: 1px solid #eee;
	padding: 10px 20px;
}
.cpBtn:hover {
	background: #cbcfd4;
}
table span {
	font-size: 16px;
}
.widget-title2 {
	border-bottom: 1px solid #c9c9c9;
}
.widget-title2 h4 {
	padding-left: 12px;
	font-weight: 600;
	font-size: 20px !important;
}
.orderback {
	background: #fff !important;
	border: 1px solid #eee;
	box-shadow: none;
	box-shadow: 0 3px 15px 0 rgba(0, 0, 0, 0.1);
}
.q-comments span {
	color: #1a1a1a;
	font-size: 15px !important;
}
.q-comments li {
	padding-bottom: 20px;
}
.col-lg-6{
	padding-left: 30px;
	padding-right: 30px;
}
</style>
<div class="gap inner-bg">
	<c:set value="배송 처리하기" var="name"/>
	<c:if test="${orderDetailList[0].orderDelivery eq 'Y'}">
		<c:set value="배송 전 처리하기" var="name"/>
	</c:if>
	<div class="table-styles" style="padding: 0 20px 0 20px;">
        <div class="little-heading">
            <h2 style="margin-bottom: 30px">주문 상세</h2>
        </div>
	        
	    <div class="widget">
          <table class="prj-tbl striped table-responsive">
              <thead class="color">
                  <tr class="prodTitle">
                      <th><em>주문번호</em></th>
                      <th><em>이미지</em></th>
                      <th><em>제품명</em></th>
                      <th><em>수량</em></th>
                      <th><em>결제금액(원)</em></th>
                      <!-- <th><em>총주문액(원)</em></th> -->
                      <th><em>결제방법</em></th>
                      <th><em>주문일</em></th>
                  </tr>
              </thead>
              <tbody id="cancelTable">
                  <c:set value="${orderDetailList }" var="orderDetailList" />
                  <c:choose>
                      <c:when test="${empty orderDetailList}">
                          <tr>
                              <td colspan="12">상품 리스트가 존재하지 않습니다.</td>
                          </tr>
                      </c:when>
                      <c:otherwise>
                          <c:forEach items="${orderDetailList }" var="orderDetail" varStatus="vs1">
                              <tr class="cancelList">
                                  <td><span class="orderNo">${orderDetail.orderNo }</span></td>
                                  <td>
                                      <img alt="" src="${orderDetail.goodsThumbnail }" style="width:40px;">
                                  </td>
                                  <td>
                                      <a class="goodsBtn">
                                          <span>${orderDetail.goodsName }</span>
                                      </a>
                                  </td>
                                  <td><span>${orderDetail.odQuantity }</span></td>
                                  <td><span><fmt:formatNumber value="${orderDetail.odTotalprice }" pattern="#,###"/></span></td>
                                  <%-- <td><span><fmt:formatNumber value="${orderDetail.orderTotalprice }" pattern="#,###"/></span></td> --%>
                                  <td><span>${orderDetail.orderPay }</span></td>
                                  <td>
                                     <span>
                                         <fmt:formatDate value="${orderDetail.orderDate}" pattern="yyyy-MM-dd" />
                                     </span>
                                  </td>
                              </tr>
                          </c:forEach>
                      </c:otherwise>
                  </c:choose>
              </tbody>
          </table>
      </div>
	</div>
	
	<div class="row">
   <div class="col-lg-6 col-sm-12">
       <div class="widget orderback">
           <div class="widget-title widget-title2">
               <h4>배송지 정보</h4>
               <!-- <ul class="widget-controls">
		           <li title="Refresh" class="refresh-content"><i class="fa fa-refresh"></i></li>
		           <li title="Maximize" class="expand-content"><i class="icon-frame"></i></li>
		           <li title="More Options" class="more-option"><i class="ti-more-alt"></i></li>
		       </ul> -->
           </div>
           <div class="widget-peding">
               <ul class="q-comments recent">
                   <li>
                       <div class="comment-detail">
                       		<span>받는분 :</span> 
						   	<span style="width: 400px">${orderDetailList[0].maReciever }</span>
                       </div>
                   </li>
                   <li>
                       <div class="comment-detail">
                            <span>주소 :</span> 
							<span style="width: 400px">${orderDetailList[0].maAddress1 } ${orderDetailList[0].maAddress2 } 
							(${orderDetailList[0].maPostcode })</span>
                       </div>
                   </li>
                   <li>
                       <div class="comment-detail">
                           	<span>연락처 :</span> 
							<span style="width: 400px">${orderDetailList[0].maTelno }</span>
                       </div>
                   </li>
               </ul>
           </div>
       </div>
       <!-- user list -->
   </div>
   <!-- recent comment widget -->
   <div class="col-lg-6 col-sm-12">
       <div class="widget orderback">
           <div class="widget-title widget-title2">
               <h4>결제 상세 정보</h4>
               <!-- <ul class="widget-controls">
		           <li title="Refresh" class="refresh-content"><i class="fa fa-refresh"></i></li>
		           <li title="Maximize" class="expand-content"><i class="icon-frame"></i></li>
		           <li title="More Options" class="more-option"><i class="ti-more-alt"></i></li>
		       </ul> -->
           </div>
           <div class="widget-peding">
               <ul class="q-comments recent">
                   <li>
                       <div class="comment-detail">
                       		<span>결제수단 :</span> 
						   	<span style="width: 400px">${orderDetailList[0].orderPay }</span>
                       </div>
                   </li>
                   <li>
                       <div class="comment-detail">
                           	<span>주문자 ID :</span> 
							<span style="width: 400px">${orderDetailList[0].userId }</span>
                       </div>
                   </li>
                   <li>
                       <div class="comment-detail">
                           	<span>총 결제금액 :</span> 
							<span style="width: 400px">
								<fmt:formatNumber value="${orderDetailList[0].orderTotalprice }" pattern="#,###"/>원
							</span>
                       </div>
                   </li>
                   <li>
                       <div class="comment-detail">
                           	<span>배송상태 :</span> 
                           	<c:choose>
                           		<c:when test="${orderDetailList[0].orderDelivery eq 'N'}">
                           			<span>배송 전 </span>
                           		</c:when>
                           		<c:otherwise>
                           			<span>배송 완료 &nbsp(<fmt:formatDate value="${orderDetailList[0].cmplDate }" pattern="yyyy-MM-dd" />)</span>
                           			
                           		</c:otherwise>
                           	</c:choose>
                       </div>
                   </li>
               </ul>
           </div>
       </div>
       <!-- user list -->
   </div>
   <!-- recent comment widget -->
</div>

<div class="col-md-12" style="margin-top: 20px;">
    <div class="buttonz addpro_buttonz">
		<button type="button" id="deliveryBtn" value="${name }">${name }</button>
        <c:if test="${status ne 'u' }">
       		<button type="button" id="listBtn">목록</button>
        </c:if>
    </div>
</div>
</div>


<script src="${pageContext.request.contextPath }/resources/js1/bootstrap.min.js"></script>
<script>
$(function () {
	
	var listBtn = $("#listBtn");
	
	listBtn.on("click", function () {
		location.href = "/goods/order/adminDeliveryBeforeList.do";
	});
	
	var deliveryBtn = $("#deliveryBtn");
	
	deliveryBtn.on("click", function () {
		if (deliveryBtn.val() == "배송 처리하기") {
			Swal.fire({
	            title: '배송 완료 처리 하시겠습니까?',
	            text: " ",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '배송처리 하기',
	            cancelButtonText: '취소'
	        }).then((result) => {
	        	if (result.isConfirmed) {
	        		var orderNo = $(".orderNo").eq(0).text();

	                $.ajax({
	                    url: "/goods/order/deliveryUpdate.do",
	                    method: 'POST',
	                    data : {orderNo : orderNo, orderDelivery : 'Y'},
	                    beforeSend: function(xhr){
	                    	xhr.setRequestHeader(header, token);
	                    },
	                    success: function(data) {
	                        Swal.fire(
	                            '배송처리 완료!',
	                            '성공적으로 배송처리 되었습니다.',
	                            'success'
	                        ).then(() => {
	                        	location.href = "/goods/order/deliveryDetail.do?orderNo=" + orderNo;
	                        	
	                        });
	                    },
	                    error: function(xhr, status, error) {
	                        Swal.fire(
	                            '처리 실패!',
	                            '처리 도중 오류가 발생했습니다.',
	                            'error'
	                        );
	                    }
	                });
	            }
	
	        });
		}else {
			Swal.fire({
	            title: '배송 전 처리 하시겠습니까?',
	            text: " ",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '배송 전 처리 하기',
	            cancelButtonText: '취소'
	        }).then((result) => {
	        	if (result.isConfirmed) {
	        		var orderNo = $(".orderNo").eq(0).text();
	        		$.ajax({
	                    url: "/goods/order/deliveryUpdate.do",
	                    method: 'POST',
	                    data : {orderNo : orderNo, orderDelivery : 'N'},
	                    beforeSend: function(xhr){
	                    	xhr.setRequestHeader(header, token);
	                    },
	                    success: function(data) {
	                        Swal.fire(
	                            '배송 전 처리 완료!',
	                            '성공적으로 배송 전 처리 되었습니다.',
	                            'success'
	                        ).then(() => {
	                        	location.href = "/goods/order/deliveryDetail.do?orderNo=" + orderNo;
	                        	
	                        });
	                    },
	                    error: function(xhr, status, error) {
	                        Swal.fire(
	                            '처리 실패!',
	                            '처리 도중 오류가 발생했습니다.',
	                            'error'
	                        );
	                    }
	                });
	            }
	
	        });
		}
	});
	
	

});
</script>