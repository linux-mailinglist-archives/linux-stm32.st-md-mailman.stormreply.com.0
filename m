Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6CC4D4011
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Mar 2022 05:00:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B931C628A2;
	Thu, 10 Mar 2022 04:00:14 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77548C6049E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Mar 2022 04:00:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF704B8248C;
 Thu, 10 Mar 2022 04:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DCE6C340F4;
 Thu, 10 Mar 2022 04:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646884811;
 bh=6i4u6KwyCnCdAs0K5LYXId3Xf41NoIA1ge2xN62Ie18=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=UTbkDwlRsthrC+p2lEF62kZHiIWjE94JnFTZ3tygRL7/qhslJbY+bl+hLqL4g0CxF
 MCVyz8xk3YMWuFkgx+Uuq7Y3PhI0pFqru2QmXw0ml3t3lDPRNxfpibCGl2+gqZWkGR
 n8TwKClhrpigm1CTsIZwhfu8QDfiaGJqWYAy0I6BxPQpaE2HP7680CTjoenKtnnB/E
 ubFvZOPfUcyI9rc04yap76L187yp5XCtxyAZXK47RRXPbMu10Dz2NjYb92iAzE7K+N
 ycCUX0eozR/BJ8VBAXTMUVPm7L3oxUiMrhe+iVDgjius/omRwVF2kV/LzBQVw8F2u1
 GSOGGUMlXWKLA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 12A51E6D3DE; Thu, 10 Mar 2022 04:00:11 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164688481107.32652.14646023342949413674.git-patchwork-notify@kernel.org>
Date: Thu, 10 Mar 2022 04:00:11 +0000
References: <ee685745-f1ab-e9bf-f20e-077d55dff441@gmail.com>
In-Reply-To: <ee685745-f1ab-e9bf-f20e-077d55dff441@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: switch no PTP HW
 support message to info level
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

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 8 Mar 2022 19:42:57 +0100 you wrote:
> If HW doesn't support PTP, then it doesn't support it. This is neither
> a problem nor can the user do something about it. Therefore change the
> message level to info.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] net: stmmac: switch no PTP HW support message to info level
    https://git.kernel.org/netdev/net-next/c/1a21277190c7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
