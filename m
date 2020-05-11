Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB02B1CD470
	for <lists+linux-stm32@lfdr.de>; Mon, 11 May 2020 11:06:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F9DAC36B22;
	Mon, 11 May 2020 09:06:02 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EF70C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 09:06:01 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id e8so7697731ilm.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 02:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KXPQ8oL1xKkz5N/1TA82hvXaOeCuVTJr1m04oqy4j94=;
 b=QQCg4mUX+wQSt9HJ5j0qgOn36rHY+87ZROvttm9Pa4pxhRgqIoB+DGF613qUhKHRQt
 H7L2MAbI9i0x6oxqXk8aB9lVAJuhwZPxftcdY+6+Hxe3SF9yVatTdtd5zdBTcAiYpEZ7
 0cXXftjo38Hv1w15ZeWjTTLAKEtl6DQVyksD1tXQ5u8lO86y9szmheVmCsODRIQXUfQb
 ssgeZsR+jpJd9xGQALPQg/ZzfnATi+JPXIqUidFbf3WSZDHQ3MCybXqws+iEsv1rS4wW
 Os+41ItdlZu00mg0xVudeuIg834QhX9wM4Q+DCodtzjvjTjlAryTAJduavjzUy44zZib
 +UhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KXPQ8oL1xKkz5N/1TA82hvXaOeCuVTJr1m04oqy4j94=;
 b=kkQma2dEidczW3dL8KbhHq0vwcFSr+vfmamtUWFb5mP/mW07uIXsYpf9gz3/wORDfM
 dhs76ODgoq7Dzu1qBy7FPPaVptXO3cwqwoJNGQKPc6mZSC+UlRNkOKQ4Qnz+0ApdTorP
 2wL3xpU7Bk5CXmXIvwPyUFVYO9fAVwwoeZbxjBLAtJD91W0yXTEYjnETccVnY0sYsFO7
 7rpigPsuHroViAGWl7QGKj7bpMGSS4kKFPuCMeWxUMw317Ft1vkF+w2qtYo66V9Mw/66
 9oLWkQeyqbRvrpMJGUdBv/PF8LreN8BuCmOtp4tIAgVFX94Ew/FejhdV44nXDWj2ZuBx
 Cvrw==
X-Gm-Message-State: AGi0PuZvDKIx4E7fBM++45FCqb6m1MCP6o/odzlo8zvXYl4XNCi6ogti
 RYM5Gh4JBixRVQkHOMI9plO9ix3zvZh22JCxNCI=
X-Google-Smtp-Source: APiQypLnjwDCTOoTp7cg995FVjGSfRMddjPCiRtwufCtIHvwd/5nPCOyL6yw+XfWN/gd71cdELN5CvnqJnAptBslxQQ=
X-Received: by 2002:a92:607:: with SMTP id x7mr13744092ilg.218.1589187959912; 
 Mon, 11 May 2020 02:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <1589007503-9523-1-git-send-email-dillon.minfei@gmail.com>
 <1589007503-9523-3-git-send-email-dillon.minfei@gmail.com>
 <404e7f47-9c0f-44b1-aedb-a8d3af832d40@st.com>
In-Reply-To: <404e7f47-9c0f-44b1-aedb-a8d3af832d40@st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Mon, 11 May 2020 17:05:23 +0800
Message-ID: <CAL9mu0+5T3q8V8Ng_1jfPGfBxDWzgd7T1hzcdUXj23-rEtOgfg@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: devicetree@vger.kernel.org, Hua Dillon <dillonhua@gmail.com>,
 mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 p.zabel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: enable l3gd20 on
	stm32429-disco board
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

Hi, Alexandre,

Thanks for review.

On Mon, May 11, 2020 at 3:17 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
>
> Hi
>
> On 5/9/20 8:58 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > Enable l3gd20 on stm32429-disco board.
>
> You could add some words about l3gd20
ok, thanks, i will add some description about l3gd20.
>
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >   arch/arm/boot/dts/stm32f429-disco.dts | 24 ++++++++++++++++++++++++
> >   1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
> > index 30c0f67..d365358 100644
> > --- a/arch/arm/boot/dts/stm32f429-disco.dts
> > +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> > @@ -49,6 +49,8 @@
> >   #include "stm32f429.dtsi"
> >   #include "stm32f429-pinctrl.dtsi"
> >   #include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/gpio/gpio.h>
> >
> >   / {
> >       model = "STMicroelectronics STM32F429i-DISCO board";
> > @@ -127,3 +129,25 @@
> >       pinctrl-names = "default";
> >       status = "okay";
> >   };
> > +
> > +&spi5 {
> > +     status = "okay";
> > +     pinctrl-0 = <&spi5_pins>;
> > +     pinctrl-names = "default";
> > +     #address-cells = <1>;
> > +     #size-cells = <0>;
> > +     cs-gpios = <&gpioc 1 GPIO_ACTIVE_LOW>;
> > +     dmas = <&dma2 3 2 0x400 0x0>,
> > +            <&dma2 4 2 0x400 0x0>;
> > +     dma-names = "rx", "tx";
>
> Insert blank line here.
ok
>
> > +     l3gd20: l3gd20@0 {
> > +             compatible = "st,l3gd20-gyro";
> > +             spi-max-frequency = <10000000>;
> > +             st,drdy-int-pin = <2>;
> > +             interrupt-parent = <&gpioa>;
> > +             interrupts = <1 IRQ_TYPE_EDGE_RISING>,
> > +                             <2 IRQ_TYPE_EDGE_RISING>;
> > +             reg = <0>;
> > +             status = "okay";
> > +     };
> > +};
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
