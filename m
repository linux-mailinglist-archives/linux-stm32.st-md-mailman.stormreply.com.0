Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 061B9459F61
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Nov 2021 10:39:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8332C5EC59;
	Tue, 23 Nov 2021 09:39:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92383C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Nov 2021 02:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637633819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ecCKMHgh1nP5alHe1rExeQVJFcZLj5dbAYvcIuSvMp8=;
 b=VG8Xqdyi/3vrjMtWhIk9rx182nOzySy9PxzY/2qbbn7wODOsrCOcY6SN49JLX66a0NUoqD
 RTVcPP5GI+5V0a0+L8bebxZi824bPpTcnVD6YNMfIaEtVTIjztuAdWk289i97t/lprwf4u
 G3oFEDBfUbtTJK7Vl0yl8km3IktEeBk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-Gw7oKh8AN5K8QwGWSZkSrQ-1; Mon, 22 Nov 2021 21:16:58 -0500
X-MC-Unique: Gw7oKh8AN5K8QwGWSZkSrQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 c15-20020a05651200cf00b0040524451deeso13324046lfp.20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 18:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ecCKMHgh1nP5alHe1rExeQVJFcZLj5dbAYvcIuSvMp8=;
 b=KNHtwbgCQV1rWltH39ufdxVFuVQrPWAKIY6DPQHjJriby/nE2708uvZhQwXmX2fZca
 XkBCdGZVCpvGYmXoMznAGWnw0TNNIolN4ZO1FZXfzbfyQ0JLF++06JRFGffgnG39addb
 s0z/lRPXTVjk5c3vmOiI9lvVHtCoT/holAe6s28Ij4cIyT6mFehFIAG7bdH99uL6hSft
 GlS20yBxtAlQNBYr8f7FvLYKzdV31kSlhpHB1gZPvgAtmcSXgPOaXVmBTGwyIeS8OZHd
 kEApAXAyJC3r+X779qywbsexKKkKPEr1420EtuCx84zIuK2dovHkneNdSsW2bp0uRMZ7
 gvZA==
X-Gm-Message-State: AOAM5332kX9Y7gz83EIjDgSQ9w8PuWrJ1eYxRw8H5FrCC+mdPmymXebn
 FJiLR6lHS0afTqhPDUzicHXhbrt4vnVyvduVNzlb/Yw5mUAKJms7A4ZSvLZHScOn2092r48WvKb
 4WPWSnqeCDKhGWZp1lAc26EzYOl13l1XAAcHcYUHlzNX6KK7jC6hmnO+S
X-Received: by 2002:a05:6512:3d09:: with SMTP id
 d9mr1123015lfv.481.1637633816982; 
 Mon, 22 Nov 2021 18:16:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZdt/n+KGQPmtzq9KuLUyNSmS94ktfV31AZ4jOSU6mpao1hmU4eoYuLOvVeqk6uzcISZjccIPmcIlCHFZVPA8=
X-Received: by 2002:a05:6512:3d09:: with SMTP id
 d9mr1122994lfv.481.1637633816808; 
 Mon, 22 Nov 2021 18:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com>
 <CACGkMEsQVVMx_+ezoVZ86xEFuadNOzjwcNBnv+-h-pE0JnXhxw@mail.gmail.com>
In-Reply-To: <CACGkMEsQVVMx_+ezoVZ86xEFuadNOzjwcNBnv+-h-pE0JnXhxw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 23 Nov 2021 10:16:46 +0800
Message-ID: <CACGkMEvXNbAseqQSyJL-7W5VZvEQGnK0WttVYLvGY2btJ_mTPw@mail.gmail.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Tue, 23 Nov 2021 09:39:26 +0000
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] rpmsg: virtio: don't let virtio core to
	validate used length
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

On Tue, Nov 23, 2021 at 10:15 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Nov 23, 2021 at 12:08 AM Arnaud Pouliquen
> <arnaud.pouliquen@foss.st.com> wrote:
> >
> > For RX virtqueue, the used length is validated in all the three paths
> > (big, small and mergeable). For control vq, we never tries to use used
> > length. So this patch forbids the core to validate the used length.
>
> If I understand the code correctly, the function that calls
> virtqueue_get_buf() ares:
>
> rpmsg_recv_done()
> get_a_tx_buf()
>
> So it looks to me like the above change log needs some tweak? (It
> looks like a copy from the virtio-net patch).
>
> The codes are fine.
>
> Thanks
>
> >
> > Without patch the rpmsg client sample does not work.


Btw, this probably uncovers a bug of the rpmsg device which needs to be fixed.

Thanks

> >
> > Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
> >
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > ---
> > base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 9c112aa65040..5f73f19c2c38 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
> >         .feature_table_size = ARRAY_SIZE(features),
> >         .driver.name    = KBUILD_MODNAME,
> >         .driver.owner   = THIS_MODULE,
> > +       .suppress_used_validation = true,
> >         .id_table       = id_table,
> >         .probe          = rpmsg_probe,
> >         .remove         = rpmsg_remove,
> > --
> > 2.17.1
> >

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
