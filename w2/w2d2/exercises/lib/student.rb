# ## Student
# * `Student#initialize` should take a first and last name.
# * `Student#name` should return the concatenation of the student's
#   first and last name.
# * `Student#courses` should return a list of the `Course`s in which
#   the student is enrolled.
# * `Student#enroll` should take a `Course` object, add it to the
#   student's list of courses, and update the `Course`'s list of
#   enrolled students.
#     * `enroll` should ignore attempts to re-enroll a student.
# * `Student#course_load` should return a hash of departments to # of
#   credits the student is taking in that department.


class Student

  attr_reader :first_name, :last_name, :courses

  def initialize(first_name,last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{first_name} #{last_name}"
  end

  def courses
    @courses
  end

  def enroll(course)
    return if courses.include?(course)
    raise "course would cause conflict!" if has_conflict?(course)

    @courses << course
    course.students << self
  end

  def course_load
    load = {}

    @courses.each do |course|
      if load.include?(course.department)
        load[course.department] += course.credits
      else
        load[course.department] = course.credits
      end
    end

    load
  end

  def has_conflict?(new_course)
    @courses.any? do |course|
      new_course.conflicts_with?(course)
    end
  end

end
