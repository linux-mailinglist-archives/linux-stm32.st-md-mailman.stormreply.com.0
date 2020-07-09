Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C58DD21A47A
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jul 2020 18:14:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78DBBC36B2B;
	Thu,  9 Jul 2020 16:14:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46C70C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2020 16:14:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 069G4Qqt005774; Thu, 9 Jul 2020 18:14:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=0xSGilh0ludhB1OFskA9wbIbxe83I0mwt+UNuHXHO00=;
 b=SvDoD9ITrIN3zZ9X8LVOpreeTFPreuxGxy2czt+r/VRRl3Buz313opOpxMDEj5ZToxA6
 N78OysxGqRJTt5z3GAecT2ulNC8bUhZYKTMpSpu2d3H2rqPAoU3CDjxZ4SktP+KlBAyo
 318p1g5Hk719gLU6MZEvv4zNhlHwDWiiszBpkBNWRQW6AJxD9yl/APGua8reAjCkTY0P
 I5U9ShytQsJLJsO+cKB+bFsVLxYI/fsYK0h8ZUuuHT83QFGCJba6+Jn+St2ruZQOw3IJ
 EeBBQabvul5CHKbizEplcv/sDvvgg/MUwwIV2MWqQBIxX3MsDr9kUozJToiLcot0oQPS EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 325k405ubb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 18:14:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53AB5100039;
 Thu,  9 Jul 2020 18:14:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 44B802CA1C6;
 Thu,  9 Jul 2020 18:14:01 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jul
 2020 18:14:00 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "ohad@wizery.com"
 <ohad@wizery.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 Loic PALLARDY <loic.pallardy@st.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
 <20200707213112.928383-7-mathieu.poirier@linaro.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <12c083ce-1a49-e17c-8048-eb1b3f314836@st.com>
Date: Thu, 9 Jul 2020 18:13:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707213112.928383-7-mathieu.poirier@linaro.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_08:2020-07-09,
 2020-07-09 signatures=0
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v5 06/11] remoteproc: stm32: Properly set
 co-processor state when attaching
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

Hi Mathieu,

On 7/7/20 11:31 PM, Mathieu Poirier wrote:
> Introduce the required mechanic to set the state of the M4 in order
> to properly deal with scenarios where the co-processor has been
> started by another entity.
> 
> Mainly based on the work published by Arnaud Pouliquen [1].
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/stm32_rproc.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 961a53f67ec5..cbeb5ceb15c5 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -39,6 +39,13 @@
>  #define STM32_MBX_VQ1_ID	1
>  #define STM32_MBX_SHUTDOWN	"shutdown"
>  
> +#define M4_STATE_OFF		0
> +#define M4_STATE_INI		1
> +#define M4_STATE_CRUN		2
> +#define M4_STATE_CSTOP		3
> +#define M4_STATE_STANDBY	4
> +#define M4_STATE_CRASH		5
> +
>  struct stm32_syscon {
>  	struct regmap *map;
>  	u32 reg;
> @@ -636,12 +643,30 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  	return 0;
>  }
>  
> +static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
> +				     unsigned int *state)
> +{
> +	/* See stm32_rproc_parse_dt() */
> +	if (!ddata->m4_state.map) {
> +		/*
> +		 * We couldn't get the coprocessor's state, assume
> +		 * it is not running.
> +		 */
> +		state = M4_STATE_OFF;
> +		return 0;
> +	}
> +
> +	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg, state);
> +}
> +
> +
nitpicking:  multiple blank lines here

>  static int stm32_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct stm32_rproc *ddata;
>  	struct device_node *np = dev->of_node;
>  	struct rproc *rproc;
> +	unsigned int state;
>  	int ret;
>  
>  	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
> @@ -664,6 +689,13 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> +	ret = stm32_rproc_get_m4_status(ddata, &state);
> +	if (ret)
> +		goto free_rproc;
> +
> +	if (state == M4_STATE_CRUN)
> +		rproc->state = RPROC_DETACHED;
> +
>  	rproc->has_iommu = false;
>  	ddata->workqueue = create_workqueue(dev_name(dev));
>  	if (!ddata->workqueue) {
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
