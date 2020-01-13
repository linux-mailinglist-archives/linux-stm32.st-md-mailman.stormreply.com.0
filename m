Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0045D139797
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 18:24:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B381EC36B0D;
	Mon, 13 Jan 2020 17:24:59 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D794FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 17:24:58 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q10so5175539pfs.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 09:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=U2PWwEEnO5+ksSRfTkvVAkgMJvekPPQPvk+J1MXkAKA=;
 b=fIDSBdAgWDIiMm+DJrGSk8SNVlkqqoJ/XOYER2KVMmFc85XBWE4fErM4MFi85PEx2h
 2Igm5N9Sw8crh8PmobTPG1r0fpWIz9heb2tmNk/Svm2Hxp7Nb47ZngRKZ0JeD+DCJpYe
 WIFC61PxN+EIo3zyUbdFykkit80459ecCP/nPUpBTdSqPxMwyduO8/ncgNndqrYsbPC1
 NoLgWSqo7mDBTDKENNorvGv4h6vVDgJzKAoIMXvIQgn83zmsnj5pMW78uCuKA/TW3tI6
 vhcDzEa+PHR4GKZ+CfD6TDAsfauhcAox/mVJ9fH0mfHAYHRllagoSZJb+h8uqcj5WtVS
 7f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=U2PWwEEnO5+ksSRfTkvVAkgMJvekPPQPvk+J1MXkAKA=;
 b=KWVUsPia2XXATag7aZRdNWaB6t9Eb8t7zo3TRTMEZG/+pREmSlwOpgxzfV8Hnpt9b3
 V5Kvy2ANL7i/sF3ow9eHyl/2Ts3qi5RZDxQzIF8wdzrFBezU6v8GdghtrpKRZK7Ijj2D
 mHq2EPXoZbyxs5VOO+RNfnubkLGIondPaIBvRut2exHYim1IpGfThsbSDm0TglZVxKRL
 B651C/b4Opi0p/D1xWX67Awf6ozb77dLPae+CSZEVwnk2aP16icdZnQJMjZ/p8ybL+PX
 mr7SL2lVBh6iNuzar2zXUmjx7ScRReFkNHSNBXUUuJa76J5uLL14oK4B6d+5NTcG/NCH
 OKSQ==
X-Gm-Message-State: APjAAAWOUGUNaj23F+MxZZjcKB6LKwJiwRZTScNQePDFbhh9Ae2mLYFf
 JfjSHuEoISWvEbG4p89DK6KQQQ==
X-Google-Smtp-Source: APXvYqw80f6wRiRP9Dwvx/NTeGY9Bf9oleVCbpo6cpd3kqWBdbqpjm+tTzcPB06sPHd1+r+7vplIzg==
X-Received: by 2002:aa7:8b17:: with SMTP id f23mr20824919pfd.197.1578936297041; 
 Mon, 13 Jan 2020 09:24:57 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id d26sm13917312pgv.66.2020.01.13.09.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 09:24:56 -0800 (PST)
Date: Mon, 13 Jan 2020 09:24:53 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20200113172453.GQ738324@yoga>
References: <20191113172249.32412-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113172249.32412-1-arnaud.pouliquen@st.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien DESSENNE <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] rpmsg: core: add API to get MTU
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

On Wed 13 Nov 09:22 PST 2019, Arnaud Pouliquen wrote:

> Return the rpmsg buffer MTU for sending message, so rpmsg users
> can split a long message in several sub rpmsg buffers.
> 

I won't merge this new api without a client, and I'm still concerned
about the details.

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  V1 to V2
> 
>   V1 patch:https://lore.kernel.org/patchwork/patch/1124684/
>   - Change patch title,
>   - as not solution today to support MTU on GLINK make ops optional,
>     RPMsg client API returns -ENOTSUPP in this case,
>   - suppress smd and glink patches.

That's ok.

> ---
>  drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h   |  2 ++
>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>  include/linux/rpmsg.h            | 10 ++++++++++
>  4 files changed, 43 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index e330ec4dfc33..a6ef54c4779a 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  }
>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>  
> +/**
> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
> + * @ept: the rpmsg endpoint
> + *
> + * This function returns maximum buffer size available for a single message.
> + *
> + * Return: the maximum transmission size on success and an appropriate error
> + * value on failure.

Is the expectation that a call to rpmsg_send() with this size will
eventually succeed?

> + */
[..]
> +static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> +{
> +	struct rpmsg_device *rpdev = ept->rpdev;
> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
> +
> +	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);

I'm still under the impression that the rpmsg protocol doesn't have to
operate on fixed size messages. Would this then return vrp->num_bufs *
vrp->buf_size / 2 - sizeof(rpmsg_hdr)?

> +}
> +

Regards,
Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
