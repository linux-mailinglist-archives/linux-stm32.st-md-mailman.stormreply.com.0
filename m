Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57037784F1B
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 05:06:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 148F5C6B44B;
	Wed, 23 Aug 2023 03:06:31 +0000 (UTC)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net
 (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87994C6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 03:06:29 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1qYeB0-006oC8-CQ; Wed, 23 Aug 2023 11:04:59 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Wed, 23 Aug 2023 11:04:59 +0800
Date: Wed, 23 Aug 2023 11:04:59 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Rob Herring <robh@kernel.org>
Message-ID: <ZOV3Ww1l8Fu6fYim@gondor.apana.org.au>
References: <20230714174421.4054194-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230714174421.4054194-1-robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-aspeed@lists.ozlabs.org,
 Gaurav Jain <gaurav.jain@nxp.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 William Qiu <william.qiu@starfivetech.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Jia Jie Ho <jiajie.ho@starfivetech.com>,
 Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Joel Stanley <joel@jms.id.au>,
 linux-sunxi@lists.linux.dev, Declan Murphy <declan.murphy@intel.com>,
 devicetree@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Gilad Ben-Yossef <gilad@benyossef.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>,
 Neal Liu <neal_liu@aspeedtech.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Harsha <harsha.harsha@amd.com>,
 "David S. Miller" <davem@davemloft.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH] crypto: Explicitly include correct DT
	includes
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

On Fri, Jul 14, 2023 at 11:44:18AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c   | 1 -
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 1 -
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c   | 1 -
>  drivers/crypto/amlogic/amlogic-gxl-core.c           | 1 -
>  drivers/crypto/aspeed/aspeed-acry.c                 | 3 ---
>  drivers/crypto/atmel-aes.c                          | 6 ++----
>  drivers/crypto/atmel-ecc.c                          | 2 +-
>  drivers/crypto/atmel-sha.c                          | 6 ++----
>  drivers/crypto/atmel-tdes.c                         | 6 ++----
>  drivers/crypto/bcm/cipher.c                         | 3 +--
>  drivers/crypto/caam/ctrl.c                          | 1 +
>  drivers/crypto/caam/jr.c                            | 1 +
>  drivers/crypto/caam/qi.c                            | 1 +
>  drivers/crypto/ccree/cc_driver.c                    | 1 -
>  drivers/crypto/exynos-rng.c                         | 2 +-
>  drivers/crypto/gemini/sl3516-ce-core.c              | 1 -
>  drivers/crypto/img-hash.c                           | 4 ++--
>  drivers/crypto/intel/keembay/keembay-ocs-hcu-core.c | 3 ++-
>  drivers/crypto/n2_core.c                            | 2 +-
>  drivers/crypto/omap-aes.c                           | 1 -
>  drivers/crypto/omap-des.c                           | 2 --
>  drivers/crypto/omap-sham.c                          | 1 -
>  drivers/crypto/rockchip/rk3288_crypto.c             | 1 -
>  drivers/crypto/s5p-sss.c                            | 1 -
>  drivers/crypto/sa2ul.c                              | 3 ++-
>  drivers/crypto/sahara.c                             | 1 -
>  drivers/crypto/starfive/jh7110-cryp.c               | 2 +-
>  drivers/crypto/starfive/jh7110-hash.c               | 1 -
>  drivers/crypto/stm32/stm32-cryp.c                   | 2 +-
>  drivers/crypto/stm32/stm32-hash.c                   | 2 +-
>  drivers/crypto/talitos.c                            | 4 ++--
>  drivers/crypto/xilinx/zynqmp-aes-gcm.c              | 2 +-
>  drivers/crypto/xilinx/zynqmp-sha.c                  | 1 -
>  33 files changed, 25 insertions(+), 45 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
