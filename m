Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F48B42D85
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 01:40:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A86E0C36B38;
	Wed,  3 Sep 2025 23:40:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8AEAC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 23:40:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 56D9E44C45;
 Wed,  3 Sep 2025 23:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3076BC4CEE7;
 Wed,  3 Sep 2025 23:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756942812;
 bh=2fsTRI0s62XGwnP//OHTQCGU7+WD7rrA5jzNeU4M6lY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=j/GrbPfJgOGjoVeEFEULkY/WrpJF/tT/fFsBDaxhblrMhUkNfDN3pjV/lZbS7go07
 vTr8xvzguB/Og4SwcemyOQyD0ayGLWI2hva68w7MnDD71Cg/pjKWmJYwpg4yjNeQDa
 NSrUHpGWLXSUOaLTdvc071RWkpm6ZeJwUsViJ/76gQ77IjstDPzUpNRQIOnDU0J55E
 pmDD0/0PR7hZ1lsHctmgUU05jJ8V2QHEG/Fv4Rb7t15P541j8LzdnLKvdQAuln5DAl
 FfNNrtXIPnqfx2MBLQLp1mDPPj9qFUcJPsZchL55js3pAA407/l2Raz9bMs+AyT9zs
 zN0TsAj8CTzTw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70E51383C259; Wed,  3 Sep 2025 23:40:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175694281723.1237656.10367505965534451710.git-patchwork-notify@kernel.org>
Date: Wed, 03 Sep 2025 23:40:17 +0000
References: <20250901103632.3409896-1-joy.zou@nxp.com>
In-Reply-To: <20250901103632.3409896-1-joy.zou@nxp.com>
To: Joy Zou <joy.zou@nxp.com>
Cc: imx@lists.linux.dev, alexander.stein@ew.tq-group.com, Frank.Li@nxp.com,
 edumazet@google.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 Markus.Niebel@ew.tq-group.com, frieder.schrempf@kontron.de,
 primoz.fiser@norik.com, kuba@kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 kernel@pengutronix.de, linux-pm@vger.kernel.org, othacehe@gnu.org,
 s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net, linux@ew.tq-group.com
Subject: Re: [Linux-stm32] [PATCH v10 0/6] Add i.MX91 platform support
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

On Mon,  1 Sep 2025 18:36:26 +0800 you wrote:
> The design of i.MX91 platform is very similar to i.MX93.
> Extracts the common parts in order to reuse code.
> 
> The mainly difference between i.MX91 and i.MX93 is as follows:
> - i.MX91 removed some clocks and modified the names of some clocks.
> - i.MX91 only has one A core.
> - i.MX91 has different pinmux.
> 
> [...]

Here is the summary with links:
  - [v10,1/6] arm64: dts: freescale: move aliases from imx93.dtsi to board dts
    (no matching commit)
  - [v10,2/6] arm64: dts: freescale: rename imx93.dtsi to imx91_93_common.dtsi and modify them
    (no matching commit)
  - [v10,3/6] arm64: dts: imx91: add i.MX91 dtsi support
    (no matching commit)
  - [v10,4/6] arm64: dts: freescale: add i.MX91 11x11 EVK basic support
    (no matching commit)
  - [v10,5/6] arm64: dts: imx93-11x11-evk: remove fec property eee-broken-1000t
    (no matching commit)
  - [v10,6/6] net: stmmac: imx: add i.MX91 support
    https://git.kernel.org/netdev/net-next/c/59aec9138f30

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
