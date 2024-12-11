Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C43F9EC21E
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Dec 2024 03:30:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38582C7801C;
	Wed, 11 Dec 2024 02:30:31 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAD44C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Dec 2024 02:30:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 46C1AA41D95;
 Wed, 11 Dec 2024 02:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53049C4CEDD;
 Wed, 11 Dec 2024 02:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733884222;
 bh=y9rtjkxbnTlOCutyUOOiDTGb+6al6ycCqwU8ocBVdzM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=uo8Ha9AM7fvVhmBPtoowkrzIhRuXaYM05R4DUeirANT5z9tJBiJgkIWHpBOLmXU2K
 4Uhz1imZ8YTs3Ip84tPWSy1NZmv0M5RxR9mnrr+cDlACWhO/gU4xPa6Of0GCCC1s0q
 MA25s6i/Ih1CQeRngG+NG6KK7uYS4wWJn1KlSkSg8t4rMNLjug75pOfbi0PWgLL+pW
 TnaMxE3wTYlhcNfcg360nQgR1xz8olgjJBKqFA38Z7bw/8uC56WGpMeu9PgzOPuQ8F
 sk2DH2PJeH6o6gXtvgzYi11AKsQHa2EeY8on1XMHbDtB6PEvnDOYhzhouddFsyGzrb
 jjtozLougI9dQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70E08380A954; Wed, 11 Dec 2024 02:30:39 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173388423806.1090195.16162842583087657883.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 02:30:38 +0000
References: <20241208070202.203931-1-0x1207@gmail.com>
In-Reply-To: <20241208070202.203931-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Relocate extern
 declarations in common.h and hwif.h
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

On Sun,  8 Dec 2024 15:02:02 +0800 you wrote:
> The extern declarations should be in a header file that corresponds to
> their definition, move these extern declarations to its header file.
> Some of them have nowhere to go, so move them to hwif.h since they are
> referenced in hwif.c only.
> 
> dwmac100_* dwmac1000_* dwmac4_* dwmac410_* dwmac510_* stay in hwif.h,
> otherwise you will be flooded with name conflicts from dwmac100.h,
> dwmac1000.h and dwmac4.h if hwif.c try to #include these .h files.
> 
> [...]

Here is the summary with links:
  - [net-next,v1] net: stmmac: Relocate extern declarations in common.h and hwif.h
    https://git.kernel.org/netdev/net-next/c/46afe345ff18

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
