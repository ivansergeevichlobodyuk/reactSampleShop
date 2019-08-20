import {config} from '../config';
import {handleResponse} from "../helpers/response";

export const RECEIVED_MENU = 'RECEIVED_MENU';

/**
 * received menu:
 *
 * @param dataMenu
 * @returns {{dataMenu: *, type: string}}
 */
export function receivedMenu(dataMenu){
    return {
        type: RECEIVED_MENU,
        dataMenu: dataMenu
    }
}

/**
 * Call to api and get data menu then dispatch action receivedMenu when menu received
 *
 *
 * @returns {Function}
 */
export function getMenu(){
    return (dispatch, getState) => {
        fetch(config.apiUrl + 'menuload/list/').then( handleResponse ).then( json => {
            dispatch(receivedMenu(json))
        })
    }
}