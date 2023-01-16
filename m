Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A5466BF96
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jan 2023 14:20:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8C16C6507E;
	Mon, 16 Jan 2023 13:20:20 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6331AC6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 13:20:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AF918B80E7F;
 Mon, 16 Jan 2023 13:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 631F5C433F1;
 Mon, 16 Jan 2023 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673875217;
 bh=7gLO1+iYpXTGqPXElGoBoiL7mQRceK+8QVVuj35+e0E=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=qv3Thkou5dXZq9WEKbwiGrXeKX2+VYecfqoVfYuHzWnwuIeeGz18Cer3lntixRbjt
 AI+P6U4YaOZA7St8zY40Y3mlwq+dDL9uxDfxufhhIMOKKOD5rV4qe0PC0lRAL45hWQ
 dSv74yLnZU/q8lSP3XuTrcWarfbPigj0P8EanilF14cY+nAF7Gxw6eNCpBsrsZnGfg
 TX5VkB9XdRYbWq7zTJXU5wPakHxB3TepwO8W173aQcZtAO5AUqGatdHu8Y+bbz67BO
 vrIoamgpn9dYA9QbyQ+mgLdZeqUF+t4gGF8coudXmQI+ewuPL1A7anZsOO9xIQdnsX
 CSLEXwLnGwpkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 448C5E54D26; Mon, 16 Jan 2023 13:20:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167387521727.30194.4776508390029520899.git-patchwork-notify@kernel.org>
Date: Mon, 16 Jan 2023 13:20:17 +0000
References: <20230114120437.383514-1-kurt@linutronix.de>
In-Reply-To: <20230114120437.383514-1-kurt@linutronix.de>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: vee.khee.wong@linux.intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, vijayakannan.ayyathurai@intel.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: Fix queue statistics
	reading
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

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Sat, 14 Jan 2023 13:04:37 +0100 you wrote:
> Correct queue statistics reading. All queue statistics are stored as unsigned
> long values. The retrieval for ethtool fetches these values as u64. However, on
> some systems the size of the counters are 32 bit. That yields wrong queue
> statistic counters e.g., on arm32 systems such as the stm32mp157. Fix it by
> using the correct data type.
> 
> Tested on Olimex STMP157-OLinuXino-LIME2 by simple running linuxptp for a short
> period of time:
> 
> [...]

Here is the summary with links:
  - [net,v1] net: stmmac: Fix queue statistics reading
    https://git.kernel.org/netdev/net/c/c296c77efb66

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
