Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C69DBA03BE1
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 11:10:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72E78C78022;
	Tue,  7 Jan 2025 10:10:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F390AC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 10:10:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A284F5C5E4E;
 Tue,  7 Jan 2025 10:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71367C4CED6;
 Tue,  7 Jan 2025 10:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736244610;
 bh=5bEVFGZ/3kqEH3ft/INVb3O3lfmDpksxz7qJlBKHdfY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tJwqeYPV74pJLrqLp7MKw6n4nCoenPU+Y0Yw5LKIcIf4obY8frYSRwvuD+OKn0BSD
 hW7hSTajdYCzdObz6uzsP/5ybRlJ8ZmKCS6eUgybs+6uoVx+bhkhhWykC2VbLV0c8f
 tz4WB6pllPOxh1A9QpyW9jqT+UQqHVqFoCVhPsXWOSjkqICm3M7T7DqWiOB2PgQWdy
 MWADjcJfgyqCQEuTWh8TCWkC750pjZ9oTMS6h2aLFqJYyzzG4o3B6cz2h0pYNjjnqu
 /EzfASlao/O9pNb1om+cXXkqXcWshRd5AHUGvO92qnWT6DRCqags5XHgk1aQyrtSuO
 3bRQfGSQWQghg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB497380A97E; Tue,  7 Jan 2025 10:10:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173624463153.4094378.15118164239287100695.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jan 2025 10:10:31 +0000
References: <20250103093733.3872939-1-0x1207@gmail.com>
In-Reply-To: <20250103093733.3872939-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Set
 dma_sync_size to zero for discarded frames
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

On Fri,  3 Jan 2025 17:37:33 +0800 you wrote:
> If a frame is going to be discarded by driver, this frame is never touched
> by driver and the cache lines never become dirty obviously,
> page_pool_recycle_direct() wastes CPU cycles on unnecessary calling of
> page_pool_dma_sync_for_device() to sync entire frame.
> page_pool_put_page() with sync_size setting to 0 is the proper method.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v1] net: stmmac: Set dma_sync_size to zero for discarded frames
    https://git.kernel.org/netdev/net-next/c/51cfbed198ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
