class ConstObject {
  final value;
  const ConstObject(this.value);
  log() {
    print(value);
  }
}

void topLevel() {
  const a = const [1,2,3];
  const b = ConstObject(a);
  b.log();
}