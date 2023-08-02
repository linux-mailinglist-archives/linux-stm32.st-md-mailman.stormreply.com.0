Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAB376C843
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Aug 2023 10:20:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7960C6A5FA;
	Wed,  2 Aug 2023 08:20:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06992C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Aug 2023 08:20:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6B636188A;
 Wed,  2 Aug 2023 08:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 054BCC433CC;
 Wed,  2 Aug 2023 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690964423;
 bh=VuSMhTQ/OQWlzez2CcMsKBO1M8l3TUcs11autt3WxxM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ove5y8kF9dvVQqA4LTEn+xRUq88JSCOg7OGORbQgR9CnbvgVYQpO7YFM9Q5Y3Zgga
 yLFcZu+lcdkfsxx5MmsXOx7AbV8K0/cgTd1gspZavkVnAAuptv/ZrM1nqh4kQ5qMYR
 7nIuJ+/j9ZSZapwIwi7mXMue7aAnOKn8cekBBzNy2ZQQTW3YTt+dSeIgGGjyxWOx8n
 FxZCQemhjPwlMoHGET/7qdcmIp1qFrsnEdHgNQeRSYBOZS4iTDoi30IYBpzOfAJO/m
 qBnI7QeTJhv7twnlkpsY1CJ7hn5iM0taYYQzyOtzVUKygRayGgUqTGae9t92peH3An
 i0wb+nC+HOvpA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E039FE270D2; Wed,  2 Aug 2023 08:20:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169096442291.23876.736146422814364637.git-patchwork-notify@kernel.org>
Date: Wed, 02 Aug 2023 08:20:22 +0000
References: <20230731115041.13893-1-rohan.g.thomas@intel.com>
In-Reply-To: <20230731115041.13893-1-rohan.g.thomas@intel.com>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: XGMAC support for
	mdio C22 addr > 3
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

On Mon, 31 Jul 2023 19:50:41 +0800 you wrote:
> For XGMAC versions < 2.2 number of supported mdio C22 addresses is
> restricted to 3. From XGMAC version 2.2 there are no restrictions on
> the C22 addresses, it supports all valid mdio addresses(0 to 31).
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  1 +
>  .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 36 ++++++++++++-------
>  2 files changed, 25 insertions(+), 12 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: XGMAC support for mdio C22 addr > 3
    https://git.kernel.org/netdev/net-next/c/10857e677905

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
