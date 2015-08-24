<?php

    /**
    * @backupGlobals disabled
    * @backupStaticAttributes disabled
    */

    require_once "src/Task.php";
    require_once "src/Category.php";

    $server = 'mysql:host=localhost;dbname=to_do_test';
    $username = 'root';
    $password = 'root';
    $DB = new PDO($server, $username, $password);


    class TaskTest extends PHPUnit_Framework_TestCase
    {

        protected function tearDown()
        {
            Task::deleteAll();
            Category::deleteAll();
        }

        function test_getId()
        {
            //Arrange
            $name = "Home stuff";
            $id = null;
            $test_category = new Category($name, $id);
            $test_category->save();

            $description = "Wash the dog";
            $test_due_date = "2015-09-16";
            $test_task = new Task($description, $id, $test_due_date);
            $test_task->save();

            //Act
            $result = $test_task->getId();

            //Assert
            $this->assertEquals(true, is_numeric($result));
        }

        function test_save()
        {
            //Arrange
            $name = "Home stuff";
            $id = null;
            $test_category = new Category($name, $id);
            $test_category->save();

            $description = "Wash the dog";
            $test_due_date = "2015-09-16";
            $test_task = new Task($description, $id, $test_due_date);

            //Act
            $test_task->save();

            //Assert
            $result = Task::getAll();
            $this->assertEquals($test_task, $result[0]);

        }

        function test_getAll()
        {
            //Arrange
            $name = "Home stuff";
            $id = null;
            $test_category = new Category($name, $id);
            $test_category->save();

            $description = "Wash the dog";
            $test_due_date = "2015-09-16";
            $test_task = new Task($description, $id, $test_due_date);
            $test_task->save();

            $description2 = "water the lawn";
            $test_due_date2 = "2015-09-16";
            $test_task2 = new Task($description2, $id, $test_due_date2);
            $test_task2->save();

            //Act
            $result = Task::getAll();

            //Assert
            $this->assertEquals([$test_task, $test_task2], $result);
        }

        function test_deleteAll()
        {
            //Arrange
            $name = "Home stuff";
            $id = null;
            $test_category = new Category($name, $id);
            $test_category->save();

            $description = "Wash the dog";
            $test_due_date = "2015-09-16";
            $test_task = new Task($description, $id, $test_due_date);
            $test_task->save();

            $description2 = "Water the lawn";
            $test_due_date2 = "2015-09-16";
            $test_task2 = new Task($description2, $id, $test_due_date2);
            $test_task2->save();

            //Act
            Task::deleteAll();

            //Assert
            $result = Task::getAll();
            $this->assertEquals([], $result);
        }



        function test_find()
        {
            //Arrange
            $name = "Home stuff";
            $id = null;
            $test_category = new Category($name, $id);
            $test_category->save();

            $description = "Wash the dog";
            $test_due_date = "2015-09-16";
            $test_task = new Task($description, $id, $test_due_date);
            $test_task->save();

            $description2 = "Water the lawn";
            $test_due_date2 = "2015-09-16";
            $test_task2 = new Task($description2, $id, $test_due_date2);
            $test_task2->save();

            //Act
            $result = Task::find($test_task->getId());

            //Assert
            $this->assertEquals($test_task, $result);
        }

        function testAddCategory()
        {
            //Arrange
            $name = "Work stuff";
            $id = 1;
            $test_category = new Category($name, $id);
            $test_category->save();

            $description = "Business";
            $id2 = 2;
            $due_date = "2015-08-15";
            $test_task = new Task($description, $id, $due_date);
            $test_task->save();

            //Act
            $test_task->addCategory($test_category);

            //Assert
            $this->assertEquals($test_task->getCategories(), [$test_category]);
        }

        function testGetCategories()
        {
            //Arrange
            $name = "Work stuff";
            $id = 1;
            $test_category = new Category($name, $id);
            $test_category->save();

            $name2 = "Volunteer stuff";
            $id2 = 2;
            $test_category2 = new Category($name2, $id2);
            $test_category2->save();

            $description = "File report";
            $id3 = 3;
            $due_date = "2015-08-15";
            $test_task = new Task($description, $id3, $due_date);
            $test_task->save();

            //Act
            $test_task->addCategory($test_category);
            $test_task->addCategory($test_category2);

            //Assert
            $this->assertEquals($test_task->getCategories(), [$test_category, $test_category2]);
        }

        function testUpdate()
        {
            //Arrange
            $description = "Wash the dog";
            $id = 1;
            $due_date = "2015-04-01";
            $test_task = new Task($description, $id, $due_date);

            $new_description = "Clean the dog";

            //Act
            $test_task->update($new_description);

            //Assert
            $this->assertEquals("Clean the dog", $test_task->getDescription());
        }

        function testDeleteTask()
        {
            //Arrange
            $name = "Work stuff";
            $id = 1;
            $test_category = new Category($name, $id);
            $test_category->save();

            $description2 = "Water the lawn";
            $id2 = 2;
            $due_date2 = "3094-09-21";
            $test_task2 = new Task($description2, $id2, $due_date2);
            $test_task2->save();

            //Act
            $test_task2->addCategory($test_category);
            $test_task2->delete();

            //Assert
            $this->assertEquals([], $test_category->getTasks());
        }

        function testComplete()
        {
            //Arrange
            $description = "Wash the dog";
            $id = 1;
            $due_date = "2015-04-01";
            $complete = 0;
            $test_task = new Task($description, $id, $due_date, $complete);
            $test_task->save();

            //Act
            $test_task->complete();

            //Assert
            $this->assertEquals(1, $test_task->getComplete());
        }

    }


?>
