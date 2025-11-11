suite = testsuite("testComputeDiscount");
% Create a test runner and customize it using a plugin that generates a 
% Cobertura XML code coverage report for the source code in the file 
% quadraticSolver.m. Specify that the plugin writes its output to a file 
% named coverageReport.xml in your current folder.
import matlab.unittest.plugins.CodeCoveragePlugin
import matlab.unittest.plugins.codecoverage.CoberturaFormat
runner = testrunner("textoutput");
sourceCodeFile = "computeDiscount.m";
reportFile = "coverageReportFH.xml";
reportFormat = CoberturaFormat(reportFile);
p = CodeCoveragePlugin.forFile(sourceCodeFile,"Producing",reportFormat,'MetricLevel','decision');
runner.addPlugin(p)
% Run the tests. In this example, all the tests pass and the source code 
% receives full coverage. The plugin generates a Cobertura XML code 
% coverage report in your current folder.
results = runner.run(suite);