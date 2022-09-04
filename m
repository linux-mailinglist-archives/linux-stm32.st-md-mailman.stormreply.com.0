Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A99855AC5A4
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Sep 2022 19:18:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 476B6C04004;
	Sun,  4 Sep 2022 17:18:26 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 201E0C03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Sep 2022 17:18:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 18AE5CE0B97;
 Sun,  4 Sep 2022 17:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B243C433D6;
 Sun,  4 Sep 2022 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662311900;
 bh=mrk5pkJcHTTsmwCZFN9V23o4HfG3eXfOH8HbEbJtxJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nptjcenw/XHolTmJsfu437e63yq4FMUbBY1rW3hXzrzuqDuUBiqktWBlw4h9sg9kh
 0ASWXE5IYedKw/F1BTPgeKgHnsjWPKUl7hav+YWDGfAKlQJn+TSu5a5Tcu9l8E68x9
 T5JcNbMzHly1AG1sLTu0i2KjcUgxzstMwVQqgWoVspq31qEfo4d4M1jLHFj+a5BitX
 DNF0lV/ZMYL6Fu4sJ5MJLCgvPO57T3JgE2DlEuI/b04Av9PJRcFxip2JK7JKRtjpbk
 DYNSW8GGGnrcLjFVoa11pATgpI3MyEVMV9JNpE8yN/UVWgr5S7CJoTAlb9ZUXqhd4u
 J3pfF82X0paMg==
Date: Sun, 4 Sep 2022 22:48:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <YxTd1jBS3xk/YT6m@matsya>
References: <20220829154646.29867-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220829154646.29867-1-amelie.delaunay@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v3 0/6] STM32 DMA-MDMA chaining
	feature
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

On 29-08-22, 17:46, Amelie Delaunay wrote:
> This patchset (re)introduces STM32 DMA-MDMA chaining feature.
> 
> As the DMA is not able to generate convenient burst transfer on the DDR,
> it penalises the AXI bus when accessing the DDR. While it accesses
> optimally the SRAM. The DMA-MDMA chaining then consists in having an SRAM
> buffer between DMA and MDMA, so the DMA deals with peripheral and SRAM,
> and the MDMA with SRAM and DDR.
> 
> The feature relies on the fact that DMA channel Transfer Complete signal
> can trigger a MDMA channel transfer and MDMA can clear the DMA request by
> writing to DMA Interrupt Clear register.
> 
> A deeper introduction can be found in patch 1.
> 
> Previous implementation [1] has been dropped as nacked.
> Unlike this previous implementation (where all the stuff was embedded in
> stm32-dma driver), the user (in peripheral drivers using dma) has now to
> configure the MDMA channel.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
