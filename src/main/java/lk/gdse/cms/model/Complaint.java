package lk.gdse.cms.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Complaint {
    private String id;
    private String title;
    private String description;
    private int userId;
}