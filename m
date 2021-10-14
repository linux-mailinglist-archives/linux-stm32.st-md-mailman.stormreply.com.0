Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5961C42DAFE
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Oct 2021 16:01:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F35C8C5C837;
	Thu, 14 Oct 2021 14:01:19 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E83A5C5C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 14:01:17 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id s17so3822031ioa.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gMW7UXdmvsJT5m+Unn8LuzhWNMWKfB1LZgpARZu3h64=;
 b=SMa678vtRRct+9n4DfGBLqZbAGScVM2pO7kFcUbYoWYWLOdtHvFOApF+QasmcIS2Tv
 CnI5eTtKuh/YitnWZuy2znpW3L0iEW4gMf6tZSprPWTp89c+yVavbOy5Jflg9r/QIryH
 n7MUf89CrFHtn6vAn3k8vUMP9ai+o4KiK3jbhVL1OOuETLycRiN+FzYDN0MQyiF4Q7Mj
 SYupSuR5H7jBsKb2grUm7L3tt6VXVSiiBCqAdDVyzj+cCya9uTVJG3rSVOAdp/Ye8WE0
 USkqWmuvqTT+4W6t4bEukf2Yi7MySr0G5i53x1vrtVSCFhBfFo/aMdNN1ZGEPg5LSG7s
 Tclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gMW7UXdmvsJT5m+Unn8LuzhWNMWKfB1LZgpARZu3h64=;
 b=7bFTXOTFsLq0xfYI7BOqUWoIiXte5iIBHs3ZJFhus017pyJJCgrcKTLLufk3oCl/mI
 NmV2c3xe0wfAF+Q3oEO4I1W5zPr3x+Y80owotXpwoP3NdN7ZeCMDeyso3wTDMdHC9D7S
 kDNOE1qUCOYA7D0QQSA/5Wuqq3RI8L4LkaTavEGcjVbhPJTX3w6YJCMUkg4TlqyQ/nfw
 hv991yVnQ2LkEb62EcN9rVu1vE1AkeTOq3yjTv+88NGn7HJovkYMOaZ8P9pLbP/2BFjA
 S1n4qT3R3MA76UoK60Aqh9R2ns4lrC+6EVYOGqEvL50hPyGSKbyrAZEOCXB9SWPl0nQf
 1ZIQ==
X-Gm-Message-State: AOAM531gU/z0c7gxzwDkDAwt0meucd7Ioj+zOsCUUi1g5YVpT0d1MPOU
 J+OWUyXy/rVhAvmU2E+Ke8BdOQYFDCpe98rx53M=
X-Google-Smtp-Source: ABdhPJxjnX9wflAJg2fDLZI9CUfRZD8jZ7JeIn2UpSBHSxq/DFwxGjB0oXM6rkNnZq+ZpvHc5d0hy1AMI3cbbD99wRg=
X-Received: by 2002:a05:6602:3cb:: with SMTP id
 g11mr2525849iov.204.1634220076780; 
 Thu, 14 Oct 2021 07:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
 <1634207106-7632-7-git-send-email-dillon.minfei@gmail.com>
 <2b0739f1-85e4-6b19-ff30-2587f0c622c2@xs4all.nl>
 <CAL9mu0LqkCpjYft4z6V4T97Mq46dCTXZ=BvfQa+DijjRd4pDkA@mail.gmail.com>
 <1d0e5b17-dd2c-d3d3-c514-775806ae99c9@xs4all.nl>
In-Reply-To: <1d0e5b17-dd2c-d3d3-c514-775806ae99c9@xs4all.nl>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Thu, 14 Oct 2021 22:00:54 +0800
Message-ID: <CAL9mu0KLckxypYMc=mWRrXYOiwLeo98rNBWLwzA2gK9JJEHf1Q@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v4 6/8] media: v4l2-ctrls: Add RGB color
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

On Thu, 14 Oct 2021 at 19:22, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 14/10/2021 12:53, Dillon Min wrote:
> > Hi Hans
> >
> > Thanks for quick reply
> >
> > On Thu, 14 Oct 2021 at 18:44, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> On 14/10/2021 12:25, dillon.minfei@gmail.com wrote:
> >>> From: Dillon Min <dillon.minfei@gmail.com>
> >>>
> >>> Add V4L2_COLORFX_SET_RGB color effects control, V4L2_CID_COLORFX_RGB
> >>> for RGB color setting.
> >>>
> >>> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> >>> ---
> >>> v4:
> >>> - replace V4L2_COLORFX_SET_ARGB, V4L2_CID_COLORFX_ARGB to
> >>>   V4L2_COLORFX_SET_RGB, V4L2_CID_COLORFX_RGB since Alpha paramter not used
> >>>   in current. thanks Hans.
> >>>
> >>>  Documentation/userspace-api/media/v4l/control.rst | 9 +++++++++
> >>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c         | 2 ++
> >>>  include/uapi/linux/v4l2-controls.h                | 4 +++-
> >>>  3 files changed, 14 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
> >>> index f8d0b923da20..3eec65174260 100644
> >>> --- a/Documentation/userspace-api/media/v4l/control.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/control.rst
> >>> @@ -242,8 +242,17 @@ Control IDs
> >>>      * - ``V4L2_COLORFX_SET_CBCR``
> >>>        - The Cb and Cr chroma components are replaced by fixed coefficients
> >>>       determined by ``V4L2_CID_COLORFX_CBCR`` control.
> >>> +    * - ``V4L2_COLORFX_SET_RGB``
> >>> +      - The RGB components are replaced by the fixed RGB components determined
> >>> +        by ``V4L2_CID_COLORFX_RGB`` control.
> >>>
> >>>
> >>> +``V4L2_CID_COLORFX_RGB`` ``(integer)``
> >>> +    Determines the Red, Green, and Blue coefficients for
> >>> +    ``V4L2_COLORFX_SET_RGB`` color effect.
> >>> +    Bits [7:0] of the supplied 32 bit value are interpreted as Blue component,
> >>> +    bits [15:8] as Green component, bits [23:16] as Red component, and
> >>> +    bits [31:24] must be zero.
> >>>
> >>>  ``V4L2_CID_COLORFX_CBCR`` ``(integer)``
> >>>      Determines the Cb and Cr coefficients for ``V4L2_COLORFX_SET_CBCR``
> >>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> index 421300e13a41..f4bd90170105 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> >>> @@ -785,6 +785,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >>>       case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:   return "Min Number of Output Buffers";
> >>>       case V4L2_CID_ALPHA_COMPONENT:          return "Alpha Component";
> >>>       case V4L2_CID_COLORFX_CBCR:             return "Color Effects, CbCr";
> >>> +     case V4L2_CID_COLORFX_RGB:              return "Color Effects, RGB";
> >>>
> >>>       /*
> >>>        * Codec controls
> >>> @@ -1392,6 +1393,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >>>               *min = *max = *step = *def = 0;
> >>>               break;
> >>>       case V4L2_CID_BG_COLOR:
> >>> +     case V4L2_CID_COLORFX_RGB:
> >>>               *type = V4L2_CTRL_TYPE_INTEGER;
> >>>               *step = 1;
> >>>               *min = 0;
> >>
> >> Can you make another small change here? Please change:
> >>
> >>         *max = 0xFFFFFF;
> >>
> >> to:
> >>
> >>         *max = 0xffffff;
> >>
> >> to keep in line with the coding standard for hex values.
> >
> > Sure, do it right now.
> >
> >>
> >> Also, can you add a separate patch that adds an entry here for V4L2_CID_COLORFX_CBCR
> >> that sets *max to 0xffff? I noticed that that was missing. While adding V4L2_CID_COLORFX_RGB
> >> it's good to fix V4L2_CID_COLORFX_CBCR as well.
> >
> > Sure, you mean the final code like this? first patch to fix cbcr 0xFFFFFF,
>
> For cbcr max should be 0xffff.

Sure.

>
> > another one to add V4L2_CID_COLORFX_RGB entry.
> >
> > 1395         case V4L2_CID_BG_COLOR:
> > 1396         case V4L2_CID_COLORFX_RGB:
> > 1397                 *type = V4L2_CTRL_TYPE_INTEGER;
> > 1398                 *step = 1;
> > 1399                 *min = 0;
> > 1400                 /* Max is calculated as RGB888 that is 2^24 */
>
> Actually, the comment is wrong: it should be 2^24-1. Let's fix that too.

Okay.

>
> > 1401                 *max = 0xffffff;
>
> Yes, that's what I am looking for.
>
> Regards,
>
>         Hans
>
> > 1402                 break;
> >
> > Best Regards
> > Dillon
> >
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> >>> index 5532b5f68493..9aa3fd368383 100644
> >>> --- a/include/uapi/linux/v4l2-controls.h
> >>> +++ b/include/uapi/linux/v4l2-controls.h
> >>> @@ -128,6 +128,7 @@ enum v4l2_colorfx {
> >>>       V4L2_COLORFX_SOLARIZATION               = 13,
> >>>       V4L2_COLORFX_ANTIQUE                    = 14,
> >>>       V4L2_COLORFX_SET_CBCR                   = 15,
> >>> +     V4L2_COLORFX_SET_RGB                    = 16,
> >>>  };
> >>>  #define V4L2_CID_AUTOBRIGHTNESS                      (V4L2_CID_BASE+32)
> >>>  #define V4L2_CID_BAND_STOP_FILTER            (V4L2_CID_BASE+33)
> >>> @@ -145,9 +146,10 @@ enum v4l2_colorfx {
> >>>
> >>>  #define V4L2_CID_ALPHA_COMPONENT             (V4L2_CID_BASE+41)
> >>>  #define V4L2_CID_COLORFX_CBCR                        (V4L2_CID_BASE+42)
> >>> +#define V4L2_CID_COLORFX_RGB                 (V4L2_CID_BASE+43)
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

Best Regards.
Dillon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
