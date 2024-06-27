Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB4091A246
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 11:10:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EE5FC71282;
	Thu, 27 Jun 2024 09:10:35 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 039D4C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 09:10:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 773F5CE2DBF;
 Thu, 27 Jun 2024 09:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7006C4AF07;
 Thu, 27 Jun 2024 09:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719479430;
 bh=GmpUEmL645flm8du5E63Ee5Mu3fSTAGYlBX8R7TSu3I=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KLrYW+xdFRd3GgfNr7aAnJjxkGKBQU0P35cLoR41YHPkoebKuhMaRvaZnA4fdqC0Y
 GA19fPBmvv1XjNKQSM76SZn/+OMz+Qj6ran9KHYWWspwD5QJ+AVcr/npJOwl/sxtgv
 CNQDKizSwWD85o8K7FGMYLB3/hBlNyP1G4Mo1OrDJor5rnLHVKAKzo+32t7DfJZolK
 dt0M05o/lKchIwKakJCuJbD4r3CEUx4P5dQI3H7rNtUeu2hz2NpGqSfaNtXZrBzo25
 HRhLNl/SDfQr2y9iE9KT2lGFl9TFCt8HmKp01N4J4TUjiWxQigBu4fsFSNElfQgwMn
 CN46oJy/8JZzA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9698CDE8DE0; Thu, 27 Jun 2024 09:10:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171947943061.14380.1530245725990563660.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 09:10:30 +0000
References: <20240624071052.118042-1-christophe.roullier@foss.st.com>
In-Reply-To: <20240624071052.118042-1-christophe.roullier@foss.st.com>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: marex@denx.de, joabreu@synopsys.com, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, lgirdwood@gmail.com,
 edumazet@google.com, robh+dt@kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next,
	PATCH v3 0/2] Series to deliver Ethernet for STM32MP25
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 24 Jun 2024 09:10:50 +0200 you wrote:
> STM32MP25 is STM32 SOC with 2 GMACs instances.
>     GMAC IP version is SNPS 5.3x.
>     GMAC IP configure with 2 RX and 4 TX queue.
>     DMA HW capability register supported
>     RX Checksum Offload Engine supported
>     TX Checksum insertion supported
>     Wake-Up On Lan supported
>     TSO supported
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] dt-bindings: net: add STM32MP25 compatible in documentation for stm32
    https://git.kernel.org/netdev/net-next/c/3d94d1ac3792
  - [net-next,v3,2/2] net: stmmac: dwmac-stm32: stm32: add management of stm32mp25 for stm32
    https://git.kernel.org/netdev/net-next/c/5bcc1afd0219

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
