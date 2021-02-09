Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB8314A60
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Feb 2021 09:35:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEECEC5718A;
	Tue,  9 Feb 2021 08:35:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09089C5717D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 08:35:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1198XXQO027458; Tue, 9 Feb 2021 09:35:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Xf58I3oc4vS+xAXxH1lhtadhjXCgDFhO3xI+liBkPK0=;
 b=ib56VHmZDsGHys78o8FHk6nGMU47CmKDSx1mNBVu6sE9mtHc2lM6nd44t/2xyjbNZjs3
 qDRg1Z0chYkU9V1obPQ0l2KZnT0s/FUUAZbWZiA9AM2ZepDy0Brc4OKBvdlHegrqR0sU
 n7k99jeE3/wmJIhHgCXQ8KszDJ4Wms1/vKx5jSUlUz50MOPGcLqOlJW2BjIqx4FOJcel
 mEGIdJqHaNERxIyeAF6+tRmdWurB1fGlggokP/7jNKWRZKg89Lj6zy5LMOeMBMpwqhT2
 B3+a47WSiEhAMT9cbG5xJgmghnCLOJqz2nuket9vXYmK3d9H0ABDLkaiNalxpPM7ZKgW Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hrf778q4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 09:35:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3D1C610002A;
 Tue,  9 Feb 2021 09:35:49 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 24E1621CA78;
 Tue,  9 Feb 2021 09:35:49 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.116) by GPXDAG2NODE6.st.com
 (10.75.127.70) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 09:35:48 +0100
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20201217144125.12903-1-arnaud.pouliquen@foss.st.com>
Message-ID: <9d12a62c-ba39-4943-d9c4-9e3da8ef947f@foss.st.com>
Date: Tue, 9 Feb 2021 09:35:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201217144125.12903-1-arnaud.pouliquen@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG1NODE6.st.com (10.75.127.67) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_02:2021-02-09,
 2021-02-09 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] remoteproc: stm32: improve debug using
	dev_err_probe
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

Hi,

Gentle reminder, in case it has been forgotten.

Thanks,
Arnaud

On 12/17/20 3:41 PM, Arnaud Pouliquen wrote:
> From: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
> 
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error.
> The benefit is that DEFER issue will be logged in the devices_deferred
> debugfs file.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss-st.com>
> ---
> V1 to V2: As suggested by Ahmad Fatoum use dev_err_probe to deal with
>           deferred cases
> 
> V1: https://www.spinics.net/lists/kernel/msg3765884.html
> ---
> 
>  drivers/remoteproc/stm32_rproc.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index a180aeae9675..ccb3c14a0023 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -370,8 +370,13 @@ static int stm32_rproc_request_mbox(struct rproc *rproc)
>  
>  		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
>  		if (IS_ERR(ddata->mb[i].chan)) {
> -			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER)
> +			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER) {
> +				dev_err_probe(dev->parent,
> +					      PTR_ERR(ddata->mb[i].chan),
> +					      "failed to request mailbox %s\n",
> +					      name);
>  				goto err_probe;
> +			}
>  			dev_warn(dev, "cannot get %s mbox\n", name);
>  			ddata->mb[i].chan = NULL;
>  		}
> @@ -592,15 +597,14 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq == -EPROBE_DEFER)
> -		return -EPROBE_DEFER;
> +		return dev_err_probe(dev, irq, "failed to get interrupt\n");
>  
>  	if (irq > 0) {
>  		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
>  				       dev_name(dev), pdev);
> -		if (err) {
> -			dev_err(dev, "failed to request wdg irq\n");
> -			return err;
> -		}
> +		if (err)
> +			return dev_err_probe(dev, err,
> +					     "failed to request wdg irq\n");
>  
>  		ddata->wdg_irq = irq;
>  
> @@ -613,10 +617,9 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  	}
>  
>  	ddata->rst = devm_reset_control_get_by_index(dev, 0);
> -	if (IS_ERR(ddata->rst)) {
> -		dev_err(dev, "failed to get mcu reset\n");
> -		return PTR_ERR(ddata->rst);
> -	}
> +	if (IS_ERR(ddata->rst))
> +		return dev_err_probe(dev, PTR_ERR(ddata->rst),
> +				     "failed to get mcu_reset\n");
>  
>  	/*
>  	 * if platform is secured the hold boot bit must be written by
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
