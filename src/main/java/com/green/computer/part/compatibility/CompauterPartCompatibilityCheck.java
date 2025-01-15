package com.green.computer.part.compatibility;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;

import com.green.product.mapper.ProductMapper;

public class CompauterPartCompatibilityCheck {
	@Autowired
	private static ProductMapper productMapper;

	public static HashMap<String, Object> compauterPartCompatibilityCheck(List<HashMap<String, Object>> computerPart) {
		HashMap<String, Object> map2 = new HashMap<>();
		List<HashMap<String, Object>> filteredParts = new ArrayList<>();
		// CATEGORY_IDX가 5인 모든 항목을 찾기
		int categoryCpuIdx = 5;
		int categoryMotherBoardIdx = 6;
		int categoryRamIdx = 7;
		int categoryGpuIdx = 8;
		int categoryCaseIdx = 12;
		int categoryPowerIdx = 13;
		for (HashMap<String, Object> part1 : computerPart) {
			if (part1.get("CATEGORY_IDX") != null) {

				int categoryIdx1 = Integer.parseInt(String.valueOf(part1.get("CATEGORY_IDX")));
				if (categoryIdx1 == categoryCpuIdx) {
					map2.put("categoryCpu", part1);
					for (HashMap<String, Object> part2 : computerPart) {
						int categoryIdx2 = Integer.parseInt(String.valueOf(part2.get("CATEGORY_IDX")));
						if (categoryIdx2 == categoryMotherBoardIdx) {

							map2.put("categoryMotherBoard", part2);
							System.out.println("호환성38번줄:" + map2);
							map2 = checkCompatibilityBetweenCpuAndMotherboard(map2);
						}
						if (categoryIdx2 == categoryRamIdx) {
							System.out.println("호환성43번줄:" + map2);
							map2.put("categoryRam", part2);
							map2 = checkCompatibilityBetweenCpuAndRam(map2);
						}
						if (categoryIdx2 == categoryGpuIdx) {
							map2.put("categoryGpu", part2);
							map2 = checkCompatibilityBetweenCpuAndGpu(map2);
							for (HashMap<String, Object> part3 : computerPart) {
								int categoryIdx3 = Integer.parseInt(String.valueOf(part3.get("CATEGORY_IDX")));
								if (categoryIdx3 == categoryPowerIdx) {

									map2.put("categoryPower", part3);
									map2 = checkCompatibilityBetweenPowerAndGpu(map2);
								}

							}
						}
					}
				}
				if (categoryIdx1 == categoryMotherBoardIdx) {
					map2.put("categoryMotherBoard", part1);
					for (HashMap<String, Object> part2 : computerPart) {
						int categoryIdx2 = Integer.parseInt(String.valueOf(part2.get("CATEGORY_IDX")));
						if (categoryIdx1 == categoryCpuIdx) {
							map2.put("categoryCpu", part1);
							map2 = checkCompatibilityBetweenCpuAndMotherboard(map2);
						}
						if (categoryIdx2 == categoryRamIdx) {

							map2.put("categoryRam", part2);
							map2 = checkCompatibilityBetweenMotherboardAndRam(map2);
						}
						if (categoryIdx2 == categoryCaseIdx) {

							map2.put("categoryCase", part2);
							map2 = checkCompatibilityBetweenMotherboardAndDesktopCase(map2);
						}
					}
				}
				if (categoryIdx1 == categoryRamIdx) {
					map2.put("categoryRam", part1);
					for (HashMap<String, Object> part2 : computerPart) {
						int categoryIdx2 = Integer.parseInt(String.valueOf(part2.get("CATEGORY_IDX")));
						if (categoryIdx2 == categoryCpuIdx) {
							map2.put("categoryCpu", part2);
							map2 = checkCompatibilityBetweenCpuAndRam(map2);
						}
						if (categoryIdx2 == categoryMotherBoardIdx) {

							map2.put("categoryMotherBoard", part2);
							map2 = checkCompatibilityBetweenMotherboardAndRam(map2);
						}
					}

				}
				if (categoryIdx1 == categoryGpuIdx) {
					map2.put("categoryGpu", part1);
					for (HashMap<String, Object> part2 : computerPart) {
						int categoryIdx2 = Integer.parseInt(String.valueOf(part2.get("CATEGORY_IDX")));
						if (categoryIdx2 == categoryCaseIdx) {

							map2.put("categoryCase", part2);
							map2 = checkCompatibilityBetweenDesktopCaseAndGpu(map2);
						}
						if (categoryIdx2 == categoryCpuIdx) {

							map2.put("categoryCpu", part2);
							map2 = checkCompatibilityBetweenCpuAndGpu(map2);
						}
						if (categoryIdx2 == categoryPowerIdx) {

							map2.put("categoryPower", part2);
							for (HashMap<String, Object> part3 : computerPart) {
								int categoryIdx3 = Integer.parseInt(String.valueOf(part3.get("CATEGORY_IDX")));
								if (categoryIdx3 == categoryCpuIdx) {

									map2.put("categoryCpu", part3);
									map2 = checkCompatibilityBetweenPowerAndGpu(map2);
								}
							}
						}
					}

				}
				if (categoryIdx1 == categoryCaseIdx) {
					map2.put("categoryCase", part1);
					for (HashMap<String, Object> part2 : computerPart) {
						int categoryIdx2 = Integer.parseInt(String.valueOf(part2.get("CATEGORY_IDX")));
						if (categoryIdx2 == categoryPowerIdx) {

							map2.put("categoryPower", part2);
							map2 = checkCompatibilityBetweenDesktopCaseAndPower(map2);
						}
						if (categoryIdx2 == categoryGpuIdx) {

							map2.put("categoryGpu", part2);
							map2 = checkCompatibilityBetweenDesktopCaseAndGpu(map2);
						}
					}
				}
				if (categoryIdx1 == categoryPowerIdx) {
					map2.put("categoryPower", part1);
					for (HashMap<String, Object> part2 : computerPart) {
						int categoryIdx2 = Integer.parseInt(String.valueOf(part2.get("CATEGORY_IDX")));
						if (categoryIdx2 == categoryCaseIdx) {

							map2.put("categoryCase", part2);
							map2 = checkCompatibilityBetweenDesktopCaseAndPower(map2);
						}
						if (categoryIdx2 == categoryCpuIdx) {

							map2.put("categoryCpu", part2);
							for (HashMap<String, Object> part3 : computerPart) {
								int categoryIdx3 = Integer.parseInt(String.valueOf(part3.get("CATEGORY_IDX")));
								if (categoryIdx3 == categoryGpuIdx) {

									map2.put("categoryGpu", part3);
									map2 = checkCompatibilityBetweenPowerAndGpu(map2);
								}
							}
						}
					}
				}
			}
		}

		// CPU와 메인보드 호환성 체크
		Boolean checkCompatibilityBetweenCpuAndMotherboardResult = (Boolean) map2
				.get("checkCompatibilityBetweenCpuAndMotherboard");
		if (checkCompatibilityBetweenCpuAndMotherboardResult == null) {
			checkCompatibilityBetweenCpuAndMotherboardResult = false; // null일 경우 false로 설정
		}
		Double cpuAndMotherboardScore = (Double) map2.get("cpuAndMotherboardScore");
		if (cpuAndMotherboardScore == null) {
			cpuAndMotherboardScore = 0.0; // null일 경우 0으로 설정
		}

		// CPU와 RAM 호환성 체크
		Boolean checkCompatibilityBetweenCpuAndRamResult = (Boolean) map2.get("checkCompatibilityBetweenCpuAndRam");
		if (checkCompatibilityBetweenCpuAndRamResult == null) {
			checkCompatibilityBetweenCpuAndRamResult = false; // null일 경우 false로 설정
		}
		Double compatibilityBetweenCpuAndRamScore = (Double) map2.get("compatibilityBetweenCpuAndRamScore");
		if (compatibilityBetweenCpuAndRamScore == null) {
			compatibilityBetweenCpuAndRamScore = 0.0; // null일 경우 0으로 설정
		}

		// 메인보드와 RAM 호환성 체크
		Boolean checkCompatibilityBetweenMotherboardAndRamResult = (Boolean) map2
				.get("compatibilityBetweenMotherboardAndRam");
		if (checkCompatibilityBetweenMotherboardAndRamResult == null) {
			checkCompatibilityBetweenMotherboardAndRamResult = false; // null일 경우 false로 설정
		}
		Double compatibilityBetweenMotherboardAndRamScore = (Double) map2
				.get("compatibilityBetweenMotherboardAndRamScore");
		if (compatibilityBetweenMotherboardAndRamScore == null) {
			compatibilityBetweenMotherboardAndRamScore = 0.0; // null일 경우 0으로 설정
		}

		// 메인보드와 데스크탑 케이스 호환성 체크
		Boolean checkCompatibilityBetweenMotherboardAndDesktopCaseResult = (Boolean) map2
				.get("compatibilityBetweenMotherboardAndDesktopCase");
		if (checkCompatibilityBetweenMotherboardAndDesktopCaseResult == null) {
			checkCompatibilityBetweenMotherboardAndDesktopCaseResult = false; // null일 경우 false로 설정
		}
		Double compatibilityBetweenMotherboardAndDesktopCaseScore = (Double) map2
				.get("compatibilityBetweenMotherboardAndDesktopCaseScore");
		if (compatibilityBetweenMotherboardAndDesktopCaseScore == null) {
			compatibilityBetweenMotherboardAndDesktopCaseScore = 0.0; // null일 경우 0으로 설정
		}

		// 데스크탑 케이스와 파워 호환성 체크
		Boolean checkCompatibilityBetweenDesktopCaseAndPowerResult = (Boolean) map2
				.get("compatibilityBetweenDesktopCaseAndPower");
		if (checkCompatibilityBetweenDesktopCaseAndPowerResult == null) {
			checkCompatibilityBetweenDesktopCaseAndPowerResult = false; // null일 경우 false로 설정
		}
		Double compatibilityBetweenDesktopCaseAndPowerScore = (Double) map2
				.get("compatibilityBetweenDesktopCaseAndPowerScore");
		if (compatibilityBetweenDesktopCaseAndPowerScore == null) {
			compatibilityBetweenDesktopCaseAndPowerScore = 0.0; // null일 경우 0으로 설정
		}

		// 데스크탑 케이스와 GPU 호환성 체크
		Boolean checkCompatibilityBetweenDesktopCaseAndGpuResult = (Boolean) map2
				.get("compatibilityBetweenDesktopCaseAndGpu");
		if (checkCompatibilityBetweenDesktopCaseAndGpuResult == null) {
			checkCompatibilityBetweenDesktopCaseAndGpuResult = false; // null일 경우 false로 설정
		}
		Double compatibilityBetweenDesktopCaseAndGpuScore = (Double) map2
				.get("compatibilityBetweenDesktopCaseAndGpuScore");
		if (compatibilityBetweenDesktopCaseAndGpuScore == null) {
			compatibilityBetweenDesktopCaseAndGpuScore = 0.0; // null일 경우 0으로 설정
		}

		// 파워와 GPU 호환성 체크
		Boolean checkCompatibilityBetweenPowerAndGpuResult = (Boolean) map2.get("compatibilityBetweenPowerAndGpu");
		if (checkCompatibilityBetweenPowerAndGpuResult == null) {
			checkCompatibilityBetweenPowerAndGpuResult = false; // null일 경우 false로 설정
		}
		Double compatibilityBetweenPowerAndGpuScore = (Double) map2.get("compatibilityBetweenPowerAndGpuScore");
		if (compatibilityBetweenPowerAndGpuScore == null) {
			compatibilityBetweenPowerAndGpuScore = 0.0; // null일 경우 0으로 설정
		}

		// CPU와 GPU 점수
		Double cpuGpuScore = (Double) map2.get("cpuGpuScore");
		if (cpuGpuScore == null) {
			cpuGpuScore = 0.0; // null일 경우 0으로 설정
		}

		// 이후 점수 계산 및 처리

		double totalScore = 0;
		double maxScore = 0;
		double normalizedScore = 0;
		double totalScoreCpuMotherboard = 0;
		double totalScoreCpuRam = 0;
		double totalScoreMotherboardRam = 0;
		double totalScoreGpuDesktopCase = 0;
		double totalScorePowerGpu = 0;
		double totalScoreMotherboardDesktopCase = 0;
		double totalScoredesktopCasePower = 0;
		double totalScoreCpuGpuScore = 0;

		// 각 항목의 가중치와 점수 계산
		double cpuMotherboardWeight = 5.0;
		totalScoreCpuMotherboard = cpuMotherboardWeight * cpuAndMotherboardScore;
		double maxScoreCpuMotherboard = cpuMotherboardWeight * 3; // max score is 3

		double cpuRamWeight = 5.0; // CPU와 RAM 호환성 가중치
		totalScoreCpuRam = cpuRamWeight * compatibilityBetweenCpuAndRamScore;
		double maxScoreCpuRam = cpuRamWeight * 3; // max score is 3

		double motherboardRamWeight = 5.0;
		totalScoreMotherboardRam = motherboardRamWeight * compatibilityBetweenMotherboardAndRamScore;
		double maxScoreMotherboardRam = motherboardRamWeight * 3;

		double gpuDesktopCaseWeight = 5.0;
		totalScoreGpuDesktopCase = gpuDesktopCaseWeight * compatibilityBetweenDesktopCaseAndGpuScore;
		double maxScoreGpuDesktopCase = gpuDesktopCaseWeight * 3;

		double powerCompatibilityWeight = 5.0;
		totalScorePowerGpu = powerCompatibilityWeight * compatibilityBetweenPowerAndGpuScore;
		double maxScorePowerGpu = powerCompatibilityWeight * 3;

		double caseSizeWeight = 4.0; // 메인보드와 케이스 크기 가중치
		totalScoreMotherboardDesktopCase = caseSizeWeight * compatibilityBetweenMotherboardAndDesktopCaseScore;
		double maxScoreMotherboardDesktopCase = caseSizeWeight * 3;

		double desktopCasePowerWeight = 4.0; // 데스크탑 케이스와 파워 호환성 가중치
		totalScoredesktopCasePower = desktopCasePowerWeight * compatibilityBetweenDesktopCaseAndPowerScore;
		double maxScoredesktopCasePower = desktopCasePowerWeight * 3;

		double cpuGpuScoreWeight = 3;
		totalScoreCpuGpuScore = cpuGpuScoreWeight * cpuGpuScore;
		double maxScorecpuGpuScore = cpuGpuScoreWeight * 3;

		// 모든 호환성 체크를 AND 조건으로 결합
		if (checkCompatibilityBetweenCpuAndMotherboardResult && checkCompatibilityBetweenCpuAndRamResult
				&& checkCompatibilityBetweenMotherboardAndRamResult
				&& checkCompatibilityBetweenMotherboardAndDesktopCaseResult
				&& checkCompatibilityBetweenDesktopCaseAndPowerResult
				&& checkCompatibilityBetweenDesktopCaseAndGpuResult && checkCompatibilityBetweenPowerAndGpuResult) {

			// 모든 부품이 호환될 때 점수 계산
			System.out.println("모든 부품이 호환됩니다.");
			// 점수 초기화 및 가중치 설정

			// 점수 정규화
			totalScore = totalScoreCpuMotherboard + totalScoreCpuRam + totalScoreMotherboardRam
					+ totalScoreGpuDesktopCase + totalScorePowerGpu + totalScoreMotherboardDesktopCase
					+ totalScoredesktopCasePower + totalScoreCpuGpuScore;
			maxScore = maxScoreCpuMotherboard + maxScoreCpuRam + maxScoreMotherboardRam + maxScoreGpuDesktopCase
					+ maxScorePowerGpu + maxScoreMotherboardDesktopCase + maxScoredesktopCasePower
					+ maxScorecpuGpuScore;
			normalizedScore = (totalScore / maxScore) * 100;

		}
		// 결과를 맵에 저장
		map2.put("totalScoreCpuMotherboard", totalScoreCpuMotherboard);
		map2.put("totalScoreCpuRam", totalScoreCpuRam);
		map2.put("totalScoreMotherboardRam", totalScoreMotherboardRam);
		map2.put("totalScoreGpuDesktopCase", totalScoreGpuDesktopCase);
		map2.put("totalScorePowerGpu", totalScorePowerGpu);
		map2.put("totalScoreMotherboardDesktopCase", totalScoreMotherboardDesktopCase);
		map2.put("totalScoredesktopCasePower", totalScoredesktopCasePower);
		map2.put("totalScoreCpuGpuScore", totalScoreCpuGpuScore);
		map2.put("totalScore", totalScore);
		map2.put("normalizedScore", normalizedScore);

		return map2;
	}

	private static HashMap<String, Object> checkCompatibilityBetweenCpuAndGpu(HashMap<String, Object> map) {
		HashMap<String, Object> cpuMap = new HashMap<>();
		HashMap<String, Object> gpuMap = new HashMap<>();
		cpuMap = (HashMap<String, Object>) map.get("categoryCpu");
		gpuMap = (HashMap<String, Object>) map.get("categoryGpu");
		String cpuMapProductName = String.valueOf(cpuMap.get("PRODUCT_NAME"));
		String gpuMapProductName = String.valueOf(gpuMap.get("PRODUCT_NAME"));
		double cpuGpuScore = 1; // 기본 점수 1점 (호환성 있는 경우)
		if (cpuMapProductName.contains("인텔")) {
			if (gpuMapProductName.contains("지포스")) {
				cpuGpuScore = 3;
			}
			if (gpuMapProductName.contains("라데온")) {
				cpuGpuScore = 1;
			}
		}
		if (cpuMapProductName.contains("AMD")) {
			if (gpuMapProductName.contains("지포스")) {
				cpuGpuScore = 1;
			}
			if (gpuMapProductName.contains("라데온")) {
				cpuGpuScore = 3;
			}
		}
		map.put("cpuGpuScore", cpuGpuScore);
		return map;
	}

	private static HashMap<String, Object> checkCompatibilityBetweenCpuAndMotherboard(HashMap<String, Object> map) {
		Boolean check = false;
		HashMap<String, Object> cpuMap = new HashMap<>();
		HashMap<String, Object> motherBoardMap = new HashMap<>();
		cpuMap = (HashMap<String, Object>) map.get("categoryCpu");
		motherBoardMap = (HashMap<String, Object>) map.get("categoryMotherBoard");
		String cpuMapProductDescription = String.valueOf(cpuMap.get("PRODUCT_DESCRIPTION"));
		String cpuMapProductName = String.valueOf(cpuMap.get("PRODUCT_NAME"));
		System.out.println("호환성286번줄:" + cpuMapProductName);
		System.out.println("호환성287번줄:" + cpuMap);
		String motherBoardMapProductDescription = String.valueOf(motherBoardMap.get("PRODUCT_DESCRIPTION"));

		String cpuSocketType = socketCkeck(cpuMapProductDescription);
		String motherboardSocketType = socketCkeck(motherBoardMapProductDescription);
		String motherboardChipset = motherboardChipset(motherBoardMapProductDescription);
		String cpuTypeName = cpuTypeName(cpuMapProductName);
		double motherboardScore = 0; // 기본 점수 1점 (호환성 있는 경우)

		// 소켓 타입 체크
		if (cpuSocketType.equals(motherboardSocketType)) {
			check = true;
			motherboardScore = 1;
			// CPU 타입에 따른 점수 조정
			if (cpuTypeName.contains("울트라") || cpuTypeName.contains("9") || cpuTypeName.contains("7")) {
				if (motherboardChipset.contains("X") || motherboardChipset.contains("Z")) {
					motherboardScore = 3; // 최상위 호환성
				}
				if (motherboardChipset.contains("b")) {
					motherboardScore = 2; // 중간 호환성
				}

			}
			if (cpuTypeName.contains("5") || cpuTypeName.contains("3")) {
				if (motherboardChipset.contains("X") || motherboardChipset.contains("Z")) {
					motherboardScore = 2; // 중간 호환성
				}
				if (motherboardChipset.contains("B")) {
					motherboardScore = 3; // 최상위 호환성
				}
			}
		}
		System.out.println(motherboardScore);
		// 점수와 호환성 정보 저장
		map.put("checkCompatibilityBetweenCpuAndMotherboard", check);
		map.put("cpuAndMotherboardScore", motherboardScore);

		return map;
	}

	private static String cpuTypeName(String cpuMapProductName) {
		String cpuType = null;
		String pattern = null;
		int categoryAttributeIdx = 5;
		System.out.println(cpuMapProductName);
		HashMap<String, Object> map = new HashMap<>();
		map.put("categoryAttributeIdx", categoryAttributeIdx);
		// List<HashMap<String, Object>> list =
		// productMapper.getCategoryAttributeValueList(map);
		if (cpuMapProductName.contains("AMD")) {
			pattern = "AMD\\s+(라이젠\\d+[-\\d]*)"; // AMD 프로세서 이름 패턴
		}
		if (cpuMapProductName.contains("인텔")) {
			pattern = "인텔\\s+(코어\\s*울트라\\d+|코어\\w+\\d+)"; // 인텔 프로세서 이름 패턴
		}
		Pattern regex = Pattern.compile(pattern);
		Matcher matcher = regex.matcher(cpuMapProductName);
		if (matcher.find()) {
			cpuType = matcher.group(1); // 첫 번째 캡처 그룹 반환
		}
		System.out.println("347번줄:" + cpuType);
		return cpuType;
	}

	private static String motherboardChipset(String motherboardChipset) {
		int categoryAttributeIdx = 18;
		HashMap<String, Object> map = new HashMap<>();
		map.put("categoryAttributeIdx", categoryAttributeIdx);
		String boardName = null;
		// 문자열을 "/"로 구분하여 배열로 변환
		String[] parts = motherboardChipset.split("/"); // 각 보드 정보를 구분

		// 두 번째 보드 정보 추출
		if (parts.length > 1) { // 두 번째 보드 정보가 존재하는지 확인
			String secondBoard = parts[1]; // 두 번째 보드 정보
			boardName = secondBoard.split(" ")[1]; // 보드 이름 추출 (두 번째 단어)
			System.out.println("두 번째 보드 정보: " + boardName.trim()); // "AMD B650"
		}
		System.out.println("365번줄:" + boardName);
		return boardName;
	}

	private static String socketCkeck(String productDescription) {
		// 정규 표현식 패턴 설정

		// 정규 표현식 패턴
		// 정규 표현식 패턴
		String pattern = "\\(소켓([^)]+)\\)";
		Pattern regex = Pattern.compile(pattern);
		Matcher matcher = regex.matcher(productDescription);

		// 결과 변수
		String result = null;

		// 매칭되는 부분을 찾고 결과 저장
		if (matcher.find()) {
			result = matcher.group(0); // "소켓"과 그 뒤의 문자들을 저장
		}

		// 결과 출력
		if (result != null) {
			System.out.println("찾은 소켓 정보: " + result);
		}
		return result.trim();
	};

	private static HashMap<String, Object> checkCompatibilityBetweenCpuAndRam(HashMap<String, Object> map) {
		Boolean check = false;
		HashMap<String, Object> cpuMap = new HashMap<>();
		HashMap<String, Object> RamMap = new HashMap<>();
		cpuMap = (HashMap<String, Object>) map.get("categoryCpu");
		RamMap = (HashMap<String, Object>) map.get("categoryRam");
		String cpuMapProductDescription = String.valueOf(cpuMap.get("PRODUCT_DESCRIPTION"));
		String RamMapProductDescription = String.valueOf(RamMap.get("PRODUCT_DESCRIPTION"));
		// String cpuRamYype = String.valueOf(map.get("CPU_RAM_TYPE"));
		// String ramType = String.valueOf(map.get("RAM_TYPE"));
		String cpuRamType = memoryType(cpuMapProductDescription);
		String ramType = memoryType(RamMapProductDescription);
		System.out.println("427번줄:" + cpuRamType);
		System.out.println("428번줄:" + ramType);
		double compatibilityBetweenCpuAndRamScore = 0;
		if (cpuRamType.equals(ramType)) {
			check = true;
			compatibilityBetweenCpuAndRamScore = 3;

		}
		map.put("checkCompatibilityBetweenCpuAndRam", check);
		map.put("compatibilityBetweenCpuAndRamScore", compatibilityBetweenCpuAndRamScore);
		return map;
	};

	private static String memoryType(String productDescription) {
		String memoryTypeResult = null;

		if (productDescription.contains("DDR4")) {
			memoryTypeResult = "DDR4";
		}
		if (productDescription.contains("DDR5")) {
			memoryTypeResult = "DDR5";
		}
		return memoryTypeResult;
	}

	private static HashMap<String, Object> checkCompatibilityBetweenMotherboardAndRam(HashMap<String, Object> map) {
		Boolean check = false;
		double compatibilityBetweenMotherboardAndRamScore = 0;
		HashMap<String, Object> motherboardMap = new HashMap<>();
		HashMap<String, Object> RamMap = new HashMap<>();
		motherboardMap = (HashMap<String, Object>) map.get("categoryMotherBoard");
		RamMap = (HashMap<String, Object>) map.get("categoryRam");
		String motherBoardMapProductDescription = String.valueOf(motherboardMap.get("PRODUCT_DESCRIPTION"));
		String ramMapProductDescription = String.valueOf(RamMap.get("PRODUCT_DESCRIPTION"));
		String ramMapProductName = String.valueOf(RamMap.get("PRODUCT_NAME"));

		String motherboardMemoryType = memoryType(motherBoardMapProductDescription);
		int motherboardMemorySlots = motherboardMemorySlots(motherBoardMapProductDescription);
		int motherboardMaximumMemorySize = motherboardMaximumMemorySize(motherBoardMapProductDescription);
		String ramType = memoryType(ramMapProductDescription);
		int ramCount = RamCount(ramMapProductDescription);
		int ramCapacity = ramCapacity(ramMapProductName);
		int ramTotalCapacity = ramCapacity * ramCount; // 램총용량
		if (motherboardMemoryType.equals(ramType) && motherboardMemorySlots >= ramCount
				&& motherboardMaximumMemorySize >= ramTotalCapacity) {
			check = true;
			compatibilityBetweenMotherboardAndRamScore = 1;
			if ((ramCount % 2) == 0) {
				compatibilityBetweenMotherboardAndRamScore = 2;
				if (ramType.equals("DDR5")) {
					compatibilityBetweenMotherboardAndRamScore = 3;
				}
			}
			if ((ramCount % 2) == 1) {
				compatibilityBetweenMotherboardAndRamScore = 1;
				if (ramType.equals("DDR5")) {
					compatibilityBetweenMotherboardAndRamScore = 2;

				}
			}
		}
		map.put("compatibilityBetweenMotherboardAndRamScore", compatibilityBetweenMotherboardAndRamScore);
		map.put("compatibilityBetweenMotherboardAndRam", check);
		return map;
	};

	private static int ramCapacity(String productName) {

		// 정규 표현식 패턴 설정 (숫자와 G 또는 GB를 찾기)
		String regex = "(\\d+)(G(B)?)"; // 숫자와 G 또는 GB를 찾는 패턴
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(productName);

		// 결과 변수
		int minCapacity = Integer.MAX_VALUE; // 최소 용량을 저장할 변수
		// 매칭되는 부분을 찾아서 최소값 저장
		while (matcher.find()) {
			int capacity = Integer.parseInt(matcher.group(1)); // 숫자 부분만 추출
			if (capacity < minCapacity) {
				minCapacity = capacity; // 최소값 업데이트
			}
		}
		// 결과 출력
		if (minCapacity != Integer.MAX_VALUE) {
			// System.out.println("찾은 최소 메모리 용량: " + minCapacity + "G");
			return minCapacity;
		} else {
			// System.out.println("메모리 용량 정보가 없습니다.");
			return 0;
		}

	};

	private static int motherboardMaximumMemorySize(String productDescription) {
		// 정규 표현식 패턴 설정
		String regex = "메모리 용량:\\s*최대\\s*(\\d+)GB"; // 숫자와 "GB"를 찾는 패턴
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(productDescription);

		// 결과 변수
		int memoryCapacity = 0;

		// 매칭되는 부분을 찾고 결과 저장
		if (matcher.find()) {
			memoryCapacity = Integer.parseInt(matcher.group(1)); // 숫자 부분만 저장
		}
		return memoryCapacity;
	}

	private static int RamCount(String productDescription) {
		// 정규 표현식 패턴 설정
		String regex = "램개수:\\s*(\\d+)개"; // "램개수:" 다음에 오는 숫자를 찾는 패턴
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(productDescription);

		// 결과 변수
		int ramCount = 0;

		// 매칭되는 부분을 찾고 결과 저장
		if (matcher.find()) {
			ramCount = Integer.parseInt(matcher.group(1)); // 숫자 부분만 저장
		}

		return ramCount;
	}

	private static int motherboardMemorySlots(String productDescription) {
		// 정규 표현식 패턴 설정
		String regex = "\\[메모리\\]\\s*.*?/(\\d+)개"; // "메모리"와 그 뒤의 숫자를 찾는 패턴
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(productDescription);

		// 결과 변수
		int memorySlots = 0;

		// 매칭되는 부분을 찾고 결과 저장
		if (matcher.find()) {
			memorySlots = Integer.parseInt(matcher.group(1)); // 숫자 부분을 저장
		}

		return memorySlots;
	}

	private static HashMap<String, Object> checkCompatibilityBetweenMotherboardAndDesktopCase(
			HashMap<String, Object> map) {
		Boolean check = false;
		double compatibilityBetweenMotherboardAndDesktopCaseScore = 0;
		HashMap<String, Object> motherboardMap = new HashMap<>();
		HashMap<String, Object> desktopCaseMap = new HashMap<>();
		motherboardMap = (HashMap<String, Object>) map.get("categoryMotherBoard");
		desktopCaseMap = (HashMap<String, Object>) map.get("categoryCase");
		String motherBoardMapProductDescription = String.valueOf(motherboardMap.get("PRODUCT_DESCRIPTION"));
		String desktopCaseMapProductDescription = String.valueOf(desktopCaseMap.get("PRODUCT_DESCRIPTION"));
		String motherboardFormFactor = motherboardFormFactor(motherBoardMapProductDescription);
		String desktopCaseSupportedBoard = desktopCaseSupportedBoard(desktopCaseMapProductDescription);
		if (desktopCaseSupportedBoard.contains(motherboardFormFactor)) {
			check = true;
			compatibilityBetweenMotherboardAndDesktopCaseScore = 3;
		}
		map.put("compatibilityBetweenMotherboardAndDesktopCaseScore",
				compatibilityBetweenMotherboardAndDesktopCaseScore);
		map.put("compatibilityBetweenMotherboardAndDesktopCase", check);
		return map;
	};

	private static String motherboardFormFactor(String motherBoardMapProductDescription) {
		String motherboardFormFactor = null;
		if (motherBoardMapProductDescription.contains("M-ATX")) {
			motherboardFormFactor = "M-ATX";
		}
		if (motherBoardMapProductDescription.contains("ATX")) {
			motherboardFormFactor = "ATX";
		}

		return motherboardFormFactor;
	}

	private static String desktopCaseSupportedBoard(String productDescription) {
		String desktopCaseSupportedBoard = ""; // 빈 문자열로 초기화
		String atx = "ATX";
		String mAtx = "M-ATX";
		String mItx = "M-ITX";
		String itx = "ITX";

		if (productDescription.contains(atx)) {
			desktopCaseSupportedBoard += atx + ", ";
		}
		if (productDescription.contains(mAtx)) {
			desktopCaseSupportedBoard += mAtx + ", ";
		}
		if (productDescription.contains(mItx)) {
			desktopCaseSupportedBoard += mItx + ", ";
		}
		if (productDescription.contains(itx)) {
			desktopCaseSupportedBoard += itx;
		}

		// 마지막 쉼표와 공백 제거
		if (desktopCaseSupportedBoard.endsWith(", ")) {
			desktopCaseSupportedBoard = desktopCaseSupportedBoard.substring(0, desktopCaseSupportedBoard.length() - 2);
		}

		return desktopCaseSupportedBoard;
	}

	private static HashMap<String, Object> checkCompatibilityBetweenDesktopCaseAndPower(HashMap<String, Object> map) {
		Boolean check = false;
		double compatibilityBetweenDesktopCaseAndPowerScore = 0;
		HashMap<String, Object> powerMap = new HashMap<>();
		HashMap<String, Object> desktopCaseMap = new HashMap<>();
		powerMap = (HashMap<String, Object>) map.get("categoryPower");
		desktopCaseMap = (HashMap<String, Object>) map.get("categoryCase");
		String powerMapProductDescription = String.valueOf(powerMap.get("PRODUCT_DESCRIPTION"));
		String desktopCaseMapProductDescription = String.valueOf(desktopCaseMap.get("PRODUCT_DESCRIPTION"));
		int desktopCasePowerLength = desktopCasePowerLength(desktopCaseMapProductDescription);
		System.out.println("618번줄:" + desktopCasePowerLength);
		String desktopCasePowerStandard = desktopCaseSupportedBoard(desktopCaseMapProductDescription);
		int powerDepth = powerDepth(powerMapProductDescription);
		String powerCategoryName = powerCategoryName(powerMapProductDescription);
		System.out.println("622번줄:" + desktopCasePowerStandard);
		System.out.println("623번줄:" + powerCategoryName);
		// 차이 계산
		double difference = desktopCasePowerLength - powerDepth;
		// 10% 기준 계산
		double threshold = 0.1 * powerDepth;

		if (desktopCasePowerLength >= powerDepth || desktopCasePowerStandard.contains(powerCategoryName)) {
			check = true;
			compatibilityBetweenDesktopCaseAndPowerScore = 1;
			if (desktopCasePowerLength == 0) {
				if (desktopCaseMapProductDescription.contains("빅타워")) {
					compatibilityBetweenDesktopCaseAndPowerScore = 3;
				} else {
					compatibilityBetweenDesktopCaseAndPowerScore = 2;

				}
			}
			if (difference >= threshold) { // true: 10% 이상 차이나면 충분
				compatibilityBetweenDesktopCaseAndPowerScore = 3;
			} else {
				compatibilityBetweenDesktopCaseAndPowerScore = 2;

			}

		}
		map.put("compatibilityBetweenDesktopCaseAndPowerScore", compatibilityBetweenDesktopCaseAndPowerScore);
		map.put("compatibilityBetweenDesktopCaseAndPower", check);
		return map;
	};

	private static String powerCategoryName(String productDescription) {
		String atx = "ATX";
		String powerCategoryName = null;
		if (productDescription.contains(atx)) {
			powerCategoryName = atx;
		}
		return powerCategoryName;

	}

	private static int powerDepth(String productDescription) {
		// 정규 표현식 패턴 설정 (깊이: 숫자mm)
		String regex = "깊이:\\s*(\\d+)mm"; // 숫자 부분을 그룹으로 캡처
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(productDescription);

		// 결과 변수
		int depth = 0;

		// 매칭되는 부분을 찾고 결과 저장
		if (matcher.find()) {
			depth = Integer.parseInt(matcher.group(1)); // 숫자 부분만 저장
		}
		return depth;
	}

	private static int desktopCasePowerLength(String productDescription) {

		// 정규 표현식 패턴: "파워 장착 길이: " 뒤의 숫자를 찾기
		String pattern = "파워 장착 길이: (\\d+)(?:~(\\d+))?mm";
		int smallerValue = 0;
		Pattern regex = Pattern.compile(pattern);
		Matcher matcher = regex.matcher(productDescription);

		List<Integer> powerLengths = new ArrayList<>();

		// 파워 장착 길이 추출
		while (matcher.find()) {
			int minPowerLength = Integer.parseInt(matcher.group(1)); // 첫 번째 숫자
			powerLengths.add(minPowerLength); // 최소 길이 추가

			// 두 번째 숫자가 존재하면 추가
			if (matcher.group(2) != null) {
				int maxPowerLength = Integer.parseInt(matcher.group(2)); // 두 번째 숫자
				powerLengths.add(maxPowerLength);
			}
		}
		// 결과 처리
		if (!powerLengths.isEmpty()) {
			// 두 개의 값이 있을 때
			if (powerLengths.size() > 2) {
				smallerValue = Math.min(powerLengths.get(0), powerLengths.get(1));
			}
			// 한 개의 값이 있을 때
			if (powerLengths.size() == 2) {
				smallerValue = powerLengths.get(0);
			}
		}
		return smallerValue;
	}

	private static HashMap<String, Object> checkCompatibilityBetweenDesktopCaseAndGpu(HashMap<String, Object> map) {
		Boolean check = false;
		double compatibilityBetweenDesktopCaseAndGpuScore = 0;
		HashMap<String, Object> deskTopCaseMap = new HashMap<>();
		HashMap<String, Object> gpuMap = new HashMap<>();
		deskTopCaseMap = (HashMap<String, Object>) map.get("categoryCase");
		gpuMap = (HashMap<String, Object>) map.get("categoryGpu");
		String deskTopCaseMapProductDescription = String.valueOf(deskTopCaseMap.get("PRODUCT_DESCRIPTION"));
		String gpuMapMapProductDescription = String.valueOf(gpuMap.get("PRODUCT_DESCRIPTION"));
		double desktopCaseVgaLength = desktopCaseVgaLength(deskTopCaseMapProductDescription); // 320mm
		double gpuWidth = gpuWidth(gpuMapMapProductDescription); // 300mm
		// 차이 계산
		double difference = Math.abs(desktopCaseVgaLength - gpuWidth);
		// 10% 기준 계산
		double threshold = 0.1 * gpuWidth;
		if (desktopCaseVgaLength >= gpuWidth) {
			check = true;
			compatibilityBetweenDesktopCaseAndGpuScore = 1;
			if (difference >= threshold) { // 10프로 이상 차이
				compatibilityBetweenDesktopCaseAndGpuScore = 3;
			}
			if (threshold > difference && difference >= 0) {
				compatibilityBetweenDesktopCaseAndGpuScore = 2;

			}
		}
		map.put("compatibilityBetweenDesktopCaseAndGpuScore", compatibilityBetweenDesktopCaseAndGpuScore);
		map.put("compatibilityBetweenDesktopCaseAndGpu", check);
		return map;
	};

	private static double desktopCaseVgaLength(String productDescription) {

		// 정규 표현식 패턴 설정 (VGA 장착 길이: 숫자mm)
		String regex = "VGA 장착 길이:\\s*(\\d+)mm"; // 숫자 부분을 그룹으로 캡처
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(productDescription);

		// 결과 변수
		double vgaLength = 0;

		// 매칭되는 부분을 찾고 결과 저장
		if (matcher.find()) {
			vgaLength = Double.parseDouble(matcher.group(1)); // 숫자 부분만 저장
		}

		return vgaLength;
	}

	private static double gpuWidth(String productDescription) {
		// 정규 표현식 패턴 설정 (가로(길이): 숫자.mm)
		String regex = "가로\\(길이\\):\\s*(\\d+\\.\\d+)mm"; // 소수점 포함 숫자 부분을 그룹으로 캡처
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(productDescription);

		// 결과 변수
		double width = 0.0;

		// 매칭되는 부분을 찾고 결과 저장
		if (matcher.find()) {
			width = Double.parseDouble(matcher.group(1)); // 소수점 포함 숫자 부분만 저장
		}

		return width;
	}

	private static HashMap<String, Object> checkCompatibilityBetweenPowerAndGpu(HashMap<String, Object> map) {
		Boolean check = false;
		double compatibilityBetweenPowerAndGpuScore = 0;
		HashMap<String, Object> powerMap = new HashMap<>();
		HashMap<String, Object> gpuMap = new HashMap<>();
		HashMap<String, Object> cpuMap = new HashMap<>();
		powerMap = (HashMap<String, Object>) map.get("categoryPower");
		gpuMap = (HashMap<String, Object>) map.get("categoryGpu");
		cpuMap = (HashMap<String, Object>) map.get("categoryCpu");
		String powerMapProductDescription = String.valueOf(powerMap.get("PRODUCT_DESCRIPTION"));
		String gpuMapMapProductDescription = String.valueOf(gpuMap.get("PRODUCT_DESCRIPTION"));
		String cpuMapMapProductDescription = String.valueOf(cpuMap.get("PRODUCT_DESCRIPTION"));
		int powerCapacity = powerCapacity(powerMapProductDescription);
		int gpuRecommendedPower = gpuRecommendedPower(gpuMapMapProductDescription);
		int cpuTdp = cpuTdp(cpuMapMapProductDescription);
		// 차이 계산
		double difference = Math.abs(powerCapacity - gpuRecommendedPower - cpuTdp);
		// 10% 기준 계산
		double tenPercentThreshold = 0.1 * (gpuRecommendedPower + cpuTdp);
		double twentyPercentthreshold = 0.2 * (gpuRecommendedPower + cpuTdp);

		if (powerCapacity >= gpuRecommendedPower + cpuTdp) {
			check = true;
			compatibilityBetweenPowerAndGpuScore = 1;
			if (difference >= tenPercentThreshold) {
				compatibilityBetweenPowerAndGpuScore = 2;

			}
			if (difference >= twentyPercentthreshold) {
				compatibilityBetweenPowerAndGpuScore = 3;

			}
		}
		map.put("compatibilityBetweenPowerAndGpuScore", compatibilityBetweenPowerAndGpuScore);
		map.put("compatibilityBetweenPowerAndGpu", check);
		return map;
	};

	private static int powerCapacity(String productDescription) {
		// 정규 표현식 패턴 설정 (정격출력: 숫자W)
		String regex = "정격출력:\\s*(\\d+)W"; // 숫자 부분을 그룹으로 캡처
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(productDescription);

		// 결과 변수
		int ratedOutput = 0;

		// 매칭되는 부분을 찾고 결과 저장
		if (matcher.find()) {
			ratedOutput = Integer.parseInt(matcher.group(1)); // 숫자 부분만 저장
		}
		return ratedOutput;
	}

	private static int gpuRecommendedPower(String productDescription) {
		// 정규 표현식 패턴 설정 (정격파워 숫자W 이상)
		String regex = "정격파워\\s*(\\d+)W 이상"; // 숫자 부분을 그룹으로 캡처
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(productDescription);

		// 결과 변수
		int ratedPower = 0;

		// 매칭되는 부분을 찾고 결과 저장
		if (matcher.find()) {
			ratedPower = Integer.parseInt(matcher.group(1)); // 숫자 부분만 저장
		}
		return ratedPower;
	}

	private static int cpuTdp(String productDescription) {
		// 정규 표현식 패턴 설정 (정격출력: 숫자W)
		// 정규 표현식 패턴 설정 (TDP: 숫자W)
		String regexTdp = "TDP:\\s*(\\d+)W"; // 숫자 부분을 그룹으로 캡처
		String regexMtp = "PBP-MTP:\\s*(\\d+)-(\\d+)W"; // 두 개의 숫자를 그룹으로 캡처
		// 결과 변수
		int Value = 0;
		if (productDescription.contains("TDP")) {
			Pattern pattern = Pattern.compile(regexTdp);
			Matcher matcher = pattern.matcher(productDescription);
			// 매칭되는 부분을 찾고 결과 저장
			if (matcher.find()) {
				Value = Integer.parseInt(matcher.group(1)); // 숫자 부분만 저장
			}

		}
		if (productDescription.contains("PBP-MTP")) {
			// 정규 표현식 패턴 설정 (PBP-MTP: 숫자-숫자W)
			Pattern pattern = Pattern.compile(regexMtp);
			Matcher matcher = pattern.matcher(productDescription);

			// 매칭되는 부분을 찾고 결과 저장
			if (matcher.find()) {
				Value = Integer.parseInt(matcher.group(2)); // 두 번째 숫자(더 큰 숫자)만 저장
			}
		}

		return Value;
	}

	private static HashMap<String, Object> checkGraphicsAvailability(HashMap<String, Object> map) {
		// 로직 구현
		boolean checkGraphicsAvailability = false;
		int cpuIntegratedGraphics = Integer.parseInt(String.valueOf(map.get("CPU_INTEGRATED_GRAPHICS")));
		if (map.get("GPU_IDX") != null) {
			if (cpuIntegratedGraphics == 1) {
				checkGraphicsAvailability = true;
			}
		}
		if (map.get("GPU_IDX") == null) {
			if (cpuIntegratedGraphics == 0) {
				checkGraphicsAvailability = false;
			}
		}

		return map;
	}

}
