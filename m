Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F99410CAC
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Sep 2021 19:29:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB70FC5A4CF;
	Sun, 19 Sep 2021 17:29:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5871C5718F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Sep 2021 17:29:48 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 739766101C;
 Sun, 19 Sep 2021 17:29:44 +0000 (UTC)
Date: Sun, 19 Sep 2021 18:33:25 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Cai Huoqing <caihuoqing@baidu.com>, <linux-iio@vger.kernel.org>
Message-ID: <20210919183325.7bb5a8d9@jic23-huawei>
In-Reply-To: <20210908105638.1525-1-caihuoqing@baidu.com>
References: <20210908105638.1525-1-caihuoqing@baidu.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: dac: stm32-dac: Make use of the
 helper function devm_platform_ioremap_resource()
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

On Wed, 8 Sep 2021 18:56:38 +0800
Cai Huoqing <caihuoqing@baidu.com> wrote:

> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied to the togreg branch of iio.git and pushed out as testing for 0-day
to see if it can find any problems that we missed.

Thanks,

Jonathan

> ---
>  drivers/iio/dac/stm32-dac-core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/dac/stm32-dac-core.c b/drivers/iio/dac/stm32-dac-core.c
> index 906436780347..9a6a68b11b2a 100644
> --- a/drivers/iio/dac/stm32-dac-core.c
> +++ b/drivers/iio/dac/stm32-dac-core.c
> @@ -90,7 +90,6 @@ static int stm32_dac_probe(struct platform_device *pdev)
>  	const struct stm32_dac_cfg *cfg;
>  	struct stm32_dac_priv *priv;
>  	struct regmap *regmap;
> -	struct resource *res;
>  	void __iomem *mmio;
>  	struct reset_control *rst;
>  	int ret;
> @@ -106,8 +105,7 @@ static int stm32_dac_probe(struct platform_device *pdev)
>  	cfg = (const struct stm32_dac_cfg *)
>  		of_match_device(dev->driver->of_match_table, dev)->data;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	mmio = devm_ioremap_resource(dev, res);
> +	mmio = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(mmio))
>  		return PTR_ERR(mmio);
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
