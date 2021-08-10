Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B943E55F8
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Aug 2021 10:52:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C06BEC5A4CD;
	Tue, 10 Aug 2021 08:52:42 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F38DDC424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Aug 2021 08:52:39 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id f8so14532436ilr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Aug 2021 01:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lWXJ4+PjF5glFDtXwt/vNE0iEHr+A6wHia7xM2/xz1w=;
 b=RSyf2G/TrYO742mmP79dNqVaAkt/Z+/FFY9knRlUQFKTfXEdKiP8qGt3UtV5nsPHRE
 CSLS8yC66Zp3D4ytzq51fAvkfkpTZdP2S4g2LCMq3JdiTk4J7o1FhADvTVKWP6PyplsF
 c74q+eJlFX8tMRziWa378uLAp9LZ1TnbAdsmCdnqAwEVjHEOjBQoZ2DIpfLwvUkZiaCj
 JpmtGDqEQiAPf3moCXNAza1rYWlHOI5IMHC9EGFmYzeTVjpRtZWPS7C4yK86yulJwxZS
 16/rnaR45WFBzrwyapORQ18rvwhqgHCTLZheMYf1jL4FokxZhjtOeWzs4m0cIRi0xfFi
 3k2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lWXJ4+PjF5glFDtXwt/vNE0iEHr+A6wHia7xM2/xz1w=;
 b=GpRWvDZbasnmBhgWbfNB5dzJgfv82cFzunnO67we2qKbsxwGM31MQyZyBe07RqTStl
 7EKaGuqmwrd5NzWOMCz9yygWGdXjSXuBBaJFkPw7dW9hXx54540+tSV/sQw1mMx/FkLl
 zK7tj+U/mNV3q8R9G6seCEJ2Xxu4JCM13uJrDiglv9ka6zs4eDkkq4/MT71ZmzMOCSk3
 vUuVP5gzx0t1VXJ3EdAw/9HTI9RwzTNWLt9HGh0RPg0jFesTCcVw5OF0ooyoAPEb3ElZ
 lTUtQZna4EVSncZcGq33maCzWwZrLbvg9cuCeuB9P38MJx9APJyTb2S4wdnREH/eRnHB
 L6Bg==
X-Gm-Message-State: AOAM532aNqVCyZiv0zwUBZ5o96iaLRd0scktjYMvVQzHoeDvATaCnX/j
 KAOoEB2kqtCOQsnMNDceQOKuT83eZJD0m0tFFOA=
X-Google-Smtp-Source: ABdhPJwzzeoVZ8XWeqwnCkOYfBWOdVOBvKw/YO8LbIhn6Mjk+DGdz9I9hHDwolLR9vxDRuFHs7u09g1OxGrGsMKRwmA=
X-Received: by 2002:a05:6e02:13b3:: with SMTP id
 h19mr49185ilo.218.1628585558984; 
 Tue, 10 Aug 2021 01:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
 <1626341068-20253-18-git-send-email-dillon.minfei@gmail.com>
 <7131ee03-fc81-cb9b-665f-80e4ce8435ab@xs4all.nl>
In-Reply-To: <7131ee03-fc81-cb9b-665f-80e4ce8435ab@xs4all.nl>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Tue, 10 Aug 2021 16:52:04 +0800
Message-ID: <CAL9mu0+QF==63hzkLo1x=dVeXdnu7wyugmfQCRLsTE+=AJZWxw@mail.gmail.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: gnurou@gmail.com, linux-clk <linux-clk@vger.kernel.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mchehab+huawei@kernel.org,
 hugues.fruchet@foss.st.com, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, ezequiel@collabora.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 7/9] media: docs: add doc for the stm32
	dma2d driver
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

Hi Hans

Thanks for the detailed review.

On Mon, 9 Aug 2021 at 17:16, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 15/07/2021 11:24, dillon.minfei@gmail.com wrote:
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > add stm32-uapi.rst for stm32's dma2d driver, explain the details of ioctl
> > V4L2_CID_DMA2D_R2M_MODE, V4L2_CID_DMA2D_R2M_COLOR.
> >
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> > v2: introduce the stm32-uapi.rst to explain the detail of dma2d's ioctl.
> >
> >  .../userspace-api/media/drivers/index.rst          |  1 +
> >  .../userspace-api/media/drivers/stm32-uapi.rst     | 22 ++++++++++++++++++++++
> >  2 files changed, 23 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/drivers/stm32-uapi.rst
> >
> > diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> > index 12e3c512d718..ce42915d48f4 100644
> > --- a/Documentation/userspace-api/media/drivers/index.rst
> > +++ b/Documentation/userspace-api/media/drivers/index.rst
> > @@ -38,4 +38,5 @@ For more details see the file COPYING in the source distribution of Linux.
> >       max2175
> >       meye-uapi
> >       omap3isp-uapi
> > +     stm32-uapi
> >       uvcvideo
> > diff --git a/Documentation/userspace-api/media/drivers/stm32-uapi.rst b/Documentation/userspace-api/media/drivers/stm32-uapi.rst
> > new file mode 100644
> > index 000000000000..d7a4f717387d
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/drivers/stm32-uapi.rst
> > @@ -0,0 +1,22 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +STM32 Chrom-Art 2D Graphics Accelerator unit (DMA2D) driver
> > +================================================
> > +
> > +The DMA2D driver implements the following driver-specific controls:
> > +
> > +``V4L2_CID_DMA2D_R2M_MODE``
>
> Please mention the control type as well.

OK, how about change to
``V4L2_CID_DMA2D_R2M_MODE (boolean)``

>
> > +-------------------------
> > +    Enable/Disable the Register-To-Memory mode, filling a part or the
> > +    whole of a destination image with a specific color.
> > +
> > +    1 for enable, 0 for disable.
> > +
> > +``V4L2_CID_DMA2D_R2M_COLOR``
>
> Ditto.

I will remove this item in v3, turn to use your suggestion (add
V4L2_COLORFX_SET_COLOR_ARGB to V4L2_CID_COLORFX)

>
> > +-------------------------------
> > +    Set the color to fill a part or the whole of a destination image.
> > +    only used under Register-To-Memory mode, to set the DMA2D_OCOLR register
> > +    (RED, GREEN, BLUE) which is:
>
> Here you mention RGB only,
>
> > +
> > +    31 .. 24    23 .. 16  15 .. 8     7 .. 0
> > +    ALPHA[7:0]  RED[7:0]  GREEN[7:0]  BLUE[7:0]
>
> but here you also mention Alpha. So which is it?

Anyway this will be removed in v3, give a short explanation about it,
The DMA2D_OCOLR register contains alpha value for m2m-pfc-blend mode,
which defines the alpha channel of the output color. it's not used for R2M.

sorry for confusion.

>
> See also my review of patch 9/9.
>
> >
>
> I'm getting some warnings building this doc:
>
> Documentation/media/userspace-api/drivers/stm32-uapi.rst:4: WARNING: Title underline too short.
>
> STM32 Chrom-Art 2D Graphics Accelerator unit (DMA2D) driver
> ================================================
> Documentation/media/userspace-api/drivers/stm32-uapi.rst:9: WARNING: Title underline too short.
>
> ``V4L2_CID_DMA2D_R2M_MODE``
> -------------------------

OK, will be fixed in v3.

>
> Regards,
>
>         Hans


Thanks and Best Regards
Dillon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
