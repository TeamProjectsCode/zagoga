package com.javalec.project_zagoga.mapper.sql;

import com.javalec.project_zagoga.dto.Ghouse;
import com.javalec.project_zagoga.dto.GhouseRoom;
import org.apache.ibatis.jdbc.SQL;

public class GhouseSQL {
    private static final String TABLE="GHOUSE";
    private static final String Rooms="ROOMS";
    private static final String Images="IMAGES";
    public static final String GET_ALL_LIST="select * from " + TABLE;

    public String getGhouseList(String local) {
        // location에 따른 최소 값을 가진 ghouse 정보 출력
        return new SQL()
                .SELECT("*")
                .FROM(Images)
                .JOIN("ROOMS R on R.R_NO = IMAGES.I_RNO")
                .JOIN("GHOUSE G on G.GH_NO = R.R_GHNO")
                .WHERE("I_NO in (select min(I_NO) from IMAGES\n" +
                        "                                                join ROOMS R2 on R2.R_NO = IMAGES.I_RNO\n" +
                        "                                                join GHOUSE G2 on G2.GH_NO = R2.R_GHNO group by GH_NO)")
                .AND()
                .WHERE("GH_ADDR1 like '%"+local+"%'")
                .toString();
    }

    /*public String getList(String local){
        String sql = 
        		"select * from GHOUSE";
        return sql;
    }
	
	  public String localList(String local) { 
		  return new SQL()
	  .SELECT("GH_NO, GH_NAME, GH_IMAGE, MIN(R_FEE)'R_FEE'") 
	  .FROM(TABLE,Rooms)
	  .WHERE("GH_ADDR1 LIKE '%"+local+"%'") 
	  .GROUP_BY("GH_NO") .toString(); 
	  }*/
	
    
    public String insert(Ghouse ghouse){
        return new SQL()
                .INSERT_INTO(TABLE)
                .INTO_COLUMNS("GH_NAME", "GH_IMAGE", "GH_ADDR1", "GH_ADDR2", "GH_DETAIL", "GH_HNO")
                .INTO_VALUES("#{ghouse.gh_name}", "#{ghouse.gh_image}", "#{ghouse.gh_addr1}", "#{ghouse.gh_addr2}", "#{ghouse.gh_detail}", "#{ghouse.gh_hno}")
                .toString();
    }

    public String roomAndGhouse(int gh_no){
        return new SQL()
                .SELECT("*")
                .FROM(TABLE)
                .JOIN("ROOMS R on GHOUSE.GH_NO = R.R_GHNO")
                .WHERE("GH_NO = #{gh_no}")
                .ORDER_BY("R_NO")
                .toString();
    }

//select * from
// GHOUSE join ROOMS R on GHOUSE.GH_NO = R.R_GHNO join IMAGES I on R.R_NO = I.I_RNO
// where I_RNO >= (select min(R_NO)'R_NO' from ROOMS where R_GHNO = 2)
// and I_RNO <= (select max(R_NO)'R_NO' from ROOMS where R_GHNO = 2)
// order by I_RNO and I_NO desc;
    public String ghouseDetail(int gh_no){
/*        return new SQL()
                .SELECT("*")
                .FROM("IMAGES")
                .JOIN("ROOMS R2 on R2.R_NO = IMAGES.I_RNO")
                .JOIN("GHOUSE G on G.GH_NO = R2.R_GHNO")
                .WHERE("I_NO in (select min(I_NO) from IMAGES " +
                        "join ROOMS R on R.R_NO = IMAGES.I_RNO " +
                        "join GHOUSE G on R.R_GHNO = G.GH_NO " +
                        "where GH_NO=#{gh_no} group by R_NO)")
                .toString();*/
//        gh_no에 속하는 방들의 이미지 정보 가져옴
        return new SQL()
                .SELECT("*")
                .FROM(Images)
                .JOIN("ROOMS R on R.R_NO = IMAGES.I_RNO")
                .JOIN("GHOUSE G on G.GH_NO = R.R_GHNO")
                .WHERE(" I_NO in (select min(I_NO) from IMAGES\n" +
                        "                where I_RNO in  (select R_NO from ROOMS where R_GHNO=#{gh_no}) group by I_RNO)")
                .toString();
    }



    public String delete(int gh_no, int gh_hno){
        return new SQL()
                .DELETE_FROM(Rooms)
                .WHERE("GH_NO = #{gh_no}")
                .WHERE("GH_HNO = #{gh_hno}")
                .toString();
    }

    public String selectOne(int gh_no){
        return new SQL()
                .SELECT("*")
                .FROM(TABLE)
                .WHERE("GH_NO = #{gh_no}")
//                .WHERE("GH_NO = 2")
                .toString();
    }

    public String updateView(int gh_no){
        return new SQL()
                .SELECT("*")
                .FROM(TABLE)
                .WHERE("GH_NO = #{gh_no}")
//                .WHERE("GH_NO = 2")
                .toString();
    }

    public String lowFee(int gh_no){
        return new SQL()
                .SELECT("R_FEE")
                .FROM("ROOMS")
                .WHERE("R_GHNO = ${gh_no}")
                .ORDER_BY("R_FEE ASC")
                .LIMIT(1)
                .toString();
    }
}
