import {
    RECEIVED_MENU
} from "../actions/menu"


const initialState = {
    dataMenu: {},
    isShowLoader: true
};

export default function getsMenu(state = initialState, action){
        switch ( action.type ) {
            case RECEIVED_MENU:
                console.log('data menu ', action.dataMenu);
                return {
                        ...state,
                        dataMenu: action.dataMenu,
                        isShowLoader: false
                    }
                break;
            default:
                return state;

        }
}
