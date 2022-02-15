Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C96E04B62FF
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 06:42:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DB48C5F1F9;
	Tue, 15 Feb 2022 05:42:21 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D11BC23E53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Feb 2022 05:42:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 91CF7B8171A;
 Tue, 15 Feb 2022 05:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F64FC340EC;
 Tue, 15 Feb 2022 05:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644903739;
 bh=ea5uavDZWYK+1btNRQTGqmqDvg/Qnuw0OTjPXj0lYaA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c7+SElxUQ+qFQPU2reBVjOq/J4pODDFbxRufI7yBhTG4U4XceJvnk6gRFXHvWvax9
 eoVV8+AQHviE7J2oaANhRo8nrxhKJng8moYtiv9QPlgrWSLoQUz7sg3IgZEkAXdsHs
 if/jmjQsNyw9Ifpm8/+qbbzvEBVhrPyqkPinZWLePoPktx7xx3IcF3sOwhOZhX5m8Q
 wXvPlHHSAyJq93PPe9GTdxwHPqQuZzY8Nbkt1QB9MYt7W6ohQ8z3qv77ipZxx/TT8o
 EMsqVbEkmh9vqlaSSY5goh1XwmjbDXEIl9GwS5h6Vhzf2XclL7nu3TgcRnwGJnmMNa
 t/UyqHIRCzLDQ==
Date: Tue, 15 Feb 2022 11:12:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <Ygs9N9VTEIwciL4o@matsya>
References: <20220117091740.11064-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117091740.11064-1-amelie.delaunay@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Alain Volmat <alain.volmat@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dma: set dma_device
	max_sg_burst
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

On 17-01-22, 10:17, Amelie Delaunay wrote:
> Some stm32-dma consumers [1] rather use dma_get_slave_caps() to get
> max_sg_burst of their DMA channel as dma_get_max_seg_size() is specific to
> the DMA controller.
> All stm32-dma channels have the same features so, don't need to implement
> device_caps ops. Let dma_get_slave_caps() relies on dma_device
> configuration.
> That's why this patch sets dma_device max_sg_burst to the maximum segment
> size, which is the maximum of data items that can be transferred without
> software intervention.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
