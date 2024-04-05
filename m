Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEB089933B
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Apr 2024 04:40:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84CBCC6B47E;
	Fri,  5 Apr 2024 02:40:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71319C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 02:40:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF85A6179E;
 Fri,  5 Apr 2024 02:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3780AC43399;
 Fri,  5 Apr 2024 02:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712284830;
 bh=Axh9FcoK3VYcCgrbRb02lLAG5Sv0+YQdR5I1p+8CItQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=T4KOQAZOhSgZNcQ1dJiyeze9QmmAuEhT9hafKGlnPvNPyhSXznSPVYm41/n2QzEpt
 Mwhe2Zx3fRvqTZ54Ovqt9ABBHHL82/6mCB011Gqip2IIaqp0ejh+aUNpn0S0amQT67
 L4JmLyhZPVFmaMllQbIegnJ2j1/ALjb9pEN+vstN5uS5o+hFB8hQRJDQ4nzAwr7wyk
 fgCEkdwMODxmfDnQtXCGEsgQqKEgPs2Z8/j5V4dG8NThJ5/QPibxt3c7fGCiFB6G/t
 uujN2vHeENtb4/sLWaHqCgC4WU17EtADBKgOf46hh4yUjIMZ14cridMY1R6R9NNCLX
 32uq2aqKlcPRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 18928D84BAE; Fri,  5 Apr 2024 02:40:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171228483009.11871.14072192832057973325.git-patchwork-notify@kernel.org>
Date: Fri, 05 Apr 2024 02:40:30 +0000
References: <20240403100549.78719-1-chunhau.tan@starfivetech.com>
In-Reply-To: <20240403100549.78719-1-chunhau.tan@starfivetech.com>
To: ChunHau Tan <chunhau.tan@starfivetech.com>
Cc: kernel@esmil.dk, edumazet@google.com, jszhang@kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 bartosz.golaszewski@linaro.org, jeeheng.sia@starfivetech.com,
 u.kleine-koenig@pengutronix.de, kuba@kernel.org, pabeni@redhat.com,
 ahalaney@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, leyfoon.tan@starfivetech.com,
 rmk+kernel@armlinux.org.uk, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, horms@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v6 0/1] Add StarFive JH8100 dwmac support
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

On Wed,  3 Apr 2024 03:05:48 -0700 you wrote:
> Add StarFive JH8100 dwmac support.
> The JH8100 dwmac shares the same driver code as the JH7110 dwmac
> and has only one reset signal.
> 
> Please refer to below:
> 
>   JH8100: reset-names = "stmmaceth";
>   JH7110: reset-names = "stmmaceth", "ahb";
>   JH7100: reset-names = "ahb";
> 
> [...]

Here is the summary with links:
  - [v6,1/1] dt-bindings: net: starfive,jh7110-dwmac: Add StarFive JH8100 support
    https://git.kernel.org/netdev/net-next/c/1a9de5646559

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
