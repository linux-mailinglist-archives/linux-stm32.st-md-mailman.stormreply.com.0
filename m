Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC59F45D30F
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Nov 2021 03:16:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88302C597BE;
	Thu, 25 Nov 2021 02:16:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB4EAC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Nov 2021 02:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637806559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r72uMhfjIYSF88TaYdiXECmLl0Mii7SWfOdaVyCFTl8=;
 b=PWg0Fwfe44g7Wn8inn3QxHjEDIjvd9/em/hNaxj+ZEKS51maUurRQkkTZ10ZiCyEvF1oOl
 +D3EYmQ6L2edCrpClsUJyaqcF0G4J4Jx9cAhc4DmIW2MPiSMmGzhQcE3yD0zLE5IIm2KNH
 VEptz24NMQxHh1zEB0o3UZnGeBhONPw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-8OLwPCn5P02sYG2mXjqERQ-1; Wed, 24 Nov 2021 21:15:57 -0500
X-MC-Unique: 8OLwPCn5P02sYG2mXjqERQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 h40-20020a0565123ca800b00402514d959fso2375139lfv.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Nov 2021 18:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r72uMhfjIYSF88TaYdiXECmLl0Mii7SWfOdaVyCFTl8=;
 b=cAb2Z6WYAPYUff1TQKOuIcOSjeUUVNgBNvkEzVakoZr89oNMGw/TkIwPf4WpugIRoJ
 SkJYVJQjl/y7METq3YaK9rHHv2+svHqtwT0YsPukeB/M13+KCVMUldUBz8IpmUSzWcST
 EBCFlR8mDna8IewKed4C/4Zba4vpkU1MiRtqdjxdTJFbZN5ESyoJhnghfOOp9A74qswu
 jJSMgjhwRhiVzpsBv/vcZcmKVh+llZx7gpR2ihYhgIB6/FkVDMXyqDlqaE/4JRLR4Trp
 Y9x3m3lH2/RJGb2fXhDWqQ7KVfEYrOnBIqyk3iT6RY18920aDP6ot9Rg/dyo5lqCmhfu
 9r9A==
X-Gm-Message-State: AOAM531C5VKUc/OygP5iPFdVQ/0Y65myWXs7KS6//gUYjYVCFlRWcDOz
 LYdGmfv+usx/6N9fsvBEI9ERlRtVMpFmALU8nQYeBTaBhaKC3ARpL+xw7jPF6/H/+ePaDuj0i1j
 zcc8g9NhdNcgGHl2hk9mJWI5Dw7s6Jd/EuXkvvhVFdqGqorTd4y/hqxgh
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr20998315ljp.362.1637806556061; 
 Wed, 24 Nov 2021 18:15:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT9Fnm7W7ku4KzzgyNbW6baOBfxN7dV9GBC3FZtP+i7ldmgANqMnbMbrg7KLgP/dpEX9CSqxPFFGj2DzWKb3k=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr20998288ljp.362.1637806555830; 
 Wed, 24 Nov 2021 18:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20211124162045.25983-1-arnaud.pouliquen@foss.st.com>
 <20211124161055-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211124161055-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 25 Nov 2021 10:15:44 +0800
Message-ID: <CACGkMEvQoUcPFgOTvEDGkZHMXhjhPrk0xq-Zq3+G20_Lp-hu8A@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
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

On Thu, Nov 25, 2021 at 5:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Nov 24, 2021 at 05:20:45PM +0100, Arnaud Pouliquen wrote:
> > Using OpenAMP library on remote side, when the rpmsg framework tries to
> > reuse the buffer the following error message is displayed in
> > the virtqueue_get_buf_ctx_split function:
> > "virtio_rpmsg_bus virtio0: output:used len 28 is larger than in buflen 0"
> >
> > As described in virtio specification:
> > "many drivers ignored the len value, as a result, many devices set len
> > incorrectly. Thus, when using the legacy interface, it is generally
> > a good idea to ignore the len value in used ring entries if possible."
> >
> > To stay in compliance with the legacy libraries, this patch prevents the
> > virtio core from validating used length.
> >
> > Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
> >
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > ---
>
> Arnaud, thanks a lot for the analysis.
>
> Jason, I think this is another good point. We really should not
> validate input for legacy devices at all.

I agree. Will do that in the next version.

Thanks

>
>
> > Update vs v1[1]: update commit message to clarify the context.
> >
> > base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> >
> > [1]https://lore.kernel.org/lkml/20211122160812.25125-1-arnaud.pouliquen@foss.st.com/T/
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 9c112aa65040..5f73f19c2c38 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
> >       .feature_table_size = ARRAY_SIZE(features),
> >       .driver.name    = KBUILD_MODNAME,
> >       .driver.owner   = THIS_MODULE,
> > +     .suppress_used_validation = true,
> >       .id_table       = id_table,
> >       .probe          = rpmsg_probe,
> >       .remove         = rpmsg_remove,
> > --
> > 2.17.1
>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
