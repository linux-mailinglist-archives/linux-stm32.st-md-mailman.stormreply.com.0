Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E73E63FF5B
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Dec 2022 05:10:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21A63C65E62;
	Fri,  2 Dec 2022 04:10:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6064C65067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Dec 2022 04:10:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DED260F8B;
 Fri,  2 Dec 2022 04:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EAEDC433B5;
 Fri,  2 Dec 2022 04:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669954217;
 bh=HaP17cY8bC6Z7s7UbiuxYbq8Tj2YqlDJaygBIxTtgLE=;
 h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
 b=ceAE5Mxrl5cb2x2vxCvkWYLuAKVIUSda9eDgrj/v/dsN0Vo4tt9V/HX2M1h78crwH
 d03jz31h574qWxU5y0Q6ocFqqylNVBdzBI9uTKgsYl38Y8QLSLrfk+o4bDBD8VeCNC
 hOf+Q9VR7k40jlRRbcnmmPma/ihKnDAxNqujnGgx/nv1JtJ94HtmmJ+5QA/ZoM/ljG
 RbLwj0w3XtuqtUeWwYO5QEIDqRz2znS9lfFPx2OW5XdmmmHyWdfTLPeNqAhADtZ0Ow
 Pk/KqULn6e3dQaK9ZYBlnyp5ewEhowWzruyM0J9zZHiExqyTEM2UT4whZS83/WJftY
 F7YUJMQy9oi4w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0DDFCE52545; Fri,  2 Dec 2022 04:10:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166995421705.16716.5360501255567828327.git-patchwork-notify@kernel.org>
Date: Fri, 02 Dec 2022 04:10:17 +0000
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
In-Reply-To: <20221130141040.32447-1-arinc.unal@arinc9.com>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPg==?=@ci.codeaurora.org
Cc: andrew@lunn.ch, alexandre.belloni@bootlin.com, heiko@sntech.de,
 geert+renesas@glider.be, tharvey@gateworks.com, vladimir.oltean@nxp.com,
 linus.walleij@linaro.org, konrad.dybcio@somainline.org, stefan@agner.ch,
 linux-kernel@vger.kernel.org, edumazet@google.com, christophe.leroy@csgroup.eu,
 krzysztof.kozlowski+dt@linaro.org, linux@rempel-privat.de, festevam@gmail.com,
 peng.fan@nxp.com, f.fainelli@gmail.com, samuel@sholland.org,
 mpe@ellerman.id.au, gregory.clement@bootlin.com, zajec5@gmail.com,
 magnus.damm@gmail.com, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, sergio.paracuellos@gmail.com,
 wens@csie.org, agross@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-imx@nxp.com, rjui@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 s.hauer@pengutronix.de, sebastian.hesselbarth@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 mcoquelin.stm32@gmail.com, frank-w@public-files.de, hauke@hauke-m.de,
 ulli.kroll@googlemail.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, soc@kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 sbranden@broadcom.com, netdev@vger.kernel.org, andersson@kernel.org,
 rasmus.villemoes@prevas.dk, nicolas.ferre@microchip.com, davem@davemloft.net,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 krzysztof.kozlowski@linaro.org, kernel@pengutronix.de, shawnguo@kernel.org,
 claudiu.beznea@microchip.com, michael.riesch@wolfvision.net
Subject: Re: [Linux-stm32] [PATCH 0/5] remove label = "cpu" from DSA
	dt-binding
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

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 30 Nov 2022 17:10:35 +0300 you wrote:
> Hello folks,
> 
> With this patch series, we're completely getting rid of 'label = "cpu";'
> which is not used by the DSA dt-binding at all.
> 
> Information for taking the patches for maintainers:
> Patch 1: netdev maintainers (based off netdev/net-next.git main)
> Patch 2-3: SoC maintainers (based off soc/soc.git soc/dt)
> Patch 4: MIPS maintainers (based off mips/linux.git mips-next)
> Patch 5: PowerPC maintainers (based off powerpc/linux.git next-test)
> 
> [...]

Here is the summary with links:
  - [1/5] dt-bindings: net: qca,ar71xx: remove label = "cpu" from examples
    https://git.kernel.org/netdev/net-next/c/ce36d7ef4e08
  - [2/5] arm: dts: remove label = "cpu" from DSA dt-binding
    (no matching commit)
  - [3/5] arm64: dts: remove label = "cpu" from DSA dt-binding
    (no matching commit)
  - [4/5] mips: dts: remove label = "cpu" from DSA dt-binding
    (no matching commit)
  - [5/5] powerpc: dts: remove label = "cpu" from DSA dt-binding
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
