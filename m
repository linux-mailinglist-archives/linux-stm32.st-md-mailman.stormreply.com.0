Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6745570C12C
	for <lists+linux-stm32@lfdr.de>; Mon, 22 May 2023 16:35:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1295FC6A61A;
	Mon, 22 May 2023 14:35:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA72FC6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 May 2023 14:35:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MCoF6N012204; Mon, 22 May 2023 16:35:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cEOZ7WjnkjivkHr7iyIWSN+hqpzOlsxlVfbvB3wThg0=;
 b=EJw6zAg6EocWvo6DeRfXUyGc3ZuDXjih62I7VhYyZ98jhI0vNnjhkbJEWXo55h4y7YHc
 KcZrQFiXr0Vk9KJKfEuY+s9gUnImB1mFWBMkq4xO4aKAWgrr0vOsNgBMOa3Y4mWm+Zwk
 wr1urIcm0PQSpvoNonjdC9B+so9YPg6rQ5XXVFl+0A9mu13U/wBUsJ48TywApCSRimH5
 nlHN850giap4pHnfI811c+aW8Jiso0VmbKnTcl8/PDAZaVnQ+Z4ParLNbSZDXygPTFbn
 v6jd9QUusUpamSo5Tyn4PtFMnCHVZhc0wSa+wbtp2bR5aGvvOQOwvxZlsLq8EOZaer4q BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qpn3gbx8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 16:35:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C7D4710002A;
 Mon, 22 May 2023 16:35:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C06EE25E507;
 Mon, 22 May 2023 16:35:36 +0200 (CEST)
Received: from [10.252.27.80] (10.252.27.80) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 22 May
 2023 16:35:35 +0200
Message-ID: <035e7e15-6450-627b-0ea8-3339836c1b7d@foss.st.com>
Date: Mon, 22 May 2023 16:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <6f457246-6446-42cb-81ae-d37221d726b1@kili.mountain>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <6f457246-6446-42cb-81ae-d37221d726b1@kili.mountain>
X-Originating-IP: [10.252.27.80]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_10,2023-05-22_03,2023-05-22_02
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 kernel-janitors@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32: Fix error code in
 stm32_rproc_parse_dt()
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

Hello Dan,

On 5/22/23 09:46, Dan Carpenter wrote:
> There is a cut and paste bug so this code was returning the wrong
> variable.  It should have been "ddata->hold_boot_rst" instead of
> "ddata->rst".
> 
> Fixes: de598695a2ad ("remoteproc: stm32: Allow hold boot management by the SCMI reset controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 0e322697d210..a7457777aae4 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -755,7 +755,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>  
>  	ddata->hold_boot_rst = devm_reset_control_get_optional(dev, "hold_boot");
>  	if (IS_ERR(ddata->hold_boot_rst))
> -		return dev_err_probe(dev, PTR_ERR(ddata->rst),
> +		return dev_err_probe(dev, PTR_ERR(ddata->hold_boot_rst),
>  				     "failed to get hold_boot reset\n");

Good catch!

Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Thanks,
Arnaud

>  
>  	if (!ddata->hold_boot_rst && IS_ENABLED(CONFIG_HAVE_ARM_SMCCC)) {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
