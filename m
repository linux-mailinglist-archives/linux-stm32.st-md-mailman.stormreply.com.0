Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9319745905D
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Nov 2021 15:40:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58FB5C5A4FD
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Nov 2021 14:40:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1E36C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Nov 2021 14:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3864A604D1;
 Mon, 22 Nov 2021 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637592009;
 bh=3iFuKliPS+OS4p3jtvyWWwr3LNFHl6PYi7GnohJOviY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uG/ykPIBpaO2fxZsG4wB2HdsnRCrS+tc0X5Kx8mi/wsan0HF0fAvjDZj7dKTPEmV8
 hMFcAiRoJkdxXg2rqRelE9YpNtbqv9RLSFNR0JkOtTOizlAfqwtAZ1rKPRnzznoFJz
 fHDRApQqOTNvOYuFN3TYYLPXL9Fjseb3kROga5jSj1TYnsdsb4z5G5lu93a4Pwd74n
 soDDE3vA5Lar7J5vH7HjoH+Sb3KRM4rb73RF4TnMSWwSm0kasJTUeKxgrkQR/Jo20R
 6AIT9GarrmTTEj48LDo+eFBqez84hvruj4t1obXSv/9w/jHCRKHNEHz9DeUa2Gfa+7
 kal2iX7+nQKJA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 28815609D9;
 Mon, 22 Nov 2021 14:40:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163759200916.2046.16368068009111419388.git-patchwork-notify@kernel.org>
Date: Mon, 22 Nov 2021 14:40:09 +0000
References: <20211121175704.6813-1-vladimir.oltean@nxp.com>
In-Reply-To: <20211121175704.6813-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: richardcochran@gmail.com, yannick.vignon@nxp.com,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, kurt@linutronix.de,
 netdev@vger.kernel.org, xiaoliang.yang_1@nxp.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 m.olbrich@pengutronix.de, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 net] net: stmmac: retain PTP clock time
 during SIOCSHWTSTAMP ioctls
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

On Sun, 21 Nov 2021 19:57:04 +0200 you wrote:
> From: Holger Assmann <h.assmann@pengutronix.de>
> 
> Currently, when user space emits SIOCSHWTSTAMP ioctl calls such as
> enabling/disabling timestamping or changing filter settings, the driver
> reads the current CLOCK_REALTIME value and programming this into the
> NIC's hardware clock. This might be necessary during system
> initialization, but at runtime, when the PTP clock has already been
> synchronized to a grandmaster, a reset of the timestamp settings might
> result in a clock jump. Furthermore, if the clock is also controlled by
> phc2sys in automatic mode (where the UTC offset is queried from ptp4l),
> that UTC-to-TAI offset (currently 37 seconds in 2021) would be
> temporarily reset to 0, and it would take a long time for phc2sys to
> readjust so that CLOCK_REALTIME and the PHC are apart by 37 seconds
> again.
> 
> [...]

Here is the summary with links:
  - [v2,net] net: stmmac: retain PTP clock time during SIOCSHWTSTAMP ioctls
    https://git.kernel.org/netdev/net/c/a6da2bbb0005

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
