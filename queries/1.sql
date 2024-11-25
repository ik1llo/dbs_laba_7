CREATE TABLE Car (
    car_id INT PRIMARY KEY NOT NULL,
    vin_code VARCHAR(20) NOT NULL
)

CREATE TABLE Client (
    client_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL
)

CREATE TABLE Master (
    master_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL
)

CREATE TABLE MasterSchedule (
    master_schedule_id INT PRIMARY KEY NOT NULL,
    day_of_week INT NOT NULL,
    start_time INT NOT NULL,
    end_time INT NOT NULL
)

CREATE TABLE RepairOperation (
    operation_id INT PRIMARY KEY NOT NULL,
    name VARCHAR(20) NOT NULL UNIQUE,
    cost INT NOT NULL,
    duration_minutes INT NOT NULL
)

CREATE TABLE Part (
    part_id INT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL UNIQUE,
    quantity INT NOT NULL
)

CREATE TABLE Master_MasterSchedule (
    master_id INT NOT NULL,
    master_schedule_id INT NOT NULL,
    FOREIGN KEY (master_id) REFERENCES Master(master_id),
    FOREIGN KEY (master_schedule_id) REFERENCES MasterSchedule(master_schedule_id)
)

CREATE TABLE Contract (
    contract_id INT PRIMARY KEY NOT NULL,
    date DATE NOT NULL,
    car_id INT NOT NULL,
    client_id INT NOT NULL,
    master_id INT NOT NULL,
    operation_id INT NOT NULL,
    FOREIGN KEY (car_id) REFERENCES Car(car_id),
    FOREIGN KEY (client_id) REFERENCES Client(client_id),
    FOREIGN KEY (master_id) REFERENCES Master(master_id),
    FOREIGN KEY (operation_id) REFERENCES RepairOperation(operation_id)
)

CREATE TABLE PartOrder (
    order_id INT PRIMARY KEY NOT NULL,
    part_id INT NOT NULL,
    batch_size INT NOT NULL,
    date_ordered DATE NOT NULL,
    delivery_time_minutes INT NOT NULL,
    FOREIGN KEY (part_id) REFERENCES Part(part_id),
)

CREATE TABLE RepairOperation_Part (
    operation_id INT NOT NULL,
    part_id INT NOT NULL,
    FOREIGN KEY (operation_id) REFERENCES RepairOperation(operation_id),
    FOREIGN KEY (part_id) REFERENCES Part(part_id)
)