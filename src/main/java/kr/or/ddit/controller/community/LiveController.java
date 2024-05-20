package kr.or.ddit.controller.community;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.community.IFeedService;
import kr.or.ddit.service.community.ILiveService;
import kr.or.ddit.vo.common.CustomUser;
import kr.or.ddit.vo.common.UserVO;
import kr.or.ddit.vo.community.CommunityVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 라이브방송 컨트롤러
 * @author 서어진
 */
@Controller
@Slf4j
@RequestMapping("/community/feed/live")
public class LiveController {
	// (이건 API를 몰라서 따로 빠져야 하는지 아직 미정)
	// 일반 회원이 라이브 탭을 누르면 실시간 방송중인 내용 및 지난 라이브 목록을 확인이 가능하다.
	// 아티스트가 라이브 탭을 누르면 일반 사용자에게는 없는 [방송하기]라는 버튼이 나타난다.
	
	// 방송시작 메서드
	
	// 방송종료 메서드
	
	// 일반 사용자가 실시간 방송중인 정보 클릭하면 방송에 입장되는 메서드 등등
	
	@Inject
	private ILiveService liveService;
    
	@Inject
    private IFeedService feedService;
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER', 'ROLE_ARTIST')")
	@RequestMapping(value="/live.do", method = RequestMethod.GET)
	public String getOnLive(@RequestParam("agId") String agId, Model model){
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		UserVO userVO = user.getUser();
		
		int userNo1 = userVO.getUserNo();
		
		CommunityVO communityVO = new CommunityVO();
		
		communityVO.setUserNo(userNo1);
		
		communityVO.setAgId(agId);
        
        CommunityVO comId = feedService.selectUser(communityVO);
        
        
        model.addAttribute("UserInfo", comId);
		
        model.addAttribute("status", 4);
		
        return "community/getOnLive";
	}

}
