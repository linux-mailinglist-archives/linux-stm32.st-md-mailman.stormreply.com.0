Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C40E89F1C6A
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Dec 2024 04:40:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F57EC78015;
	Sat, 14 Dec 2024 03:40:23 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F48AC78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Dec 2024 03:40:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 54245A42EF0;
 Sat, 14 Dec 2024 03:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC47C4CED3;
 Sat, 14 Dec 2024 03:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734147615;
 bh=YDgnXG5WCYEBSkQpsVmqq1r7mQrwm3iyan9MExSKB6M=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=iLkABP6bAFbvceSxRminblY6hQGbi5rk0bqnn8vercTUSMGJUq5oYb3Z68Jehrt3o
 QJ4Q7fiC7323XbMAP6//9zqf626SAfSFujtsZbbJJ5BloMW7jZXZSVwCHWFhrTDpa4
 OLleMBswQm1ykAAGX9CEliHF48ISQxfQpML11Wfi5Is9pXIQ0dJpatzpfaK92XV7Rj
 pdfGT1eLRWo31WXyhLZdxpyqLdPoVeT5MmSEC9CrQLbRYKAiE3Fc6Q6T9MqXv7MX7l
 YEPneYYtN8yOwHRkYudZpm2Wo+OFTdeg/mwEB+LbkBvUta7TeGWDLlTgG12mdfJbNK
 uhcKRbdLnPYRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ECC9D380A959; Sat, 14 Dec 2024 03:40:32 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173414763174.3237238.13876454174821375749.git-patchwork-notify@kernel.org>
Date: Sat, 14 Dec 2024 03:40:31 +0000
References: <20241212033325.282817-1-0x1207@gmail.com>
In-Reply-To: <20241212033325.282817-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com, kuba@kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Drop redundant
 dwxgmac_tc_ops variable
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

On Thu, 12 Dec 2024 11:33:25 +0800 you wrote:
> dwmac510_tc_ops and dwxgmac_tc_ops are completely identical,
> keep dwmac510_tc_ops to provide better backward compatibility.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/hwif.c      |  4 ++--
>  drivers/net/ethernet/stmicro/stmmac/hwif.h      |  1 -
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 11 -----------
>  3 files changed, 2 insertions(+), 14 deletions(-)

Here is the summary with links:
  - [net-next,v1] net: stmmac: Drop redundant dwxgmac_tc_ops variable
    https://git.kernel.org/netdev/net-next/c/9bc5c9515b48

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
