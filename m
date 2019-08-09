Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7A887228
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2019 08:20:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0C97C35E01;
	Fri,  9 Aug 2019 06:20:54 +0000 (UTC)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F931C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2019 06:20:53 +0000 (UTC)
Received: from gondolin.me.apana.org.au ([192.168.0.6]
 helo=gondolin.hengli.com.au)
 by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1hvyG7-0007PS-Tu; Fri, 09 Aug 2019 16:20:16 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1hvyFz-0002sF-Ec; Fri, 09 Aug 2019 16:20:07 +1000
Date: Fri, 9 Aug 2019 16:20:07 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <20190809062007.GP10392@gondor.apana.org.au>
References: <20190802132809.8116-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802132809.8116-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: heiko@sntech.de, gary.hook@amd.com, clabbe.montjoie@gmail.com,
 linux-arm-kernel@axis.com, jamie@jamieiles.com,
 linux-stm32@st-md-mailman.stormreply.com, jesper.nilsson@axis.com,
 linux-samsung-soc@vger.kernel.org, kgene@kernel.org, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, wens@csie.org, agross@kernel.org,
 thomas.lendacky@amd.com, antoine.tenart@bootlin.com,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org,
 linux-mediatek@lists.infradead.org, lars.persson@axis.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH -next 00/12] crypto: use
 devm_platform_ioremap_resource() to simplify code
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

On Fri, Aug 02, 2019 at 09:27:57PM +0800, YueHaibing wrote:
> devm_platform_ioremap_resource() internally have platform_get_resource()
> and devm_ioremap_resource() in it. So instead of calling them separately
> use devm_platform_ioremap_resource() directly.
> 
> YueHaibing (12):
>   crypto: artpec6 - use devm_platform_ioremap_resource() to simplify
>     code
>   crypto: ccp - use devm_platform_ioremap_resource() to simplify code
>   crypto: exynos - use devm_platform_ioremap_resource() to simplify code
>   crypto: img-hash - use devm_platform_ioremap_resource() to simplify
>     code
>   crypto: inside-secure - use devm_platform_ioremap_resource() to
>     simplify code
>   crypto: mediatek - use devm_platform_ioremap_resource() to simplify
>     code
>   crypto: picoxcell - use devm_platform_ioremap_resource() to simplify
>     code
>   crypto: sunxi-ss - use devm_platform_ioremap_resource() to simplify
>     code
>   crypto: rockchip - use devm_platform_ioremap_resource() to simplify
>     code
>   crypto: stm32 - use devm_platform_ioremap_resource() to simplify code
>   crypto: qce - use devm_platform_ioremap_resource() to simplify code
>   crypto: qcom-rng - use devm_platform_ioremap_resource() to simplify
>     code
> 
>  drivers/crypto/axis/artpec6_crypto.c    | 4 +---
>  drivers/crypto/ccp/sp-platform.c        | 4 +---
>  drivers/crypto/exynos-rng.c             | 4 +---
>  drivers/crypto/img-hash.c               | 4 +---
>  drivers/crypto/inside-secure/safexcel.c | 4 +---
>  drivers/crypto/mediatek/mtk-platform.c  | 3 +--
>  drivers/crypto/picoxcell_crypto.c       | 5 ++---
>  drivers/crypto/qce/core.c               | 4 +---
>  drivers/crypto/qcom-rng.c               | 4 +---
>  drivers/crypto/rockchip/rk3288_crypto.c | 4 +---
>  drivers/crypto/stm32/stm32-crc32.c      | 4 +---
>  drivers/crypto/stm32/stm32-cryp.c       | 4 +---
>  drivers/crypto/sunxi-ss/sun4i-ss-core.c | 4 +---
>  13 files changed, 14 insertions(+), 38 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
