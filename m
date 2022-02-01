Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5114A56F3
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Feb 2022 06:30:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D393CC60460;
	Tue,  1 Feb 2022 05:30:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56189C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Feb 2022 05:30:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EBC661482;
 Tue,  1 Feb 2022 05:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76FC5C340ED;
 Tue,  1 Feb 2022 05:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643693410;
 bh=dxEhLGAPfFYwIotfbOYPoy4k4Qz/Kx96ise1IMTcyt0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=t5L/DMcEzt7y7M83xvCtYxJB8+8saFwOWuLb4s9elYiPDKg8yepthvUwhcLYv44Tl
 jeZrATqOp02TlsjHuF3SBFgbWILBa+XQKQO9E6GEISBVhphhBSjGqUXroyRIK0UhQ0
 0YWsJCu5jqKSx/B5a++we/YRilyAlpbLeJlzCVzhy86YnOqst4l5HRYb663YgyNO3E
 /iypf0Hp0FwWOZMP6b7y+wycZNSrfbj8xYKHHf5r2A7PKTmITHnsIFG4ikCVxO+869
 ZqExCkE2YCK6fIbIwTYmUFQZxleyglYwCBUtW1W0WiITdYFGCzy5nYQDpXOznfbHGt
 uKB+atzQdPa7g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5678FE5D08C; Tue,  1 Feb 2022 05:30:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164369341035.4704.10544082245464060928.git-patchwork-notify@kernel.org>
Date: Tue, 01 Feb 2022 05:30:10 +0000
References: <20220131083841.3346801-1-camel.guo@axis.com>
In-Reply-To: <20220131083841.3346801-1-camel.guo@axis.com>
To: Camel Guo <camel.guo@axis.com>
Cc: linux-kernel@vger.kernel.org, camelg@axis.com, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com,
 clabbe.montjoie@gmail.com, joabreu@synopsys.com, kernel@axis.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: dump gmac4 DMA registers
	correctly
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

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 31 Jan 2022 09:38:40 +0100 you wrote:
> From: Camel Guo <camelg@axis.com>
> 
> Unlike gmac100, gmac1000, gmac4 has 27 DMA registers and they are
> located at DMA_CHAN_BASE_ADDR (0x1100). In order for ethtool to dump
> gmac4 DMA registers correctly, this commit checks if a net_device has
> gmac4 and uses different logic to dump its DMA registers.
> 
> [...]

Here is the summary with links:
  - [v2] net: stmmac: dump gmac4 DMA registers correctly
    https://git.kernel.org/netdev/net/c/7af037c39b60

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
