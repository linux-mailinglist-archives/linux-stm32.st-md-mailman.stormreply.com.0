Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A82539590
	for <lists+linux-stm32@lfdr.de>; Tue, 31 May 2022 19:49:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D51BC5A4FD;
	Tue, 31 May 2022 17:49:40 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D96EBC03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 May 2022 17:49:38 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id e66so13485383pgc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 May 2022 10:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=up1pTeS33dg3ysfhUrkuWPpoOH7KplpGmQPpid3W8Mk=;
 b=Z18B8MqFP+Ck/tneEl0C52IfN/HxS4s5lO8n20qYuAd1S4G/Vf2OmCpZmca1UUqOrh
 QwMuPuU4Jsp7Mdnt6OhcTZhfz7C0eFfJ4053ttaB+cFMY8IseRTESyK/AdZx/2nYJ+EF
 Hpng4JICoqaOApCdboSO5NIVOeoZAqy2yW2u9Jwf9ySMDxA1tE2Zwh6lXtnsX6xmHzm9
 QetdRkNvYGcv7AsBFV9EqiK8S4LGpSYpgN8NHWxkJgV/vP4CteyJgXFOt+xeg8QROOVK
 U3eje+iymL7gtqTOc7UsEPzlB6jYQW65VABczcItabSpV+T3t0hH4n7phq4VPv2+IEyx
 BUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=up1pTeS33dg3ysfhUrkuWPpoOH7KplpGmQPpid3W8Mk=;
 b=2mAu2FDg6GxKMoub5+WmIB5OPO5Bafy9l6t1ikoTeaOsjRnnIz2ctX6I8+tWylxfsu
 8ewAH9eETA5/AxvNq0ONrSRe+0GDThreVgguJCz3CXw0o7UD+mXU6g9zbDjnSe3yNTad
 yLWSUdDFD4kg4JzzHgDNDPrWWZw08Dq4YPf0BmGs//hHDVi9khndQTV1fqLpQ4NiAdwM
 y1aFE9rRdKOKl/3r+OAiCLtrH8Ow+qtY8RZOmM80LDBHt5Qj1JzPXDs3ysfR1UqMlgUJ
 jAzzPPpA52mK9I6UW3Q6nFCngK5oMEuYRxc4jVF54KcJrXrkeMGej/7qlTXanmVrHldb
 dRFw==
X-Gm-Message-State: AOAM533jl+IT32DRvRzVROQAzV5NxcjxF5+5g2BF4/mEXcy4+XSGQkaO
 gQ4yqGAN4nxroa6Lk20J0lbd0g==
X-Google-Smtp-Source: ABdhPJwPT21CMLBCqelroEoxkIzSU+nUsU7b6/bESsnttsjXfdDRTNO1bxbXetVBX87qNMSYP2eo6Q==
X-Received: by 2002:a05:6a00:1792:b0:519:80a:9598 with SMTP id
 s18-20020a056a00179200b00519080a9598mr29316663pfg.10.1654019377442; 
 Tue, 31 May 2022 10:49:37 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a17090a7e9000b001e32824c452sm2147760pjl.40.2022.05.31.10.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 10:49:36 -0700 (PDT)
Date: Tue, 31 May 2022 11:49:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220531174933.GB531268@p14s>
References: <20220406095446.1187968-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406095446.1187968-1-arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RFC PATCH v5 0/4] remoteproc: restructure the
 remoteproc VirtIO device
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

I have started looking at this set.  Comments to follow in the coming days.

Thanks,
Mathieu

On Wed, Apr 06, 2022 at 11:54:42AM +0200, Arnaud Pouliquen wrote:
> 1) Update from V4 [1]:
> 
> Minor updates based on Mathieu's comments.
> Updates are listed in the commit message of each patch.
> 
> [1] https://lkml.org/lkml/2022/3/14/1177
> 
> 2) Patchset description:
> 
> This series is a part of the work initiated a long time ago in 
> the series "remoteproc: Decorelate virtio from core"[2]
> 
> Objective of the work:
> - Update the remoteproc VirtIO device creation (use platform device)
> - Allow to declare remoteproc VirtIO device in DT
>     - declare resources associated to a remote proc VirtIO
>     - declare a list of VirtIO supported by the platform.
> - Prepare the enhancement to more VirtIO devices (e.g I2C, audio, video, ...).
>   For instance be able to declare a I2C device in a virtio-i2C node.
> - Keep the legacy working!
> - Try to improve the picture about concerns reported by Christoph Hellwing [3][4]
> 
> [2] https://lkml.org/lkml/2020/4/16/1817
> [3] https://lkml.org/lkml/2021/6/23/607
> [4] https://patchwork.kernel.org/project/linux-remoteproc/patch/AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch/
> 
> In term of device tree this would result in such hierarchy (stm32mp1 example with 2 virtio RPMSG):
> 
> 	m4_rproc: m4@10000000 {
> 		compatible = "st,stm32mp1-m4";
> 		reg = <0x10000000 0x40000>,
> 		      <0x30000000 0x40000>,
> 		      <0x38000000 0x10000>;
>         memory-region = <&retram>, <&mcuram>,<&mcuram2>;
>         mboxes = <&ipcc 2>, <&ipcc 3>;
>         mbox-names = "shutdown", "detach";
>         status = "okay";
> 
>         #address-cells = <1>;
>         #size-cells = <0>;
>         
>         vdev@0 {
> 		compatible = "rproc-virtio";
> 		reg = <0>;
> 		virtio,id = <7>;  /* RPMSG */
> 		memory-region = <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>;
> 		mboxes = <&ipcc 0>, <&ipcc 1>;
> 		mbox-names = "vq0", "vq1";
> 		status = "okay";
>         };
> 
>         vdev@1 {
> 		compatible = "rproc-virtio";
> 		reg = <1>;
> 		virtio,id = <7>;  /*RPMSG */
> 		memory-region = <&vdev1vring0>, <&vdev1vring1>, <&vdev1buffer>;
> 		mboxes = <&ipcc 4>, <&ipcc 5>;
> 		mbox-names = "vq0", "vq1";
> 		status = "okay";
>         };
> };
> 
> I have divided the work in 4 steps to simplify the review, This series implements only
> the step 1:
> step 1:  redefine the remoteproc VirtIO device as a platform device
>   - migrate rvdev management in remoteproc virtio.c,
>   - create a remotproc virtio config ( can be disabled for platform that not use VirtIO IPC.
> step 2: add possibility to declare and probe a VirtIO sub node
>   - VirtIO bindings declaration,
>   - multi DT VirtIO devices support,
>   - introduction of a remote proc virtio bind device mechanism ,
> => https://github.com/arnopo/linux/commits/step2-virtio-in-DT
> step 3: Add memory declaration in VirtIO subnode
> => https://github.com/arnopo/linux/commits/step3-virtio-memories
> step 4: Add mailbox declaration in VirtIO subnode
> => https://github.com/arnopo/linux/commits/step4-virtio-mailboxes
> 
> Arnaud Pouliquen (4):
>   remoteproc: core: Introduce virtio device add/remove functions
>   remoteproc: core: Introduce rproc_register_rvdev function
>   remoteproc: Move rproc_vdev management to remoteproc_virtio.c
>   remoteproc: virtio: Create platform device for the remoteproc_virtio
> 
>  drivers/remoteproc/remoteproc_core.c     | 154 +++---------------
>  drivers/remoteproc/remoteproc_internal.h |  23 ++-
>  drivers/remoteproc/remoteproc_virtio.c   | 193 ++++++++++++++++++++---
>  include/linux/remoteproc.h               |   6 +-
>  4 files changed, 215 insertions(+), 161 deletions(-)
> 
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
