import { common2D, drawing } from '@kit.ArkGraphics2D';

@Entry
@Component
struct Index {
  private colorRed: common2D.Color = {
    alpha: 255,
    red: 255,
    green: 0,
    blue: 0
  };
  private imageList: string[] = [
    // 表现1
    'app.media.checkbox_select',
    'app.media.checkbox_unselect',
    // 表现2
    'app.media.std_ic_ima_fill',
    // 表现3
    'app.media.ic_report',
    'app.media.is_shared_knowledge',
    // 表现4
    'app.media.checkbox_sq_select',
    'app.media.ic_union',
  ];

  build() {
    Column() {
      Text('以下是svg不同的尝试染色方式。\n' +
        '1,原图\n' +
        '2,fillColor(RED))\n' +
        '3,colorFilter(RED, BlendMode.SRC)\n' +
        '4,colorFilter(RED, BlendMode.SRCIN)\n')
        .width('100%');

      ForEach(this.imageList, (imageSrc: string, index: number) => {

        Row() {
          Text(imageSrc)
            .fontSize($r('app.float.page_text_font_size'))
            .fontWeight(FontWeight.Bold);
        }.width('100%')
        .margin({ top: 16 });

        Row() {
          // 1 originImage
          Image($r(imageSrc))
            .size({ width: 24, height: 24 })
            .objectFit(ImageFit.Contain)
            // .fillColor(ColorContent.ORIGIN)
            .margin({ left: 10 });

          // 2 fillColor
          Image($r(imageSrc))
            .size({ width: 24, height: 24 })
            .objectFit(ImageFit.Contain)
            .fillColor($r('app.color.color_red'))
            .margin({ left: 10 });

          // 3 colorFilter SRC
          Image($r(imageSrc))
            .size({ width: 24, height: 24 })
            .objectFit(ImageFit.Contain)
            .colorFilter(
              drawing.ColorFilter.createBlendModeColorFilter(
                this.colorRed, drawing.BlendMode.SRC
              )
            )
            .margin({ left: 10 });

          // 4 colorFilter(RED, BlendMode.SRC_IN)
          Image($r(imageSrc))
            .size({ width: 24, height: 24 })
            .objectFit(ImageFit.Contain)
            .colorFilter(
              drawing.ColorFilter.createBlendModeColorFilter(
                this.colorRed, drawing.BlendMode.SRC_IN
              )
            )
            .margin({ left: 10 });

        }.width('100%');
      });
    }
    .margin({
      left: 16,
      right: 16,
      top: 20,
    })
    .height('100%')
    .width('100%')
    .backgroundColor(0xFFE5E5E5);
  }
}