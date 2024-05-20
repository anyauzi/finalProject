package kr.or.ddit.service.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.common.PaginationInfoVO2;
import kr.or.ddit.vo.entertain.ArtistGroupVO;
import kr.or.ddit.vo.goods.CartVO;
import kr.or.ddit.vo.goods.GoodsCategoryVO;
import kr.or.ddit.vo.goods.GoodsVO;

public interface IGoodsService {
	public int selectProdListCount(PaginationInfoVO<GoodsVO> pagingVO);
	public List<GoodsVO> selectProdList(PaginationInfoVO<GoodsVO> pagingVO);
	public List<ArtistGroupVO> selectAritstList();
	public List<GoodsCategoryVO> selectCategoryList();
	public ServiceResult insertProd(HttpServletRequest req, GoodsVO goodsVO);
	public GoodsVO selectProd(int goodsNo);
	public ServiceResult deleteProd(HttpServletRequest req, int goodsNo);
	public ServiceResult updateProd(HttpServletRequest req, GoodsVO goodsVO);
	public List<GoodsVO> selectGoodsList(PaginationInfoVO<GoodsVO> pagingVO);
	public int selectGoodsListCount(PaginationInfoVO<GoodsVO> pagingVO);
	public List<GoodsVO> selectGcId(String goodsArtist);
	public GoodsVO goodsShopDetail(String goodsNo);
	public List<CartVO> goodsCart(String userNo);
	public int goodsCartInsert(CartVO cartVO);
	public int selectOne(CartVO cartVO);
	public int goodsCartDelete(CartVO cartVO);
	public int goodsCartUpdate(CartVO cartVO);
	public List<CartVO> goodsQuantity(List<CartVO> list);
	public String membershipAuthSelect(GoodsVO goodsVO);
	public Integer membershipProdWhether(GoodsVO goodsVO);
	public List<CartVO> gcIdList(List<CartVO> list);
	public String gaDetailimgSelect(String goodsNo);
	public List<GoodsVO> recommendGoodsList(String goodsNo);
}
