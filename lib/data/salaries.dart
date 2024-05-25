class SalaryData {
  final int year;
  final int totalJobs;
  final double averageSalary;
  final List<JobDetail> jobs;

  SalaryData(
      {required this.year,
      required this.totalJobs,
      required this.averageSalary,
      required this.jobs});
}

class JobDetail {
  final String title;
  final int count;

  JobDetail({required this.title, required this.count});
}

final List<SalaryData> salaryData = [
  SalaryData(year: 2020, totalJobs: 150, averageSalary: 120000, jobs: [
    JobDetail(title: 'Data Scientist', count: 50),
    JobDetail(title: 'ML Engineer', count: 100)
  ]),
  SalaryData(year: 2021, totalJobs: 180, averageSalary: 130000, jobs: [
    JobDetail(title: 'Data Scientist', count: 60),
    JobDetail(title: 'ML Engineer', count: 120)
  ]),
  SalaryData(year: 2022, totalJobs: 200, averageSalary: 140000, jobs: [
    JobDetail(title: 'Data Scientist', count: 70),
    JobDetail(title: 'ML Engineer', count: 130)
  ]),
  SalaryData(year: 2023, totalJobs: 220, averageSalary: 150000, jobs: [
    JobDetail(title: 'Data Scientist', count: 80),
    JobDetail(title: 'ML Engineer', count: 140)
  ]),
  SalaryData(year: 2024, totalJobs: 240, averageSalary: 160000, jobs: [
    JobDetail(title: 'Data Scientist', count: 90),
    JobDetail(title: 'ML Engineer', count: 150)
  ]),
];
