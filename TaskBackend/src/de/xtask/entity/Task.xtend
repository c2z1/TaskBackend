package de.xtask.entity

public class Task {
	new(Long id) {
		this.id = id
	}
	
	new(Long id, String name, Integer prio) {
		this.id = id
		this.name = name
		this.prio = prio
	}
	
	@Property
	Long id
	@Property
	String name
	@Property
	Integer	prio
	
	override equals(Object obj) {
		if (!(obj instanceof Task)) return false;
		return (obj as Task).id == id
	}
	
	override hashCode() {
		id.intValue
	}
	
}