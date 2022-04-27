Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A348510D6A
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Apr 2022 02:50:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B220FC60466;
	Wed, 27 Apr 2022 00:50:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F210C5F1D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Apr 2022 00:50:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E5AB8B82455;
 Wed, 27 Apr 2022 00:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3C28C385A0;
 Wed, 27 Apr 2022 00:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651020612;
 bh=MwmPAc3mXaQAY/JmKfl1Jub/wzo0Wnhd1Nmr194igt8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=icpqaKWtspwfdxK9xOUr1MbWPsuY8jjKeZ+UQe+NccevNL7RjOomJBDZFLUxiI5iM
 yNnkz/mRFMFTr96/NjHCzZebJeWAak0+uuC7Vx+vMwg49upQzAQ6Sj4YnOvrJeD9Rd
 T41rUsM7CsVBcZ6vHqojYRMxRGNHiaCpn8AcQqJeu/zTxbIUB/TPTeRDp/3fbaV20x
 ZvhMsTuOHugl9OfSkNMjAa12EvV/V9elKraPz1fr4tPrBT1tnt0+BEMKbREX7yAfNZ
 4FIiH/+XkhIfGKf6xJceladMSgEtfxAs63NlcLP6Vaikd6UtC9LxMEHm6/6G2DCFvX
 2F6lFAuJmInYg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D4EB1E8DD67; Wed, 27 Apr 2022 00:50:11 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <165102061186.18100.14886294105816558907.git-patchwork-notify@kernel.org>
Date: Wed, 27 Apr 2022 00:50:11 +0000
References: <20220425154856.169499-1-marcel@ziswiler.com>
In-Reply-To: <20220425154856.169499-1-marcel@ziswiler.com>
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: fugang.duan@nxp.com, kernel@pengutronix.de, marcel.ziswiler@toradex.com,
 netdev@vger.kernel.org, s.hauer@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, shawnguo@kernel.org,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com, linux-imx@nxp.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 pabeni@redhat.com, festevam@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] net: stmmac: dwmac-imx: comment
	spelling fix
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
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 25 Apr 2022 17:48:56 +0200 you wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Fix spelling in comment.
> 
> Fixes: 94abdad6974a ("net: ethernet: dwmac: add ethernet glue logic for NXP imx8 chip")
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> [...]

Here is the summary with links:
  - [v1] net: stmmac: dwmac-imx: comment spelling fix
    https://git.kernel.org/netdev/net-next/c/b1190d5175ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
