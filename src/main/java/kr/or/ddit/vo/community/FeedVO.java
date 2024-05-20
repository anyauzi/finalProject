package kr.or.ddit.vo.community;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FeedVO {
	 private int feedNo;
	 private String feedType;
	 private Date feedRegdate;
	 private String feedContent;
	 private String feedMembership;
	 private String feedDelyn;
	 private int userNo;
	 private String userNo1;
	 private String agId;
	 private String faSavepath;
	 private String faSavedname;
	 private String faName;
	 private String mnNickName;
	 private String faMime;
	 private String faNo;
	 private String userProfile;
	 private String auth;
	 private int cjNo;
	 private Date cjDate;
	 private int flNo;
	 private int mnNo;
	 private int fcNo;
	 private String faFilter;
	 private String fcContent;
	 private Date fcRegdate;
	 private String fcDelyn;
	 private String userType;
	 
	 private String type;
	 
	 
	 private Integer[] delFeedNo;
	 private MultipartFile[] feedFile;
	 private List<FeedCommentVO> FeedCommentList;
	 private List<FeedAttachFileVO> feedFileList;
	 private List<FeedLikeVO> feedLikeList;
	
	public void setFeedFile(MultipartFile[] feedFile) {
		this.feedFile = feedFile;
		if(feedFile != null) {
			List<FeedAttachFileVO> feedFileList = new ArrayList<FeedAttachFileVO>();
			for(MultipartFile item : feedFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				FeedAttachFileVO feedFileVO = new FeedAttachFileVO(item);
				feedFileList.add(feedFileVO);
			}
			this.feedFileList = feedFileList;
		}
	}


	
	
}
