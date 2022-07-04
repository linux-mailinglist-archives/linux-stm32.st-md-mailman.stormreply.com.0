Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 146C7565D2F
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jul 2022 19:48:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 932FCC640EF;
	Mon,  4 Jul 2022 17:48:54 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A13A2C640ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 17:48:52 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id r22so2547457pgr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Jul 2022 10:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Udd4R3ZrMYiNGLqIpE7ggk+XAAQ35MqvZZnbwebCtH0=;
 b=ywwgPuQETUb0XKgmY6N8kbYzlczDZlOgpvxcJbu5idjcakvBApLm8foq6ddCSFC0Ge
 Wk3scbhyna/+OwEM2m4e9YLbB9Ycc8Q3MjydiudyvccO+YCwADgPkHsn+kN1igv4inHs
 yqJxtUSgRPZcj3VbKRbdFj6wON/mjKxXVgdDpvkliicFFhqDTd8tX/NcKr0jQPNLVDmz
 f1s1HzI0LQb9rYKssLkBZmMLo2mMC25UB99OHAsi35DXkCUTAMj7vRZ0t3Zmz/3BAioK
 FKMYL129R2wm1paNi/n/ElkJe1rXisYE/XVGHSgsE3C4DhiyQOsSttc5gkM41X94i0LO
 KpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Udd4R3ZrMYiNGLqIpE7ggk+XAAQ35MqvZZnbwebCtH0=;
 b=WCsQq8/nLf+UgiSrLYJmK6Nm+ZeD0mdsFgHpIJaaLEQVA7HvKTnqtPsxPKMlsJ5EqW
 8qHRSXmdQYO+lF9o5cF8uVGvsb01boRQnqjTLblJ09A1gybmOqJK0tH5KteU+HncCf7O
 jNJOH09ubuXBGexrRRURaAub2XfiHKmbq1Bz1LdIxXzURDdiFgupzVXvUpqBfbc0LnIx
 Sp+scD3wfIyIRSaTyd0Mv21i9WOBz+svLo+P5BQ6qthHCd9uRRx9T8ozJWnGUFqRow4R
 KsiDBRNrICfw5EpIBJiLFKCDd0dSXUT8C1+ivWST2cxMl8UfXwVPd2JWOCupFcdBr7s2
 707Q==
X-Gm-Message-State: AJIora+ix3VjSzss9q//V7KtOQosb8vfpKQ9tzQ9GMThDr5SEPFUqGuO
 zPNOUekj3yJer0Vfo1d60a4S6g==
X-Google-Smtp-Source: AGRyM1uf4yCHruMaBFnncT3Rtuctls7yZWm6tVxELQFCsmBfuHdLgzQ/6Y8Qu5Zfe803boexULTN9w==
X-Received: by 2002:a63:8741:0:b0:411:6ef8:18ec with SMTP id
 i62-20020a638741000000b004116ef818ecmr26917433pge.258.1656956931272; 
 Mon, 04 Jul 2022 10:48:51 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a17090a8b8d00b001ec798b0dc4sm12986101pjn.38.2022.07.04.10.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 10:48:49 -0700 (PDT)
Date: Mon, 4 Jul 2022 11:48:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220704174847.GC2375750@p14s>
References: <20220603163158.612513-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603163158.612513-1-arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 0/4] remoteproc: restructure the
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

I have started reviewing this set.

Thanks,
Mathieu

On Fri, Jun 03, 2022 at 06:31:54PM +0200, Arnaud Pouliquen wrote:
> 1) Update from V5 [1]:
> 
> Updates based on Mathieu's comments.
> Updates are listed in the commit message of each patch.
> 
> [1] https://lkml.org/lkml/2022/4/6/597
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
>   remoteproc: core: Introduce rproc_rvdev_add_device function
>   remoteproc: core: Introduce rproc_add_rvdev function
>   remoteproc: Move rproc_vdev management to remoteproc_virtio.c
>   remoteproc: virtio: Create platform device for the remoteproc_virtio
> 
>  drivers/remoteproc/remoteproc_core.c     | 153 +++---------------
>  drivers/remoteproc/remoteproc_internal.h |  23 ++-
>  drivers/remoteproc/remoteproc_virtio.c   | 188 ++++++++++++++++++++---
>  include/linux/remoteproc.h               |   6 +-
>  4 files changed, 209 insertions(+), 161 deletions(-)
> 
> -- 
> 2.24.3
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
