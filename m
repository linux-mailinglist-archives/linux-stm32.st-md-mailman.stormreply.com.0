Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE45A9E0FC1
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Dec 2024 01:33:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D887C6C83D;
	Tue,  3 Dec 2024 00:33:19 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C673CC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 00:33:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7DF1FA4133F;
 Tue,  3 Dec 2024 00:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0433C4CED1;
 Tue,  3 Dec 2024 00:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733185991;
 bh=P+cKs927/DzHr7RXmSOFRn/pT0qYBrswblnynVURMiU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e4NCaqBHn0r9TX+saVe2U42+z147y9cdC8ZqLiVtF1Yo2vKYdm5706b8l6NhTT0lG
 aCoFRkZo/8LOiRyNpfGg6d2MLfgnzpXSle4VVoH0Uh08Rw2aWjJGEpj+9y9Nh8Dgxh
 R91ouvGM5u6ylzIkH+YDw6+8qokCxXCn5q9quqtsB/O2Gg5IO/F+Qur+1QBIxpWday
 QCqmAkoTzyzV3KD3Ts+V0yjuNt1/Ey1sMSQfpSGL4PF5nSNRuL+YLJWo9RDJ6PlzFi
 tRwGY7Ie+ybLDWjFlRwYe3vOQehxOKL4h/1nEh6w728JU7cPazg3zrEvo77/Iy7BUQ
 LRKjnQriXpnaA==
Date: Mon, 2 Dec 2024 16:33:09 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241202163309.05603e96@kernel.org>
In-Reply-To: <20241128144501.0000619b@gmail.com>
References: <20241021061023.2162701-1-0x1207@gmail.com>
 <d8112193-0386-4e14-b516-37c2d838171a@nvidia.com>
 <20241128144501.0000619b@gmail.com>
MIME-Version: 1.0
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Thierry Reding <treding@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: TSO: Fix unbalanced
 DMA map/unmap for non-paged SKB data
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

On Thu, 28 Nov 2024 14:45:01 +0800 Furong Xu wrote:
> > Let me know if you need any more information.
> 
> [  149.986210] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> and
> [  245.571688] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> [  245.575349] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> are reported by stmmac_xmit() obviously, but not stmmac_tso_xmit().
> 
> And these crashes are caused by "Tx DMA map failed", as you can see that
> current driver code does not handle this kind of failure so well. It is clear
> that we need to figure out why Tx DMA map failed.
> 
> This patch corrects the sequence and timing of DMA unmap by waiting all
> DMA transmit descriptors to be closed by DMA engine for one DMA map in
> stmmac_tso_xmit(), it never leaks DMA addresses and never introduces
> other side effect.
> 
> "Tx DMA map failed" is a weird failure, and I cannot reproduce this failure
> on my device with DWMAC CORE 5.10a(Synopsys ID: 0x51) and DWXGMAC CORE 3.20a.

Let me repeat Jon's question - is there any info or test you need from
Jon to make progress with a fix?

If Jon's board worked before and doesn't work with this patch we will
need *a* fix, if no fix is provided our only choice is revert.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
