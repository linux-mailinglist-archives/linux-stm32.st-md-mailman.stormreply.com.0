Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D96FA3AB18C
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jun 2021 12:41:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AD93C597AE;
	Thu, 17 Jun 2021 10:41:17 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8CB8C58D5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 10:41:14 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id a6so2640811ioe.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k5h9lWFEFZiq9DqBhAFZW6ZADMIHfKPewEhboCoUBeo=;
 b=CjIntfsRB0lb653kwHywX8oaCwH0zs8tOBtV6/dZ12Oj961cifq9XFJgvD7XrX8M+M
 VO8rcRQLYMugTvc6aakzNYSPbvxFiwyT+sPElt3yIdubRyYDG7wzGmlGQdl8Ey2WzquR
 Tst426PXr4YHGK7Y7WuSs+DJKcp53ylGeRK1nV8Buo6NvmI0b0Vo6B3l4SWCeM3z7aZK
 4LmlfYONs01M7vKWrSU6bLRGDxj3qP4lw4f0WJKAbCMMDnHsHCjQyzP9cSQYnHbUNukx
 kkVpr5I3ftvMHoH8fJA1elFhZPMaXrT1jmg17+IPIoJ4mL8PaXJokTHADO8MSHfqUxRg
 kurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k5h9lWFEFZiq9DqBhAFZW6ZADMIHfKPewEhboCoUBeo=;
 b=BoSgAdXtb4BTxCWODa26nFx9UDPDJL7ShMJPbAhLW43tqmh7HUqezbhFVqtm0mQ5cJ
 fgNFHTTrLczBQRfzov+OY+BOAJn6o963H8r/pXhogUWrDd6z9s2prykGME9MRF39fDY6
 x6Ayfql0dvhdnZz2530tRu7kGx7wK+0uvcpBN9Q4ZMhpwSuAtuPVjvGvbuDrpaZq3931
 gt5uIqizVyMYJ3D0s+DhuvJZbi38A00AuGUZc3JlvI/Sq7Tyo36RlX5IBiQORrFtTm32
 g1juTgj0dOlAX68OVDdbzqnuJNPAZh5w5v4GBy4jh3pAmUdrTdvFWlT3P3Ec9/RqezE3
 J6rQ==
X-Gm-Message-State: AOAM530WDOEC1ROdFA66sTVi1XpcBrINirj9MuHbkVv06iZohB6xGOTX
 wCHmD2T+fmHP37xVu7WAWofKcxhMZ7ZNX4bZnZI=
X-Google-Smtp-Source: ABdhPJzZW0Z79Zpvy5uBSOey3RVZxO7W8bRda487KKxHuBlK5Y8u3PSSKBjE1BKY3xvz5YBo4H+uN60Cz8Q1GbjoFBU=
X-Received: by 2002:a6b:6205:: with SMTP id f5mr3248085iog.60.1623926473727;
 Thu, 17 Jun 2021 03:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
 <1621508727-24486-7-git-send-email-dillon.minfei@gmail.com>
 <d9d2a893-a159-1681-866f-e905609ce9d0@xs4all.nl>
In-Reply-To: <d9d2a893-a159-1681-866f-e905609ce9d0@xs4all.nl>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Thu, 17 Jun 2021 18:40:37 +0800
Message-ID: <CAL9mu0JcL37XtA2NEEDUJ5MWu0gSt6sh=kmVCER9AWWHRnGDYQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 6/7] media: v4l2-mem2mem: add
 v4l2_m2m_get_unmapped_area for no-mmu platform
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

Hi Hans,

On Thu, Jun 17, 2021 at 5:58 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 20/05/2021 13:05, dillon.minfei@gmail.com wrote:
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > For platforms without MMU the m2m provides a helper method
> > v4l2_m2m_get_unmapped_area(), The mmap() routines will call
> > this to get a proposed address for the mapping.
> >
> > More detailed information about get_unmapped_area can be found in
> > Documentation/nommu-mmap.txt
>
> I'm getting checkpatch.pl --strict warnings:
>
> CHECK: Alignment should match open parenthesis
> #31: FILE: drivers/media/v4l2-core/v4l2-mem2mem.c:971:
> +unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
> +               unsigned long len, unsigned long pgoff, unsigned long flags)
>
> CHECK: Alignment should match open parenthesis
> #62: FILE: include/media/v4l2-mem2mem.h:500:
> +unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
> +               unsigned long len, unsigned long pgoff, unsigned long flags);

Okay, I will add the "--strict" check to my regular patch submission.
Thanks for the reminder.

Best Regards
Dillon

>
> Regards,
>
>         Hans
>
> >
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-mem2mem.c | 20 ++++++++++++++++++++
> >  include/media/v4l2-mem2mem.h           |  4 ++++
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > index e7f4bf5bc8dd..f82a18ecab2f 100644
> > --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > @@ -966,6 +966,26 @@ int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
> >  }
> >  EXPORT_SYMBOL(v4l2_m2m_mmap);
> >
> > +#ifndef CONFIG_MMU
> > +unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
> > +             unsigned long len, unsigned long pgoff, unsigned long flags)
> > +{
> > +     struct v4l2_fh *fh = file->private_data;
> > +     unsigned long offset = pgoff << PAGE_SHIFT;
> > +     struct vb2_queue *vq;
> > +
> > +     if (offset < DST_QUEUE_OFF_BASE) {
> > +             vq = v4l2_m2m_get_src_vq(fh->m2m_ctx);
> > +     } else {
> > +             vq = v4l2_m2m_get_dst_vq(fh->m2m_ctx);
> > +             pgoff -= (DST_QUEUE_OFF_BASE >> PAGE_SHIFT);
> > +     }
> > +
> > +     return vb2_get_unmapped_area(vq, addr, len, pgoff, flags);
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_m2m_get_unmapped_area);
> > +#endif
> > +
> >  #if defined(CONFIG_MEDIA_CONTROLLER)
> >  void v4l2_m2m_unregister_media_controller(struct v4l2_m2m_dev *m2m_dev)
> >  {
> > diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> > index 5a91b548ecc0..91269227c265 100644
> > --- a/include/media/v4l2-mem2mem.h
> > +++ b/include/media/v4l2-mem2mem.h
> > @@ -495,6 +495,10 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
> >  int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
> >                 struct vm_area_struct *vma);
> >
> > +#ifndef CONFIG_MMU
> > +unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
> > +             unsigned long len, unsigned long pgoff, unsigned long flags);
> > +#endif
> >  /**
> >   * v4l2_m2m_init() - initialize per-driver m2m data
> >   *
> >
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
