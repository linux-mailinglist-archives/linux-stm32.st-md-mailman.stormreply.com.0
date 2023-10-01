Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 831947B4649
	for <lists+linux-stm32@lfdr.de>; Sun,  1 Oct 2023 10:33:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DD57C6B460;
	Sun,  1 Oct 2023 08:33:53 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A22F0C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Oct 2023 08:33:51 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1qmrtL-002PUo-Ba; Sun, 01 Oct 2023 16:33:32 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Sun, 01 Oct 2023 16:33:35 +0800
Date: Sun, 1 Oct 2023 16:33:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <ZRku36epapNNQP3b@gondor.apana.org.au>
References: <20230921080301.253563-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921080301.253563-1-gatien.chevallier@foss.st.com>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/9] hwrng: stm32: support STM32MP13x
	platforms
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

On Thu, Sep 21, 2023 at 10:02:52AM +0200, Gatien Chevallier wrote:
> The STM32MP13x platforms have a RNG hardware block that supports
> customization, a conditional reset sequences that allows to
> recover from certain situations and a configuration locking
> mechanism.
> 
> This series adds support for the mentionned features. Note that
> the hardware RNG can and should be managed in the secure world
> for this platform, hence the rng not being default enabled on
> the STM32MP135F-DK board.
> 
> Changes in V2:
> 	- Use pm_ptr() and add __maybe_unused on PM API
> 	- Correct bug using WARN_ON
> 
> Changes in V3:
> 	- Squash of bindings patches
> 	- st,rng-lock-conf property declaration rework
> 	- Fix stm32_rng_pm_ops declaration in patch [5/9]
> 
> Gatien Chevallier (9):
>   dt-bindings: rng: introduce new compatible for STM32MP13x
>   hwrng: stm32 - use devm_platform_get_and_ioremap_resource() API
>   hwrng: stm32 - implement STM32MP13x support
>   hwrng: stm32 - implement error concealment
>   hwrng: stm32 - rework error handling in stm32_rng_read()
>   hwrng: stm32 - restrain RNG noise source clock
>   hwrng: stm32 - support RNG configuration locking mechanism
>   hwrng: stm32 - rework power management sequences
>   ARM: dts: stm32: add RNG node for STM32MP13x platforms
> 
>  .../devicetree/bindings/rng/st,stm32-rng.yaml |  20 +-
>  arch/arm/boot/dts/st/stm32mp131.dtsi          |   8 +
>  drivers/char/hw_random/stm32-rng.c            | 511 +++++++++++++++---
>  3 files changed, 455 insertions(+), 84 deletions(-)
> 
> -- 
> 2.25.1

Patches 1-8 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
