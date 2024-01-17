Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E6583034B
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jan 2024 11:10:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD9C2C6B457;
	Wed, 17 Jan 2024 10:10:29 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44DBFC6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jan 2024 10:10:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E274DCE1BE3;
 Wed, 17 Jan 2024 10:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FF6CC43390;
 Wed, 17 Jan 2024 10:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705486224;
 bh=ltH2gx/NkmeSjFHTVwnNNG4AcsxsBQsX+VOOFImuNsE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Gs849v/xnktV+VT6AsLGVXoOWnaF2qjI5b7TxxlXAgEHz8EaiymWV63JIZgG00veL
 Or3IQejwT0l5fRVloJ6WcfCDwSTHHpbILxvnJtXsVxKPZVkFXGl5w5azujol/rWwr1
 GZ6SSB3IAPRl5rEyGNE48bd3q6/e86quWKvVH1WBuMZefts88BC3N+I1B8x+xPjow2
 7xLN4Tp2BLj1zm2kQulWhyyrxZ7U5yzonjbi1Jy5cmGvwTFQrcQahXhBaCv1n25M8n
 Dta3p4yEKWLEwahuoPnIpoAtQqMUIdbImY+WxULLx/Mr7rz3yOeyezCuUPlPhMyAG+
 0PmHINHf3DJrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8722BD8C971; Wed, 17 Jan 2024 10:10:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170548622454.19813.11293177026584189048.git-patchwork-notify@kernel.org>
Date: Wed, 17 Jan 2024 10:10:24 +0000
References: <20240116-prevent_dsa_tags-v6-1-ec44ed59744b@bootlin.com>
In-Reply-To: <20240116-prevent_dsa_tags-v6-1-ec44ed59744b@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: olteanv@gmail.com, rtresidd@electromag.com.au, pascal.eberhard@se.com,
 thomas.petazzoni@bootlin.com, andrew@lunn.ch, netdev@vger.kernel.org,
 linus.walleij@linaro.org, sylvain.girard@se.com,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 vladimir.oltean@nxp.com, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, miquel.raynal@bootlin.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v6] net: stmmac: Prevent DSA tags from
	breaking COE
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

On Tue, 16 Jan 2024 13:19:17 +0100 you wrote:
> Some DSA tagging protocols change the EtherType field in the MAC header
> e.g.  DSA_TAG_PROTO_(DSA/EDSA/BRCM/MTK/RTL4C_A/SJA1105). On TX these tagged
> frames are ignored by the checksum offload engine and IP header checker of
> some stmmac cores.
> 
> On RX, the stmmac driver wrongly assumes that checksums have been computed
> for these tagged packets, and sets CHECKSUM_UNNECESSARY.
> 
> [...]

Here is the summary with links:
  - [net,v6] net: stmmac: Prevent DSA tags from breaking COE
    https://git.kernel.org/netdev/net/c/c2945c435c99

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
