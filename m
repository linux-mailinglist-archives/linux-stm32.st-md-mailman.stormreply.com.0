Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 724A133FA86
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Mar 2021 22:40:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28F33C57B79;
	Wed, 17 Mar 2021 21:40:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D814C57B77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Mar 2021 21:40:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9C40664F2A;
 Wed, 17 Mar 2021 21:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616017207;
 bh=MykEbFec6VqdlLDN008GkifuEp5MxXO1ImpcmPxvoyY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=HbA2aH+OG7P30ugRkYaj1RsD+LN2bk1vQ6yO4mdpfr0kSM4nLFE0J8+hVZV9Yi2Ts
 yFjYeZ9QgOsXwB8fufp0KdKpL+xxV/axUvh/IYRf/rIhBg/U6pgKG6H1yMNqviD9W/
 T7bX1LMssqWQw1N01tvXLOImlkG9a9ilMUyD5BaZ85zum+ZLTsapInHzaz/AP6kNF9
 cg7eB9Y/ts/UBXHtczF4qxFzsF+OfJhaaqz1ZgecPdYF8EfR2k9ncNB6ErCkw+VZQ7
 yv0TdqM4SKEIzqm1iSvMcyeBK4Dwlj4wftbtPjSlBrAG8pejkg8WayAJWnV/MQd8MI
 9+MkcyvEocIKw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 925F760A60;
 Wed, 17 Mar 2021 21:40:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161601720759.5355.17806697288501319323.git-patchwork-notify@kernel.org>
Date: Wed, 17 Mar 2021 21:40:07 +0000
References: <20210317010123.6304-1-boon.leong.ong@intel.com>
In-Reply-To: <20210317010123.6304-1-boon.leong.ong@intel.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/1] net: stmmac: add per-q
	coalesce support
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

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 17 Mar 2021 09:01:22 +0800 you wrote:
> Hi,
> 
> This patch adds per-queue RX & TX coalesce control so that user can
> adjust the RX & TX interrupt moderation per queue. This is beneficial for
> mixed criticality control (according to VLAN priority) by user application.
> 
> The v2 patch has been tested (with added negative tests) and results from the
> output of the ethtool looks correct.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/1] net: stmmac: add per-queue TX & RX coalesce ethtool support
    https://git.kernel.org/netdev/net-next/c/db2f2842e6f5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
