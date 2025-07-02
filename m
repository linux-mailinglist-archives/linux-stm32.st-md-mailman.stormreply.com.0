Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C191FAF64D7
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jul 2025 00:10:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23281C3F93E;
	Wed,  2 Jul 2025 22:09:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76F95C3F93D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jul 2025 22:09:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 158415C6349;
 Wed,  2 Jul 2025 22:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3696C4CEE7;
 Wed,  2 Jul 2025 22:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751494195;
 bh=+NxvQYU7wQxyO/16lPutXJsg77AvAE6AeyUKVPB18LA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=B4zU45qDeFcwe7TOPtdq6DocquCb3GJzUc0begB9daO6iH4XdJcVLu8FX4ROViPBg
 1cAjVjfl37Om+Xp1Zz+gmUnhq5CAqjX8MjCSXz6J4X0p5qt6l9ZOUwQSm5AERnNjH9
 8f3coe5qsf8fnmDvjj+OKxMWv803KAMOrhVySVs+JWUxneznvYPPZLvJfPr/p50xsJ
 ugN6ntbIVzfaR3JISru3pmWQ1Ev63G0Kkv2twXP3/iCXOdK7/JlR1zMDebvfkD5WZR
 5we+bJMeNjaLHkG428lhCTHGwYDzFni/ZDvbu+XQOxqwYa/DB6mWa/7HRxJyzF0yUk
 gH5VdrZqZeJ+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70C56383B273; Wed,  2 Jul 2025 22:10:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175149422000.880958.14366434982913389673.git-patchwork-notify@kernel.org>
Date: Wed, 02 Jul 2025 22:10:20 +0000
References: <20250630213748.71919-1-matthew.gerlach@altera.com>
In-Reply-To: <20250630213748.71919-1-matthew.gerlach@altera.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, mun.yew.tham@altera.com,
 dinguyen@kernel.org, edumazet@google.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v7] dt-bindings: net: Convert
 socfpga-dwmac bindings to yaml
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

On Mon, 30 Jun 2025 14:37:48 -0700 you wrote:
> Convert the bindings for socfpga-dwmac to yaml. Since the original
> text contained descriptions for two separate nodes, two separate
> yaml files were created.
> 
> Signed-off-by: Mun Yew Tham <mun.yew.tham@altera.com>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> [...]

Here is the summary with links:
  - [v7] dt-bindings: net: Convert socfpga-dwmac bindings to yaml
    https://git.kernel.org/netdev/net-next/c/6d359cf464f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
