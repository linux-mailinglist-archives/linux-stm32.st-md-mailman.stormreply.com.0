Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01258BE5C3F
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 01:10:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F169C57B66;
	Thu, 16 Oct 2025 23:10:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89690C57B61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 23:10:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1A58D40192;
 Thu, 16 Oct 2025 23:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B2AC4CEF1;
 Thu, 16 Oct 2025 23:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760656228;
 bh=7AUlS/E/OmspYWOQMifKYx2KW7NrQ6lvqhU6h0IwChE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=q0MLGu9zZFT+dmRt7e4efsxOyKWlLoPYupOEksSgrt8aMxyfl/jbIxtivbj8TNn5O
 v6x4BaqC3tPY6C1Io5g9D18XlWWvOvEOekiiTXVYAJxxYUTkRNEBk//Qs99X5kuAf+
 D3Fpzw/uA6A25M9e7UeaEWYxD/lBUmsy67+E0DdeE9lRHi31676/i1ZotqS4/XAS6n
 HJUrDW/cKNyiWBK36zT7IliROMXrft9r6ehusOKJqlgR1UBYKxyYYDmkuf27N7Bajc
 Ex8ez8sOUoMP5Gup9dUJt8ItnPWNV7iUk8SXO5UTbgiWJrV1WraKEANo08DVe4VhDU
 UDy5tacS3p/xA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33F553810902; Thu, 16 Oct 2025 23:10:13 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176065621200.1940287.10394518101609096808.git-patchwork-notify@kernel.org>
Date: Thu, 16 Oct 2025 23:10:12 +0000
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
In-Reply-To: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/5] net: stmmac: more cleanups
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

On Wed, 15 Oct 2025 17:09:07 +0100 you wrote:
> The subject for the cover message is wearing thin as I've used it a
> number of times, but the scope for cleaning up the driver continues,
> and continue it will do, because this is just a small fraction of the
> queue.
> 
> 1. make a better job of one of my previous commits, moving the holding
>    of the lock into stmmac_mdio.c
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] net: stmmac: dwc-qos-eth: move MDIO bus locking into stmmac_mdio
    https://git.kernel.org/netdev/net-next/c/12a7b7bc1427
  - [net-next,2/5] net: stmmac: place .mac_finish() method more appropriately
    https://git.kernel.org/netdev/net-next/c/0bc832a54d27
  - [net-next,3/5] net: stmmac: avoid PHY speed change when configuring MTU
    https://git.kernel.org/netdev/net-next/c/e82c64be9b45
  - [net-next,4/5] net: stmmac: rearrange tc_init()
    https://git.kernel.org/netdev/net-next/c/07d91ec99a8a
  - [net-next,5/5] net: stmmac: rename stmmac_phy_setup() to include phylink
    https://git.kernel.org/netdev/net-next/c/4a4094ba7ad2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
