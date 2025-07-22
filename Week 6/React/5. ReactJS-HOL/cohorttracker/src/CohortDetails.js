// CohortDetails.jsx
import React from 'react';
import styles from './CohortDetails.module.css';

const cohorts = [
  {
    id: 'INTADMDF10',
    name: '.NET FSD',
    startDate: '22-Feb-2022',
    status: 'Scheduled',
    coach: 'Aathma',
    trainer: 'Jojo Jose'
  },
  {
    id: 'ADM21JF014',
    name: 'Java FSD',
    startDate: '10-Sep-2021',
    status: 'Ongoing',
    coach: 'Apoorv',
    trainer: 'Elisa Smith'
  },
  {
    id: 'CDBJF21025',
    name: 'Java FSD',
    startDate: '24-Dec-2021',
    status: 'Ongoing',
    coach: 'Aathma',
    trainer: 'John Doe'
  }
];

const CohortDetails = () => {
  return (
    <div>
      <h2>Cohorts Details</h2>
      {cohorts.map((cohort) => {
        const isOngoing = cohort.status.toLowerCase() === 'ongoing';
        const headingStyle = {
          color: isOngoing ? 'green' : 'blue'
        };

        return (
          <div key={cohort.id} className={styles.box}>
            <h3 style={headingStyle}>
              {cohort.id} - {cohort.name}
            </h3>
            <dl>
              <dt>Started On</dt>
              <dd>{cohort.startDate}</dd>

              <dt>Current Status</dt>
              <dd>{cohort.status}</dd>

              <dt>Coach</dt>
              <dd>{cohort.coach}</dd>

              <dt>Trainer</dt>
              <dd>{cohort.trainer}</dd>
            </dl>
          </div>
        );
      })}
    </div>
  );
};

export default CohortDetails;
