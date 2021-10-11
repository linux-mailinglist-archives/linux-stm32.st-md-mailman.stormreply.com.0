Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7351F428A4A
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Oct 2021 12:01:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01163C5C82E;
	Mon, 11 Oct 2021 10:01:00 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D501DC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 10:00:58 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id n7so10237397iod.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 03:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yXcvq1zADtmcg32ryQtdH4a+0FvgZKed0QthCOmoDpI=;
 b=QAQqV+bDQO33uF6/KpR9PYACxfCcadoANuvPU7QoHKA0od6J0LHRYUxhgY+Ygo5K9B
 l31yjNV3TWME2U8o3xy8xoTAj9d31NtM7T1tmVgMizsqcAFY/VOIr1LydauRgLj8qjaH
 2jMTrlzUf9EFxOq1mReHwa3+yI+/AbAaAkJGPn3dO2k4j75o59XafFv4PRZdUQRyNQXT
 jjfQjAVyw+jqueCZixlDtbYCJel+1r2Hf7/iUzO6JeDbwlFL58KOi4//2eQpFQgz8tza
 t2mGtfo0ZFVbqwVNgSWmm/Bxi2Ub9/8/5nZ2aNNWonGCoalVHlAH6pPBAftRKVo1BueJ
 voNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yXcvq1zADtmcg32ryQtdH4a+0FvgZKed0QthCOmoDpI=;
 b=8I+UcWq7JTlVILqtFju6+WwlFwkTa5W/k8mdplysE9zOGi6v04gqPb5ByTzHJSz4oS
 d6NQ2ClhqyCTr0oFNaooRPC6zAJtZa/aSht8n/OXj6X5HKFifuSnt80dymvUsw8EyI1g
 S0tHQ8k0SyWtbeehQRYULyB+D9DWBwdoXWmooSBJ+YbhTPMHMfvQJVJSplvquj7cL6Di
 SbEcNhEDj/a2mU+aAOiht3hli3q4W4qTQS4NxPKsA7hmVkWHF/lgrdNp4GZQMxpez304
 2zjfgAj4HuqPUy5iYnOVHflBNCG/M6UiOtrByT7sCGZl3nHLbBpOF9seJ/bF9XaOZ54i
 o9hA==
X-Gm-Message-State: AOAM532WP/rXYMopZqZOaS/ZQ4rzkRN8yYUM93Ev5S/fCoYd6gne9E05
 Myk92JPPG0JihdwFm18WP9vyrcmtzgtG2sOyBC0=
X-Google-Smtp-Source: ABdhPJwxaGE2iK30U5/jrs1jVvsUDLIabaQ09onY1Mk3bondvsaQahhYyWt4k5W8cnGvxl3udGcwTpQ+9J3IO1h35kE=
X-Received: by 2002:a02:7105:: with SMTP id n5mr1133311jac.64.1633946457732;
 Mon, 11 Oct 2021 03:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <1633689012-14492-1-git-send-email-dillon.minfei@gmail.com>
 <1633689012-14492-7-git-send-email-dillon.minfei@gmail.com>
 <290d78b5-b6d4-a115-9556-f2f909f573da@xs4all.nl>
In-Reply-To: <290d78b5-b6d4-a115-9556-f2f909f573da@xs4all.nl>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Mon, 11 Oct 2021 18:00:21 +0800
Message-ID: <CAL9mu0KxAmULQofQMgt2JxVLs=L-YT5HZa+mA7sSKebG88GbcA@mail.gmail.com>
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

Hi Hans

Thanks for the quick reply.

On Mon, 11 Oct 2021 at 17:40, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 08/10/2021 12:30, dillon.minfei@gmail.com wrote:
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > - add V4L2_COLORFX_SET_ARGB color effects control.
> > - add V4L2_CID_COLORFX_ARGB for ARGB color setting.
> >
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> > v3: according to Hans's suggestion, thanks.
> > - remove old stm32 private R2M ioctl
> > - add V4L2_CID_COLORFX_ARGB
> > - add V4L2_COLORFX_SET_ARGB
> >
> >  Documentation/userspace-api/media/v4l/control.rst | 8 ++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 2 ++
> >  include/uapi/linux/v4l2-controls.h                | 4 +++-
> >  3 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
> > index f8d0b923da20..319606a6288f 100644
> > --- a/Documentation/userspace-api/media/v4l/control.rst
> > +++ b/Documentation/userspace-api/media/v4l/control.rst
> > @@ -242,8 +242,16 @@ Control IDs
> >      * - ``V4L2_COLORFX_SET_CBCR``
> >        - The Cb and Cr chroma components are replaced by fixed coefficients
> >       determined by ``V4L2_CID_COLORFX_CBCR`` control.
> > +    * - ``V4L2_COLORFX_SET_ARGB``
> > +      - ARGB colors.
>
> How about:
>
>         - The ARGB components are replaced by the fixed ARGB components
>         determined by ``V4L2_CID_COLORFX_ARGB`` control.

Sure, will be addressed by v4.

>
> I also wonder if it makes sense to include the alpha channel here.
>
> Looking at the driver code it appears to me (I might be wrong) that the alpha
> channel is never touched (DMA2D_ALPHA_MODE_NO_MODIF), and setting the alpha
> channel as part of a color effects control is rather odd as well.

Indeed, Alpha channel is not used in current code. I'll remove this item in v4.
how about change the code like below:

    * - ``V4L2_COLORFX_SET_RGB``
       - The RGB components are replaced by the fixed RGB components
         determined by ``V4L2_CID_COLORFX_RGB`` control.

``V4L2_CID_COLORFX_RGB`` ``(integer)``
    Determines the Red, Green, and Blue coefficients for
    ``V4L2_COLORFX_SET_RGB`` color effect.
    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
    bits [15:8] as Green component, bits [23:16] as Red component, and
    bits [31:24] must be zero.


>
> Alpha channel manipulation really is separate from the color and - if needed - should
> be done with a separate control.

OK, Will use a separate control when adding blend features.

Best Regards,
Dillon

>
> Regards,
>
>         Hans
>
> >
> >
> > +``V4L2_CID_COLORFX_ARGB`` ``(integer)``
> > +    Determines the Alpha, Red, Green, and Blue coefficients for
> > +    ``V4L2_COLORFX_SET_ARGB`` color effect.
> > +    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
> > +    bits [15:8] as Green component, bits [23:16] as Red component, and
> > +    bits [31:24] as Alpha component.
> >
> >  ``V4L2_CID_COLORFX_CBCR`` ``(integer)``
> >      Determines the Cb and Cr coefficients for ``V4L2_COLORFX_SET_CBCR``
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 421300e13a41..53be6aadb289 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >       case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:   return "Min Number of Output Buffers";
> >       case V4L2_CID_ALPHA_COMPONENT:          return "Alpha Component";
> >       case V4L2_CID_COLORFX_CBCR:             return "Color Effects, CbCr";
> > +     case V4L2_CID_COLORFX_ARGB:             return "Color Effects, ARGB";
> >
> >       /*
> >        * Codec controls
> > @@ -1392,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >               *min = *max = *step = *def = 0;
> >               break;
> >       case V4L2_CID_BG_COLOR:
> > +     case V4L2_CID_COLORFX_ARGB:
> >               *type = V4L2_CTRL_TYPE_INTEGER;
> >               *step = 1;
> >               *min = 0;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 5532b5f68493..2876c2282a68 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -128,6 +128,7 @@ enum v4l2_colorfx {
> >       V4L2_COLORFX_SOLARIZATION               = 13,
> >       V4L2_COLORFX_ANTIQUE                    = 14,
> >       V4L2_COLORFX_SET_CBCR                   = 15,
> > +     V4L2_COLORFX_SET_ARGB                   = 16,
> >  };
> >  #define V4L2_CID_AUTOBRIGHTNESS                      (V4L2_CID_BASE+32)
> >  #define V4L2_CID_BAND_STOP_FILTER            (V4L2_CID_BASE+33)
> > @@ -145,9 +146,10 @@ enum v4l2_colorfx {
> >
> >  #define V4L2_CID_ALPHA_COMPONENT             (V4L2_CID_BASE+41)
> >  #define V4L2_CID_COLORFX_CBCR                        (V4L2_CID_BASE+42)
> > +#define V4L2_CID_COLORFX_ARGB                        (V4L2_CID_BASE+43)
> >
> >  /* last CID + 1 */
> > -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
> > +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
> >
> >  /* USER-class private control IDs */
> >
> >
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
