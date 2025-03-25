import mongoose from 'mongoose';
import dotenv from 'dotenv';

dotenv.config();

const user = process.env.MONGO_USER;
const password = process.env.MONGO_PASSWORD;
 
const dbUri = `mongodb://${user}:${password}@mongodb-service:27017`;

const connectDB = async () => {
  try {
    await mongoose.connect(dbUri!, {
    });
    console.log('MongoDB connected');
  } catch (error) {
    console.error('MongoDB connection error:', error);
    process.exit(1);
  }
};

export default connectDB;
