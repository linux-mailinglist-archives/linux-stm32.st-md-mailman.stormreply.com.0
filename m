Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8889F9C85
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Dec 2024 23:01:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 493CAC78032;
	Fri, 20 Dec 2024 22:01:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCE6AC78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Dec 2024 22:01:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4FD265C2C39;
 Fri, 20 Dec 2024 22:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692D1C4CECD;
 Fri, 20 Dec 2024 22:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734732101;
 bh=AkFDAdGYAZwPeNowaJnnrFIGrNYl4SvJvDqNGrtVyz0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ccldjYSCWo3h4pBQ/H2a51CJtIf7U6/juaE7A2hALoReQSwu5EewRZmcj8/HW+h+1
 QouWXU1V1ojauyov52If7lyWaUeLy43qTd/8IubpqdihyLgI6yrGjNQsYdu6/YCMU7
 7qE4KdHk2Lbjw9OMTCAlA9q2ShVYBtUJBHviN8eIXr6JjIXP/Ij/G3IQazvgzf/RV5
 km7LKxoAwVflzPFfDl4h8gkdZlrMkA/52bQOKYQcAyGEAjaiJ/wHGs+0TBuvfD97ft
 sD8tQCiRYGfDGDhTIaqyEUL0w7p5mZQGow/mSZz3RPPGBnKPjyJuAHc/+y+O2G24RJ
 F5LHN29NQ0iLw==
Date: Fri, 20 Dec 2024 14:01:39 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mathieu Othacehe <othacehe@gnu.org>
Message-ID: <20241220140139.5c0cee2f@kernel.org>
In-Reply-To: <20241217084942.4071-1-othacehe@gnu.org>
References: <20241217084942.4071-1-othacehe@gnu.org>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: dwmac-imx: add imx93 clock input
 support in RMII mode
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

On Tue, 17 Dec 2024 09:49:42 +0100 Mathieu Othacehe wrote:
> +			ret = regmap_update_bits(dwmac->intf_regmap,
> +						 dwmac->intf_reg_off +
> +						 MX93_GPR_CLK_SEL_OFFSET,
> +						 MX93_GPR_ENET_QOS_CLK_SEL_MASK,
> +						 0);

nit: regmap_clear_bits() ?
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
