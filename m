Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8D17CF63A
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Oct 2023 13:10:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25710C6B44D;
	Thu, 19 Oct 2023 11:10:26 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF13FC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Oct 2023 11:10:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 513DBB827F8;
 Thu, 19 Oct 2023 11:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D1E5C433C9;
 Thu, 19 Oct 2023 11:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697713823;
 bh=x7Vilo7RVB7QrsjGzn3PXT/f0rYR4arJfWxCuscoZPg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=YUHwUD67GFqAZErgK2PsBHJHYFywVrz/3RhS5IEsXOBhnpObUjzKkvLNaOtp5U8PH
 5qV3dkDsiIpjPosl+ExsOGjAv02lBzl4rktcyBzrsmY1Dl5kJxigayP0/hAT9RWXi7
 +TlrgPH+Esr+o2otftIZx/jLKIHWDA1SrvmBGIHJ4mXfsjRxjSnkjhDOdHV20U/0mp
 J1YqNXbDq9DlnhU/kJ5cgBZHJyDbQKjvQzUeenAlUsM49LAXf+23EbAJZQ1CbMiA5f
 HY2r6vjAYmxKQUa80Lf+8GBRqZqYErF5gH/DG16bghgwzikGuY0d1bPVQdd4dgvLK+
 Wvt7h5lnXul0g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7E8FAC595CE; Thu, 19 Oct 2023 11:10:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169771382351.28433.15969551932352859252.git-patchwork-notify@kernel.org>
Date: Thu, 19 Oct 2023 11:10:23 +0000
References: <20231010-stmmac_fix_auxiliary_event_capture-v2-0-51d5f56542d7@pengutronix.de>
In-Reply-To: <20231010-stmmac_fix_auxiliary_event_capture-v2-0-51d5f56542d7@pengutronix.de>
To: Johannes Zink <j.zink@pengutronix.de>
Cc: ahalaney@redhat.com, vee.khee.wong@linux.intel.com,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 bartosz.golaszewski@linaro.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, kurt@linutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 tee.min.tan@intel.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/5] net: stmmac: use correct
 PPS input indexing
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Oct 2023 09:09:52 +0200 you wrote:
> The stmmac can have 0 to 4 auxiliary snapshot in channels, which can be
> used for capturing external triggers with respect to the eqos PTP timer.
> 
> Previously when enabling the auxiliary snapshot, an invalid request was
> written to the hardware register, except for the Intel variant of this
> driver, where the only snapshot available was hardcoded.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/5] net: stmmac: simplify debug message on stmmac_enable()
    https://git.kernel.org/netdev/net-next/c/3fba82343955
  - [net-next,v2,2/5] net: stmmac: use correct PPS capture input index
    https://git.kernel.org/netdev/net-next/c/7e62ac24b57a
  - [net-next,v2,3/5] net: stmmac: intel: remove unnecessary field struct plat_stmmacenet_data::ext_snapshot_num
    https://git.kernel.org/netdev/net-next/c/1dbfe73bd648
  - [net-next,v2,4/5] net: stmmac: ptp: stmmac_enable(): move change of plat->flags into mutex
    https://git.kernel.org/netdev/net-next/c/7d3077482578
  - [net-next,v2,5/5] net: stmmac: do not silently change auxiliary snapshot capture channel
    https://git.kernel.org/netdev/net-next/c/2ddd05d1d5ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
