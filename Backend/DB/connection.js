import mongoose from "mongoose";
import dotenv from "dotenv";

dotenv.config(); 

const db = process.env.DB_URI;

const connectDb = async () => {
  try {
    await mongoose
      .connect(db, {
        useNewUrlParser: true,
        useUnifiedTopology: true,
      });
    console.log("MongoDB connected successfully");
  } catch (err) {
    console.error("MongoDB connection error:", err);
  }
};

export default connectDb;
