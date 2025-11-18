Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B325CC68B7C
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 11:10:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6501BC628CF;
	Tue, 18 Nov 2025 10:10:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DA00C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 10:10:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7424660192;
 Tue, 18 Nov 2025 10:10:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7580C4CEF5;
 Tue, 18 Nov 2025 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763460644;
 bh=b+pZBV7epkHUl8mBX3MIDt42yUoTMnfx2I5N3DhgATE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rtIjXzbzgyy8I3kPhTEMa3ltWVLtGSjFxyDOdqFwsQQrUXnGe1n7a4Bmo8rxpvlqA
 17K2RUJjR5aGxuErQmPscJepT4oLRKvoeY68gBNSpCAl+Znhkw/Y/61HZXI61M6ALo
 koh07cOdrHj09YrbgmZbJFnboR6sa3i1RfHpNwjX5I5YE3525bIaXvgPCpcc7nIJ+7
 v9Jpr/9WHlTZqiKVNHm4NeqWnPiIyJlSdrkSbD3Pz4APWktX7u4wOPrBsRrKJTg6pa
 TLW4Be90dLSe59Tre+1vaAzc0RYyqWsxbYsal32hGI6mWxRWJjq5ApSS5RJoWvnnjI
 9/WjtsxaFVcHQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADE4A3809A83; Tue, 18 Nov 2025 10:10:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176346060951.4077292.1388526029829048727.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 10:10:09 +0000
References: <20251113112721.70500-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251113112721.70500-1-ovidiu.panait.rb@renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/2] net: stmmac: Disable EEE
 RX clock stop when VLAN is enabled
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

On Thu, 13 Nov 2025 11:27:19 +0000 you wrote:
> Hi,
> 
> This series fixes a couple of VLAN issues observed on the Renesas RZ/V2H
> EVK platform (stmmac + Microchip KSZ9131RNXI PHY):
> 
> - The first patch fixes a bug where VLAN ID 0 would not be properly removed
> due to how vlan_del_hw_rx_fltr() matched entries in the VLAN filter table.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: stmmac: Fix VLAN 0 deletion in vlan_del_hw_rx_fltr()
    https://git.kernel.org/netdev/net-next/c/d9db25723677
  - [net-next,v2,2/2] net: stmmac: Disable EEE RX clock stop when VLAN is enabled
    https://git.kernel.org/netdev/net-next/c/c171e679ee66

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
