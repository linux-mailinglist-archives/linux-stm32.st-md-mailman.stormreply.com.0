Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2652F9A10A2
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 19:29:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6D3EC78032;
	Wed, 16 Oct 2024 17:29:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C000C78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 17:29:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B27015C51A8;
 Wed, 16 Oct 2024 17:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF607C4CEC5;
 Wed, 16 Oct 2024 17:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729099746;
 bh=BW13X3BVPZ8dJHNzenWTM18AmsI72wIJFWJRFxPbA0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N/a6bKwSdQt80+PgmhqSCXpEJlLy1Kt/p6ix2RBJIjIjzLrBVYeNAdeL8JivXMyWz
 G2lSzWlDR9whzWNn9f+uPWy96Ht2iPsPt1sfoZfQlEjSXrJakazkI3je8ttJtX06Hc
 5iargpPCCPjnpkL6mwyeygX+e0d9Svw7ui7eqyFDnNwY2oqpUEykj541iT/W79Ms7v
 8Ew1J4NNk8FWNuhslTqE233QgI/jwVmXVQ58DCHq814IA4tvSwDkslqNW+wrnTL28k
 iTC/lIYGsK/s959v2qteA8TrDJzysBrZhH1CIPZcKVBBY05Nqit0pEoXYGK9pooGol
 E6SQen2iKafZw==
Date: Wed, 16 Oct 2024 12:29:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <172909974498.2070654.12815494490287458504.robh@kernel.org>
References: <20241016-rng-mp25-v2-v4-0-5dca590cb092@foss.st.com>
 <20241016-rng-mp25-v2-v4-1-5dca590cb092@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241016-rng-mp25-v2-v4-1-5dca590cb092@foss.st.com>
Cc: marex@denx.de, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivia Mackall <olivia@selenic.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/4] dt-bindings: rng: add st,
	stm32mp25-rng support
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


On Wed, 16 Oct 2024 10:04:18 +0200, Gatien Chevallier wrote:
> Add RNG STM32MP25x platforms compatible. Update the clock
> properties management to support all versions.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> Changes in V4:
> 	- Changed the restrictions on clock-names per compatible
> 	- Removed a useless constraint on clocks Items
> 
> Changes in V3:
> 	- Add constraint on clock-names for st,stm32mp25-rng compatible
> 
> Changes in V2
> 	-Fix missing min/maxItems
> 	-Removed MP25 RNG example
> 	-Renamed RNG clocks for mp25 to "core" and "bus"
> ---
>  .../devicetree/bindings/rng/st,stm32-rng.yaml      | 28 +++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
