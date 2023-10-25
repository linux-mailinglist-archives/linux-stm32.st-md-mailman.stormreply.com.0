Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5337C7D626D
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Oct 2023 09:25:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1733DC6C85B;
	Wed, 25 Oct 2023 07:25:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C1D1C6C857
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Oct 2023 07:25:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39P0b9i9024280; Wed, 25 Oct 2023 09:25:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=eZcf6Nex+okGCYfnBvOvvvKf/hhzIGIVLGg4l49To5k=; b=ha
 YMvPB/HcnM1eXeV6Iq4vJ0i3NHynFlPYJBgImJu5+pBTsGvBTPgkEzMkl09H1ysO
 eXJezuSB9Zk6YT+LnVJzslO23FbmjyUd9P7A/2XtykRpGJTHBh0vA1cpbhmZfPKB
 EUcFGvm6rJhXT9H8GNDX/Y4dMIjkcaE+98oXfGaFtTxNBfh8NDGt+b6gWgSA/VMH
 DMQyQMH7KXO2VJFOYsgPzDa74lsLQoAJMLtvRSWuGLP2nsYODP6eSPaJgt398ZbR
 zzxz5504QmQHBf+ozJ89xEFzvLJKIjKWHPEUVGUA6KI7UPgP4/qEQ6TLvWxFYXh/
 kWaLpxZp+a/KGvi4a3wg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tv3s4se32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Oct 2023 09:25:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D64B8100059;
 Wed, 25 Oct 2023 09:25:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CEB67216EF8;
 Wed, 25 Oct 2023 09:25:28 +0200 (CEST)
Received: from [10.201.20.208] (10.201.20.208) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 25 Oct
 2023 09:25:28 +0200
Message-ID: <4b4a339d-3da4-472a-885c-745465f34d6e@foss.st.com>
Date: Wed, 25 Oct 2023 09:25:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>
References: <143baf7a-9d8c-471a-893a-fd827bbc7d05@moroto.mountain>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <143baf7a-9d8c-471a-893a-fd827bbc7d05@moroto.mountain>
X-Originating-IP: [10.201.20.208]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_01,2023-10-24_01,2023-05-22_02
Cc: Laurent Fert <laurent.fert@intel.com>, kernel-janitors@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] stm class: Fix a double free in
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

On 10/25/23 09:20, Dan Carpenter wrote:
> The put_device(&stm->dev) call will trigger stm_device_release() which
> frees "stm" so the vfree(stm) on the next line is a double free.
> 
> Fixes: 389b6699a2aa ("stm class: Fix stm device initialization order")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
> v2:  My first version introduced a use after free bug.  Thanks Amelie,
>       for catching this.
> 
>   drivers/hwtracing/stm/core.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> index 534fbefc7f6a..20895d391562 100644
> --- a/drivers/hwtracing/stm/core.c
> +++ b/drivers/hwtracing/stm/core.c
> @@ -868,8 +868,11 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
>   		return -ENOMEM;
>   
>   	stm->major = register_chrdev(0, stm_data->name, &stm_fops);
> -	if (stm->major < 0)
> -		goto err_free;
> +	if (stm->major < 0) {
> +		err = stm->major;
> +		vfree(stm);
> +		return err;
> +	}
>   
>   	device_initialize(&stm->dev);
>   	stm->dev.devt = MKDEV(stm->major, 0);
> @@ -913,10 +916,8 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
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
