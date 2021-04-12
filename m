Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5A035D1A3
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 22:02:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFFD7C57B79;
	Mon, 12 Apr 2021 20:02:50 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C606C57B76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 20:02:50 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id l123so9883384pfl.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 13:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WVDXmeX52NfVN0DmkVlJtvmcxR3Npy2o/kss1K8CAaU=;
 b=VM5OO7HGLu6YFlVH4dlpvNPofEOfL9YasDMNEwSlAGZZT7jxKthbkCcEQIC5gNzULh
 aY9OuADEmOlDvM/9f7+Uk1ln8J02NJFqoVJ/ahaNWe7/YGpL1y1pc0qonBrflIq+0Lbt
 ZMwCXMbUa50IQF78qjUP1MrxgtbHXUErSXc6OhIp0LB6I7LqTfn27vD93uto3VXaj4BR
 NBiSmvjfJFGs66t2mXNlj25BtVKKfIQlcSJgVujI188ttZFIcQtHfUHxm6jFDT4RhAhL
 0xxH9gsTvRGcYvwR85p0aEyhkryrAF3kWPzkuJ8AVNgaxLADfM50PJcUW4A/6JGoqEp+
 z+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WVDXmeX52NfVN0DmkVlJtvmcxR3Npy2o/kss1K8CAaU=;
 b=dO4yNZ6EDMlaQeDY63VzPwWSG3BEkOy7ez70abyaepFdySHRK3buBnTHv1/nF1XemY
 Eed0aL6/sQlDe3aG9Fm+KxIQH6nPzUQBuJy5/jTQwfUjeXLnC5SwhZSTW8YOW7MP+WQa
 nCSXI4FMpjvDSIo7fErKum1uLIh3QZYdavuJBLkM+81kSha4wfUgKtHvx5J+4dhs2+Z6
 fAkCYr/HByk5yhJEXdQgaoRvsl69D22i8mQAf37e22VWcrfCQm3B896gqb9MShvnYE84
 4W/DsAe358+rUEXTgIaeo9rkDmsniQi9mwt5VgYYUQZ3rAQZB5yziO8qZ37SCm7U6Vea
 vdLg==
X-Gm-Message-State: AOAM532nOQowQUVvRBAqUkD677Xp0PfwwHXj9dQ8eTVIi5ebkbRYxT/h
 pOB/yUc+o6Udj97yw+ooyt2pHg==
X-Google-Smtp-Source: ABdhPJxt+z0aQNOGOH5sN6m+iEk0+U1kVtq0OY2gs8QNxDdq78Hc/a5yRUyvNMkBzn2BHsKtXpq0Kg==
X-Received: by 2002:a63:f926:: with SMTP id h38mr29530934pgi.257.1618257768578; 
 Mon, 12 Apr 2021 13:02:48 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id v123sm10493376pfb.80.2021.04.12.13.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 13:02:48 -0700 (PDT)
Date: Mon, 12 Apr 2021 14:02:45 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210412200245.GB582352@xps15>
References: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/7] Restructure the rpmsg char and
 introduce the rpmsg-raw channel
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

On Tue, Mar 23, 2021 at 01:27:30PM +0100, Arnaud Pouliquen wrote:
> This series is the second step in the division of the series [1]: 
> "Introducing a Generic IOCTL Interface for RPMsg Channel Management".
> 
> The purpose of this patchset is to:
> - split the control code related to the control
>   and the endpoint. 
> - define the rpmsg-raw channel, associated with the rpmsg char device to
>   allow it to be instantiated using a name service announcement.
>     
> An important point to keep in mind for this patchset is that the concept of
> channel is associated with a default endpoint. To facilitate communication
> with the remote side, this default endpoint must have a fixed address.
> 
> Consequently, for this series, I made a design choice to fix the endpoint
> on the "rpmsg-raw" channel probe, and not allow to create/destroy an endpoint
> on FS open/close.
> 
> This is only applicable for channels probed by the rpmsg bus. The behavior,
> using the RPMSG_CREATE_EPT_IOCTL and RPMSG_DESTROY_EPT_IOCTL controls, is
> preserved.
>   
> The next steps should be to correct this:
> Introduce the IOCTLs RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_DEV_IOCTL
> to instantiate the rpmsg devices
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523
> 
> Arnaud Pouliquen (7):
>   rpmsg: char: Export eptdev create an destroy functions
>   rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
>   rpmsg: Update rpmsg_chrdev_register_device function
>   rpmsg: char: Introduce __rpmsg_chrdev_create_eptdev function
>   rpmsg: char: Introduce a rpmsg driver for the rpmsg char device
>   rpmsg: char: No dynamic endpoint management for the default one
>   rpmsg: char: Return error if user try to destroy a default endpoint.
>

I am done reviewing this set.

Thanks,
Mathieu
 
>  drivers/rpmsg/Kconfig             |   9 ++
>  drivers/rpmsg/Makefile            |   1 +
>  drivers/rpmsg/qcom_glink_native.c |   2 +-
>  drivers/rpmsg/qcom_smd.c          |   2 +-
>  drivers/rpmsg/rpmsg_char.c        | 221 +++++++++-------------------
>  drivers/rpmsg/rpmsg_char.h        |  50 +++++++
>  drivers/rpmsg/rpmsg_ctrl.c        | 233 ++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |   8 +-
>  drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
>  9 files changed, 368 insertions(+), 160 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_char.h
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
