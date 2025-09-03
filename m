Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DABDB42CDE
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 00:40:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D045FC36B2F;
	Wed,  3 Sep 2025 22:40:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04F87C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 22:40:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8FD0C44C2B;
 Wed,  3 Sep 2025 22:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CC8C4CEF4;
 Wed,  3 Sep 2025 22:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756939204;
 bh=vb66h9+AzAw2lQhvhLgXxbLZecvq8uS2NeBKhLSK7Gk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=N6RhNx8jpRROyDZe+XUWTkfm1JtwHinLea//T8JIUgoujDUDTvV/fzLjeq3NijALK
 PtjnUz3Ij0I3iRQtKM1m9RNvrnmDApzwbQx3DBMhiX7JOOeUA2urDZkNIxMZ0oPUFO
 dyITwlOW6DDwDGzF7Y1Kb2xdl1XGQETChSx8ShkWKCZUtOx3IfQYRmjL7smjHE5SSN
 BGMSgo8qzH9Ebb66sbypzr/QVW4mg4EFBIWBxo7IuTjs+6wjgLR/pK1Xc5pJIcZ0e3
 gHJccWVPVB72HhNsUbLlqomja6f6Hu/0MWKeb8Qlvpz+7YaPAi7hm1hcRgDfZmvdg/
 3hHfOr3aaAJpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE77D383C259; Wed,  3 Sep 2025 22:40:10 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175693920948.1224224.17708323821757004154.git-patchwork-notify@kernel.org>
Date: Wed, 03 Sep 2025 22:40:09 +0000
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 geert+renesas@glider.be, romain.gantois@bootlin.com, netdev@vger.kernel.org,
 magnus.damm@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 matthew.gerlach@altera.com, davem@davemloft.net, devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: net: altr,
 socfpga-stmmac: Constrain interrupts
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

On Tue,  2 Sep 2025 17:40:52 +0200 you wrote:
> STMMAC on SoCFPGA uses exactly one interrupt in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> [...]

Here is the summary with links:
  - [v2,1/2] dt-bindings: net: altr,socfpga-stmmac: Constrain interrupts
    https://git.kernel.org/netdev/net-next/c/f672fcd8e6c4
  - [v2,2/2] dt-bindings: net: renesas,rzn1-gmac: Constrain interrupts
    https://git.kernel.org/netdev/net-next/c/69cd99350740

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
