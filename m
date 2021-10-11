Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D13428C90
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Oct 2021 14:06:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93F85C5C82E;
	Mon, 11 Oct 2021 12:06:51 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63EA7C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 12:06:48 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id i189so11773052ioa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 05:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dvdG6HlDmxXl9QNwcywivYC+PXm6/ITcCVPBJxzG4NY=;
 b=C1qWsjLw5l4MNV2aAjNVBfIS0Ba83JnhaE5w4yLp23z9eyqZcY7rCQUlPqisUVyy61
 TMR4OYOYxcKtyP4116tuDpZBxy8KS6/jU3LQ/mifoV4Ku6/1LBL1c61SsoU6El1THs1T
 HuxSdtePsl06pPukRu7yEn1suDC/Pay8UyDRmMtLbf+Fc+IktFu4R8ZBabk9RCgNjKbJ
 eLohIYPRD5N4g+zvuH0kTsrDamfeZlWI/gSWVxG30BmXaDB0T72z94uL2aKUvNaLl6ew
 wt06vHeiZM1mPC2O48ACgXGiiw2oJ4sAzPUO9/iFB4dOeUyKOar1/qFxwX2eSQBf8ga7
 kKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dvdG6HlDmxXl9QNwcywivYC+PXm6/ITcCVPBJxzG4NY=;
 b=Oo2Sa/DinmHJjx4N+8C6CyEgQVwKRVg9hwYGKHtVeEpYNa9A/DLIb3gRS5CXiOK+44
 BjTC9cvP5yLMmm3QCN7IBwsna+m9hBVaeheJCNYBLfLJ6wJUeRETXXzMS0T43i7+THjx
 /C4dhDEZNT+F5vSN+4EhPQricCXMKwhrU6Ux5d62LPeDIfxMPCqvE9/vQC+QI/ywTskN
 DBUfSlQKdzcryma21lv3oAsrveHW9X6n99olaujZNBGVlMVfV1beDwVT1hIoZLT3uw9k
 TFUXIvWw9y5/waWYlf3xUWTnILM4W8COmRpez03hN7/fntZ6PHYiDVOV9KOWcMt32jwB
 Uh8w==
X-Gm-Message-State: AOAM533D2jRrN1ndnqTX2FzZjGLOc1zHQN4+PoIA/TIrY+DJaghPmlK2
 goL6EbceeRoGswCzvo/alty0wR53zp74XxC6MFY=
X-Google-Smtp-Source: ABdhPJxle/Xfeq3Sdhdl2xj1q6S4qQCVGRu1IYV9HGZIZOmwpayBPeL+fM6GCwe1jE9UBeOgci4CTt5bzx3wirfDGkU=
X-Received: by 2002:a05:6638:24c4:: with SMTP id
 y4mr18408723jat.31.1633954006985; 
 Mon, 11 Oct 2021 05:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
 <1633689012-14492-7-git-send-email-dillon.minfei@gmail.com>
 <290d78b5-b6d4-a115-9556-f2f909f573da@xs4all.nl>
 <CAL9mu0KxAmULQofQMgt2JxVLs=L-YT5HZa+mA7sSKebG88GbcA@mail.gmail.com>
 <8331ab8a-39b7-588c-146d-77197d7637a8@xs4all.nl>
In-Reply-To: <8331ab8a-39b7-588c-146d-77197d7637a8@xs4all.nl>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Mon, 11 Oct 2021 20:06:10 +0800
Message-ID: <CAL9mu0J7GmojuRbvqpCg6X=nkXiMgb9NLMmt3RxLO8wfhMUL-g@mail.gmail.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, gnurou@gmail.com,
 linux-clk <linux-clk@vger.kernel.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mchehab+huawei@kernel.org,
 hugues.fruchet@foss.st.com, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, gabriel.fernandez@foss.st.com,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, ezequiel@collabora.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 6/8] media: v4l2-ctrls: Add ARGB color
	effects control
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

On Mon, 11 Oct 2021 at 18:04, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 11/10/2021 12:00, Dillon Min wrote:
> > Hi Hans
> >
> > Thanks for the quick reply.
> >
> > On Mon, 11 Oct 2021 at 17:40, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> On 08/10/2021 12:30, dillon.minfei@gmail.com wrote:
> >>> From: Dillon Min <dillon.minfei@gmail.com>
> >>>
> >>> - add V4L2_COLORFX_SET_ARGB color effects control.
> >>> - add V4L2_CID_COLORFX_ARGB for ARGB color setting.
> >>>
> >>> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> >>> ---
> >>> v3: according to Hans's suggestion, thanks.
> >>> - remove old stm32 private R2M ioctl
> >>> - add V4L2_CID_COLORFX_ARGB
> >>> - add V4L2_COLORFX_SET_ARGB
> >>>
> >>>  Documentation/userspace-api/media/v4l/control.rst | 8 ++++++++
> >>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 2 ++
> >>>  include/uapi/linux/v4l2-controls.h                | 4 +++-
> >>>  3 files changed, 13 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
> >>> index f8d0b923da20..319606a6288f 100644
> >>> --- a/Documentation/userspace-api/media/v4l/control.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/control.rst
> >>> @@ -242,8 +242,16 @@ Control IDs
> >>>      * - ``V4L2_COLORFX_SET_CBCR``
> >>>        - The Cb and Cr chroma components are replaced by fixed coefficients
> >>>       determined by ``V4L2_CID_COLORFX_CBCR`` control.
> >>> +    * - ``V4L2_COLORFX_SET_ARGB``
> >>> +      - ARGB colors.
> >>
> >> How about:
> >>
> >>         - The ARGB components are replaced by the fixed ARGB components
> >>         determined by ``V4L2_CID_COLORFX_ARGB`` control.
> >
> > Sure, will be addressed by v4.
> >
> >>
> >> I also wonder if it makes sense to include the alpha channel here.
> >>
> >> Looking at the driver code it appears to me (I might be wrong) that the alpha
> >> channel is never touched (DMA2D_ALPHA_MODE_NO_MODIF), and setting the alpha
> >> channel as part of a color effects control is rather odd as well.
> >
> > Indeed, Alpha channel is not used in current code. I'll remove this item in v4.
> > how about change the code like below:
> >
> >     * - ``V4L2_COLORFX_SET_RGB``
> >        - The RGB components are replaced by the fixed RGB components
> >          determined by ``V4L2_CID_COLORFX_RGB`` control.
> >
> > ``V4L2_CID_COLORFX_RGB`` ``(integer)``
> >     Determines the Red, Green, and Blue coefficients for
> >     ``V4L2_COLORFX_SET_RGB`` color effect.
> >     Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
> >     bits [15:8] as Green component, bits [23:16] as Red component, and
> >     bits [31:24] must be zero.
>
> Yes, that looks OK to me.

Ok, after getting your review feedback about the dma2d driver code.
I will submit the v4 version. thanks.

Best Regards.
Dillon

>
> Regards,
>
>         Hans
>
> >
> >
> >>
> >> Alpha channel manipulation really is separate from the color and - if needed - should
> >> be done with a separate control.
> >
> > OK, Will use a separate control when adding blend features.
> >
> > Best Regards,
> > Dillon
> >
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>>
> >>> +``V4L2_CID_COLORFX_ARGB`` ``(integer)``
> >>> +    Determines the Alpha, Red, Green, and Blue coefficients for
> >>> +    ``V4L2_COLORFX_SET_ARGB`` color effect.
> >>> +    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
> >>> +    bits [15:8] as Green component, bits [23:16] as Red component, and
> >>> +    bits [31:24] as Alpha component.
> >>>
> >>>  ``V4L2_CID_COLORFX_CBCR`` ``(integer)``
> >>>      Determines the Cb and Cr coefficients for ``V4L2_COLORFX_SET_CBCR``
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> index 421300e13a41..53be6aadb289 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> @@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >>>       case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:   return "Min Number of Output Buffers";
> >>>       case V4L2_CID_ALPHA_COMPONENT:          return "Alpha Component";
> >>>       case V4L2_CID_COLORFX_CBCR:             return "Color Effects, CbCr";
> >>> +     case V4L2_CID_COLORFX_ARGB:             return "Color Effects, ARGB";
> >>>
> >>>       /*
> >>>        * Codec controls
> >>> @@ -1392,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >>>               *min = *max = *step = *def = 0;
> >>>               break;
> >>>       case V4L2_CID_BG_COLOR:
> >>> +     case V4L2_CID_COLORFX_ARGB:
> >>>               *type = V4L2_CTRL_TYPE_INTEGER;
> >>>               *step = 1;
> >>>               *min = 0;
> >>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> >>> index 5532b5f68493..2876c2282a68 100644
> >>> --- a/include/uapi/linux/v4l2-controls.h
> >>> +++ b/include/uapi/linux/v4l2-controls.h
> >>> @@ -128,6 +128,7 @@ enum v4l2_colorfx {
> >>>       V4L2_COLORFX_SOLARIZATION               = 13,
> >>>       V4L2_COLORFX_ANTIQUE                    = 14,
> >>>       V4L2_COLORFX_SET_CBCR                   = 15,
> >>> +     V4L2_COLORFX_SET_ARGB                   = 16,
> >>>  };
> >>>  #define V4L2_CID_AUTOBRIGHTNESS                      (V4L2_CID_BASE+32)
> >>>  #define V4L2_CID_BAND_STOP_FILTER            (V4L2_CID_BASE+33)
> >>> @@ -145,9 +146,10 @@ enum v4l2_colorfx {
> >>>
> >>>  #define V4L2_CID_ALPHA_COMPONENT             (V4L2_CID_BASE+41)
> >>>  #define V4L2_CID_COLORFX_CBCR                        (V4L2_CID_BASE+42)
> >>> +#define V4L2_CID_COLORFX_ARGB                        (V4L2_CID_BASE+43)
> >>>
> >>>  /* last CID + 1 */
> >>> -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
> >>> +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
> >>>
> >>>  /* USER-class private control IDs */
> >>>
> >>>
> >>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
