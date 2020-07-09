Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9738521A485
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jul 2020 18:15:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61707C36B2B;
	Thu,  9 Jul 2020 16:15:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4380AC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2020 16:15:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 069GEBCo008176; Thu, 9 Jul 2020 18:15:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=PvTNGDZ0be+vJCmUKWvf45L2Y7bPIKD11ulb+yNAmMw=;
 b=HkDX4rmZzFLeDS9Ggayis9LyciC0OW03baW3gF5qjMtrOT4U0bqf6/u/W1ud5Wwvq7JG
 +rFdtIPTQ7f5htdykixP5By/O04+z+yykIS9rUfWoULOtF5VOPCP6TaD70IdVSdPcE7i
 4LlmZP9WnaVa69MDQ8ex9IJ6E8ziHunHEG0S6mvglFWYe+wranzmacpnRyeFZT8R50jV
 m5zPgkCkJEg5wqz5YmysER7M2qS3YY3yR6rrkjcm7KewWFUH1Rxgj0jb8t7xBMnRE9An
 iPEPZWYpNfOCo/T1ylKo/F1Hr6Y39zq7YkoGeegNypcZA4DpT8jky1dRtLZUjYhbAJxr gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 325k3wwudt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 18:15:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E33410002A;
 Thu,  9 Jul 2020 18:15:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 127852CA1C7;
 Thu,  9 Jul 2020 18:15:09 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.50) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jul
 2020 18:15:07 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "ohad@wizery.com"
 <ohad@wizery.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 Loic PALLARDY <loic.pallardy@st.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
 <20200707213112.928383-9-mathieu.poirier@linaro.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <c28c34be-6650-6a07-d7ed-9d6c5e673b0c@st.com>
Date: Thu, 9 Jul 2020 18:15:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707213112.928383-9-mathieu.poirier@linaro.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_08:2020-07-09,
 2020-07-09 signatures=0
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v5 08/11] remoteproc: stm32: Split
 function stm32_rproc_parse_fw()
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



On 7/7/20 11:31 PM, Mathieu Poirier wrote:
> Split function stm32_rproc_parse_fw() in two parts, the first one
> to parse the memory regions and the second one to load the
> resource table.  That way parsing of the memory regions can be
> re-used when attaching to the remote processor.
> 
> Mainly based on the work published by Arnaud Pouliquen [1].
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/stm32_rproc.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index cbeb5ceb15c5..9ab58fae252f 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -213,7 +213,7 @@ static int stm32_rproc_elf_load_rsc_table(struct rproc *rproc,
>  	return 0;
>  }
>  
> -static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +static int stm32_rproc_parse_memory_regions(struct rproc *rproc)
>  {
>  	struct device *dev = rproc->dev.parent;
>  	struct device_node *np = dev->of_node;
> @@ -266,6 +266,16 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  		index++;
>  	}
>  
> +	return 0;
> +}
> +
> +static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret = stm32_rproc_parse_memory_regions(rproc);
> +
> +	if (ret)
> +		return ret;
> +
>  	return stm32_rproc_elf_load_rsc_table(rproc, fw);
>  }
>  
> @@ -693,15 +703,20 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> -	if (state == M4_STATE_CRUN)
> +	if (state == M4_STATE_CRUN) {
>  		rproc->state = RPROC_DETACHED;
>  
> +		ret = stm32_rproc_parse_memory_regions(rproc);
> +		if (ret)
> +			goto free_resources;
> +	}
> +
Here you do more than the split, you add the memory registration in the probe
i think updating the commit title and message should be sufficient

>  	rproc->has_iommu = false;
>  	ddata->workqueue = create_workqueue(dev_name(dev));
>  	if (!ddata->workqueue) {
>  		dev_err(dev, "cannot create workqueue\n");
>  		ret = -ENOMEM;
> -		goto free_rproc;
> +		goto free_resources;
>  	}
>  
>  	platform_set_drvdata(pdev, rproc);
> @@ -720,6 +735,8 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	stm32_rproc_free_mbox(rproc);
>  free_wkq:
>  	destroy_workqueue(ddata->workqueue);
> +free_resources:
> +	rproc_resource_cleanup(rproc);
>  free_rproc:
>  	if (device_may_wakeup(dev)) {
>  		dev_pm_clear_wake_irq(dev);
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
