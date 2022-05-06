Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA7E51DE31
	for <lists+linux-stm32@lfdr.de>; Fri,  6 May 2022 19:12:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A496C628AB;
	Fri,  6 May 2022 17:12:29 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DA2AC628A8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 17:12:27 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id q4so5145424plr.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 May 2022 10:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Y5j094DPRHeZY99oesAJ3jD7eRhZ4vMFwjoZ+Ryi1tg=;
 b=PLWqkvfpBIz0YAKpzE8d7HqkW2be22+6wtRGeNO8rkofc+vVMVudpF9Vq5h3qfqvZe
 +Y97bEJYqTW+r+glnIE75TBr+6VysuOgDD0T/P6U4K3rHzjc/N8B52SwFBsO55KO7V28
 UH4edqC9e2bYKQ1IaI8gd0NGs7tvXen7wnh93P2uzEiIvZo265ZIApY9WdAgG920MI8+
 ix32KFwU91g1eCKIiFIbJrsASzTU90TWIDBhVE/iekvVovPqPZtuWRD+LMzKIXhNxhS5
 dQOYVBl6kk0attyw1yNZNl+j43uITlZkHCsSeAEqyHKLaqHOwvpzSeZm3BLlRgUvRDX+
 5srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y5j094DPRHeZY99oesAJ3jD7eRhZ4vMFwjoZ+Ryi1tg=;
 b=o125jT90XSDHpfOJEwu+lpuAUchubxfey9JDIZuPWaRLYHmUAPXAfR7Fxsk6ipnPxG
 6nCxPH0NJBnj7nI5fzs+DsLRqIdMCrEcQEBVTgEDYrZ4HrQ2vQRh2p8jm5A3tc9sP0Xu
 rzCwlF+c24FmOfhangpB2aHLyLWd9dcjr1SPhJ99kgPd3mM1v9kb5xRCVhYQ877hQi42
 fGQDpYt/O6IgJm5ZFhVwcYtT73R3pJBje9d15NXebEVdalb7cY2v6Vvm8DC2TxWlu3/a
 RPbFMq637mK0PGS7pdBkS0VfB+MT2WCXz1rOldBTmy8B/g33n1K6Ulh5FiSQvklfmEcz
 UkPw==
X-Gm-Message-State: AOAM5303iZGpAJiX7UqxSE+A+LcGBL8UKmw9SPrd98P+NIyWhbibdb2o
 J4aLtIfD3DNiW5j1Tl7TDbSfnw==
X-Google-Smtp-Source: ABdhPJyxvbn7xQx6eD34L504pFKRwq5Xji91lr3nz7ShqfmYHAW1qdEgkx4ky5S4KKsF7POvptuBgQ==
X-Received: by 2002:a17:90b:1bc3:b0:1dc:61fd:7ea4 with SMTP id
 oa3-20020a17090b1bc300b001dc61fd7ea4mr13197467pjb.31.1651857145904; 
 Fri, 06 May 2022 10:12:25 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a1709027e4700b0015e8d4eb222sm1168856pln.108.2022.05.06.10.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 10:12:24 -0700 (PDT)
Date: Fri, 6 May 2022 11:12:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220506171222.GA2816011@p14s>
References: <20220315153856.3117676-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315153856.3117676-1-arnaud.pouliquen@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: virtio: set dst address on first
	message received
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

On Tue, Mar 15, 2022 at 04:38:56PM +0100, Arnaud Pouliquen wrote:
> when a rpmsg channel has been locally created with a destination address

s/when/Wen

Also, please be more specific about the "locally created" part, i.e
rpmsg_ctrldev_ioctl() -> rpmsg_create_channel().  Otherwise it is really hard to
understand the context of this change.

> set to RPMSG_ADDR_ANY, a name service announcement message is sent to
> the remote side. Then the destination address is never updated, making it
> impossible to send messages to the remote.
> 
> An example of kernel trace observed:
> rpmsg_tty virtio0.rpmsg-tty.29.-1: invalid addr (src 0x1d, dst 0xffffffff)
> 
> Implement same strategy than the open-amp library:
> On the reception of the first message, if the destination address is
> RPMSG_ADDR_ANY, then set it to address of the remote endpoint that
> send the message.
>

I would have expected a "Fixes:" tag.

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> ---
> Remark:
> An alternative (or a complement?) could be to add a NS bind/unbind in
> the NS announcement channel (in rpmsg_ns.c).
> This would allow the local and/or the remote processor to inform the
> remote side the the service announced in bound.
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 3ede25b1f2e4..99d2119cc164 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -708,6 +708,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>  static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  			     struct rpmsg_hdr *msg, unsigned int len)
>  {
> +	struct rpmsg_device *rpdev;
>  	struct rpmsg_endpoint *ept;
>  	struct scatterlist sg;
>  	bool little_endian = virtio_is_little_endian(vrp->vdev);
> @@ -746,6 +747,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>  	mutex_unlock(&vrp->endpoints_lock);
>  
>  	if (ept) {
> +		rpdev = ept->rpdev;
> +		if (rpdev->ept == ept && rpdev->dst == RPMSG_ADDR_ANY) {

Please add a comment to explain the first part of the if() clause.  It took me
quite some time to understand. 

> +			/*
> +			 * First message received from the remote side on the default endpoint,
> +			 * update channel destination address.
> +			 */
> +			rpdev->dst = msg->src;

This triggers a bot warning and should be addressed.  If it can't be addressed add
a comment that clearly explains why so that we don't end up receiving patches
for it every 4 weeks.

Thanks,
Mathieu

> +		}
> +
>  		/* make sure ept->cb doesn't go away while we use it */
>  		mutex_lock(&ept->cb_lock);
>  
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
