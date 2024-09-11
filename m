Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63607975DC6
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Sep 2024 01:51:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19E57C6C855;
	Wed, 11 Sep 2024 23:51:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB89EC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 23:51:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A49F95C0773;
 Wed, 11 Sep 2024 23:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AE2C4CEC0;
 Wed, 11 Sep 2024 23:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726098701;
 bh=Y6kf4Wi6KDs88Xo6Q2D9THZIQ/bLuNqar2amyrJ7IBE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f+ZcnKWyi/9UeOBLlF/Z3b+5pgzmUkwOiy10JBnuRxQTfqc4Hosspr/wpoDJIXVtI
 kk0Li2BICh2E/3SN852se+VptdvCM2DHcgLnkE0ORU+Y5ST9cfAITgQLxSLvpZtB8l
 cP7ALk2w2e5Qos/NuLD9CdmEP0Ect8bsLcdMpfJ8b1+b2HAIht0Sp/fZ2cd7GyPmJy
 9bLOKQqMIKNXXxWOnOx+r8fPJc/IqtLrGWUeo4yJE6I75CJiYJahEgze1GP1U7y7fn
 Ix/Lxos3H3MZngCNdicv+J6H7X8MkOpu7NQwIqH8EH1F754GbaaG0nel0DeqXjyNbk
 87ebwq7P0sF9A==
Date: Wed, 11 Sep 2024 16:51:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>
Message-ID: <20240911165140.566d9fdb@kernel.org>
In-Reply-To: <20240910124841.2205629-2-quic_jsuraj@quicinc.com>
References: <20240910124841.2205629-1-quic_jsuraj@quicinc.com>
 <20240910124841.2205629-2-quic_jsuraj@quicinc.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, kernel@quicinc.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Prasad Sodagudi <psodagud@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: allocate separate page
	for buffer
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

On Tue, 10 Sep 2024 18:18:41 +0530 Suraj Jaiswal wrote:
> Currently for TSO page is mapped with dma_map_single()
> and then resulting dma address is referenced (and offset)
> by multiple descriptors until the whole region is
> programmed into the descriptors.
> This makes it possible for stmmac_tx_clean() to dma_unmap()
> the first of the already processed descriptors, while the
> rest are still being processed by the DMA engine. This leads
> to an iommu fault due to the DMA engine using unmapped memory
> as seen below:
> 
> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
> iova=0xfc401000, fsynr=0x60003, cbfrsynra=0x121, cb=38
> 
> Descriptor content:
>      TDES0       TDES1   TDES2   TDES3
> 317: 0xfc400800  0x0     0x36    0xa02c0b68
> 318: 0xfc400836  0x0     0xb68   0x90000000
> 
> As we can see above descriptor 317 holding a page address
> and 318 holding the buffer address by adding offset to page
> addess. Now if 317 descritor is cleaned as part of tx_clean()
> then we will get SMMU fault if 318 descriptor is getting accessed.

The device is completing earlier chunks of the payload before the entire
payload is sent? That's very unusual, is there a manual you can quote
on this?

> To fix this, let's map each descriptor's memory reference individually.
> This way there's no risk of unmapping a region that's still being
> referenced by the DMA engine in a later descriptor.

This adds overhead. Why not wait with unmapping until the full skb is
done? Presumably you can't free half an skb, anyway.

Please added Fixes tag and use "PATCH net" as the subject tag/prefix.
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
