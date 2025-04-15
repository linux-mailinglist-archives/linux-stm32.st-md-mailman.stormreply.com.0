Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6868A890E0
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 02:50:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FC5CC78F7B;
	Tue, 15 Apr 2025 00:50:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26401C78F75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 00:50:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8907343B0E;
 Tue, 15 Apr 2025 00:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564C8C4CEE2;
 Tue, 15 Apr 2025 00:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744678200;
 bh=W6GdVISjXNNNfTPg1VWXU+iBRCd39F1D5CkWm+qTSxg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XCIWK2vpFxsGuS6nbZfIV3V5Zki+V3bEKonR5gV06bw4Brn33H/4cM3d4ZHJ+POek
 l8qS8aLAtwqgL4DBCAVcwGzGCZh/Kx/ZdIGS+pagwNwnM3St0uwGzOBUK5o5f4AwEU
 Blgm3fghvpvjiWX7bRcjFVQgTqadKlZIHEU0tsFFReZhzstP/cCdZfCrrYODT985kZ
 +7SSFYs81XyKdRCOKMwVi1VGGk4qBCLg5ZVFkkneBTv5leOPAWNRhYXJu5WlP6H+QL
 4bsbIk+gLsr3lP278fIP9yUwQkr2xmss814Mb8b2DjoybfbJzngL5FIa/k+gO6gtbt
 ejj+GoH6/RW+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70C623822D1A; Tue, 15 Apr 2025 00:50:39 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174467823825.2089736.3756695494399689904.git-patchwork-notify@kernel.org>
Date: Tue, 15 Apr 2025 00:50:38 +0000
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
In-Reply-To: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/4] net: stmmac: qcom-ethqos:
	simplifications
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 12 Apr 2025 15:09:51 +0100 you wrote:
> Remove unnecessary code from the qcom-ethqos glue driver.
> 
> Start by consistently using -> serdes_speed to set the speed of the
> serdes PHY rather than sometimes using ->serdes_speed and sometimes
> using ->speed.
> 
> This then allows the removal of ->speed in the second patch.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] net: stmmac: qcom-ethqos: set serdes speed using serdes_speed
    https://git.kernel.org/netdev/net-next/c/b4589810082a
  - [net-next,2/4] net: stmmac: qcom-ethqos: remove ethqos->speed
    https://git.kernel.org/netdev/net-next/c/a3d54648ada2
  - [net-next,3/4] net: stmmac: qcom-ethqos: remove unnecessary setting max_speed
    https://git.kernel.org/netdev/net-next/c/4c30093f784e
  - [net-next,4/4] net: stmmac: qcom-ethqos: remove speed_mode_2500() method
    https://git.kernel.org/netdev/net-next/c/0d1c18a10dd1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
