Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC288144FC
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Dec 2023 10:59:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C904BC6B45B;
	Fri, 15 Dec 2023 09:59:10 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C60FFC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 09:59:08 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1rE4xN-00BCkx-Cl; Fri, 15 Dec 2023 17:58:10 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 15 Dec 2023 17:58:19 +0800
Date: Fri, 15 Dec 2023 17:58:19 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZXwjO8m/Jm6HX+De@gondor.apana.org.au>
References: <cover.1702245873.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1702245873.git.u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Martin Kaiser <martin@kaiser.cx>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
 openbmc@lists.ozlabs.org, Nancy Yuen <yuenn@google.com>,
 Hadar Gat <hadar.gat@arm.com>, Deepak Saxena <dsaxena@plexity.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Yangtao Li <frank.li@vivo.com>,
 Yu Zhe <yuzhe@nfschina.com>, Andrei Coardos <aboutphysycs@gmail.com>,
 =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
 Olivia Mackall <olivia@selenic.com>, Tali Perry <tali.perry1@gmail.com>,
 Alexandru Ardelean <alex@shruggie.ro>, linux-arm-kernel@lists.infradead.org,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH 00/12] hwrng: Convert to platform remove
 callback returning
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

On Sun, Dec 10, 2023 at 11:12:15PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> this series converts all hwrng platform drivers to use .remove_new.
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for details and the eventual goal.
> =

> All driver conversions are trivial as all their remove callbacks return
> 0 (as good drivers should do).
> =

> All patches are pairwise independant. These patches should go in via the
> usual hwrng tree. It's merge window material.
> =

> Best regards
> Uwe
> =

> Uwe Kleine-K=F6nig (12):
>   hwrng: atmel - Convert to platform remove callback returning void
>   hwrng: cctrng - Convert to platform remove callback returning void
>   hwrng: exynos - Convert to platform remove callback returning void
>   hwrng: ingenic - Convert to platform remove callback returning void
>   hwrng: ks-sa - Convert to platform remove callback returning void
>   hwrng: mxc - Convert to platform remove callback returning void
>   hwrng: n2 - Convert to platform remove callback returning void
>   hwrng: npcm - Convert to platform remove callback returning void
>   hwrng: omap - Convert to platform remove callback returning void
>   hwrng: stm32 - Convert to platform remove callback returning void
>   hwrng: timeriomem - Convert to platform remove callback returning void
>   hwrng: xgene - Convert to platform remove callback returning void
> =

>  drivers/char/hw_random/atmel-rng.c      | 6 ++----
>  drivers/char/hw_random/cctrng.c         | 6 ++----
>  drivers/char/hw_random/exynos-trng.c    | 6 ++----
>  drivers/char/hw_random/ingenic-rng.c    | 6 ++----
>  drivers/char/hw_random/ks-sa-rng.c      | 6 ++----
>  drivers/char/hw_random/mxc-rnga.c       | 6 ++----
>  drivers/char/hw_random/n2-drv.c         | 6 ++----
>  drivers/char/hw_random/npcm-rng.c       | 6 ++----
>  drivers/char/hw_random/omap-rng.c       | 6 ++----
>  drivers/char/hw_random/stm32-rng.c      | 6 ++----
>  drivers/char/hw_random/timeriomem-rng.c | 6 ++----
>  drivers/char/hw_random/xgene-rng.c      | 6 ++----
>  12 files changed, 24 insertions(+), 48 deletions(-)
> =

> =

> base-commit: bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
> -- =

> 2.42.0

All applied.  Thanks.
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
