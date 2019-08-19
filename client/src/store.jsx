import { createStore, combineReducers , applyMiddleware } from 'redux'
import thunkMiddleware from 'redux-thunk'
// import { createLogger } from 'redux-logger'
import getsMenu from './reducers/menu'
// import {authentication} from './reducers/users.jsx'
// const loggerMiddleware = createLogger()
const middleware = [ thunkMiddleware ]


export default function configureStore(preloadedState) {
    return createStore(
        combineReducers({
                 menu: getsMenu,
                // authetication:authentication
            }),
        applyMiddleware(
            ...middleware
        ),
    )
}