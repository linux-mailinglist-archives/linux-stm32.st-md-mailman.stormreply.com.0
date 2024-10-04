Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6549A990562
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 16:08:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16B59C7802B;
	Fri,  4 Oct 2024 14:08:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1172DC78028
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 14:08:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A8A5F5C4AF8;
 Fri,  4 Oct 2024 14:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD08C4CEC6;
 Fri,  4 Oct 2024 14:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728050928;
 bh=RqtN0IiayrMqwFC0YAGSB1NwED1SqgkSMsUtIuQEZxQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tV50QnDtI0FPg/I2E+nUTsQhaqinxg4bvX6OxXRmtL3IM1ZB7+EhSfuy1+bpm1LHG
 rSenjrHbD51tCh/cJhmLWlyu4tdQNnT+gVYNd13Dn3zo8SfsNnd9UIU8YxqHda6NfR
 y1w5zzh2I7BlMTk3gAYFj1eEsezPrFI8tkzH9l8cnVMATQbweZ/Hx7e1pMfwVHYOIa
 ZCjfq+KRaB+Sz7LJUk1+sGIKm+8z+h7zibo7MTR5ZECCFXD2NVOcLChzmqUGX+DbvB
 D7B5sUPm/xA2nS5qVKGkKhG78osuWbhJq/9T1LkowVHDQgVRsVZYVAomYXz5cmPl3h
 9qKbBHUnLzJdg==
Date: Fri, 4 Oct 2024 07:08:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20241004070846.2502e9ea@kernel.org>
In-Reply-To: <28f05bbe-78f6-408a-ae53-c40f6a86eed9@nvidia.com>
References: <20240919121028.1348023-1-0x1207@gmail.com>
 <28f05bbe-78f6-408a-ae53-c40f6a86eed9@nvidia.com>
MIME-Version: 1.0
Cc: Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, Joao Pinto <jpinto@synopsys.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Furong Xu <0x1207@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Ong Boon Leong <boon.leong.ong@intel.com>, linux@armlinux.org.uk,
 Paolo Abeni <pabeni@redhat.com>, rmk+kernel@armlinux.org.uk,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: set
 PP_FLAG_DMA_SYNC_DEV only if XDP is enabled
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

On Tue, 1 Oct 2024 11:22:32 +0100 Jon Hunter wrote:
> We have noticed a boot regression in both -next and mainline v6.12-rc1. 
> Bisect is pointing to this commit. Reverting this commit fixes the problem.
> 
> This boot regression is seen on our Tegra234 Jetson AGX Orin platform 
> that uses the drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c driver. 
> We are booting with NFS and although the network interface does come up, 
> we fail to mount the rootfs via NFS.
> 
> So it would appear that we need to set this flag for this device. Any 
> thoughts?

This patch doesn't make sense to me. I'll send a revert shortly.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
