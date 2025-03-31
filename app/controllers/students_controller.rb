class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show update destroy ]

  def index
    @students = Student.order(created_at: :asc)

    render json: @students
  end

  def show
    render json: @student
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      @student.destroy!
      render json: { message: "Student successfully deleted" }, status: :ok
    rescue ActiveRecord::RecordNotDestroyed => e
      render json: { error: e.message }, status: :unprocessable_entity
    rescue => e
      render json: { error: "An unexpected error occurred" }, status: :internal_server_error
    end
  end

  private
    def set_student
      @student = Student.find(params.expect(:id))
    end

    def student_params
      params.require(:student).permit(:name, :grade)
    end
end
