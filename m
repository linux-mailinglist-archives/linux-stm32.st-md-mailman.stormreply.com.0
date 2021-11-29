Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB932461A4C
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 15:50:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 901BDC597B6;
	Mon, 29 Nov 2021 14:50:13 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12C17C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 14:50:12 +0000 (UTC)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 108B0B81196;
 Mon, 29 Nov 2021 14:50:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A223360E8E;
 Mon, 29 Nov 2021 14:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638197409;
 bh=AtMShSlb9t/IH0HDmrRqMefI56lTg2zqXDB8hB9qOSc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XxbJCVjL4LRqz0j266Imr5mfZruyhrwQN/wIvztJccX7J9dDTH4c2yOU4+KFfTF++
 WJGNYTrmkLk6L3VGzyGt0aRCTTuVgc+KqCMQcshYMAaVsG0S2FCsKQrKOPV4IQIDdp
 VX2eh8sEilRl4hT9UGrEfIuFscXIq+js+ONogsUhuzXP6+fHYWjfBbgOLamHNeSQDc
 jfn2ZT9FFAuTxkXD2QGuhR4UhzpZ9FuPt/QBCF/UTGX8FEncfYWt8+ekPkbMp4E/Be
 xrhWE3JS9gnEY74VBQVAClJR1FHJ45xlkdfnWXsRoZb7U5KlRT2kGt0PtXIf5VrEnd
 jE+AEDyg8dxPw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 97A65609D5;
 Mon, 29 Nov 2021 14:50:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163819740961.26434.15520154602257357539.git-patchwork-notify@kernel.org>
Date: Mon, 29 Nov 2021 14:50:09 +0000
References: <c1bab067-00ba-f6b5-f683-709f1d5b09a9@gmail.com>
In-Reply-To: <c1bab067-00ba-f6b5-f683-709f1d5b09a9@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] stmmac: remove ethtool driver
	version info
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
by David S. Miller <davem@davemloft.net>:

On Sun, 28 Nov 2021 19:45:56 +0100 you wrote:
> I think there's no benefit in reporting a date from almost 6 yrs ago.
> Let ethtool report the default (kernel version) instead.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h         | 1 -
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 1 -
>  2 files changed, 2 deletions(-)

Here is the summary with links:
  - [net-next] stmmac: remove ethtool driver version info
    https://git.kernel.org/netdev/net-next/c/09ae03e2fc9d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
