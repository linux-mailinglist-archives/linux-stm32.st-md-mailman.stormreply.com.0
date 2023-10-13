Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 910747C8303
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Oct 2023 12:30:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46EE4C6B442;
	Fri, 13 Oct 2023 10:30:28 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A237CC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 10:30:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 34774B82A73;
 Fri, 13 Oct 2023 10:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8325DC433CB;
 Fri, 13 Oct 2023 10:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697193025;
 bh=wwKBCj+1hmngLDq3xWTr2aIZpq1KXGxcuekl/LhvyVU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jfY4FYnGp7HUmoQardzEnuaa3zbxSx4Pm096Y8X5SGk7AWDN3TQL3B+erJCEK3BhJ
 Jl1UdXr6+2YEHOcIQxUEMCk7ymSywL6eg+y3KLtEXFm1ATpGGY0aOMEZLfUPlSYJ63
 2y20g0uB8R0No03PVv9oTPBKCKZgZoS3pYw8aViY95D1nWu1+jWTtzFq6ch+P19gEm
 PXvVwFzlBx1Q2nWnNxtO44P+/v/m9rMdmh42Sz4ogq/EI9Em/D/GObPi15ww3aAASb
 kQj4tAExTfzp6ESOMv6JOYS4q9KkHfnhe5f09R7XHK+8Uk5+bsN63prQqTCS2E9Wd5
 I9OwsHfaJpNYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 65D76E1F66B; Fri, 13 Oct 2023 10:30:25 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169719302541.12798.2477725074861291176.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 10:30:25 +0000
References: <20231010172415.552748-1-j.zink@pengutronix.de>
In-Reply-To: <20231010172415.552748-1-j.zink@pengutronix.de>
To: Johannes Zink <j.zink@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix typo in comment
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

On Tue, 10 Oct 2023 19:24:15 +0200 you wrote:
> This is just a trivial fix for a typo in a comment, no functional
> changes.
> 
> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] net: stmmac: fix typo in comment
    https://git.kernel.org/netdev/net-next/c/895359b8c1e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
