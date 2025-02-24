Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6965A43031
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 23:40:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 552F1C78F89;
	Mon, 24 Feb 2025 22:40:15 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C591C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 22:40:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 438E3611FA;
 Mon, 24 Feb 2025 22:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB35C4CEE8;
 Mon, 24 Feb 2025 22:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740436813;
 bh=7OgwWkTR+dw0Tqyw5er0axNmGjTr5b4RO9FTtda++rA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=iSC1h7n9mcw5ovxEzPZs4Uit31UD3bCjZoIPvv3lAw64A/6SFv8JGEEORBdklogVy
 6YstAptx6WthKu6FTXizx1bXkfqld/MGj39fd4sGptLWkxtgvsP+vkPPje226ePUNt
 aM8oBbmuFScQh4LlovzNFE6N7SJGGz8ZK9r2UCr+AT7G5BHxrRu2SIUxG7HK7hqcHq
 nBM59H433UDJqN/nRACN4w9shW1pXQ0hV3W3xvPi28wkitpEV9dHZ3SiDWocXFW38P
 JHIupu6Eqgeb8X0XMgxsf+cotAcKM02Mse2AyBE80OcM4NcFiNI9ub6waiskAXOzXf
 CDnABboVEvZDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE347380CFD7; Mon, 24 Feb 2025 22:40:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174043684424.3634134.11083697589097973471.git-patchwork-notify@kernel.org>
Date: Mon, 24 Feb 2025 22:40:44 +0000
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
In-Reply-To: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, guoren@kernel.org, drew@pdp7.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, linux-riscv@lists.infradead.org,
 wefu@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: thead: clean up
	clock rate setting
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

On Fri, 21 Feb 2025 14:15:17 +0000 you wrote:
> Hi,
> 
> This series cleans up the thead clock rate setting to use the
> rgmii_clock() helper function added to phylib.
> 
> The first patch switches over to using the rgmii_clock() helper,
> and the second patch cleans up the verification that the desired
> clock rate is achievable, allowing the private clock rate
> definitions to be removed.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: thead: use rgmii_clock() for RGMII clock rate
    https://git.kernel.org/netdev/net-next/c/171fd7cb153c
  - [net-next,2/2] net: stmmac: thead: ensure divisor gives proper rate
    https://git.kernel.org/netdev/net-next/c/8bfff0481d91

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
