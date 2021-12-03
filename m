Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1AA467D9C
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Dec 2021 19:57:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00175C5F1D5;
	Fri,  3 Dec 2021 18:57:22 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FC93C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Dec 2021 18:57:21 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id r11so15152135edd.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Dec 2021 10:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hD4l+D/+jBR1l02iiNBBh1vx/MLSXsOsv7EqwsEMIxs=;
 b=SI1RrBe/+gvFatPLC2kgaqo/6TWht95sThyAYn1qmUY6JraFMWuGcE/ItoxFURH4MV
 F7EXSzrlCYr9d125SpZLx7dkTkPuWh9tIlMRCjbAvBaYum5qvS8mOKqH2QksW0v9d4Ly
 GUs8H5jGJ5VsHEn6MUZDi+NsGv2pV1OWg71dDo3h3pMvkm28ZrhUmMxORWYxfsIFexkR
 lWDOAhhIfTJUaoT6VpOCTbfOaBpwrBNbwQbDFHgWX/B+htYaEN0pMVwJiWBgmgTMmWYw
 nyaMq6cYLs+N6URbX+meM8xNRMotLWtmLlVIvnzUd7mhnlREhlHPau5v+bfrOASxcF5d
 Hr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hD4l+D/+jBR1l02iiNBBh1vx/MLSXsOsv7EqwsEMIxs=;
 b=AX1gn8fK1e3z992s6aAH7bDcP/XYaSWc95w+w7IDMP0ZF+RUqj2APzjhzFdFHAoRz1
 lOUx+q4Rsx8yQfLPdtC6vjFyP+oNZ+Cpfxax78ZfkrXA7OSxojtzb9NVgNEz1tHvpWyo
 k6eupnX0sgK+bzSeGVaHU1qWoeTgR4niy9qPBM/V86c+URQkt0MtthMaxa5MFhgIC9cN
 gJj/LVj+mH5wbFAKHRNW+kkMbZO0l+YSGFab3lx3/uqINbwt3rgnawD8chPJNmfMUmxs
 FJ7TM5sfTHtZtVpi4l/DvXZpYYPq0EEV6M7ZJyaFfVxHhTFyWHA5Mot6qwI1Lcjh3KBg
 JrAA==
X-Gm-Message-State: AOAM530y41AGILcrnsM9AoS/9i0KHPkqQHchIy24mMMC5SFVmfg+VONO
 MSUtZ2ObNft7dg7XWGK3x3t2UhYw9Amjmi4szynT0g==
X-Google-Smtp-Source: ABdhPJxQ4BgzO/ntM4IZnhN5zAD/ZEj2i9Ud/iiJnXbHBqNRxbXwei7sOQHFI7g8w+H8BpIPlEFJk2EfoX0ZTTe7rwE=
X-Received: by 2002:a05:6402:2551:: with SMTP id
 l17mr29467140edb.142.1638557840962; 
 Fri, 03 Dec 2021 10:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20211124162045.25983-1-arnaud.pouliquen@foss.st.com>
 <20211124161055-mutt-send-email-mst@kernel.org>
 <CACGkMEvQoUcPFgOTvEDGkZHMXhjhPrk0xq-Zq3+G20_Lp-hu8A@mail.gmail.com>
 <20211202170011.GA900071@p14s>
 <CACGkMEs5DWPT76U8KYdr385e0Y6EUQQRSfRMfR3ZZz34HBdVKA@mail.gmail.com>
In-Reply-To: <CACGkMEs5DWPT76U8KYdr385e0Y6EUQQRSfRMfR3ZZz34HBdVKA@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 3 Dec 2021 11:57:08 -0700
Message-ID: <CANLsYkxfhamUU0bb4j7y6N4_G9odKxLCjXxgXEx4SJ6_Kf+M2Q@mail.gmail.com>
To: Jason Wang <jasowang@redhat.com>
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

On Thu, 2 Dec 2021 at 19:07, Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Dec 3, 2021 at 1:00 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > Hey guys,
> >
> > On Thu, Nov 25, 2021 at 10:15:44AM +0800, Jason Wang wrote:
> > > On Thu, Nov 25, 2021 at 5:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Wed, Nov 24, 2021 at 05:20:45PM +0100, Arnaud Pouliquen wrote:
> > > > > Using OpenAMP library on remote side, when the rpmsg framework tries to
> > > > > reuse the buffer the following error message is displayed in
> > > > > the virtqueue_get_buf_ctx_split function:
> > > > > "virtio_rpmsg_bus virtio0: output:used len 28 is larger than in buflen 0"
> > > > >
> > > > > As described in virtio specification:
> > > > > "many drivers ignored the len value, as a result, many devices set len
> > > > > incorrectly. Thus, when using the legacy interface, it is generally
> > > > > a good idea to ignore the len value in used ring entries if possible."
> > > > >
> > > > > To stay in compliance with the legacy libraries, this patch prevents the
> > > > > virtio core from validating used length.
> > > > >
> > > > > Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
> > > > >
> > > > > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > > > > Cc: Jason Wang <jasowang@redhat.com>
> > > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > > ---
> > > >
> > > > Arnaud, thanks a lot for the analysis.
> > > >
> > > > Jason, I think this is another good point. We really should not
> > > > validate input for legacy devices at all.
> > >
> > > I agree. Will do that in the next version.
> >
> > I'm a little unclear about the "next version" in the above comment - is this
> > something I should wait for?  Should I move forward with Arnaud's patch?
>
> Just to make it clear. If my understanding is correct, my series was
> reverted so this patch is not needed.

Ok - thanks
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
