Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBE271F97C
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Jun 2023 07:00:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB3B1C6B442;
	Fri,  2 Jun 2023 05:00:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD3BDC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jun 2023 05:00:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CAF964C44;
 Fri,  2 Jun 2023 05:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2A17C4339B;
 Fri,  2 Jun 2023 05:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685682020;
 bh=rUHmOXEYpK/oNBqcnTdtouxfSre1j04IJR96syYNKDw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Vsbzlpgdftk8smVI3yWSPQcDhM00q0Fb6ZUHq53dFVgfRBZfrtlRAQFga4wIJoVFd
 GeC7zQlHYpS8h6SGynQSJBGdqsb2iHAQuzIUp7dPdAdfgQL2wFZ37BameN0mY9xKQx
 SvsV7KQYO/qPAITjmG7L2DQq3LeJzN51/OUSpwWviRWlb1AG6ABkiRLHI7KrVf6oxP
 i/41ZPo/EGc9lN2MZ3z1/knMQA6htsN30dEdUqpMXKMWpNjFZKgXKdWMNn4vb9g9nA
 CXO1BgH82XuZyHRHRYnz4SbduC6VHUAqOWvEXk5qPVnjhFyLR2C7mo78nJzqBpampD
 x7KOVAuihf5sg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 979BDE29F3F; Fri,  2 Jun 2023 05:00:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168568202061.24823.10947582942293943932.git-patchwork-notify@kernel.org>
Date: Fri, 02 Jun 2023 05:00:20 +0000
References: <20230531102113.3353065-1-o.rempel@pengutronix.de>
In-Reply-To: <20230531102113.3353065-1-o.rempel@pengutronix.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 kernel@pengutronix.de, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 jerome.pouiller@silabs.com
Subject: Re: [Linux-stm32] [PATCH v3 0/2] Extend dt-bindings for PSE-PD
 controllers and update prtt1c dts
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

On Wed, 31 May 2023 12:21:11 +0200 you wrote:
> changes v3:
> - reword commit message for the pse-controller.yaml patch
> - drop podl-pse-regulator.yaml patch
> 
> changes v2:
> - extend ethernet-pse regexp in the PoDL PSE dt-bindings
> 
> [...]

Here is the summary with links:
  - [v3,1/2] dt-bindings: net: pse-pd: Allow -N suffix for ethernet-pse node names
    https://git.kernel.org/netdev/net-next/c/bd415f6c748e
  - [v3,2/2] ARM: dts: stm32: prtt1c: Add PoDL PSE regulator nodes
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
