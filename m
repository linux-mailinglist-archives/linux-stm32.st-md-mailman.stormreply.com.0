Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F116A426C5B
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Oct 2021 16:06:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A430BC597B2;
	Fri,  8 Oct 2021 14:06:46 +0000 (UTC)
Received: from mail.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 035F2C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 14:06:43 +0000 (UTC)
Received: from localhost (unknown [149.11.102.75])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id 6A6604FEE346B;
 Fri,  8 Oct 2021 07:06:39 -0700 (PDT)
Date: Fri, 08 Oct 2021 15:06:31 +0100 (BST)
Message-Id: <20211008.150631.1431526603282542833.davem@davemloft.net>
To: hmz007@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20211008102410.6535-1-hmz007@gmail.com>
References: <20211008102410.6535-1-hmz007@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 27.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Fri, 08 Oct 2021 07:06:42 -0700 (PDT)
Cc: linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, broonie@kernel.org, alexandre.torgue@foss.st.com,
 lgirdwood@gmail.com, joabreu@synopsys.com, p.zabel@pengutronix.de,
 kuba@kernel.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: Add runtime PM
	support
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

From: hmz007 <hmz007@gmail.com>
Date: Fri,  8 Oct 2021 18:24:10 +0800

> Commit 2d26f6e39afb ("fix unbalanced pm_runtime_enable warnings")
> also enables runtime PM, which affects rk3399 with power-domain.
> 
> After an off-on switch of power-domain, the GMAC doesn't work properly,
> calling rk_gmac_powerup at runtime resume fixes this issue.
> 
> Fixes: 2d26f6e39afb ("net: stmmac: dwmac-rk: fix unbalanced pm_runtime_enable warnings")
> Signed-off-by: hmz007 <hmz007@gmail.com>

This patch does not apply to any of the networking trees.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
