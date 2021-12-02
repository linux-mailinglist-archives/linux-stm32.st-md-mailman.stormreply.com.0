Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D5F4668BF
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Dec 2021 18:00:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54383C5F1DC;
	Thu,  2 Dec 2021 17:00:19 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C6BFC5F1DA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Dec 2021 17:00:18 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id x5so195808pfr.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Dec 2021 09:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NJpF2n0u3f+V7LbnqKcCz27brPpeZJOecaGwU3axpi0=;
 b=CiMe61IIzyOL1BdLkQAxHVUenkc57I8TLB0f1Bw9VwRKN3NPdIv/6r4TknCta3x1lI
 i+9oJjkhEOYH9hjYG+ZnlIfdBUh5d+QSjZ9qBO6/lJg+Q3FcEFUwe5pu+R8L9w7HICuD
 AqEQXCbmxpq191HswrrCvq3MvTLqtOv0adbZBd9L+Rr5cWynWnOyNe1hCx4skCUqNd/u
 uhHFW17VS7Wix2xuQBWPV2WqpV3cWEdxbypaZXAqMOUWLAvlwsBarUABz9y3fq9maIZG
 pAv0I308HwItzYIgzVsNCyL5piFKlE6P/tUGVAozP3zXXsu22OSkoNabHrqXG+/j3f2e
 08Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NJpF2n0u3f+V7LbnqKcCz27brPpeZJOecaGwU3axpi0=;
 b=LJmAdIMw3myzwy38pcsVv06CIEBLQ1GaDstZBouH6AvTvQTVp977KrNY0Ra9EFbruh
 MDNh+p5Ie+nw5t3LThNNppBgRZCIraEgKv2nj374xcVsPKyTE6Jy20BTTHiKH2x1N6VB
 yx6L7cv5kj75+2ty/7l9izIGQcvrZXyT6Trz0TXahykYJ/hKkmHXR+oIJSHVSips/oqj
 7+HAAHL9lIzBizMhdnhJ+mincr1RblEHe9NmKWCxuK6SQCp9xCfrZJnjwzSU4yTinL2f
 ZMEYWN/GCs4pZNyQiSRp5MdTKZZbtOT0bzeiuBpiEVi5UywZk6beD/3nnbBDK/OMxTRX
 EOiw==
X-Gm-Message-State: AOAM5319tLm8XwcrbvNm1DO5t22CCI2QPC0TMbc4Yx+4It6l0DURV6Uy
 kH+nWew9CaQHNLJmg5bPVQX5tw==
X-Google-Smtp-Source: ABdhPJykaF4uJUYc6GupHBk20usta49lUngRp9G2RsDCMbhgeVs6B+tYMdejk7ROtLxS7brmW4lP0w==
X-Received: by 2002:a63:534d:: with SMTP id t13mr284539pgl.604.1638464416221; 
 Thu, 02 Dec 2021 09:00:16 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id 66sm180331pgg.63.2021.12.02.09.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 09:00:14 -0800 (PST)
Date: Thu, 2 Dec 2021 10:00:11 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Jason Wang <jasowang@redhat.com>
Message-ID: <20211202170011.GA900071@p14s>
References: <20211124162045.25983-1-arnaud.pouliquen@foss.st.com>
 <20211124161055-mutt-send-email-mst@kernel.org>
 <CACGkMEvQoUcPFgOTvEDGkZHMXhjhPrk0xq-Zq3+G20_Lp-hu8A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACGkMEvQoUcPFgOTvEDGkZHMXhjhPrk0xq-Zq3+G20_Lp-hu8A@mail.gmail.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] rpmsg: virtio: don't let virtio core
 to validate used length
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

Hey guys,

On Thu, Nov 25, 2021 at 10:15:44AM +0800, Jason Wang wrote:
> On Thu, Nov 25, 2021 at 5:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Nov 24, 2021 at 05:20:45PM +0100, Arnaud Pouliquen wrote:
> > > Using OpenAMP library on remote side, when the rpmsg framework tries to
> > > reuse the buffer the following error message is displayed in
> > > the virtqueue_get_buf_ctx_split function:
> > > "virtio_rpmsg_bus virtio0: output:used len 28 is larger than in buflen 0"
> > >
> > > As described in virtio specification:
> > > "many drivers ignored the len value, as a result, many devices set len
> > > incorrectly. Thus, when using the legacy interface, it is generally
> > > a good idea to ignore the len value in used ring entries if possible."
> > >
> > > To stay in compliance with the legacy libraries, this patch prevents the
> > > virtio core from validating used length.
> > >
> > > Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
> > >
> > > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > > Cc: Jason Wang <jasowang@redhat.com>
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> >
> > Arnaud, thanks a lot for the analysis.
> >
> > Jason, I think this is another good point. We really should not
> > validate input for legacy devices at all.
> 
> I agree. Will do that in the next version.

I'm a little unclear about the "next version" in the above comment - is this
something I should wait for?  Should I move forward with Arnaud's patch?

Thanks,
Mathieu

> 
> Thanks
> 
> >
> >
> > > Update vs v1[1]: update commit message to clarify the context.
> > >
> > > base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> > >
> > > [1]https://lore.kernel.org/lkml/20211122160812.25125-1-arnaud.pouliquen@foss.st.com/T/
> > > ---
> > >  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > index 9c112aa65040..5f73f19c2c38 100644
> > > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
> > >       .feature_table_size = ARRAY_SIZE(features),
> > >       .driver.name    = KBUILD_MODNAME,
> > >       .driver.owner   = THIS_MODULE,
> > > +     .suppress_used_validation = true,
> > >       .id_table       = id_table,
> > >       .probe          = rpmsg_probe,
> > >       .remove         = rpmsg_remove,
> > > --
> > > 2.17.1
> >
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
