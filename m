Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E79A768FEA
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 10:20:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45EDAC6B443;
	Mon, 31 Jul 2023 08:20:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21870C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jul 2023 08:20:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D73460F88;
 Mon, 31 Jul 2023 08:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E9D4C433AD;
 Mon, 31 Jul 2023 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690791623;
 bh=iFw1eTT0uqbhzj8JDGSr0fgbWXoLNoGg8HGa6Krj/BE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pdzuiheNxcAIUt7dl4VvftR6KVgfb4WfHYzXw7S4BW3HMeL0KMuaUJegDV4ye1i2q
 xt+IXuw4p4K/OydDVMCVezK9Voc5opQc2n1uQHW+pCcF2S8wyiKFcuPa64UxEPUtvQ
 G1Iwdhc79AaODYjflPpqOtbjQJnp2U4Fo+ECkhcQA/WYz7nibFltasYOX6TfOGyiQm
 DkftOEw0qo8qS7YQ1KRXR6FKZrHxTFzDS6vQd6ySIF1lkhclBxDg0VactJ9YcERA3Q
 lruw6F4hQjhGdeD4QZ4puijNgB6y1lT949oNG2pypUD5bnAAqPINZFgkA0SmN19lHN
 qOipMmAtNgTCQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1B4A1E96AC0; Mon, 31 Jul 2023 08:20:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169079162310.10005.11385616493848955483.git-patchwork-notify@kernel.org>
Date: Mon, 31 Jul 2023 08:20:23 +0000
References: <20230728232215.2071351-1-rkannoth@marvell.com>
In-Reply-To: <20230728232215.2071351-1-rkannoth@marvell.com>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: taras.chornyi@plvision.eu, andrew@lunn.ch, alexandre.belloni@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com, vladimir.oltean@nxp.com,
 jdamato@fastly.com, kurt@linutronix.de, edumazet@google.com,
 anthony.l.nguyen@intel.com, ioana.ciornei@nxp.com,
 gerhard@engleder-embedded.com, wojciech.drewek@intel.com,
 UNGLinuxDriver@microchip.com, horatiu.vultur@microchip.com, lanhao@huawei.com,
 louis.peens@corigine.com, f.fainelli@gmail.com, leon@kernel.org,
 linux-net-drivers@amd.com, Steen.Hegelund@microchip.com,
 jesse.brandeburg@intel.com, kadlec@netfilter.org, huangguangbin2@huawei.com,
 joabreu@synopsys.com, intel-wired-lan@lists.osuosl.org,
 linux-arm-kernel@lists.infradead.org, simon.horman@corigine.com,
 kuba@kernel.org, d-tatianin@yandex-team.ru, pabeni@redhat.com,
 yisen.zhuang@huawei.com, pablo@netfilter.org, linux-rdma@vger.kernel.org,
 grygorii.strashko@ti.com, aelior@marvell.com, daniel.machon@microchip.com,
 idosch@nvidia.com, wenjuan.geng@corigine.com, claudiu.manoil@nxp.com,
 coreteam@netfilter.org, habetsm.xilinx@gmail.com, hui.zhou@corigine.com,
 peppe.cavallaro@st.com, michael.chan@broadcom.com, linux-omap@vger.kernel.org,
 lars.povlsen@microchip.com, petrm@nvidia.com, zdoychev@maxlinear.com,
 salil.mehta@huawei.com, muhammad.husaini.zulkifli@intel.com,
 wentao.jia@corigine.com, manishc@marvell.com, netdev@vger.kernel.org,
 oss-drivers@corigine.com, fw@strlen.de, linux-kernel@vger.kernel.org,
 shenjian15@huawei.com, ecree.xilinx@gmail.com, netfilter-devel@vger.kernel.org,
 shmulik.ladkani@gmail.com, mcoquelin.stm32@gmail.com, rajur@chelsio.com,
 olteanv@gmail.com, saeedm@nvidia.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v3 net-next] net: flow_dissector: Use
	64bits for used_keys
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

On Sat, 29 Jul 2023 04:52:15 +0530 you wrote:
> As 32bits of dissector->used_keys are exhausted,
> increase the size to 64bits.
> 
> This is base change for ESP/AH flow dissector patch.
> Please find patch and discussions at
> https://lore.kernel.org/netdev/ZMDNjD46BvZ5zp5I@corigine.com/T/#t
> 
> [...]

Here is the summary with links:
  - [v3,net-next] net: flow_dissector: Use 64bits for used_keys
    https://git.kernel.org/netdev/net-next/c/2b3082c6ef3b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
