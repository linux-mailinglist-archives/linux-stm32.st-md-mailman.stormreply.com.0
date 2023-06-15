Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB5273227A
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jun 2023 00:10:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B82CC6A60E;
	Thu, 15 Jun 2023 22:10:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 243B2C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 22:10:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D472461F0D;
 Thu, 15 Jun 2023 22:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3357EC433C8;
 Thu, 15 Jun 2023 22:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686867021;
 bh=RZLiGCH1qdhSMndwaQxQgDZRZGsdxP72mh/YBckc+GE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=qbUPrEIeR7rEjexBT3bhE+02gQShNouW6O5TIA6hL+zl2aeFYq4ejKA/eUpTsziWD
 78saCJANrcB2oMSAVF/qvScR7iIDkoZ5h305SZcEZEp81p8sCnc2GDFalPItZcyGgj
 HtIJZGAlqhmLBtQUbJ2mhBSy2gdxDG7fn1eliGOdtyPsIKb89neKaJinsiwxauaQsi
 7ezLQOOKnbkJG0rDp4qsHur4u/Jx86GFJRl2vprbOyOrYqfGEtXHEB6KDBARhQABMK
 dBlj3Xc6fyKKbDoOxFzLDWakKe1D8RhK5HXOYKdtaV91Ngik1sYbmfJ7aTkR6GIv8N
 nvTgI84VYC8Vg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0C8B0C3274B; Thu, 15 Jun 2023 22:10:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168686702104.9701.257014821594710577.git-patchwork-notify@kernel.org>
Date: Thu, 15 Jun 2023 22:10:21 +0000
References: <20230614091714.15912-1-ansuelsmth@gmail.com>
In-Reply-To: <20230614091714.15912-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jose.Abreu@synopsys.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 stable@vger.kernel.org, linux@armlinux.org.uk, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net PATCH v2] net: ethernet: stmicro: stmmac:
 fix possible memory leak in __stmmac_open
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
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 14 Jun 2023 11:17:14 +0200 you wrote:
> Fix a possible memory leak in __stmmac_open when stmmac_init_phy fails.
> It's also needed to free everything allocated by stmmac_setup_dma_desc
> and not just the dma_conf struct.
> 
> Drop free_dma_desc_resources from __stmmac_open and correctly call
> free_dma_desc_resources on each user of __stmmac_open on error.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ethernet: stmicro: stmmac: fix possible memory leak in __stmmac_open
    https://git.kernel.org/netdev/net/c/30134b7c47bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
