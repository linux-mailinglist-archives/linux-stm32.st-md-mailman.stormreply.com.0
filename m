Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 607D3A92FC2
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Apr 2025 04:10:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23BF6C78F72;
	Fri, 18 Apr 2025 02:10:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 171A2C78F74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Apr 2025 02:10:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D2CA68480;
 Fri, 18 Apr 2025 02:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D71CC4CEEA;
 Fri, 18 Apr 2025 02:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744942205;
 bh=zJMWKlINLQxoHVInSJ+InJg9/4RqU8iLfjlB3jKpNuc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ECLslSKRbGv0zfdqrE34jhBmJW2hvJsVMMrFLPipIG+IylXOp/BlYig4TKQJNCyPn
 KgIj4+ewoTMSGeQ3Sl50LL8S20V1IvJEWrpC2CjmiFlrSg4PIHpqHev6grPYcJopvk
 2xM/g+w1Z2DTGNW79xxAs1EgpWlQVTzkbpUtcSD1sKQ6phKvaP36iES9UBHvzCfMv4
 DtiR7bPrK/c8HkjwEqb4RGtAdvLzu/nDtjJrGw5V+CpcV4PdbGrZoIeLX3LCayzed8
 OIGAvDETN5Z3+4xhC1fsGD+fsPfAI9gUbg59eDlFDQxKpoRoZLuDg/deTVLUBBwDNt
 zM3IovL4KRx0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAC8C380AAEB; Fri, 18 Apr 2025 02:10:44 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174494224374.79616.15601499519996041916.git-patchwork-notify@kernel.org>
Date: Fri, 18 Apr 2025 02:10:43 +0000
References: <20250416010210.work.904-kees@kernel.org>
In-Reply-To: <20250416010210.work.904-kees@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: imx@lists.linux.dev, vladimir.oltean@nxp.com, linux-kernel@vger.kernel.org,
 wsa+renesas@sang-engineering.com, edumazet@google.com,
 linux-hardening@vger.kernel.org, jszhang@kernel.org, ziweixiao@google.com,
 linux-stm32@st-md-mailman.stormreply.com, joshwash@google.com,
 andrew+netdev@lunn.ch, 0x1207@gmail.com, yong.liang.choong@linux.intel.com,
 xiaoning.wang@nxp.com, jacob.e.keller@intel.com, kuba@kernel.org,
 pabeni@redhat.com, ahalaney@redhat.com, horms@kernel.org, petr@tesarici.cz,
 idosch@nvidia.com, richardcochran@gmail.com, claudiu.manoil@nxp.com,
 shailend@google.com, wei.fang@nxp.com, hramamurthy@google.com,
 jeroendb@google.com, linux-arm-kernel@lists.infradead.org, petrm@nvidia.com,
 kory.maincent@bootlin.com, willemb@google.com, geoff@infradead.org,
 netdev@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 aleksander.lobakin@intel.com, mcoquelin.stm32@gmail.com,
 pkaligineedi@google.com, davem@davemloft.net, shannon.nelson@amd.com
Subject: Re: [Linux-stm32] [PATCH] net: ethtool: Adjust exactly
 ETH_GSTRING_LEN-long stats to use memcpy
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
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 15 Apr 2025 18:02:15 -0700 you wrote:
> Many drivers populate the stats buffer using C-String based APIs (e.g.
> ethtool_sprintf() and ethtool_puts()), usually when building up the
> list of stats individually (i.e. with a for() loop). This, however,
> requires that the source strings be populated in such a way as to have
> a terminating NUL byte in the source.
> 
> Other drivers populate the stats buffer directly using one big memcpy()
> of an entire array of strings. No NUL termination is needed here, as the
> bytes are being directly passed through. Yet others will build up the
> stats buffer individually, but also use memcpy(). This, too, does not
> need NUL termination of the source strings.
> 
> [...]

Here is the summary with links:
  - net: ethtool: Adjust exactly ETH_GSTRING_LEN-long stats to use memcpy
    https://git.kernel.org/netdev/net-next/c/151e13ece86d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
