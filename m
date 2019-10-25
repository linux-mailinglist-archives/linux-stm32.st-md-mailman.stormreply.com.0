Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35723E4E9B
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2019 16:11:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC773C36B0B;
	Fri, 25 Oct 2019 14:11:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E814C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2019 14:11:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9PE5wO4019861; Fri, 25 Oct 2019 16:11:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=j3crM7cBC/H2jOyoLqRWhR7cZrRuUQNXRsMuv0OdZuQ=;
 b=KY5ut593Qal9uBKcKy/ZEQWmOXE+fNIcYMyCbxWKE062MHN9ayQ6YrkCLT7IioLaK4AP
 NKzJXL9ZpohHBt0oCDLn0zbcn7fmotN7ZOBdkBV+BIcoyM9/iiCVXN3jG8b1zTMNgp/O
 pcS16hpQbYSZMDUbUWINzGzB8EAaMUAO41H00ReqpnjfbJtBkzf6EDF+PCz2VypaP4l0
 lCPR4BMJK4ozmT1bBA45HLWX3MC1Q6j+Gg7X4TYANGwyZn83ZvUs6vTVS2cZUHedMJhV
 ZRUT9R6B4vf8/vKnokRcCntfD8nWv5sewLh7I5j2sT96BlJsaLsE59h2ZY2aqhvokl5w Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s5856g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2019 16:11:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DA62100034;
 Fri, 25 Oct 2019 16:11:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E8E52AB34D;
 Fri, 25 Oct 2019 16:11:13 +0200 (CEST)
Received: from [10.129.5.11] (10.75.127.46) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Oct
 2019 16:11:12 +0200
To: Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>
References: <1572012264-31996-1-git-send-email-alain.volmat@st.com>
From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <37fc56c5-a700-a05b-2669-25295172dbdc@st.com>
Date: Fri, 25 Oct 2019 16:11:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572012264-31996-1-git-send-email-alain.volmat@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-25_08:2019-10-25,2019-10-25 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: fix & reorder remove &
 probe error handling
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

Hi

Look good for me

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thanks

On 10/25/19 4:04 PM, Alain Volmat wrote:
> Add missing dma channels free calls in case of error during probe
> and reorder the remove function so that dma channels are freed after
> the i2c adapter is deleted.
> Overall, reorder the remove function so that probe error handling order
> and remove function order are same.
> 
> Fixes: 7ecc8cfde553 ("i2c: i2c-stm32f7: Add DMA support")
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index d36cf08461f7..f8ef203dabfc 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1980,6 +1980,11 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	pm_runtime_set_suspended(i2c_dev->dev);
>  	pm_runtime_dont_use_autosuspend(i2c_dev->dev);
>  
> +	if (i2c_dev->dma) {
> +		stm32_i2c_dma_free(i2c_dev->dma);
> +		i2c_dev->dma = NULL;
> +	}
> +
>  clk_free:
>  	clk_disable_unprepare(i2c_dev->clk);
>  
> @@ -1990,21 +1995,21 @@ static int stm32f7_i2c_remove(struct platform_device *pdev)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
>  
> -	if (i2c_dev->dma) {
> -		stm32_i2c_dma_free(i2c_dev->dma);
> -		i2c_dev->dma = NULL;
> -	}
> -
>  	i2c_del_adapter(&i2c_dev->adap);
>  	pm_runtime_get_sync(i2c_dev->dev);
>  
> -	clk_disable_unprepare(i2c_dev->clk);
> -
>  	pm_runtime_put_noidle(i2c_dev->dev);
>  	pm_runtime_disable(i2c_dev->dev);
>  	pm_runtime_set_suspended(i2c_dev->dev);
>  	pm_runtime_dont_use_autosuspend(i2c_dev->dev);
>  
> +	if (i2c_dev->dma) {
> +		stm32_i2c_dma_free(i2c_dev->dma);
> +		i2c_dev->dma = NULL;
> +	}
> +
> +	clk_disable_unprepare(i2c_dev->clk);
> +
>  	return 0;
>  }
>  
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
