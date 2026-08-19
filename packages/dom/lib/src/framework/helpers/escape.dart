String escapeXml(String text) {
  final sb = StringBuffer();
  for (final rune in text.runes) {
    if (rune == 38) {
      sb.write('&amp;');
    } else if (rune == 60) {
      sb.write('&lt;');
    } else if (rune == 62) {
      sb.write('&gt;');
    } else if (rune == 34) {
      sb.write('&quot;');
    } else if (rune == 39) {
      sb.write('&apos;');
    } else if ((rune >= 0x00 && rune <= 0x08) ||
        rune == 0x0B ||
        rune == 0x0C ||
        (rune >= 0x0E && rune <= 0x1F) ||
        (rune >= 0x7F && rune <= 0x9F)) {
      sb.write(' ');
    } else if (rune >= 0x09 && rune <= 0x0A) {
      sb.writeCharCode(rune);
    } else if (rune == 0x0D) {
      sb.writeCharCode(rune);
    } else if (rune >= 0x20 && rune <= 0x7E) {
      sb.writeCharCode(rune);
    } else {
      sb.write('&#x${rune.toRadixString(16).toUpperCase()};');
    }
  }
  return sb.toString();
}
