package com.green.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.manager.mapper.ManagerMapper;
import com.green.manager.vo.ManagerVo;

@Controller
@RequestMapping("/Manager")
public class ManagerController {
	
	@Value("${part4.upload-path}")
	private String uploadPath;

	@Autowired
	private ManagerMapper ManagerMapper;
	
		// ------------------------관리자 자주묻는질문-----------------------------//
		@RequestMapping("/ManagerAsklist")
		public ModelAndView managerasklist(
		        @RequestParam(name = "page", defaultValue = "1") int page, 
		        @RequestParam(name = "size", defaultValue = "10") int size,
		        @RequestParam(name = "type", required = false) String type
		        ) {

		    if (page < 1) page = 1; 

		    int start = (page - 1) * size; 
		    int totalPosts = ManagerMapper.getcountaskList(type);
		    int totalPages = (int) Math.ceil((double) totalPosts / size);
		    
		    List<ManagerVo> askList = ManagerMapper.getaskList(start, size, type);
		    
		    List<String> askType = ManagerMapper.getType();
		    
		    ModelAndView mv = new ModelAndView();
		    mv.addObject("totalPages", totalPages);
		    mv.addObject("currentPage", page);
		    mv.addObject("size", size);
		    mv.addObject("askList", askList);
		    mv.addObject("askType", askType);
		    mv.addObject("selectedType", type);
		    mv.setViewName("manager/managerasklist");
		    return mv;
		}
		
		// ------------------------고객센터 자주묻는질문 추가-----------------------------//
		@RequestMapping("/ManagerAskWriteForm")
		public ModelAndView manageraskwriteform() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("manager/manageraskwrite");
			return mv;
		}
		
		@RequestMapping(value = "/ManagerAskWrite", method = RequestMethod.POST)
		public ModelAndView cswrite(ManagerVo ManagerVo) {
			ManagerMapper.insertask(ManagerVo);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/Manager/ManagerAsklist");
			return mv;
		}
		
		// ------------------------관리자 자주묻는질문 수정-----------------------------//
		@RequestMapping("/ManagerAskUpdateForm")
		public ModelAndView managerAskUpdateForm(@RequestParam("customer_service_idx") int idx) {
		    ModelAndView mv = new ModelAndView();
		    ManagerVo ManagerVo = ManagerMapper.selectask(idx);
		    mv.addObject("ManagerVo", ManagerVo); 
		    mv.setViewName("manager/manageraskupdate");
		    return mv;
		}

		@RequestMapping(value = "/ManagerAskUpdate", method = RequestMethod.POST)
		public ModelAndView managerAskUpdate(ManagerVo ManagerVo) {
		    ModelAndView mv = new ModelAndView();
		    ManagerMapper.updateask(ManagerVo);
		    mv.setViewName("redirect:/Manager/ManagerAsklist"); 
		    return mv;
		}
		
		// ------------------------관리자 자주묻는질문 삭제-----------------------------//
		@RequestMapping(value = "/ManagerAskDelete", method = RequestMethod.POST)
		public ModelAndView managerAskDelete(@RequestParam("customer_service_idx") int idx) {
		    ModelAndView mv = new ModelAndView();
		    ManagerMapper.deleteAsk(idx);
		    mv.setViewName("redirect:/Manager/ManagerAsklist");
		    return mv;
		}
		
		// ------------------------관리자 문의내역-----------------------------//
		@RequestMapping("/ManagerCsList")
		public ModelAndView managercslist(
				@RequestParam(name = "page", defaultValue = "1") int page, 
		        @RequestParam(name = "size", defaultValue = "10") int size,
		        @RequestParam(name = "type", required = false) String type
				) {
			
			if (page < 1) page = 1;
			
		    int start = (page - 1) * size; 
		    int totalPosts = ManagerMapper.getcountmacsList(type);
		    int totalPages = (int) Math.ceil((double) totalPosts / size);
		    
			List<ManagerVo> macsList = ManagerMapper.getmacsList(start, size, type);
			
			List<String> askType = ManagerMapper.getType();
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("totalPages", totalPages);
		    mv.addObject("currentPage", page);
		    mv.addObject("size", size);
		    mv.addObject("macsList", macsList);
			mv.addObject("askType", askType);
			mv.addObject("selectedType", type);
			mv.setViewName("manager/managercslist");
			return mv;
		}
		
		// ------------------------관리자 문의 답변 및 수정-----------------------------//
			@RequestMapping("/ManagerCsUpdateForm")
			public ModelAndView managerCsUpdateForm(@RequestParam("customer_service_idx") int idx) {
			    ModelAndView mv = new ModelAndView();
			    ManagerVo ManagerVo = ManagerMapper.selectcs(idx);
			    mv.addObject("ManagerVo", ManagerVo); 
			    mv.setViewName("manager/managercsupdate");
			    return mv;
			}

			@RequestMapping(value = "/ManagerCsUpdate", method = RequestMethod.POST)
			public ModelAndView managerCsUpdate(ManagerVo ManagerVo) {
			    ModelAndView mv = new ModelAndView();
			    ManagerMapper.updatecs(ManagerVo);
			    mv.setViewName("redirect:/Manager/ManagerCsList"); 
			    return mv;
			}
		// ------------------------관리자 자주묻는질문 삭제-----------------------------//
		@RequestMapping(value = "/ManagerCsDelete", method = RequestMethod.POST)
		public ModelAndView managerCsDelete(@RequestParam("customer_service_idx") int idx) {
		    ModelAndView mv = new ModelAndView();
		    ManagerMapper.deleteCs(idx);
		    mv.setViewName("redirect:/Manager/ManagerCsList");
		    return mv;
		}

		// ------------------------관리자 공지사항-----------------------------//
		@RequestMapping("/ManagerNoticeList")
		public ModelAndView managernoticelist(
				@RequestParam(name = "page", defaultValue = "1") int page, 
		        @RequestParam(name = "size", defaultValue = "10") int size,
		        @RequestParam(name = "type", required = false) String type
				) {
			
			if (page < 1) page = 1; 

		    int start = (page - 1) * size; 
		    int totalPosts = ManagerMapper.getcountnoticeList(type);
		    int totalPages = (int) Math.ceil((double) totalPosts / size);
		    
			List<ManagerVo> noticeList = ManagerMapper.getnoticeList(start, size, type);

			List<String> noticeType = ManagerMapper.getnoticeType();
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("totalPages", totalPages);
		    mv.addObject("currentPage", page);
		    mv.addObject("size", size);
			mv.addObject("noticeList", noticeList);
			mv.addObject("noticeType", noticeType);
			mv.addObject("selectedType", type);
			mv.setViewName("manager/managernoticelist");
			return mv;
		}
		
		// ------------------------고객센터 공지사항 추가-----------------------------//
			@RequestMapping("/ManagerNoticeWriteForm")
			public ModelAndView managernoticewriteform() {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("manager/managernoticewrite");
				return mv;
			}
			
			@RequestMapping(value = "/ManagerNotieWrite", method = RequestMethod.POST)
			public ModelAndView managernoticewrite(ManagerVo ManagerVo) {
				ManagerMapper.insertnotice(ManagerVo);
				ModelAndView mv = new ModelAndView();
				mv.setViewName("redirect:/Manager/ManagerNoticeList");
				return mv;
			}
		
		// ------------------------관리자 공지사항 수정-----------------------------//
		@RequestMapping("/ManagerNoticeUpdateForm")
		public ModelAndView managerNoticeUpdateForm(@RequestParam("notice_idx") int idx) {
		    ModelAndView mv = new ModelAndView();
		    ManagerVo ManagerVo = ManagerMapper.selectnotice(idx);
		    mv.addObject("ManagerVo", ManagerVo); 
		    mv.setViewName("manager/managernoticeupdate");
		    return mv;
		}

		@RequestMapping(value = "/ManagerNoticeUpdate", method = RequestMethod.POST)
		public ModelAndView managerNoticeUpdate(ManagerVo ManagerVo) {
		    ModelAndView mv = new ModelAndView();
		    ManagerMapper.updatenotice(ManagerVo);
		    mv.setViewName("redirect:/Manager/ManagerNoticeList"); 
		    return mv;
		}
		
		// ------------------------관리자 공지사항 삭제-----------------------------//
			@RequestMapping(value = "/ManagerNoticeDelete", method = RequestMethod.POST)
			public ModelAndView managerNoticeDelete(@RequestParam("notice_idx") int idx) {
			    ModelAndView mv = new ModelAndView();
			    ManagerMapper.deletenotice(idx);
			    mv.setViewName("redirect:/Manager/ManagerNoticeList");
			    return mv;
			}

		// ------------------------관리자 자유게시판-----------------------------//
		@RequestMapping("/ManagerBoardList")
		public ModelAndView managerboardlist() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("manager/managerboardlist");
			return mv;
		}


		// ------------------------관리자 장터-----------------------------//
		@RequestMapping("/ManagerMarketList")
		public ModelAndView managermarketlist() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("manager/managermarketlist");
			return mv;
		}

		
		
		//------------------------커뮤니티 메인화면-----------------------------//
		@RequestMapping("/ManagerAlbumList")
		public ModelAndView manageralbumlist(
		        @RequestParam(name = "page", defaultValue = "1") int page, 
		        @RequestParam(name = "size", defaultValue = "10") int size,
		        @RequestParam(name = "type", required = false) String type
		) {
		    if (page < 1) page = 1; 

		    if (type == null || type.isEmpty()) {
		        type = "latest";
		    }

		    int start = (page - 1) * size; 
		    int totalPosts = ManagerMapper.getcountalbumList();
		    int totalPages = (int) Math.ceil((double) totalPosts / size);

		    List<ManagerVo> albumList = ManagerMapper.getalbumList(start, size, type);
		    
		    ModelAndView mv = new ModelAndView();
		    mv.addObject("totalPages", totalPages);
		    mv.addObject("currentPage", page);
		    mv.addObject("size", size);
		    mv.addObject("albumList", albumList);
		    mv.addObject("selectedType", type);
		    mv.setViewName("manager/manageralbumlist");
		    return mv;
		}
		
		// ------------------------관리자 커뮤니티 삭제-----------------------------//
			@RequestMapping(value = "/ManagerCommunityDelete", method = RequestMethod.POST)
			public ModelAndView deletecommunity(@RequestParam("community_idx") int idx) {
			    ModelAndView mv = new ModelAndView();
			    ManagerMapper.deletecommunity(idx);
			    mv.setViewName("redirect:/Manager/ManagerAlbumList");
			    return mv;
			}
			

}