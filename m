Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DE5459C35
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Nov 2021 07:16:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7337CC5C82A;
	Tue, 23 Nov 2021 06:16:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24378C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Nov 2021 06:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637648163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4zwLXwj6k9S2mIEl8JoRh6JXMNKqR5tGWTY9Pd3RcY4=;
 b=KJAoL9tKU7kG9OBFn9nBMJ8g5v1trA0W+eo+ZhJ8pWazfGV98enzzEU3cmGaUFqreUbi7g
 00lj+eQjhwdJHYBznQJQq268QtKs0JZp+6eXMetlsaAonjGe3wWK+aYdo7QGGdp3FcgOxJ
 eaKVj1cRUT6f6PVNNzIo3QjZLsTgH+o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-59rNAiOFNWeBQ8hFb-AKzA-1; Tue, 23 Nov 2021 01:15:57 -0500
X-MC-Unique: 59rNAiOFNWeBQ8hFb-AKzA-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so681540wma.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 22:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4zwLXwj6k9S2mIEl8JoRh6JXMNKqR5tGWTY9Pd3RcY4=;
 b=HH2baaJegmMWlEcDTf+idqPcje96v0HBc1Zsjd1R+DKm6rhImzCfqgQ+HiYyzLN8vt
 OayOJLIIB2Y5UKZ4gWVZFX5ftDkCD5btCVQXXqCbAtGjYYKgENltzv0aV9fLYYJOBzfP
 oEeqKv7P02uH/7rvaL+nuEMTuqpQVzLy5Qxsfs8iojeWdIBPPELrJqWA80eLpYVslzsi
 PNBrwv74pmfPKbU8pAGDn8ps1EN1vE1xO7FYhwgQj3oLTL16VFrm3xInjxpJPrKOBJZm
 9I78YJ+kIS9cUVEfFzlfxkKJ9nHZ11dCk13uBSjDbB6aFqzvSgbj3K3CTr5ZDABrW45b
 t4OA==
X-Gm-Message-State: AOAM532mYfAQlEutBlEXgRC/JnVim24QUqHMeQQnk9WmF2NC6PlPKfqq
 d9xa/+f35OIuiJ/fbNevwdfQlkh+ne0XJ2wzI5ir+M89BybIzNgWZFrSLo1D7HaHYslHWwfxgME
 /iB3iEzpeYk7t7cBMz6MEh1XlmgfM+RPDPOIklnIr
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr4390035wrp.226.1637648156130; 
 Mon, 22 Nov 2021 22:15:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCd6t13EbSY0ZWFB7yE27RLkDqYVVYmKx7kd9hky7A7ody0jIp7kwGr4IDGX9vk1Uty1OSnQ==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr4390015wrp.226.1637648155984; 
 Mon, 22 Nov 2021 22:15:55 -0800 (PST)
Received: from redhat.com ([45.15.19.36])
 by smtp.gmail.com with ESMTPSA id a10sm24151127wmq.27.2021.11.22.22.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 22:15:55 -0800 (PST)
Date: Tue, 23 Nov 2021 01:15:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20211123011340-mutt-send-email-mst@kernel.org>
References: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Jason Wang <jasowang@redhat.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Mon, Nov 22, 2021 at 05:08:12PM +0100, Arnaud Pouliquen wrote:
> For RX virtqueue, the used length is validated in all the three paths
> (big, small and mergeable). For control vq, we never tries to use used
> length. So this patch forbids the core to validate the used length.

Jason commented on this. This is copy paste from virtio net
where the change was merely an optimization.

> Without patch the rpmsg client sample does not work.

Hmm that's not enough of a description. Could you please
provide more detail? Does rpmsg device set used length to a
value > dma read buffer size? what kind of error message
do you get? what are the plans to fix the device?

> Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
> base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 9c112aa65040..5f73f19c2c38 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
>  	.feature_table_size = ARRAY_SIZE(features),
>  	.driver.name	= KBUILD_MODNAME,
>  	.driver.owner	= THIS_MODULE,
> +	.suppress_used_validation = true,
>  	.id_table	= id_table,
>  	.probe		= rpmsg_probe,
>  	.remove		= rpmsg_remove,
> -- 
> 2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
