Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDB3341425
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 05:27:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66C35C57B7C;
	Fri, 19 Mar 2021 04:27:45 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11FCCC57B7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 04:27:41 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id x16so4733995iob.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 21:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=UsoxMKgIQdHmffd/IPh562qeSladHISVZVfmi2yq0Sw=;
 b=pZuyBRZxtHZOKiJcY5++SXQ6VSBKhH+J8ygUNmyPNGvSoc2BXdc9DPbs2Yv4SSUBZw
 BhcnW9rwiUnZNMeABJ0PWcq5xJqtEpx7imgeIUfeTu2bgalnPCU/71XTM0JKPmf9RhWT
 KZuJbiWlGpo9kkyrg+F2oXPTRvcSIeRwwgPv+ZMlGIyXyf+1ekvYvFF9hX8meFlW1NI0
 D+c4bH/DWmEYZrtev4MhlUpvME2BWCmbEkvEz/0eaBaoFWVeYMte01PX41SCdxl5xsfW
 r2qAmwHrWiLabnxqSavjuo4Im2yHYAw62cU2caT10t8qsQJpdfmy1mW+MyXjrMzb7+vo
 vVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=UsoxMKgIQdHmffd/IPh562qeSladHISVZVfmi2yq0Sw=;
 b=scgFLhwHfNmPu7xNtEUQKiucdmsppLzW041Dq6ucgQ++OrbnyJJzklRPv4oFTH+bof
 gTXOy+YumhNrwgKe3xOanyb8S7aCfFuFB5Vd/XNAQz+7EEGL+/DaEpFo/QVyG9KeXvEf
 C5nl+RO8oNUOVomdVrONZGt2RUBwIwjKmnYGMSiBSsVAHulZ18Kx3tDlIZZQ8KpOSBLL
 /sp3Y0aX0zsq2B6pKZuyAYUR/Gedare4mlyvuNZNfzdTqyE+BbNte2tWDnJxQSeOZgGp
 Cj4/YIogW2M3I6N6k1BInkK6X5OCSIqr54lKJDJ7Je7qG3ngprHusWza0+4SWUqXkoe8
 wSng==
X-Gm-Message-State: AOAM532zceXyXIqlQiktuW8K6kRYUdMHNgAzAjhyVq8YEjEONpLeUN66
 c7WrOnkXzehtv3iqcMvX7V0jAtFVOa/kX+yJIhU=
X-Google-Smtp-Source: ABdhPJzoZGP0KU0nAE6cG65CRfcmv9+nGRCjfo8zD0aRjPFk6vX40fwcMMvhzBwTU0fRFrNWvkfZbt5Kb4GeMxY2gCU=
X-Received: by 2002:a05:6638:dc3:: with SMTP id
 m3mr5071030jaj.130.1616128060505; 
 Thu, 18 Mar 2021 21:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
 <1615801436-3016-7-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1615801436-3016-7-git-send-email-dillon.minfei@gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 19 Mar 2021 12:27:04 +0800
Message-ID: <CAL9mu0JsFDfGuWD8k6e5Sw8B5zOFVHSXhQ858u28Qg1M=ZVNWw@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@st.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux@armlinux.org.uk,
 Vladimir Murzin <vladimir.murzin@arm.com>, afzal.mohd.ma@gmail.com, 
 gregkh@linuxfoundation.org, erwan.leray@st.com, erwan.leray@foss.st.com, 
 linux-serial@vger.kernel.org, lkp@intel.com
Subject: Re: [Linux-stm32] [PATCH v3 6/9] ARM: dts: stm32: add support for
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

No changes, Just loop lkp in.


Hi lkp,

Sorry for the late reply, thanks for your report.
This patch is to fix the build warning message.

Thanks.

On Mon, Mar 15, 2021 at 5:45 PM <dillon.minfei@gmail.com> wrote:
>
> From: dillon min <dillon.minfei@gmail.com>
>
> This patchset has following changes:
>
> - introduce stm32h750.dtsi to support stm32h750 value line
> - add stm32h750i-art-pi.dtb (arch/arm/boot/dts/Makefile)
> - add dts binding usart3 for bt, uart4 for console
>   usart3/uart4 pinctrl in stm32h7-pinctrl.dtsi
>   usart3/uart4 register in stm32h743.dtsi
> - add dts binding sdmmc2 for wifi
>   sdmmc2 pinctrl in stm32h7-pinctrl.dtsi
>   sdmmc2 register in stm32h743.dtsi
> - add spi1 pinctrl in stm32h7-pinctrl.dtsi for spi flash
> - add stm32h750-art-pi.dts to support art-pi board
> - move pinctrl: pin-controller{} from stm32h7-pinctrl.dtsi to stm32h743.dtsi
>   to fix dtbs_check warrning
> - change 'i2c4: i2c@58001C00' to 'i2c4: i2c@58001c00', else will get
>   dtbs_check warrning:
>   >> arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: soc: 'i2c@40005C00',
>      'i2c@58001C00' do not match any of the regexes:
>      '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$', 'pinctrl-[0-9]+'
>   ...
>
> art-pi board component:
> - 8MiB qspi flash
> - 16MiB spi flash
> - 32MiB sdram
> - ap6212 wifi&bt&fm
>
> the detail board information can be found at:
> https://art-pi.gitee.io/website/
>
> Fixes: 500cdb23d608 ("ARM: dts: stm32: Add STM32H743 MCU and STM32H743i-EVAL board")
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> v3:
> - move pinctrl: pin-controller{} from stm32h7-pinctrl.dtsi to stm32h743.dtsi
>   to fix dtbs_check warrning
>   >> arch/arm/boot/dts/stm32h743i-eval.dt.yaml: soc: pin-controller: {'type':
>   'object'} is not allowed for {'#address-cells': [[1]], '#size-cells':
>   [[1]], 'ranges': [[0,
> - fix dtbs_check warrning:
>   arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: soc: 'i2c@40005C00',
>   'i2c@58001C00' do not match any of the regexes:
>   '@(0|[1-9a-f][0-9a-f]*)$', '^[^@]+$', 'pinctrl-[0-9]+'
>
> v2:
> - fix author name/copyright mistake
> - make item in stm32h750i-art-pi.dts sort by letter
>
>  arch/arm/boot/dts/Makefile              |   1 +
>  arch/arm/boot/dts/stm32h743.dtsi        | 153 ++++++++++++++++++++-
>  arch/arm/boot/dts/stm32h750.dtsi        |   5 +
>  arch/arm/boot/dts/stm32h750i-art-pi.dts | 228 ++++++++++++++++++++++++++++++++
>  4 files changed, 385 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/boot/dts/stm32h750.dtsi
>  create mode 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 8e5d4ab4e75e..a19c5ab9df84 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1071,6 +1071,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
>         stm32746g-eval.dtb \
>         stm32h743i-eval.dtb \
>         stm32h743i-disco.dtb \
> +       stm32h750i-art-pi.dtb \
>         stm32mp153c-dhcom-drc02.dtb \
>         stm32mp157a-avenger96.dtb \
>         stm32mp157a-dhcor-avenger96.dtb \
> diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
> index 4ebffb0a45a3..4379063d36a2 100644
> --- a/arch/arm/boot/dts/stm32h743.dtsi
> +++ b/arch/arm/boot/dts/stm32h743.dtsi
> @@ -135,6 +135,22 @@
>                         clocks = <&rcc USART2_CK>;
>                 };
>
> +               usart3: serial@40004800 {
> +                       compatible = "st,stm32h7-uart";
> +                       reg = <0x40004800 0x400>;
> +                       interrupts = <39>;
> +                       status = "disabled";
> +                       clocks = <&rcc USART3_CK>;
> +               };
> +
> +               uart4: serial@40004c00 {
> +                       compatible = "st,stm32h7-uart";
> +                       reg = <0x40004c00 0x400>;
> +                       interrupts = <52>;
> +                       status = "disabled";
> +                       clocks = <&rcc UART4_CK>;
> +               };
> +
>                 i2c1: i2c@40005400 {
>                         compatible = "st,stm32f7-i2c";
>                         #address-cells = <1>;
> @@ -159,7 +175,7 @@
>                         status = "disabled";
>                 };
>
> -               i2c3: i2c@40005C00 {
> +               i2c3: i2c@40005c00 {
>                         compatible = "st,stm32f7-i2c";
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> @@ -368,6 +384,20 @@
>                         max-frequency = <120000000>;
>                 };
>
> +               sdmmc2: mmc@48022400 {
> +                       compatible = "arm,pl18x", "arm,primecell";
> +                       arm,primecell-periphid = <0x10153180>;
> +                       reg = <0x48022400 0x400>;
> +                       interrupts = <124>;
> +                       interrupt-names = "cmd_irq";
> +                       clocks = <&rcc SDMMC2_CK>;
> +                       clock-names = "apb_pclk";
> +                       resets = <&rcc STM32H7_AHB2_RESET(SDMMC2)>;
> +                       cap-sd-highspeed;
> +                       cap-mmc-highspeed;
> +                       max-frequency = <120000000>;
> +               };
> +
>                 exti: interrupt-controller@58000000 {
>                         compatible = "st,stm32h7-exti";
>                         interrupt-controller;
> @@ -392,7 +422,7 @@
>                         status = "disabled";
>                 };
>
> -               i2c4: i2c@58001C00 {
> +               i2c4: i2c@58001c00 {
>                         compatible = "st,stm32f7-i2c";
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> @@ -555,6 +585,125 @@
>                         snps,pbl = <8>;
>                         status = "disabled";
>                 };
> +
> +               pinctrl: pin-controller@58020000 {
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0 0x58020000 0x3000>;
> +                       interrupt-parent = <&exti>;
> +                       st,syscfg = <&syscfg 0x8>;
> +                       pins-are-numbered;
> +
> +                       gpioa: gpio@58020000 {
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +                               reg = <0x0 0x400>;
> +                               clocks = <&rcc GPIOA_CK>;
> +                               st,bank-name = "GPIOA";
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +                       };
> +
> +                       gpiob: gpio@58020400 {
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +                               reg = <0x400 0x400>;
> +                               clocks = <&rcc GPIOB_CK>;
> +                               st,bank-name = "GPIOB";
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +                       };
> +
> +                       gpioc: gpio@58020800 {
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +                               reg = <0x800 0x400>;
> +                               clocks = <&rcc GPIOC_CK>;
> +                               st,bank-name = "GPIOC";
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +                       };
> +
> +                       gpiod: gpio@58020c00 {
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +                               reg = <0xc00 0x400>;
> +                               clocks = <&rcc GPIOD_CK>;
> +                               st,bank-name = "GPIOD";
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +                       };
> +
> +                       gpioe: gpio@58021000 {
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +                               reg = <0x1000 0x400>;
> +                               clocks = <&rcc GPIOE_CK>;
> +                               st,bank-name = "GPIOE";
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +                       };
> +
> +                       gpiof: gpio@58021400 {
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +                               reg = <0x1400 0x400>;
> +                               clocks = <&rcc GPIOF_CK>;
> +                               st,bank-name = "GPIOF";
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +                       };
> +
> +                       gpiog: gpio@58021800 {
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +                               reg = <0x1800 0x400>;
> +                               clocks = <&rcc GPIOG_CK>;
> +                               st,bank-name = "GPIOG";
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +                       };
> +
> +                       gpioh: gpio@58021c00 {
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +                               reg = <0x1c00 0x400>;
> +                               clocks = <&rcc GPIOH_CK>;
> +                               st,bank-name = "GPIOH";
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +                       };
> +
> +                       gpioi: gpio@58022000 {
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +                               reg = <0x2000 0x400>;
> +                               clocks = <&rcc GPIOI_CK>;
> +                               st,bank-name = "GPIOI";
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +                       };
> +
> +                       gpioj: gpio@58022400 {
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +                               reg = <0x2400 0x400>;
> +                               clocks = <&rcc GPIOJ_CK>;
> +                               st,bank-name = "GPIOJ";
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +                       };
> +
> +                       gpiok: gpio@58022800 {
> +                               gpio-controller;
> +                               #gpio-cells = <2>;
> +                               reg = <0x2800 0x400>;
> +                               clocks = <&rcc GPIOK_CK>;
> +                               st,bank-name = "GPIOK";
> +                               interrupt-controller;
> +                               #interrupt-cells = <2>;
> +                       };
> +               };
>         };
>  };
>
> diff --git a/arch/arm/boot/dts/stm32h750.dtsi b/arch/arm/boot/dts/stm32h750.dtsi
> new file mode 100644
> index 000000000000..dd9166223c2f
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32h750.dtsi
> @@ -0,0 +1,5 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
> +/* Copyright (C) STMicroelectronics 2021 - All Rights Reserved */
> +
> +#include "stm32h743.dtsi"
> +
> diff --git a/arch/arm/boot/dts/stm32h750i-art-pi.dts b/arch/arm/boot/dts/stm32h750i-art-pi.dts
> new file mode 100644
> index 000000000000..87f1cbedfda5
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32h750i-art-pi.dts
> @@ -0,0 +1,228 @@
> +/*
> + * Copyright 2021 - Dillon Min <dillon.minfei@gmail.com>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * For art-pi board resources, you can refer to link:
> + *     https://art-pi.gitee.io/website/
> + */
> +
> +/dts-v1/;
> +#include "stm32h750.dtsi"
> +#include "stm32h750-pinctrl.dtsi"
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +       model = "RT-Thread STM32H750i-ART-PI board";
> +       compatible = "st,stm32h750i-art-pi", "st,stm32h750";
> +
> +       chosen {
> +               bootargs = "root=/dev/ram";
> +               stdout-path = "serial0:2000000n8";
> +       };
> +
> +       memory@c0000000 {
> +               device_type = "memory";
> +               reg = <0xc0000000 0x2000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               linux,cma {
> +                       compatible = "shared-dma-pool";
> +                       no-map;
> +                       size = <0x100000>;
> +                       linux,dma-default;
> +               };
> +       };
> +
> +       aliases {
> +               serial0 = &uart4;
> +               serial1 = &usart3;
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               led-red {
> +                       gpios = <&gpioi 8 0>;
> +               };
> +               led-green {
> +                       gpios = <&gpioc 15 0>;
> +                       linux,default-trigger = "heartbeat";
> +               };
> +       };
> +
> +       v3v3: regulator-v3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "v3v3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-always-on;
> +       };
> +
> +       wlan_pwr: regulator-wlan {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "wl-reg";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +
> +               gpios = <&gpioc 13 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
> +};
> +
> +&clk_hse {
> +       clock-frequency = <25000000>;
> +};
> +
> +&dma1 {
> +       status = "okay";
> +};
> +
> +&dma2 {
> +       status = "okay";
> +};
> +
> +&mac {
> +       status = "disabled";
> +       pinctrl-0       = <&ethernet_rmii>;
> +       pinctrl-names   = "default";
> +       phy-mode        = "rmii";
> +       phy-handle      = <&phy0>;
> +
> +       mdio0 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               compatible = "snps,dwmac-mdio";
> +               phy0: ethernet-phy@0 {
> +                       reg = <0>;
> +               };
> +       };
> +};
> +
> +&sdmmc1 {
> +       pinctrl-names = "default", "opendrain", "sleep";
> +       pinctrl-0 = <&sdmmc1_b4_pins_a>;
> +       pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
> +       pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
> +       broken-cd;
> +       st,neg-edge;
> +       bus-width = <4>;
> +       vmmc-supply = <&v3v3>;
> +       status = "okay";
> +};
> +
> +&sdmmc2 {
> +       pinctrl-names = "default", "opendrain", "sleep";
> +       pinctrl-0 = <&sdmmc2_b4_pins_a>;
> +       pinctrl-1 = <&sdmmc2_b4_od_pins_a>;
> +       pinctrl-2 = <&sdmmc2_b4_sleep_pins_a>;
> +       broken-cd;
> +       non-removable;
> +       st,neg-edge;
> +       bus-width = <4>;
> +       vmmc-supply = <&wlan_pwr>;
> +       status = "okay";
> +
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       brcmf: bcrmf@1 {
> +               reg = <1>;
> +               compatible = "brcm,bcm4329-fmac";
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +       pinctrl-0 = <&spi1_pins>;
> +       pinctrl-names = "default";
> +       cs-gpios = <&gpioa 4 GPIO_ACTIVE_LOW>;
> +       dmas = <&dmamux1 37 0x400 0x05>,
> +              <&dmamux1 38 0x400 0x05>;
> +       dma-names = "rx", "tx";
> +
> +       flash@0 {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               compatible = "winbond,w25q128", "jedec,spi-nor";
> +               reg = <0>;
> +               spi-max-frequency = <80000000>;
> +
> +               partition@0 {
> +                       label = "root filesystem";
> +                       reg = <0 0x1000000>;
> +               };
> +       };
> +};
> +
> +&usart2 {
> +       pinctrl-0 = <&usart2_pins>;
> +       pinctrl-names = "default";
> +       status = "disabled";
> +};
> +
> +&usart3 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&usart3_pins>;
> +       dmas = <&dmamux1 45 0x400 0x05>,
> +              <&dmamux1 46 0x400 0x05>;
> +       dma-names = "rx", "tx";
> +       st,hw-flow-ctrl;
> +       status = "okay";
> +
> +       bluetooth {
> +               compatible = "brcm,bcm43438-bt";
> +               host-wakeup-gpios = <&gpioc 0 GPIO_ACTIVE_HIGH>;
> +               device-wakeup-gpios = <&gpioi 10 GPIO_ACTIVE_HIGH>;
> +               shutdown-gpios = <&gpioi 11 GPIO_ACTIVE_HIGH>;
> +               max-speed = <115200>;
> +       };
> +};
> +
> +&uart4 {
> +       pinctrl-0 = <&uart4_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> --
> 1.9.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
