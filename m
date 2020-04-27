Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A78A1BAEB8
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2020 22:06:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 009D2C36B0C;
	Mon, 27 Apr 2020 20:06:05 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65F79C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 20:05:57 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id r16so14545624edw.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7yXU65+Kc2UcXPVHH+ETGSKy2NXXR26k4bx7MRK6hTc=;
 b=iD++08mifUw87PBkeoPTVMI7mbtR+i/1xKZuKo7UCCyKXSzoR+YFPV54sMxoT+YfT7
 R+XRVcH/4Jy7rCBcYSO6hiXrbCG1DU5ASjLZzgew3SdylK5Tvww/vbQMbZVFvDUifc2z
 viS/T9HH4P+Sx0N3bMYlM0ar+/Qzu/LJAvgS3mUS1DsENx6/YmDkiumtOJoz4FafSkx/
 tuYRhXkMd7+zBEZsPpiJbhEaXo8XL2yYFNFeoEo965qBen7ETP/t4koP0RR/CVA6Haai
 ts8fR3gjLyNWxt8wZv5sKqSsAoKc7TiMlDnWehYj4KEorjs266UydRf2uHipI07oJdNg
 OPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7yXU65+Kc2UcXPVHH+ETGSKy2NXXR26k4bx7MRK6hTc=;
 b=dutzcAxcMWk6yDL07JRTXB4DQmNYj65DwVFTskWen5XuAgNVcSqmRWhgEZ7J8xB9ZM
 GPmBAVXASOMMLHJUkMv8N/B9+NYi80mITOqwUAvHQJklmO04aMYwDanaKHLx2zUyqcJR
 I3D5OP/GwIPTp0p7cd8af30JeRZsAQ6VvxEc10+lPTAdQ9YkR18cjH+ebo2TwLvyFWV1
 Q9zyXeI1W6Zns+S/3b4vVEalHE3KVE21x4xd/w0TC74XFXs6EDCHAtCOOjsMNCQDVap5
 b4Ue50omvkqj6eCwb7HVGsP/iZ/hDUjdg8SN8cCdF9sM9tApnvO+Gl1YbPGTkMk3GDls
 OBLA==
X-Gm-Message-State: AGi0PuaTntRXkrb4yfu0Aa5G9BOXS9YGBcSx+4qQdfqN4/aGJXw2CD0E
 9vxdOCZZ71B8f6pGpgzbltU8uhBnck/3KOPcjbg=
X-Google-Smtp-Source: APiQypIY/zDA+cX9HGDQmCk+x1yevA/lfThelg1G0GWFZnD3MnNwgcSiaZezJPN3HQIKkIAKGXiuhtDyOOlj9uQzePY=
X-Received: by 2002:a05:6402:319c:: with SMTP id
 di28mr20908888edb.185.1588017956568; 
 Mon, 27 Apr 2020 13:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200424182139.32190-1-pop.adrian61@gmail.com>
 <3efb57a1-283b-f2f0-66a4-97e88c6c02d6@st.com>
In-Reply-To: <3efb57a1-283b-f2f0-66a4-97e88c6c02d6@st.com>
From: Adrian Pop <pop.adrian61@gmail.com>
Date: Mon, 27 Apr 2020 23:05:54 +0300
Message-ID: <CAP-HsdS0rq4iCq1oqpTU=EXF8UWbfPivCJVZG-4b7jyvdHHXUw@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] arm: dts: stm32f769-disco: Enable
	MIPI DSI display support
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

Added lee.jones@linaro.org.

First, thank you all for taking a look at my changes!

Hello Alex,

On Mon, Apr 27, 2020 at 11:28 AM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
>
> Hi Adrian
>
> On 4/24/20 8:21 PM, Adrian Pop wrote:
> > STM32f769-disco features a 4" MIPI DSI display: add support for it.
> >
> > Signed-off-by: Adrian Pop <pop.adrian61@gmail.com>
> > ---
>
> Commit title should be ARM: dts: stm32: ...

Will fix in next version if that's ok.

>
> Can you explain a bit more in your commit message why do you use a
> reserved memory pool for DMA and where this pool is located. (I assume
> it's linked to a story of DMA and cache memory attribute on cortexM7...)

Need to look more into this, but if I remove it, /dev/fb0 is not
available anymore and I get a warning stating:
...
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] Initialized stm 1.0.0 20170330 for 40016800.display-controller on minor 0
------------[ cut here ]------------
WARNING: CPU: 0 PID: 13 at arch/arm/mm/dma-mapping-nommu.c:50 0xc000b8ed
CPU: 0 PID: 13 Comm: kworker/0:1 Not tainted 5.6.0-next-20200412 #23
Hardware name: STM32 (Device Tree Support)
Workqueue: events 0xc014fa35
Function entered at [<c000b325>] from [<c000a487>]
...

When I looked in arch/arm/mm/dma-mapping-nommu.c:50, there is a comment stating:

    /*
     * dma_alloc_from_global_coherent() may fail because:
     *
     * - no consistent DMA region has been defined, so we can't
     *   continue.
     * - there is no space left in consistent DMA region, so we
     *   only can fallback to generic allocator if we are
     *   advertised that consistency is not required.
     */

This is the reason I added the reserved-memory.

About the location, does it need to be hardcoded? On my board
(STM32F769I-Disco, tftp boot) in boot log I get:
...
Reserved memory: created DMA memory pool at 0xc0ef1000, size 1 MiB
OF: reserved mem: initialized node linux,dma, compatible id shared-dma-pool
...

>
> Did you try this configuration with XIP boot ?

I did not try with XIP. Currently loading zImage from tftp to memory.
Will try with XIP as well, and get back with feedback.

>
> regards
> alex
>
> >   arch/arm/boot/dts/stm32f746.dtsi      | 34 ++++++++++++++++++
> >   arch/arm/boot/dts/stm32f769-disco.dts | 50 +++++++++++++++++++++++++++
> >   2 files changed, 84 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
> > index 93c063796780..202bb6edc9f1 100644
> > --- a/arch/arm/boot/dts/stm32f746.dtsi
> > +++ b/arch/arm/boot/dts/stm32f746.dtsi
> > @@ -48,6 +48,19 @@ / {
> >       #address-cells = <1>;
> >       #size-cells = <1>;
> >
> > +     reserved-memory {
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             ranges;
> > +
> > +             linux,dma {
> > +                     compatible = "shared-dma-pool";
> > +                     linux,dma-default;
> > +                     no-map;
> > +                     size = <0x10F000>;
> > +             };
> > +     };
> > +
> >       clocks {
> >               clk_hse: clk-hse {
> >                       #clock-cells = <0>;
> > @@ -75,6 +88,27 @@ clk_i2s_ckin: clk-i2s-ckin {
> >       };
> >
> >       soc {
> > +             ltdc: display-controller@40016800 {
> > +                     compatible = "st,stm32-ltdc";
> > +                     reg = <0x40016800 0x200>;
> > +                     interrupts = <88>, <89>;
> > +                     resets = <&rcc STM32F7_APB2_RESET(LTDC)>;
> > +                     clocks = <&rcc 1 CLK_LCD>;
> > +                     clock-names = "lcd";
> > +                     status = "disabled";
> > +             };
> > +
> > +             dsi: dsi@40016c00 {
> > +                     compatible = "st,stm32-dsi";
> > +                     reg = <0x40016c00 0x800>;
> > +                     interrupts = <98>;
> > +                     clocks = <&rcc 1 CLK_F769_DSI>, <&clk_hse>;
> > +                     clock-names = "pclk", "ref";
> > +                     resets = <&rcc STM32F7_APB2_RESET(DSI)>;
> > +                     reset-names = "apb";
> > +                     status = "disabled";
> > +             };
> > +
> >               timer2: timer@40000000 {
> >                       compatible = "st,stm32-timer";
> >                       reg = <0x40000000 0x400>;
> > diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
> > index 1626e00bb2cb..30ebbc193e82 100644
> > --- a/arch/arm/boot/dts/stm32f769-disco.dts
> > +++ b/arch/arm/boot/dts/stm32f769-disco.dts
> > @@ -153,3 +153,53 @@ &usbotg_hs {
> >       pinctrl-names = "default";
> >       status = "okay";
> >   };
> > +
> > +&dsi {
> > +     #address-cells = <1>;
> > +     #size-cells = <0>;
> > +     status = "okay";
> > +
> > +     ports {
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             port@0 {
> > +                     reg = <0>;
> > +                     dsi_in: endpoint {
> > +                             remote-endpoint = <&ltdc_out_dsi>;
> > +                     };
> > +             };
> > +
> > +             port@1 {
> > +                     reg = <1>;
> > +                     dsi_out: endpoint {
> > +                             remote-endpoint = <&dsi_in_panel>;
> > +                     };
> > +             };
> > +
> > +     };
> > +
> > +     panel: panel {
> > +             compatible = "orisetech,otm8009a";
> > +             reg = <0>; /* dsi virtual channel (0..3) */
> > +             reset-gpios = <&gpioj 15 GPIO_ACTIVE_LOW>;
> > +             status = "okay";
> > +
> > +             port {
> > +                     dsi_in_panel: endpoint {
> > +                             remote-endpoint = <&dsi_out>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&ltdc {
> > +     dma-ranges;

Need to remove this, not needed and causes a warning.

> > +     status = "okay";
> > +
> > +     port {
> > +             ltdc_out_dsi: endpoint {
> > +                     remote-endpoint = <&dsi_in>;
> > +             };
> > +     };
> > +};
> >

Regards,
Adrian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
