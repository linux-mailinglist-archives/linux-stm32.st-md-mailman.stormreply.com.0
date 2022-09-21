Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9015C052D
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Sep 2022 19:17:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC05AC0D2C2;
	Wed, 21 Sep 2022 17:17:34 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A0DAC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Sep 2022 17:17:33 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 s90-20020a17090a2f6300b00203a685a1aaso6619751pjd.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Sep 2022 10:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=gwqmC4NuHafj5NpjpfTWwfVlcLnp7YqgtXIYrZ8UvIU=;
 b=PiiyhcsWQFqUxuCDeFfp2lk9KFrX/5bsq/SThAtJAJJeNPohQT8R4aPO9yE3ANREP5
 FPI4EdUTTSZTbWChu4N4TkBqgoh5nAcrgHsoSZkxUscYLzH7zRJwBdNROG7kiwjaVHKr
 hz9Mw8e2R/+oJshVcYB1OfqTDMfSjLkhb+2EjerXVfQPMa6TPbfcH5ZS88G3yU7aSLb+
 cx2SSvmgbl1TrDM6o1UKLUsi9dOJAw2Shp9yWFvIcoIq0vFFC1owuYa8SohYqmSmuhx2
 SbzSKywgpC+/qoeTpHsk7ELOPyOsI2WY0kjafJDxpzbrmtSkZ2Pf0uUlNd37yyA5s93W
 TuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=gwqmC4NuHafj5NpjpfTWwfVlcLnp7YqgtXIYrZ8UvIU=;
 b=1d7nF49G7SSmJVCnv48bLkxxXZOCnhmkzhnU9vVOaw3Sy+KoUvjQhMy1H71YCZ4OPm
 pOVgUzcX1Sy4qJ3080reaX/eHwc+I10Oj4Ks4ZqO0cvcRWgfuuDwX0z2gtFo4tgW575w
 P8ZpRCKIaml5e6ANf0nuNU9qBRQ/mPUzqEz5vyrRk4XMYh9jYvV9r+SydBjUDSF4CVv6
 iXrjUKuPvt2l7aY2rzykSTOivwqg9Qf3gPNnkmFoyaRF4aDbngzgBcirV1X1FMv5E7MR
 yWWS7ZScdjpmz0wm2/EFAdt2+wmWmQ0gn6+PxzDn7bnSNEUbRc9g2V9MUM++/j1h+FHp
 xF/g==
X-Gm-Message-State: ACrzQf1YPkPPjMw/cjbivBeBYe/ggKmqrMOZgKPqkCRb0y6Mdqu1bNfF
 2r8eazAy9HiPHp6LUMsGoErZvA==
X-Google-Smtp-Source: AMsMyM6HjQC0QJUFVRU0D109G/8mdTe39kBwFGdqjBEKgxhohkXgiJ1Efms3jEjlBFGKmITF60u2KQ==
X-Received: by 2002:a17:902:f606:b0:172:6522:4bfc with SMTP id
 n6-20020a170902f60600b0017265224bfcmr5674724plg.133.1663780652546; 
 Wed, 21 Sep 2022 10:17:32 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a656496000000b0043be00f867fsm2123650pgv.60.2022.09.21.10.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 10:17:28 -0700 (PDT)
Date: Wed, 21 Sep 2022 11:17:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220921171726.GA1126145@p14s>
References: <20220921135044.917140-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220921135044.917140-1-arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-stm32] [PATCH v9 0/4] remoteproc: restructure the
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

On Wed, Sep 21, 2022 at 03:50:40PM +0200, Arnaud Pouliquen wrote:
> 1) Update from V8 [1]:
> 
> - rebase on for-next branch [2], to apply series on top of commit
>  7d7f8fe4e399 ("remoteproc: Harden rproc_handle_vdev() against integer overflow")
> 
> [1] https://lkml.org/lkml/2022/8/26/532
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/commit/?h=for-next&id=c81b67199cc4e2e4e8caf1abbbca1dc1b80bc642
> 
> 2) Patchset description:
> 
> This series is a part of the work initiated a long time ago in 
> the series "remoteproc: Decorelate virtio from core"[3]
> 
> Objective of the work:
> - Update the remoteproc VirtIO device creation (use platform device)
> - Allow to declare remoteproc VirtIO device in DT
>     - declare resources associated to a remote proc VirtIO
>     - declare a list of VirtIO supported by the platform.
> - Prepare the enhancement to more VirtIO devices (e.g I2C, audio, video, ...).
>   For instance be able to declare a I2C device in a virtio-i2C node.
> - Keep the legacy working!
> - Try to improve the picture about concerns reported by Christoph Hellwing [4][5]
> 
> [3] https://lkml.org/lkml/2020/4/16/1817
> [4] https://lkml.org/lkml/2021/6/23/607
> [5] https://patchwork.kernel.org/project/linux-remoteproc/patch/AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch/
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
> step 1: Redefine the remoteproc VirtIO device as a platform device
>   - migrate rvdev management in remoteproc virtio.c,
>   - create a remotproc virtio config ( can be disabled for platform that not use VirtIO IPC.
> step 2: Add possibility to declare and probe a VirtIO sub node
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
>  drivers/remoteproc/remoteproc_core.c     | 154 +++---------------
>  drivers/remoteproc/remoteproc_internal.h |  23 ++-
>  drivers/remoteproc/remoteproc_virtio.c   | 189 ++++++++++++++++++++---
>  include/linux/remoteproc.h               |   6 +-
>  4 files changed, 210 insertions(+), 162 deletions(-)

Applied

Thanks,
Mathieu

> 
> -- 
> 2.24.3
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
