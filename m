Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1BC75D8EA
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jul 2023 04:15:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 756F5C6A61D;
	Sat, 22 Jul 2023 02:15:27 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68814C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jul 2023 02:15:25 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1qN29F-002D8G-RF; Sat, 22 Jul 2023 12:15:11 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 22 Jul 2023 14:15:03 +1200
Date: Sat, 22 Jul 2023 14:15:03 +1200
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
Message-ID: <ZLs7p2FiGBtgji5i@gondor.apana.org.au>
References: <20230713151518.1513949-1-thomas.bourgoin@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230713151518.1513949-1-thomas.bourgoin@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/7] Support of HASH on STM32MP13
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

On Thu, Jul 13, 2023 at 05:15:11PM +0200, Thomas BOURGOIN wrote:
> From: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
> 
> The STM32MP13 platform introduces a new version of the IP HASH.
> This version of the IP support SHA1, SHA2, SHA3 algorithms and HMAC.
> This serie also add some fixes when using the DMA to feed data to the IP.
> 
> 1. Add new YAML compatible st,stm32mp13-hash.
> 
> 2. Update driver to support SHA2, SHA3 algorithms for the compatible
> st,stm32mp13-hash.
> 
> 3. Argument bufcnt is unused in function stm32_hash_write_ctrl. Removes it
> to simplify the declaration of the function.
> 
> 4-7. DMA fixes
> 
> Changes in v2:
>  - Add SoB in dt-bindings: crypto: add new compatible for stm32-hash
> 
>  - Fix regression in crypto: stm32 - add new algorithms support
>    The macro HASH_CSR_NB_SHA256 was equal to 22 change to 38.
> 
>  - Update commit message of crypto: stm32 - fix MDMAT condition
>        Cc: stable@vger.kernel.org and
>        Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Lionel Debieve (1):
>   dt-bindings: crypto: add new compatible for stm32-hash
> 
> Thomas Bourgoin (6):
>   crypto: stm32 - add new algorithms support
>   crypto: stm32 - remove bufcnt in stm32_hash_write_ctrl.
>   crypto: stm32 - fix loop iterating through scatterlist for DMA
>   crypto: stm32 - check request size and scatterlist size when using
>     DMA.
>   crypto: stm32 - fix MDMAT condition
>   crypto: stm32 - remove flag HASH_FLAGS_DMA_READY
> 
>  .../bindings/crypto/st,stm32-hash.yaml        |   1 +
>  drivers/crypto/stm32/Kconfig                  |   2 +
>  drivers/crypto/stm32/stm32-hash.c             | 710 ++++++++++++++----
>  3 files changed, 566 insertions(+), 147 deletions(-)
> 
> -- 
> 2.25.1

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
