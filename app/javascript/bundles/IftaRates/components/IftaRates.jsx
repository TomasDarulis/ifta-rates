import PropTypes from 'prop-types';
import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import Table from './Table';

const IftaRates = (props) => {
  const iftaRates = props.ifta_rates; 

  return (
    <div>
      <Table iftaRates={iftaRates}/>
    </div>
  );
};

export default IftaRates;
