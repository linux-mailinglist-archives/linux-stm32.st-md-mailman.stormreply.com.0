Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DE99002B6
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 13:54:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65F71C7129F;
	Fri,  7 Jun 2024 11:54:14 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36BAAC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 11:54:07 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1sFYAG-006p9u-2X; Fri, 07 Jun 2024 19:53:49 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 19:53:51 +0800
Date: Fri, 7 Jun 2024 19:53:51 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Maxime MERE <maxime.mere@foss.st.com>
Message-ID: <ZmL0zynFM2RgA0RM@gondor.apana.org.au>
References: <20240528140548.1632562-1-maxime.mere@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240528140548.1632562-1-maxime.mere@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/4] crypto: stm32/cryp - Improve
	stm32-cryp driver
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, May 28, 2024 at 04:05:44PM +0200, Maxime MERE wrote:
> From: Maxime M=E9r=E9 <maxime.mere@foss.st.com>
> =

> This series of patches mainly aims to improve the usage of DMA with the
> CRYP peripheral of the STM32 MPU series. The other two patches are
> needed to enhance the driver's visibility for ST platforms.
> =

> This patchset version 3 addresses the issues identified by Herbert.
> The code that raised a warning was in fact useless as there is already
> an overflow check in the "stm32_cryp_dma_check" function so I removed
> it.
> =

> I've also added a new patch that correct a spinlock recursion warning.
> =

> Maxime M=E9r=E9 (4):
>   crypto: stm32/cryp - use dma when possible.
>   crypto: stm32/cryp - increase priority
>   crypto: stm32/cryp - add CRYPTO_ALG_KERN_DRIVER_ONLY flag
>   crypto: stm32/cryp - call finalize with bh disabled
> =

>  drivers/crypto/stm32/stm32-cryp.c | 719 ++++++++++++++++++++++++++++--
>  1 file changed, 674 insertions(+), 45 deletions(-)
> =

> -- =

> 2.25.1

All applied.  Thanks.
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
