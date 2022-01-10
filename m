Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9953C489D2F
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jan 2022 17:11:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 445F6C5F1FC;
	Mon, 10 Jan 2022 16:11:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6EB8CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jan 2022 16:11:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20ADo8Tj021602;
 Mon, 10 Jan 2022 17:11:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=G0yUSQsLfDcfZw5v2vGpXxdzo++cGRi64INcl+rPjA4=;
 b=QFtqsp6QQ3IVh9a/ajeAsDwe9Txg/0e1+JRjSF3obXv8sHCiF4QLXgL0ho5Geh7VDfhS
 72YslM6blIQaSSKJKJEgbFzunW8EFfmSu9bRsqHwirUXXDXclZN4yC+kD1/LfgqGYAin
 x8/fj8btxe1g8ffS6X0jYx5KC6WGs3vAXOLT4qPTvVgkZHzPttbNQRvJ81kJ4SQp7FtY
 NKvgSJddKG+kRv+uduspI/9KzWtPf01gQONc8vpFSkNuMyaUvADJjFx7xNssE2lgpr3C
 CmMT+SlSwsBB/KmCJkQzTRGUKrXavfGOY+HxIlFVQxfO28u2kSuAWbbg/pXmP0+iY5ZJ dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dgh6uj1x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 17:11:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9971110002A;
 Mon, 10 Jan 2022 17:11:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8EA9A20757D;
 Mon, 10 Jan 2022 17:11:02 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 10 Jan
 2022 17:11:01 +0100
To: Miaoqian Lin <linmq006@gmail.com>
References: <20220108085336.11992-1-linmq006@gmail.com>
From: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Message-ID: <37a66156-a616-058d-b3c0-6d2ca22a12ed@foss.st.com>
Date: Mon, 10 Jan 2022 17:11:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220108085336.11992-1-linmq006@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_07,2022-01-10_02,2021-12-02_01
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dmamux: Fix PM disable
 depth imbalance in stm32_dmamux_probe
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

On 1/8/22 9:53 AM, Miaoqian Lin wrote:
> The pm_runtime_enable will increase power disable depth.
> If the probe fails, we should use pm_runtime_disable() to balance
> pm_runtime_enable().
> 
> Fixes: 4f3ceca254e0 ("dmaengine: stm32-dmamux: Add PM Runtime support")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Thanks for your patch,

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
>   drivers/dma/stm32-dmamux.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
> index a42164389ebc..d5d55732adba 100644
> --- a/drivers/dma/stm32-dmamux.c
> +++ b/drivers/dma/stm32-dmamux.c
> @@ -292,10 +292,12 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
>   	ret = of_dma_router_register(node, stm32_dmamux_route_allocate,
>   				     &stm32_dmamux->dmarouter);
>   	if (ret)
> -		goto err_clk;
> +		goto pm_disable;
>   
>   	return 0;
>   
> +pm_disable:
> +	pm_runtime_disable(&pdev->dev);
>   err_clk:
>   	clk_disable_unprepare(stm32_dmamux->clk);
>   
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
