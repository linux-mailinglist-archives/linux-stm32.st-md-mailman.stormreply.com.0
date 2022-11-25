Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B7D63865E
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Nov 2022 10:40:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03B7CC65E4B;
	Fri, 25 Nov 2022 09:40:20 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2F4FC65E43
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Nov 2022 09:40:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2493FB827F8;
 Fri, 25 Nov 2022 09:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB1B7C433D7;
 Fri, 25 Nov 2022 09:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669369216;
 bh=Yren0HJ7km4sZa95qF5G0hT934SQakZ3VmowUXfyCkU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=SLDAMCYPl2FKxxpRavmX2F9kYtKvUkglfb0F5whv76llAtVL/lQEeI7kFgshPlvju
 /HzewGZiL4D8N4NZEzlq+qFxZqVxYAKYSxhpu9Hnn6evs7aeziwBwMWrRtjGWGBA1F
 xo6xTuurO/Xnxnzefmid1z+QJkiAUfsK9hCzIi0Ye+6KVLo3ZDHSpUDnp0Kreq9R7K
 C0I5ADKjnf/4ON0F34OYTfP8mtmYKzFAdvKoezB2AczMCkoYkqgs/ee+vx6ossVz4N
 xGKFT+ravZVw22RY6QrvdhFz+G7LIzT8bgtYymVvSHZwHoGv+0tfU26fr8qRTxTHxj
 Wc7DkfO7VRtuQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A52D0C395EC; Fri, 25 Nov 2022 09:40:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166936921667.2800.1734006486713251964.git-patchwork-notify@kernel.org>
Date: Fri, 25 Nov 2022 09:40:16 +0000
References: <20221123105110.23617-1-wei.sheng.goh@intel.com>
In-Reply-To: <20221123105110.23617-1-wei.sheng.goh@intel.com>
To: Goh@ci.codeaurora.org, Wei Sheng <wei.sheng.goh@intel.com>
Cc: alexandre.torgue@st.com, weifeng.voon@intel.com, netdev@vger.kernel.org,
 tee.min.tan@intel.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 boon.leong.ong@intel.com, peppe.cavallaro@st.com, hong.aun.looi@intel.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 noor.azura.ahmad.tarmizi@intel.com
Subject: Re: [Linux-stm32] [PATCH net v4] net: stmmac: Set MAC's flow
 control register to reflect current settings
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

On Wed, 23 Nov 2022 18:51:10 +0800 you wrote:
> Currently, pause frame register GMAC_RX_FLOW_CTRL_RFE is not updated
> correctly when 'ethtool -A <IFACE> autoneg off rx off tx off' command
> is issued. This fix ensures the flow control change is reflected directly
> in the GMAC_RX_FLOW_CTRL_RFE register.
> 
> Fixes: 46f69ded988d ("net: stmmac: Use resolved link config in mac_link_up()")
> Cc: <stable@vger.kernel.org> # 5.10.x
> Signed-off-by: Goh, Wei Sheng <wei.sheng.goh@intel.com>
> Signed-off-by: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
> 
> [...]

Here is the summary with links:
  - [net,v4] net: stmmac: Set MAC's flow control register to reflect current settings
    https://git.kernel.org/netdev/net/c/cc3d2b5fc0d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
