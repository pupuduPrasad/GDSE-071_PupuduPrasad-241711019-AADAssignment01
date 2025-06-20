package lk.gdse.cms.dao;

import lk.gdse.cms.model.Complaint;
import java.sql.*;
import java.util.*;

public class ComplaintDAO {

    // Generate complaint id .
    public static String generateComplaintId() {
        String prefix = "COM";
        String sql = "SELECT id FROM complaints WHERE id LIKE 'COM%' ORDER BY id DESC LIMIT 1";

        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                String lastId = rs.getString("id");
                int num = Integer.parseInt(lastId.substring(3));
                num++;
                return String.format("%s%03d", prefix, num);
            } else {
                return "COM001";
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Save complaint
    public static void saveComplaint(Complaint complaint) {
        try (Connection conn = DBConnection.getDataSource().getConnection()) {
            String sql = "INSERT INTO complaints (id, title, description, user_id, status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, complaint.getId());
            stmt.setString(2, complaint.getTitle());
            stmt.setString(3, complaint.getDescription());
            stmt.setInt(4, complaint.getUserId());
            stmt.setString(5, complaint.getStatus());

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Retrieve complaints
    public static List<Complaint> getComplaintsByUserId(int userId) {
        List<Complaint> list = new ArrayList<>();
        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM complaints WHERE user_id = ?")) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Complaint c = new Complaint(
                        rs.getString("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("user_id"),
                        rs.getString("status")
                );
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Retrieve all complaints admin
    public static List<Complaint> getAllComplaints() {
        List<Complaint> complaints = new ArrayList<>();
        String sql = "SELECT * FROM complaints";

        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Complaint c = new Complaint(
                        rs.getString("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("user_id"),
                        rs.getString("status")
                );
                complaints.add(c);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching all complaints: " + e.getMessage());
        }

        return complaints;
    }

    // Delete complaint ID
    public static boolean deleteComplaintById(String id) {
        try (Connection conn = DBConnection.getDataSource().getConnection();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM complaints WHERE id = ?")) {
            ps.setString(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}