Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FBFA97C9D
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 04:10:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D268C78F63;
	Wed, 23 Apr 2025 02:10:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36C80C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 02:10:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 57EFF43EBE;
 Wed, 23 Apr 2025 02:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF178C4CEE9;
 Wed, 23 Apr 2025 02:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745374202;
 bh=mfA8LCGyK1ft3dVgLyO0no1zPL7rJ2QqTHlgV6oRXU8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LJRyZofHrIWVdj2cNJN1mYZWKFIhGf3r1M1ry/4o1nWCmhs6Zhjnd4sNg4r2Qn6pn
 IiaA8KEJLeT75wSHPxOS/ngZtJ8B6oySkr+bMelzKJCEbnS8N99qWBk26xWHVMJvE4
 hHFYXcL9kzdxCvp0Sk5FCAmq51rj8Ffg3J078GTPz9CMJkwvHYjj2c67Hm2o9xpyUG
 r1FPDhMgJ6j/wWvOKcux+suI2FeimfPxnFs/toD0xcZjZW+mGU84VF1HWkayF0fQ5P
 0UgtHgkgjwU4W+K/7astVsKcHZcP9Qa9m99UIoplFVZoMI2QVcunOBAtjz7843j8ZI
 XXHK9hx/qKcyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70C7A380CEF4; Wed, 23 Apr 2025 02:10:42 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174537424123.2115098.14548979135070706572.git-patchwork-notify@kernel.org>
Date: Wed, 23 Apr 2025 02:10:41 +0000
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lad@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: geert+renesas@glider.be, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 magnus.damm@gmail.com, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, fabrizio.castro.jz@renesas.com,
 rmk+kernel@armlinux.org.uk, biju.das.jz@bp.renesas.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 andrew+netdev@lunn.ch, p.zabel@pengutronix.de, krzk+dt@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v8 0/4] Add GBETH glue layer
 driver for Renesas RZ/V2H(P) SoC
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

On Thu, 17 Apr 2025 09:40:11 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series adds support for the GBETH (Gigabit Ethernet) glue layer
> driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
> the Synopsys DesignWare MAC (version 5.20). The changes include updating
> the device tree bindings, documenting the GBETH bindings, and adding the
> DWMAC glue layer for the Renesas GBETH.
> 
> [...]

Here is the summary with links:
  - [net-next,v8,1/4] dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and 'interrupt-names'
    https://git.kernel.org/netdev/net-next/c/8c989368c04c
  - [net-next,v8,2/4] dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
    https://git.kernel.org/netdev/net-next/c/8fff7ae84d18
  - [net-next,v8,3/4] net: stmmac: Add DWMAC glue layer for Renesas GBETH
    https://git.kernel.org/netdev/net-next/c/461f6529e594
  - [net-next,v8,4/4] MAINTAINERS: Add entry for Renesas RZ/V2H(P) DWMAC GBETH glue layer driver
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
