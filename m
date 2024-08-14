Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9D295206D
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Aug 2024 18:51:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5E6EC71289;
	Wed, 14 Aug 2024 16:51:00 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35C98CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2024 16:50:53 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WkZ1M1wM9z6K63G;
 Thu, 15 Aug 2024 00:47:35 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id D7167140A36;
 Thu, 15 Aug 2024 00:50:51 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 17:50:51 +0100
Date: Wed, 14 Aug 2024 17:50:49 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240814175049.00001821@Huawei.com>
In-Reply-To: <20240812-cleanup-h-of-node-put-memory-v1-5-5065a8f361d2@linaro.org>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
 <20240812-cleanup-h-of-node-put-memory-v1-5-5065a8f361d2@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH 5/9] memory: tegra-mc: simplify with
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

On Mon, 12 Aug 2024 15:33:59 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
The final block is already a weird code structure, but your changes look fine
to me.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/memory/tegra/mc.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index 224b488794e5..bd5b58f1fd42 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -450,7 +450,6 @@ static int load_one_timing(struct tegra_mc *mc,
>  
>  static int load_timings(struct tegra_mc *mc, struct device_node *node)
>  {
> -	struct device_node *child;
>  	struct tegra_mc_timing *timing;
>  	int child_count = of_get_child_count(node);
>  	int i = 0, err;
> @@ -462,14 +461,12 @@ static int load_timings(struct tegra_mc *mc, struct device_node *node)
>  
>  	mc->num_timings = child_count;
>  
> -	for_each_child_of_node(node, child) {
> +	for_each_child_of_node_scoped(node, child) {
>  		timing = &mc->timings[i++];
>  
>  		err = load_one_timing(mc, timing, child);
> -		if (err) {
> -			of_node_put(child);
> +		if (err)
>  			return err;
> -		}
>  	}
>  
>  	return 0;
> @@ -477,7 +474,6 @@ static int load_timings(struct tegra_mc *mc, struct device_node *node)
>  
>  static int tegra_mc_setup_timings(struct tegra_mc *mc)
>  {
> -	struct device_node *node;
>  	u32 ram_code, node_ram_code;
>  	int err;
>  
> @@ -485,14 +481,13 @@ static int tegra_mc_setup_timings(struct tegra_mc *mc)
>  
>  	mc->num_timings = 0;
>  
> -	for_each_child_of_node(mc->dev->of_node, node) {
> +	for_each_child_of_node_scoped(mc->dev->of_node, node) {
>  		err = of_property_read_u32(node, "nvidia,ram-code",
>  					   &node_ram_code);
>  		if (err || (node_ram_code != ram_code))
>  			continue;
>  
>  		err = load_timings(mc, node);
> -		of_node_put(node);
>  		if (err)
>  			return err;
>  		break;
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
