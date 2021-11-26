Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D5F45E68B
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Nov 2021 04:30:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00DFCC5A4D4;
	Fri, 26 Nov 2021 03:30:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E38DC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Nov 2021 03:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 546EC6112F;
 Fri, 26 Nov 2021 03:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637897409;
 bh=GTT1ehgWI25ZSOWRHixiqqVgfEY61Uge6R/e5yv1jcU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Kvw6GgQPfrWL9pA7OHQXSzVQ9iAULXaxTUs3p9Hx8kiQkd4i3tzuqiKfTu/KsAxja
 IO2DzYNLPEA0btM/LFo2Op8JCBQxE/uN/w0XcjIbp4TyP2TYE/YLIdcX803gaNR9rh
 nhgwISY/msBGDzwec6QUXJevS520Khrp6xNqNKkqL5UfNRinEfGyX0KJsGxA2QeiOz
 +G+mB7JEaL/79hP2ccOcN3b1VOjLvc2tyHh9Pe6qXBJkxf4AKt/DMs9fXabrFrH7B1
 p/ndcWQUTM70p5tgeVu3CHZkI9IzKUTMJhv8tKoOQqdLRKhjWyarwGaVP2U7BXl8zI
 LCtiz8F15mvkA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 43CA160BCF;
 Fri, 26 Nov 2021 03:30:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163789740927.8117.11153473080203312776.git-patchwork-notify@kernel.org>
Date: Fri, 26 Nov 2021 03:30:09 +0000
References: <20211124114019.3949125-1-boon.leong.ong@intel.com>
In-Reply-To: <20211124114019.3949125-1-boon.leong.ong@intel.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org, kurt@linutronix.de,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: perserve TX and
 RX coalesce value during XDP setup
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

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 24 Nov 2021 19:40:19 +0800 you wrote:
> When XDP program is loaded, it is desirable that the previous TX and RX
> coalesce values are not re-inited to its default value. This prevents
> unnecessary re-configurig the coalesce values that were working fine
> before.
> 
> Fixes: ac746c8520d9 ("net: stmmac: enhance XDP ZC driver level switching performance")
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] net: stmmac: perserve TX and RX coalesce value during XDP setup
    https://git.kernel.org/netdev/net-next/c/61da6ac71570

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
