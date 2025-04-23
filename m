Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47796A97CBD
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 04:19:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3597C78F63;
	Wed, 23 Apr 2025 02:19:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEEE9C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 02:19:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 67853614B8;
 Wed, 23 Apr 2025 02:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7268BC4CEE9;
 Wed, 23 Apr 2025 02:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745374789;
 bh=PmqJ5fbv0Mb9f8TlIqRagmhuSF46zrJ7usQ1IDVuaXQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nfcvWSodfR9C9TKP3Gi15gNNyd4MIUK7B2Qgrdtr4CpFYjzCYQ4dispyNAct3JVnb
 POFVgOA6ZBsQ+tKt9hFpfCStJ5CIx8m4hzGp8+0C0kwB1tV7MsEZYLg/luOUrYBTpL
 QPosVAOjBf37Oyco78m4AD8++24zmFkRTZGJ7L3w2QYNerdHHif1x9OXxR1yMfc+81
 nHN2SM4gDqpigTm/TP1UcYnGZ40C8Z+FCPFVoIUpU4GZWHXdjsfE4TVlbQYQuVTch3
 XsLTTIdWXqwBv/+6n0AVJJb7mkAdc3HzrP2UB3UggSZACiHBB3M//OL3TKq6DObdQl
 tg+1dA4c7xIUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33D86380CEF4; Wed, 23 Apr 2025 02:20:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174537482800.2117251.2809618036505175108.git-patchwork-notify@kernel.org>
Date: Wed, 23 Apr 2025 02:20:28 +0000
References: <E1u5SiQ-001I0B-OQ@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u5SiQ-001I0B-OQ@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v3] net: stmmac: visconti:
 convert to set_clk_tx_rate() method
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 17 Apr 2025 18:07:54 +0100 you wrote:
> Convert visconti to use the set_clk_tx_rate() method. By doing so,
> the GMAC control register will already have been updated (unlike with
> the fix_mac_speed() method) so this code can be removed while porting
> to the set_clk_tx_rate() method.
> 
> There is also no need for the spinlock, and has never been - neither
> fix_mac_speed() nor set_clk_tx_rate() can be called by more than one
> thread at a time, so the lock does nothing useful.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: stmmac: visconti: convert to set_clk_tx_rate() method
    https://git.kernel.org/netdev/net-next/c/21b01cb8e88e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
