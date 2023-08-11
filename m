Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D73BD778498
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Aug 2023 02:40:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EA9AC6B469;
	Fri, 11 Aug 2023 00:40:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7F57C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Aug 2023 00:40:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B060565BB7;
 Fri, 11 Aug 2023 00:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E8FEC433CB;
 Fri, 11 Aug 2023 00:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691714423;
 bh=AxES2D/fGndvMKLCPqObZNt8VvTIG5vKlDN8rPWTa6g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=l5bQZVqBIkDaOzsFj1Z1Pr04+rjgxWr3xp3QsCCajgXwQmyE4ATLyNnxUcsy5Eo6t
 dbaf+n/PE3VgpRATvBmBitfK07n04kN8614vR53uMGlq3i0Amuf8X/FQ5g++rkiScs
 w8g0E7oGFqFxycTVfIqQTCwFO+lh1M2fTPDhc/OycMi7NxV/+EWNQa0FZyqFyF4Iml
 OplgTCINlaH+3E+Vqnhi+PlsYEDuDFcjON7CApuaDrCAlaUUyzQO0ITEmKM7yVuSop
 yEBUma0jYChxu1nYA+69NT/csznpXPFafST/P48G9HnhaWmDHyWIhaH7qTdTU+jvyO
 5YJiGYG0piN4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 84FB3C595D0; Fri, 11 Aug 2023 00:40:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169171442354.25552.8986058252469165360.git-patchwork-notify@kernel.org>
Date: Fri, 11 Aug 2023 00:40:23 +0000
References: <20230809020238.1136732-1-0x1207@gmail.com>
In-Reply-To: <20230809020238.1136732-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, horms@kernel.org, jpinto@synopsys.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 xfr@outlook.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/1] net: stmmac: xgmac: RX
 queue routing configuration
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  9 Aug 2023 10:02:38 +0800 you wrote:
> Commit abe80fdc6ee6 ("net: stmmac: RX queue routing configuration")
> introduced RX queue routing to DWMAC4 core.
> This patch extend the support to XGMAC2 core.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
> Changes in v3:
>   - Clean unused defines
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/1] net: stmmac: xgmac: RX queue routing configuration
    https://git.kernel.org/netdev/net-next/c/0c2910ae7fa0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
