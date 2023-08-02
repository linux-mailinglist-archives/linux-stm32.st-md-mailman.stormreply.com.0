Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F0976C908
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Aug 2023 11:10:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D298EC6A5FB;
	Wed,  2 Aug 2023 09:10:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FE6FC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Aug 2023 09:10:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56EB5618B6;
 Wed,  2 Aug 2023 09:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5431C433C9;
 Wed,  2 Aug 2023 09:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690967421;
 bh=hbDe5VNi38FyeWM4a+GIOVZBfB/pl/EA2dNFf0kspKA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LILAmfCcKmjnLEa6a7zoHJV4NNoC/3R5pI140X8qm1Aa341LJkF6ADGfO3G+ZKdm0
 zUtlAtZyTPARpDVmmNY2jDYML1XmI6jdLJydm4e1H/6noyeNVO2D6utXCo8pmk0asD
 3vCq7OgVFgdP+aa/DyYySpGGAEt059sPtr/Xf8cmbEaMHa6h+60yGyDU3oW5pt+2bC
 89gCN6siVRjt5vo3RfpWbFDnzWAuEam7eFiriArdZDLtWk93d6qi1ttyFuTGgBF9TY
 JmtzeEcyoNWBgTvitnD5Q9fpTLcaRen6z735GkYMHoag5yeTSC23XpXueUpqhe5Jvp
 FX4TsoZWIgeEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 82491C6445B; Wed,  2 Aug 2023 09:10:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169096742152.32235.5074570655625825451.git-patchwork-notify@kernel.org>
Date: Wed, 02 Aug 2023 09:10:21 +0000
References: <20230731-topic-oxnas-upstream-remove-v3-0-a1bddb085629@linaro.org>
In-Reply-To: <20230731-topic-oxnas-upstream-remove-v3-0-a1bddb085629@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: andy@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-oxnas@groups.io, krzysztof.kozlowski+dt@linaro.org, arnd@arndb.de,
 netdev@vger.kernel.org, linus.walleij@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, conor.dooley@microchip.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, daniel@makrotopia.org,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/2] net: ethernet: dwmac:
	oxnas glue removal
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
by David S. Miller <davem@davemloft.net>:

On Mon, 31 Jul 2023 16:41:09 +0200 you wrote:
> With [1] removing MPCore SMP support, this makes the OX820 barely usable,
> associated with a clear lack of maintainance, development and migration to
> dt-schema it's clear that Linux support for OX810 and OX820 should be removed.
> 
> In addition, the OX810 hasn't been booted for years and isn't even present
> in an ARM config file.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] net: stmmac: dwmac-oxnas: remove obsolete dwmac glue driver
    https://git.kernel.org/netdev/net-next/c/a67fa91130ca
  - [net-next,v3,2/2] dt-bindings: net: oxnas-dwmac: remove obsolete bindings
    https://git.kernel.org/netdev/net-next/c/6d7d66ac9ce1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
