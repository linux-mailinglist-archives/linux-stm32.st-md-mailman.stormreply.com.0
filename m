Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD348926ED
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Mar 2024 23:50:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FD1AC6C83D;
	Fri, 29 Mar 2024 22:50:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82417C6C83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Mar 2024 22:50:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2CDBF61A27;
 Fri, 29 Mar 2024 22:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AA7FC43609;
 Fri, 29 Mar 2024 22:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711752630;
 bh=1rWdaEawfYR3LfAF31PiRtpuMF8rLJZ44iKkxh0MscI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=QriMG5bPxFDJal3+iK1Pb0iH9WyOvvWgwweQ2/D86v3oy/13nMNRcnZgIMYLJopSY
 7KLJczmMCVMHyE0HUKo16Zlrh+oM1jIPi5sy2qLvR1xNCT85FR5iD28bsq3bhCic2E
 9agT52MvYHoRihMvi5B1sSF3/Py9XPrQj9IBRigclTJz6rtPhf6vSl/5FSEsRqKbd5
 AG+Y/Btm/xHAuRSBzBp5kwOLojbL6e2YNlyWE+0YcxgNg53lc484ELHLR7HwPJHh3Q
 zxW5r1DkUTeEdz0tQrKVSD3O2p8NxXZGc3WAWBi8z8L8dwVHWkG0HVZicER5qqp8k6
 laI6AElXluGGw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 816E5D2D0EB; Fri, 29 Mar 2024 22:50:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171175263052.1693.263504657362042828.git-patchwork-notify@kernel.org>
Date: Fri, 29 Mar 2024 22:50:30 +0000
References: <20240328185337.332703-1-christophe.roullier@foss.st.com>
In-Reply-To: <20240328185337.332703-1-christophe.roullier@foss.st.com>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: marex@denx.de, joabreu@synopsys.com, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, lgirdwood@gmail.com,
 edumazet@google.com, robh+dt@kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 0/1] Add property in dwmac-stm32
	documentation
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

On Thu, 28 Mar 2024 19:53:36 +0100 you wrote:
> Introduce property in dwmac-stm32 documentation
> 
>  - st,ext-phyclk: is present since 2020 in driver so need to explain
>    it and avoid dtbs check issue : views/kernel/upstream/net-next/arch/arm/boot/dts/st/stm32mp157c-dk2.dtb:
> ethernet@5800a000: Unevaluated properties are not allowed
> ('st,ext-phyclk' was unexpected)
>    Furthermore this property will be use in upstream of MP13 dwmac glue. (next step)
> 
> [...]

Here is the summary with links:
  - [v6,1/1] dt-bindings: net: dwmac: Document STM32 property st,ext-phyclk
    https://git.kernel.org/netdev/net-next/c/929107d3d2a3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
