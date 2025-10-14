Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2654BD7E9B
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Oct 2025 09:30:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91C41C5558C;
	Tue, 14 Oct 2025 07:30:46 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84DC0C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Oct 2025 00:37:20 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59B0b836795424;
 Fri, 10 Oct 2025 19:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760143028;
 bh=+k+COF52/ba7uZqIJw0ehSJIMeIAIDeTRZdD5yW7+nw=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=QkxgyWIamorUE/lAzTHBzagcI3Ukmwy123YlAU2GPyiqjWncHCQpCJBd6FHzPqmsb
 wyOX5kwUkvhwhCrMOWsBo87J32/UzKtCM1Q6kTEuKONmJELIY6fNRYJXf7XAgJWSaq
 Ew/R9dC6N5+m9P4rWRbUiexKJTWQD1UPHUckynTY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59B0b71v2582664
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Fri, 10 Oct 2025 19:37:07 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 10
 Oct 2025 19:37:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 19:37:06 -0500
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59B0b6Y72679702;
 Fri, 10 Oct 2025 19:37:06 -0500
Message-ID: <c12e9758-bf30-4380-9486-cdd8a5d578be@ti.com>
Date: Fri, 10 Oct 2025 19:37:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
 <20251010-remoteproc-cleanup-v2-6-7cecf1bfd81c@nxp.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-6-7cecf1bfd81c@nxp.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Approved-At: Tue, 14 Oct 2025 07:30:45 +0000
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 6/7] remoteproc: stm32: Avoid directly
 taking address of auto_boot
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 10/10/25 7:24 AM, Peng Fan wrote:
> The rproc->auto_boot field is going to be defined as a bit-field, which

One of the pitfalls of bit-fields :)

I'm assuming if you drop the next patch you will drop this patch too.

Andrew

> makes it illegal to take its address in C.
> 
> To avoid build issue, a temporary boolean variable is introduced in
> stm32_rproc_probe() to hold the parsed value from the device tree.
> The value is then assigned to rproc->auto_boot after parsing.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   drivers/remoteproc/stm32_rproc.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 431648607d53ae58a9a556d53f17b1bf924bcd80..b28907c240125cdcf73867e2704eaa974d5e1401 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -838,6 +838,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>   	const char *fw_name;
>   	struct rproc *rproc;
>   	unsigned int state;
> +	bool auto_boot;
>   	int ret;
>   
>   	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> @@ -857,10 +858,12 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>   
>   	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
>   
> -	ret = stm32_rproc_parse_dt(pdev, ddata, &rproc->auto_boot);
> +	ret = stm32_rproc_parse_dt(pdev, ddata, &auto_boot);
>   	if (ret)
>   		goto free_rproc;
>   
> +	rproc->auto_boot = auto_boot;
> +
>   	ret = stm32_rproc_of_memory_translations(pdev, ddata);
>   	if (ret)
>   		goto free_rproc;
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
