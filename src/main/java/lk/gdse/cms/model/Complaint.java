package lk.gdse.cms.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
public class Complaint {
    private String id;
    private String title;
    private String description;
    private int userId;
    private String status;

    private String remarks;

    // Custom constructor (without remarks)
    public Complaint(String id, String title, String description, int userId, String status) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.userId = userId;
        this.status = status;
    }

}
