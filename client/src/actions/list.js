/**
 * Created by ivanlobodyuk on 26.08.19.
 */

import {config} from '../config';
import {handleResponse} from "../helpers/response";

export const RECEIVED_LIST = 'RECEIVED_LIST';

export function receivingList(category,ordering,limitOffset ){

    return (dispatch, getState) => {
        console.log(' config api url 111111', config.apiUrl);
        fetch( config.apiUrl + 'shop').then( handleResponse ).then( json => {
            console.log( 'list gooods ', json );
            dispatch(receivedList(json))
        })
    }
}

/**
 * received Menu
 *
 * @param dataList
 * @returns {{type: string, listGoods: *}}
 */
export function receivedList(listGoods){
    return {
        type: RECEIVED_LIST,
        listGoods: listGoods
    }
}