Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 834758C2B6D
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2024 23:05:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F909C6907A;
	Fri, 10 May 2024 21:05:37 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65FB3C030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2024 21:05:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8028ECE1EC2;
 Fri, 10 May 2024 21:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDCEC113CC;
 Fri, 10 May 2024 21:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715375125;
 bh=BitthJdeNEWLyjLdoWk+CVPiQS+IdhQPs0TUb/umdg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UGBSap0VQrmuROvPRv9pJ69IYN3kVpuj2whM7oS9PaeGp78FJDU/uRWTIJErE84aA
 6M9/x/GLlPS6qDmwNVhZaA26lOkk698s8nzlpZX8gP0rCySV7b1QBo8MWJMo/nNxfj
 PJD2T8h+5EAY/kmWXpHXaZXXMJMDaqJHiztEQbkfg08vYj3kdX/p4Zp65RkB3F67IV
 uHGvYHiaA0MjlKwoV+jAllLZa4jWcdYCYas4eBveGK3gf7+Fizrn/RX8e5LWea5gaH
 YCGZZsX3oxNw7wdDLmktOpHcPtLhY5kjw6rFCYWV/85I2y61wvGQAJwQ0B/fBb4vDW
 rR1zLwAOLQSXw==
Date: Fri, 10 May 2024 16:05:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <171537512146.746524.12713792362843036670.robh@kernel.org>
References: <20240507125442.3989284-1-amelie.delaunay@foss.st.com>
 <20240507125442.3989284-2-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240507125442.3989284-2-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-hardening@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 01/12] dt-bindings: dma: New directory
 for STM32 DMA controllers bindings
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


On Tue, 07 May 2024 14:54:31 +0200, Amelie Delaunay wrote:
> Gather the STM32 DMA controllers bindings under ./dma/stm32/.
> Then fix reference to old path in spi/st,stm32-spi.yaml: update the dmas
> property description by referring to all STM32 DMA controllers bindings.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
> v2:
> - fix reference in spi/st,stm32-spi.yaml with an updated description of the
>   dmas property to reflect the new path of STM32 DMA controllers bindings.
> ---
>  .../devicetree/bindings/dma/{ => stm32}/st,stm32-dma.yaml     | 4 ++--
>  .../devicetree/bindings/dma/{ => stm32}/st,stm32-dmamux.yaml  | 4 ++--
>  .../devicetree/bindings/dma/{ => stm32}/st,stm32-mdma.yaml    | 4 ++--
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml       | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
>  rename Documentation/devicetree/bindings/dma/{ => stm32}/st,stm32-dma.yaml (97%)
>  rename Documentation/devicetree/bindings/dma/{ => stm32}/st,stm32-dmamux.yaml (89%)
>  rename Documentation/devicetree/bindings/dma/{ => stm32}/st,stm32-mdma.yaml (96%)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
