Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 533179D940E
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 10:20:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02F18C78002;
	Tue, 26 Nov 2024 09:20:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35BA9C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 09:20:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7BEBB5C5CE3;
 Tue, 26 Nov 2024 09:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAE4C4CED0;
 Tue, 26 Nov 2024 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732612821;
 bh=Ctg6MXostCZ1aJoI4FFc/g312bq9jtegH+oNd3mbPbM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hMoVL8rgbDSJZsho/GqGrLQfqMe65YqL/OcfkOgVu/5jtxIXo8eRmaxd5wQMHI7Nw
 NOpZRQVuhvE4/31lTFsVwpoOXbRIjh8MmLZlhrpC8eIOoSvx1X0a5myta69XiHNnyh
 WbGIGB6h6kr7sxp3NIu2OXa4/KGahf4K56dR1iU5okxS2CJ+uTHGVlypIj7r5/mfuD
 3zpFVLmxKFDzPZB1ZIgdNYca9r8eZ0h9j2Hlf75mjRDYzvGWLEgkZg8EL+YJibtO9G
 w6Drte+7iDFIi6DA5fcAK/wscZBGCqtrcTo55HOA0ug0sHRJ8vpIzIYNYlFzcCoNWR
 veNEsxTuP20/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AEB873809A00; Tue, 26 Nov 2024 09:20:35 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173261283425.319179.1006458233398022415.git-patchwork-notify@kernel.org>
Date: Tue, 26 Nov 2024 09:20:34 +0000
References: <20241120083818.1079456-1-yong.liang.choong@linux.intel.com>
In-Reply-To: <20241120083818.1079456-1-yong.liang.choong@linux.intel.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: o.rempel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: set initial EEE
	policy configuration
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 20 Nov 2024 16:38:18 +0800 you wrote:
> Set the initial eee_cfg values to have 'ethtool --show-eee ' display
> the initial EEE configuration.
> 
> Fixes: 49168d1980e2 ("net: phy: Add phy_support_eee() indicating MAC support EEE")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: stmmac: set initial EEE policy configuration
    https://git.kernel.org/netdev/net/c/59c5e1411a0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
