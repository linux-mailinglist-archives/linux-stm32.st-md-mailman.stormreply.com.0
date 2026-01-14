Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF172D2172D
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 22:52:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E5DDC8F274;
	Wed, 14 Jan 2026 21:52:07 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E812C8F261
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 21:52:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E1728437C2;
 Wed, 14 Jan 2026 21:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B14CC4CEF7;
 Wed, 14 Jan 2026 21:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768427524;
 bh=M1gJhCbLOU4I/BZFPxEOzvEA0Bnn9+kKwnxcwbbgbkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kwWwxikyHO4uMF7uRfY8WsAKTfTOC5gGgvBeg80DGMtleeRKM40iWnh8pdsn4DKtp
 q3Y+R51snbfadJlsqcQeacKH64t3GUoczhhBU38DtbP1sMw06HgZmdfHubYNXatH1f
 Uj3y3WqXHdBr5rDXDrwOO6/BBE9pOxRD73krvnp661saWIQ3hjOh4GCHlOXMS1nLxV
 AhBWXK1AHTENiCh5Usa0mwV6rXL6dAFEXxm4CxblQmzHW9SqxakDsS+IOsHhSFRFaF
 PFUV/1ffmIP+0IHbpsi1UQ/iBwZbkUr5wD6CULCpPSQ/eFEiBcsJPSfEon0yr2gxHz
 I1+eqycXqmEMA==
Date: Wed, 14 Jan 2026 15:52:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <176842752326.3259543.1333457446847101857.robh@kernel.org>
References: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
 <20260106-stm32-dcmi-dma-chaining-v2-9-70688bccd80a@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106-stm32-dcmi-dma-chaining-v2-9-70688bccd80a@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 09/12] dt-bindings: media: st: dcmi:
 add DMA-MDMA chaining properties
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


On Tue, 06 Jan 2026 12:34:37 +0100, Alain Volmat wrote:
> Add properties update and new sram property necessary in order
> to enable the DMA-MDMA chaining.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> Change in v2:
>   - correct typo (phandles -> phandle)
>   - remove explanation about generic binding sram.yaml
> ---
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
