Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A139C81A2
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 05:00:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82F17C78F98;
	Thu, 14 Nov 2024 04:00:26 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB7DBC78F98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 04:00:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 909C8A40F8E;
 Thu, 14 Nov 2024 03:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45061C4CED0;
 Thu, 14 Nov 2024 04:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731556817;
 bh=oFyEqg+Wi3bg6Jd+vWNtNIrKr6QAtBEfuLjYAZvCcL4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=mzlhoKEX4I76OAJB7pvtu5Ze2fcts8G9x8h3GSAoyP+KzoIy6C5/xzXwvJ9Ep05u8
 HGGXkG+jktDO8LFOvUNZU/ddThiPLLQDlOVwAYralL/jhT9CqiImtgl2iTHIo+V70c
 fzxkZwtkr2kIMratdRlGfnI66ekfT7VwI7UE9vqUig6MPC0qG++QT32oISGBRJFjAd
 pDKVCff+API3hcYNfNkJLWMGrQFtWcOYRbtB+u2toKx8cF5z1QdUFBARoLRVWMtYsH
 6zm+HjIMidPwri3aAOWhkZSvfP98AJ3cUysWAaaKz1N5NgtQioSJ7tQs7ry+U6kp7u
 3y6Nj1UQ1PI7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAEBF3809A80; Thu, 14 Nov 2024 04:00:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173155682775.1476954.16636894744432122406.git-patchwork-notify@kernel.org>
Date: Thu, 14 Nov 2024 04:00:27 +0000
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
In-Reply-To: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_=3Cnfraprado=40collabora=2Ecom?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
 =?utf-8?q?=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: edumazet@google.com, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 bartosz.golaszewski@linaro.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, ahalaney@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, biao.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v2 0/2] net: stmmac: dwmac-mediatek: Fix
 inverted logic for mediatek, mac-wol
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 09 Nov 2024 10:16:31 -0500 you wrote:
> This series fixes the inverted handling of the mediatek,mac-wol DT
> property. This was done with backwards compatibility in v1, but based on
> the feedback received, all boards should be using MAC WOL, so many of
> them were incorrectly described and didn't have working WOL tested
> anyway. So for v2, the approach is simpler: just fix the driver handling
> and update the DTs to enable MAC WOL everywhere.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] net: stmmac: dwmac-mediatek: Fix inverted handling of mediatek,mac-wol
    https://git.kernel.org/netdev/net/c/a03b18a71c12
  - [v2,2/2] arm64: dts: mediatek: Set mediatek,mac-wol on DWMAC node for all boards
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
