Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 626E12F5424
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jan 2021 21:31:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2EA4C5660F;
	Wed, 13 Jan 2021 20:31:50 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3806C424BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 20:31:47 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id n25so2248286pgb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 12:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=x3MPhiU2w3/M1LyIYX233yh3l63UHt26Df7c1l4yyS0=;
 b=lgOrF1vud4CIGB25b7osz+2oIguQZKHERI9D69dBcBVuYXheNY3pX5pbJYPwCckISM
 +PUkM6LOor5+Ci7YWZAaSLyzjIlqhc8mPtpDrSlVpuE/cNy2l28dog8L7Ttg2reyok5s
 AD6wE980ogNO2xg3XtyblOQu7cC1Cwm8H9SIvDx6AuQhTKM8dOBuVZX15fEcbL5IuaWt
 15BQt6H8G1Yj0jnP9f+nRsPX7TJi/lPYpUk0vJx4MW5HNANk+UrbucZTrQuJ3CkG39De
 NPJj3ROUB7xRlXAxLFVY+yowWEQA30PDa8Bl5C4mCxRGHtAWK0GzBepU4eixiPg3/Ai1
 PCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x3MPhiU2w3/M1LyIYX233yh3l63UHt26Df7c1l4yyS0=;
 b=ulzZmSPxBN+i6NwRXiBRA6YdZ6uyhIWAo3jl4xkkc5V+a5VLUm3byoxeOIw2Q0N02t
 lvIfvD4N438jlfPzSpaSMCPPB8hb+6ABqYDy+33DF9cDp9+Y+u2ZJalkvaDZun0IzARN
 sC1k9MJWLlRxIfYlCm1itQo0J4/FNm0q+Xug8K2MvEobQSWVo2hZqKWpHvXOkg1YPD+U
 0pM7DibSWRIsDOqVWN+VvkGBCcmeBAqSyR58eIsIVsxOeRFljALbRJEW6p9iTdYE/HjE
 jZVCVChxaNb1I44hC4i4R5xzWCO+W0oQ+D0NXDXYdDwhPKsPeWM3zFR15XgyoA7+Brs0
 gMkg==
X-Gm-Message-State: AOAM533jDdfqBdKI7fiSjigtCCRnfjAtI4PNJFVsr9XGqSJmSSeShC7Z
 BTjsGKpQ2ctV3mIM5kzMk3bPJA==
X-Google-Smtp-Source: ABdhPJz3B8b/fHkcVhHNh/pEoU/jcb/7vLKk9kpdfzQ2KQQgMT3HCF2wn+oiQYR4k+z1aUBQIzJVXg==
X-Received: by 2002:a63:3714:: with SMTP id e20mr3792229pga.410.1610569906286; 
 Wed, 13 Jan 2021 12:31:46 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id bx17sm3834222pjb.12.2021.01.13.12.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 12:31:45 -0800 (PST)
Date: Wed, 13 Jan 2021 13:31:43 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210113203143.GA229796@xps15>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 00/16] introduce generic IOCTL
 interface for RPMsg channels management
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

Hi Arnaud,

[...]

> 
> Arnaud Pouliquen (16):
>   rpmsg: introduce RPMsg control driver for channel creation
>   rpmsg: add RPMsg control API to register service
>   rpmsg: add override field in channel info
>   rpmsg: ctrl: implement the ioctl function to create device
>   rpmsg: ns: initialize channel info override field
>   rpmsg: add helper to register the rpmsg ctrl device
>   rpmsg: char: clean up rpmsg class
>   rpmsg: char: make char rpmsg a rpmsg device without the control part
>   rpmsg: char: register RPMsg raw service to the ioctl interface.
>   rpmsg: char: allow only one endpoint per device
>   rpmsg: char: check destination address is not null
>   rpmsg: virtio: use the driver_override in channel creation ops
>   rpmsg: virtio: probe the rpmsg_ctl device
>   rpmsg: glink: add create and release rpmsg channel ops
>   rpmsg: smd: add create and release rpmsg channel ops
>   rpmsg: replace rpmsg_chrdev_register_device use
> 
>  drivers/rpmsg/Kconfig             |   8 +
>  drivers/rpmsg/Makefile            |   1 +
>  drivers/rpmsg/qcom_glink_native.c |  96 +++++++--
>  drivers/rpmsg/qcom_smd.c          |  59 +++++-
>  drivers/rpmsg/rpmsg_char.c        | 246 ++++++-----------------
>  drivers/rpmsg/rpmsg_ctrl.c        | 320 ++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |  14 --
>  drivers/rpmsg/rpmsg_ns.c          |   1 +
>  drivers/rpmsg/virtio_rpmsg_bus.c  |  38 +++-
>  include/linux/rpmsg.h             |  40 ++++
>  include/uapi/linux/rpmsg.h        |  14 ++
>  11 files changed, 606 insertions(+), 231 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

I am finally coming around to review this set.  I see that you already had an
extensive conversation with Bjorn - did you want me to have a look as well or
should I wait for the next revision?

Thanks,
Mathieu

> 
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
