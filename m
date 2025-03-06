Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F344CA55AF4
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 00:40:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0C66C78F83;
	Thu,  6 Mar 2025 23:40:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 885D0C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 23:40:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 62C8F5C5AE8;
 Thu,  6 Mar 2025 23:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EC1C4CEE0;
 Thu,  6 Mar 2025 23:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741304399;
 bh=emxzmeQoV90jOMUN+sghwG9Iapc81kvHylrex2K2SQg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Qzmu15qpNBeUNAGOvVtYjyrFW8GD+KK8PPOdD/YPth7RhmDqWWjFz71/4pwTiF7CW
 vP1eo8OF1neqxogtQF2mMDvF23SS9hS4ow1IdTbX67aRvc1fIBryQ+nzLwdYIQUeNf
 ro7T3y/Z7kqCMxr3jl4sj78QeZAlj2gHe8wMUQ4mTqiXBXtDc+b5gDRAq4Ofw4yFlW
 Ko03dZIq5GDKmi3wE8rZCkuTB0P7PdPOtf2RVgT3cT7wzBGs4vfSWQaTY0IoczF79I
 1pr9d/UjqUOb7hd8kTIrM5eK0XJn2Cai8Ubs3y0iFq7nL3z3DqN/xE+wWzmlRwZwlo
 a34JEZiCwtVcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 712C2380CFF6; Thu,  6 Mar 2025 23:40:34 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174130443328.1819102.15961350109548099161.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 23:40:33 +0000
References: <E1tpswn-005U6I-TU@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tpswn-005U6I-TU@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: mostly remove
	"buf_sz"
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

On Wed, 05 Mar 2025 17:54:21 +0000 you wrote:
> The "buf_sz" parameter is not used in the stmmac driver - there is one
> place where the value of buf_sz is validated, and two places where it
> is written. It is otherwise unused.
> 
> Remove these accesses. However, leave the module parameter in place as
> removing it could cause module load to fail, breaking user setups.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: mostly remove "buf_sz"
    https://git.kernel.org/netdev/net-next/c/072dd84b4c5a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
