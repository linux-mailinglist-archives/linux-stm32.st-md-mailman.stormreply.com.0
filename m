Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBF28AAD35
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 13:02:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47C17C6DD66;
	Fri, 19 Apr 2024 11:02:41 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C63D8C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 11:02:39 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1rxm0Y-003sYC-55; Fri, 19 Apr 2024 19:02:19 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 19 Apr 2024 19:02:35 +0800
Date: Fri, 19 Apr 2024 19:02:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Maxime MERE <maxime.mere@foss.st.com>
Message-ID: <ZiJPS1dhc/uOT08A@gondor.apana.org.au>
References: <20240412124545.2704487-1-maxime.mere@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412124545.2704487-1-maxime.mere@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Eric Biggers <ebiggers@google.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] crypto: stm32/hash - add full DMA support
	for stm32mpx
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

On Fri, Apr 12, 2024 at 02:45:45PM +0200, Maxime MERE wrote:
> From: Maxime M=E9r=E9 <maxime.mere@foss.st.com>
> =

> Due to a lack of alignment in the data sent by requests, the actual DMA
> support of the STM32 hash driver is only working with digest calls.
> This patch, based on the algorithm used in the driver omap-sham.c,
> allows for the usage of DMA in any situation.
> =

> It has been functionally tested on STM32MP15, STM32MP13 and STM32MP25.
> =

> By checking the performance of this new driver with OpenSSL, the
> following results were found:
> =

> Performance:
> =

> (datasize: 4096, number of hashes performed in 10s)
> =

> |type   |no DMA    |DMA support|software  |
> |-------|----------|-----------|----------|
> |md5    |13873.56k |10958.03k  |71163.08k |
> |sha1   |13796.15k |10729.47k  |39670.58k |
> |sha224 |13737.98k |10775.76k  |22094.64k |
> |sha256 |13655.65k |10872.01k  |22075.39k |
> =

> CPU Usage:
> =

> (algorithm used: sha256, computation time: 20s, measurement taken at
> ~10s)
> =

> |datasize  |no DMA |DMA  | software |
> |----------|-------|-----|----------|
> |  2048    | 56%   | 49% | 50%      |
> |  4096    | 54%   | 46% | 50%      |
> |  8192    | 53%   | 40% | 50%      |
> | 16384    | 53%   | 33% | 50%      |
> =

> Note: this update doesn't change the driver performance without DMA.
> =

> As shown, performance with DMA is slightly lower than without, but in
> most cases, it will save CPU time.
> =

> Signed-off-by: Maxime M=E9r=E9 <maxime.mere@foss.st.com>
> ---
>  drivers/crypto/stm32/stm32-hash.c | 570 +++++++++++++++++++++++-------
>  1 file changed, 448 insertions(+), 122 deletions(-)

Patch applied.  Thanks.
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
