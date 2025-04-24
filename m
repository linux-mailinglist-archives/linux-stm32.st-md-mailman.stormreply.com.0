Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B31A9AD12
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 14:17:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1F60C7802F;
	Thu, 24 Apr 2025 12:17:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1A89C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 12:17:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 70AB15C639B;
 Thu, 24 Apr 2025 12:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E330AC4CEE3;
 Thu, 24 Apr 2025 12:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745497048;
 bh=Fa0JMJmKW07jw7qoCo4mzqLiB0/HwjaZUJP82v+kjAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sjii1C9YSuUdt8xaFxLkC9UA/BiBmfYthu1hg340GoNrnIBIyilWZYrgmN4uYkjSD
 R5DImLgX4b0nhROVBdLpK/T+AU1fijmW/phyzmqkq9VskN7jHVkFLGwbZHiMTj8jnk
 UXtFuZz9UlnRzCGuRBVk1YMPQTCMWrpr/1OvvqxiFiNRb6aczVLAzTFY4zZ/jhD2vG
 ntPPuctiWswMRDm10D8v5tFfM6OuD+mUQpIaRMCFfmxcMtyG+qClKm51w6hqngPTKd
 54IJ6YVrG7tMCyt6bQu0q/o9xZiSC0gjINFn9AVM0Idr1Tjna99tAB8s7trQWQsC/3
 XTVvWZfl9+uxA==
Date: Thu, 24 Apr 2025 13:17:21 +0100
From: Simon Horman <horms@kernel.org>
To: Boon Khai Ng <boon.khai.ng@altera.com>
Message-ID: <20250424121721.GF3042781@horms.kernel.org>
References: <20250421162930.10237-1-boon.khai.ng@altera.com>
 <20250421162930.10237-3-boon.khai.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250421162930.10237-3-boon.khai.ng@altera.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 G Thomas Rohan <rohan.g.thomas@altera.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mun Yew Tham <mun.yew.tham@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, bpf@vger.kernel.org,
 Tien Sung Ang <tien.sung.ang@altera.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v4 2/2] net: stmmac: dwxgmac2:
 Add support for HW-accelerated VLAN stripping
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

On Tue, Apr 22, 2025 at 12:29:30AM +0800, Boon Khai Ng wrote:
> This patch adds support for MAC level VLAN tag stripping for the
> dwxgmac2 IP. This feature can be configured through ethtool.
> If the rx-vlan-offload is off, then the VLAN tag will be stripped
> by the driver. If the rx-vlan-offload is on then the VLAN tag
> will be stripped by the MAC.
> 
> Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c

...

> @@ -69,6 +70,21 @@ static int dwxgmac2_get_tx_ls(struct dma_desc *p)
>  	return (le32_to_cpu(p->des3) & XGMAC_RDES3_LD) > 0;
>  }
>  
> +static u16 dwxgmac2_wrback_get_rx_vlan_tci(struct dma_desc *p)
> +{
> +	return (le32_to_cpu(p->des0) & XGMAC_RDES0_VLAN_TAG_MASK);

nit: The outer parentheses are not needed on the line above.

	return le32_to_cpu(p->des0) & XGMAC_RDES0_VLAN_TAG_MASK;


> +}

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
