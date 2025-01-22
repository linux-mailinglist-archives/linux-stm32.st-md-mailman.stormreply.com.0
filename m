Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB75A192A9
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jan 2025 14:35:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF3C9C78F7C;
	Wed, 22 Jan 2025 13:35:04 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27058C78F7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2025 13:34:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6F435A424ED;
 Wed, 22 Jan 2025 13:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227BBC4CED6;
 Wed, 22 Jan 2025 13:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737552895;
 bh=7DfnBrMHaBayCccsD/q52Q3ilgtaRdWdr/x3Gw0r2XY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kJpXlEyv7n9CG7ZRDA2nS+LWBnhs1o58kuVfKdat3ym/LC5WJVE5RRiXv4JLyu2DM
 2PAOPTBFQI/WaUx8B7/CWkSeD1S42ZpsuT5UcxvBdgG7SjhddajSxgZUUCcJIIx6lf
 ZkBJz7qMlR2Gslw1+daM2Io4wCJK9iYx5WUPfPqNHGtuVHp7Oqjsw+w3cDOxHCH7ly
 S+q1AoVrZLQ9HamDm9OLRTnnrz6BKzrtI5WOlc4ov5IxxR4xlFA6rIVOsc7LDj8EN3
 WmJVnW/2F1MuyzHQ++ag89h1Z++m0wlreyPh1/aNvJc4jXqdgdnYonsVvW4u4t4DLd
 7L7ySImQEMs9w==
Date: Wed, 22 Jan 2025 13:34:50 +0000
From: Simon Horman <horms@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Message-ID: <20250122133450.GI390877@kernel.org>
References: <20250121093703.2660482-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250121093703.2660482-1-chenhuacai@loongson.cn>
Cc: Chong Qiao <qiaochong@loongson.cn>, Feiyang Chen <chenfeiyang@loongson.cn>,
 Yanteng Si <si.yanteng@linux.dev>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Serge Semin <fancer.lancer@gmail.com>,
 loongarch@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-loongson: Set correct
 {tx, rx}_fifo_size
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

+ Feiyang Chen, Yanteng Si, Alexandre Torgue, Maxime Coquelin, Serge Semin,
  linux-arm-kernel

On Tue, Jan 21, 2025 at 05:37:03PM +0800, Huacai Chen wrote:
> Now for dwmac-loongson {tx,rx}_fifo_size are uninitialised, which means
> zero. This means dwmac-loongson doesn't support changing MTU, so set the
> correct tx_fifo_size and rx_fifo_size for it (16KB multiplied by channel
> counts).
> 
> Note: the Fixes tag is not exactly right, but it is a key commit of the
> dwmac-loongson series.
> 
> Cc: stable@vger.kernel.org
> Fixes: ad72f783de06827a1f ("net: stmmac: Add multi-channel support")
> Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Thanks, this change looks good to me.
And I agree that MTU setting cannot succeed without it.

Reviewed-by: Simon Horman <horms@kernel.org>

Some process notes regarding Networking patches to keep
in mind for next time.

1. Please set the target tree. In this case, as this is a fix
   for code present in net. In general, otherwise it would be net-next.

   Subject: [PATCH net] ...

2. Please generate a CC list using

   ./scripts/get_maintainer.pl this.patch

   The b4 tool can help with this.

Link: https://docs.kernel.org/process/maintainer-netdev.html

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index bfe6e2d631bd..79acdf38c525 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -574,6 +574,9 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>  	if (ret)
>  		goto err_disable_device;
>  
> +	plat->tx_fifo_size = SZ_16K * plat->tx_queues_to_use;
> +	plat->rx_fifo_size = SZ_16K * plat->rx_queues_to_use;
> +
>  	if (dev_of_node(&pdev->dev))
>  		ret = loongson_dwmac_dt_config(pdev, plat, &res);
>  	else
> -- 
> 2.47.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
