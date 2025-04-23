Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6C4A99BDE
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 01:14:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 944DAC7802C;
	Wed, 23 Apr 2025 23:14:45 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8119CC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 23:14:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C13D448EC;
 Wed, 23 Apr 2025 23:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECF0C4CEE2;
 Wed, 23 Apr 2025 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745450083;
 bh=NwPdaUZJAZ+ANYSzIVj7rk7f0HACGHmAdYi8K/KSyN4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=qv/8ndts6AWpsTgPCu6Jakxn7NPuQaBNcVpasq4/qTXXHgOztPsHznio1aG6RTyu8
 RMvihSJ6Fq7WoxvWIBVKu0WpJhChmGHvBFBAYP4VfvQQmicQrB9PHiDSdhknXcrt2g
 UrYbiS48yUDw6HqP0KKOQSP+WjFwZpTe5yjZ6YYk9RvAiv3nh/HaCO6f1pydRKvtRb
 MrnWYM4NqWimy7zxCACmzj02FJXdtTsCO7qPwb+/rsKC5ZIqGPXb1LxEIVAAogKRim
 kSywYzYlmcViwf38b11U2+DmxJTF/ecq3c63JXjUb2YzAg/WhkpQB8tJT8Rgvzoq5d
 hwsz4st979i6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADD63380CED9; Wed, 23 Apr 2025 23:15:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174545012150.2793299.8349789230420012979.git-patchwork-notify@kernel.org>
Date: Wed, 23 Apr 2025 23:15:21 +0000
References: <E1u7EYR-001ZAS-Cr@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u7EYR-001ZAS-Cr@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, treding@nvidia.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jonathanh@nvidia.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwc-qos: calibrate
 tegra with mdio bus idle
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

On Tue, 22 Apr 2025 15:24:55 +0100 you wrote:
> Thierry states that there are prerequists for Tegra's calibration
> that should be met before starting calibration - both the RGMII and
> MDIO interfaces should be idle.
> 
> This commit adds the necessary MII bus locking to ensure that the MDIO
> interface is idle during calibration.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: dwc-qos: calibrate tegra with mdio bus idle
    https://git.kernel.org/netdev/net-next/c/87f43e6f06a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
