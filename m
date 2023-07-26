Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A93A4762978
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 05:50:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DF60C6A61A;
	Wed, 26 Jul 2023 03:50:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7454EC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 03:50:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3321F6119F;
 Wed, 26 Jul 2023 03:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99B32C43391;
 Wed, 26 Jul 2023 03:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690343419;
 bh=LlxH6m3gJxKW+Jx8L4JTmLBmIoATMBBpcofInJbVcIc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=l0Qv2afVZjK/quzpQaLNYWcbn60W+6jf9HhnGrtfPlGcRe2x1WF4CooGoHsI+UeR7
 i/9FKj5JuFz/6zVcLSz60v49AkPwFA686+hmi4DHcsx9Nq/gW/m/7qBv+kOIEL2mLZ
 AqhQEpxX3lc67FzXl8ETNoSSdWVNxMwum216BASWD1yFh48TRwudmCiQ3XyThr9WFF
 h89XcDjrRaS4WjhxEJ9fdtVeG+XwlsnJiJWELqtHpHjq7TtbNBhmyBRDvfZgKSm7XZ
 0te1FwoMkGAErHd4C/aBQ7QbfU6ubq1fYw9mOzFELzJ+8GOGzUEdCY2KUmV9neKz7m
 Yg9miv+KGTnXA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 68CDBE1F65A; Wed, 26 Jul 2023 03:50:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169034341942.4604.1855470719545245647.git-patchwork-notify@kernel.org>
Date: Wed, 26 Jul 2023 03:50:19 +0000
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
In-Reply-To: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
To: Johannes Zink <j.zink@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux@armlinux.org.uk, lkp@intel.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation
	delay
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

On Mon, 24 Jul 2023 12:01:31 +0200 you wrote:
> The IEEE1588 Standard specifies that the timestamps of Packets must be
> captured when the PTP message timestamp point (leading edge of first
> octet after the start of frame delimiter) crosses the boundary between
> the node and the network. As the MAC latches the timestamp at an
> internal point, the captured timestamp must be corrected for the
> additional path latency, as described in the publicly available
> datasheet [1].
> 
> [...]

Here is the summary with links:
  - [v2] net: stmmac: correct MAC propagation delay
    https://git.kernel.org/netdev/net-next/c/20bf98c94146

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
