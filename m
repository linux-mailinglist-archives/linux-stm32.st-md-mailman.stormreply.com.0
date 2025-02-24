Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35292A42FA4
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 23:00:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D990CC78F89;
	Mon, 24 Feb 2025 22:00:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65EC9C78F63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 22:00:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F3C005C6CF8;
 Mon, 24 Feb 2025 21:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93592C4CED6;
 Mon, 24 Feb 2025 21:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740434399;
 bh=QJ6yGM33Uq3KSv4SQnLLE1QPSeX+HvMHB5AJdp87OT4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MOgJHU6OfhBTuNWGYBpN4QLCNtIs17/THkJ+6x6bx8RUfpOh7xdPbjpeENfeDA9Ky
 uecn4B8DXoySXeGB+nTKrv7bkPZm7h/t1g7fGr1wMu5v1p41AGlAlV+aD6Q+K/h5Q/
 W/KIkyAMAj9giaakzEasG8fEwLVkP0HDmoL1x9kk6VH1/FaNmfHyZxoI6RAzGlG4C/
 do2qowMpLI6zNCIhZmJhq71WliEwpbxBFVMtV0ecgHF4qeR7meDTgNhQ+cCEyDnZIB
 MQsXWK1EuZY29du1OeSjHNkIqmPzME5ejcvoMkbgGHF7utE2P4LTcbEZIoGDLQ/6CM
 CBz0QvKnTSgyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33D6F380CEDD; Mon, 24 Feb 2025 22:00:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174043443104.3623128.840309022243977791.git-patchwork-notify@kernel.org>
Date: Mon, 24 Feb 2025 22:00:31 +0000
References: <E1tlRMK-004Vsx-Ss@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tlRMK-004Vsx-Ss@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: qcom-ethqos: use
 rgmii_clock() to set the link clock
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

On Fri, 21 Feb 2025 11:38:20 +0000 you wrote:
> The link clock operates at twice the RGMII clock rate. Therefore, we
> can use the rgmii_clock() helper to set this clock rate.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 23 ++++---------------
>  1 file changed, 5 insertions(+), 18 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: qcom-ethqos: use rgmii_clock() to set the link clock
    https://git.kernel.org/netdev/net-next/c/98f992884333

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
