package de.xtask.service


import java.util.ArrayList;
import java.util.List;

import com.google.api.server.spi.config.Api;
import com.google.api.server.spi.config.ApiMethod;
import com.google.api.server.spi.config.Named;
import com.google.api.server.spi.response.NotFoundException;
import de.xtask.entity.Task

@Api(name="taskapi",version="v1", description="An API to manage tasks")
public class TaskService {

        public static List<Task> tasks = new ArrayList<Task>();

        @ApiMethod(name="add")
        def Task addTask(@Named("id") Long id, @Named("name") String name, @Named("prio") Integer prio) throws NotFoundException {
                //Check for already exists
                val index = tasks.indexOf(new Task(id));
                if (index != -1) throw new NotFoundException("Task Record already exists");

                Task q = new Task(id, author, message);
                Tasks.add(q);
                return q;
        }

        @ApiMethod(name="update")
        def Task updateTask(Task q) throws NotFoundException {
                int index = Tasks.indexOf(q);
                if (index == -1)
                        throw new NotFoundException("Task Record does not exist");
                Tasks.add(index,q);
                return q;
        }

        @ApiMethod(name="remove")
        def void removeTask(@Named("id") Integer id) throws NotFoundException {
                int index = Tasks.indexOf(new Task(id));
                if (index == -1)
                        throw new NotFoundException("Task Record does not exist");
                Tasks.remove(index);
        }

        @ApiMethod(name="list")
        def List<Task> getTasks() {
                return tasks;
        }

//        @ApiMethod(name="listByAuthor")
//        def List<Task> getTasksByAuthor(@Named("author") String author) {
//                val results = new ArrayList<Task>();
//                for (Task Task : tasks) {
//                        if (Task.getAuthor().indexOf(author) != -1) {
//                                results.add(Task);
//                        }
//                }
//                return results;
//        }

        @ApiMethod(name="getTask")
        public Task getTask(@Named("id") Integer id) throws NotFoundException {
                int index = Tasks.indexOf(new Task(id));
                if (index == -1)
                        throw new NotFoundException("Task Record does not exist");
                return Tasks.get(index);
        }

}