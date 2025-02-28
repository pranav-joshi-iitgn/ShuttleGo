CREATE TABLE Members(
    Member_ID NUMERIC(8,0) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Image VARCHAR(50),
    Age INT,
    Email VARCHAR(50),
    Contact_Number NUMERIC(10,0) NOT NULL
);

INSERT INTO Members VALUES 
(22110016,"Aditya Mangla","MemberPhotos/Aditya.jpg",21,"aditya.mangla@iitgn.ac.in",9971815304),
(22110197,"Pranav Joshi","MemberPhotos/Pranav.jpg",20,"pranav.joshi@iitgn.ac.in",8698955551),
(22110103,"Jaidev Khalane","MemberPhotos/Jaidev.jpg",20,"jaidev.khalale@iitgn.ac.in",9515630148),
(22110279,"Vannsh Jani","MemberPhotos/Vansh.jpg",22,"vannsh.jani@iitgn.ac.in",9108944400),
(22110270,"Tapananshu Gandhi","MemberPhotos/Tapananshu.jpg",20,"tapananshu.gandhi@iitgn.ac.in",9303676510);