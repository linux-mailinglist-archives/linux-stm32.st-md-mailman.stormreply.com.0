Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2637A5F02B0
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Sep 2022 04:21:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E6AFC64100;
	Fri, 30 Sep 2022 02:21:12 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66D28C640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Sep 2022 02:21:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6E4C9CE240C;
 Fri, 30 Sep 2022 02:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4F36C43142;
 Fri, 30 Sep 2022 02:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664504466;
 bh=ueEwZNI3LGnm0spa0UV7x3J2NHzMX38/TS/8V2AKkGw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=a75zbWes8dPjQwRmocWdadbZgD/99pxc2Uu64BnD+gNWkZsUsj3g4DbAbcMxiWeaf
 1tWv/aQHTM9m1oB9FOSkNRliziQNoClrj2Ld/Nls5eAvxvuaqjpuYaQoUJGIWK0xYD
 rsRIR3ZrR1u9E2u/FGxj+xmNWvDHmrUc2sBomGzP4gvKj6hdffPgmLjQMwsMD8mf/S
 C7bHxi+XRErRduteOAm1EFy+axBXHGDIjkgjc8ejSxoyDCiqcanBasq1JqynHIVQO/
 EyomuHrXhqwWv4/EDggnGU2hdm3ahUxSWJ+pCbbOa3xG4q1NFCKqLPCsc7rIB+B5J4
 FXxX9BwGG1oGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9FDEAC395DA; Fri, 30 Sep 2022 02:21:06 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166450446665.30186.2865460822947348151.git-patchwork-notify@kernel.org>
Date: Fri, 30 Sep 2022 02:21:06 +0000
References: <20220927012449.698915-1-marex@denx.de>
In-Reply-To: <20220927012449.698915-1-marex@denx.de>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, robh+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, krzysztof.kozlowski@linaro.org,
 edumazet@google.com, joabreu@synopsys.com, kuba@kernel.org,
 peppe.cavallaro@st.com, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: net: snps,
 dwmac: Document stmmac-axi-config subnode
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

On Tue, 27 Sep 2022 03:24:49 +0200 you wrote:
> The stmmac-axi-config subnode is present in multiple dwmac instance DTs,
> document its content per snps,axi-config property description which is
> a phandle to this subnode.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Jose Abreu <joabreu@synopsys.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: netdev@vger.kernel.org
> To: linux-arm-kernel@lists.infradead.org
> 
> [...]

Here is the summary with links:
  - dt-bindings: net: snps,dwmac: Document stmmac-axi-config subnode
    https://git.kernel.org/netdev/net-next/c/5361660af6d3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
