Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4408F5159D1
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Apr 2022 04:40:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA16BC60494;
	Sat, 30 Apr 2022 02:40:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF211C5F1D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Apr 2022 02:40:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D4F9624D3;
 Sat, 30 Apr 2022 02:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 856F5C385AF;
 Sat, 30 Apr 2022 02:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651286412;
 bh=gJ66qBEwi6fImRHOzmZNTdLhzaPPZUa4anUgFG2RYFM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=qjRGdWUb2rVvisgnKlfUR8hwrLknIuM2HlB/jq5kkMqlo4jH7M2SQ86qXwvxRBxDp
 cT6aJRFCezr7IuWaW5NhqO9GLf85a5vwKjQFZnh73KGQu5SRqQcnjw+ydeCyJK1Iaa
 TBVeYEOGK/B0ZiO4wLz15EwzkGGvB8vIdzdHrCBgWpkjJz80B7ZLOJjd+qI9JuLNJb
 4A5CmZGxEx0+7fQFRQsffMU9mJdJKqEbDLENWQKPaeK5r6h0R2IVjL8jDiSdK+7Kpu
 g2SJThl9mCvCa+IIGhWyMhDhiR86JdgxjMgJp0yglmx2YZ1XhDWp41pazUBpcRGnbv
 8ex6IqJ2d9ayQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5FBCBF03847; Sat, 30 Apr 2022 02:40:12 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165128641238.32243.12546342277289932199.git-patchwork-notify@kernel.org>
Date: Sat, 30 Apr 2022 02:40:12 +0000
References: <20220428095716.540452-1-yangyingliang@huawei.com>
In-Reply-To: <20220428095716.540452-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: andrew@lunn.ch, davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 clabbe.montjoie@gmail.com, kuba@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-sun8i: add missing
 of_node_put() in sun8i_dwmac_register_mdio_mux()
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

On Thu, 28 Apr 2022 17:57:16 +0800 you wrote:
> The node pointer returned by of_get_child_by_name() with refcount incremented,
> so add of_node_put() after using it.
> 
> Fixes: 634db83b8265 ("net: stmmac: dwmac-sun8i: Handle integrated/external MDIOs")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> 
> [...]

Here is the summary with links:
  - net: stmmac: dwmac-sun8i: add missing of_node_put() in sun8i_dwmac_register_mdio_mux()
    https://git.kernel.org/netdev/net/c/1a15267b7be7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
