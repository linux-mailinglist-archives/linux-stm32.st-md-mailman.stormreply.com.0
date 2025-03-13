Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD49A5F20A
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 12:10:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF4CEC78F81;
	Thu, 13 Mar 2025 11:09:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1699DC7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 11:09:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C48D35C5BBB;
 Thu, 13 Mar 2025 11:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B53C4CEDD;
 Thu, 13 Mar 2025 11:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741864196;
 bh=y5Rt/A3I0puk2tWJqwdD+VS9AYs8xTcIZQZ75uLi/aQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OFpakx8qWuEP5hs9WCekvz25n4fnw63dd3zf1Hsha7Gk7+1cmshaz6E6oE8d6Ieh+
 tBzkhdDKSaYH1OgAoNK+7jfD0fdJN4xQ1W2eZZQZ9HelvNaxoDzMiG4MttBJXWwp8t
 OYQ48FdLg1Aw9IqOqJEj0BBUa8qX6V/9YjFqw9jvVKWW22JNwRMHhG8JnhrlhbaW6S
 29uLDOm+zyzCye6P/FtsnHmuM8tJKNGUgYdVxO1sAeEi7yoQhyS/YRufPMcwDeeXtg
 ax/RpzUJ7Toj8NLazkxeVIel3BUqwjK+RCDn16ltaxBF+hnLwAAfRjkh+iPS9k7Pz+
 SWDFtToOpr/aQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB6693806651; Thu, 13 Mar 2025 11:10:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174186423076.1466791.15724461347771862891.git-patchwork-notify@kernel.org>
Date: Thu, 13 Mar 2025 11:10:30 +0000
References: <20250309003301.1152228-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250309003301.1152228-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: imx@lists.linux.dev, heiko@sntech.de, linux-kernel@vger.kernel.org,
 edumazet@google.com, nobuhiro1.iwamatsu@toshiba.co.jp, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 robh@kernel.org, linux-rockchip@lists.infradead.org, khilman@baylibre.com,
 biao.huang@mediatek.com, xiaoning.wang@nxp.com, linux-imx@nxp.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 martin.blumenstingl@googlemail.com, s.hauer@pengutronix.de,
 prabhakar.mahadev-lad.rj@bp.renesas.com, rmk+kernel@armlinux.org.uk,
 linux-mediatek@lists.infradead.org, vineetha.g.jaya.kumaran@intel.com,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 netdev@vger.kernel.org, christophe.roullier@foss.st.com, andrew+netdev@lunn.ch,
 kernel@pengutronix.de, david.wu@rock-chips.com, krzk+dt@kernel.org,
 shawnguo@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next] dt-bindings: net: Define
 interrupt constraints for DWMAC vendor bindings
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

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sun,  9 Mar 2025 00:33:01 +0000 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The `snps,dwmac.yaml` binding currently sets `maxItems: 3` for the
> `interrupts` and `interrupt-names` properties, but vendor bindings
> selecting `snps,dwmac.yaml` do not impose these limits.
> 
> Define constraints for `interrupts` and `interrupt-names` properties in
> various DWMAC vendor bindings to ensure proper validation and consistency.
> 
> [...]

Here is the summary with links:
  - [net-next] dt-bindings: net: Define interrupt constraints for DWMAC vendor bindings
    https://git.kernel.org/netdev/net-next/c/5a1dddd29444

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
