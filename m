Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1195AFDD42
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 04:09:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A9A1C36B2A;
	Wed,  9 Jul 2025 02:09:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EFC3C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 02:09:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0856E5C6445;
 Wed,  9 Jul 2025 02:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41B7C4CEED;
 Wed,  9 Jul 2025 02:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752026984;
 bh=Tge18Np48taeWjJACOO6TUJgmCjNPLeql+dotgV6YSo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=dm+yJ3At23CkipXs+0O1nAne2zg2jFc59qtDHBiNtXDjGIP6DETAAsgcFtZXRSqyD
 1b0PiyePUBi9Sf2nCD1rcnU6gDOoUdeaFqkclFOkDQhfsDzITDS+los819gXHUMkiV
 kvKz8Z60vQ7jM64QXUN361WZWha4m1NjeVHLEs2CbaghXbh+rgKDRSCMOybTcOzBy1
 RkT/wYuChpdk538c6UeN+TZsHqsp3cJuoD1+02dXsXp3uV7a2LIdONOa2WILAWpkTl
 5JTVCPL/X3W+1XQkGiTPoWy/ayLrJ49o1RFtvChK8FLEbg2t298+pZnCXDFXUkkeiQ
 DecyY+/T+Fq+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 9605E380DBEE; Wed,  9 Jul 2025 02:10:08 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175202700747.194427.6933538958086222973.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 02:10:07 +0000
References: <20250707154409.15527-1-matthew.gerlach@altera.com>
In-Reply-To: <20250707154409.15527-1-matthew.gerlach@altera.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dinguyen@kernel.org,
 edumazet@google.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: net: altr,
 socfpga-stmmac.yaml: add minItems to iommus
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

On Mon,  7 Jul 2025 08:44:09 -0700 you wrote:
> Add missing 'minItems: 1' to iommus property of the Altera SOCFPGA SoC
> implementation of the Synopsys DWMAC.
> 
> Fixes: 6d359cf464f4 ("dt-bindings: net: Convert socfpga-dwmac bindings to yaml")
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
>  Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - dt-bindings: net: altr,socfpga-stmmac.yaml: add minItems to iommus
    https://git.kernel.org/netdev/net-next/c/8a00a173d1a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
