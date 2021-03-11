Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4456B3372AE
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 13:33:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1010C5718B;
	Thu, 11 Mar 2021 12:33:34 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 001B7C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 12:33:31 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id f20so21651806ioo.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 04:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ohn0BA71nRAjw9PLIhp8BCrIpL90tt+uHNBmyCfKZNI=;
 b=JXn7RVO6Obcws5EHsQPKqbeC9detSdti6QlOEiHIjOD9bP38FNLGUbPN6LITAi/+52
 U8rtGkO/mr12IGPVpBz1rEt4sV/tXEYou2f237QVTGB7a8ij96WkuNdSJMfcZTlzx+7v
 C+5f/6lHn3PvQpITERfwiOlVIxxLpybAmDgnq8L/5l93lVWfo5E5BLzVL8TFttibZKAR
 fKpjMlKY9Qyo4X5k+o4NzfhOBe3dXy/46Py3JdctE/XrB5zAtfheZhig49nLz3aoEYAE
 j+o10lcgHhfco6YXCu2+1wHfAejONyiV3IteKmliHp+rRz3QARTfv0rj9A3jWPmNbbNz
 u7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ohn0BA71nRAjw9PLIhp8BCrIpL90tt+uHNBmyCfKZNI=;
 b=CZcCVDev3U3gOdxuC63HsSlItV0GildDz6NNv6xURnmKebG86OKkpkFtPQoXQIOJle
 2fzBNwYh198fLGUtWr40ONkLsATEwtkVw0GD853BuLKLcPWaq9eX3/EI++an/KhVJTED
 iwIykmBPCnIyAuv7fTybkmpqigvtcIOB1Bo7fr1o3niK8WVZJjeBVG4UYwIZ6oa2hCWo
 PGvesPR/DQ3kTr4lXARPxVg9aqD9DGpYsKJi6Au/+wlzs5uKje4HbSwjgfpoqoiZPrj2
 f25WbFbGxXfK2W5j3g0cVyR+gfGQFy40snkF3ZktAFoX5uWJUctETrekEuRNINO0QSV5
 n1GQ==
X-Gm-Message-State: AOAM530OwtvMDYJwYFviW8vDbVdqrloVnSiPvKXLZCdgRhdlBHKu7+1V
 tn/v/BAPrfOdM3Z9HD8WXnHv6BC+OiqVRFoFofg=
X-Google-Smtp-Source: ABdhPJz1D6iNjnDxMLP2MUVQs32Pn1AEgBCoBbJHgnsCdPntuIOOJ4qeHCuGnPY67Jw67UeozWP+pKbbYyw7/VRCGgY=
X-Received: by 2002:a05:6638:388e:: with SMTP id
 b14mr3419011jav.62.1615466010727; 
 Thu, 11 Mar 2021 04:33:30 -0800 (PST)
MIME-Version: 1.0
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
 <1614758717-18223-8-git-send-email-dillon.minfei@gmail.com>
 <c6bd6a3f-b53d-71d0-d9b4-69d29eb27395@foss.st.com>
In-Reply-To: <c6bd6a3f-b53d-71d0-d9b4-69d29eb27395@foss.st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 11 Mar 2021 20:32:54 +0800
Message-ID: <CAL9mu0+MVrq3P7URMauhqwKkxoZ-6fxGVvDErfcH+MycAUrBdA@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 7/8] ARM: dts: stm32: add support for
 art-pi board based on stm32h750xbh6
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

Hi Alexandre

On Thu, Mar 11, 2021 at 6:42 PM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
>
>
> On 3/3/21 9:05 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > This patchset has following changes:
> >
> > - add stm32h750i-art-pi.dtb
> > - add dts binding usart3 for bt, uart4 for console
> > - add dts binding sdmmc2 for wifi
> > - add stm32h750-art-pi.dts to support art-pi board
> >
> > board component:
> > - 8MiB qspi flash
> > - 16MiB spi flash
> > - 32MiB sdram
> > - ap6212 wifi&bt&fm
> >
> > the detail board information can be found at:
> > https://art-pi.gitee.io/website/
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >   arch/arm/boot/dts/Makefile              |   1 +
> >   arch/arm/boot/dts/stm32h743.dtsi        |  30 +++++
> >   arch/arm/boot/dts/stm32h750.dtsi        |   5 +
> >   arch/arm/boot/dts/stm32h750i-art-pi.dts | 224 ++++++++++++++++++++++++++++++++
> >   4 files changed, 260 insertions(+)
> >   create mode 100644 arch/arm/boot/dts/stm32h750.dtsi
> >   create mode 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 8e5d4ab4e75e..a19c5ab9df84 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1071,6 +1071,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
> >       stm32746g-eval.dtb \
> >       stm32h743i-eval.dtb \
> >       stm32h743i-disco.dtb \
> > +     stm32h750i-art-pi.dtb \
> >       stm32mp153c-dhcom-drc02.dtb \
> >       stm32mp157a-avenger96.dtb \
> >       stm32mp157a-dhcor-avenger96.dtb \
> > diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
> > index 4ebffb0a45a3..981d44051007 100644
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
>
> Those peripherals are available on h743 ?
Yes, available for stm32h743, but might not used by stm32h743i-disco board.
the difference between stm32h743xi and stm32h750xb:
 flash size:  2048/128,
ad convter : none/3
crypto-hash: none/aes,hmac,....

>
> >               i2c1: i2c@40005400 {
> >                       compatible = "st,stm32f7-i2c";
> >                       #address-cells = <1>;
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
> > diff --git a/arch/arm/boot/dts/stm32h750.dtsi b/arch/arm/boot/dts/stm32h750.dtsi
> > new file mode 100644
> > index 000000000000..dd9166223c2f
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/stm32h750.dtsi
> > @@ -0,0 +1,5 @@
> > +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
> > +/* Copyright (C) STMicroelectronics 2021 - All Rights Reserved */
> > +
> > +#include "stm32h743.dtsi"
> > +
> > diff --git a/arch/arm/boot/dts/stm32h750i-art-pi.dts b/arch/arm/boot/dts/stm32h750i-art-pi.dts
> > new file mode 100644
> > index 000000000000..84cf70d7800c
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/stm32h750i-art-pi.dts
> > @@ -0,0 +1,224 @@
> > +/*
> > + * Copyright 2021 - Dillon Min <dillon.minfei@gmail.com>
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
> > +/dts-v1/;
> > +#include "stm32h750.dtsi"
> > +#include "stm32h750-pinctrl.dtsi"
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +     model = "RT-Thread STM32H750i-ART-PI board";
> > +     compatible = "st,stm32h750i-art-pi", "st,stm32h750";
> > +
> > +     chosen {
> > +             bootargs = "root=/dev/ram";
> > +             stdout-path = "serial0:2000000n8";
> > +     };
> > +
> > +     memory@c0000000 {
> > +             device_type = "memory";
> > +             reg = <0xc0000000 0x2000000>;
> > +     };
> > +
> > +     reserved-memory {
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             ranges;
> > +
> > +             linux,cma {
> > +                     compatible = "shared-dma-pool";
> > +                     no-map;
> > +                     size = <0x100000>;
> > +                     linux,dma-default;
> > +             };
> > +     };
> > +
> > +     aliases {
> > +             serial0 = &uart4;
> > +             serial1 = &usart3;
> > +     };
> > +
> > +     leds {
> > +             compatible = "gpio-leds";
> > +             led-red {
> > +                     gpios = <&gpioi 8 0>;
> > +             };
> > +             led-green {
> > +                     gpios = <&gpioc 15 0>;
> > +                     linux,default-trigger = "heartbeat";
> > +             };
> > +     };
> > +
> > +     v3v3: regulator-v3v3 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "v3v3";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     wlan_pwr: regulator-wlan {
> > +             compatible = "regulator-fixed";
> > +
> > +             regulator-name = "wl-reg";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +
> > +             gpios = <&gpioc 13 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +     };
> > +};
> > +
> > +&clk_hse {
> > +     clock-frequency = <25000000>;
> > +};
> > +
> > +&mac {
> > +     status = "disabled";
> > +     pinctrl-0       = <&ethernet_rmii>;
> > +     pinctrl-names   = "default";
> > +     phy-mode        = "rmii";
> > +     phy-handle      = <&phy0>;
> > +
> > +     mdio0 {
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +             compatible = "snps,dwmac-mdio";
> > +             phy0: ethernet-phy@0 {
> > +                     reg = <0>;
> > +             };
> > +     };
> > +};
> > +
> > +&sdmmc1 {
> > +     pinctrl-names = "default", "opendrain", "sleep";
> > +     pinctrl-0 = <&sdmmc1_b4_pins_a>;
> > +     pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> > +     pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> > +     broken-cd;
> > +     st,neg-edge;
> > +     bus-width = <4>;
> > +     vmmc-supply = <&v3v3>;
> > +     status = "okay";
> > +};
> > +
> > +&usart2 {
> > +     pinctrl-0 = <&usart2_pins>;
> > +     pinctrl-names = "default";
> > +     status = "disabled";
> > +};
> > +
> > +&uart4 {
> > +     pinctrl-0 = <&uart4_pins>;
> > +     pinctrl-names = "default";
> > +     status = "okay";
> > +};
> > +
> > +&dma1 {
> > +     status = "okay";
> > +};
> > +
>
> Would be better to order by name, but it is your board :)
Okay, i will follow stm32f7/f4's order next submit.
>
> > +&dma2 {
> > +     status = "okay";
> > +};
> > +
> > +&spi1 {
> > +     status = "okay";
> > +     pinctrl-0 = <&spi1_pins>;
> > +     pinctrl-names = "default";
> > +     cs-gpios = <&gpioa 4 GPIO_ACTIVE_LOW>;
> > +     dmas = <&dmamux1 37 0x400 0x05>,
> > +            <&dmamux1 38 0x400 0x05>;
> > +     dma-names = "rx", "tx";
> > +
> > +     flash@0 {
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             compatible = "winbond,w25q128", "jedec,spi-nor";
> > +             reg = <0>;
> > +             spi-max-frequency = <80000000>;
> > +
> > +             partition@0 {
> > +                     label = "root filesystem";
> > +                     reg = <0 0x1000000>;
> > +             };
> > +     };
> > +};
> > +
> > +&sdmmc2 {
> > +     pinctrl-names = "default", "opendrain", "sleep";
> > +     pinctrl-0 = <&sdmmc2_b4_pins_a>;
> > +     pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
> > +     pinctrl-2 = <&sdmmc2_b4_sleep_pins_a>;
> > +     broken-cd;
> > +     non-removable;
> > +     st,neg-edge;
> > +     bus-width = <4>;
> > +     vmmc-supply = <&wlan_pwr>;
> > +     status = "okay";
> > +
> > +     #address-cells = <1>;
> > +     #size-cells = <0>;
> > +     brcmf: bcrmf@1 {
> > +             reg = <1>;
> > +             compatible = "brcm,bcm4329-fmac";
> > +     };
> > +};
> > +
> > +&usart3 {
> > +     /delete-property/st,hw-flow-ctrl;
> > +     cts-gpios = <&gpiod 11 GPIO_ACTIVE_LOW>;
> > +     rts-gpios = <&gpiod 12 GPIO_ACTIVE_LOW>;
> > +     dmas = <&dmamux1 45 0x400 0x05>,
> > +            <&dmamux1 46 0x400 0x05>;
> > +     dma-names = "rx", "tx";
> > +     status = "okay";
> > +
> > +     bluetooth {
> > +             host-wakeup-gpios = <&gpioc 0 GPIO_ACTIVE_HIGH>;
> > +             device-wakeup-gpios = <&gpioi 10 GPIO_ACTIVE_HIGH>;
> > +             shutdown-gpios = <&gpioi 11 GPIO_ACTIVE_HIGH>;
> > +             compatible = "brcm,bcm43438-bt";
> > +             max-speed = <115200>;
> > +     };
> > +};
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
