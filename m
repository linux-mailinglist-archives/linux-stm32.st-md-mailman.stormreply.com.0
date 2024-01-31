Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F316843D81
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jan 2024 12:00:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECDECC6C841;
	Wed, 31 Jan 2024 11:00:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BB13C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 11:00:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3EA786164B;
 Wed, 31 Jan 2024 11:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A26AC43394;
 Wed, 31 Jan 2024 11:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706698827;
 bh=2OUC4XA7Q0LIf8v5IFYO9haKVHB68Tj7j3b/DXJXe9g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=plKxS+iET1RueRPgBNLtSNmMwCnOnRrjOLJbNWxwmaEntP+1rH1CKp1MM1G6zXcaP
 j17n8UjrSOi7C6eLeqczfw8h9qYMekKFJ3N4G4ZoTHSeCpvh8TLhR48CsivI6rSlRM
 laTMRkb/UAV4auNptcIwRO5FTTTCkH7pGTLFNYjKvI3vV90VouyPhD8IxEL/iWo3/V
 7jG+e1E30FpAqJ7OmaJurugNVsygY/m3S/OPYVCdV6zeelNeaSG/N+OpqPfzCGE42T
 om0OJpafqacnOjUO83FpxRyYfwvGOBX3xyVSKaAskCsRbdUcqDUyZ6vkjEau4lbxDx
 OQnUDn8YV912Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6EA9DC4166F; Wed, 31 Jan 2024 11:00:27 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170669882745.1676.8675995195978883744.git-patchwork-notify@kernel.org>
Date: Wed, 31 Jan 2024 11:00:27 +0000
References: <20240126192128.1210579-1-cristian.ciocaltea@collabora.com>
In-Reply-To: <20240126192128.1210579-1-cristian.ciocaltea@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: joabreu@synopsys.com, conor+dt@kernel.org, kernel@collabora.com,
 kernel@esmil.dk, andrew@lunn.ch, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, robh+dt@kernel.org,
 samin.guo@starfivetech.com, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com,
 jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com
Subject: Re: [Linux-stm32] [RESEND PATCH v4 0/2] StarFive DWMAC support for
	JH7100
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
by David S. Miller <davem@davemloft.net>:

On Fri, 26 Jan 2024 21:21:24 +0200 you wrote:
> This is just a subset of the initial patch series [1] adding networking
> support for StarFive JH7100 SoC.
> 
> [1]: https://lore.kernel.org/lkml/20231218214451.2345691-1-cristian.ciocaltea@collabora.com/
> 
> Changes in v4:
>  - Rebased series onto next-20240125
>  - Added R-b tag from Rob in PATCH 1
>  - v3:
>    https://lore.kernel.org/lkml/20231222101001.2541758-1-cristian.ciocaltea@collabora.com/
> 
> [...]

Here is the summary with links:
  - [RESEND,v4,1/2] dt-bindings: net: starfive,jh7110-dwmac: Add JH7100 SoC compatible
    https://git.kernel.org/netdev/net-next/c/53e41b76a8ff
  - [RESEND,v4,2/2] net: stmmac: dwmac-starfive: Add support for JH7100 SoC
    https://git.kernel.org/netdev/net-next/c/8d4597b87121

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
