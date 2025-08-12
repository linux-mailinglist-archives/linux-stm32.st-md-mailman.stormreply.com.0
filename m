Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C0FB23A85
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 23:20:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 900F6C36B15;
	Tue, 12 Aug 2025 21:20:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00EBBC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 21:20:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 988DD5C69CB;
 Tue, 12 Aug 2025 21:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F4CC4CEF0;
 Tue, 12 Aug 2025 21:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755033614;
 bh=coaleDkEw2ri40zMf0iBd5QOXvs/OQOHQ7AAZgHkX3g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=D+6srMj6RQUdBm/eEwEuvGo5CanVDw95qZeJkB2llEU87IEDO7Ufes75U15DWr1kL
 xno7pVgUhvpqg5pezP0yKUZ4k02aDrAyVKslLrXTxiFJzrejnE+iisSuLfiNM+cHap
 bM3JtTtZtPtvYT6uF6zNhI/4AiVBpRCuACoJbWj+9Lj4obeREh7F2d/BIC7CjxPStK
 p7M7ujXf8RgO1tmSaLrLGsQFUgnURx23151+WWFzJcx8RfhpYGGULadM4pXvinZIT8
 htQRSCaKGz2IPPZsGR3a8RJmZ4EEKPsPAO9Qa+W9b0Ew8lfBjZ5RZR0NUGM5BelP04
 6BwyEvJkXEO0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70DC1383BF51; Tue, 12 Aug 2025 21:20:27 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175503362599.2827924.4642075233156887123.git-patchwork-notify@kernel.org>
Date: Tue, 12 Aug 2025 21:20:25 +0000
References: <20250811111211.1646600-1-colin.i.king@gmail.com>
In-Reply-To: <20250811111211.1646600-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: make variable data a u32
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

On Mon, 11 Aug 2025 12:12:11 +0100 you wrote:
> Make data a u32 instead of an unsigned long, this way it is
> explicitly the same width as the operations performed on it
> and the same width as a writel store, and it cleans up sign
> extention warnings when 64 bit static analysis is performed
> on the code.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> [...]

Here is the summary with links:
  - net: stmmac: make variable data a u32
    https://git.kernel.org/netdev/net-next/c/11b99886d194

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
