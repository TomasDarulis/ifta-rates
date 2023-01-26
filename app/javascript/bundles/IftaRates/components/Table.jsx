import PropTypes from 'prop-types';
import React, { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import style from './IftaRates.module.css';
import DataTable from 'react-data-table-component';

const Table = (props) => {
    const data = props.iftaRates;

    const RatesStates = row => (
        <div className={style.states}>
            {Object.entries(row.rates).map(([state, rate]) => (
                <span key={state}>{state + ': $' + rate + ' '}</span>
            ))}
        </div>
    );

    const columns = [
        {
            name: 'Year',
            selector: row => row.year,
            sortable: true,
            maxWidth: "20px",
        },
        {
            name: 'Quarter',
            selector: row => row.quarter,
            sortable: true,
            maxWidth: "20px",
        },
        {
            name: 'Status',
            selector: row => row.status,
            maxWidth: "20px",
            sortable: true,
        },
        {
            name: 'Rates by State',
            cell: row => <RatesStates {...row}/>
        },
    ];

     return(
       <div>
           <DataTable pagination title="Ifta Rates" className="table" columns={columns} data={data} />
       </div>
     );
};

export default Table;
