Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E3C34F4D3
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 01:06:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 599B9C57B5B;
	Tue, 30 Mar 2021 23:06:46 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0B54C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 23:06:44 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id t6so15538783ilp.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 16:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B18+1WByNjh9jrg77uy3K5PUj/qJ2W9pQXk3c9DdbLc=;
 b=vK5YD6JgDgQNfQIhKJ2M8PkEAAaRnazc3WjrpY89elwZ8EiNiGmWxjXZK0uh2+6g8p
 9Ha/2DedfqnetHPNXKJAeyrcDU1TqoxQdrpn402vMyxx2RNn+ZOeaMJFbW/4RkDk/AaX
 ImUtR66FjUbY2a9D8HtEM4/BPRBYEhqpMtCtm1F7IlISDw2w6LPIkWy1qLnQSW1Girpj
 tX38cBBlyndrW5vW++wijpbCDMaZu9zXeRVZ4rjctDF/4YmUNiZ6t2R27z6Pm+MVczsk
 R5svJ4aPaSMzMgO93a/u3wmtJHVi9e6qzTaMHf3JjwnTX0843lsbLWUv1pCDhumZ+a7E
 6SEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B18+1WByNjh9jrg77uy3K5PUj/qJ2W9pQXk3c9DdbLc=;
 b=ONauJXHy1m0i5tPwAzijnRASEIjnfBhjnpsJbuElwhcQwjYsG/bbcEL6KcUmSsHGBo
 oXynVwtT28902hcC2RKB6HzkMMoROFo527qmKhI0XLezfEDPqwBe+v/dSjNjRoyUI5ja
 rH8pm1NyUve5TuG10kibEd1DRAu/D1aLyfILYnikUGrGmJwjyLos3DGkp/7M1uNv67ZP
 KCRgJ6QHiYkNRUa2x9azJl/TgUV0r1tUl+yVOydyWh/KFWIVnmTcEvLW0kRq0ddykcxg
 C45S8/oeBLbbWZt0oPCpTO/x7V70WYkefr4xcfgnvrI1tz2/MD09sdvav3DJabhtm0sF
 nPrg==
X-Gm-Message-State: AOAM5333+owiIJRQXay8iT0RfW2l53o1nTuKXjw6IPUNX5NE6CkK3KBo
 mBKs4iVMUffbW8jUYQObD7xv/c7irCEhg/1WDnw=
X-Google-Smtp-Source: ABdhPJzjlgSyweW6Q8CTROmy7vYsiTqG3GGX1mXuQWGeZn6X8K1pTBzhjqA0I4Nirqqn7+HxS3i17rBVFfTTHIKEqIM=
X-Received: by 2002:a92:d784:: with SMTP id d4mr461793iln.184.1617145603468;
 Tue, 30 Mar 2021 16:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <1617094704-10040-1-git-send-email-dillon.minfei@gmail.com>
 <1617094704-10040-4-git-send-email-dillon.minfei@gmail.com>
 <d08d3195-5379-ff1e-fefd-f38297e18108@foss.st.com>
In-Reply-To: <d08d3195-5379-ff1e-fefd-f38297e18108@foss.st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 31 Mar 2021 07:06:06 +0800
Message-ID: <CAL9mu0+CB4Tp_Ar_oqi0rFAx0cOf7SPRzv8zjCshKLiydLK4-Q@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, linux-serial@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, gregkh@linuxfoundation.org,
 rong.a.chen@intel.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, Erwan LE RAY <erwan.leray@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, lkp@intel.com
Subject: Re: [Linux-stm32] [PATCH v8 3/6] ARM: dts: stm32: introduce
 stm32h7-pinctrl.dtsi to support stm32h750
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

On Wed, Mar 31, 2021 at 12:44 AM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
>
>
> On 3/30/21 10:58 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > This patch is intend to add support stm32h750 value line,
> > just add stm32h7-pinctrl.dtsi for extending, with following changes:
> >
> > - rename stm32h743-pinctrl.dtsi to stm32h7-pinctrl.dtsi
> > - update stm32h743i-{dico/eval}.dtsi to include stm32h7-pinctrl.dtsi
> > - add dts binding usart3, uart4
> >    usart3/uart4 pinctrl in stm32h7-pinctrl.dtsi
> >    usart3/uart4 register in stm32h743.dtsi
> > - add dts binding sdmmc2
> >    sdmmc2 pinctrl in stm32h7-pinctrl.dtsi
> >    sdmmc2 register in stm32h743.dtsi
> > - add spi1_pins pinctrl in stm32h7-pinctrl.dtsi
> > - move 'pin-controller' from stm32h7-pinctrl.dtsi to stm32h743.dtsi, to
> >    fix make dtbs_check warrnings
> >    arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: soc: 'i2c@40005C00',
> >    'i2c@58001C00' do not match any of the regexes:
> >    '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$', 'pinctrl-[0-9]+'
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> > v8:
> > - drop '[PATCH v7 3/6] ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to
> >    support stm32h750' - stm32h743-pinctrl.dtsi file
> > - move compatible string "st,stm32h743-pinctrl" from stm32h7-pinctrl.dtsi
> >    to stm32h743.dtsi
> > - update stm32h743i-{dico/eval}.dtsi to include stm32h7-pinctrl.dtsi
> > - move file stm32h743.dtsi submit position to [PATCH V8 3/6]
> >
> >   arch/arm/boot/dts/stm32h7-pinctrl.dtsi   | 341 +++++++++++++++++++++++++++++++
> >   arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 306 ---------------------------
> >   arch/arm/boot/dts/stm32h743.dtsi         | 165 ++++++++++++++-
> >   arch/arm/boot/dts/stm32h743i-disco.dts   |   2 +-
> >   arch/arm/boot/dts/stm32h743i-eval.dts    |   2 +-
> >   5 files changed, 506 insertions(+), 310 deletions(-)
> >   create mode 100644 arch/arm/boot/dts/stm32h7-pinctrl.dtsi
> >   delete mode 100644 arch/arm/boot/dts/stm32h743-pinctrl.dtsi
> >
> > diff --git a/arch/arm/boot/dts/stm32h7-pinctrl.dtsi b/arch/arm/boot/dts/stm32h7-pinctrl.dtsi
> > new file mode 100644
> > index 000000000000..a5c295eca081
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/stm32h7-pinctrl.dtsi
> > @@ -0,0 +1,341 @@
> > +/*
> > + * Copyright 2017 - Alexandre Torgue <alexandre.torgue@st.com>
> > + *
> > + * This file is dual-licensed: you can use it either under the terms
> > + * of the GPL or the X11 license, at your option. Note that this dual
> > + * licensing only applies to this file, and not this project as a
> > + * whole.
> > + *
> > + *  a) This file is free software; you can redistribute it and/or
> > + *     modify it under the terms of the GNU General Public License as
> > + *     published by the Free Software Foundation; either version 2 of the
> > + *     License, or (at your option) any later version.
> > + *
> > + *     This file is distributed in the hope that it will be useful,
> > + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + *     GNU General Public License for more details.
> > + *
> > + * Or, alternatively,
> > + *
> > + *  b) Permission is hereby granted, free of charge, to any person
> > + *     obtaining a copy of this software and associated documentation
> > + *     files (the "Software"), to deal in the Software without
> > + *     restriction, including without limitation the rights to use,
> > + *     copy, modify, merge, publish, distribute, sublicense, and/or
> > + *     sell copies of the Software, and to permit persons to whom the
> > + *     Software is furnished to do so, subject to the following
> > + *     conditions:
> > + *
> > + *     The above copyright notice and this permission notice shall be
> > + *     included in all copies or substantial portions of the Software.
> > + *
> > + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> > + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> > + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > + *     OTHER DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +#include <dt-bindings/pinctrl/stm32-pinfunc.h>
> > +
> > +&pinctrl {
> > +
> > +     gpioa: gpio@58020000 {
> > +             status = "okay";
> > +             ngpios = <16>;
> > +             gpio-ranges = <&pinctrl 0 0 16>;
> > +     };
> > +
>
> You could move those entries directly into stm32h743.dtsi no ?
Agree, will add this change to v9.
thanks.
>
> > +     gpiob: gpio@58020400 {
> > +             status = "okay";
> > +             ngpios = <16>;
> > +             gpio-ranges = <&pinctrl 0 16 16>;
> > +     };
> > +
> > +     gpioc: gpio@58020800 {
> > +             status = "okay";
> > +             ngpios = <16>;
> > +             gpio-ranges = <&pinctrl 0 32 16>;
> > +     };
> > +
> > +     gpiod: gpio@58020c00 {
> > +             status = "okay";
> > +             ngpios = <16>;
> > +             gpio-ranges = <&pinctrl 0 48 16>;
> > +     };
> > +
> > +     gpioe: gpio@58021000 {
> > +             status = "okay";
> > +             ngpios = <16>;
> > +             gpio-ranges = <&pinctrl 0 64 16>;
> > +     };
> > +
> > +     gpiof: gpio@58021400 {
> > +             status = "okay";
> > +             ngpios = <16>;
> > +             gpio-ranges = <&pinctrl 0 80 16>;
> > +     };
> > +
> > +     gpiog: gpio@58021800 {
> > +             status = "okay";
> > +             ngpios = <16>;
> > +             gpio-ranges = <&pinctrl 0 96 16>;
> > +     };
> > +
> > +     gpioh: gpio@58021c00 {
> > +             status = "okay";
> > +             ngpios = <16>;
> > +             gpio-ranges = <&pinctrl 0 112 16>;
> > +     };
> > +
> > +     gpioi: gpio@58022000 {
> > +             status = "okay";
> > +             ngpios = <16>;
> > +             gpio-ranges = <&pinctrl 0 128 16>;
> > +     };
> > +
> > +     gpioj: gpio@58022400 {
> > +             status = "okay";
> > +             ngpios = <16>;
> > +             gpio-ranges = <&pinctrl 0 144 16>;
> > +     };
> > +
> > +     gpiok: gpio@58022800 {
> > +             status = "okay";
> > +             ngpios = <8>;
> > +             gpio-ranges = <&pinctrl 0 160 8>;
> > +     };
> > +
> > +     i2c1_pins_a: i2c1-0 {
> > +             pins {
> > +                     pinmux = <STM32_PINMUX('B', 6, AF4)>, /* I2C1_SCL */
> > +                              <STM32_PINMUX('B', 7, AF4)>; /* I2C1_SDA */
> > +                     bias-disable;
> > +                     drive-open-drain;
> > +                     slew-rate = <0>;
> > +             };
> > +     };
> > +
> > +     ethernet_rmii: rmii-0 {
> > +             pins {
> > +                     pinmux = <STM32_PINMUX('G', 11, AF11)>,
> > +                              <STM32_PINMUX('G', 13, AF11)>,
> > +                              <STM32_PINMUX('G', 12, AF11)>,
> > +                              <STM32_PINMUX('C', 4, AF11)>,
> > +                              <STM32_PINMUX('C', 5, AF11)>,
> > +                              <STM32_PINMUX('A', 7, AF11)>,
> > +                              <STM32_PINMUX('C', 1, AF11)>,
> > +                              <STM32_PINMUX('A', 2, AF11)>,
> > +                              <STM32_PINMUX('A', 1, AF11)>;
> > +                     slew-rate = <2>;
> > +             };
> > +     };
> > +
> > +     sdmmc1_b4_pins_a: sdmmc1-b4-0 {
> > +             pins {
> > +                     pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> > +                              <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> > +                              <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> > +                              <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
> > +                              <STM32_PINMUX('C', 12, AF12)>, /* SDMMC1_CK */
> > +                              <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> > +                     slew-rate = <3>;
> > +                     drive-push-pull;
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> > +     sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
> > +             pins1 {
> > +                     pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> > +                              <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> > +                              <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> > +                              <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
> > +                              <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
> > +                     slew-rate = <3>;
> > +                     drive-push-pull;
> > +                     bias-disable;
> > +             };
> > +             pins2{
> > +                     pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> > +                     slew-rate = <3>;
> > +                     drive-open-drain;
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> > +     sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
> > +             pins {
> > +                     pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
> > +                              <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
> > +                              <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
> > +                              <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
> > +                              <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
> > +                              <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
> > +             };
> > +     };
> > +
> > +     sdmmc2_b4_pins_a: sdmmc2-b4-0 {
> > +             pins {
> > +                     pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC1_D0 */
> > +                              <STM32_PINMUX('B', 15, AF9)>, /* SDMMC1_D1 */
> > +                              <STM32_PINMUX('B', 3, AF9)>, /* SDMMC1_D2 */
> > +                              <STM32_PINMUX('B', 4, AF9)>, /* SDMMC1_D3 */
> > +                              <STM32_PINMUX('D', 6, AF11)>, /* SDMMC1_CK */
> > +                              <STM32_PINMUX('D', 7, AF11)>; /* SDMMC1_CMD */
> > +                     slew-rate = <3>;
> > +                     drive-push-pull;
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> > +     sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
> > +             pins1 {
> > +                     pinmux = <STM32_PINMUX('B', 14, AF9)>, /* SDMMC2_D0 */
> > +                              <STM32_PINMUX('B', 15, AF9)>, /* SDMMC1_D1 */
> > +                              <STM32_PINMUX('B', 3, AF9)>, /* SDMMC1_D2 */
> > +                              <STM32_PINMUX('B', 4, AF9)>, /* SDMMC1_D3 */
> > +                              <STM32_PINMUX('D', 6, AF11)>; /* SDMMC1_CK */
> > +                     slew-rate = <3>;
> > +                     drive-push-pull;
> > +                     bias-disable;
> > +             };
> > +             pins2{
> > +                     pinmux = <STM32_PINMUX('D', 7, AF11)>; /* SDMMC1_CMD */
> > +                     slew-rate = <3>;
> > +                     drive-open-drain;
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> > +     sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
> > +             pins {
> > +                     pinmux = <STM32_PINMUX('B', 14, ANALOG)>, /* SDMMC1_D0 */
> > +                              <STM32_PINMUX('B', 15, ANALOG)>, /* SDMMC1_D1 */
> > +                              <STM32_PINMUX('B', 3, ANALOG)>, /* SDMMC1_D2 */
> > +                              <STM32_PINMUX('B', 4, ANALOG)>, /* SDMMC1_D3 */
> > +                              <STM32_PINMUX('D', 6, ANALOG)>, /* SDMMC1_CK */
> > +                              <STM32_PINMUX('D', 7, ANALOG)>; /* SDMMC1_CMD */
> > +             };
> > +     };
> > +
> > +     sdmmc1_dir_pins_a: sdmmc1-dir-0 {
> > +             pins1 {
> > +                     pinmux = <STM32_PINMUX('C', 6, AF8)>, /* SDMMC1_D0DIR */
> > +                              <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
> > +                              <STM32_PINMUX('B', 9, AF7)>; /* SDMMC1_CDIR */
> > +                     slew-rate = <3>;
> > +                     drive-push-pull;
> > +                     bias-pull-up;
> > +             };
> > +             pins2{
> > +                     pinmux = <STM32_PINMUX('B', 8, AF7)>; /* SDMMC1_CKIN */
> > +                     bias-pull-up;
> > +             };
> > +     };
> > +
> > +     sdmmc1_dir_sleep_pins_a: sdmmc1-dir-sleep-0 {
> > +             pins {
> > +                     pinmux = <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC1_D0DIR */
> > +                              <STM32_PINMUX('C', 7, ANALOG)>, /* SDMMC1_D123DIR */
> > +                              <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
> > +                              <STM32_PINMUX('B', 8, ANALOG)>; /* SDMMC1_CKIN */
> > +             };
> > +     };
> > +
> > +     usart1_pins: usart1-0 {
> > +             pins1 {
> > +                     pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
> > +                     bias-disable;
> > +                     drive-push-pull;
> > +                     slew-rate = <0>;
> > +             };
> > +             pins2 {
> > +                     pinmux = <STM32_PINMUX('B', 15, AF4)>; /* USART1_RX */
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> > +     usart2_pins: usart2-0 {
> > +             pins1 {
> > +                     pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
> > +                     bias-disable;
> > +                     drive-push-pull;
> > +                     slew-rate = <0>;
> > +             };
> > +             pins2 {
> > +                     pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> > +     usart3_pins: usart3-0 {
> > +             pins1 {
> > +                     pinmux = <STM32_PINMUX('B', 10, AF7)>, /* USART3_TX */
> > +                              <STM32_PINMUX('D', 12, AF7)>; /* USART3_RTS_DE */
> > +                     bias-disable;
> > +                     drive-push-pull;
> > +                     slew-rate = <0>;
> > +             };
> > +             pins2 {
> > +                     pinmux = <STM32_PINMUX('B', 11, AF7)>, /* USART3_RX */
> > +                              <STM32_PINMUX('D', 11, AF7)>; /* USART3_CTS_NSS */
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> > +     uart4_pins: uart4-0 {
> > +             pins1 {
> > +                     pinmux = <STM32_PINMUX('A', 0, AF8)>; /* UART4_TX */
> > +                     bias-disable;
> > +                     drive-push-pull;
> > +                     slew-rate = <0>;
> > +             };
> > +             pins2 {
> > +                     pinmux = <STM32_PINMUX('I', 9, AF8)>; /* UART4_RX */
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> > +     usbotg_hs_pins_a: usbotg-hs-0 {
> > +             pins {
> > +                     pinmux = <STM32_PINMUX('H', 4, AF10)>,  /* ULPI_NXT */
> > +                                      <STM32_PINMUX('I', 11, AF10)>, /* ULPI_DIR> */
> > +                                      <STM32_PINMUX('C', 0, AF10)>,  /* ULPI_STP> */
> > +                                      <STM32_PINMUX('A', 5, AF10)>,  /* ULPI_CK> */
> > +                                      <STM32_PINMUX('A', 3, AF10)>,  /* ULPI_D0> */
> > +                                      <STM32_PINMUX('B', 0, AF10)>,  /* ULPI_D1> */
> > +                                      <STM32_PINMUX('B', 1, AF10)>,  /* ULPI_D2> */
> > +                                      <STM32_PINMUX('B', 10, AF10)>, /* ULPI_D3> */
> > +                                      <STM32_PINMUX('B', 11, AF10)>, /* ULPI_D4> */
> > +                                      <STM32_PINMUX('B', 12, AF10)>, /* ULPI_D5> */
> > +                                      <STM32_PINMUX('B', 13, AF10)>, /* ULPI_D6> */
> > +                                      <STM32_PINMUX('B', 5, AF10)>;  /* ULPI_D7> */
> > +                     bias-disable;
> > +                     drive-push-pull;
> > +                     slew-rate = <2>;
> > +             };
> > +     };
> > +
> > +     spi1_pins: spi1-0 {
> > +             pins1 {
> > +                     pinmux = <STM32_PINMUX('A', 5, AF5)>,
> > +                             /* SPI1_CLK */
> > +                              <STM32_PINMUX('B', 5, AF5)>;
> > +                             /* SPI1_MOSI */
> > +                     bias-disable;
> > +                     drive-push-pull;
> > +                     slew-rate = <2>;
> > +             };
> > +             pins2 {
> > +                     pinmux = <STM32_PINMUX('G', 9, AF5)>;
> > +                             /* SPI1_MISO */
> > +                     bias-disable;
> > +             };
> > +     };
> > +};
> > +
> > diff --git a/arch/arm/boot/dts/stm32h743-pinctrl.dtsi b/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
> > deleted file mode 100644
> > index fa5dcb6a5fdd..000000000000
> > --- a/arch/arm/boot/dts/stm32h743-pinctrl.dtsi
> > +++ /dev/null
> > @@ -1,306 +0,0 @@
> > -/*
> > - * Copyright 2017 - Alexandre Torgue <alexandre.torgue@st.com>
> > - *
> > - * This file is dual-licensed: you can use it either under the terms
> > - * of the GPL or the X11 license, at your option. Note that this dual
> > - * licensing only applies to this file, and not this project as a
> > - * whole.
> > - *
> > - *  a) This file is free software; you can redistribute it and/or
> > - *     modify it under the terms of the GNU General Public License as
> > - *     published by the Free Software Foundation; either version 2 of the
> > - *     License, or (at your option) any later version.
> > - *
> > - *     This file is distributed in the hope that it will be useful,
> > - *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> > - *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > - *     GNU General Public License for more details.
> > - *
> > - * Or, alternatively,
> > - *
> > - *  b) Permission is hereby granted, free of charge, to any person
> > - *     obtaining a copy of this software and associated documentation
> > - *     files (the "Software"), to deal in the Software without
> > - *     restriction, including without limitation the rights to use,
> > - *     copy, modify, merge, publish, distribute, sublicense, and/or
> > - *     sell copies of the Software, and to permit persons to whom the
> > - *     Software is furnished to do so, subject to the following
> > - *     conditions:
> > - *
> > - *     The above copyright notice and this permission notice shall be
> > - *     included in all copies or substantial portions of the Software.
> > - *
> > - *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > - *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> > - *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > - *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> > - *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> > - *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> > - *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > - *     OTHER DEALINGS IN THE SOFTWARE.
> > - */
> > -
> > -#include <dt-bindings/pinctrl/stm32-pinfunc.h>
> > -
> > -/ {
> > -     soc {
> > -             pin-controller {
> > -                     #address-cells = <1>;
> > -                     #size-cells = <1>;
> > -                     compatible = "st,stm32h743-pinctrl";
> > -                     ranges = <0 0x58020000 0x3000>;
> > -                     interrupt-parent = <&exti>;
> > -                     st,syscfg = <&syscfg 0x8>;
> > -                     pins-are-numbered;
> > -
> > -                     gpioa: gpio@58020000 {
> > -                             gpio-controller;
> > -                             #gpio-cells = <2>;
> > -                             reg = <0x0 0x400>;
> > -                             clocks = <&rcc GPIOA_CK>;
> > -                             st,bank-name = "GPIOA";
> > -                             interrupt-controller;
> > -                             #interrupt-cells = <2>;
> > -                     };
> > -
> > -                     gpiob: gpio@58020400 {
> > -                             gpio-controller;
> > -                             #gpio-cells = <2>;
> > -                             reg = <0x400 0x400>;
> > -                             clocks = <&rcc GPIOB_CK>;
> > -                             st,bank-name = "GPIOB";
> > -                             interrupt-controller;
> > -                             #interrupt-cells = <2>;
> > -                     };
> > -
> > -                     gpioc: gpio@58020800 {
> > -                             gpio-controller;
> > -                             #gpio-cells = <2>;
> > -                             reg = <0x800 0x400>;
> > -                             clocks = <&rcc GPIOC_CK>;
> > -                             st,bank-name = "GPIOC";
> > -                             interrupt-controller;
> > -                             #interrupt-cells = <2>;
> > -                     };
> > -
> > -                     gpiod: gpio@58020c00 {
> > -                             gpio-controller;
> > -                             #gpio-cells = <2>;
> > -                             reg = <0xc00 0x400>;
> > -                             clocks = <&rcc GPIOD_CK>;
> > -                             st,bank-name = "GPIOD";
> > -                             interrupt-controller;
> > -                             #interrupt-cells = <2>;
> > -                     };
> > -
> > -                     gpioe: gpio@58021000 {
> > -                             gpio-controller;
> > -                             #gpio-cells = <2>;
> > -                             reg = <0x1000 0x400>;
> > -                             clocks = <&rcc GPIOE_CK>;
> > -                             st,bank-name = "GPIOE";
> > -                             interrupt-controller;
> > -                             #interrupt-cells = <2>;
> > -                     };
> > -
> > -                     gpiof: gpio@58021400 {
> > -                             gpio-controller;
> > -                             #gpio-cells = <2>;
> > -                             reg = <0x1400 0x400>;
> > -                             clocks = <&rcc GPIOF_CK>;
> > -                             st,bank-name = "GPIOF";
> > -                             interrupt-controller;
> > -                             #interrupt-cells = <2>;
> > -                     };
> > -
> > -                     gpiog: gpio@58021800 {
> > -                             gpio-controller;
> > -                             #gpio-cells = <2>;
> > -                             reg = <0x1800 0x400>;
> > -                             clocks = <&rcc GPIOG_CK>;
> > -                             st,bank-name = "GPIOG";
> > -                             interrupt-controller;
> > -                             #interrupt-cells = <2>;
> > -                     };
> > -
> > -                     gpioh: gpio@58021c00 {
> > -                             gpio-controller;
> > -                             #gpio-cells = <2>;
> > -                             reg = <0x1c00 0x400>;
> > -                             clocks = <&rcc GPIOH_CK>;
> > -                             st,bank-name = "GPIOH";
> > -                             interrupt-controller;
> > -                             #interrupt-cells = <2>;
> > -                     };
> > -
> > -                     gpioi: gpio@58022000 {
> > -                             gpio-controller;
> > -                             #gpio-cells = <2>;
> > -                             reg = <0x2000 0x400>;
> > -                             clocks = <&rcc GPIOI_CK>;
> > -                             st,bank-name = "GPIOI";
> > -                             interrupt-controller;
> > -                             #interrupt-cells = <2>;
> > -                     };
> > -
> > -                     gpioj: gpio@58022400 {
> > -                             gpio-controller;
> > -                             #gpio-cells = <2>;
> > -                             reg = <0x2400 0x400>;
> > -                             clocks = <&rcc GPIOJ_CK>;
> > -                             st,bank-name = "GPIOJ";
> > -                             interrupt-controller;
> > -                             #interrupt-cells = <2>;
> > -                     };
> > -
> > -                     gpiok: gpio@58022800 {
> > -                             gpio-controller;
> > -                             #gpio-cells = <2>;
> > -                             reg = <0x2800 0x400>;
> > -                             clocks = <&rcc GPIOK_CK>;
> > -                             st,bank-name = "GPIOK";
> > -                             interrupt-controller;
> > -                             #interrupt-cells = <2>;
> > -                     };
> > -
> > -                     i2c1_pins_a: i2c1-0 {
> > -                             pins {
> > -                                     pinmux = <STM32_PINMUX('B', 6, AF4)>, /* I2C1_SCL */
> > -                                              <STM32_PINMUX('B', 7, AF4)>; /* I2C1_SDA */
> > -                                     bias-disable;
> > -                                     drive-open-drain;
> > -                                     slew-rate = <0>;
> > -                             };
> > -                     };
> > -
> > -                     ethernet_rmii: rmii-0 {
> > -                             pins {
> > -                                     pinmux = <STM32_PINMUX('G', 11, AF11)>,
> > -                                              <STM32_PINMUX('G', 13, AF11)>,
> > -                                              <STM32_PINMUX('G', 12, AF11)>,
> > -                                              <STM32_PINMUX('C', 4, AF11)>,
> > -                                              <STM32_PINMUX('C', 5, AF11)>,
> > -                                              <STM32_PINMUX('A', 7, AF11)>,
> > -                                              <STM32_PINMUX('C', 1, AF11)>,
> > -                                              <STM32_PINMUX('A', 2, AF11)>,
> > -                                              <STM32_PINMUX('A', 1, AF11)>;
> > -                                     slew-rate = <2>;
> > -                             };
> > -                     };
> > -
> > -                     sdmmc1_b4_pins_a: sdmmc1-b4-0 {
> > -                             pins {
> > -                                     pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> > -                                              <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> > -                                              <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> > -                                              <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
> > -                                              <STM32_PINMUX('C', 12, AF12)>, /* SDMMC1_CK */
> > -                                              <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> > -                                     slew-rate = <3>;
> > -                                     drive-push-pull;
> > -                                     bias-disable;
> > -                             };
> > -                     };
> > -
> > -                     sdmmc1_b4_od_pins_a: sdmmc1-b4-od-0 {
> > -                             pins1 {
> > -                                     pinmux = <STM32_PINMUX('C', 8, AF12)>, /* SDMMC1_D0 */
> > -                                              <STM32_PINMUX('C', 9, AF12)>, /* SDMMC1_D1 */
> > -                                              <STM32_PINMUX('C', 10, AF12)>, /* SDMMC1_D2 */
> > -                                              <STM32_PINMUX('C', 11, AF12)>, /* SDMMC1_D3 */
> > -                                              <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
> > -                                     slew-rate = <3>;
> > -                                     drive-push-pull;
> > -                                     bias-disable;
> > -                             };
> > -                             pins2{
> > -                                     pinmux = <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
> > -                                     slew-rate = <3>;
> > -                                     drive-open-drain;
> > -                                     bias-disable;
> > -                             };
> > -                     };
> > -
> > -                     sdmmc1_b4_sleep_pins_a: sdmmc1-b4-sleep-0 {
> > -                             pins {
> > -                                     pinmux = <STM32_PINMUX('C', 8, ANALOG)>, /* SDMMC1_D0 */
> > -                                              <STM32_PINMUX('C', 9, ANALOG)>, /* SDMMC1_D1 */
> > -                                              <STM32_PINMUX('C', 10, ANALOG)>, /* SDMMC1_D2 */
> > -                                              <STM32_PINMUX('C', 11, ANALOG)>, /* SDMMC1_D3 */
> > -                                              <STM32_PINMUX('C', 12, ANALOG)>, /* SDMMC1_CK */
> > -                                              <STM32_PINMUX('D', 2, ANALOG)>; /* SDMMC1_CMD */
> > -                             };
> > -                     };
> > -
> > -                     sdmmc1_dir_pins_a: sdmmc1-dir-0 {
> > -                             pins1 {
> > -                                     pinmux = <STM32_PINMUX('C', 6, AF8)>, /* SDMMC1_D0DIR */
> > -                                              <STM32_PINMUX('C', 7, AF8)>, /* SDMMC1_D123DIR */
> > -                                              <STM32_PINMUX('B', 9, AF7)>; /* SDMMC1_CDIR */
> > -                                     slew-rate = <3>;
> > -                                     drive-push-pull;
> > -                                     bias-pull-up;
> > -                             };
> > -                             pins2{
> > -                                     pinmux = <STM32_PINMUX('B', 8, AF7)>; /* SDMMC1_CKIN */
> > -                                     bias-pull-up;
> > -                             };
> > -                     };
> > -
> > -                     sdmmc1_dir_sleep_pins_a: sdmmc1-dir-sleep-0 {
> > -                             pins {
> > -                                     pinmux = <STM32_PINMUX('C', 6, ANALOG)>, /* SDMMC1_D0DIR */
> > -                                              <STM32_PINMUX('C', 7, ANALOG)>, /* SDMMC1_D123DIR */
> > -                                              <STM32_PINMUX('B', 9, ANALOG)>, /* SDMMC1_CDIR */
> > -                                              <STM32_PINMUX('B', 8, ANALOG)>; /* SDMMC1_CKIN */
> > -                             };
> > -                     };
> > -
> > -                     usart1_pins: usart1-0 {
> > -                             pins1 {
> > -                                     pinmux = <STM32_PINMUX('B', 14, AF4)>; /* USART1_TX */
> > -                                     bias-disable;
> > -                                     drive-push-pull;
> > -                                     slew-rate = <0>;
> > -                             };
> > -                             pins2 {
> > -                                     pinmux = <STM32_PINMUX('B', 15, AF4)>; /* USART1_RX */
> > -                                     bias-disable;
> > -                             };
> > -                     };
> > -
> > -                     usart2_pins: usart2-0 {
> > -                             pins1 {
> > -                                     pinmux = <STM32_PINMUX('D', 5, AF7)>; /* USART2_TX */
> > -                                     bias-disable;
> > -                                     drive-push-pull;
> > -                                     slew-rate = <0>;
> > -                             };
> > -                             pins2 {
> > -                                     pinmux = <STM32_PINMUX('D', 6, AF7)>; /* USART2_RX */
> > -                                     bias-disable;
> > -                             };
> > -                     };
> > -
> > -                     usbotg_hs_pins_a: usbotg-hs-0 {
> > -                             pins {
> > -                                     pinmux = <STM32_PINMUX('H', 4, AF10)>,  /* ULPI_NXT */
> > -                                                      <STM32_PINMUX('I', 11, AF10)>, /* ULPI_DIR> */
> > -                                                      <STM32_PINMUX('C', 0, AF10)>,  /* ULPI_STP> */
> > -                                                      <STM32_PINMUX('A', 5, AF10)>,  /* ULPI_CK> */
> > -                                                      <STM32_PINMUX('A', 3, AF10)>,  /* ULPI_D0> */
> > -                                                      <STM32_PINMUX('B', 0, AF10)>,  /* ULPI_D1> */
> > -                                                      <STM32_PINMUX('B', 1, AF10)>,  /* ULPI_D2> */
> > -                                                      <STM32_PINMUX('B', 10, AF10)>, /* ULPI_D3> */
> > -                                                      <STM32_PINMUX('B', 11, AF10)>, /* ULPI_D4> */
> > -                                                      <STM32_PINMUX('B', 12, AF10)>, /* ULPI_D5> */
> > -                                                      <STM32_PINMUX('B', 13, AF10)>, /* ULPI_D6> */
> > -                                                      <STM32_PINMUX('B', 5, AF10)>;  /* ULPI_D7> */
> > -                                     bias-disable;
> > -                                     drive-push-pull;
> > -                                     slew-rate = <2>;
> > -                             };
> > -                     };
> > -             };
> > -     };
> > -};
> > diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
> > index 4ebffb0a45a3..b58cae967b2a 100644
> > --- a/arch/arm/boot/dts/stm32h743.dtsi
> > +++ b/arch/arm/boot/dts/stm32h743.dtsi
> > @@ -135,6 +135,22 @@
> >                       clocks = <&rcc USART2_CK>;
> >               };
> >
> > +             usart3: serial@40004800 {
> > +                     compatible = "st,stm32h7-uart";
> > +                     reg = <0x40004800 0x400>;
> > +                     interrupts = <39>;
> > +                     status = "disabled";
> > +                     clocks = <&rcc USART3_CK>;
> > +             };
> > +
> > +             uart4: serial@40004c00 {
> > +                     compatible = "st,stm32h7-uart";
> > +                     reg = <0x40004c00 0x400>;
> > +                     interrupts = <52>;
> > +                     status = "disabled";
> > +                     clocks = <&rcc UART4_CK>;
> > +             };
> > +
> >               i2c1: i2c@40005400 {
> >                       compatible = "st,stm32f7-i2c";
> >                       #address-cells = <1>;
> > @@ -159,7 +175,7 @@
> >                       status = "disabled";
> >               };
> >
> > -             i2c3: i2c@40005C00 {
> > +             i2c3: i2c@40005c00 {
> >                       compatible = "st,stm32f7-i2c";
> >                       #address-cells = <1>;
> >                       #size-cells = <0>;
> > @@ -368,6 +384,20 @@
> >                       max-frequency = <120000000>;
> >               };
> >
> > +             sdmmc2: mmc@48022400 {
> > +                     compatible = "arm,pl18x", "arm,primecell";
> > +                     arm,primecell-periphid = <0x10153180>;
> > +                     reg = <0x48022400 0x400>;
> > +                     interrupts = <124>;
> > +                     interrupt-names = "cmd_irq";
> > +                     clocks = <&rcc SDMMC2_CK>;
> > +                     clock-names = "apb_pclk";
> > +                     resets = <&rcc STM32H7_AHB2_RESET(SDMMC2)>;
> > +                     cap-sd-highspeed;
> > +                     cap-mmc-highspeed;
> > +                     max-frequency = <120000000>;
> > +             };
> > +
> >               exti: interrupt-controller@58000000 {
> >                       compatible = "st,stm32h7-exti";
> >                       interrupt-controller;
> > @@ -392,7 +422,7 @@
> >                       status = "disabled";
> >               };
> >
> > -             i2c4: i2c@58001C00 {
> > +             i2c4: i2c@58001c00 {
> >                       compatible = "st,stm32f7-i2c";
> >                       #address-cells = <1>;
> >                       #size-cells = <0>;
> > @@ -555,6 +585,137 @@
> >                       snps,pbl = <8>;
> >                       status = "disabled";
> >               };
> > +
> > +             pinctrl: pin-controller@58020000 {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <1>;
> > +                     compatible = "st,stm32h743-pinctrl";
> > +                     ranges = <0 0x58020000 0x3000>;
> > +                     interrupt-parent = <&exti>;
> > +                     st,syscfg = <&syscfg 0x8>;
> > +                     pins-are-numbered;
> > +
> > +                     gpioa: gpio@58020000 {
> > +                             gpio-controller;
> > +                             #gpio-cells = <2>;
> > +                             reg = <0x0 0x400>;
> > +                             clocks = <&rcc GPIOA_CK>;
> > +                             st,bank-name = "GPIOA";
> > +                             interrupt-controller;
> > +                             #interrupt-cells = <2>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     gpiob: gpio@58020400 {
> > +                             gpio-controller;
> > +                             #gpio-cells = <2>;
> > +                             reg = <0x400 0x400>;
> > +                             clocks = <&rcc GPIOB_CK>;
> > +                             st,bank-name = "GPIOB";
> > +                             interrupt-controller;
> > +                             #interrupt-cells = <2>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     gpioc: gpio@58020800 {
> > +                             gpio-controller;
> > +                             #gpio-cells = <2>;
> > +                             reg = <0x800 0x400>;
> > +                             clocks = <&rcc GPIOC_CK>;
> > +                             st,bank-name = "GPIOC";
> > +                             interrupt-controller;
> > +                             #interrupt-cells = <2>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     gpiod: gpio@58020c00 {
> > +                             gpio-controller;
> > +                             #gpio-cells = <2>;
> > +                             reg = <0xc00 0x400>;
> > +                             clocks = <&rcc GPIOD_CK>;
> > +                             st,bank-name = "GPIOD";
> > +                             interrupt-controller;
> > +                             #interrupt-cells = <2>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     gpioe: gpio@58021000 {
> > +                             gpio-controller;
> > +                             #gpio-cells = <2>;
> > +                             reg = <0x1000 0x400>;
> > +                             clocks = <&rcc GPIOE_CK>;
> > +                             st,bank-name = "GPIOE";
> > +                             interrupt-controller;
> > +                             #interrupt-cells = <2>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     gpiof: gpio@58021400 {
> > +                             gpio-controller;
> > +                             #gpio-cells = <2>;
> > +                             reg = <0x1400 0x400>;
> > +                             clocks = <&rcc GPIOF_CK>;
> > +                             st,bank-name = "GPIOF";
> > +                             interrupt-controller;
> > +                             #interrupt-cells = <2>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     gpiog: gpio@58021800 {
> > +                             gpio-controller;
> > +                             #gpio-cells = <2>;
> > +                             reg = <0x1800 0x400>;
> > +                             clocks = <&rcc GPIOG_CK>;
> > +                             st,bank-name = "GPIOG";
> > +                             interrupt-controller;
> > +                             #interrupt-cells = <2>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     gpioh: gpio@58021c00 {
> > +                             gpio-controller;
> > +                             #gpio-cells = <2>;
> > +                             reg = <0x1c00 0x400>;
> > +                             clocks = <&rcc GPIOH_CK>;
> > +                             st,bank-name = "GPIOH";
> > +                             interrupt-controller;
> > +                             #interrupt-cells = <2>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     gpioi: gpio@58022000 {
> > +                             gpio-controller;
> > +                             #gpio-cells = <2>;
> > +                             reg = <0x2000 0x400>;
> > +                             clocks = <&rcc GPIOI_CK>;
> > +                             st,bank-name = "GPIOI";
> > +                             interrupt-controller;
> > +                             #interrupt-cells = <2>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     gpioj: gpio@58022400 {
> > +                             gpio-controller;
> > +                             #gpio-cells = <2>;
> > +                             reg = <0x2400 0x400>;
> > +                             clocks = <&rcc GPIOJ_CK>;
> > +                             st,bank-name = "GPIOJ";
> > +                             interrupt-controller;
> > +                             #interrupt-cells = <2>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     gpiok: gpio@58022800 {
> > +                             gpio-controller;
> > +                             #gpio-cells = <2>;
> > +                             reg = <0x2800 0x400>;
> > +                             clocks = <&rcc GPIOK_CK>;
> > +                             st,bank-name = "GPIOK";
> > +                             interrupt-controller;
> > +                             #interrupt-cells = <2>;
> > +                             status = "disabled";
> > +                     };
> > +             };
> >       };
> >   };
> >
> > diff --git a/arch/arm/boot/dts/stm32h743i-disco.dts b/arch/arm/boot/dts/stm32h743i-disco.dts
> > index e446d311c520..59e01ce10318 100644
> > --- a/arch/arm/boot/dts/stm32h743i-disco.dts
> > +++ b/arch/arm/boot/dts/stm32h743i-disco.dts
> > @@ -42,7 +42,7 @@
> >
> >   /dts-v1/;
> >   #include "stm32h743.dtsi"
> > -#include "stm32h743-pinctrl.dtsi"
> > +#include "stm32h7-pinctrl.dtsi"
> >
> >   / {
> >       model = "STMicroelectronics STM32H743i-Discovery board";
> > diff --git a/arch/arm/boot/dts/stm32h743i-eval.dts b/arch/arm/boot/dts/stm32h743i-eval.dts
> > index 8f398178f5e5..38cc7faf6884 100644
> > --- a/arch/arm/boot/dts/stm32h743i-eval.dts
> > +++ b/arch/arm/boot/dts/stm32h743i-eval.dts
> > @@ -42,7 +42,7 @@
> >
> >   /dts-v1/;
> >   #include "stm32h743.dtsi"
> > -#include "stm32h743-pinctrl.dtsi"
> > +#include "stm32h7-pinctrl.dtsi"
> >
> >   / {
> >       model = "STMicroelectronics STM32H743i-EVAL board";
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
