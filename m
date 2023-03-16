Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBBD6BD774
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 18:50:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BED6C65043;
	Thu, 16 Mar 2023 17:50:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1909C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 17:50:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45CBC620D9;
 Thu, 16 Mar 2023 17:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31B95C433A1;
 Thu, 16 Mar 2023 17:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678989020;
 bh=/rFLNe93rQIRlAx/57xJ6NacQ6gFAXPh6A+DAAqx/RY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rKgHmH1sooRqw3nGbq3dUryuP04azSVgLR00rq6MsZBt67K6xq5U/DbzcpvZwgspe
 LDwV12ROIoHxlgKyvMkkkbsAo/Bo0YyjeDuI9yQ38MIlzJg5A90jtS5cBd+jIqUB2d
 ZjnpEtBLXj2fI0zxBCWMS36HM7et2XB9AH2jIWKKvcUysXzNR8nT3/ek4v0Ni79GU9
 U60CsnFj2LB59sYcNJ46yQOqptrQMaM9E1J0Gqn9OBQU1uM5ybRzEQxsFiSndKRB/m
 Tochl8xGkSZkmS0L1QXqZBvoOblNX8O4m1G9SM5ioao93p/jS3EPqHh/ROVd7b1OXc
 Swe/YlbXKZipg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0EAE9E29F32; Thu, 16 Mar 2023 17:50:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167898902004.2133.16158810493778389682.git-patchwork-notify@kernel.org>
Date: Thu, 16 Mar 2023 17:50:20 +0000
References: <20230314191828.914124-1-robh@kernel.org>
In-Reply-To: <20230314191828.914124-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
X-Topics: 
Cc: simon.horman@corigine.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, shenwei.wang@nxp.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, qiang.zhao@nxp.com,
 michal.simek@xilinx.com, joabreu@synopsys.com, xiaoning.wang@nxp.com,
 linux-imx@nxp.com, romieu@fr.zoreil.com, kuba@kernel.org, pabeni@redhat.com,
 kvalo@kernel.org, wg@grandegger.com, grygorii.strashko@ti.com,
 kernel@pengutronix.de, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org,
 linux-can@vger.kernel.org, claudiu.manoil@nxp.com, mkl@pengutronix.de,
 peppe.cavallaro@st.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, wei.fang@nxp.com,
 sam@mendozajonas.com, shawnguo@kernel.org, claudiu.beznea@microchip.com
Subject: Re: [Linux-stm32] [PATCH v2] net: Use of_property_read_bool() for
	boolean properties
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

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 14 Mar 2023 14:18:27 -0500 you wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to of_property_read_bool().
> 
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for net/can
> Acked-by: Kalle Valo <kvalo@kernel.org>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Acked-by: Francois Romieu <romieu@fr.zoreil.com>
> Reviewed-by: Wei Fang <wei.fang@nxp.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v2] net: Use of_property_read_bool() for boolean properties
    https://git.kernel.org/netdev/net/c/1a87e641d8a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
