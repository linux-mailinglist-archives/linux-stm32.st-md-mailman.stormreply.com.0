Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCDDC8E32A
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Nov 2025 13:10:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A972CC60468;
	Thu, 27 Nov 2025 12:10:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3930DC5A4E4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Nov 2025 12:10:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EFDAF43DEF;
 Thu, 27 Nov 2025 12:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C802DC4CEF8;
 Thu, 27 Nov 2025 12:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764245444;
 bh=uhnsNrqtMtQkysk9EvtLzQf+itpVm8Usek2r6BnT+ak=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=RO0NRAZl45XA5ot75mAHnDowIjR04X6kevxTP/ht/X0iW+aJV/HSqd1DkqPUzJ/38
 fgQjlsjNIbmzTKhnimVO/Q4XPHv+9aOkw4qaBvEhSfjfRSKhGp9awCsJls/EpcBN//
 0wkqkJQhuGucl1fTvtcmKfQaJovPFZWhWvsqnEH+Ibw64NhrYhNTHCVTGSIvhqQLEo
 bM6DopBszbn9uoufcaoFKgkt25IZ3o8eR7khWLioY+8QJxSjMJRT9Ew2DA4SXydBKQ
 CIoq1Ylo/saAP8rponTA2pcglH4509X+vLM0zaAk3aH5Raam+16WKfpx2KmYSXlmVm
 1qQALIu6z0POQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 710E4380CFEF; Thu, 27 Nov 2025 12:10:07 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176424540625.2550562.3416257212075007570.git-patchwork-notify@kernel.org>
Date: Thu, 27 Nov 2025 12:10:06 +0000
References: <20251126-a10_ext_fix-v1-1-d163507f646f@altera.com>
In-Reply-To: <20251126-a10_ext_fix-v1-1-d163507f646f@altera.com>
To: G@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
 Thomas@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
 Rohan <rohan.g.thomas@altera.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, matthew.gerlach@altera.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac: Disable
 flushing frames on Rx Buffer Unavailable
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

On Wed, 26 Nov 2025 00:37:12 +0800 you wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> In Store and Forward mode, flushing frames when the receive buffer is
> unavailable, can cause the MTL Rx FIFO to go out of sync. This results
> in buffering of a few frames in the FIFO without triggering Rx DMA
> from transferring the data to the system memory until another packet
> is received. Once the issue happens, for a ping request, the packet is
> forwarded to the system memory only after we receive another packet
> and hece we observe a latency equivalent to the ping interval.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: dwmac: Disable flushing frames on Rx Buffer Unavailable
    https://git.kernel.org/netdev/net-next/c/45d100ee0d6e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
