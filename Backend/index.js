const express = require('express');
const morgan = require('morgan');
const dotenv = require('dotenv');
const AppError = require('./utils/appError')
const globalErrorHandler = require('./controllers/errorController')
const userRouter = require('./Routes/userRoutes')

require('dotenv').config();

dotenv.config({path: 'config.env'});

const app = express();
//Middlewares

if(process.env.NODE_ENV === 'development'){
    app.use(morgan('dev'));
}

app.use(express.json());
app.use(express.static(`${__dirname}/public`))

//Routes

app.use('/api/v1/users',userRouter);
 
app.all('*',(req,res,next)=>{
    next(new AppError(`Can't find ${req.originalUrl} on this server`,404))
})

app.use(globalErrorHandler)

module.exports = app;