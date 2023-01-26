import PropTypes from 'prop-types';
import React, { useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import Table from './Table';

const IftaRates = (props) => {
  const [iftaRates] = props.ifta_rates; 

  return (
    <div>
      <Table iftaRates={iftaRates}/>
    </div>
  );
};

// HelloWorld.propTypes = {
//   name: PropTypes.string.isRequired, // this is passed from the Rails view
//   year: PropTypes.number.isRequired,
// };

export default IftaRates;
