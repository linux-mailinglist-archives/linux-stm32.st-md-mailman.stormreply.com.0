Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 977777D4AB3
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Oct 2023 10:43:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3676AC6C837;
	Tue, 24 Oct 2023 08:43:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7211DC6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Oct 2023 08:43:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39O7tVhw031861; Tue, 24 Oct 2023 10:43:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=ldNNG0oMniqUleFy+sdT7sBRgnmhnqh6W7a3PHqB8UA=; b=hh
 fGMPCqgKec3ycL63IFTwb/NwLXrchJlekPkO31pl+Igs1BXboy1gKZ7l+vastJK/
 /hqIhOwDO7aGrOq8+7XZVNy0n0N4qfJQMJY9O50KJZ2MzixjaM1NdHLcCGTRS5gm
 TGq/efb4xR32saai0BOrn8L4316gtLtEtgz5iASQNqHTaTsoCiDu5uRyguksEF0L
 wY87oh0e6Dilme5m99etcCzyk1RWz6AccbTQX3b+AOMjm7zdkm9uqQPYZ0B+c195
 6Bwu7+sC80mzE6kpPEZPm9U1EOrw/Z2Hn2hx9EgZBy3FXPLrz8t5qtu30Pr+EyAF
 1+8QT/G/knjUlMHx+P9g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tv5hcm9ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Oct 2023 10:43:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B99F9100059;
 Tue, 24 Oct 2023 10:43:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B16AD2207BA;
 Tue, 24 Oct 2023 10:43:07 +0200 (CEST)
Received: from [10.201.20.208] (10.201.20.208) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 24 Oct
 2023 10:43:07 +0200
Message-ID: <d2ea6034-738d-4161-a9fb-b2d2b1b134ae@foss.st.com>
Date: Tue, 24 Oct 2023 10:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>
References: <ddaf5742-931b-4cdd-820b-72808ddf4fdf@moroto.mountain>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <ddaf5742-931b-4cdd-820b-72808ddf4fdf@moroto.mountain>
X-Originating-IP: [10.201.20.208]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_07,2023-10-19_01,2023-05-22_02
Cc: Laurent Fert <laurent.fert@intel.com>, kernel-janitors@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] stm class: Fix a double free in
 stm_register_device()
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

Hi Dan,

On 10/24/23 07:01, Dan Carpenter wrote:
> The put_device(&stm->dev) call will trigger stm_device_release() which
> frees "stm" so the vfree(stm) on the next line is a double free.
> 
> Fixes: 389b6699a2aa ("stm class: Fix stm device initialization order")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/hwtracing/stm/core.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> index 534fbefc7f6a..7315f7d3910d 100644
> --- a/drivers/hwtracing/stm/core.c
> +++ b/drivers/hwtracing/stm/core.c
> @@ -868,8 +868,10 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
>   		return -ENOMEM;
>   
>   	stm->major = register_chrdev(0, stm_data->name, &stm_fops);
> -	if (stm->major < 0)
> -		goto err_free;
> +	if (stm->major < 0) {
> +		vfree(stm);
> +		return stm->major;

isn't there a use-after-free of stm here?

> +	}
>   
>   	device_initialize(&stm->dev);
>   	stm->dev.devt = MKDEV(stm->major, 0);
> @@ -913,10 +915,8 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
>   err_device:
>   	unregister_chrdev(stm->major, stm_data->name);
>   
> -	/* matches device_initialize() above */
> +	/* calls stm_device_release() */
>   	put_device(&stm->dev);
> -err_free:
> -	vfree(stm);
>   
>   	return err;
>   }

Regards,
Amelie
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
