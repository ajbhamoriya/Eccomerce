class Appointment < ApplicationRecord
	belongs_to :physician
	belongs_to :patient
	validates_associated :physician, :patient
	validates :appointment_date,presence: true, uniqueness: {
    scope: [ :patient_id, :physician_id ]
  }
  has_one_attached :prescription
  validate :correct_prescription_mime_type, on: :show
  has_one_attached :test_report
  validate :correct_report_mime_type, on: :show
private
  def correct_prescription_mime_type
    #if prescription.attached? && !prescription.content_type.in?(%w(application/pdf))
     #errors.add(:prescription, 'Must be a PDF ')
    if !prescription.attached?
      errors.add(:prescription,'Please attach prescription here')
    end
  end

  def correct_report_mime_type
    #if test_report.attached? && !test_report.content_type.in?(%w(application/pdf))
      #errors.add(:test_report, 'Must be a PDF')
    if !test_report.attached?
      errors.add(:test_report,'Please attach test_report here')
  end
  end
 # validates :prescription, :test_report,presence: true
end

