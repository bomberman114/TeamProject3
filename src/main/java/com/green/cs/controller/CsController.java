package com.green.cs.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.green.cs.mapper.CsMapper;
import com.green.cs.vo.CsVo;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Cs")
public class CsController {
	
	@Value("${part4.upload-path}")
	private String uploadPath;

	@Autowired
	private CsMapper csMapper;
	
	//------------------------고객센터 메인화면-----------------------------//
	// Cs/Cslist (홈)
	@RequestMapping("/Cslist")
	public ModelAndView cslist() {
		// 자주하는 질문 List
		List<CsVo> csList = csMapper.getcsList();
		System.out.println("csList=" + csList);
		
		// 공지사항 List
		List<CsVo> ntList = csMapper.getntList();
		System.out.println("ntList=" + ntList);
				
		ModelAndView mv = new ModelAndView();
		mv.addObject("csList", csList);
		mv.addObject("ntList", ntList);
		mv.setViewName("cs/cslist");
		return mv;
	}
	//------------------------고객센터 검색-----------------------------//
	// Cs/Cssearch (검색)
	@RequestMapping("/Cssearch")
	public ModelAndView cssearch(@RequestParam("searchtext") String searchtext) {
		// 자주하는 질문 List(검색어)
		List<CsVo> csList = csMapper.getsearchList(searchtext);
		System.out.println("csList=" + csList);
		
		// 검색 갯수
		int searchcount = csList.size();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("searchtext", searchtext);
		mv.addObject("searchcount", searchcount);
		mv.addObject("csList", csList);
		mv.setViewName("cs/cssearch");
		return mv;
	}
	//------------------------고객센터 자주하는질문 상세페이지-----------------------------//
	// Cs/Csview (검색)
	@RequestMapping("/Csview")
	public ModelAndView csview(@RequestParam("customer_service_idx") int customer_service_idx) {
		// 자주하는질문 상세페이지
		CsVo vo = csMapper.getfaqList(customer_service_idx);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("cs/csview");
		return mv;
	}
	//------------------------고객센터 문의글 작성-----------------------------//
	// Cs/CswriteForm (문의글 작성)
	@RequestMapping("/CswriteForm")
	public ModelAndView cswriteForm(CsVo csVo, @RequestParam("user_idx") int user_idx) {
		System.out.println("user_idx:" + user_idx);
		
		// 회원정보
	    CsVo vo = csMapper.getminfo(user_idx);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("csVo", csVo);
		mv.addObject("vo", vo);
		mv.addObject("user_idx", user_idx);
		mv.setViewName("cs/cswrite");
		return mv;
		}
	
	// Cs/Cswrite (문의글 작성)
	@RequestMapping(value = "/Cswrite", method = RequestMethod.POST)
	public ModelAndView cswrite(
	        @ModelAttribute CsVo csVo,
	        @RequestParam("user_idx") int user_idx,
	        @RequestParam("customer_service_image_name") MultipartFile[] files,
	        HttpServletRequest request) {
	    // 업로드 경로 설정

	    HashMap<String, Object> map = new HashMap<>();
	    map.put("uploadPath", uploadPath);
	    map.put("csProfile", "csProfile");
	    System.out.println("map: " + uploadPath);
	    // 파일 저장 후 경로와 파일명 저장
	    FileImage.save(map, files);
	    
	    map.get("fileList");
	    System.out.println("fileList::" + map.get("fileList"));
	    
	    // 문의글 저장
	    csMapper.insertcs(csVo);
	    
	    // 사진 저장
	    csMapper.insertcsImage(map);

	    ModelAndView mv = new ModelAndView();
		mv.addObject("user_idx", user_idx);
		mv.addObject("uploadPath", uploadPath);
	    mv.setViewName("redirect:/Cs/Mycslist");
	    return mv;
	}

	//------------------------고객센터 나의 문의내역-----------------------------//
	// Cs/Mycslist (홈)
	@RequestMapping("/Mycslist")
	public ModelAndView mycslist(@RequestParam("user_idx") int user_idx) {
		
		System.out.println("user: " + user_idx);
		// 나의 문의내역 List
		List<CsVo> mycsList = csMapper.getmycsList(user_idx);
		System.out.println("mycsList=" + mycsList);
		
				
		ModelAndView mv = new ModelAndView();
		mv.addObject("mycsList", mycsList);
		mv.setViewName("cs/mycslist");
		return mv;
	}
	//------------------------고객센터 나의 문의내역 상세페이지-----------------------------//
	// Cs/Mycsview (홈)
	@RequestMapping("/Mycsview")
	public ModelAndView mycsview(@RequestParam("customer_service_idx") int customer_service_idx) {
		// 문의내역 상세페이지
		CsVo vo = csMapper.getmycs(customer_service_idx);
		
		// 문의글 답변
		CsVo aw = csMapper.getanswer(customer_service_idx);
		System.out.println("aw=" + aw);
				
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("aw", aw);
		mv.setViewName("cs/mycsview");
		return mv;
	}
	
	//------------------------공지사항 메인화면-----------------------------//
	// Cs/Noticelist (홈)
	@RequestMapping("/Noticelist")
	public ModelAndView noticelist() {
		// 공지사항 List
		List<CsVo> ntList = csMapper.getntList();
		System.out.println("ntList=" + ntList);
				
		ModelAndView mv = new ModelAndView();
		mv.addObject("ntList", ntList);
		mv.setViewName("cs/noticelist");
		return mv;
	}
	//------------------------공지사항 상세페이지-----------------------------//
	// Cs/Noticeview (공지사항 상세페이지)
	@RequestMapping("/Noticeview")
	public ModelAndView noticeview(@RequestParam("notice_idx") int notice_idx) {
		// 공지사항 상세페이지
	    CsVo vo = csMapper.getnotice(notice_idx);
	    
	    // 이전 공지사항
	    CsVo pv = csMapper.getprevious(notice_idx);
	    System.out.println("pv=" + pv);
	    
	    //  다음 공지사항
	    CsVo nt = csMapper.getnext(notice_idx);
	    System.out.println("nt=" + nt);
	    
	    ModelAndView mv = new ModelAndView();
	    mv.addObject("vo", vo);
	    mv.addObject("pv", pv);
	    mv.addObject("nt", nt);
	    mv.setViewName("cs/noticeview");
	    return mv;
	}
	
	//=========================================================================//
		// ------------------------관리자 자주묻는질문-----------------------------//
		@RequestMapping("/ManagerAsklist")
		public ModelAndView managerasklist(
		        @RequestParam(name = "page", defaultValue = "1") int page, 
		        @RequestParam(name = "size", defaultValue = "10") int size
		        ) {

		    if (page < 1) page = 1; 

		    int start = (page - 1) * size; 
		    int totalPosts = csMapper.getcountaskList();
		    int totalPages = (int) Math.ceil((double) totalPosts / size);
		    
		    List<CsVo> askList = csMapper.getaskList(start, size);

		    ModelAndView mv = new ModelAndView();
		    mv.addObject("totalPages", totalPages);
		    mv.addObject("currentPage", page);
		    mv.addObject("size", size);
		    mv.addObject("askList", askList);
		    mv.setViewName("cs/managerasklist");
		    return mv;
		}
		
		// ------------------------고객센터 자주묻는질문 추가-----------------------------//
		@RequestMapping("/ManagerAskWriteForm")
		public ModelAndView manageraskwriteform() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("cs/manageraskwrite");
			return mv;
		}
		
		@RequestMapping(value = "/ManagerAskWrite", method = RequestMethod.POST)
		public ModelAndView cswrite(CsVo csVo) {
			csMapper.insertask(csVo);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/Cs/ManagerAsklist");
			return mv;
		}
		
		// ------------------------관리자 자주묻는질문 수정-----------------------------//
		@RequestMapping("/ManagerAskUpdateForm")
		public ModelAndView managerAskUpdateForm(@RequestParam("customer_service_idx") int idx) {
		    ModelAndView mv = new ModelAndView();
		    CsVo csVo = csMapper.selectask(idx);
		    mv.addObject("csVo", csVo); 
		    mv.setViewName("cs/manageraskupdate");
		    return mv;
		}

		@RequestMapping(value = "/ManagerAskUpdate", method = RequestMethod.POST)
		public ModelAndView managerAskUpdate(CsVo csVo) {
		    ModelAndView mv = new ModelAndView();
		    csMapper.updateask(csVo);
		    mv.setViewName("redirect:/Cs/ManagerAsklist"); 
		    return mv;
		}
		
		// ------------------------관리자 자주묻는질문 삭제-----------------------------//
		@RequestMapping(value = "/ManagerAskDelete", method = RequestMethod.POST)
		public ModelAndView managerAskDelete(@RequestParam("customer_service_idx") int idx) {
		    ModelAndView mv = new ModelAndView();
		    csMapper.deleteAsk(idx);
		    mv.setViewName("redirect:/Cs/ManagerAsklist");
		    return mv;
		}
		
		// ------------------------관리자 문의내역-----------------------------//
		@RequestMapping("/ManagerCsList")
		public ModelAndView managercslist(
				@RequestParam(name = "page", defaultValue = "1") int page, 
		        @RequestParam(name = "size", defaultValue = "10") int size
				) {
			
			if (page < 1) page = 1; 

		    int start = (page - 1) * size; 
		    int totalPosts = csMapper.getcountmacsList();
		    int totalPages = (int) Math.ceil((double) totalPosts / size);
		    
			List<CsVo> macsList = csMapper.getmacsList(start, size);
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("totalPages", totalPages);
		    mv.addObject("currentPage", page);
		    mv.addObject("size", size);
			mv.addObject("macsList", macsList);
			mv.setViewName("cs/managercslist");
			return mv;
		}

		// ------------------------관리자 공지사항-----------------------------//
		@RequestMapping("/ManagerNoticeList")
		public ModelAndView managernoticelist(
				@RequestParam(name = "page", defaultValue = "1") int page, 
		        @RequestParam(name = "size", defaultValue = "10") int size
				) {
			
			if (page < 1) page = 1; 

		    int start = (page - 1) * size; 
		    int totalPosts = csMapper.getcountnoticeList();
		    int totalPages = (int) Math.ceil((double) totalPosts / size);
		    
			List<CsVo> noticeList = csMapper.getnoticeList(start, size);
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("totalPages", totalPages);
		    mv.addObject("currentPage", page);
		    mv.addObject("size", size);
			mv.addObject("noticeList", noticeList);
			mv.setViewName("cs/managernoticelist");
			return mv;
		}
		
		// ------------------------고객센터 공지사항 추가-----------------------------//
			@RequestMapping("/ManagerNoticeWriteForm")
			public ModelAndView managernoticewriteform() {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("cs/managernoticewrite");
				return mv;
			}
			
			@RequestMapping(value = "/ManagerNotieWrite", method = RequestMethod.POST)
			public ModelAndView managernoticewrite(CsVo csVo) {
				csMapper.insertnotice(csVo);
				ModelAndView mv = new ModelAndView();
				mv.setViewName("redirect:/Cs/ManagerNoticeList");
				return mv;
			}
		
		// ------------------------관리자 공지사항 수정-----------------------------//
		@RequestMapping("/ManagerNoticeUpdateForm")
		public ModelAndView managerNoticeUpdateForm(@RequestParam("notice_idx") int idx) {
		    ModelAndView mv = new ModelAndView();
		    CsVo csVo = csMapper.selectnotice(idx);
		    mv.addObject("csVo", csVo); 
		    mv.setViewName("cs/managernoticeupdate");
		    return mv;
		}

		@RequestMapping(value = "/ManagerNoticeUpdate", method = RequestMethod.POST)
		public ModelAndView managerNoticeUpdate(CsVo csVo) {
		    ModelAndView mv = new ModelAndView();
		    csMapper.updatenotice(csVo);
		    mv.setViewName("redirect:/Cs/ManagerNoticeList"); 
		    return mv;
		}
		
		// ------------------------관리자 공지사항 삭제-----------------------------//
			@RequestMapping(value = "/ManagerNoticeDelete", method = RequestMethod.POST)
			public ModelAndView managerNoticeDelete(@RequestParam("notice_idx") int idx) {
			    ModelAndView mv = new ModelAndView();
			    csMapper.deletenotice(idx);
			    mv.setViewName("redirect:/Cs/ManagerNoticeList");
			    return mv;
			}

		// ------------------------관리자 자유게시판-----------------------------//
		@RequestMapping("/ManagerBoardList")
		public ModelAndView managerboardlist() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("cs/managerboardlist");
			return mv;
		}

		// ------------------------관리자 조립앨범-----------------------------//
		@RequestMapping("/ManagerAlbumList")
		public ModelAndView manageralbumlist() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("cs/manageralbumlist");
			return mv;
		}

		// ------------------------관리자 장터-----------------------------//
		@RequestMapping("/ManagerMarketList")
		public ModelAndView managermarketlist() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("cs/managermarketlist");
			return mv;
		}


}