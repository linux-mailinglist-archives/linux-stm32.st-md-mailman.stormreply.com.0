Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F3A69636
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Mar 2025 18:20:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35889C6DD6B;
	Wed, 19 Mar 2025 17:20:01 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F3EFC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Mar 2025 17:19:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B8AFFA44978;
 Wed, 19 Mar 2025 17:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4E2C4CEE4;
 Wed, 19 Mar 2025 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742404797;
 bh=LrltH36LcKzUeNqpvSJ0cSNyUs04mlDZqxOw+sb1OXc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Gwmk/3sCXrryWVFn02KC6xjpk+pafHJkPHLPh/Zq5TEj0QR7BCneUeEc6Jc1jpNTN
 KEEHR+DrxNT/D6DS6N38wBO+yj8ywpgpl4I2meuluRDkKjBzrC+0Ls5xAymsYS7pAF
 PPdJ0EovZxtO61R9xfmGLHs5BmDaOfDQmn+CY+MQNE+w0enB0FHsICj2dIaf7gMdxC
 ujBr2jVJbYOk6d5oUF22g+7kxmDYXqMSwc3vmmFmc8Qi8N8tO5DqM3Y8GdAzY8SBx1
 MoI4Gjhad2t5bV1YP4VujVh7LGr+2BlRB4H4N9dnFMPA73Q1rbX/l3ecEiAqnc/quo
 j3pL/y6P8ntig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE637380CFFE; Wed, 19 Mar 2025 17:20:34 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174240483352.1121844.16892728893562053636.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 17:20:33 +0000
References: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
In-Reply-To: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, kernel@esmil.dk, edumazet@google.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, alex@ghiti.fr, joabreu@synopsys.com,
 samin.guo@starfivetech.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 prabhakar.mahadev-lad.rj@bp.renesas.com, minda.chen@starfivetech.com,
 paul.walmsley@sifive.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, conor@kernel.org,
 andrew+netdev@lunn.ch, palmer@dabbelt.com, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/7] net: stmmac: deprecate
 "snps, en-tx-lpi-clockgating" property
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

On Wed, 12 Mar 2025 09:34:20 +0000 you wrote:
> On Sun, Mar 09, 2025 at 03:01:45PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> This series deprecates the "snps,en-tx-lpi-clockgating" property for
> stmmac.
> 
> MII Transmit clock gating, where the MAC hardware supports gating this
> clock, is a function of the connected PHY capabilities, which it
> reports through its status register.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/7] net: stmmac: allow platforms to use PHY tx clock stop capability
    https://git.kernel.org/netdev/net-next/c/0c1f1eb65425
  - [net-next,v2,2/7] net: stmmac: starfive: use PHY capability for TX clock stop
    https://git.kernel.org/netdev/net-next/c/5f250bd72a01
  - [net-next,v2,3/7] net: stmmac: stm32: use PHY capability for TX clock stop
    https://git.kernel.org/netdev/net-next/c/a5bc19e2abeb
  - [net-next,v2,4/7] riscv: dts: starfive: remove "snps,en-tx-lpi-clockgating" property
    https://git.kernel.org/netdev/net-next/c/637af286f9fc
  - [net-next,v2,5/7] ARM: dts: stm32: remove "snps,en-tx-lpi-clockgating" property
    https://git.kernel.org/netdev/net-next/c/50a84bbc7ec1
  - [net-next,v2,6/7] dt-bindings: deprecate "snps,en-tx-lpi-clockgating" property
    https://git.kernel.org/netdev/net-next/c/a62b7901d3a9
  - [net-next,v2,7/7] net: stmmac: deprecate "snps,en-tx-lpi-clockgating" property
    https://git.kernel.org/netdev/net-next/c/cf0a96de397e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
