-- Bảng Người dùng
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    AddressID INT,
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
    -- Thêm các trường thông tin khác của người dùng tại đây
);

-- Bảng Sách
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    PublisherID INT,
    CategoryID INT,
    Price DECIMAL(10, 2) NOT NULL,
    Description TEXT,
    CoverImageURL VARCHAR(255),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
    -- Thêm các trường thông tin khác của sách tại đây
);

-- Bảng Thể loại sách
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
    -- Thêm các trường thông tin khác về thể loại sách tại đây
);

-- Bảng Tác giả
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactInfo TEXT
    -- Thêm các trường thông tin khác của tác giả tại đây
);

-- Bảng Nhà xuất bản
CREATE TABLE Publisher (
    PublisherID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactInfo TEXT
    -- Thêm các trường thông tin khác của nhà xuất bản tại đây
);

-- Bảng Đơn hàng
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    UserID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
    -- Thêm các trường thông tin khác của đơn hàng tại đây
);

-- Bảng Chi tiết đơn hàng
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
    -- Thêm các trường thông tin khác của chi tiết đơn hàng tại đây
);

-- Bảng Thanh toán
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentMethod VARCHAR(50) NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
    -- Thêm các trường thông tin khác của thanh toán tại đây
);

-- Bảng Đánh giá
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    UserID INT,
    BookID INT,
    Rating INT NOT NULL,
    Comment TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
    -- Thêm các trường thông tin khác của đánh giá tại đây
);

-- Bảng Danh sách yêu thích
CREATE TABLE Wishlist (
    WishlistID INT PRIMARY KEY,
    UserID INT,
    BookID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Bảng Giỏ hàng
CREATE TABLE Cart (
    CartID INT PRIMARY KEY,
    UserID INT,
    BookID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Bảng Địa chỉ
CREATE TABLE Address (
    AddressID INT PRIMARY KEY,
    UserID INT,
    StreetAddress VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
    -- Thêm các trường thông tin khác về địa chỉ tại đây
);
