import {
    RECEIVED_LIST
} from "../actions/list"


const initialState = {
    listGoods: {},
    isShowLoader: true
};

export default function getsListProducts(state = initialState, action){
     console.log('huiiiii ', action.listGoods);
    switch ( action.type ) {

        case RECEIVED_LIST:
            return {
                ...state,
                listGoods: action.listGoods,
                isShowLoader: false
            }
            break;
        default:
            return state;

    }
}
