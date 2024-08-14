Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F8A952087
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Aug 2024 18:55:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25CA0C71289;
	Wed, 14 Aug 2024 16:55:52 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDDE3CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2024 16:55:44 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WkZ7h5yf1z6K9Jv;
 Thu, 15 Aug 2024 00:53:04 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 7930B1400CD;
 Thu, 15 Aug 2024 00:55:43 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 17:55:42 +0100
Date: Wed, 14 Aug 2024 17:55:41 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240814175541.00002023@Huawei.com>
In-Reply-To: <20240812-cleanup-h-of-node-put-memory-v1-9-5065a8f361d2@linaro.org>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
 <20240812-cleanup-h-of-node-put-memory-v1-9-5065a8f361d2@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 9/9] memory: ti-aemif: simplify with
 scoped for each OF child loop
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

On Mon, 12 Aug 2024 15:34:03 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Nothing wrong with this patch, but I think you can add a precusor
that will make this neater.

Jonathan

> ---
>  drivers/memory/ti-aemif.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
> index e192db9e0e4b..cd2945d4ec18 100644
> --- a/drivers/memory/ti-aemif.c
> +++ b/drivers/memory/ti-aemif.c
> @@ -330,7 +330,6 @@ static int aemif_probe(struct platform_device *pdev)
>  	int ret = -ENODEV;
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> -	struct device_node *child_np;
>  	struct aemif_device *aemif;
>  	struct aemif_platform_data *pdata;
>  	struct of_dev_auxdata *dev_lookup;
> @@ -374,12 +373,10 @@ static int aemif_probe(struct platform_device *pdev)
>  		 * functions iterate over these nodes and update the cs data
>  		 * array.
>  		 */
> -		for_each_available_child_of_node(np, child_np) {
> +		for_each_available_child_of_node_scoped(np, child_np) {
>  			ret = of_aemif_parse_abus_config(pdev, child_np);
> -			if (ret < 0) {
> -				of_node_put(child_np);
> +			if (ret < 0)
>  				goto error;
I'd precede this patch with use of
devm_clk_get_enabled()

That would avoid what looks like potential mixed devm and not issues
and let you return here.


> -			}
>  		}
>  	} else if (pdata && pdata->num_abus_data > 0) {
>  		for (i = 0; i < pdata->num_abus_data; i++, aemif->num_cs++) {
> @@ -402,13 +399,11 @@ static int aemif_probe(struct platform_device *pdev)
>  	 * child will be probed after the AEMIF timing parameters are set.
>  	 */
>  	if (np) {
> -		for_each_available_child_of_node(np, child_np) {
> +		for_each_available_child_of_node_scoped(np, child_np) {
>  			ret = of_platform_populate(child_np, NULL,
>  						   dev_lookup, dev);
> -			if (ret < 0) {
> -				of_node_put(child_np);
> +			if (ret < 0)
>  				goto error;
> -			}
>  		}
>  	} else if (pdata) {
>  		for (i = 0; i < pdata->num_sub_devices; i++) {
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
