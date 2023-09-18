Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0C17A4751
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Sep 2023 12:40:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F524C6B46F;
	Mon, 18 Sep 2023 10:40:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31A0CC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Sep 2023 10:40:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 97D5ECE0DFE;
 Mon, 18 Sep 2023 10:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB70CC433CA;
 Mon, 18 Sep 2023 10:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695033623;
 bh=/rpJw4blscres1SH9Zd4BIBgxuOh6y7bC27y4ZB68YQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gJI1peO3zt+gO8WpdZdzPjd7qONwLmBJkn2VIBjA8c9ZURKJdkTPJG9ltqIjaMnu2
 G5s4tFd6+vHj5+Rw8kIfNrXjCnq26QpSkBQIiKywS5RaIx2CWTiAVOaKNwrme3J7cP
 qTaZJHQ34x9oWnwBwmMAqBpHuZ/vqzCMKd1L5HxczrVyEMfCPH4Iiz0hiwLcEveQIw
 NRKViL1DFyJGebuhWdfycZ4LYwdytBEOY17EtP6MPYqj2USFfdkop1nM/uu+864HUg
 YM8p9mJc22GWhCnl4/ZxqCyiGWHjouvBGM2MGxkzhqWUDoi/sFTiwijQsEimU0qcPy
 2ZUBY7C9oq5OQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B3867E11F41; Mon, 18 Sep 2023 10:40:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169503362373.26042.16292520553887987397.git-patchwork-notify@kernel.org>
Date: Mon, 18 Sep 2023 10:40:23 +0000
References: <20230916063312.7011-1-rohan.g.thomas@intel.com>
In-Reply-To: <20230916063312.7011-1-rohan.g.thomas@intel.com>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 netdev@vger.kernel.org, robh+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, fancer.lancer@gmail.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 0/2] net: stmmac: Tx coe sw
	fallback
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
by David S. Miller <davem@davemloft.net>:

On Sat, 16 Sep 2023 14:33:10 +0800 you wrote:
> Hi,
> DW xGMAC IP can be synthesized such that it can support tx checksum
> offloading only for a few initial tx queues. Also as Serge pointed
> out, for the DW QoS IP, tx coe can be individually configured for
> each tx queue. This patchset adds support for tx coe sw fallback for
> those queues that don't support tx coe. Also, add binding for
> snps,coe-unsupported property.
> 
> [...]

Here is the summary with links:
  - [net-next,v7,1/2] dt-bindings: net: snps,dwmac: Tx coe unsupported
    https://git.kernel.org/netdev/net-next/c/6fb8c20a04be
  - [net-next,v7,2/2] net: stmmac: Tx coe sw fallback
    https://git.kernel.org/netdev/net-next/c/8452a05b2c63

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
