Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A80E6C5E4F
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 06:00:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAFBFC6A5EF;
	Thu, 23 Mar 2023 05:00:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 707C9C65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 05:00:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F1471623E4;
 Thu, 23 Mar 2023 05:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51E55C4339C;
 Thu, 23 Mar 2023 05:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679547618;
 bh=NPnB/UKnNUercF44HUDX/+E3dqZ3zJVMKeECg6m+d1A=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=IsZJcdwN7BEzr41ZzVOxogP/fo9bLZra4v8eGb4EUa1bebhFu3AHFwAuHzM+uW3j4
 FVEGqDpUtiyjsw6cxk/EY51PNCkW5TDrwdTjTsd51ePOQUek5onn2Tl45jGa/lPq7B
 IrTXp0IXIZHn9lfxZ7RvJ23PQuYkYopnkYjMbLUUsMtjrHPdokfHMkQCvc4qPucy3i
 87hhPSfaDMVrjblhVr9BbaSaj6CmkEPSrOyN5Fqm7vs01FRYrO2P4wqjGa7Gb80a6N
 4bncUA09GxrPJxzloqiV5FOTNOtkvYP1pWr5dwyhHFQJHmeSVQfZaM7bnhYKVJbr9U
 grdHl1qm9Jsfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1A7FDE4F0D7; Thu, 23 Mar 2023 05:00:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167954761809.22889.18341092686850307793.git-patchwork-notify@kernel.org>
Date: Thu, 23 Mar 2023 05:00:18 +0000
References: <20230320233758.2918972-1-robh@kernel.org>
In-Reply-To: <20230320233758.2918972-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch, heiko@sntech.de, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux@armlinux.org.uk, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, tobias@waldekranz.com, rafal@milecki.pl,
 nobuhiro1.iwamatsu@toshiba.co.jp, UNGLinuxDriver@microchip.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 f.fainelli@gmail.com, samuel@sholland.org, khilman@baylibre.com,
 Steen.Hegelund@microchip.com, michal.simek@xilinx.com,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 agross@kernel.org, bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au,
 kuba@kernel.org, pabeni@redhat.com, linux-sunxi@lists.linux.dev,
 wg@grandegger.com, naga.sureshkumar.relli@xilinx.com,
 daniel.machon@microchip.com, mani@kernel.org,
 martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, linux-actions@lists.infradead.org,
 linux-can@vger.kernel.org, mkl@pengutronix.de, appana.durga.rao@xilinx.com,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 lars.povlsen@microchip.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 andrew@aj.id.au, netdev@vger.kernel.org, andersson@kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, konrad.dybcio@linaro.org,
 krzysztof.kozlowski@linaro.org, mcoquelin.stm32@gmail.com,
 linux-mediatek@lists.infradead.org, olteanv@gmail.com, afaerber@suse.de,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: net: Drop unneeded quotes
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
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 20 Mar 2023 18:37:54 -0500 you wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for bindings/net/can
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v2] dt-bindings: net: Drop unneeded quotes
    https://git.kernel.org/netdev/net-next/c/3079bfdbda6c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
