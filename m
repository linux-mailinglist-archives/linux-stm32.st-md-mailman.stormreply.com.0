Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1956D9E115C
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Dec 2024 03:34:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAD01C6C83D;
	Tue,  3 Dec 2024 02:34:29 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 608E5C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 02:34:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 41246A41378;
 Tue,  3 Dec 2024 02:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAADC4CED1;
 Tue,  3 Dec 2024 02:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733193267;
 bh=9JE5ip2L5ouGt0z5lwAg62YYu/vSbq3Mo3C/T0xH0CM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KlkySCNMcwNPFqyfUgBGbehIGWTkdlEjXEdH5GQI09WE4a0bQfq0GD41itaMZGVjJ
 UZ/ryNxkrEjDXr0vVRWjTAIhey4741FPATykr/HyrJqwf3F4oLvp7ZNiruwdqLrVCZ
 BA3w6rZLNggrVwq6LNns8HWq9Xe1EGPG7B+iVDYRZvGqeGHedGd0U0vR5tmv3adHr8
 AHY5UNqDLb177o7aDmwulNV4EXtcU6wNgbUGGsfzJtg5sT5GnnFCt/u0ZW7Va1dxC3
 WUREEPyiWPxSmDHDMkuMbaNdtHlI1zThDQpVfJBUpRDC+SL25dOOHAFOEIxaNMmtGp
 onoWaa1578JYA==
Date: Mon, 2 Dec 2024 18:34:25 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241202183425.4021d14c@kernel.org>
In-Reply-To: <20241203100331.00007580@gmail.com>
References: <20241021061023.2162701-1-0x1207@gmail.com>
 <d8112193-0386-4e14-b516-37c2d838171a@nvidia.com>
 <20241128144501.0000619b@gmail.com>
 <20241202163309.05603e96@kernel.org>
 <20241203100331.00007580@gmail.com>
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

On Tue, 3 Dec 2024 10:03:31 +0800 Furong Xu wrote:
> I requested Jon to provide more info about "Tx DMA map failed" in previous
> reply, and he does not respond yet.

What does it mean to provide "more info" about a print statement from
the driver? Is there a Kconfig which he needs to set to get more info?
Perhaps you should provide a debug patch he can apply on his tree, that
will print info about (1) which buffer mapping failed (head or frags);
(2) what the physical address was of the buffer that couldn't be mapped.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
