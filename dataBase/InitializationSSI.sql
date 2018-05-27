/******************************************************************************
**  Name: script to initialize table with values - team A
**  Desc: add initialization of next tables Accident, Sickness, SaCategory, SaType
          , ExistingPpeAssigned, ExistingPpe, Ppe, PpeClassification, ExistingWorkItem
          , WorkItem and  WorkItemClassification
**
**  Author: Henry Bustamante
**  Description: is pending scripts added by marcelo, (employee, and other tables), to work completely this script
**  Date: 05/26/2018
*******************************************************************************/

SET XACT_ABORT ON;
SET NOCOUNT ON;

BEGIN TRANSACTION;

PRINT 'Insert data into the SaCategory table...';

--SET IDENTITY_INSERT dbo.SaCategory ON
INSERT INTO [dbo].[SaCategory] ([category],[description],[reference])
VALUES ('Days out of work', 'this category is follow the OSHA documentation', 'Formulario OSHA - 300');
INSERT INTO [dbo].[SaCategory] ([category],[description],[reference])
VALUES ('Testricted / Transferred work', 'this category is follow the OSHA documentation', 'Formulario OSHA - 300');
INSERT INTO [dbo].[SaCategory] ([category],[description],[reference])
VALUES ('Remained at work', 'this category is follow the OSHA documentation', 'Formulario OSHA - 300');
INSERT INTO [dbo].[SaCategory] ([category],[description],[reference])
VALUES ('Other recordable cases', 'this category is follow the OSHA documentation', 'Formulario OSHA - 300');
INSERT INTO [dbo].[SaCategory] ([category],[description],[reference])
VALUES ('Death', 'this category is follow the OSHA documentation', 'Formulario OSHA - 300');
--SET IDENTITY_INSERT dbo.SaCategory OFF;
PRINT 'SaCategory table done...';

PRINT 'Insert data into the SaCategory table...';

--SET IDENTITY_INSERT dbo.SaType ON
INSERT INTO [dbo].[SaType] ([type],[description])
VALUES ('Injury', 'this type was includes by osha rules normative');
INSERT INTO [dbo].[SaType] ([type],[description])
VALUES ('Skin disorder', 'this type was includes by osha rules normative');
INSERT INTO [dbo].[SaType] ([type],[description])
VALUES ('Respiratory condition', 'this type was includes by osha rules normative');
INSERT INTO [dbo].[SaType] ([type],[description])
VALUES ('Poisoning', 'this type was includes by osha rules normative');
INSERT INTO [dbo].[SaType] ([type],[description])
VALUES ('Hearing loss', 'this type was includes by osha rules normative');
INSERT INTO [dbo].[SaType] ([type],[description])
VALUES ('Other diseases', 'this type was includes by osha rules normative');
--SET IDENTITY_INSERT dbo.SaType OFF;
PRINT 'SaType table done...';

PRINT 'Insert data into the Sickness table....';
--SET IDENTITY_INSERT dbo.REPLACEMENT ON
INSERT INTO [dbo].[Sickness] ([description],[dateSickness],[statusRecord],[whereOcurr],[totalDaysOutOfWork],[totalDaysRestrictedTrasnferredWork],[employeeId],[saCategoryId],[saTypeId])
VALUES ('during the night duty shift and with inadequate clothing is that the employee has a cold, and due to negligence', '2018-05-05 14:05:03', 1, 'this happened on guard night shift', 3, 4, 1, 1, 2);
INSERT INTO [dbo].[Sickness] ([description],[dateSickness],[statusRecord],[whereOcurr],[totalDaysOutOfWork],[totalDaysRestrictedTrasnferredWork],[employeeId],[saCategoryId],[saTypeId])
VALUES ('More than 5 years working with Zika discharge affects the employee lungs', '2018-01-03 14:05:03', 1, 'this happened on guard night shift', 3, 4, 1, 1, 1);
INSERT INTO [dbo].[Sickness] ([description],[dateSickness],[statusRecord],[whereOcurr],[totalDaysOutOfWork],[totalDaysRestrictedTrasnferredWork],[employeeId],[saCategoryId],[saTypeId])
VALUES ('More than 4 years working with the material download caused damage to the shoulders and now needs physiotherapy', '2018-01-02 14:05:03', 1, 'During jornal work, in the new building', 3, 4, 2, 1, 2);
INSERT INTO [dbo].[Sickness] ([description],[dateSickness],[statusRecord],[whereOcurr],[totalDaysOutOfWork],[totalDaysRestrictedTrasnferredWork],[employeeId],[saCategoryId],[saTypeId])
VALUES ('before he had an accident with the mechanical shovel and now his hand is infected', '2018-03-09 14:05:03', 1, 'During jornal work, in the new building', 3, 4, 1, 1, 1);
INSERT INTO [dbo].[Sickness] ([description],[dateSickness],[statusRecord],[whereOcurr],[totalDaysOutOfWork],[totalDaysRestrictedTrasnferredWork],[employeeId],[saCategoryId],[saTypeId])
VALUES ('More than 4 years working with the material download caused damage to the shoulders and now needs physiotherapy', '2017-06-07 14:05:03', 1, 'During jornal work, in the new building', 3, 4, 3, 2, 1);
INSERT INTO [dbo].[Sickness] ([description],[dateSickness],[statusRecord],[whereOcurr],[totalDaysOutOfWork],[totalDaysRestrictedTrasnferredWork],[employeeId],[saCategoryId],[saTypeId])
VALUES ('got sick and now has vision problems', '2017-08-10 14:05:03', 1, 'During jornal work, in the new building', 3, 4, 1, 1, 1);
-- SET IDENTITY_INSERT dbo.REPLACEMENT OFF;
PRINT 'Sickness table done...';

PRINT 'Insert data into the Accident table....';
INSERT INTO [dbo].[Accident] ([description],[dateAccident],[statusRecord],[whereOcurr],[totalDaysOutOfWork],[totalDaysRestrictedTrasnferredWork],[employeeId],[saCategoryId],[saTypeId])
VALUES ('It happened when employee was not using his protection', '2018-05-05 14:05:03', 1, 'It happened when employee was not using his protection,this occurred on the building, during last night.', 0, 2, 2, 1, 2);
INSERT INTO [dbo].[Accident] ([description],[dateAccident],[statusRecord],[whereOcurr],[totalDaysOutOfWork],[totalDaysRestrictedTrasnferredWork],[employeeId],[saCategoryId],[saTypeId])
VALUES ('when they unloaded cargo of sika burst a bag', '2017-05-05 14:05:03', 1, 'where the new building of west america Avenue No. 123', 3, 4, 3, 1, 3);
INSERT INTO [dbo].[Accident] ([description],[dateAccident],[statusRecord],[whereOcurr],[totalDaysOutOfWork],[totalDaysRestrictedTrasnferredWork],[employeeId],[saCategoryId],[saTypeId])
VALUES ('when the tractor turned suddenly it hit the mixer truck', '2017-06-05 14:05:03', 1, 'in the building under construction', 3, 4, 3, 3, 3);
INSERT INTO [dbo].[Accident] ([description],[dateAccident],[statusRecord],[whereOcurr],[totalDaysOutOfWork],[totalDaysRestrictedTrasnferredWork],[employeeId],[saCategoryId],[saTypeId])
VALUES ('It happened when employee was not using his protection', '2017-08-09 14:05:03', 1, 'It happened when employee was not using his protection,this occurred on the building, during last night.', 0, 2, 2, 3, 1);
PRINT 'Accident table done...';

PRINT 'Insert data into the PpeClassification table....';
INSERT INTO [dbo].[PpeClassification] ([name], [description])
VALUES ('Protección de cráneo', 'Son elementos que cubren totalmente el cráneo, protegiéndolo contra los efectos de golpes, sustancias químicas, riesgos eléctricos y térmicos.');
INSERT INTO [dbo].[PpeClassification] ([name], [description])
VALUES ('Protección de manos', 'Son elementos que cubren totalmente las manos, protegiéndolo contra agentes que puedan presentarse en los insumos de materia prima como sustancias químicas, riesgos eléctricos y térmicos.');
INSERT INTO [dbo].[PpeClassification] ([name], [description])
VALUES ('Protección de pies', 'Son elementos que cubren totalmente los pies, protegiéndolo contra los efectos de, sustancias químicas, riesgos eléctricos y térmicos.');
PRINT 'PpeClassification table done...';

PRINT 'Insert data into the Ppe table....';
INSERT INTO [dbo].[Ppe] ([name], [description], [ppeClassificationId])
VALUES ('Casco', 'Protege contra golpes en la cabeza.', 1);
INSERT INTO [dbo].[Ppe] ([name], [description], [ppeClassificationId])
VALUES ('Guantes', 'Protege contra sustancias químicas, riesgos eléctricos y térmicos.', 2);
INSERT INTO [dbo].[Ppe] ([name], [description], [ppeClassificationId])
VALUES ('Botas', 'Protege contra colges, ailamiento de corriente.', 3);
PRINT 'Ppe table done...';

PRINT 'Insert data into the ExistingPpe table....';
INSERT INTO [dbo].[ExistingPpe] ([detail], [lifeTimeDays],[currentLifeTimeDays], [purchaseDate], [ppeId])
VALUES ('10101-CA', 100, 100, '2017-12-09 14:05:03', 1);
INSERT INTO [dbo].[ExistingPpe] ([detail], [lifeTimeDays],[currentLifeTimeDays], [purchaseDate], [ppeId])
VALUES ('10102-GU', 100, 100, '2017-12-12 14:05:03', 2);
INSERT INTO [dbo].[ExistingPpe] ([detail], [lifeTimeDays],[currentLifeTimeDays], [purchaseDate], [ppeId])
VALUES ('10103-BO', 100, 100, '2017-12-12 14:05:03', 3);
PRINT 'ExistingPpe table done...';

PRINT 'Insert data into the ExistingPpeAssigned table....';
INSERT INTO [dbo].[ExistingPpeAssigned] ([assignedNotes], [assignedDate],[returnNotes], returnDate, [existingPpeId], [employeeId])
VALUES ('Asignado un casco en buen estado', '2017-12-09 14:05:03', 'nothing to tell', '', 1, 1);
INSERT INTO [dbo].[ExistingPpeAssigned] ([assignedNotes], [assignedDate],[returnNotes], returnDate, [existingPpeId], [employeeId])
VALUES ('Asignado un par de guantes en buen estado', '2018-02-03 14:05:03', 'nothing to tell', '', 1, 2);
INSERT INTO [dbo].[ExistingPpeAssigned] ([assignedNotes], [assignedDate],[returnNotes], returnDate, [existingPpeId], [employeeId])
VALUES ('Asignado un par de botas en buen estado', '2017-12-11 14:05:03', 'nothing to tell', '2018-02-03 14:05:03', 2, 3);
PRINT 'ExistingPpeAssigned table done...';

PRINT 'Insert data into the WorkItemClassification table....';
INSERT INTO [dbo].[WorkItemClassification] ([name], [description])
VALUES ('Herramienta manual', 'Son impulsados manualmente.');
INSERT INTO [dbo].[WorkItemClassification] ([name], [description])
VALUES ('Herramienta electronica', 'Son manipulados con comandos.');
INSERT INTO [dbo].[WorkItemClassification] ([name], [description])
VALUES ('Herramienta digital', 'son operados por personas expertas en ello.');
PRINT 'WorkItemClassification table done...';

PRINT 'Insert data into the WorkItem table....';
INSERT INTO [dbo].[WorkItem] ([name], [description],[workItemClassificationId])
VALUES ('Casco', 'Casco de seguridad', 1);
INSERT INTO [dbo].[WorkItem] ([name], [description],[workItemClassificationId])
VALUES ('Guante', 'Guantes de seguridad', 2);
INSERT INTO [dbo].[WorkItem] ([name], [description],[workItemClassificationId])
VALUES ('Botas', 'Botas de seguridad', 3);
PRINT 'WorkItem table done...';

PRINT 'Insert data into the WorkItem table....';
INSERT INTO [dbo].[ExistingWorkItem] ([detail], [purchaseDate],[serieNo], [workItemId])
VALUES ('Adicionando stock de moledora', '2017-12-12 14:05:03', '111-CA', 1);
INSERT INTO [dbo].[ExistingWorkItem] ([detail], [purchaseDate],[serieNo], [workItemId])
VALUES ('Adicionando stock de Volqueta', '2018-01-12 14:05:03', '145-VO', 1);
INSERT INTO [dbo].[ExistingWorkItem] ([detail], [purchaseDate],[serieNo], [workItemId])
VALUES ('Adicionando stock de Mezcladora', '2018-05-04 14:05:03', '567-ME', 1);
PRINT 'WorkItem table done...';

COMMIT TRANSACTION;