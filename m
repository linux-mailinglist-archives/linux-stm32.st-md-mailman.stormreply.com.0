Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE446C9FF8
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 11:40:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61B8EC6A5F6;
	Mon, 27 Mar 2023 09:40:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 746BAC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 09:40:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B3A56116E;
 Mon, 27 Mar 2023 09:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5451CC433D2;
 Mon, 27 Mar 2023 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679910017;
 bh=beK1YV3pWAJeOza+SpVzg1PajY/RpZfsGNm70c4I2BI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=SxRKoKkSG7Juge8cawhKUPDLAX/38dT6fgFtMlg6yIZnnNHtGfB1bhQFMjUdFjz3F
 HJu4ogZ8dDdnzGeSjjK90nsS2BKMnCd0Pjfya6fcrs/+wvX0z5tWHwKIc32B5/m5Dl
 5WYM6yC/5ySmtyAEZIGdXdZq4BgJd8/mK9Ts6pKVTkQeWY/yGV7Ekt6qHwBIdYuV8a
 p/PGihhnu21aMj8DgK0Pvjadxm8KIe7unIRYeT9GnbvhTsXKw/jUpmDlLO+xMxo+R7
 rV7ds/5/QqhNw7VlPrNwyMEqNBXxai+tcqux0hwaUnyxyt2ezQkBP6/+D+can2Xi7h
 6vgUuXTkZ7Ydg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1E4ADE4D029; Mon, 27 Mar 2023 09:40:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167991001711.30696.13664523807439827345.git-patchwork-notify@kernel.org>
Date: Mon, 27 Mar 2023 09:40:17 +0000
References: <20230325112815.3053288-1-vladimir.oltean@nxp.com>
In-Reply-To: <20230325112815.3053288-1-vladimir.oltean@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: f.fainelli@gmail.com, andrew@lunn.ch, kurt@linutronix.de,
 linux-kernel@vger.kernel.org, kim.tatt.chuah@intel.com,
 vee.khee.wong@intel.com, netdev@vger.kernel.org, tee.min.tan@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: don't reject VLANs when
	IFF_PROMISC is set
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

On Sat, 25 Mar 2023 13:28:15 +0200 you wrote:
> The blamed commit has introduced the following tests to
> dwmac4_add_hw_vlan_rx_fltr(), called from stmmac_vlan_rx_add_vid():
> 
> 	if (hw->promisc) {
> 		netdev_err(dev,
> 			   "Adding VLAN in promisc mode not supported\n");
> 		return -EPERM;
> 	}
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: don't reject VLANs when IFF_PROMISC is set
    https://git.kernel.org/netdev/net/c/a7602e7332b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
