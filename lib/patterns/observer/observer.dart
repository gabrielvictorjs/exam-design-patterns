abstract class Observer<T> {
  void update(T data);
}

class Observable<T> {
  T _data;

  Observable(this._data);

  T get data => _data;

  final List<Observer<T>> _observers = [];

  void subscribe(Observer<T> observer) {
    _observers.add(observer);
  }

  void unsubscribe(Observer<T> observer) {
    _observers.remove(observer);
  }

  void notify(T newData) {
    for (final observer in _observers) {
      _data = newData;
      observer.update(_data);
    }
  }
}
