Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83702A9114A
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Apr 2025 03:40:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BF40C78F94;
	Thu, 17 Apr 2025 01:40:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE90AC78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 01:40:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7946B4A3DA;
 Thu, 17 Apr 2025 01:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738D0C4CEEA;
 Thu, 17 Apr 2025 01:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744854027;
 bh=nKwR+3jYPBI/0L4UPSEMt8dNksHHNBW6YTloUwWu/5E=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=t3VTKc+3MIMpjnSv3Gt3L8oNdhinKffD6WdAgSSrzV9SR/eE/rpF/GK2KIwQp6x/U
 qHgteXKk8sn4S1259HB/hczQhVWQCLXn2BPOZ/r+opmoUhsfe4rBe792XIX+J7Q2S/
 cuhUptnMpc65Rb46G68QT6nZ5ZBbUs/k2nybjHt6QuwP/s7FHFpy3chrxxuIMIP6GI
 fOyKy9janZgxQXiNiz7l1yIz+ly2PBm9Mm2Xz9fxsATmhzkb0MYzSCYL/rSCEki1gL
 Rd1T411D1kGwTmuuHNRiaVSadN/OT4B0IE7zs+W3elqCHb9ac88Sqn4ANhjJHAPhd4
 81ucT5tGe1MgQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE3EA3822D5A; Thu, 17 Apr 2025 01:41:06 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174485406520.3559972.9842565280064480120.git-patchwork-notify@kernel.org>
Date: Thu, 17 Apr 2025 01:41:05 +0000
References: <E1u4dIh-000dT5-Kt@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u4dIh-000dT5-Kt@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: intel: remove
 unnecessary setting max_speed
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

On Tue, 15 Apr 2025 11:13:55 +0100 you wrote:
> Phylink will already limit the MAC speed according to the interface,
> so if 2500BASE-X is selected, the maximum speed will be 2.5G.
> Similarly, if SGMII is selected, the maximum speed will be 1G.
> It is, therefore, not necessary to set a speed limit. Remove setting
> plat_dat->max_speed from this glue driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: intel: remove unnecessary setting max_speed
    https://git.kernel.org/netdev/net-next/c/978d13b26ab3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
