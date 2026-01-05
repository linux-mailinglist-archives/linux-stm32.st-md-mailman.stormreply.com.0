Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3F8CF30BC
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 11:49:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86451C36B3C;
	Mon,  5 Jan 2026 10:49:15 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A368C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 10:49:14 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.224.107])
 by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dl9xm4b9BzJ46jX;
 Mon,  5 Jan 2026 18:48:12 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
 by mail.maildlp.com (Postfix) with ESMTPS id DA0FF4057E;
 Mon,  5 Jan 2026 18:49:12 +0800 (CST)
Received: from localhost (10.48.146.88) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 10:49:12 +0000
Date: Mon, 5 Jan 2026 10:49:10 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Message-ID: <20260105104910.00006981@huawei.com>
In-Reply-To: <20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.48.146.88]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] bus: stm32_firewall: Simplify with
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

On Fri,  2 Jan 2026 13:50:32 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
You could throw a __free() in there for firewalls and avoid having
any cleanup at all to do on error (or good path for that matter).

Otherwise LGTM.

Jonathan

> ---
>  drivers/bus/stm32_firewall.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
> index 2fc9761dadec..fae881cea9a0 100644
> --- a/drivers/bus/stm32_firewall.c
> +++ b/drivers/bus/stm32_firewall.c
> @@ -241,7 +241,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
>  int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
>  {
>  	struct stm32_firewall *firewalls;
> -	struct device_node *child;
>  	struct device *parent;
>  	unsigned int i;
>  	int len;
> @@ -251,25 +250,20 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
>  
>  	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_controller->dev));
>  
> -	for_each_available_child_of_node(dev_of_node(parent), child) {
> +	for_each_available_child_of_node_scoped(dev_of_node(parent), child) {
>  		/* The access-controllers property is mandatory for firewall bus devices */
>  		len = of_count_phandle_with_args(child, "access-controllers",
>  						 "#access-controller-cells");
> -		if (len <= 0) {
> -			of_node_put(child);
> +		if (len <= 0)
>  			return -EINVAL;
> -		}
>  
>  		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
> -		if (!firewalls) {
> -			of_node_put(child);
> +		if (!firewalls)
>  			return -ENOMEM;
> -		}
>  
>  		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
>  		if (err) {
>  			kfree(firewalls);
> -			of_node_put(child);
>  			return err;
>  		}
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
