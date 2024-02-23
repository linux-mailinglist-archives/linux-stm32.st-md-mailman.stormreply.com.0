Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7CF860FF4
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Feb 2024 12:00:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86F17C6B460;
	Fri, 23 Feb 2024 11:00:32 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A760BC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Feb 2024 11:00:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 99937CE1F72;
 Fri, 23 Feb 2024 11:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCE31C43390;
 Fri, 23 Feb 2024 11:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708686028;
 bh=tuWmInSI6DkM2n3WzR2QPwKPQKk5MUUQvzBdHLanhIs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tdawGJ3z8z4VGpT/T+HOvULfSvcojHhWkXf8gj8Kn97b/jcTvAlAsTveAyfpPRByP
 peECZ2HGXzFrU6HZ1ioQWKXp6o4S289n5LNcNJLDKISqShBCZCBWrqYh4QEybDqP43
 +JV2QDenbAHKXSyKlElElu5GVpdcMeWxKemSqeN11F4TBxObEmGpUzY8TkCbjTdNkE
 fa/YYqGQcFH30yyzJ8fKpmAmjfcRwIMrau41FfGHfGAbx6k9L6/WB/hZsNvMtHX0eZ
 BmMZiMKUqzkuVbDi+Ll2RYdSExnooPgbxEgXqQYCji6gqygQOg5eDJQIy2PDDYgHQy
 vvQZlD1PfLqkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B1D42D990CB; Fri, 23 Feb 2024 11:00:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170868602872.17679.14029425242387308539.git-patchwork-notify@kernel.org>
Date: Fri, 23 Feb 2024 11:00:28 +0000
References: <20240220050735.29507-1-quic_snehshah@quicinc.com>
In-Reply-To: <20240220050735.29507-1-quic_snehshah@quicinc.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org, bhupesh.sharma@linaro.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, vkoul@kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 ahalaney@redhat.com
Subject: Re: [Linux-stm32] [PATCH net-next v5] net: stmmac:
 dwmac-qcom-ethqos: Add support for 2.5G SGMII
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

On Tue, 20 Feb 2024 10:37:35 +0530 you wrote:
> Serdes phy needs to operate at 2500 mode for 2.5G speed and 1000
> mode for 1G/100M/10M speed.
> Added changes to configure serdes phy and mac based on link speed.
> Changing serdes phy speed involves multiple register writes for
> serdes block. To avoid redundant write operations only update serdes
> phy when new speed is different.
> For 2500 speed MAC PCS autoneg needs to disabled. Added changes to
> disable MAC PCS autoneg if ANE parameter is not set.
> 
> [...]

Here is the summary with links:
  - [net-next,v5] net: stmmac: dwmac-qcom-ethqos: Add support for 2.5G SGMII
    https://git.kernel.org/netdev/net-next/c/a818bd12538c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
