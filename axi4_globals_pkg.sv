`ifndef AXI4_GLOBALS_PKG_INCLUDED_
`define AXI4_GLOBALS_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package: axi4_globals_pkg
// Used for storing enums, parameters and defining the structs
//--------------------------------------------------------------------------------------------
package axi4_globals_pkg;

  //-------------------------------------------------------
  // Parameters used in axi4_avip are given below
  //-------------------------------------------------------
  //Parameter: MASTER_AGENT_ACTIVE
  //Used to set the master agent either active or passive
  //parameter bit MASTER_AGENT_ACTIVE = 1;

  //Parameter: SLAVE_AGENT_ACTIVE
  //Used to set the slave agent either active or passive
//  parameter bit SLAVE_AGENT_ACTIVE = 1;

  //Parameter: NO_OF_MASTERS
  //Used to set number of masters required
//  parameter int NO_OF_MASTERS = 1;

  //Parameter: NO_OF_SLAVES
  //Used to set number of slaves required
//  parameter int NO_OF_SLAVES = 1;

  //Parameter: ADDRESS_WIDTH
  //Used to set the address width to the address bus
  parameter int ADDRESS_WIDTH = 16;

  //Parameter: DATA_WIDTH
  //Used to set the data width 
  parameter int DATA_WIDTH = 32;

  //Parameter: SLAVE_MEMORY_SIZE
  //Sets the memory size of the slave in KB
 // parameter int SLAVE_MEMORY_SIZE = 12;

  //Parameter: SLAVE_MEMORY_GAP
  //Sets the memory gap size of the slave
//  parameter int SLAVE_MEMORY_GAP = 2;

  //Parameter: MEMORY_WIDTH
  //Sets the width it can store in each location
//  parameter int MEMORY_WIDTH = 8;

  //Parameter: STROBE_WIDTH
  //Used to define the width of the strobes
  parameter int STROBE_WIDTH = (DATA_WIDTH/8);

  //Variable: MEM_ID
  //Indicates Slave Memory Depth 
  parameter int MEM_ID = 2**ADDRESS_WIDTH;

  //Variable: LENGTH
  //Indicates the length of the address write and read channels
  parameter int LENGTH = 8;

  //Variable: OUTSTANDING_FIFO_DEPTH
  //Indicates the fifo depth of outstanding transaction
//  parameter int OUTSTANDING_FIFO_DEPTH = 16;
  
  //-------------------------------------------------------
  // Enums used in axi4_avip are given below
  //-------------------------------------------------------
  
  //Enum: awburst_e
  //Used to declare the enum type of write burst type
  typedef enum bit [1:0] {
    WRITE_FIXED    = 2'b00,
    WRITE_INCR     = 2'b01,
    // WRITE_WRAP     = 2'b10,
    // WRITE_RESERVED = 2'b11
  } awburst_e;

  //Enum: arburst_e
  //Used to declare the enum type of read burst type
  typedef enum bit [1:0] {
    READ_FIXED    = 2'b00,
    READ_INCR     = 2'b01,
    // READ_WRAP     = 2'b10,
    // READ_RESERVED = 2'b11
  } arburst_e;


    //-------------------------------------------------------
  // Enum : transfer_size_e
  //  Used to declare enum type for all transfer sizes
  //-------------------------------------------------------
  // typedef enum bit[31:0]{
  //   BIT_8  = 2'b0,
  //   BIT_16 = 32'd16,
  //   BIT_24 = 32'd24,
  //   BIT_32 = 32'd32
  // }transfer_size_e;

  //Enum: transfer_size_e
  //Used to declare enum type for write transfer sizes
  typedef enum bit [2:0] {
    WRITE_1_BYTE    = 3'b000,
    WRITE_2_BYTES   = 3'b001,
    WRITE_4_BYTES   = 3'b010,
    // WRITE_8_BYTES   = 3'b011,
    // WRITE_16_BYTES  = 3'b100,
    // WRITE_32_BYTES  = 3'b101,
    // WRITE_64_BYTES  = 3'b110,
    // WRITE_128_BYTES = 3'b111
  } awsize_e;

  //Enum: transfer_size_e
  //Used to declare enum type for read transfer sizes
  typedef enum bit [2:0] {
    READ_1_BYTE    = 3'b000,
    READ_2_BYTES   = 3'b001,
    READ_4_BYTES   = 3'b010,
    // READ_8_BYTES   = 3'b011,
    // READ_16_BYTES  = 3'b100,
    // READ_32_BYTES  = 3'b101,
    // READ_64_BYTES  = 3'b110,
    // READ_128_BYTES = 3'b111
  } arsize_e;

  //Enum: awlock_e
  //Used to declare enum type for write lock access
  typedef enum bit {
    WRITE_NORMAL_ACCESS    = 1'b0,
   // WRITE_EXCLUSIVE_ACCESS = 1'b1
  } awlock_e;

  //Enum: arlock_e
  //Used to declare enum type for read lock access
  typedef enum bit {
    READ_NORMAL_ACCESS    = 1'b0,
  //  READ_EXCLUSIVE_ACCESS = 1'b1
  } arlock_e;

  //Enum: awcache_e
  //Used to declare enum type for write cache access
  typedef enum bit [3:0] {
    WRITE_BUFFERABLE,
    WRITE_MODIFIABLE,
    WRITE_OTHER_ALLOCATE,
    WRITE_ALLOCATE
  } awcache_e;

  //Enum: arcache_e
  //Used to declare enum type for read cache access
  typedef enum bit [3:0] {
    READ_BUFFERABLE,
    READ_MODIFIABLE,
    READ_OTHER_ALLOCATE,
    READ_ALLOCATE
  } arcache_e;

  //Enum: endian_e
  //Used to declare enum type for the endians
  // typedef enum bit {
  //   BIG_ENDIAN    = 1'b0,
  //   LITTLE_ENDIAN = 1'b1
  // } endian_e;

  //Enum: awprot_e 
  //Used to declare enum type of write protection of the transaction
  typedef enum bit [2:0] {
    WRITE_NORMAL_SECURE_DATA               = 3'b000,
    WRITE_NORMAL_SECURE_INSTRUCTION        = 3'b001,
    WRITE_NORMAL_NONSECURE_DATA            = 3'b010,
    WRITE_NORMAL_NONSECURE_INSTRUCTION     = 3'b011,
    WRITE_PRIVILEGED_SECURE_DATA           = 3'b100,
    WRITE_PRIVILEGED_SECURE_INSTRUCTION    = 3'b101,
    WRITE_PRIVILEGED_NONSECURE_DATA        = 3'b110,
    WRITE_PRIVILEGED_NONSECURE_INSTRUCTION = 3'b111
  } awprot_e;

  //Enum: arprot_e 
  //Used to declare enum type of read protection of the transaction
  typedef enum bit [2:0] {
    READ_NORMAL_SECURE_DATA               = 3'b000,
    READ_NORMAL_SECURE_INSTRUCTION        = 3'b001,
    READ_NORMAL_NONSECURE_DATA            = 3'b010,
    READ_NORMAL_NONSECURE_INSTRUCTION     = 3'b011,
    READ_PRIVILEGED_SECURE_DATA           = 3'b100,
    READ_PRIVILEGED_SECURE_INSTRUCTION    = 3'b101,
    READ_PRIVILEGED_NONSECURE_DATA        = 3'b110,
    READ_PRIVILEGED_NONSECURE_INSTRUCTION = 3'b111
  } arprot_e;

  //Enum: awid_e
  //Used to declare the enum type of write address id
  typedef enum bit [15:0] {
    AWID_0  = 16'd0,
    AWID_1  = 16'd1,
    AWID_2  = 16'd2,
    AWID_3  = 16'd3,
    AWID_4  = 16'd4,
    AWID_5  = 16'd5,
    AWID_6  = 16'd6,
    AWID_7  = 16'd7,
    AWID_8  = 16'd8,
    AWID_9  = 16'd9,
    AWID_10 = 16'd10,
    AWID_11 = 16'd11,
    AWID_12 = 16'd12,
    AWID_13 = 16'd13,
    AWID_14 = 16'd14,
    AWID_15 = 16'd15
  } awid_e;

  //Enum: bid_e
  //Used to declare the enum type of write response id
  typedef enum bit [15:0] {
    BID_0  = 16'd0,
    BID_1  = 16'd1,
    BID_2  = 16'd2,
    BID_3  = 16'd3,
    BID_4  = 16'd4,
    BID_5  = 16'd5,
    BID_6  = 16'd6,
    BID_7  = 16'd7,
    BID_8  = 16'd8,
    BID_9  = 16'd9,
    BID_10 = 16'd10,
    BID_11 = 16'd11,
    BID_12 = 16'd12,
    BID_13 = 16'd13,
    BID_14 = 16'd14,
    BID_15 = 16'd15
  } bid_e;

  //Enum: arid_e
  //Used to declare the enum type of read address id
  typedef enum bit [15:0] {
    ARID_0  = 16'd0,
    ARID_1  = 16'd1,
    ARID_2  = 16'd2,
    ARID_3  = 16'd3,
    ARID_4  = 16'd4,
    ARID_5  = 16'd5,
    ARID_6  = 16'd6,
    ARID_7  = 16'd7,
    ARID_8  = 16'd8,
    ARID_9  = 16'd9,
    ARID_10 = 16'd10,
    ARID_11 = 16'd11,
    ARID_12 = 16'd12,
    ARID_13 = 16'd13,
    ARID_14 = 16'd14,
    ARID_15 = 16'd15
  } arid_e;

  //Enum: rid_e
  //Used to declare the enum type of read data/response id
  typedef enum bit [15:0] {
    RID_0  = 16'd0,
    RID_1  = 16'd1,
    RID_2  = 16'd2,
    RID_3  = 16'd3,
    RID_4  = 16'd4,
    RID_5  = 16'd5,
    RID_6  = 16'd6,
    RID_7  = 16'd7,
    RID_8  = 16'd8,
    RID_9  = 16'd9,
    RID_10 = 16'd10,
    RID_11 = 16'd11,
    RID_12 = 16'd12,
    RID_13 = 16'd13,
    RID_14 = 16'd14,
    RID_15 = 16'd15
  } rid_e;

  //Enum: bresp_e
  //Used to declare the enum type of write response
  typedef enum bit [1:0] {
    WRITE_OKAY   = 2'b00,
    WRITE_EXOKAY = 2'b01,
    WRITE_SLVERR = 2'b10,
    WRITE_DECERR = 2'b11
  } bresp_e;

  //Enum: rresp_e
  //Used to declare the enum type of read response
  typedef enum bit [1:0] {
    READ_OKAY   = 2'b00,
    READ_EXOKAY = 2'b01,
    READ_SLVERR = 2'b10,
    READ_DECERR = 2'b11
  } rresp_e;

  //Enum: tx_type
  //Used to declare the type of transaction done
  // typedef enum bit {
  //   WRITE = 1,
  //   READ  = 0
  // } tx_type_e;

  //Enum : transfer_type_e
  //Used to the determine the type of the transfer
  // typedef enum bit[1:0] {
  //   BLOCKING_WRITE      = 2'b00, 
  //   BLOCKING_READ       = 2'b01, 
  //   NON_BLOCKING_WRITE  = 2'b10, 
  //   NON_BLOCKING_READ   = 2'b11 
  // }transfer_type_e;

  //Enum : read_data_type_mode_e
  //Used to the determine the type of the read data
  // typedef enum bit[1:0] {
  //   RANDOM_DATA_MODE = 2'b00,
  //   SLAVE_MEM_MODE   = 2'b01,
  //   USER_DATA_MODE   = 2'b10,
  //   SLAVE_ERR_RESP_MODE = 2'b11
  // } read_data_type_mode_e;

  //Enum : transfer_type_e  
  //Used to determine the mode for score board check 
  // typedef enum bit[1:0] {
  //   ONLY_WRITE_DATA  = 2'b00,
  //   ONLY_READ_DATA   = 2'b01,
  //   WRITE_READ_DATA  = 2'b10
  // } write_read_data_mode_e;
  
  //Enum : Response_mode_e  
  //Used to determine the mode of response to send
  // typedef enum bit[1:0] {
  //   RESP_IN_ORDER                 = 2'b00,
  //   ONLY_READ_RESP_OUT_OF_ORDER   = 2'b01,
  //   WRITE_READ_RESP_OUT_OF_ORDER  = 2'b10,
  //   ONLY_WRITE_RESP_OUT_OF_ORDER  = 2'b11
  // } response_mode_e;

  //Enum : QoS_mode_e
  // typedef enum bit[1:0] {
  //   QOS_MODE_DISABLE            = 2'b00,
  //   ONLY_READ_QOS_MODE_ENABLE   = 2'b01,
  //   WRITE_READ_QOS_MODE_ENABLE  = 2'b10,
  //   ONLY_WRITE_QOS_MODE_ENABLE  = 2'b11
  // } qos_mode_e;





 

endpackage : axi4_globals_pkg

`endif
