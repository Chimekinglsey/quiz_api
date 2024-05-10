import React from 'react';
import { Modal, ModalHeader, ModalBody, ModalFooter, Button } from 'react-bootstrap';

const SuccessModal = ({ title, message, score, showModal, onClose }) => {
  return (
    <Modal show={showModal} onHide={onClose}>
      <ModalHeader closeButton>
        <Modal.Title>{title}</Modal.Title>
      </ModalHeader>
      <ModalBody>
        <p>Your score: {score}</p>
        <p>{message}</p>
      </ModalBody>
      <ModalFooter>
        <Button variant="primary" onClick={onClose}>
          Close
        </Button>
      </ModalFooter>
    </Modal>
  );
};

export default SuccessModal;
