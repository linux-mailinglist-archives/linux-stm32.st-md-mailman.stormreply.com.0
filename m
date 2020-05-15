Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC70A1D4B11
	for <lists+linux-stm32@lfdr.de>; Fri, 15 May 2020 12:33:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87EA8C36B10;
	Fri, 15 May 2020 10:33:07 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E420BC36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2020 10:33:05 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id l20so1953033ilj.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2020 03:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uxCT2XVxCtoNmTqiWhqBcEudlvFd9wfrP50N1uK7vP0=;
 b=CEpylQx8/jmoucaFxOo6aDvRXqpObt3GOf3QrRyhcuqdkgrNf1lSuUtWU6UwC8nV1S
 K+DOmwilg/Su+oxqQRNpuw5BhEJzEnUgmkfMeb1QnS2dglQiL3VeTsFf360Qb+lPaXbT
 0nQQnlMc9696yhdUynH2cBEM6k1fMa3/3F3c2l8oJ27Z1IFD5oB4cjLYuvD4v7pLri3G
 0xv6Bymoqgq33uYlm9zg8EA2fYhDFv34nSO0Th6tb8BoyWAg03s5OSGrP2Dr7GVzGUfS
 4df6x/6gUqLeiPKccFIeBBtZeqnNF2UOUQ8eXik4yu/qS6URNVCNYGYQcHek958U0tWA
 pjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uxCT2XVxCtoNmTqiWhqBcEudlvFd9wfrP50N1uK7vP0=;
 b=R3cAtZPLcfFtB29bXfVDNqHbZqQQriwa11/2hYqHTVh0bnQbww4yv6glqkY40b/aIz
 SNghvUZF1TGaHpDYol3KWxdkm8Wrl2+3fMo1KbcGQ8L2SHBoxa2viG4rPMyhluUQBeaK
 y8t7tjM0vBx65OeMYsWdpsALbNXDLj4j7PYfniaOY0a0FBVn0zskRK/1tjul2ADz226I
 HpZVPVUyfNUQti1UBaFlJloH86VmMuHRR1quMGOfBJCLTXTHQGkG0Q0mQj9nGPR4hLjk
 kz11HOaoQJq7WDW7STYD2xSIS8X6fPe70B7zURlBW51rf7EuxsmrtGvKM+QWZUlNT+Up
 /yig==
X-Gm-Message-State: AOAM531Wht5T0SGYb5K6GuhWEvL4BLX/TvAUnY63pUYmCjvfZWbFU2d2
 bXl982lisSnuetzGmlqyfPs0rMqaLf/FWLLUi4U=
X-Google-Smtp-Source: ABdhPJzaWAkOj9ePr5WQ4WHJ7n0TNGqqxQVutiX22A22NsEmGBBEDDIzhAQZOVUh6ahtJoIJUaUjWwbwXnRetbDtAY0=
X-Received: by 2002:a92:a1c9:: with SMTP id b70mr2367268ill.184.1589538784758; 
 Fri, 15 May 2020 03:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-4-git-send-email-dillon.minfei@gmail.com>
 <CACRpkda5VjjBdbruXTi33QBNb=VU6vK2zDE8yyQXoWw7=NQFeg@mail.gmail.com>
 <a4ebd7cd-5756-0683-135f-0f96be8a4a7b@st.com>
 <CAL9mu0Jt_xwo5pJfcx6G3grBuOaxLXvakpEjiB4gV3=bkiq2fg@mail.gmail.com>
 <818b93b4-4431-8338-cd90-ed125ecac615@st.com>
 <CAL9mu0L6d2V5qypPfOSeMdhc=DdHkcsaF4GysNG-vfDe5npkhw@mail.gmail.com>
 <2afd2853-e3bc-0c69-a0e5-8d4aa631a634@st.com>
In-Reply-To: <2afd2853-e3bc-0c69-a0e5-8d4aa631a634@st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 15 May 2020 18:32:28 +0800
Message-ID: <CAL9mu0J7s589e7weQ7vyi1iFCwPOmmyFHwqhwWfYwWVqJpN+Dw@mail.gmail.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Dave Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
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

Hi Benjamin,

got it, thanks a lot.

best regards

Dillon

On Fri, May 15, 2020 at 5:34 PM Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:
>
>
>
> On 5/15/20 11:24 AM, dillon min wrote:
> > Hi Benjamin,
> >
> > thanks for reply.
> >
> > On Fri, May 15, 2020 at 4:31 PM Benjamin GAIGNARD
> > <benjamin.gaignard@st.com> wrote:
> >>
> >>
> >> On 5/14/20 3:07 PM, dillon min wrote:
> >>> Hi Alexandre,
> >>>
> >>> On Thu, May 14, 2020 at 8:53 PM Alexandre Torgue
> >>> <alexandre.torgue@st.com> wrote:
> >>>>
> >>>> On 5/14/20 10:24 AM, Linus Walleij wrote:
> >>>>> On Tue, May 12, 2020 at 9:04 AM <dillon.minfei@gmail.com> wrote:
> >>>>>
> >>>>>> From: dillon min <dillon.minfei@gmail.com>
> >>>>>>
> >>>>>> Enable the ltdc & ili9341 on stm32429-disco board.
> >>>>>>
> >>>>>> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> >>>>> This mostly looks good but...
> >>>>>
> >>>>>> +&spi5 {
> >>>>>> +       status = "okay";
> >>>>>> +       pinctrl-0 = <&spi5_pins>;
> >>>>>> +       pinctrl-names = "default";
> >>>>>> +       #address-cells = <1>;
> >>>>>> +       #size-cells = <0>;
> >>>>>> +       cs-gpios = <&gpioc 2 GPIO_ACTIVE_LOW>;
> >>>>>> +       dmas = <&dma2 3 2 0x400 0x0>,
> >>>>>> +              <&dma2 4 2 0x400 0x0>;
> >>>>>> +       dma-names = "rx", "tx";
> >>>>> These DMA assignments seem to be SoC things and should
> >>>>> rather be in the DTS(I) file where &spi5 is defined, right?
> >>>>> stm32f429.dtsi I suppose?
> >>>> I agree with Linus, DMA have to be defined in SoC dtsi. And if a board
> >>>> doesn't want to use it, we use the "delete-property".
> >>> Yes, will move to Soc dtsi in next submits.
> >>>
> >>> i'm working on write a v4l2-m2m driver for dma2d of stm32 to support
> >>> pixel conversion
> >>> alpha blending between foreground and background graphics.
> >>>
> >>> as you know, some soc's engineer trying to add this function to drm system.
> >>>
> >>> do you know st's planning about soc's hardware accelerator driver on stm32mp?
> >>> such as chrom-art, will add to drm subsystem via ioctl to access, or to v4l2,
> >> On stm32mp we do not plan to use chrom-art in drm or v4l2 because it
> >> does fit
> >> with userland way of working. We use the GPU to do conversion, scaling,
> >> blending
> >> and composition in only one go.
> >> As explain here [1] DRM subsytem it isn't a solution and v4l2-m2m isn't
> >> used in any
> >> mainline compositors like Weston or android surfaceflinger.
> >>
> >> Benjamin
> >>
> > After check stm32mp's datasheets, they don't have chrom-art ip inside. sorry for
> > didn't check it yet.
> >
> > for stm32h7 series with chrom-art, jpeg hardware accelerator inside.
> > does st has plan to
> > setup a driver to support it ? i prefer v4l2-m2m should be easier to
> > implement it.
> > co work with dcmi, fbdev.
> ST doesn't plan to create a driver for chrom-art because nothing in
> mainline
> userland could use it.
>
> Benjamin
> >
> > thanks.
> >
> > best regards.
> >
> > Dillon
> >> [1]
> >> https://www.phoronix.com/scan.php?page=news_item&px=Linux-DRM-No-2D-Accel-API
> >>> thanks.
> >>>
> >>>>> It is likely the same no matter which device is using spi5.
> >>>>>
> >>>>> Yours,
> >>>>> Linus Walleij
> >>>>>
> >>> _______________________________________________
> >>> Linux-stm32 mailing list
> >>> Linux-stm32@st-md-mailman.stormreply.com
> >>> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
