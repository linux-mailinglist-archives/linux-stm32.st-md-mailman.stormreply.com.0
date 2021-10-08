Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2116C426DA6
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Oct 2021 17:40:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCF9EC5A4FB;
	Fri,  8 Oct 2021 15:40:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB541C5A4D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 15:40:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2AF6F6101A;
 Fri,  8 Oct 2021 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633707608;
 bh=oy4preGw7XfApUbZDOMs3U0wYeNgcpFMRUEsZTZESQY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=fjep3hopdnbdDawObH0E7DLdxDCCpnbnmQlOnOIDCyT1jY3RMih/4vDDgUuM+zbta
 0iU36+4yCZMf9bzI+dJeXjMilGVsoRJC7Yq7tKBwHKs584WWe23+GOm90qH5pJqhJZ
 hLQqXOcPpsxDZCar8nikqRDYPfjeVzrXj5q/j/BORH9fL2nVwvCpvWnCi/1QNkrp2g
 jLXneBM1D1IoKuWFPayA4YK6TdFA559Aal+08Fv4Nb5X/al/y7QEl3ztl7kYH7y7kK
 VQzpyYNwtwesxq8kO8XpLZ/NUzNq73q+vtAQdDzUmgMNR7XiO6Yl1k8kYMVI4HYOe7
 fpuOQOcTx9wJQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1B3D560A44;
 Fri,  8 Oct 2021 15:40:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163370760810.7751.16013434452322511469.git-patchwork-notify@kernel.org>
Date: Fri, 08 Oct 2021 15:40:08 +0000
References: <20211008103440.3929006-1-herve.codina@bootlin.com>
In-Reply-To: <20211008103440.3929006-1-herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: , joabreu@synopsys.com, devicetree@vger.kernel.org, vireshk@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, kuba@kernel.org, netdev@vger.kernel.org,
 shiraz.linux.kernel@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/4] net: stmmac: fix regression on
	SPEAr3xx SOC
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

This series was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri,  8 Oct 2021 12:34:36 +0200 you wrote:
> The ethernet driver used on old SPEAr3xx soc was previously supported on old
> kernel. Some regressions were introduced during the different updates leading
> to a broken driver for this soc.
> 
> This series fixes these regressions and brings back ethernet on SPEAr3xx.
> Tested on a SPEAr320 board.
> 
> [...]

Here is the summary with links:
  - [1/4] net: stmmac: fix get_hw_feature() on old hardware
    https://git.kernel.org/netdev/net/c/075da584bae2
  - [2/4] dt-bindings: net: snps,dwmac: add dwmac 3.40a IP version
    https://git.kernel.org/netdev/net/c/3781b6ad2ee1
  - [3/4] net: stmmac: add support for dwmac 3.40a
    https://git.kernel.org/netdev/net/c/9cb1d19f47fa
  - [4/4] ARM: dts: spear3xx: Fix gmac node
    https://git.kernel.org/netdev/net/c/6636fec29cdf

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
