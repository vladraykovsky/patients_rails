class PatientsController < ApplicationController

  skip_before_action :verify_authenticity_token

   def index
     patients = Patient.all
     render json: patients
   end

  def show
    patient = Patient.find(params[:id])
    render json: patient
  end

  def destroy
    patient = Patient.find(params[:id])
    patient.destroy
    render json: patient
  end

  def create
    patient = Patient.new(patient_params)
    if patient.save
      render json: patient
    else
      render json: {mistake: 'ERROR'}
    end
  end


  def update
     patient = Patient.find(params[:id])
     if patient.update_attributes(patient_params)
       render json: patient
     else
       render json: {mistake: 'ERROR'}
     end
  end


  def patient_params
    params.permit(:name,:surname,:dateOfBirth,:sex,:country,:state)
  end





end
