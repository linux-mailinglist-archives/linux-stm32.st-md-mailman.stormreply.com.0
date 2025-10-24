Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A37A1C076C4
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 19:00:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6749FC5F1F0;
	Fri, 24 Oct 2025 17:00:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30B32C5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 17:00:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 33A99614B4;
 Fri, 24 Oct 2025 17:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F798C4CEF1;
 Fri, 24 Oct 2025 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761325235;
 bh=P30Amz6t4gClv82kJnXzJCEXNT49i1otAZuXWkHsM8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NuOyzL52sbbNkLTISaUiZcxVPMMcvE6/aTHVBAKCncbKyPyCpaTJbaelkUrzmIvHW
 /IQIIQH7hbBF2AjPQD68Pt4oJ7flSwE7WTcAmsTRXwZtluGJBM1hUtep1EscNVEtGw
 DYRvG672/gLhggR5E6rPmBLHOgHJ0I7vmRWesKniWEjE7PYFofpc114Sqd9bHnYefw
 YRVO6uihtxFDs4fa/4bV22aIP/BWlz6ieB2svEgOX2KesQ1bU3NzQaHK9ECvbm/oa4
 SFvLUUzabBni7gjMcjnMStoX+T31dDTY4yTdYVozPoXLDTCriC69BpwkCCFOXhlatN
 soVUdWoN86OOQ==
Date: Fri, 24 Oct 2025 18:00:30 +0100
From: Simon Horman <horms@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Message-ID: <aPuwrvGOgfBifrmC@horms.kernel.org>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
 <20251024-v6-12-topic-socfpga-agilex5-v5-2-4c4a51159eeb@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-2-4c4a51159eeb@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Teoh Ji Sheng <ji.sheng.teoh@intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 02/10] net: stmmac: Use interrupt mode
 INTM=1 for per channel irq
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

On Fri, Oct 24, 2025 at 01:49:54PM +0200, Steffen Trumtrar wrote:

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

...

> @@ -746,6 +750,22 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>  	if (stmmac_res->irq < 0)
>  		return stmmac_res->irq;
>  
> +	/* For RX Channel */
> +	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
> +		sprintf(irq_name, "%s%d", "macirq_rx", i);
> +		stmmac_res->rx_irq[i] = platform_get_irq_byname(pdev, irq_name);
> +		if (stmmac_res->rx_irq[i] < 0)
> +			break;
> +	}
> +
> +	/* For TX Channel */
> +	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
> +		sprintf(irq_name, "%s%d", "macirq_tx", i);
> +		stmmac_res->tx_irq[i] = platform_get_irq_byname(pdev, irq_name);
> +			if (stmmac_res->tx_irq[i] < 0)
> +				break;

nit: The two lines above abbove to be indented a bit too much.

> +	}
> +
>  	/* On some platforms e.g. SPEAr the wake up irq differs from the mac irq
>  	 * The external wake up irq can be passed through the platform code
>  	 * named as "eth_wake_irq"

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
