package kr.or.ddit.controller.goods;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

import kr.or.ddit.service.goods.IGoodsService;
import kr.or.ddit.util.ServiceResult;
import kr.or.ddit.vo.entertain.ArtistGroupVO;
import kr.or.ddit.vo.goods.GoodsCategoryVO;
import kr.or.ddit.vo.goods.GoodsTagVO;
import kr.or.ddit.vo.goods.GoodsVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 상품 수정 및 삭제 컨트롤러
 * @author 성이수
 */
@Controller
@Slf4j
@RequestMapping("/goods")
public class GoodsModifyController {
	
	@Inject
	private IGoodsService goodsService;
	

	/**
	 * 체크한 상품을 삭제하는 컨트롤러
	 * @param goodsNos
	 * @param req
	 * @param model
	 * @param ra
	 * @return
	 */
	@RequestMapping(value = "/checkDelete.do", method = RequestMethod.POST)
	public String goodsCheckDelete(
			int[] goodsNos, HttpServletRequest req, Model model,
			RedirectAttributes ra) {
		String goPage = "";
		
		for (int goodsNo : goodsNos) {
			ServiceResult result = goodsService.deleteProd(req, goodsNo);
			if (result.equals(ServiceResult.OK)) {
				goPage = "redirect:/goods/list.do";
			}else {
				ra.addAttribute("message", "서버오류, 다시시도해주세요.");
				goPage = "redirect:/goods/list.do";
			}
		}
		return goPage;
	}
	
	
	/**
	 * 상품을 삭제하는 컨트롤러
	 * @param req
	 * @param ra
	 * @param goodsNo
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String goodsdelete(
			HttpServletRequest req,
			RedirectAttributes ra,
			int goodsNo, Model model) {
		String goPage = "";
		
		ServiceResult result = goodsService.deleteProd(req, goodsNo);
		if (result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "게시글 삭제가 완료되었습니다.");
			goPage = "redirect:/goods/list.do";
		}else {
			ra.addAttribute("message", "서버오류, 다시시도해주세요.");
			goPage = "redirect:/goods/list.do";
		}
		return goPage;
	}
	
	/**
	 * 상품 수정 화면을 띄우는 컨트롤러
	 * @param goodsNo
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String prodDetail(int goodsNo, Model model) {
		GoodsVO goodsVO = goodsService.selectProd(goodsNo);
		
		
		List<ArtistGroupVO> artistgroupVO = goodsService.selectAritstList();
		List<GoodsCategoryVO>categoryVO = goodsService.selectCategoryList();
		
		List<GoodsTagVO> tagList = goodsVO.getGoodsTagList();
		
		String gtName = null;
		if (tagList != null && tagList.size() > 0) {
			for (int i = 0; i < tagList.size(); i++) {
				gtName += tagList.get(i).getGtName() + ",";
			}
		}
		 
		model.addAttribute("artistgroup", artistgroupVO);
		model.addAttribute("category", categoryVO);
		model.addAttribute("prod", goodsVO);
		model.addAttribute("status", "u");
		model.addAttribute("gtName", gtName);
		return "admin/goods/addProduct";
	}
	
	/**
	 * 상품내역을 수정하는 컨트롤러
	 * @param req
	 * @param ra
	 * @param goodsVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String goodsUpdate(
			HttpServletRequest req,
			RedirectAttributes ra,
			GoodsVO goodsVO, Model model
			) {
		
		ServiceResult result = goodsService.updateProd(req, goodsVO);
		
		if (result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "게시글 수정이 완료되었습니다.");
		}else {
			model.addAttribute("prod", goodsVO);
			model.addAttribute("message", "서버에러, 다시시도해주세요!");
			model.addAttribute("status", "u");
		}
		return "redirect:/goods/update.do?goodsNo=" + goodsVO.getGoodsNo();
	}

}
