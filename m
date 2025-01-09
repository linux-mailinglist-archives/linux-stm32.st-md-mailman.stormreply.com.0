Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A63A07485
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 12:20:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8624AC78F69;
	Thu,  9 Jan 2025 11:20:12 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0045C78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 11:20:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5C766A4192D;
 Thu,  9 Jan 2025 11:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB56C4CED2;
 Thu,  9 Jan 2025 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736421609;
 bh=1+uVbB8YTOqsluR25SXjrfcOS+SdHfqDiqn5pXsqIyQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=m4msATGPnS6sQKsZ9Rg60S69s3I/DfEk90I/oRZvnOP8hBuT3IJaz/6Y2P1qJXKSJ
 3YMQhu4GdkvPwMtQ5Q1sikGMsenlOq4/XTeZevbCKRzpgO2rP+XAF5rxRjRqmjjkMM
 QRBEYf5xph516Fn8/ycWklBIP2BAjSoWFKF+zI+kGKwkmbl0LA2zGmjoof6j3uHeqV
 6WBL1ojwjOrF2KB5feG6vEMdnKTUwD9uMeEJslN7+MbojXLiBOQJutUMYmaxvYwtTz
 ariwDAvwoBPcEnUThOUN2shIVBK7+U41DvVsrHw5f7BOC5LrdFjyt1D9SN1tR9pz4w
 uTqTIHu/hTgRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70D173805DB2; Thu,  9 Jan 2025 11:20:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173642163126.1285771.10043021879258168083.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 11:20:31 +0000
References: <20250107075448.4039925-1-0x1207@gmail.com>
In-Reply-To: <20250107075448.4039925-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: Unexport
 stmmac_rx_offset() from stmmac.h
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

On Tue,  7 Jan 2025 15:54:48 +0800 you wrote:
> stmmac_rx_offset() is referenced in stmmac_main.c only,
> let's move it to stmmac_main.c.
> 
> Drop the inline keyword by the way, it is better to let the compiler
> to decide.
> 
> Compile tested only.
> No functional change intended.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: Unexport stmmac_rx_offset() from stmmac.h
    https://git.kernel.org/netdev/net-next/c/e62de01008bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
