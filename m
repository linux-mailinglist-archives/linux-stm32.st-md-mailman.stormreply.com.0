Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF6D4823B8
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Dec 2021 12:35:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD873C5E2C5;
	Fri, 31 Dec 2021 11:35:03 +0000 (UTC)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3B30C5C828
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Dec 2021 11:35:01 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1n3GBG-0004se-P3; Fri, 31 Dec 2021 22:34:43 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 31 Dec 2021 22:34:42 +1100
Date: Fri, 31 Dec 2021 22:34:42 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Marek Vasut <marex@denx.de>
Message-ID: <Yc7q0o1HL2THW2Kc@gondor.apana.org.au>
References: <20211220195022.1387104-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211220195022.1387104-1-marex@denx.de>
Cc: Lionel Debieve <lionel.debieve@st.com>,
 Nicolas Toromanoff <nicolas.toromanoff@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>, linux-crypto@vger.kernel.org,
 stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] crypto: stm32/crc32 - Fix kernel BUG
	triggered in probe()
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

On Mon, Dec 20, 2021 at 08:50:22PM +0100, Marek Vasut wrote:
> The include/linux/crypto.h struct crypto_alg field cra_driver_name description
> states "Unique name of the transformation provider. " ... " this contains the
> name of the chip or provider and the name of the transformation algorithm."
> 
> In case of the stm32-crc driver, field cra_driver_name is identical for all
> registered transformation providers and set to the name of the driver itself,
> which is incorrect. This patch fixes it by assigning a unique cra_driver_name
> to each registered transformation provider.
> 
> The kernel crash is triggered when the driver calls crypto_register_shashes()
> which calls crypto_register_shash(), which calls crypto_register_alg(), which
> calls __crypto_register_alg(), which returns -EEXIST, which is propagated
> back through this call chain. Upon -EEXIST from crypto_register_shash(), the
> crypto_register_shashes() starts unregistering the providers back, and calls
> crypto_unregister_shash(), which calls crypto_unregister_alg(), and this is
> where the BUG() triggers due to incorrect cra_refcnt.
> 
> Fixes: b51dbe90912a ("crypto: stm32 - Support for STM32 CRC32 crypto module")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: <stable@vger.kernel.org> # 4.12+
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Fabien Dessenne <fabien.dessenne@st.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Lionel Debieve <lionel.debieve@st.com>
> Cc: Nicolas Toromanoff <nicolas.toromanoff@st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-crypto@vger.kernel.org
> ---
>  drivers/crypto/stm32/stm32-crc32.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
