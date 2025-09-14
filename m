Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A13B56B55
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Sep 2025 20:40:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 448AEC3F938;
	Sun, 14 Sep 2025 18:40:10 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B3B3C3F931
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Sep 2025 18:40:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DA907601A9;
 Sun, 14 Sep 2025 18:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA79C4CEF1;
 Sun, 14 Sep 2025 18:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757875207;
 bh=YieT40UUJGq33KYU6kqgUp5hNH+j4q3y+c8x9dfZKSI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=AEiY5IJyCBvKp5SFmrw9R3Ld8gUZhhaZLJpAyli3NTlg1zp8qmByc0FjidSZy+O23
 y+TN7mR8rYpW9PJrTO/tFTR9wIokRxb/80u4VDGNAOZFEJQglgib91C7vRkhDROSaH
 8DnXF8PQ7ES4aPlP8qpfKvkxx/2RH/wN80qKJF5KirSFhTauyPDZjr1lXAgBa3+Jiv
 2y6T56wj52TGAYWKP0Kmh6FWnpdOcn1tEGB6KOc1KQK48gtpN4y6PopQ5PhQyreqJe
 ZVZtYYAvHQL6IzBqxd+ZLgDFuosA79V00dReDKONnsmbTsa1YKTcuHZxsCy7scdD0t
 QGbEa59BgbHDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70E9F39B167D; Sun, 14 Sep 2025 18:40:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175787520925.3525025.295266235162136621.git-patchwork-notify@kernel.org>
Date: Sun, 14 Sep 2025 18:40:09 +0000
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: geert+renesas@glider.be, vladimir.oltean@nxp.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 magnus.damm@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 biju.das.jz@bp.renesas.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 andrew+netdev@lunn.ch, p.zabel@pengutronix.de, krzk+dt@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/3] Add GMAC support for
 Renesas RZ/{T2H, N2H} SoCs
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

On Mon,  8 Sep 2025 11:58:58 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This series adds support for the Ethernet MAC (GMAC) IP present on
> the Renesas RZ/T2H and RZ/N2H SoCs.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and RZ/N2H SoCs
    https://git.kernel.org/netdev/net-next/c/d43ce9822349
  - [net-next,v3,2/3] net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
    https://git.kernel.org/netdev/net-next/c/264c26934f75
  - [net-next,v3,3/3] net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC
    https://git.kernel.org/netdev/net-next/c/57e9e4d7023a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
