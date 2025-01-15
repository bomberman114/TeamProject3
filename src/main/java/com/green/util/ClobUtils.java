package com.green.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

public final class ClobUtils {

    private ClobUtils() {
        // 인스턴스화 방지
        throw new UnsupportedOperationException("This is a utility class and cannot be instantiated");
    }

    public static String clobToString(Clob clob) throws SQLException, IOException {
        if (clob == null) return null;
        StringBuilder sb = new StringBuilder();
        try (Reader reader = clob.getCharacterStream();
             BufferedReader br = new BufferedReader(reader)) {
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
        }
        return sb.toString();
    }
    
	public static List<HashMap<String, Object>> processClobData(List<HashMap<String, Object>> list) {
	    String clobKey = "PRODUCT_DESCRIPTION";
	    return list.stream().map(item -> {
	        Object value = item.get(clobKey);
	        if (value instanceof Clob) {
	            try {
	                String clobString = ClobUtils.clobToString((Clob) value);
	                item.put(clobKey, clobString);
	            } catch (Exception e) {
	                // 로그 기록
	                item.put(clobKey, "Error processing description");
	            }
	        }
	        return item;
	    }).collect(Collectors.toList());
	}
}