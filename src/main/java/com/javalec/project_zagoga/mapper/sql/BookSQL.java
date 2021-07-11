package com.javalec.project_zagoga.mapper.sql;

import com.javalec.project_zagoga.dto.Booking;
import com.javalec.project_zagoga.dto.BookingRoomGhouseUsers;
import org.apache.ibatis.jdbc.SQL;

import java.awt.print.Book;

public class BookSQL {
    private static final String Booking = "BOOKING";
    private static final String Users = "USERS";
    private static final String Host = "HOST";
    private static final String Rooms = "ROOMS";
    private static final String Ghouse = "GHOUSE";
    private static final String SnsUsers = "SNS_USERS";

    public String getUserInfo(int u_no){
        return new SQL()
                .SELECT("*")
                .FROM(Booking)
                .WHERE("B_UNO = #{u_no}")
                .toString();
    }

    public String bookConfirmInfo(int u_no, int r_no){
        return new SQL()
                .SELECT("*")
                .FROM(Booking)
                .WHERE("B_UNO = #{u_no}")
                .WHERE("B_RNO = #{r_no}")
                .toString();
    }

    public String insertBook(Booking booking) {
        return new SQL()
                .INSERT_INTO(Booking)
                .INTO_COLUMNS("B_IN", "B_OUT", "B_STATE", "B_PNO", "B_RNO", "B_UNO")
                .INTO_VALUES("#{booking.b_in}", "#{booking.b_out}", "#{booking.b_state}", "#{booking.b_pno}", "#{booking.b_rno}", "#{booking.b_uno}")
                .toString();
    }

//    public String getBookInfo(int u_no, int r_no){
//        return new SQL()
//                .SELECT("GH_NO, GH_IMAGE, GH_NAME, GH_ADDR1, GH_ADDR2," +
//                        "R_NO, R_NAME, R_FEE," +
//                        "U_NO, U_PHONE, U_NICK, U_GENDER," +
//                        "B_NO, DATE_FORMAT(B_IN, '%Y-%m-%d')'B_IN', DATE_FORMAT(B_OUT, '%Y-%m-%d')'B_OUT', B_PNO, B_STATE, B_JOIN")
//                .FROM("USERS join BOOKING B on USERS.U_NO = B.B_UNO join ROOMS R on R.R_NO = B.B_RNO " +
//                        "join GHOUSE G on G.GH_NO = R.R_GHNO join HOST H on H.H_NO = G.GH_HNO")
//                .WHERE("U_NO=#{u_no}")
//                .WHERE("R_NO=#{r_no}")
//                .ORDER_BY("B_JOIN DESC")
//                .toString();
//    }
    public String getBookingConfirm(BookingRoomGhouseUsers info) {
        return new SQL()
                .SELECT("GH_IMAGE, GH_NAME, GH_ADDR1, GH_ADDR2," +
                        "R_NAME, R_FEE," +
                        "U_NO, U_PHONE, U_NICK, U_GENDER")
                .FROM(Ghouse, Rooms, Users)
                .WHERE("GH_NO=(select R_GHNO from ROOMS where R_NO=#{info.r_no})")
                .WHERE("R_NO = #{info.r_no}")
                .WHERE("U_NO = #{info.u_no}")
                .toString();
    }

    public String bookingListForHost(int h_no) {
        return new SQL()
                .SELECT("BOOKING.*, R_NAME, U.U_NAME, U.U_PHONE")
                .FROM(Booking)
                .JOIN("USERS U on BOOKING.B_UNO = U.U_NO")
                .JOIN("ROOMS R on R.R_NO = BOOKING.B_RNO")
                .JOIN("GHOUSE G on R.R_GHNO = G.GH_NO")
                .JOIN("HOST H on G.GH_HNO = H.H_NO")
                .WHERE("H.H_NO = #{h_no}")
                .toString();
    }

    public String updateBookingState(int b_no, int b_state) {
        return new SQL()
                .UPDATE(Booking)
                .SET("B_STATE = #{b_state}")
                .WHERE("B_NO = #{b_no}")
                .toString();
    }
}