Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D867223AF
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Jun 2023 12:40:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB487C6A5E7;
	Mon,  5 Jun 2023 10:40:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DA9BC65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jun 2023 10:40:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C9616227E;
 Mon,  5 Jun 2023 10:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63101C4339B;
 Mon,  5 Jun 2023 10:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685961620;
 bh=J9L9ZgxC2Kly/z+obdv2lAt35t36sXkamU/X8cpUyCI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=t+5Ho53un0fNOIbSg7XaYfL51mL3yUz/msTZuvobC84aH8eUw//S05cXB+WF4UjDt
 M4rw6Rtil0b5kYXs6jRFjLRJX7zsslKkK0Hfaan4o/e7s+zHczWTtM/7KMz5H9/rpY
 bQCOVHy9kqAc9iXPV9W5mot9Rt5tyYP3TnhAoDCXfp/lvp9XNqozOhaLKol4D2E9n3
 CTsd48WeKP+zbYOHllTf+In//gcztCmykq3TUy4fWPeFe/5qI/VZINPAK8pMcD9eXo
 /UsBOTMYsjKtl3fTZ3TwipKExJldDdA5phMRlF+Evhz/+yVio9gbrcw/QkxNBrAPo7
 M9k0lBLxOD6gA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4C6A0E8723C; Mon,  5 Jun 2023 10:40:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168596162030.847.18206193816609441964.git-patchwork-notify@kernel.org>
Date: Mon, 05 Jun 2023 10:40:20 +0000
References: <20230602190455.3123018-1-brgl@bgdev.pl>
In-Reply-To: <20230602190455.3123018-1-brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, bhupesh.sharma@linaro.org,
 edumazet@google.com, bartosz.golaszewski@linaro.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jesse.brandeburg@intel.com,
 vkoul@kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, ahalaney@redhat.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-qcom-ethqos: fix a
 regression on EMAC < 3
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

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Fri,  2 Jun 2023 21:04:55 +0200 you wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We must not assign plat_dat->dwmac4_addrs unconditionally as for
> structures which don't set them, this will result in the core driver
> using zeroes everywhere and breaking the driver for older HW. On EMAC < 2
> the address should remain NULL.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: dwmac-qcom-ethqos: fix a regression on EMAC < 3
    https://git.kernel.org/netdev/net/c/9bc009734774

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
