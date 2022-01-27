Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A1049E3F5
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jan 2022 15:00:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB05EC60466;
	Thu, 27 Jan 2022 14:00:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E671C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jan 2022 14:00:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7DC2361CBB;
 Thu, 27 Jan 2022 14:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA906C340E4;
 Thu, 27 Jan 2022 14:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643292010;
 bh=eAQ+ZorpGKfk4YxTRRSwqowyR4Lpeus8/2L3UKJOzZo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nSMs0A6NL8HjicXZzgtpULYnN79C9GmBoywO4GZb/wVKQir7e7uBC42ZmI4pkrSMV
 OcjyQk3iiPu3I38X2Y18Gwlgrk/Gdbuhe/ce452/sWd87j0PWQJEzACKrhIdIV57oq
 jJZZvwQazUIqveW1TjnMdUiMUXiMxqMp8Ty+TUMcVoyEVF7IYpFKW8Sw9XIAje3D0I
 CwBdEIeynUwwePlKs5eX/af2Aj3D8WLwv6Mi61ISa3YdULBNl+4OYg7LjAtiCesXFw
 ov19CjGF59BDENZIGJqsxUbTHP9sQralxSPiZk0+C7cXLbM5bmIbvskTVlLp7ETd82
 8nJ7D0RjXOjtA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B3552E5D07E; Thu, 27 Jan 2022 14:00:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164329201072.13469.12879802019146922568.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jan 2022 14:00:10 +0000
References: <20220126094723.11849-1-mohammad.athari.ismail@intel.com>
In-Reply-To: <20220126094723.11849-1-mohammad.athari.ismail@intel.com>
To: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@st.com,
 weifeng.voon@intel.com, vee.khee.wong@intel.com, netdev@vger.kernel.org,
 chenhuacai@kernel.org, alexandre.torgue@foss.st.com, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, boon.leong.ong@intel.com,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 0/2] Fix PTP issue in stmmac
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

This series was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed, 26 Jan 2022 17:47:21 +0800 you wrote:
> This patch series to fix PTP issue in stmmac related to:
> 1/ PTP clock source configuration during initialization.
> 2/ PTP initialization during resume from suspend.
> 
> Mohammad Athari Bin Ismail (2):
>   net: stmmac: configure PTP clock source prior to PTP initialization
>   net: stmmac: skip only stmmac_ptp_register when resume from suspend
> 
> [...]

Here is the summary with links:
  - [net,1/2] net: stmmac: configure PTP clock source prior to PTP initialization
    https://git.kernel.org/netdev/net/c/94c82de43e01
  - [net,v3,2/2] net: stmmac: skip only stmmac_ptp_register when resume from suspend
    https://git.kernel.org/netdev/net/c/0735e639f129

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
