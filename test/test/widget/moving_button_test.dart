void main() {
  testWidgets('MovingButton should respond to gestures', (tester) async {
    var moved = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MovingButton(
            position: Offset.zero,
            onMove: () => moved = true,
            difficulty: 1,
          ),
        ),
      ),
    );

    await tester.drag(find.byType(MovingButton), Offset(100, 100));
    expect(moved, true);
  });
}