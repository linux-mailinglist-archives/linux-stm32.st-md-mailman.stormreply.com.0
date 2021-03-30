Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A27634F266
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 22:50:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF720C57B5B;
	Tue, 30 Mar 2021 20:50:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 178D0C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 20:50:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 272A4619CB;
 Tue, 30 Mar 2021 20:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617137411;
 bh=TjQ32H0qXeic7zjq3zL8aV+Xw0d3aKBeRMFZjdpMGso=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pj33cRb4PhM0ov+FEZdufJbQUoHoXNFX7bEV0LYfFiKmRsFRSCP+pNuqN8N8PJtEq
 4Jqs0p+i5SSk6foX2TRTU5pC53Z5WapqnLzBM/IWoLPgIvtT6WXotxORXjUGFh3igI
 U0WfD5IUhbXfaJFji61dCfDwondS+Q2LRt278eN6oANhnokBeFh9qKvz0QVMgSsYcv
 xEbgVQNg5Pc+NVjViKB418Locz5FdzFn9074NGY4ev55Cu+ZB3mkC+0nEeLRkTnPsB
 Rug7rRxXQhsB63MmVUwGEEcmALzhP9//FAA0kpV4IQao141Zr98ALozI7Piq+Y9xgl
 xrwLN28dppX4Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1E99360A72;
 Tue, 30 Mar 2021 20:50:11 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161713741112.14455.12714100818749005935.git-patchwork-notify@kernel.org>
Date: Tue, 30 Mar 2021 20:50:11 +0000
References: <20210330024653.11062-1-vee.khee.wong@linux.intel.com>
In-Reply-To: <20210330024653.11062-1-vee.khee.wong@linux.intel.com>
To: Wong Vee Khee <vee.khee.wong@linux.intel.com>
Cc: alexandre.torgue@st.com, vee.khee.wong@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] stmmac: intel: add cross
 time-stamping freq difference adjustment
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

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue, 30 Mar 2021 10:46:53 +0800 you wrote:
> Cross time-stamping mechanism used in certain instance of Intel mGbE
> may run at different clock frequency in comparison to the clock
> frequency used by processor, so we introduce cross T/S frequency
> adjustment to ensure TSC calculation is correct when processor got the
> cross time-stamps.
> 
> Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] stmmac: intel: add cross time-stamping freq difference adjustment
    https://git.kernel.org/netdev/net-next/c/1c137d4777b5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
