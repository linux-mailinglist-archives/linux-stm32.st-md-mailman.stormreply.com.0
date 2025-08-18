Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3196B2B143
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Aug 2025 21:11:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8B54C36B1E;
	Mon, 18 Aug 2025 19:11:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CED70C36B15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 19:11:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A60E56111C;
 Mon, 18 Aug 2025 19:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5769AC4CEEB;
 Mon, 18 Aug 2025 19:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755544269;
 bh=OZK5CyXw1PInn/yqI4pDY8A9Y5pwSG9xCax8VqYzUdI=;
 h=Date:From:To:Cc:Subject:Reply-To:From;
 b=BSQq1w5JizmpSZUf4s5+tSO15Q/XuPUlIXNgf1lPgC6Pnth2YBndwPcZNe43Yz22l
 aiAO/8djv6cgRjptjNlsO74pfWV92BT333yfBGhdxxO98IDtl22SSCsx3zVYv4NqzB
 +BYzAH6+UQvq8qtZXQQ3H0ovg0z8at8SU1kKuzNcG+QMQnJGJclFDJwzkORw/cyvpw
 XzRJ6qLivhVK38NONmfhs3MqKXQMUPujPlT2Tk37jMqef1ss8NnQOXHk83xn7Ll5mD
 nyG/zTRJhjyz+DA7kC0kkMqTnXtCU4WEEjdG0E10KmP7TTsNiGgMRdmHrMmelN8F1f
 tOfVwQIQBekwg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 07D41CE0CC4; Mon, 18 Aug 2025 12:11:09 -0700 (PDT)
Date: Mon, 18 Aug 2025 12:11:09 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Message-ID: <7ee6a142-1ed9-4874-83b7-128031e41874@paulmck-laptop>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC] net: stmmac: Make DWMAC_ROCKCHIP and
 DWMAC_STM32 depend on PM_SLEEP
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello!

This might be more of a bug report than a patch, but here goes...

Running rcuscale or refscale performance tests on datacenter ARM systems
gives the following build errors with CONFIG_HIBERNATION=n:

ERROR: modpost: "stmmac_simple_pm_ops" [drivers/net/ethernet/stmicro/stmmac/dwmac-rk.ko] undefined!
ERROR: modpost: "stmmac_simple_pm_ops" [drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.ko] undefined!

The problem is that these two drivers unconditionally reference
stmmac_simple_pm_ops, which is not exported to modules in kernels built
without CONFIG_PM_SLEEP, which depends on CONFIG_HIBERNATION.

Therefore, update drivers/net/ethernet/stmicro/stmmac/Kconfig so that
CONFIG_DWMAC_ROCKCHIP and CONFIG_DWMAC_STM32 depend on CONFIG_PM_SLEEP,
thus preventing the dependence on a symbol when it is not exported.
With this change, rcuscale and refscale build and run happily on the
ARM system that I have access to.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: <netdev@vger.kernel.org>
Cc: <linux-stm32@st-md-mailman.stormreply.com>
Cc: <linux-arm-kernel@lists.infradead.org>

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 67fa879b1e521e..150f662953a24b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -146,7 +146,7 @@ config DWMAC_RENESAS_GBETH
 config DWMAC_ROCKCHIP
 	tristate "Rockchip dwmac support"
 	default ARCH_ROCKCHIP
-	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
+	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST) && PM_SLEEP
 	select MFD_SYSCON
 	help
 	  Support for Ethernet controller on Rockchip RK3288 SoC.
@@ -231,7 +231,7 @@ config DWMAC_STI
 config DWMAC_STM32
 	tristate "STM32 DWMAC support"
 	default ARCH_STM32
-	depends on OF && HAS_IOMEM && (ARCH_STM32 || COMPILE_TEST)
+	depends on OF && HAS_IOMEM && (ARCH_STM32 || COMPILE_TEST) && PM_SLEEP
 	select MFD_SYSCON
 	help
 	  Support for ethernet controller on STM32 SOCs.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
