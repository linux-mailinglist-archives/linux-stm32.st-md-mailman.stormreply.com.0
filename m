Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1021842484
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 13:10:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 750ACC6C820;
	Tue, 30 Jan 2024 12:10:31 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 563C1C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 12:10:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E5B73CE1A1F;
 Tue, 30 Jan 2024 12:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25058C43394;
 Tue, 30 Jan 2024 12:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706616626;
 bh=ZWN9I22FnsH58CTQa5pd4CXfCR+OhSYKRggqL9Rt5Gg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GHvQcBtT0D+CRZV3GeXl7jiKSdGS9wcN/Mdbc1b93f4Ej49kP7UZsKHmiyUK/FnBk
 foZMC5RTikbC0vpeGtQSeYt2Kw7vFfufSjWLuPFiGRX6BIIQoTVTlV8yCSaFV2j9+G
 qBLUximMUOPToY3L9+KwaZwzqL5jNE9wHHVywHepDcNpEdp4eaC84Uk8MvsPUfUPL1
 WTy9KTtKfJGzp5QLIr79OzCK/qHyCe1HOu9ZKgyniqb83WL5N0KXe4BCLeSwMUF/vy
 WmEZtC3oTmEhDyM+ppDu9fiPwuc/3E86Amot6cNBa1QWIuY7/uwssRE3J8Q7uNQpMG
 86PIu7jSARyoA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0A2E7E3237E; Tue, 30 Jan 2024 12:10:26 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <170661662603.28218.1318230641182920988.git-patchwork-notify@kernel.org>
Date: Tue, 30 Jan 2024 12:10:26 +0000
References: <cover.1706256158.git.esben@geanix.com>
In-Reply-To: <cover.1706256158.git.esben@geanix.com>
To: Esben Haabendal <esben@geanix.com>
Cc: festevam@gmail.com, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 netdev@vger.kernel.org, s.hauer@pengutronix.de,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, quic_abchauha@quicinc.com,
 linux-imx@nxp.com, mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com,
 kuba@kernel.org, rohan.g.thomas@intel.com, pabeni@redhat.com,
 shawnguo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v2 0/2] net: stmmac: dwmac-imx: Time Based
	Scheduling support
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

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 26 Jan 2024 10:10:40 +0100 you wrote:
> This small patch series allows using TBS support of the i.MX Ethernet QOS
> controller for etf qdisc offload.
> It achieves this in a similar manner that it is done in dwmac-intel.c,
> dwmac-mediatek.c and stmmac_pci.c.
> 
> Changes since v1:
> 
> [...]

Here is the summary with links:
  - [v2,1/2] net: stmmac: do not clear TBS enable bit on link up/down
    https://git.kernel.org/netdev/net/c/4896bb7c0b31
  - [v2,2/2] net: stmmac: dwmac-imx: set TSO/TBS TX queues default settings
    https://git.kernel.org/netdev/net/c/3b12ec8f618e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
