Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 989EC265855
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Sep 2020 06:28:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 337BFC424B9;
	Fri, 11 Sep 2020 04:28:35 +0000 (UTC)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8E67C424B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Sep 2020 04:28:33 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1kGafY-0006EF-TW; Fri, 11 Sep 2020 14:28:18 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 11 Sep 2020 14:28:16 +1000
Date: Fri, 11 Sep 2020 14:28:16 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Nicolas Toromanoff <nicolas.toromanoff@st.com>
Message-ID: <20200911042816.GA5531@gondor.apana.org.au>
References: <20200904112527.15677-1-nicolas.toromanoff@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904112527.15677-1-nicolas.toromanoff@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] crypto: stm32/crc32 - Avoid lock if
 hardware is already used
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

On Fri, Sep 04, 2020 at 01:25:27PM +0200, Nicolas Toromanoff wrote:
> If STM32 CRC device is already in use, calculate CRC by software.
> 
> This will release CPU constraint for a concurrent access to the
> hardware, and avoid masking irqs during the whole block processing.
> 
> Fixes: 7795c0baf5ac ("crypto: stm32/crc32 - protect from concurrent accesses")
> 
> Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@st.com>
> ---
>  drivers/crypto/stm32/Kconfig       |  2 ++
>  drivers/crypto/stm32/stm32-crc32.c | 15 ++++++++++++---
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/crypto/stm32/Kconfig b/drivers/crypto/stm32/Kconfig
> index 4ef3eb11361c..8d605b07571f 100644
> --- a/drivers/crypto/stm32/Kconfig
> +++ b/drivers/crypto/stm32/Kconfig
> @@ -3,6 +3,8 @@ config CRYPTO_DEV_STM32_CRC
>  	tristate "Support for STM32 crc accelerators"
>  	depends on ARCH_STM32
>  	select CRYPTO_HASH
> +	select CRYPTO_CRC32
> +	select CRYPTO_CRC32C

Shouldn't this be "select CRC32"?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
