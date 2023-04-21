Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C534B6EA89D
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Apr 2023 12:50:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68717C65E4F;
	Fri, 21 Apr 2023 10:50:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 485EEC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Apr 2023 10:50:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 131D063EF8;
 Fri, 21 Apr 2023 10:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A89EC433D2;
 Fri, 21 Apr 2023 10:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682074220;
 bh=h3RyoSOiFiFDRTwCsypI3F6F6H66CtCaPUBSqdRhiJ8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Lwe1/I0feXEzKrBlGaiywDpyX8T/e5JLErtWqZbv3wUsSZkhLJ9QyXgi4Cl5iKKBL
 wtxjKqfqqi+14+me1QiDhWWYEcmTIvdkz/PWwC+QWih6sO5NfXM14zqfh+plW2/Pkb
 KKTLwe1yFBryWZ3R8Y4iwBFi7jbhKM6jVdn9EebM59x3OnEMjnKbJ3QwtDar9hI3gw
 iJiearVhA24EDIYN53Ejo5fKVA9ArYA8doB+PYgkKENBFUKpHCvECt36WBtxckwiFJ
 xf945wKK/hhAxktaYQ6wAkNlJ0SQXgdygfH/jlPYJQ30nRlp4fbTNW9KN/wOdHkRs7
 WQOz8AdM+JgMg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 515BDC561EE; Fri, 21 Apr 2023 10:50:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168207422032.11185.11526430974844545291.git-patchwork-notify@kernel.org>
Date: Fri, 21 Apr 2023 10:50:20 +0000
References: <KL1PR01MB544874DAEE749710E67727A2E6629@KL1PR01MB5448.apcprd01.prod.exchangelabs.com>
In-Reply-To: <KL1PR01MB544874DAEE749710E67727A2E6629@KL1PR01MB5448.apcprd01.prod.exchangelabs.com>
To: Yan Wang <rk.code@outlook.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, qiangqing.zhang@nxp.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v6] net: stmmac:fix system hang
 when setting up tag_8021q VLAN for DSA ports
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
by David S. Miller <davem@davemloft.net>:

On Wed, 19 Apr 2023 22:13:46 +0800 you wrote:
> The system hang because of dsa_tag_8021q_port_setup()->
> 				stmmac_vlan_rx_add_vid().
> 
> I found in stmmac_drv_probe() that cailing pm_runtime_put()
> disabled the clock.
> 
> First, when the kernel is compiled with CONFIG_PM=y,The stmmac's
> resume/suspend is active.
> 
> [...]

Here is the summary with links:
  - [net-next,v6] net: stmmac:fix system hang when setting up tag_8021q VLAN for DSA ports
    https://git.kernel.org/netdev/net-next/c/35226750f7ab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
