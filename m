Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 107859F71A4
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Dec 2024 02:19:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6A21C78012;
	Thu, 19 Dec 2024 01:19:26 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE844C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2024 01:19:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5207AA418B9;
 Thu, 19 Dec 2024 01:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301B1C4CECD;
 Thu, 19 Dec 2024 01:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734571157;
 bh=WgKrOQgc5+ve3ZEs3d+wbWdTrA44m5zY+NgdD/BDjKk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HekLFyLp4SrCKPmY5L8j2MeK+4ZuTsqK6fI8koG/ZKdSytND9ZyY44zwKlTOLUFWo
 UR0tJV37jgCFCdRoA5r+tAdWmEzAfJa8frBLSMr8iRuthRU67Cp9lutbr+/2b0YCqr
 LjI+e1eoMk323iyi5s4hy1ngIIaAaVFgpSFEnZc2Umml2fkLcaG+McO/xZUoodBFUl
 6fXxv2+YxOXMFoZcBbOS8lPV14Vic/iGrYptQ1Bn4iudzfK7UuTt7a+JZFoOwtAwT+
 H8mHUs8F3/JMIeSe73Y6Q2XuNZgZHQA2sSpK4ypoN0WyT3cw7FPG8SBYFRN1JKyJAT
 W9Zxccha2uS1A==
Date: Wed, 18 Dec 2024 17:19:16 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241218171916.24a7e24f@kernel.org>
In-Reply-To: <20241213030006.337695-1-0x1207@gmail.com>
References: <20241213030006.337695-1-0x1207@gmail.com>
MIME-Version: 1.0
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: TSO: Simplify
 the code flow of DMA descriptor allocations
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

On Fri, 13 Dec 2024 11:00:06 +0800 Furong Xu wrote:
> -		if (priv->dma_cap.addr64 <= 32)
> -			desc->des0 = cpu_to_le32(curr_addr);
> -		else
> -			stmmac_set_desc_addr(priv, desc, curr_addr);
> -
> +		stmmac_set_desc_addr(priv, desc, curr_addr);

I can't figure out if this is correct or not in a reasonable amount of
time. dwmac4 and dwxgmac2 looks pretty obviously okay. But there are
also ndesc and enh, which don't seem to map to platform in an obvious
way to an outside reviewer.

Please provide more context/guidance in the commit message, otherwise
this looks like a high risk refactoring for a driver this poorly
designed.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
