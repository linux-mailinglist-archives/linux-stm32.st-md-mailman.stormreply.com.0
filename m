Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD2AA9EA5B
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 10:11:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 864E7C78011;
	Mon, 28 Apr 2025 08:11:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12BBECFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 08:11:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S11XbV010761;
 Mon, 28 Apr 2025 10:10:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 PQb6/JrtA/eLzoukWftU2fxvtoqJ28zJBaZAc0hVsHY=; b=QwoydfmJnqrIp1Bs
 q/5op7P9yWgVMKAfoFEU1jyURgEx+qPUDq86ch/CQCNROm4Mxk9HC6YD7MH4Xtmi
 3rQphDkC1+X5k47wruX25t+hfl48d3DGpsuF3Prb14wiAMj+EsbVHwphl0Fu3qJz
 SmEK1tY8GUZaWs/i9ClheBgwg8NcYqTGZ+VSKcG1b0C7i2O4SBvWc3y/7E+zvtYc
 NiEaxlGfyjdSwBnETaBtVc2kCpyyptb1Xq8l0qLOVuwN/IFbtdMo8w9pvWlHIbyO
 23nxIBPn1Iz2uNbsjaTymfeLeJPQ8YA5tJnyzsDOlcOhxPHwotSdRgbyLDKFfAI7
 tGWyzA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 468pcg5gx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Apr 2025 10:10:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EF3BA4004F;
 Mon, 28 Apr 2025 10:09:12 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8252A342DD;
 Mon, 28 Apr 2025 10:07:54 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:07:54 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 10:07:52 +0200
Message-ID: <4e6840e5-34a7-4f15-a13a-1ff1ea5eff85@foss.st.com>
Date: Mon, 28 Apr 2025 10:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Rob Herring (Arm)" <robh@kernel.org>, Saravana Kannan
 <saravanak@google.com>, Andrew Morton <akpm@linux-foundation.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@kernel.org>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <20250423-dt-memory-region-v2-v2-1-2fbd6ebd3c88@kernel.org>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20250423-dt-memory-region-v2-v2-1-2fbd6ebd3c88@kernel.org>
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] of: reserved_mem: Add functions to
 parse "memory-region"
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

Hello Rob,

On 4/23/25 21:42, Rob Herring (Arm) wrote:
> Drivers with "memory-region" properties currently have to do their own
> parsing of "memory-region" properties. The result is all the drivers
> have similar patterns of a call to parse "memory-region" and then get
> the region's address and size. As this is a standard property, it should
> have common functions for drivers to use. Add new functions to count the
> number of regions and retrieve the region's address as a resource.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Wrap function parameters
> ---
>  drivers/of/of_reserved_mem.c    | 80 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/of_reserved_mem.h | 26 ++++++++++++++
>  2 files changed, 106 insertions(+)
> 
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index ee2e31522d7e..f87915cce961 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -12,6 +12,7 @@
>  #define pr_fmt(fmt)	"OF: reserved mem: " fmt
>  
>  #include <linux/err.h>
> +#include <linux/ioport.h>
>  #include <linux/libfdt.h>
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
> @@ -740,3 +741,82 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
>  	return NULL;
>  }
>  EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
> +
> +/**
> + * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
> + * @np:		node containing 'memory-region' property
> + * @idx:	index of 'memory-region' property to lookup
> + * @res:	Pointer to a struct resource to fill in with reserved region
> + *
> + * This function allows drivers to lookup a node's 'memory-region' property
> + * entries by index and return a struct resource for the entry.
> + *
> + * Returns 0 on success with @res filled in. Returns -ENODEV if 'memory-region'
> + * is missing or unavailable, -EINVAL for any other error.
> + */
> +int of_reserved_mem_region_to_resource(const struct device_node *np,
> +				       unsigned int idx, struct resource *res)
> +{
> +	struct reserved_mem *rmem;
> +
> +	if (!np)
> +		return -EINVAL;
> +
> +	struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);
> +	if (!target || !of_device_is_available(target))
> +		return -ENODEV;
> +
> +	rmem = of_reserved_mem_lookup(target);
> +	if (!rmem)
> +		return -EINVAL;
> +
> +	resource_set_range(res, rmem->base, rmem->size);
> +	res->name = rmem->name;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource);
> +
> +/**
> + * of_reserved_mem_region_to_resource_byname() - Get a reserved memory region as a resource
> + * @np:		node containing 'memory-region' property
> + * @name:	name of 'memory-region' property entry to lookup
> + * @res:	Pointer to a struct resource to fill in with reserved region
> + *
> + * This function allows drivers to lookup a node's 'memory-region' property
> + * entries by name and return a struct resource for the entry.
> + *
> + * Returns 0 on success with @res filled in. Returns -ENODEV if 'memory-region'
> + * is missing or unavailable, -EINVAL for any other error.

of_property_match_string() can return some other error values.

Thanks,
Arnaud

> + */
> +int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
> +					      const char *name,
> +					      struct resource *res)
> +{
> +	int idx;
> +
> +	if (!name)
> +		return -EINVAL;
> +
> +	idx = of_property_match_string(np, "memory-region-names", name);
> +	if (idx < 0)
> +		return idx;
> +
> +	return of_reserved_mem_region_to_resource(np, idx, res);
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource_byname);
> +
> +/**
> + * of_reserved_mem_region_count() - Return the number of 'memory-region' entries
> + * @np:		node containing 'memory-region' property
> + *
> + * This function allows drivers to retrieve the number of entries for a node's
> + * 'memory-region' property.
> + *
> + * Returns the number of entries on success, or negative error code on a
> + * malformed property.
> + */
> +int of_reserved_mem_region_count(const struct device_node *np)
> +{
> +	return of_count_phandle_with_args(np, "memory-region", NULL);
> +}
> +EXPORT_SYMBOL_GPL(of_reserved_mem_region_count);
> diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
> index e338282da652..f573423359f4 100644
> --- a/include/linux/of_reserved_mem.h
> +++ b/include/linux/of_reserved_mem.h
> @@ -7,6 +7,7 @@
>  
>  struct of_phandle_args;
>  struct reserved_mem_ops;
> +struct resource;
>  
>  struct reserved_mem {
>  	const char			*name;
> @@ -39,6 +40,12 @@ int of_reserved_mem_device_init_by_name(struct device *dev,
>  void of_reserved_mem_device_release(struct device *dev);
>  
>  struct reserved_mem *of_reserved_mem_lookup(struct device_node *np);
> +int of_reserved_mem_region_to_resource(const struct device_node *np,
> +				       unsigned int idx, struct resource *res);
> +int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
> +					      const char *name, struct resource *res);
> +int of_reserved_mem_region_count(const struct device_node *np);
> +
>  #else
>  
>  #define RESERVEDMEM_OF_DECLARE(name, compat, init)			\
> @@ -63,6 +70,25 @@ static inline struct reserved_mem *of_reserved_mem_lookup(struct device_node *np
>  {
>  	return NULL;
>  }
> +
> +static inline int of_reserved_mem_region_to_resource(const struct device_node *np,
> +						     unsigned int idx,
> +						     struct resource *res)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
> +							    const char *name,
> +							    struct resource *res)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline int of_reserved_mem_region_count(const struct device_node *np)
> +{
> +	return 0;
> +}
>  #endif
>  
>  /**
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
