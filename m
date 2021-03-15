Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 737F933C168
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 17:16:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 211FBC57A41;
	Mon, 15 Mar 2021 16:16:20 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F349C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 16:16:17 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id s7so15549721plg.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=muAL2upUuz6v+2+0TJDwoZfgIjX6ldF6IKNapq38wEk=;
 b=AQiZLgWUAY60+K+ZxhA1mnXiByxNoarM0/Zqpic9tWpuVqVTo8mLtzcbRuQ/QkQ8VG
 aE4CgwtevCbSnt/xvv617+Ngq/RQNw41tgEJ8k7zHviMmuFP8/+2DaRlgFktmBCBjxFp
 O6fEVxSPhqHPPT1hMXVCE9gnflfbddcsdar4E6m6wkvFv/8ZDYgKdCfQ7hlc4ED+WgJg
 bgcQbJMc2z6oj9J5I5DUFjZO1grMjXPu9L1Mx2ugbyhLRdvAwFldXci9aH9+0m8rSkSp
 kynmdTEql5qUbxOfL22hZTGx9kcFHkbM8Ztf4g2wPaIDnheMEp2qS51BQgfQ8JlSy4V9
 VUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=muAL2upUuz6v+2+0TJDwoZfgIjX6ldF6IKNapq38wEk=;
 b=t+B/DlF+10e7PkZ1P5iFva7/WOjXIr1P3bCZ43NhRw8pMtVgdihshMz+/HyKv9bWiA
 SioKC0azQMMY6XoOJzx/93s8dGTHJxJKRc6bYrI5VQ/dIfQzIuw/vvT4oFJ6YVFW3ox6
 lyHpqC8E9v1co//7o5rAc+YQG0LmADMQNU7anDkxJ1eF3ZaGBbyS020VPm3p+2geVTHI
 DmeoZKoZZRfrWtlwap2Uy976KHpBZWE5m2EuKyl4EtBWhnQVfE0RUtq7/mIskY1k9vG3
 IPGajBdx2HGlf2zWf7g7Bda++DGZUjmvLqLjIJs0ElHxBqLy98pHdDkYq1Y3DcR0MpdC
 2Hng==
X-Gm-Message-State: AOAM531xG1Zmnbq59mDC8V8ybK/J7p5gS/wZ/jObKMg/u1ri8xk4FkLx
 nWa1nkRcFHLWpwocoa/mIeqABQ==
X-Google-Smtp-Source: ABdhPJwciyvgdwqvi9kuav2QG9KCDQrRQ18/UjTYDRbC4IM3R8GE3Q4RrqkuFPjEAWC/RCgZd5nYwA==
X-Received: by 2002:a17:902:b589:b029:e6:2875:aa4c with SMTP id
 a9-20020a170902b589b02900e62875aa4cmr12349277pls.71.1615824975948; 
 Mon, 15 Mar 2021 09:16:15 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id j22sm116013pjz.3.2021.03.15.09.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:16:15 -0700 (PDT)
Date: Mon, 15 Mar 2021 10:16:13 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20210315161613.GA1339147@xps15>
References: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311140413.31725-1-arnaud.pouliquen@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/6] rpmsg: enable the use of the
 rpmsg_char device for the Virtio backend
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

On Thu, Mar 11, 2021 at 03:04:07PM +0100, Arnaud Pouliquen wrote:
> This series is the first step in the division of the series: 
> "Introduce a generic IOCTL interface for RPMsg channels management"[1]
> 
> The main goal here is to enable the RPMsg char interface for
> the virtio RPMsg backend. 
> 
> In addition some patches have been includes in order to document the
> interface and rename the rpmsg_char_init function.
> 
> It also includes Mathieu Poirier's comments made on [1]
> 
> Patchsets that should be the next steps:
>  - Extract the control part of the char dev and create the rpmsg_ctrl.c
>    file
>  - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL to instantiate RPMsg devices
> 
> 
> [1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523
> 
> Arnaud Pouliquen (6):
>   rpmsg: char: Rename rpmsg_char_init to rpmsg_chrdev_init
>   rpmsg: Move RPMSG_ADDR_ANY in user API
>   rpmsg: Add short description of the IOCTL defined in UAPI.
>   rpmsg: char: Use rpmsg_sendto to specify the message destination
>     address
>   rpmsg: virtio: Register the rpmsg_char device
>   rpmsg: char: Return an error if device already open
> 
>  drivers/rpmsg/qcom_glink_native.c | 16 ++++++++
>  drivers/rpmsg/qcom_smd.c          | 16 ++++++++
>  drivers/rpmsg/rpmsg_char.c        | 11 ++++--
>  drivers/rpmsg/virtio_rpmsg_bus.c  | 62 ++++++++++++++++++++++++++++---
>  include/linux/rpmsg.h             |  3 +-
>  include/uapi/linux/rpmsg.h        | 13 ++++++-
>  6 files changed, 108 insertions(+), 13 deletions(-)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
