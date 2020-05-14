Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 409CF1D2B1B
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 11:18:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1678C36B12;
	Thu, 14 May 2020 09:18:24 +0000 (UTC)
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C7D5C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 09:18:21 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id b71so2578174ilg.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ydoBtyjQkZ71HME1rY9/L3edxtQ8UTZXOUoGaJuGgqs=;
 b=ZYqSa8L/3MIGZtdjLm0uDEAUX9qw4WfHyEd/Xw3RGOzYb1CkiCmu64wr9INtmjvKAv
 emNDZI8PC9mqxdaFO/x+7iDPFrRBkDTofku3oFwDsonyzK71UUmM/f2Ph34IYVB1ePui
 TRYJEkf6+HZ5dpJwh+khw4qEqdRQ1Yz4UtEMkaULjMFHZPky5finqqVyz2JPi5d/Mocq
 Ga+oJmmuDjPRydwsVFRhLCydvb7MAqHM/hyGTEJ+1CxinGcEilDhOARv4nY1Mia/4k5g
 0CjcHoE1TsdomFZGSZaCa096y7nxhGm4PrO3r+27z96mUV9fH7IfZq7KcSOXdK64+inC
 4q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ydoBtyjQkZ71HME1rY9/L3edxtQ8UTZXOUoGaJuGgqs=;
 b=XVduJpp360eB0EtU3dZ1Gk9ApcmDjkV0LCAq/wH8x8jvC5ArtcDHqrEDfOKIxfeuj1
 jH0X24vVclUwUypwPQCRf8d/QGFw6qDMZW2N1lGmbwnOltkN7ZZM5Jyn7JBWLhCH4f8n
 xoJpHuP3qGOlWNFpuP3Iy5lb15z1xXZ2L2bsFJu6XPvSmzbell0T5utwqhip4ZmtmF8o
 Qp3rFfErdVGd3moM1Ob+StIJnmSyGaoVDEiHWIL3K+GagB2B600SjIjhHabLgeBvHZkX
 A/Go0xDy4ylqLdLneUlagUi/D1/A/y4yDwGrKRtN/mo4FHH7oAmEVm2k+GtzPG3DMWhH
 CueA==
X-Gm-Message-State: AOAM5313/cZI7nkS+5SLVqbfvAGwxLJ2Ngy4wMyA8YGfT/uEDuR5LmIO
 mFBpSVfKmfkaPMDyR4GPYKexW86xemLocLQSI2M=
X-Google-Smtp-Source: ABdhPJx7BSQgQE4F6HtJZDnTuhUIhxQY0EfiByegZhfXtsPPqB/OWed28lLtaW/x8ef7ztWZ46mbWs3Tdl5vZCAZRP0=
X-Received: by 2002:a92:3556:: with SMTP id c83mr3346133ila.218.1589447900002; 
 Thu, 14 May 2020 02:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-4-git-send-email-dillon.minfei@gmail.com>
 <CACRpkda5VjjBdbruXTi33QBNb=VU6vK2zDE8yyQXoWw7=NQFeg@mail.gmail.com>
In-Reply-To: <CACRpkda5VjjBdbruXTi33QBNb=VU6vK2zDE8yyQXoWw7=NQFeg@mail.gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 14 May 2020 17:17:42 +0800
Message-ID: <CAL9mu0JZdgJ0yjULUHkXzU0CyKeMi0dcA1L7PxPiZucpuuyQ9Q@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 3/5] ARM: dts: stm32: enable ltdc
 binding with ili9341 on stm32429-disco board
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

Hi, Linus,

thanks for reviewing.

On Thu, May 14, 2020 at 4:24 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, May 12, 2020 at 9:04 AM <dillon.minfei@gmail.com> wrote:
>
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > Enable the ltdc & ili9341 on stm32429-disco board.
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
>
> This mostly looks good but...
>
> > +&spi5 {
> > +       status = "okay";
> > +       pinctrl-0 = <&spi5_pins>;
> > +       pinctrl-names = "default";
> > +       #address-cells = <1>;
> > +       #size-cells = <0>;
> > +       cs-gpios = <&gpioc 2 GPIO_ACTIVE_LOW>;
> > +       dmas = <&dma2 3 2 0x400 0x0>,
> > +              <&dma2 4 2 0x400 0x0>;
> > +       dma-names = "rx", "tx";
>
> These DMA assignments seem to be SoC things and should
> rather be in the DTS(I) file where &spi5 is defined, right?
> stm32f429.dtsi I suppose?
>
> It is likely the same no matter which device is using spi5.
>
> Yours,
> Linus Walleij

Yes, the dma assignments can be moved to stm32f429.dtsi file.
i will change it.

thanks.

best regards.

dillon,
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
