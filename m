Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CB3998F7C
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2024 20:11:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1FACC71290;
	Thu, 10 Oct 2024 18:11:32 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 442B7C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2024 18:11:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6DDBDA44C84;
 Thu, 10 Oct 2024 18:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50672C4CEC5;
 Thu, 10 Oct 2024 18:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728583883;
 bh=9eB11WqtyHOt+MBm/RTQKveBaJUUL+c2eHCqHHpop84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rkLoNcUhN4Nhu8seaL5Sq3HThSd9JqrmwB8zT4kdzEx9wZC/Ao/cVGvsFyliBue6C
 EMYHnrxHWWB90dzEd+iww7ivqMpPgHi6lbXY4GIX8ALUync3fsCvkCBmj/zxpW8qQY
 Wbnkr50JnbaaALbFPhzd/VzAFQlNnXF+/NvnEPvcoM5oCtk9LnS/72lCZXObY5DANn
 gN8/EwrvK5ZbAtaE0HGT7Iv9lcc98yrIp9nOW8RemMErjoxWJ/W7QX+B71ai8JRWdt
 k1jlSHzlkurbAziPrUN0g/gadXnOJFv5haDAJUXQCBQteBCvLgslnYAor7EkpLsN7v
 IZGiSvg1cu3Yw==
Date: Thu, 10 Oct 2024 13:11:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <172858388128.2107709.9101314940508767335.robh@kernel.org>
References: <20241010-dma3-mp25-updates-v1-0-adf0633981ea@foss.st.com>
 <20241010-dma3-mp25-updates-v1-1-adf0633981ea@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241010-dma3-mp25-updates-v1-1-adf0633981ea@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/11] dt-bindings: dma: stm32-dma3:
 prevent packing/unpacking mode
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


On Thu, 10 Oct 2024 16:27:51 +0200, Amelie Delaunay wrote:
> When source data width/burst and destination data width/burst are
> different, data are packed or unpacked in DMA3 channel FIFO.
> Data are pushed out from DMA3 channel FIFO when the destination burst
> length (= data width * burst) is reached.
> If the channel is stopped before the transfer end, and if some bytes are
> packed/unpacked in the DMA3 channel FIFO, these bytes are lost.
> Indeed, DMA3 channel FIFO has no flush capability, only reset.
> To avoid potential bytes lost, pack/unpack must be prevented by setting
> memory data width/burst equal to peripheral data width/burst.
> Memory accesses will be penalized. But it is the only way to avoid bytes
> lost.
> 
> Some devices (e.g. cyclic RX like UART) need this, so add the possibility
> to prevent pack/unpack feature, by setting bit 16 of the 'DMA transfer
> requirements' bit mask.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  Documentation/devicetree/bindings/dma/stm32/st,stm32-dma3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
