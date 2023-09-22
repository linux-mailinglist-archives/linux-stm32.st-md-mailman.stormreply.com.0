Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC797ABA9F
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 22:49:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38A94C65E4F;
	Fri, 22 Sep 2023 20:49:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C0E1C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 20:49:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F0ADE60BDB;
 Fri, 22 Sep 2023 20:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E0DC433C8;
 Fri, 22 Sep 2023 20:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695415770;
 bh=FPBJggAqY3MztbyF5zZ2NdjIeZqv2URtl6MtPiF6gnQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QhQdNr5AXpQdzHkF60qZT6YR4V9QaZ0PBw35A2BRTzX2/EeYjvotEXkl+Ygn6/qnF
 k9y+Xu508Ix2oAPSXjWqNL24akI3+Pb68NuYrTpvQQ4yRUOkoDsrWGhNOLg8mgGipW
 C2ES7eZrzRW862C5sGdbZN3SVh/VcT6BE6C24LBlLTQrPZ3/vj0O6fWeVLjaNU9pDw
 awEOaez533uRlXrv2dmKh6Ya18xtQLzaSgQi6+jdaU8Kz74OJP0abISysC74Zz+BPe
 wVGnjxKNX/pfPn6eHvmlKkR1E0NBEp2GlwlzY8jhJlivxHtprysh7d6oxuRrwJX6xZ
 Uhuoibj/XBQcg==
Received: (nullmailer pid 3555012 invoked by uid 1000);
 Fri, 22 Sep 2023 20:49:27 -0000
Date: Fri, 22 Sep 2023 15:49:27 -0500
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <169541574331.3554336.16089460775037826049.robh@kernel.org>
References: <20230921080301.253563-1-gatien.chevallier@foss.st.com>
 <20230921080301.253563-2-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921080301.253563-2-gatien.chevallier@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-crypto@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/9] dt-bindings: rng: introduce new
 compatible for STM32MP13x
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


On Thu, 21 Sep 2023 10:02:53 +0200, Gatien Chevallier wrote:
> Introduce st,stm32mp13-rng compatible and add st,rng-lock-conf.
> 
> If st,rng-lock-conf is set, the RNG configuration in RNG_CR, RNG_HTCR
> and RNG_NSCR will be locked. It is supported starting from the RNG
> version present in the STM32MP13
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V3:
> 	- Squashed with: patch [V2 07/10]
> 	- Declare st,rng-lock-conf at top level and restrain its uses
> 	  depending on the compatible. I discarded Rob's tag as for
> 	  the modifications.
> 
>  .../devicetree/bindings/rng/st,stm32-rng.yaml | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
