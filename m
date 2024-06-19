Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3DB90EF89
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 15:57:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC320C6B460;
	Wed, 19 Jun 2024 13:57:16 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7157EC5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 13:57:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CB6DCCE1EF6;
 Wed, 19 Jun 2024 13:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31722C4AF09;
 Wed, 19 Jun 2024 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718805423;
 bh=TyaQfQKJsGMA8keYr1hp7wYXz2EM065ExSkm3viI+o0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R/deu9VxpmCRDGd5dFsoRTcU1BnrqE6yXALbINS2b8zmXpVUYfA3YwgZq9EoaSDWR
 Sdix+N/JuEfjl+pj/iryCgzyKNHeExXb2Gcl72tfy4ykcOPO3rV9STDfdpwNW0LprM
 mOv4pWKLZOZbEZMgKiSXmDX8Z0bjIL6qzBo7lED7N9fNEVaQEXdj+pqlUHYQj5QNX1
 I/4sQFs9LPuL9ktiDy8px+KyQDdDjGZaj+yWEvsLUYJRr7gFY4LyujuXG1KnooPZZy
 j6a7/vvEgYszliFfX3Yzfbj6/NGLRk3UhuGw6hyMh7ipeYdiMLqCtfj0Qps2RBDrzE
 zhxLBVbgeanAw==
Date: Wed, 19 Jun 2024 14:56:56 +0100
From: Simon Horman <horms@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Message-ID: <20240619135656.GG690967@kernel.org>
References: <20240617154516.277205-1-christophe.roullier@foss.st.com>
 <20240617154516.277205-3-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240617154516.277205-3-christophe.roullier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Jose Abreu <joabreu@synopsys.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH v2 2/2] net: stmmac: dwmac-stm32: stm32: add management of
 stm32mp25 for stm32
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

On Mon, Jun 17, 2024 at 05:45:16PM +0200, Christophe Roullier wrote:
> Add Ethernet support for STM32MP25.
> STM32MP25 is STM32 SOC with 2 GMACs instances.
> GMAC IP version is SNPS 5.3x.
> GMAC IP configure with 2 RX and 4 TX queue.
> DMA HW capability register supported
> RX Checksum Offload Engine supported
> TX Checksum insertion supported
> Wake-Up On Lan supported
> TSO supported
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>

The nit below notwithstanding, this looks good to me,
and appears to address review of earlier versions.

Reviewed-by: Simon Horman <horms@kernel.org>

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 77 ++++++++++++++++++-
>  1 file changed, 74 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c

...

> @@ -365,6 +423,9 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
>  		return err;
>  	}
>  
> +	if (dwmac->ops->is_mp2)
> +		return err;
> +

nit: As far as I understand things, the intention here is to return early,
     rather than to return an error. And err will always be 0.
     So it might be clearer to simply:

		return 0;

>  	dwmac->mode_mask = SYSCFG_MP1_ETH_MASK;
>  	err = of_property_read_u32_index(np, "st,syscon", 2, &dwmac->mode_mask);
>  	if (err) {

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
