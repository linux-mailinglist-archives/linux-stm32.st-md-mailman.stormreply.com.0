Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABD693B28B
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jul 2024 16:20:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B06A7C7129D;
	Wed, 24 Jul 2024 14:20:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A365C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jul 2024 14:20:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2FCB961211;
 Wed, 24 Jul 2024 14:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3A9CC32782;
 Wed, 24 Jul 2024 14:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721830831;
 bh=Rukc6O3TUn3kCoKQwcb17Ej01IDzKcNV/0uipcAAcgo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=egBKb/gFfr1FDU1kzhsbr04PujEoZb7qvTpIfRAqROUU9ItecReDuSCMd89l1097U
 /91iq2H794OQaaf+09WrojyHjhFB2lABA1yqSGgeRsSlkra0AqBljZZojOIfsxFBwv
 oywnreAfvgLOzHkr+NcRisBEjQABIQmlWEjfWwH6N//eiSH6Q3KFSotOF2Tl5qG60/
 jqEbTM9A+XZJSJA0O8WvwWrb9iIGA4lJDHeuT8ehtBEhv3u8XQSkB6ew56dhVqUZmH
 5R5eSPd4YzWgIo/M5V1lF26pjXlVSpnKISSsLbwK0x/hPTRNw2p3PSdJmzbUG08Wyb
 w0m/O2bBlp/cQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BFA97C43601; Wed, 24 Jul 2024 14:20:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <172183083178.11114.6015166451648250005.git-patchwork-notify@kernel.org>
Date: Wed, 24 Jul 2024 14:20:31 +0000
References: <20240723-stmmac-perfect-match-v1-1-678a800343b2@kernel.org>
In-Reply-To: <20240723-stmmac-perfect-match-v1-1-678a800343b2@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Correct byte order of
	perfect_match
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

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 23 Jul 2024 14:29:27 +0100 you wrote:
> The perfect_match parameter of the update_vlan_hash operation is __le16,
> and is correctly converted from host byte-order in the lone caller,
> stmmac_vlan_update().
> 
> However, the implementations of this caller, dwxgmac2_update_vlan_hash()
> and dwxgmac2_update_vlan_hash(), both treat this parameter as host byte
> order, using the following pattern:
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: Correct byte order of perfect_match
    https://git.kernel.org/netdev/net/c/e9dbebae2e3c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
