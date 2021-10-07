Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9D7424B28
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Oct 2021 02:33:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8194C597B3;
	Thu,  7 Oct 2021 00:33:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C1E8C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Oct 2021 00:33:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 823BF6101A;
 Thu,  7 Oct 2021 00:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633566814;
 bh=3okcXnxuE+BIfBFhHPL9nH1JgO502cHg6RX5wSZqz0w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KT/s7fKOw/53IUEt2hL1Vdmsl/j4O+98tcLHkBudkcniF/rQHQ4oxrLrx6O1R7tYp
 nGpE45zWJ02NGxPffiRoYwAHe8l2YLkrwzbY996ojb4SlfeHvQESQYlrSp+JekieB5
 XNcVGfn5RlWp+dcsQi5k52NV/PrkbSfSp63vG+SKWL621q43O4OW3p9N6DyYyLOJKW
 yFBpL35KsMLQNmn/uDX+C2PWICr+a/2pq04lqlG/A25bf/cZfWuLBLNuDjJk+DoDqQ
 ge9QsVT9v4WKPd7KbqHyCGuuKS8pPyMSYULQxG/o8LBqtp5RsvVwIe6OrLLg0huCP1
 QSluOf7t/07dg==
Date: Wed, 6 Oct 2021 17:33:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Message-ID: <20211006173332.7dc69822@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <YV3Hk2R4uDKbTy43@monolith.localdoman>
References: <YV3Hk2R4uDKbTy43@monolith.localdoman>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 netdev@vger.kernel.org, broonie@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 lgirdwood@gmail.com, joabreu@synopsys.com, michael.riesch@wolfvision.net,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [BUG RESEND] net: stmmac: dwmac-rk: Ethernet
 broken on rockpro64 by commit 2d26f6e39afb ("net: stmmac: dwmac-rk: fix
 unbalanced pm_runtime_enable warnings")
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

On Wed, 6 Oct 2021 16:58:11 +0100 Alexandru Elisei wrote:
> Resending this because my previous email client inserted HTML into the email,
> which was then rejected by the linux-kernel@vger.kernel.org spam filter.
> 
> After commit 2d26f6e39afb ("net: stmmac: dwmac-rk: fix unbalanced
> pm_runtime_enable warnings"), the network card on my rockpro64-v2 was left
> unable to get a DHCP lease from the network. The offending commit was found by
> bisecting the kernel; I tried reverting the commit from v5.15-rc4 and the
> network card started working as expected.

We have this queued up in netdev/net:

aec3f415f724 ("net: stmmac: dwmac-rk: Fix ethernet on rk3399 based devices")

It should hit stable soon.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
