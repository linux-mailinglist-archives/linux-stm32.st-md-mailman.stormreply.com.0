Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F8E7F4481
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Nov 2023 12:00:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3DF8C6B475;
	Wed, 22 Nov 2023 11:00:27 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2EF8C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Nov 2023 11:00:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 57A5AB80FA7;
 Wed, 22 Nov 2023 11:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54F11C433CD;
 Wed, 22 Nov 2023 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700650824;
 bh=6rDBMi5vgLk/ikFlm2Flmd2RJXRdkqlpNTaFELNVkxA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=lgJpHh0BBZoQxh5EBJJitx62aSBpmxszlWFaNBqG7sPgKJTuHZxRZXwSnmgXM7wwz
 GrxBiJBRM3ynio2/WZ2hebqMPbBlgLedkmOLPHOdKnVS0lXBTh5SA7/HBK2PCcd/2O
 7N4nc4sYo119ckB1y/i58vJU0FMBgM9AaADWKjpxLH6jteiV12u5zfn34slxz8V4G2
 d8p1hu7L2S9KkpWqBf2Gp4V1+mpj65JQMV7gx/qR44rBt5a/r6xuKLp/YbZW6wW+wD
 stQo6bH8mMg0sME1TJW10vw6fLtfigpxDmWENwhOviB5vEy5V+aa2OI/vygphV12Ze
 4T/3dUzPUns9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 38CC5EAA958; Wed, 22 Nov 2023 11:00:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170065082422.4259.15356814369119039927.git-patchwork-notify@kernel.org>
Date: Wed, 22 Nov 2023 11:00:24 +0000
References: <20231121053842.719531-1-yi.fang.gan@intel.com>
In-Reply-To: <20231121053842.719531-1-yi.fang.gan@intel.com>
To: Gan Yi Fang <yi.fang.gan@intel.com>
Cc: linux-kernel@vger.kernel.org, yoong.siang.song@intel.com,
 weifeng.voon@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 jun.ann.lai@intel.com, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, hong.aun.looi@intel.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/1] net: stmmac: Add support
 for HW-accelerated VLAN stripping
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

On Tue, 21 Nov 2023 13:38:42 +0800 you wrote:
> From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
> 
> Current implementation supports driver level VLAN tag stripping only.
> The features is always on if CONFIG_VLAN_8021Q is enabled in kernel
> config and is not user configurable.
> 
> This patch add support to MAC level VLAN tag stripping and can be
> configured through ethtool. If the rx-vlan-offload is off, the VLAN tag
> will be stripped by driver. If the rx-vlan-offload is on, the VLAN tag
> will be stripped by MAC.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/1] net: stmmac: Add support for HW-accelerated VLAN stripping
    https://git.kernel.org/netdev/net-next/c/750011e239a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
