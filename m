Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4113E8B3430
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Apr 2024 11:35:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB019C71292;
	Fri, 26 Apr 2024 09:35:18 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A05DC71291
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 09:35:17 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1s0HyK-006eSm-DS; Fri, 26 Apr 2024 17:34:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 26 Apr 2024 17:34:42 +0800
Date: Fri, 26 Apr 2024 17:34:42 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Marek Vasut <marex@denx.de>
Message-ID: <Zit1MvGeHX8CFEQV@gondor.apana.org.au>
References: <20240419050201.181041-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240419050201.181041-1-marex@denx.de>
Cc: Rob Herring <robh@kernel.org>, Yang Yingliang <yangyingliang@huawei.com>,
 kernel@dh-electronics.com, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] hwrng: stm32 - use logical OR in
	conditional
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

On Fri, Apr 19, 2024 at 07:01:12AM +0200, Marek Vasut wrote:
> The conditional is used to check whether err is non-zero OR whether
> reg variable is non-zero after clearing bits from it. This should be
> done using logical OR, not bitwise OR, fix it.
> =

> Fixes: 6b85a7e141cb ("hwrng: stm32 - implement STM32MP13x support")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: "Uwe Kleine-K=F6nig" <u.kleine-koenig@pengutronix.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Olivia Mackall <olivia@selenic.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yang Yingliang <yangyingliang@huawei.com>
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  drivers/char/hw_random/stm32-rng.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

All applied.  Thanks.
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
