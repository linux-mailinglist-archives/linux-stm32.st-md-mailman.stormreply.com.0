Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDFC367156
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 19:30:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB91AC58D5C;
	Wed, 21 Apr 2021 17:30:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99283C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 17:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4DCBC6145C;
 Wed, 21 Apr 2021 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619026210;
 bh=wvG6mq/pPzzw+F3r/h1+Yj8Af73d25CcCy4yT3YbXyI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=dJuh4n8zXWmLA3oNwCD/f/Wy53aaRMstQmirCTqglofjWb25/nEEykH5gRMeRGCSC
 TSRRrUpEcZCO/tTY9IBMXecAj5mHkOpTH6wwtnspDBOx+HVFREID2/FNDkdctXDPPN
 Rge3aYpuisIltu2MTGHLcL/Oxm8xfudPy390k+576iRr/uhMQ2dLNiQ8iLBBhmxUay
 DAtYe9hGVPzz5FN8eVDnjKW3v05IwEIbF7XkwmzgtsepV2dRz5fVlkPpuHZ8ucgmC9
 uXjtFbhNKmwlnQrJiXLyYRxGzzGdOhZ0QNs+Y9PFf8x7XxJ17k9hZqOEISe2MXL+R4
 jilbJ45JAmnbg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4847B60A3C;
 Wed, 21 Apr 2021 17:30:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161902621029.9844.10834595645280467228.git-patchwork-notify@kernel.org>
Date: Wed, 21 Apr 2021 17:30:10 +0000
References: <YIAnKtpJa/K+0efq@mwanda>
In-Reply-To: <YIAnKtpJa/K+0efq@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: vee.khee.wong@linux.intel.com, netdev@vger.kernel.org,
 richardcochran@gmail.com, tee.min.tan@intel.com,
 kernel-janitors@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next] stmmac: intel: unlock on error
 path in intel_crosststamp()
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

On Wed, 21 Apr 2021 16:22:50 +0300 you wrote:
> We recently added some new locking to this function but one error path
> was overlooked.  We need to drop the lock before returning.
> 
> Fixes: f4da56529da6 ("net: stmmac: Add support for external trigger timestamping")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [net-next] stmmac: intel: unlock on error path in intel_crosststamp()
    https://git.kernel.org/netdev/net-next/c/53e35ebb9a17

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
