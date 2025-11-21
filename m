Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5432BC76F60
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Nov 2025 03:10:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02D26C60460;
	Fri, 21 Nov 2025 02:10:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 907E0C597BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Nov 2025 02:10:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 29B8843C96;
 Fri, 21 Nov 2025 02:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F68C4CEF1;
 Fri, 21 Nov 2025 02:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763691049;
 bh=kvQa++p6gglRftEUktn9riubSNfwD3W32cZEi9pBAWY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Twk/p/gYlYP/EAWT4XmRrWKgonGQLRZk4KA6jUI/fJ6FBAjFd3oAePormezFh4aqF
 yYTovm5a3b3obx99AnDkhX+iIl6xdknkkqQJ4RDmVmFf1J+fbES1ATO2Uf/09y8oc/
 /4PSNZf2OqOVJk005Vj7PyDkJ/ghko3Hu3cvkWTCjN7TC3EKD1yp9zgSkRAEOpHDvo
 rK3dj3MFy/a2qMrFtB2aN2lX+KHvElo630SKk1mjt0JpbOJNCCmMZ+JqwcHmFuISu3
 6LFZIl+eUCBIt0qVE1cp8I5KnMJipdNnJmFOAAzLfw5yhbHqmPn1GP63R3hQoF/3bK
 WTYj4OE0xzPog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3553B3A41003; Fri, 21 Nov 2025 02:10:15 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176369101402.1860510.18224805167286449640.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 02:10:14 +0000
References: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
In-Reply-To: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/6] net: stmmac: simplify
	axi_blen handling
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 19 Nov 2025 10:22:32 +0000 you wrote:
> stmmac's axi_blen (burst length) handling is very verbose and
> unnecessary.
> 
> Firstly, the burst length register bitfield is the same across all
> dwmac cores, so we can use common definitions for these bits which
> platform glue can use.
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: stmmac: dwc-qos-eth: simplify switch() in dwc_eth_dwmac_config_dt()
    https://git.kernel.org/netdev/net-next/c/f7ac9a0bbe3f
  - [net-next,2/6] net: stmmac: move common DMA AXI register bits to common.h
    https://git.kernel.org/netdev/net-next/c/8c696659f47a
  - [net-next,3/6] net: stmmac: provide common stmmac_axi_blen_to_mask()
    https://git.kernel.org/netdev/net-next/c/2704af20c8e5
  - [net-next,4/6] net: stmmac: move stmmac_axi_blen_to_mask() to stmmac_main.c
    https://git.kernel.org/netdev/net-next/c/6ff3310ca282
  - [net-next,5/6] net: stmmac: move stmmac_axi_blen_to_mask() to axi_blen init sites
    https://git.kernel.org/netdev/net-next/c/e676cc8561c8
  - [net-next,6/6] net: stmmac: remove axi_blen array
    https://git.kernel.org/netdev/net-next/c/efd3c8cc52bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
