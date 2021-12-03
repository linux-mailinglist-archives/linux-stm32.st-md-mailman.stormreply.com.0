Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C34F2466F8A
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Dec 2021 03:07:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77DF8C5F1DC;
	Fri,  3 Dec 2021 02:07:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55F82C5F1D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Dec 2021 02:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638497277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xTEet6pLGYYGny4qkW0aFj01Nakh9JQXlab8tLgNhaw=;
 b=N7J5Ve82yYqi8u4nxcHa35fEmCjPLqJF/cpJdJsY4gpKHSGDgfCY2hlWQZgkA+PD/iBu5c
 sE5jcetO6l1Yn9ZbnqqtWJiP9Zlc3MvbdZFz963TMAvMP/rcMbibInLbFuP+xVrqCDyI2d
 G/0WQCBrfCTCvDVZv9VynuaRVGz6qmc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-229-1DdXJuZcP-utaScQ5sGLkg-1; Thu, 02 Dec 2021 21:07:55 -0500
X-MC-Unique: 1DdXJuZcP-utaScQ5sGLkg-1
Received: by mail-lj1-f197.google.com with SMTP id
 t25-20020a2e8e79000000b0021b5c659213so595261ljk.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Dec 2021 18:07:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xTEet6pLGYYGny4qkW0aFj01Nakh9JQXlab8tLgNhaw=;
 b=Fis9J+lpvmlVrz3fC4jY5t4qJVorn5vC66zBnj5+Js3VhCXAyuijDe7AZlR/PoBHAH
 Tpdgig3C23dDOANs5LGZFif63p9HVXV5gw+WmoCbgo10yBM9HesrGkhNDsc0PZfaSwVq
 nHvUYPypJDoy8K279x5HiovGUfgEFtNQGwJaPouFM7fjmhr8neRAub10Ed7rtjCAcSwB
 55KyZPh10g985Y3wx3QEOjkrOuOZJDuxCj85Fn8OrFr7ozVHuTDghnfCOs2xQxX0ejSe
 2FQQ+xoNwBQxEYiQXsuWfkGkVbcnb7LZlx2tMnR2qzZRJomWvzxVG/6ykY2u9qeTNKym
 ODnQ==
X-Gm-Message-State: AOAM530MnpauPcj4jj8Ekmuzkr6H4YLaNqDA1Kw3O7P5ajXCoAR8zgVO
 /eLwxhxQALGj6C0wcSDPOk+lpB6AHox45MrM22hRqtNIzh9/2u1JGZZi3Ruv2716kMeMrDOxEdc
 lDkgs7RZ3/tdC1ff83b+6AVkUFJYLjYRLqIx4LemqgIx9vy+jcEpMAxWA
X-Received: by 2002:a05:6512:3d09:: with SMTP id
 d9mr15987265lfv.481.1638497273632; 
 Thu, 02 Dec 2021 18:07:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJRoPd+cWIW68hbj/YiNMRxYyNhn/ZnlOPexARC9hJ5F7TK6WyGKAKRGjhJM+pT5KjTXm/Q7GaYzO+2iabKiY=
X-Received: by 2002:a05:6512:3d09:: with SMTP id
 d9mr15987247lfv.481.1638497273400; 
 Thu, 02 Dec 2021 18:07:53 -0800 (PST)
MIME-Version: 1.0
References: <20211124162045.25983-1-arnaud.pouliquen@foss.st.com>
 <20211124161055-mutt-send-email-mst@kernel.org>
 <CACGkMEvQoUcPFgOTvEDGkZHMXhjhPrk0xq-Zq3+G20_Lp-hu8A@mail.gmail.com>
 <20211202170011.GA900071@p14s>
In-Reply-To: <20211202170011.GA900071@p14s>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 3 Dec 2021 10:07:42 +0800
Message-ID: <CACGkMEs5DWPT76U8KYdr385e0Y6EUQQRSfRMfR3ZZz34HBdVKA@mail.gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Fri, Dec 3, 2021 at 1:00 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Hey guys,
>
> On Thu, Nov 25, 2021 at 10:15:44AM +0800, Jason Wang wrote:
> > On Thu, Nov 25, 2021 at 5:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Wed, Nov 24, 2021 at 05:20:45PM +0100, Arnaud Pouliquen wrote:
> > > > Using OpenAMP library on remote side, when the rpmsg framework tries to
> > > > reuse the buffer the following error message is displayed in
> > > > the virtqueue_get_buf_ctx_split function:
> > > > "virtio_rpmsg_bus virtio0: output:used len 28 is larger than in buflen 0"
> > > >
> > > > As described in virtio specification:
> > > > "many drivers ignored the len value, as a result, many devices set len
> > > > incorrectly. Thus, when using the legacy interface, it is generally
> > > > a good idea to ignore the len value in used ring entries if possible."
> > > >
> > > > To stay in compliance with the legacy libraries, this patch prevents the
> > > > virtio core from validating used length.
> > > >
> > > > Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
> > > >
> > > > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > > > Cc: Jason Wang <jasowang@redhat.com>
> > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > >
> > > Arnaud, thanks a lot for the analysis.
> > >
> > > Jason, I think this is another good point. We really should not
> > > validate input for legacy devices at all.
> >
> > I agree. Will do that in the next version.
>
> I'm a little unclear about the "next version" in the above comment - is this
> something I should wait for?  Should I move forward with Arnaud's patch?

Just to make it clear. If my understanding is correct, my series was
reverted so this patch is not needed.

For "next version", I meant I will resend the new version of used
length validation that

- only do the validation when it was explicitly enabled
- warn instead of bug
- do not validate legacy device

Thanks

>
> Thanks,
> Mathieu
>
> >
> > Thanks
> >
> > >
> > >
> > > > Update vs v1[1]: update commit message to clarify the context.
> > > >
> > > > base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> > > >
> > > > [1]https://lore.kernel.org/lkml/20211122160812.25125-1-arnaud.pouliquen@foss.st.com/T/
> > > > ---
> > > >  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > index 9c112aa65040..5f73f19c2c38 100644
> > > > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > > > @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
> > > >       .feature_table_size = ARRAY_SIZE(features),
> > > >       .driver.name    = KBUILD_MODNAME,
> > > >       .driver.owner   = THIS_MODULE,
> > > > +     .suppress_used_validation = true,
> > > >       .id_table       = id_table,
> > > >       .probe          = rpmsg_probe,
> > > >       .remove         = rpmsg_remove,
> > > > --
> > > > 2.17.1
> > >
> >
>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
