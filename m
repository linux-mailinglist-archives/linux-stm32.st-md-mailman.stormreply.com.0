Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FF9868DD7
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 11:40:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81603C6B45E;
	Tue, 27 Feb 2024 10:40:33 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D229BC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 10:40:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 22BAECE015B;
 Tue, 27 Feb 2024 10:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64678C43390;
 Tue, 27 Feb 2024 10:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709030430;
 bh=jCSGc1Wib+G5BqkjiukbrPIc/tZkzpz0rP/lb8B64Ik=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IqZcNk9xaVQyMQkXnNXLlzHQsWmGSeg1jmPg/r9y6jGSgS5zgmD0XQhREPoHB7+1C
 O5R5l/b3djIv60CwEUxSY1+dtyTOK1furInFF77jHRXv84PITy0I7vmTwu2UqemR8S
 wFV0rYnAersXW/7N3D4pgmFNQrsh7UgvDbWDKZBWKxpKf6tNn0moz3NpzR3UOP/AKF
 pMAjdNexgMRX30wKYSK7Kx7srG3Xh7AVLYsDm4vUQ1V3HFWJomlO1smLZEfcIRitGJ
 3ITT6spLychPyo/nme9oQprhRn3HupfRFwsNUsJVxrGNvMBwg7nUFNHvd1i7wYkgMh
 Yg1G/eTXuCqyQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4648AD88FB0; Tue, 27 Feb 2024 10:40:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170903043028.17630.12024992708013538596.git-patchwork-notify@kernel.org>
Date: Tue, 27 Feb 2024 10:40:30 +0000
References: <20240223-stmmac_stats-v3-1-5d483c2a071a@axis.com>
In-Reply-To: <20240223-stmmac_stats-v3-1-5d483c2a071a@axis.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 fancer.lancer@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, kernel@axis.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3] net: stmmac: mmc_core: Drop
 interrupt registers from stats
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 23 Feb 2024 21:37:01 +0100 you wrote:
> The MMC IPC interrupt status and interrupt mask registers are
> of little use as Ethernet statistics, but incrementing counters
> based on the current interrupt and interrupt mask registers
> makes them actively misleading.
> 
> For example, if the interrupt mask is set to 0x08420842,
> the current code will increment by that amount each iteration,
> leading to the following sequence of nonsense:
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: stmmac: mmc_core: Drop interrupt registers from stats
    https://git.kernel.org/netdev/net-next/c/d0dc1e42109d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
