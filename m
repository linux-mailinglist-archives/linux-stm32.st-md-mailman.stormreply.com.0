Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 454F495A3FF
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 19:37:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED599C6DD9D;
	Wed, 21 Aug 2024 17:37:45 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B7F2C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 17:37:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CF85ACE0A2A;
 Wed, 21 Aug 2024 17:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E72C4AF11;
 Wed, 21 Aug 2024 17:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724261855;
 bh=yzoAlBa7Gq7XplWHcp/NwfAfAm8mhCyPIfBsErv0xas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gZenRI8mrXmGOdE9wLzBrPC+GIuS/3NZMFBvcmYPDFXxRoeT0TMhEltitILBTWbF8
 gHAy4bAW6cCCFArl1qPgYVxLpwlWnE3zvUh9Gn7dWfwXja1Tzz4u+fgMmkuSRV13zO
 1sCnbUXxnr6sSH5tuulEutbHp61rWkLkqEyRz0W65MCIHkDdsjLuSLlWpU0UApnnmB
 GCZYmuMu1/CKMNeAd437EZ0a6ltMJlVn9TE5qzAJMJ0Z6RuBZoTvTfyzmapUrtiH4h
 n6e8ym0Zr45wayTUMeVfcb26aqaeNqHCZuh0NV//nuFXVCdJ7ov3AJafbi/raXkKYi
 avf0T5uLR8sRQ==
Date: Wed, 21 Aug 2024 18:37:30 +0100
From: Simon Horman <horms@kernel.org>
To: Ma Ke <make24@iscas.ac.cn>
Message-ID: <20240821173730.GD2164@kernel.org>
References: <20240821131949.1465949-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240821131949.1465949-1-make24@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, edumazet@google.com, netdev@vger.kernel.org,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 vkoul@kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 linux-arm-msm@vger.kernel.org, niklas.cassel@linaro.org, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Check NULL ptr on lvts_data
 in qcom_ethqos_probe()
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

On Wed, Aug 21, 2024 at 09:19:49PM +0800, Ma Ke wrote:
> of_device_get_match_data() can return NULL if of_match_device failed, and
> the pointer 'data' was dereferenced without checking against NULL. Add
> checking of pointer 'data' in qcom_ethqos_probe().
> 
> Cc: stable@vger.kernel.org
> Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Hi Ma Ke,

There is probably no need to repost just because of this.
But as a fix for Networking code it should be targeted at the net tree.

	Subject: [PATCH net] ...

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 901a3c1959fa..f18393fe58a4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -838,6 +838,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos->mac_base = stmmac_res.addr;
>  
>  	data = of_device_get_match_data(dev);
> +	if (!data)
> +		return -ENODEV;
> +

In this function dev_err_probe() is used, I assume in cases
where a function that returns an error does not emit any logs.

For consistency, perhaps that is appropriate here too?

>  	ethqos->por = data->por;
>  	ethqos->num_por = data->num_por;
>  	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
> -- 
> 2.25.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
