Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A92051D30AA
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 15:08:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AE89C36B12;
	Thu, 14 May 2020 13:08:19 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 923CEC36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 13:08:17 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id f4so530442iov.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 06:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TxjLQAmlgCmIbW66ttakmR+UHsu55ZGYYjiNgQ7pD60=;
 b=HQy57GttiwVxh24sQLfeiQngcOiErLC6lrc6A6arkVum1pGd0PXCrQaHvOCK4hPNEV
 b/059ZwlWVA1AS8FK1q2/gCJIeug5/mReyn6myQQGKj7Nqz7CVRv86DNFSRbqqL9jNJu
 tITMdAKorHxeF7YvlIBXB8sc7+tzC2Jw9Tf81bsZ6FJbcXdDfUt6nlqKXBjb5tQmn5MB
 gsR5CUzH/zKAUZsVkX976vv3QKAm1v8PnXFZ2eAaurKTEVbK4xwSxyYq0RD28bfWf5Cm
 c7yPr6SgCzeFtV1ZHtYdDrrDUR4DC+KkcElHzh4hDhUaeG4VHhyQV+JNQPmJwrKZiy5d
 Dj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TxjLQAmlgCmIbW66ttakmR+UHsu55ZGYYjiNgQ7pD60=;
 b=V/lw9MukixrPYDQVrukd9r/0Z+aInU+IfPjxU9usd2xvQZi0DqvqdUrhpcNToiIIFk
 z5VquNVozy0GJFqVfOqU5/wrZ4GX5pboVF0G3eg7f1vyO+yA6HRvScg6jP57swq1v8DA
 F59jXYQoAkj2t4SZ2RnoMo59oc1+veuqc42khCNMnIro6ayETgBvWiMoWr/LD57kM6HR
 +6Ue37RJ97UOj7nVbr8u2b4iM9fR+rcPu1jKKFuFZMQ8j9WYSCC8JcufvWH7Hwi7rwev
 POwWSEEdIqrcEu7nQYSbHhewen6u+Q0v8DbTdrfPYdw7kkffb+y/IviT16qQRZHM2250
 C24A==
X-Gm-Message-State: AOAM531ZnB0BWlMpD6Yvyi8LWHo9qzaIo3uU7KKV27GGIDJ0d6A9rTCD
 CuHkYCg7YeHh3Uf6T1vjEaDt74+0ZgQyx4vSb7w=
X-Google-Smtp-Source: ABdhPJxFXm/snfV7f+PaeEk0/JpSTrHSkPZMuSqd6hBKK/zxQapVp8rf2U8UIu+qvc9Q33J56Hi8hFlnpuvp0XR2Wlk=
X-Received: by 2002:a5d:8b8e:: with SMTP id p14mr3979084iol.110.1589461696306; 
 Thu, 14 May 2020 06:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-4-git-send-email-dillon.minfei@gmail.com>
 <CACRpkda5VjjBdbruXTi33QBNb=VU6vK2zDE8yyQXoWw7=NQFeg@mail.gmail.com>
 <a4ebd7cd-5756-0683-135f-0f96be8a4a7b@st.com>
In-Reply-To: <a4ebd7cd-5756-0683-135f-0f96be8a4a7b@st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 14 May 2020 21:07:40 +0800
Message-ID: <CAL9mu0Jt_xwo5pJfcx6G3grBuOaxLXvakpEjiB4gV3=bkiq2fg@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Turquette <mturquette@baylibre.com>,
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

Hi Alexandre,

On Thu, May 14, 2020 at 8:53 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
>
>
>
> On 5/14/20 10:24 AM, Linus Walleij wrote:
> > On Tue, May 12, 2020 at 9:04 AM <dillon.minfei@gmail.com> wrote:
> >
> >> From: dillon min <dillon.minfei@gmail.com>
> >>
> >> Enable the ltdc & ili9341 on stm32429-disco board.
> >>
> >> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> >
> > This mostly looks good but...
> >
> >> +&spi5 {
> >> +       status = "okay";
> >> +       pinctrl-0 = <&spi5_pins>;
> >> +       pinctrl-names = "default";
> >> +       #address-cells = <1>;
> >> +       #size-cells = <0>;
> >> +       cs-gpios = <&gpioc 2 GPIO_ACTIVE_LOW>;
> >> +       dmas = <&dma2 3 2 0x400 0x0>,
> >> +              <&dma2 4 2 0x400 0x0>;
> >> +       dma-names = "rx", "tx";
> >
> > These DMA assignments seem to be SoC things and should
> > rather be in the DTS(I) file where &spi5 is defined, right?
> > stm32f429.dtsi I suppose?
>
> I agree with Linus, DMA have to be defined in SoC dtsi. And if a board
> doesn't want to use it, we use the "delete-property".
Yes, will move to Soc dtsi in next submits.

i'm working on write a v4l2-m2m driver for dma2d of stm32 to support
pixel conversion
alpha blending between foreground and background graphics.

as you know, some soc's engineer trying to add this function to drm system.

do you know st's planning about soc's hardware accelerator driver on stm32mp?
such as chrom-art, will add to drm subsystem via ioctl to access, or to v4l2,

thanks.

>
> >
> > It is likely the same no matter which device is using spi5.
> >
> > Yours,
> > Linus Walleij
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
