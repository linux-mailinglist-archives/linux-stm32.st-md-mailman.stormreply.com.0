Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 093CE1BE185
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 16:47:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABC11C36B0D;
	Wed, 29 Apr 2020 14:47:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9CFCC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 14:47:28 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TEkRih027849; Wed, 29 Apr 2020 16:47:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=JrIPiTkgDLXSrRQnzVSRty80wJa9TRbjQJelaiwRij0=;
 b=JwUMktf48FF2PsljXEuCR2xkw9mjJjeopDNAzqIeJL97nifniD7adyIsogQB3N1ND0no
 +oynYWeBUAMTnwhqPPRJHeb7OyBwQAhypgu/YsEUYa8w5742NlVpUIwNNL2jhc903xSZ
 cxwUJraOoL5JZ79h+079PzHbMpgKRqOzfoTzouKt6qKEjXLLAh+AEzZ9KGTCUKoMsKYt
 vkTj/cvwlUug+xyunlSIeBd1aRd6F1izLa1EuGFixG1iYGLhr0G+FmRLb9F7NrDO/3WT
 rr7Pg28i1yclIfr3Eu/EIDsnGCAeCtlaRXe5O9tMY5jTJIPdxGPsjLQp6iIxL0Fg56w3 Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhcc6yhx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 16:47:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07D5910002A;
 Wed, 29 Apr 2020 16:47:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EAFEE2AAF65;
 Wed, 29 Apr 2020 16:47:21 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Apr
 2020 16:47:20 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <bjorn.andersson@linaro.org>,
 <ohad@wizery.com>, <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
 <20200424202505.29562-13-mathieu.poirier@linaro.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <defc59b2-4d64-a108-2e5e-ecc579f70a8b@st.com>
Date: Wed, 29 Apr 2020 16:47:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424202505.29562-13-mathieu.poirier@linaro.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_07:2020-04-29,
 2020-04-29 signatures=0
Cc: linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 12/12] remoteproc: stm32: Set
 synchronisation state machine if needed
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



On 4/24/20 10:25 PM, Mathieu Poirier wrote:
> Set the flags and operations to use if the M4 has been started
> by another entity than the remoteproc core.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/stm32_rproc.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index dcae6103e3df..02dad3f51c7a 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -598,13 +598,20 @@ static struct rproc_ops st_rproc_ops = {
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>  };
>  
> -static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
> +static struct rproc_ops st_rproc_sync_ops = {
>  	.start		= stm32_rproc_sync_start,
>  	.stop		= stm32_rproc_stop,
> +	.kick		= stm32_rproc_kick,

Seems independent of the path.

>  	.parse_fw       = stm32_rproc_sync_parse_fw,
>  	.find_loaded_rsc_table = stm32_rproc_sync_elf_find_loaded_rsc_table,
>  };
>  
> +static struct rproc_sync_flags st_sync_flags = {
> +	.on_init = true, /* sync with MCU when the kernel boots */
> +	.after_stop = false, /* don't resync with MCU if stopped from sysfs */
> +	.after_crash = false, /* don't resync with MCU after a crash */
> +};
> +
could be const

>  static const struct of_device_id stm32_rproc_match[] = {
>  	{ .compatible = "st,stm32mp1-m4" },
>  	{},
> @@ -803,6 +810,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	struct stm32_rproc *ddata;
>  	struct device_node *np = dev->of_node;
>  	struct rproc *rproc;
> +	struct rproc_sync_flags sync_flags = {0};
>  	unsigned int state;
>  	bool auto_boot = false;
>  	int ret;
> @@ -837,11 +845,17 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	}
>  
>  	if (state == M4_STATE_CRUN) {
> +		auto_boot = true;
> +		sync_flags = st_sync_flags;

seems an useless copy 

Regards,
Arnaud

>  		ret = stm32_rproc_get_loaded_rsc_table(pdev, ddata);
>  		if (ret)
>  			goto free_rproc;
>  	}
>  
> +	ret = rproc_set_state_machine(rproc, &st_rproc_sync_ops, sync_flags);
> +	if (ret)
> +		goto free_rproc;
> +
>  	rproc->auto_boot = auto_boot;
>  	rproc->has_iommu = false;
>  	ddata->workqueue = create_workqueue(dev_name(dev));
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
