Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DBDA577ED
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Mar 2025 04:40:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38F9EC78F95;
	Sat,  8 Mar 2025 03:40:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB8EAC78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Mar 2025 03:40:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 263335C66B2;
 Sat,  8 Mar 2025 03:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0C3C4CEE8;
 Sat,  8 Mar 2025 03:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741405208;
 bh=VbfFId+c8hU5TKBC8vVV3K3Ub0jULqeS8673sNKaj7g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=mV7oTwwpvL0aeS+JSNZl3l8a9/aRCG7F9Js6RToq04XDgUGqYoGAPcje1iM9jtDNn
 8KdCPVCgeiA9aadZfulZYr4hUzqfWPIyhUY0uZZqpO8yYKKqFDsIlNX3iQ1qBSIi9b
 VLVPJMaSHVflnFMNfUrjcW+MmlWE0a+zhK/SfdfyreuWSia4jVQ+wyJBEXBtnk8MJX
 RGCNk0ygocpcj0TgkwAu6AegZtA67CQDjTw0H2rO+59j0Vm7XTv//hUK+oVAG3B1+V
 rc9BVSkzgtfG+38Ici/qeBxoWWQ7CwfbubBDbn6H1hqsKQ0P4FRe3OgtGN8lsPsrgd
 CgtPosWoTw7Qw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 71901380CFFB; Sat,  8 Mar 2025 03:40:43 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174140524199.2565853.4357984309163755989.git-patchwork-notify@kernel.org>
Date: Sat, 08 Mar 2025 03:40:41 +0000
References: <20250307011623.440792-1-inochiama@gmail.com>
In-Reply-To: <20250307011623.440792-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: looong.bin@gmail.com, linux-kernel@vger.kernel.org, edumazet@google.com,
 jszhang@kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, alex@ghiti.fr,
 romain.gantois@bootlin.com, unicorn_wang@outlook.com, 0x1207@gmail.com,
 joabreu@synopsys.com, inochiama@outlook.com, pabeni@redhat.com,
 clement.leger@bootlin.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 aou@eecs.berkeley.edu, richardcochran@gmail.com, jan.petrous@oss.nxp.com,
 kuba@kernel.org, rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 paul.walmsley@sifive.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, olteanv@gmail.com, dlan@gentoo.org,
 netdev@vger.kernel.org, bartosz.golaszewski@linaro.org,
 joe@pf.is.s.u-tokyo.ac.jp, fancer.lancer@gmail.com, andrew+netdev@lunn.ch,
 palmer@dabbelt.com, mcoquelin.stm32@gmail.com, l.rubusch@gmail.com,
 krzk+dt@kernel.org, emil.renner.berthing@canonical.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v7 0/4] riscv: sophgo: Add
 ethernet support for SG2044
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  7 Mar 2025 09:16:13 +0800 you wrote:
> The ethernet controller of SG2044 is Synopsys DesignWare IP with
> custom clock. Add glue layer for it.
> 
> Changed from v6:
> - https://lore.kernel.org/netdev/20250305063920.803601-1-inochiama@gmail.com/
> 1. rebase against latest net-next/main
> 
> [...]

Here is the summary with links:
  - [net-next,v7,1/4] dt-bindings: net: Add support for Sophgo SG2044 dwmac
    https://git.kernel.org/netdev/net-next/c/114508a89ddc
  - [net-next,v7,2/4] net: stmmac: platform: Group GMAC4 compatible check
    https://git.kernel.org/netdev/net-next/c/f8add6654d3c
  - [net-next,v7,3/4] net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
    https://git.kernel.org/netdev/net-next/c/9ef17cafc36b
  - [net-next,v7,4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
    https://git.kernel.org/netdev/net-next/c/a22221ef5dee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
