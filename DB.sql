-- 1. ตาราง users (นักเรียน & เจ้าหน้าที่)
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password_hash CHAR(60) NOT NULL,
  full_name VARCHAR(100) NOT NULL,
  role ENUM('student','staff') NOT NULL DEFAULT 'student',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. ตาราง equipment (คลังอุปกรณ์)
CREATE TABLE equipment (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  category VARCHAR(50),
  total_qty INT NOT NULL DEFAULT 0,
  available_qty INT NOT NULL DEFAULT 0,
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 3. ตาราง borrow_records (บันทึกการยืม–คืน)
CREATE TABLE borrow_records (
  id INT AUTO_INCREMENT PRIMARY KEY,
  equipment_id INT NOT NULL,
  user_id INT NOT NULL,
  borrow_date DATE NOT NULL,
  expected_return_date DATE NOT NULL,
  actual_return_date DATE NULL,
  status ENUM('pending','approved','denied','returned')
         NOT NULL DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (equipment_id) REFERENCES equipment(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);
