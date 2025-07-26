Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B54B127C0
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Jul 2025 02:00:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DC45C36B3C;
	Fri, 25 Jul 2025 23:59:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D87FFC36B2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 23:59:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 74D0543C5B;
 Fri, 25 Jul 2025 23:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D3EC4CEE7;
 Fri, 25 Jul 2025 23:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753487997;
 bh=aWagL43nzO3VnFNpASht2nxBuHJFMqurTi8Xfa3eL1Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jesXExFDdeul9WCN5G39/ib4nkocPTDnI/yeEIpfsW8Lz+DJykYp2TOdeGmRjGptT
 x92BA46355IUA7dRi7Y8UMlSR36Pf2O0t1buP5Z9ZSRIea6lJu0LxYw0y8Tf4UDLEW
 FGMqBmM0WEu4R5RARdWHsW/B0kg9E1MxNu90rJ5XI4jFgmQWfCh3A+DSuwAizPP3zx
 tERKyuOmyQT6oOGb3dUneQaDjnjTWs7//Dmak4RGSTX3OGcV3PlqVreruRpxinVTrb
 okRPYR1MXiNUH18pMY5ZuKYOak2sSkk0apz9PeRdBXCCph5YfZlOE1Qy01gsYFRcUx
 +EhKf9EJ/C2jw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAC74383BF4E; Sat, 26 Jul 2025 00:00:15 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175348801475.3451765.4389353168084644772.git-patchwork-notify@kernel.org>
Date: Sat, 26 Jul 2025 00:00:14 +0000
References: <20250724154052.205706-1-matthew.gerlach@altera.com>
In-Reply-To: <20250724154052.205706-1-matthew.gerlach@altera.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 dinguyen@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] arm64: dts: socfpga: enable
 ethernet support for Agilex5
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

On Thu, 24 Jul 2025 08:40:47 -0700 you wrote:
> This patch set enables ethernet support for the Agilex5 family of SOCFPGAs,
> and specifically enables gmac2 on the Agilex5 SOCFPGA Premium Development
> Kit.
> 
> Patch 1 defines Agilex5 compatibility string in the device tree bindings.
> 
> Patch 2 defines the base gmac nodes it the Agilex5 DTSI.
> 
> [...]

Here is the summary with links:
  - [v2,1/4] dt-bindings: net: altr,socfpga-stmmac: Add compatible string for Agilex5
    https://git.kernel.org/netdev/net-next/c/92068a32f978
  - [v2,2/4] arm64: dts: Agilex5 Add gmac nodes to DTSI for Agilex5
    (no matching commit)
  - [v2,3/4] arm64: dts: socfpga: agilex5: enable gmac2 on the Agilex5 dev kit
    (no matching commit)
  - [v2,4/4] net: stmmac: dwmac-socfpga: Add xgmac support for Agilex5
    https://git.kernel.org/netdev/net-next/c/a5e290aab8fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
