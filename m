Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A805427433
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Oct 2021 01:33:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6574C5C824;
	Fri,  8 Oct 2021 23:33:53 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40D2DC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 23:33:52 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id g125so9006841oif.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 16:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LNS8GJx7Voy78yUyXNx2JMVNcPOFQ4/UTHt1sTh9r9o=;
 b=Bg7OowKF/HjhYjv8EvSeo7PxCGvq0C/YP2r3EzNsC6mVhKpGaLYoQRZUki6HTIHy+p
 fenB7grsQ4DRJxcdIytrERvqLxis+s8QHXXiqliLlOA0sBwAnwB+TVFpfK9HZjRxvzEw
 6Ed7qTixmLcdrBNGQvYNxGY4xakURMjzK9aJ1+P1YzT+3YiDY/V+AvKWPJrgP0Fet/oX
 6bpgTB0psdYEE4/LLIWZUkgOpiwwe9GDQMUA23qzUhWb+W03PgMMt6y7SoWFMFl+3NOn
 OY1TYt502mD2T2lw+TQZTTFUNsjzJEa9C3MlCfkIj8szsKiVmwmkGeNtX6Cp3BpyfUyK
 Yvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LNS8GJx7Voy78yUyXNx2JMVNcPOFQ4/UTHt1sTh9r9o=;
 b=T8+3P+gP/U/RuirkXZDXpWXHAqnCpoQ58S+tdiel6RH5JsaSDwE/snS+eu+3HbIHAW
 5YfEP/Mge1jiieHLxuwVZArMHw6gJqgVnp7/b5X+eeqdKdm3FGJRrkoXOSM+xsWWVZ2G
 PnS/vMfP4ifcUeAf//wnD9MtT5qOC09OlKmNYj97ADRBUtmaGmwK1P+9iz21I4TRxuMz
 rDgCRNMI/sL5NLkrTYftq2tO4ODLe4OIPOVBRcAUEQPMc98BoYZq6/tQHT4gnHrnovNR
 1KZdKSRtpAj5IlCx33aeOEhQ8Zpc98FbNtzoWNifTlt+Wvt7RnWZUZAJDepxSbPW+MfE
 5SSg==
X-Gm-Message-State: AOAM532zm6g/G5pxHcUAoDQM2ZPuKc0fj2sksWwgovR8P+FTClCZOhZb
 JDs2OpVvid4a++w++QiZzbv/oP7oAyRi+g==
X-Google-Smtp-Source: ABdhPJxcwZLkWR0vpAYFKlZuLPCQjPJ+BotE7dx4TRrQGxFwGJPEPPwaI2ncQJliUwOm2t11sMrJLg==
X-Received: by 2002:aca:6256:: with SMTP id w83mr18543659oib.19.1633736030769; 
 Fri, 08 Oct 2021 16:33:50 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id bb39sm217154oib.28.2021.10.08.16.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:33:50 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:35:28 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <YWDVwArEz5Yub3GJ@ripper>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <20210712123752.10449-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712123752.10449-4-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 3/4] rpmsg: Move the rpmsg control
 device from rpmsg_char to rpmsg_ctrl
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

On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:

> Create the rpmsg_ctrl.c module and move the code related to the
> rpmsg_ctrldev device in this new module.
> 
> Add the dependency between rpmsg_char and rpmsg_ctrl in the
> kconfig file.
> 

As I said in the cover letter, the only reason I can see for doing this
refactoring is in relation to the introduction of
RPMSG_CREATE_DEV_IOCTL. So I would like this patch to go together with
that patch, together with a good motivation why there's merit to
creating yet another kernel module (and by bind/unbind can't be used).

Perhaps I'm just missing some good usecase related to this?

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/rpmsg/Kconfig      |   9 ++
>  drivers/rpmsg/Makefile     |   1 +
>  drivers/rpmsg/rpmsg_char.c | 170 +----------------------------
>  drivers/rpmsg/rpmsg_char.h |   2 +
>  drivers/rpmsg/rpmsg_ctrl.c | 215 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 229 insertions(+), 168 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
[..]
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
[..]
> -static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
> -{
[..]
> -	dev = &ctrldev->dev;
> -	device_initialize(dev);
> -	dev->parent = &rpdev->dev;
> -	dev->class = rpmsg_class;
[..]
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
[..]
> +static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
> +{
[..]
> +	dev = &ctrldev->dev;
> +	device_initialize(dev);
> +	dev->parent = &rpdev->dev;

You lost the assignment of dev->class here, which breaks the udev rules
we use to invoke rpmsgexport to create endpoints and it causes udevadm
to complain that rpmsg_ctrlN doesn't have a "subsystem".

Regards,
Bjorn
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
