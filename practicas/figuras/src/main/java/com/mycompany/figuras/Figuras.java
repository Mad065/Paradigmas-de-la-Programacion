package com.mycompany.figuras;

public class Figuras {

    public static void main(String[] args) {
        Triangulo triangulo = new Triangulo(3, 4);
        Cuadrado cuadrado = new Cuadrado(5);
        Circulo circulo = new Circulo(2.5);

        System.out.println("Triángulo:");
        System.out.println("Base: " + triangulo.base);
        System.out.println("Altura: " + triangulo.altura);
        System.out.println("Área: " + triangulo.area());
        System.out.println("Perímetro: " + triangulo.perimetro());

        System.out.println();
        System.out.println("Cuadrado");
        System.out.println("Lado: " + cuadrado.lado);
        System.out.println("Área: " + cuadrado.area());
        System.out.println("Perímetro: " + cuadrado.perimetro());

        System.out.println();
        System.out.println("Círculo");
        System.out.println("Radio: " + circulo.radio);
        System.out.println("Área: " + circulo.area());
        System.out.println("Perímetro: " + circulo.perimetro());
    }
}
