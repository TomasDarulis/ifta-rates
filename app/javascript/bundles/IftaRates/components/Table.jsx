import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import DataTable from 'react-data-table-component';

const Table = (props) => {
    const iftaRates = props.iftaRates

    const data = iftaRates.map((iftaRate)=>{
        return {
            year: iftaRate.year,
            quarter: iftaRate.quarter,
            status: iftaRate.status,
            ...iftaRate.rates,
        }
    })

    const states = []
    iftaRates.forEach((iftaRate)=>{
        states.push(...Object.keys(iftaRate.rates))
    })

    const uniqueStates = [...new Set(states)]

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
    ];

    columns.push(...uniqueStates.map(state => {
        return { name: state, selector: state, sortable: true, maxWidth: "20px"};
    }))

     return(
       <div>
           <DataTable pagination title="Ifta Rates" className="table" columns={columns} data={data} />
       </div>
     );
};

export default Table;
