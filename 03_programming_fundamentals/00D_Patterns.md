public class Singleton {
    private static Singleton instance;
    private Singleton() {}
    public static synchronized Singleton getInstance() {
        if (instance == null) instance = new Singleton();
        return instance;
    }
}

public interface Product { void use(); }
public class ConcreteProductA implements Product { public void use() { /*...*/ } }
public class ConcreteProductB implements Product { public void use() { /*...*/ } }

public abstract class Creator {
    public abstract Product createProduct();
}

public class CreatorA extends Creator {
    public Product createProduct() { return new ConcreteProductA(); }
}

public interface Observer { void update(); }
public interface Subject {
    void attach(Observer o);
    void detach(Observer o);
    void notifyObservers();
}
