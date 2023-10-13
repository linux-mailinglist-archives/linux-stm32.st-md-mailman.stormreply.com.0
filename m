Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 255B97C8183
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Oct 2023 11:10:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0EE3C6A613;
	Fri, 13 Oct 2023 09:10:33 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0423CC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 09:10:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7CE92B82A0E;
 Fri, 13 Oct 2023 09:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E656CC433C7;
 Fri, 13 Oct 2023 09:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697188231;
 bh=B8lYkA1kPamuqAf5eh8eQ0KJkd4Qj0W/oYKqHpLM10Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bHv9mnG3XUJr463BvJ1+jdjLVK2KXDQKvB0jw9VicIhuPc0BJOmJLt5pSO6YvgCpR
 G5oouGWKurnNaZmQTd4wke7jMEDpETGR/io383U4XeydOGjj/xVERft15H9whGPwl9
 Ml2ibLnKTarUPMMK92uXu9IIblZkzQJVp07uLE5SLR76s+7Lk7ownFt/8O3dxWiiw7
 pHPiLjIQytfayvkTJYMS0h9hOx6ZMQncuu2M29zV8fOlgRzL3sNwA7GQrylh/oP799
 TzvUXZ5Bz7SRERoF7xC0TrN3DU2iJuxPXHecAUP9/TTYQAeuTQ7dym+Fn3XoUKPdnk
 G5X8QetVbl5wA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CA988E1F66B; Fri, 13 Oct 2023 09:10:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169718823082.32613.17417632202490226710.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 09:10:30 +0000
References: <20231009145904.3776703-1-ben.wolsieffer@hefring.com>
In-Reply-To: <20231009145904.3776703-1-ben.wolsieffer@hefring.com>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-stm32:
	refactor clock config
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
by David S. Miller <davem@davemloft.net>:

On Mon,  9 Oct 2023 10:59:04 -0400 you wrote:
> Currently, clock configuration is spread throughout the driver and
> partially duplicated for the STM32MP1 and STM32 MCU variants. This makes
> it difficult to keep track of which clocks need to be enabled or disabled
> in various scenarios.
> 
> This patch adds symmetric stm32_dwmac_clk_enable/disable() functions
> that handle all clock configuration, including quirks required while
> suspending or resuming. syscfg_clk and clk_eth_ck are not present on
> STM32 MCUs, but it is fine to try to configure them anyway since NULL
> clocks are ignored.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: dwmac-stm32: refactor clock config
    https://git.kernel.org/netdev/net-next/c/4d177f499665

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
