// import PropTypes from 'prop-types';
// import React, { useState } from 'react';
// import 'bootstrap/dist/css/bootstrap.min.css';
// import { Table } from 'reactstrap';
// import style from './HelloWorld.module.css';
//
// const IftaRate = (props) => {
//   const iftaRates = props.iftaRates;
//
//   return (
//   <div>
//       <Table bordered hover>
//         <thead>
//           <tr>
//             <th>Year</th>
//             <th>Quarter</th>
//             <th>Status</th>
//             <th>Rates by State</th>
//           </tr>
//         </thead>
//         <tbody>
//         {iftaRates.map((iftaRate) => (
//             <tr key={iftaRate.id}>
//               <td>{iftaRate.year}</td>
//               <td>{iftaRate.quarter}</td>
//               <td>{iftaRate.status}</td>
//               <td>
//                 <div className={style.states}>
//                   {Object.entries(iftaRate.rates).map(([state, rate]) => (
//                     <span key={state}>{state + ': $' + rate + ' '}</span>
//                   ))}
//                 </div>
//               </td>
//           </tr>
//           ))}
//         </tbody>
//       </Table>
//   </div>
//
//   );
// };
//
// export default IftaRate;
//
