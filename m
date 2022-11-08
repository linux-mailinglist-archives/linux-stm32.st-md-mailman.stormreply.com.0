Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A160A6206C1
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Nov 2022 03:30:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53ACFC65041;
	Tue,  8 Nov 2022 02:30:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 614E9C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Nov 2022 02:30:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C97A61418;
 Tue,  8 Nov 2022 02:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35E6AC43147;
 Tue,  8 Nov 2022 02:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667874616;
 bh=1hYnMgfurIKVnqS2BSMFp3XJTtcvbl4vCIjx0mlf2hc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=corZkn9pLiTNJeebW0flJi865e5dD2UeDQ+8JGk7sNL3V2a4kHdhDOxRXG+71pGQh
 tCXiG+7o3v6mOeeLKPu/57tG+LrMlFVD7nqaY2jNgLYhnSBCgmww0rJG7PwT0mxFnQ
 DHxnQCH1iiCovuIwHQEB2ax8KYZE908axQ2TH0zhLT1QN+KgiKG+fXYAZln7wzSx1c
 xLSmupP5T9DNXlQ5kAQMlI+UjIri6aFHbnH8+eTsabgCIM0uqdp5Hnjozuz1polESL
 E6gbQ8xo0SfxSmjlEMum1OAGCuWMzRPfJ+fqvK6trB9aq3D6aY8DWf5B8RV3VZKAfR
 1cuX6y9Fyloug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1BC44C73FFC; Tue,  8 Nov 2022 02:30:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166787461610.16737.3952195755714134439.git-patchwork-notify@kernel.org>
Date: Tue, 08 Nov 2022 02:30:16 +0000
References: <E1or0FZ-001tRa-DI@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1or0FZ-001tRa-DI@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.belloni@bootlin.com, madalin.bucur@nxp.com,
 chris.snook@gmail.com, edumazet@google.com, thomas.petazzoni@bootlin.com,
 ioana.ciornei@nxp.com, UNGLinuxDriver@microchip.com,
 horatiu.vultur@microchip.com, linux-renesas-soc@vger.kernel.org,
 joyce.ooi@intel.com, Steen.Hegelund@microchip.com, michal.simek@xilinx.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, vladimir.oltean@nxp.com, kuba@kernel.org,
 pabeni@redhat.com, Mark-MC.Lee@mediatek.com, radhey.shyam.pandey@xilinx.com,
 daniel.machon@microchip.com, sean.wang@mediatek.com, claudiu.manoil@nxp.com,
 linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com,
 peppe.cavallaro@st.com, mw@semihalf.com, lars.povlsen@microchip.com,
 s.shtylyov@omp.ru, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 nicolas.ferre@microchip.com, davem@davemloft.net, tchornyi@marvell.com,
 mcoquelin.stm32@gmail.com, hkallweit1@gmail.com, claudiu.beznea@microchip.com,
 nbd@nbd.name
Subject: Re: [Linux-stm32] [PATCH net-next] net: remove explicit
 phylink_generic_validate() references
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

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 04 Nov 2022 17:13:01 +0000 you wrote:
> Virtually all conventional network drivers are now converted to use
> phylink_generic_validate() - only DSA drivers and fman_memac remain,
> so lets remove the necessity for network drivers to explicitly set
> this member, and default to phylink_generic_validate() when unset.
> This is possible as .validate must currently be set.
> 
> Any remaining instances that have not been addressed by this patch can
> be fixed up later.
> 
> [...]

Here is the summary with links:
  - [net-next] net: remove explicit phylink_generic_validate() references
    https://git.kernel.org/netdev/net-next/c/e1f4ecab1933

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
