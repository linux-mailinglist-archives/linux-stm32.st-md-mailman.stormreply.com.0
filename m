Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E048AE8A4
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 15:50:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CC69C7128A;
	Tue, 23 Apr 2024 13:50:47 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F309C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 13:50:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 56E52CE10F7;
 Tue, 23 Apr 2024 13:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE67C32783;
 Tue, 23 Apr 2024 13:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713880242;
 bh=69xKIHYi9IlkPeRLSshR5Kkz2te6ObXlX0YWGXKs98A=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=uJRvjvv+NskakdFYTyFSA8LvJusLkXDk85F1TIbbT6zb04rUFmlCmdZJbPRZJctwv
 fyLDEgsPmHdVYnqa2irO5oOhhnc5gVEkb7KmGBIk56+RYNRZkav5cWgxyhlm87IzXv
 eMLCy4fXhtNLZMVGt+GkXPnTWQhHykIclEoBLxur9mMYJrWv3ogAdZNM/s6/AOWn3D
 rNbNtLZ7nabTNi6EpZ/FlU4ArW1RKkoFtp7sw93audwp4THtxqn3012OrZBEY7bVbJ
 eBaXyZ7FeBe0vj/3yDjC6u53Q47gvgIAMXDYt3R/cNRL+LkE3JLlIoHPHTq+xh57y0
 8W4EMtW3zYA3A==
Date: Tue, 23 Apr 2024 08:50:41 -0500
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20240423123302.1550592-2-amelie.delaunay@foss.st.com>
References: <20240423123302.1550592-1-amelie.delaunay@foss.st.com>
 <20240423123302.1550592-2-amelie.delaunay@foss.st.com>
Message-Id: <171388024017.101826.4338039717721212935.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-hardening@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/12] dt-bindings: dma: New directory for
 STM32 DMA controllers bindings
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


On Tue, 23 Apr 2024 14:32:51 +0200, Amelie Delaunay wrote:
> Gather the STM32 DMA controllers bindings under ./dma/stm32/
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  .../devicetree/bindings/dma/{ => stm32}/st,stm32-dma.yaml     | 4 ++--
>  .../devicetree/bindings/dma/{ => stm32}/st,stm32-dmamux.yaml  | 4 ++--
>  .../devicetree/bindings/dma/{ => stm32}/st,stm32-mdma.yaml    | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>  rename Documentation/devicetree/bindings/dma/{ => stm32}/st,stm32-dma.yaml (97%)
>  rename Documentation/devicetree/bindings/dma/{ => stm32}/st,stm32-dmamux.yaml (89%)
>  rename Documentation/devicetree/bindings/dma/{ => stm32}/st,stm32-mdma.yaml (96%)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/spi/st,stm32-spi.yaml references a file that doesn't exist: Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
Documentation/devicetree/bindings/spi/st,stm32-spi.yaml: Documentation/devicetree/bindings/dma/st,stm32-dma.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240423123302.1550592-2-amelie.delaunay@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
