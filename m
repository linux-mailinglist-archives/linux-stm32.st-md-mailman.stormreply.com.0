Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DEB32B959
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 18:00:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0154C57B64;
	Wed,  3 Mar 2021 17:00:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 585AAC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 17:00:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9F9DF64EDB;
 Wed,  3 Mar 2021 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614790807;
 bh=Mil5LgFuOfENcxXBygERChbAwjL72VEErPSFcEMtpQQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=TGQQzDQ2y5EmKRicBKCGuIVIX5HsB/y3DVursEK0MuFJT6GXxwWZiI33b32ZGOSk2
 jObZjUAi7RkrOwmdyRj8pinVpmP2WrQot6zoK+ijK4QN/rAArsSBNsuUTk1cvtw8Q4
 kE8NI5pH7g/s52C/CDgEe1MVx1vowNiFON4dqb/J3mi6NDvLzZbxvoGI6MLgBfKWRF
 VtwMZlu0ESq9fTthynzXJ3pkxbPLvG4943axAAcw+itCQKOX2B41MTdVQpmM+frhwf
 ejPeiZV3sBtM40Cf4C6AgXPVjsodlhmqtBPLiYwXfFYodssTi2F7a7cHWWP8pgkE+D
 GwdzvmlsF/FCQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 90E92609E2;
 Wed,  3 Mar 2021 17:00:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161479080758.4362.5083696684614235769.git-patchwork-notify@kernel.org>
Date: Wed, 03 Mar 2021 17:00:07 +0000
References: <20210303150840.30024-1-ramesh.babu.b@intel.com>
In-Reply-To: <20210303150840.30024-1-ramesh.babu.b@intel.com>
To: None <ramesh.babu.b@intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix incorrect DMA
 channel intr enable setting of EQoS v4.10
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

This patch was applied to netdev/net.git (refs/heads/master):

On Wed,  3 Mar 2021 20:38:40 +0530 you wrote:
> From: Ong Boon Leong <boon.leong.ong@intel.com>
> 
> We introduce dwmac410_dma_init_channel() here for both EQoS v4.10 and
> above which use different DMA_CH(n)_Interrupt_Enable bit definitions for
> NIE and AIE.
> 
> Fixes: 48863ce5940f ("stmmac: add DMA support for GMAC 4.xx")
> Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
> Signed-off-by: Ramesh Babu B <ramesh.babu.b@intel.com>
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: stmmac: fix incorrect DMA channel intr enable setting of EQoS v4.10
    https://git.kernel.org/netdev/net/c/879c348c35bb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
