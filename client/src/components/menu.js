import React, {Component} from 'react';
import moment from 'moment';
import PropTypes from 'prop-types';
import {connect} from 'react-redux';
import {getMenu} from '../actions/menu'

class Menu extends Component {


    static propTypes = {
        menuList: PropTypes.array,
        isShowLoader: PropTypes.array
    }


    /**
     * Mounting component and get all data
     *
     * @param nextProps
     */
    componentDidMount(nextProps) {
        this.props.getMenu();
    }

    /**
     * Renders menu
     *
     * @returns {*}
     */
    render() {
        return(<div>
            {this.props.isShowLoader === false ?(
                <div></div>
            ):(<div>Loading......</div>)
            }
        </div>);
    }
}



const mapStateToProps = (store) => {
    const {menuList,isShowLoader} = store.menu
    console.log("menulist >>>> ",menuList);
    return {
        menuList:menuList,
        isShowLoader:isShowLoader
    }
}


const mapDispatchToProps = (dispatch) => {
    return {
        getMenu: () => {
           dispatch(getMenu())
        },
    }
}


export default connect(mapStateToProps ,mapDispatchToProps)(Menu)