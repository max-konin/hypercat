export interface EventListener<T>{
    (message: T): void;
}