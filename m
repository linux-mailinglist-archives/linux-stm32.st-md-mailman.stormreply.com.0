Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B702961892
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 22:36:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B287FC6DD9A;
	Tue, 27 Aug 2024 20:36:00 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69BDEC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 20:35:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 95C4CA428DA;
 Tue, 27 Aug 2024 20:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBECC32786;
 Tue, 27 Aug 2024 20:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724790952;
 bh=OWYzOMG6g7t+0eoQkiYO5f3+n07R9zTk0dBvb/bLYf8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G+PMiXmfYwUXhJGsiUMlUFIpiNGLhwmcn4Yr2XR1okg6PP2b4RtiINnS3IFIFaqTP
 eTQ6CASU4KpS3HFZO+7+NVbN2phjKEnT25rGE0a32dO+xrRdDYf6X6rHp9J/K4s4iA
 bdh1jnMGGXKWUkL8nQVGONSdIr5J7Qf3Vy86ky6gFy4ZiuBHb2wcWqVJyYc7vNMmdn
 J+4pXNMZBfHUr6QDqlPmoVtGJZvoU9BZQFqm2Ojkv+qaIAsifF0bqetEBN6BGI1zr8
 ZC1k0XgStFmf1C+qy0qPhkb2VqnrxHjIiWZ5lEM9EiHsOQ6vuE7mkddrzEabqbn0lQ
 mB93V0Szmx4Bw==
Date: Tue, 27 Aug 2024 13:35:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Message-ID: <20240827133550.19c9eee4@kernel.org>
In-Reply-To: <20240823141318.51201-4-detlev.casanova@collabora.com>
References: <20240823141318.51201-1-detlev.casanova@collabora.com>
 <20240823141318.51201-4-detlev.casanova@collabora.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] ethernet: stmmac: dwmac-rk: Add
 GMAC support for RK3576
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

On Fri, 23 Aug 2024 10:11:15 -0400 Detlev Casanova wrote:
> +static void rk3576_set_to_rgmii(struct rk_priv_data *bsp_priv,
> +				int tx_delay, int rx_delay)
> +{
> +	struct device *dev = &bsp_priv->pdev->dev;
> +	unsigned int offset_con;
> +
> +	if (IS_ERR(bsp_priv->grf) || IS_ERR(bsp_priv->php_grf)) {
> +		dev_err(dev, "Missing rockchip,grf or rockchip,php-grf property\n");
> +		return;
> +	}

Seems like there's plenty of precedent in this file, but seems a little
strange that we just print a message and carry on, without returning an
error.

Would be better to return an error or add some info to the ops
struct, so that the caller can check if the correct (of the two)
regmaps are set
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
