Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE839B2D14A
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Aug 2025 03:19:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 084FCC36B29;
	Wed, 20 Aug 2025 01:19:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D473CC36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Aug 2025 01:19:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D1894584F;
 Wed, 20 Aug 2025 01:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D35C4CEF1;
 Wed, 20 Aug 2025 01:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755652761;
 bh=cjJRLW2sV4cFnb5HNArK4xCSZg33FLuESJ6vc/T4y5k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cyTHEKlRrdRQ1N62AOX3gs/46KVqddCnuOs/wFLM1W2Ng02c/2X0CX1eEbIgERXSQ
 /E53XK7ba39bRFUSW00l6LIpj/mlbgGXq5Aw7hRGZQVP7w0cY5tvTMQGCr3eTgHNNI
 yrrd7/Sux6QF8j8Me2YfV8qIwzgN+5Apuj93J2ym6b3FHC4wlPvvK3Hj/VN6DQ3fWQ
 p4RO7C/6MVu0GvXEeXRlbxaT3yLah8MOg1wpI0vOEnd6ZljHocO1a2qKQKLI7G1NRR
 I0jzZeE6ATgraaBHKp4jvExUeEd7bWGBub4U01XW+4q+xQ3ucUtjnm3MT8KH3uFPoi
 acdnyFpkpu0Qw==
Date: Tue, 19 Aug 2025 18:19:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Message-ID: <20250819181920.275f2827@kernel.org>
In-Reply-To: <20250816-xgmac-minor-fixes-v2-2-699552cf8a7f@altera.com>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
 <20250816-xgmac-minor-fixes-v2-2-699552cf8a7f@altera.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 rohan.g.thomas@altera.com, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/3] net: stmmac: xgmac:
 Correct supported speed modes
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

On Sat, 16 Aug 2025 00:55:24 +0800 Rohan G Thomas via B4 Relay wrote:
>  {
>  	u32 hw_cap;
>  
> +	struct stmmac_priv *priv = container_of(dma_cap, struct stmmac_priv,
> +						dma_cap);
> +
>  	/* MAC HW feature 0 */

nit: no empty lines between variable declarations and longest to
shortest, so:

 {
+	struct stmmac_priv *priv = container_of(dma_cap, struct stmmac_priv,
+						dma_cap);
 	u32 hw_cap;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
