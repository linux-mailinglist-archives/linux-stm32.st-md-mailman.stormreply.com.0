Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F31611F9448
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2020 12:06:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAAA6C36B11;
	Mon, 15 Jun 2020 10:06:37 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48F1BC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 10:06:34 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id i1so14658357ils.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 03:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V4ilhIOGf08PxKYEnKjQV/fXI0rSU5dBatEgVzDPnAc=;
 b=P0cRrsg3JH6SfJ4oLMqbykTLO/eOgi7Euj53OY7iTtxCNRxChA79rSj5NkQ2Edupqx
 N7INsfzKBCOM3rgdAyGAIDdyshNxznnV8Xz3osw7SQF6gmzqOFC5uX9LoirJnCP6U6JC
 O2AjzpCtuTlytgLZXF5kTpv3q+9IF2SrQFdsuMDSPP6G6GaDAaR7Jog8iCmO0u6hXKwp
 Y1S4ZPY0aDWg/GcIFKpoe65TJRjHAvoSf2rduaUbd1v7PpynsqSrwAhMOGcl95m0oV+B
 tgZwVsAsOQmTp2hnW18vdQXnCZ+ecuBp9aBzFXlJLNH7OG4L8xZkidwnaQBikC6pkoob
 Q9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V4ilhIOGf08PxKYEnKjQV/fXI0rSU5dBatEgVzDPnAc=;
 b=pvf/LGEow1DI7ResWyTPEgDHKo14eR+jJr2bD3DusNmwleulytSZWjwSwrvV4EPVVc
 hEpZqxj3u59/Dmtkeg442PrEm19AQVQhpbf0+1tUobifL32AHno2r/KMGZ2KtQ1CGFq5
 4fW70UC1wnTtv+LdcJuGFWAZmdg5R5aF5SYaYjPnHDjWNdUGw8OKwq0mCI9h3XscagkI
 jmJfe3duscFfhvrYZz407DpHyn9v33mRSgz4+KQrv0arf2e6zwGuAEokqz9YKWZn/3K+
 hR+WrWxq4p73/zguKilRHrhpc+7y1La73S4xiVzo2RohxbWpnUbxPhSB/uvjU/TNRDrq
 6fFw==
X-Gm-Message-State: AOAM531M32MKSA1Tj/rMeun3O0Nnt4108NK5iZd00YtbPdLfhGvdrppE
 YVKNhaR01S5mEItIh4pBz74pkLNB2DSVlAjISbo=
X-Google-Smtp-Source: ABdhPJy7MG4dIBMDcK+E97dM8L8Kkqqke6SfX/trPu5MYMPHvmU2jZK0syr68+bQImnrTKFXitAZyACYHc7TzBxR/TA=
X-Received: by 2002:a92:5bd2:: with SMTP id c79mr23408564ilg.218.1592215593037; 
 Mon, 15 Jun 2020 03:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-3-git-send-email-dillon.minfei@gmail.com>
 <2273a168-7b14-9e28-5904-b9d2c2e2d9d3@st.com>
In-Reply-To: <2273a168-7b14-9e28-5904-b9d2c2e2d9d3@st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Mon, 15 Jun 2020 18:05:56 +0800
Message-ID: <CAL9mu0LyFPjf+RLwet43zgcEnO9zhJJ=v1BsQqN8KxYta7Q=DQ@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Hua Dillon <dillonhua@gmail.com>, p.zabel@pengutronix.de,
 linux-clk <linux-clk@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Linus Walleij <linus.walleij@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v6 2/9] ARM: dts: stm32: Add pin map for
 ltdc & spi5 on stm32f429-disco board
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Jun 15, 2020 at 5:45 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
>
> Hi Dillon
>
> On 5/27/20 9:27 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > This patch adds the pin configuration for ltdc and spi5 controller
> > on stm32f429-disco board.
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >   arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 67 ++++++++++++++++++++++++++++++++++
> >   1 file changed, 67 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> > index 392fa143ce07..0eb107f968cd 100644
> > --- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> > +++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> > @@ -316,6 +316,73 @@
> >                               };
> >                       };
> >
> > +                     ltdc_pins_f429_disco: ltdc-1 {
>
> Sorry I missed this issue during review. I changed ltdc_pins_f429_disco
> by ltdc_pins_b when I applied your patch.
Okay, thanks for reviewing.

Regrades,
Dillon,
>
>
> Regards
> alex
>
> > +                             pins {
> > +                                     pinmux = <STM32_PINMUX('C', 6,  AF14)>,
> > +                                             /* LCD_HSYNC */
> > +                                              <STM32_PINMUX('A', 4,  AF14)>,
> > +                                              /* LCD_VSYNC */
> > +                                              <STM32_PINMUX('G', 7,  AF14)>,
> > +                                              /* LCD_CLK */
> > +                                              <STM32_PINMUX('C', 10, AF14)>,
> > +                                              /* LCD_R2 */
> > +                                              <STM32_PINMUX('B', 0,  AF9)>,
> > +                                              /* LCD_R3 */
> > +                                              <STM32_PINMUX('A', 11, AF14)>,
> > +                                              /* LCD_R4 */
> > +                                              <STM32_PINMUX('A', 12, AF14)>,
> > +                                              /* LCD_R5 */
> > +                                              <STM32_PINMUX('B', 1,  AF9)>,
> > +                                              /* LCD_R6*/
> > +                                              <STM32_PINMUX('G', 6,  AF14)>,
> > +                                              /* LCD_R7 */
> > +                                              <STM32_PINMUX('A', 6,  AF14)>,
> > +                                              /* LCD_G2 */
> > +                                              <STM32_PINMUX('G', 10, AF9)>,
> > +                                              /* LCD_G3 */
> > +                                              <STM32_PINMUX('B', 10, AF14)>,
> > +                                              /* LCD_G4 */
> > +                                              <STM32_PINMUX('D', 6,  AF14)>,
> > +                                              /* LCD_B2 */
> > +                                              <STM32_PINMUX('G', 11, AF14)>,
> > +                                              /* LCD_B3*/
> > +                                              <STM32_PINMUX('B', 11, AF14)>,
> > +                                              /* LCD_G5 */
> > +                                              <STM32_PINMUX('C', 7,  AF14)>,
> > +                                              /* LCD_G6 */
> > +                                              <STM32_PINMUX('D', 3,  AF14)>,
> > +                                              /* LCD_G7 */
> > +                                              <STM32_PINMUX('G', 12, AF9)>,
> > +                                              /* LCD_B4 */
> > +                                              <STM32_PINMUX('A', 3,  AF14)>,
> > +                                              /* LCD_B5 */
> > +                                              <STM32_PINMUX('B', 8,  AF14)>,
> > +                                              /* LCD_B6 */
> > +                                              <STM32_PINMUX('B', 9,  AF14)>,
> > +                                              /* LCD_B7 */
> > +                                              <STM32_PINMUX('F', 10, AF14)>;
> > +                                              /* LCD_DE */
> > +                                     slew-rate = <2>;
> > +                             };
> > +                     };
> > +
> > +                     spi5_pins: spi5-0 {
> > +                             pins1 {
> > +                                     pinmux = <STM32_PINMUX('F', 7, AF5)>,
> > +                                             /* SPI5_CLK */
> > +                                              <STM32_PINMUX('F', 9, AF5)>;
> > +                                             /* SPI5_MOSI */
> > +                                     bias-disable;
> > +                                     drive-push-pull;
> > +                                     slew-rate = <0>;
> > +                             };
> > +                             pins2 {
> > +                                     pinmux = <STM32_PINMUX('F', 8, AF5)>;
> > +                                             /* SPI5_MISO */
> > +                                     bias-disable;
> > +                             };
> > +                     };
> > +
> >                       dcmi_pins: dcmi-0 {
> >                               pins {
> >                                       pinmux = <STM32_PINMUX('A', 4, AF13)>, /* DCMI_HSYNC */
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
