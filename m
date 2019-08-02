Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C5812FD
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2019 09:19:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B33DC35E07;
	Mon,  5 Aug 2019 07:19:54 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8261C35E03
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 16:17:11 +0000 (UTC)
X-Originating-IP: 90.76.143.236
Received: from localhost (lfbn-1-2078-236.w90-76.abo.wanadoo.fr
 [90.76.143.236]) (Authenticated sender: antoine.tenart@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E0A5DFF807;
 Fri,  2 Aug 2019 16:17:03 +0000 (UTC)
Date: Fri, 2 Aug 2019 18:17:01 +0200
From: Antoine Tenart <antoine.tenart@bootlin.com>
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <20190802161701.GD14470@kwain>
References: <20190802132809.8116-1-yuehaibing@huawei.com>
 <20190802132809.8116-6-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802132809.8116-6-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:19:53 +0000
Cc: heiko@sntech.de, gary.hook@amd.com, clabbe.montjoie@gmail.com,
 linux-arm-kernel@axis.com, jamie@jamieiles.com,
 linux-stm32@st-md-mailman.stormreply.com, jesper.nilsson@axis.com,
 linux-samsung-soc@vger.kernel.org, herbert@gondor.apana.org.au,
 krzk@kernel.org, linux-rockchip@lists.infradead.org, wens@csie.org,
 agross@kernel.org, thomas.lendacky@amd.com, antoine.tenart@bootlin.com,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org,
 linux-mediatek@lists.infradead.org, lars.persson@axis.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, kgene@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH -next 05/12] crypto: inside-secure - use
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello,

On Fri, Aug 02, 2019 at 09:28:02PM +0800, YueHaibing wrote:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> =

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Antoine Tenart <antoine.tenart@bootlin.com>

Thanks,
Antoine

> ---
>  drivers/crypto/inside-secure/safexcel.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> =

> diff --git a/drivers/crypto/inside-secure/safexcel.c b/drivers/crypto/ins=
ide-secure/safexcel.c
> index d1f60fd..822744d 100644
> --- a/drivers/crypto/inside-secure/safexcel.c
> +++ b/drivers/crypto/inside-secure/safexcel.c
> @@ -999,7 +999,6 @@ static void safexcel_init_register_offsets(struct saf=
excel_crypto_priv *priv)
>  static int safexcel_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct resource *res;
>  	struct safexcel_crypto_priv *priv;
>  	int i, ret;
>  =

> @@ -1015,8 +1014,7 @@ static int safexcel_probe(struct platform_device *p=
dev)
>  =

>  	safexcel_init_register_offsets(priv);
>  =

> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->base =3D devm_ioremap_resource(dev, res);
> +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->base)) {
>  		dev_err(dev, "failed to get resource\n");
>  		return PTR_ERR(priv->base);
> -- =

> 2.7.4
> =

> =


-- =

Antoine T=E9nart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
