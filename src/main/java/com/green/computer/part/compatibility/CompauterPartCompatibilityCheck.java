package com.green.computer.part.compatibility;

import java.util.HashMap;
import java.util.List;

public class CompauterPartCompatibilityCheck {

	public static HashMap<String, Object> compauterPartCompatibilityCheck(List<HashMap<String, Object>> computerPart) {
		HashMap<String, Object> map2 = new HashMap<>();

		// CPU와 메인보드 호환성 체크
		map2 = checkCompatibilityBetweenCpuAndMotherboard(map2);
		boolean checkCompatibilityBetweenCpuAndMotherboardResult = (Boolean) map2
				.get("checkCompatibilityBetweenCpuAndMotherboard");
		double cpuAndMotherboardScore = (Double) map2.get("cpuAndMotherboardScore");

		// CPU와 RAM 호환성 체크
		map2 = checkCompatibilityBetweenCpuAndRam(map2);
		boolean checkCompatibilityBetweenCpuAndRamResult = (Boolean) map2.get("checkCompatibilityBetweenCpuAndRam");
		double compatibilityBetweenCpuAndRamScore = (Double) map2.get("compatibilityBetweenCpuAndRamScore");

		// 메인보드와 RAM 호환성 체크
		map2 = checkCompatibilityBetweenMotherboardAndRam(map2);
		boolean checkCompatibilityBetweenMotherboardAndRamResult = (Boolean) map2
				.get("compatibilityBetweenMotherboardAndRam");
		double compatibilityBetweenMotherboardAndRamScore = (Double) map2
				.get("compatibilityBetweenMotherboardAndRamScore");

		// 메인보드와 데스크탑 케이스 호환성 체크
		map2 = checkCompatibilityBetweenMotherboardAndDesktopCase(map2);
		boolean checkCompatibilityBetweenMotherboardAndDesktopCaseResult = (Boolean) map2
				.get("compatibilityBetweenMotherboardAndDesktopCase");
		double compatibilityBetweenMotherboardAndDesktopCaseScore = (Double) map2
				.get("compatibilityBetweenMotherboardAndDesktopCaseScore");

		// 데스크탑 케이스와 파워 호환성 체크
		map2 = checkCompatibilityBetweenDesktopCaseAndPower(map2);
		boolean checkCompatibilityBetweenDesktopCaseAndPowerResult = (Boolean) map2
				.get("compatibilityBetweenDesktopCaseAndPower");
		double compatibilityBetweenDesktopCaseAndPowerScore = (Double) map2
				.get("compatibilityBetweenDesktopCaseAndPowerScore");

		// 데스크탑 케이스와 GPU 호환성 체크
		map2 = checkCompatibilityBetweenDesktopCaseAndGpu(map2);
		boolean checkCompatibilityBetweenDesktopCaseAndGpuResult = (Boolean) map2
				.get("compatibilityBetweenDesktopCaseAndGpu");
		double compatibilityBetweenDesktopCaseAndGpuScore = (Double) map2
				.get("compatibilityBetweenDesktopCaseAndGpuScore");

		// 파워와 GPU 호환성 체크
		map2 = checkCompatibilityBetweenPowerAndGpu(map2);
		boolean checkCompatibilityBetweenPowerAndGpuResult = (Boolean) map2.get("compatibilityBetweenPowerAndGpu");
		double compatibilityBetweenPowerAndGpuScore = (Double) map2.get("compatibilityBetweenPowerAndGpuScore");

		// 모든 호환성 체크를 AND 조건으로 결합
		if (checkCompatibilityBetweenCpuAndMotherboardResult && checkCompatibilityBetweenCpuAndRamResult
				&& checkCompatibilityBetweenMotherboardAndRamResult
				&& checkCompatibilityBetweenMotherboardAndDesktopCaseResult
				&& checkCompatibilityBetweenDesktopCaseAndPowerResult
				&& checkCompatibilityBetweenDesktopCaseAndGpuResult && checkCompatibilityBetweenPowerAndGpuResult) {

			// 모든 부품이 호환될 때 점수 계산
			System.out.println("모든 부품이 호환됩니다.");
			// 점수 초기화 및 가중치 설정
			double totalScore = 0;
			double maxScore = 0;

			// 각 항목의 가중치와 점수 계산
			double cpuMotherboardWeight = 5.0;
			totalScore += cpuMotherboardWeight * cpuAndMotherboardScore;
			maxScore += cpuMotherboardWeight * 3; // max score is 3

			double cpuRamWeight = 5.0; // CPU와 RAM 호환성 가중치
			totalScore += cpuRamWeight * compatibilityBetweenCpuAndRamScore;
			maxScore += cpuRamWeight * 3; // max score is 3

			double motherboardRamWeight = 5.0;
			totalScore += motherboardRamWeight * compatibilityBetweenMotherboardAndRamScore;
			maxScore += motherboardRamWeight * 3;

			double gpuMotherboardWeight = 5.0;
			totalScore += gpuMotherboardWeight * compatibilityBetweenDesktopCaseAndGpuScore;
			maxScore += gpuMotherboardWeight * 3;

			double powerCompatibilityWeight = 5.0;
			totalScore += powerCompatibilityWeight * compatibilityBetweenPowerAndGpuScore;
			maxScore += powerCompatibilityWeight * 3;

			double caseSizeWeight = 4.5; // 메인보드와 케이스 크기 가중치
			totalScore += caseSizeWeight * compatibilityBetweenMotherboardAndDesktopCaseScore;
			maxScore += caseSizeWeight * 3;

			double desktopCasePowerWeight = 4.5; // 데스크탑 케이스와 파워 호환성 가중치
			totalScore += desktopCasePowerWeight * compatibilityBetweenDesktopCaseAndPowerScore;
			maxScore += desktopCasePowerWeight * 3;

			// 점수 정규화
			double normalizedScore = (totalScore / maxScore) * 100;

			// 결과를 맵에 저장
			map2.put("totalScore", totalScore);
			map2.put("normalizedScore", normalizedScore);
		}

		return map2;
	}

	private static HashMap<String, Object> checkCompatibilityBetweenCpuAndMotherboard(HashMap<String, Object> map) {
		Boolean check = false;
		String cpuSocketType = String.valueOf(map.get("CPU_SOCKET_TYPE"));
		String motherboardSocketType = String.valueOf(map.get("MOTHERBOARD_SOCKET_TYPE"));
		String motherboardChipset = String.valueOf(map.get("MOTHERBOARD_CHIPSET"));
		String cpuTypeName = String.valueOf(map.get("CPU_TYPE_NAME"));
		double motherboardScore = 1; // 기본 점수 1점 (호환성 있는 경우)

		// 소켓 타입 체크
		if (cpuSocketType.equals(motherboardSocketType)) {
			check = true;

			// CPU 타입에 따른 점수 조정
			if (cpuTypeName.contains("울트라") || cpuTypeName.contains("9") || cpuTypeName.contains("7")) {
				if (motherboardChipset.contains("x") || motherboardChipset.contains("z")) {
					motherboardScore = 3; // 최상위 호환성
				}
				if (motherboardChipset.contains("b")) {
					motherboardScore = 2; // 중간 호환성
				}

			}
			if (cpuTypeName.contains("5") || cpuTypeName.contains("3")) {
				if (motherboardChipset.contains("x") || motherboardChipset.contains("z")) {
					motherboardScore = 2; // 중간 호환성
				}
				if (motherboardChipset.contains("b")) {
					motherboardScore = 3; // 최상위 호환성
				}
			}
		}

		// 점수와 호환성 정보 저장
		map.put("checkCompatibilityBetweenCpuAndMotherboard", check);
		map.put("cpuAndMotherboardScore", motherboardScore);

		return map;
	}

	private static HashMap<String, Object> checkCompatibilityBetweenCpuAndRam(HashMap<String, Object> map) {
		Boolean check = false;
		String cpuRamYype = String.valueOf(map.get("CPU_RAM_TYPE"));
		String ramType = String.valueOf(map.get("RAM_TYPE"));
		double compatibilityBetweenCpuAndRamScore = 0;
		if (cpuRamYype.equals(ramType)) {
			check = true;
			compatibilityBetweenCpuAndRamScore = 3;

		}
		map.put("checkCompatibilityBetweenCpuAndRam", check);
		map.put("compatibilityBetweenCpuAndRamScore", compatibilityBetweenCpuAndRamScore);
		return map;
	};

	private static HashMap<String, Object> checkCompatibilityBetweenMotherboardAndRam(HashMap<String, Object> map) {
		Boolean check = false;
		double compatibilityBetweenMotherboardAndRamScore = 0;
		String motherboardMemoryType = String.valueOf(map.get("MOTHERBOARD_MEMORY_TYPE"));
		int motherboardMemorySlots = Integer.parseInt(String.valueOf(map.get("MOTHERBOARD_MEMORY_SLOTS")));
		int motherboardMaximumMemorySize = Integer.parseInt(String.valueOf(map.get("MOTHERBOARD_MAXIMUM_MEMORY_SIZE")));
		String ramType = String.valueOf(map.get("RAM_TYPE"));
		int ramCount = Integer.parseInt(String.valueOf(map.get("RAM_COUNT")));
		int ramCapacity = Integer.parseInt(String.valueOf(map.get("RAM_CAPACITY")));
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

	private static HashMap<String, Object> checkCompatibilityBetweenMotherboardAndDesktopCase(
			HashMap<String, Object> map) {
		Boolean check = false;
		double compatibilityBetweenMotherboardAndDesktopCaseScore = 0;
		String motherboardFormFactor = String.valueOf(map.get("MOTHERBOARD_FORM_FACTOR"));
		String desktopCaseSupportedBoard = String.valueOf(map.get(" DESKTOP_CASE_SUPPORTED_BOARD"));
		if (motherboardFormFactor.equals(desktopCaseSupportedBoard)) {
			check = true;
			compatibilityBetweenMotherboardAndDesktopCaseScore = 3;
		}
		map.put("compatibilityBetweenMotherboardAndDesktopCaseScore",
				compatibilityBetweenMotherboardAndDesktopCaseScore);
		map.put("compatibilityBetweenMotherboardAndDesktopCase", check);
		return map;
	};

	private static HashMap<String, Object> checkCompatibilityBetweenDesktopCaseAndPower(HashMap<String, Object> map) {
		Boolean check = false;
		double compatibilityBetweenDesktopCaseAndPowerScore = 0;
		int desktopCasePowerLength = Integer.parseInt(String.valueOf(map.get("DESKTOP_CASE_POWER_LENGTH")));
		String desktopCasePowerStandard = String.valueOf(map.get(" DESKTOP_CASE_POWER_STANDARD"));
		int powerDepth = Integer.parseInt(String.valueOf(map.get("POWER_DEPTH")));
		String powerCategoryName = String.valueOf(map.get("POWER_CATEGORY_NAME"));
		// 차이 계산
		double difference = desktopCasePowerLength - powerDepth;
		// 10% 기준 계산
		double threshold = 0.1 * powerDepth;

		if (desktopCasePowerLength >= powerDepth && desktopCasePowerStandard.equals(powerCategoryName)) {
			check = true;
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

	private static HashMap<String, Object> checkCompatibilityBetweenDesktopCaseAndGpu(HashMap<String, Object> map) {
		Boolean check = false;
		double compatibilityBetweenDesktopCaseAndPowerScore = 0;
		int desktopCaseVgaLength = Integer.parseInt(String.valueOf(map.get("DESKTOP_CASE_VGA_LENGTH")));
		int gpuWidth = Integer.parseInt(String.valueOf(map.get("GPU_WIDTH")));
		// 차이 계산
		double difference = desktopCaseVgaLength - gpuWidth;
		// 10% 기준 계산
		double threshold = 0.1 * gpuWidth;
		if (desktopCaseVgaLength >= gpuWidth) {
			check = true;
			compatibilityBetweenDesktopCaseAndPowerScore = 1;
			if (difference >= threshold) { // 10프로 이상 차이
				compatibilityBetweenDesktopCaseAndPowerScore = 3;
			} else {
				compatibilityBetweenDesktopCaseAndPowerScore = 2;

			}
		}
		map.put("compatibilityBetweenDesktopCaseAndPowerScore", compatibilityBetweenDesktopCaseAndPowerScore);
		map.put("compatibilityBetweenDesktopCaseAndPower", check);
		return map;
	};

	private static HashMap<String, Object> checkCompatibilityBetweenPowerAndGpu(HashMap<String, Object> map) {
		Boolean check = false;
		double compatibilityBetweenDesktopCaseAndPowerScore = 0;
		int powerCapacity = Integer.parseInt(String.valueOf(map.get("POWER_CAPACITY")));
		int gpuRecommendedPower = Integer.parseInt(String.valueOf(map.get("GPU_RECOMMENDED_POWER")));
		// 차이 계산
		double difference = powerCapacity - gpuRecommendedPower;
		if (powerCapacity >= gpuRecommendedPower) {
			check = true;
			compatibilityBetweenDesktopCaseAndPowerScore = 1;
			if (difference >= 100) {
				compatibilityBetweenDesktopCaseAndPowerScore = 3;

			} else {
				compatibilityBetweenDesktopCaseAndPowerScore = 2;

			}
		}
		map.put("compatibilityBetweenDesktopCaseAndPowerScore", compatibilityBetweenDesktopCaseAndPowerScore);
		map.put("compatibilityBetweenDesktopCaseAndPower", check);
		return map;
	};

}
