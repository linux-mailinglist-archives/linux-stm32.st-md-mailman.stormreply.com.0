Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0060688EC3
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Feb 2023 06:04:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6387AC6904E;
	Fri,  3 Feb 2023 05:04:39 +0000 (UTC)
Received: from formenos.hmeau.com (167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DE0AC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Feb 2023 05:04:37 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pNoFN-0071Su-1R; Fri, 03 Feb 2023 13:04:26 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 03 Feb 2023 13:04:25 +0800
Date: Fri, 3 Feb 2023 13:04:25 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <Y9yV2fJbumrUDW5a@gondor.apana.org.au>
References: <20221227-ux500-stm32-hash-v3-0-32ee12cd6f06@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221227-ux500-stm32-hash-v3-0-32ee12cd6f06@linaro.org>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/6] crypto: stm32 hash - reuse for
	Ux500
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

On Wed, Jan 25, 2023 at 01:23:06AM +0100, Linus Walleij wrote:
> By taking some small portions of the Ux500 HASH driver and
> adding to the STM32 driver, it turns out we can support both
> platforms with the more modern STM32 driver.
> 
> The STM32 driver is more modern and compact thanks to using
> things like the crypto engine.
> 
> We add a polled mode since the Ux500 does not have any
> interrupt. Incidentally, this could perhaps be re-used to
> implement synchronous mode, if this is desireable.
> 
> To: Herbert Xu <herbert@gondor.apana.org.au>
> To: "David S. Miller" <davem@davemloft.net>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> To: Alexandre Torgue <alexandre.torgue@foss.st.com>
> To: Lionel Debieve <lionel.debieve@foss.st.com>
> Cc: linux-crypto@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> ---
> Changes in v3:
> - Allocate the synchronous fallback algorithm in .cra_init()
>   and free it in .cra_exit().
> - Pick up some review tags.
> - Link to v2: https://lore.kernel.org/r/20221227-ux500-stm32-hash-v2-0-bc443bc44ca4@linaro.org
> 
> Changes in v2:
> - Use an else-clause in the DT bindings.
> - Fix up issues pointed out by Lionel in the driver extension.
> - Dropped the patch converting dma_mode to a bool after
>   Lionel explained how this works.
> - Link to v1: https://lore.kernel.org/r/20221227-ux500-stm32-hash-v1-0-b637ac4cda01@linaro.org
> 
> ---
> Linus Walleij (6):
>       dt-bindings: crypto: Let STM32 define Ux500 HASH
>       crypto: stm32/hash: Simplify code
>       crypto: stm32/hash: Use existing busy poll function
>       crypto: stm32/hash: Wait for idle before final CPU xmit
>       crypto: stm32/hash: Support Ux500 hash
>       crypto: ux500/hash - delete driver
> 
>  .../devicetree/bindings/crypto/st,stm32-hash.yaml  |   23 +-
>  drivers/crypto/Kconfig                             |   10 -
>  drivers/crypto/Makefile                            |    1 -
>  drivers/crypto/stm32/stm32-hash.c                  |  266 ++-
>  drivers/crypto/ux500/Kconfig                       |   22 -
>  drivers/crypto/ux500/Makefile                      |    7 -
>  drivers/crypto/ux500/hash/Makefile                 |   11 -
>  drivers/crypto/ux500/hash/hash_alg.h               |  398 ----
>  drivers/crypto/ux500/hash/hash_core.c              | 1966 --------------------
>  9 files changed, 249 insertions(+), 2455 deletions(-)
> ---
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> change-id: 20221227-ux500-stm32-hash-9ee26834292f
> 
> Best regards,
> -- 
> Linus Walleij <linus.walleij@linaro.org>

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
