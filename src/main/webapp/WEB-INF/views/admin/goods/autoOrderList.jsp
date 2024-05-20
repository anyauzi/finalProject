<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/sweetAlertCustom/sweetAlertCustom.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<div class="gap inner-bg">
  <div class="table-styles">
  
  <div class="little-heading">
  	<h2 style="margin-bottom: 30px; font-family: 'GmarketSansMedium';">📤 상품 발주 내역</h2>
  </div>
  
  	<div class="gap listbar-container">
    <div class="discount-copon list-bar">
      <div class="row">
        <div class="col-md-4" style="margin-right: 20px;">
          <form method="post" id="searchForm">
	        <input type="hidden" name="page" id="page"/>
          	<div class="searchform-box" style="display: flex">
	          	 <select class="nice-select" style="width: 140px; height: 53px;">
		            <option value="goodsNo" <c:if test="${searchType eq 'goodsNo' }">selected</c:if>>상품 번호</option>
		            <option value="goodsName" <c:if test="${searchType eq 'goodsName' }">selected</c:if>>상품 이름</option>
	        	</select>

	            <input type="text" name="searchWord" value="${searchWord }" placeholder="검색">
		          
		        <button type="submit">검색</button>
	          </div>
	          <sec:csrfInput/>
          </form>
        </div>
      </div>
    </div>
  </div>
    
    <div class="widget">
    	<div class="totalCount" style="margin-top: 20px; height: 40px;">
        	<span style="font-weight: 600; color: red; padding: 20px 0px 10px 20px;">발주 건 수 : ${pagingVO.totalRecord }</span>
       	</div>
      <table class="prj-tbl striped table-responsive">
        <thead class="color">
           <tr class="prodTitle">
             <th><em>번호</em></th>
             <th><em>이미지</em></th>
             <th><em>제품명</em></th>
             <th><em>제품번호</em></th>
             <th><em>단가</em></th>
             <th><em>카테고리</em></th>
             <th><em>발주 요청 날짜</em></th>
             <th><em>현재 재고</em></th>
             <th><em>요청 수량</em></th>
             <th><em>상태</em></th>
           </tr>
        </thead>
        <tbody id="cancelTable">
        <c:set value="${pagingVO.dataList }" var="goodsAutoBuyList"/>
        <c:choose>
        	<c:when test="${empty goodsAutoBuyList}">
        		<tr>
        			<td colspan="12">상품 리스트가 존재하지 않습니다.</td>
        		</tr>
        	</c:when>
        	<c:otherwise>
        		<c:forEach items="${goodsAutoBuyList }" var="autoBuy" varStatus="vs1">
	        			<tr class="cancelList" >
					        <td><span>${autoBuy.gbNo }</span></td>
				            <td>
				            	<img alt="" src="${autoBuy.goodsThumbnail }"  style="width:40px;">
				            </td>
				            <td style="text-align: left;">
				            	<a class="goodsBtn" data-prodNo="${autoBuy.goodsNo }">
				            		<span>${autoBuy.goodsName }</span>
				            	</a>
				            </td>
				            <td><span>${autoBuy.goodsNo }</span></td>
				            <td><span><fmt:formatNumber value="${autoBuy.gbPrice }" pattern="#,###"/></span></td>
				            <td><span>${autoBuy.goodsArtist } > ${autoBuy.gcId }</span></td>
				            <td><span><fmt:formatDate value="${autoBuy.gbDate}" pattern="yyyy-MM-dd" /></span></td>
				            <td><span>${autoBuy.goodsQuantity }</span></td>
				            <td><span>${autoBuy.goodsAutobuycount }</span></td>
				            <td>
				            	<c:choose>
				            		<c:when test="${autoBuy.gbStatus eq 'N' }">
				            			 <span>발주 요청</span>
				            		</c:when>
				            		<c:otherwise>
				            			 <span>발주처리 완료</span>
				            		</c:otherwise>
				            	</c:choose>
				           </td>
						</tr>
        			</c:forEach>
        	</c:otherwise>
        </c:choose>
        </tbody> 
      </table>
    </div>
    <div class="card-footer prod-footer clearfix" id="pagingArea">
		${pagingVO.pagingHTML }
	</div>
  </div>
</div>


<script src="${pageContext.request.contextPath }/resources/js1/bootstrap.min.js"></script>
<script>
$(function () {
	
	var searchForm = $("#searchForm")
	var pagingArea = $("#pagingArea");
	
	pagingArea.on("click", "a", function (event) {
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
});
</script>