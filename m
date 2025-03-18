Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 271FBA67248
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 12:12:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0FABC78002;
	Tue, 18 Mar 2025 11:12:47 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFFB8C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 11:12:45 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZH8HW4vxNz6LDCB;
 Tue, 18 Mar 2025 19:09:27 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 8F53214050C;
 Tue, 18 Mar 2025 19:12:44 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 18 Mar
 2025 12:12:43 +0100
Date: Tue, 18 Mar 2025 11:12:42 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <20250318111242.00007457@huawei.com>
In-Reply-To: <20250317232426.952188-2-robh@kernel.org>
References: <20250317232426.952188-1-robh@kernel.org>
 <20250317232426.952188-2-robh@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500008.china.huawei.com (7.182.85.71)
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, imx@lists.linux.dev,
 Saravana Kannan <saravanak@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/3] of: reserved_mem: Add functions to
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

On Mon, 17 Mar 2025 18:24:21 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> Drivers with "memory-region" properties currently have to do their own
> parsing of "memory-region" properties. The result is all the drivers
> have similar patterns of a call to parse "memory-region" and then get
> the region's address and size. As this is a standard property, it should
> have common functions for drivers to use. Add new functions to count the
> number of regions and retrieve the region's address as a resource.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/of/of_reserved_mem.c    | 77 +++++++++++++++++++++++++++++++++
>  include/linux/of_reserved_mem.h | 26 +++++++++++
>  2 files changed, 103 insertions(+)
> 
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 75e819f66a56..fd50038dff76 100644
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
> @@ -740,3 +741,79 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
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
> +int of_reserved_mem_region_to_resource(const struct device_node *np, unsigned int idx, struct resource *res)

Maybe wrap?
 
> +{

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
