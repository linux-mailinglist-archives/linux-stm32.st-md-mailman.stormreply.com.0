Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0829EA97
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 12:32:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1634AC3FAD5;
	Thu, 29 Oct 2020 11:32:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 121D9C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 11:32:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09TBR0AU012814; Thu, 29 Oct 2020 12:32:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=4+1Op2RV/23UrA0vNOm4u+eLDwQyANlhkaHLvGe8m90=;
 b=H3H1DRysG8v90GAtNTaGhNmqWClcg/HhSZpCi2ghtH2m+RX2aQXCkTmx1lBc0C67oF+f
 YkGc4Z0cT7Pw4+nvd4TxXsyrWJmNrm3IXGjcpUKsf/gQ4fBG1NoqMscPzK2Vh6hAdylz
 iBsE04GNKWIJhvJiIClt1opt143h2Frci7Du2DYw9L0ABFvhNG/jINYmiKcldSaTmpDU
 iGzeVSCW+qh+DjjcZRRrWiahDOd2hpCKdCA2e+/7XsgeZODTH90p+AKyzKWmILYAtCsR
 swMQThecQBhhU5y2LXbhlUKmDOPfQR92xKFhB/paBvkEDayrxyzZA0Bb5ibfJr6LLYan Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccffrq0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 12:32:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39C7C100038;
 Thu, 29 Oct 2020 12:32:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 052082823BD;
 Thu, 29 Oct 2020 12:32:10 +0100 (CET)
Received: from [10.48.1.149] (10.75.127.44) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct
 2020 12:31:19 +0100
To: Coiby Xu <coiby.xu@gmail.com>
References: <20201029074910.227859-1-coiby.xu@gmail.com>
 <20201029074910.227859-10-coiby.xu@gmail.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <0d58cf8c-997c-959f-f952-999b0d3acdb1@st.com>
Date: Thu, 29 Oct 2020 12:31:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029074910.227859-10-coiby.xu@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_06:2020-10-29,
 2020-10-29 signatures=0
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 10/15] iio: adc: stm32: remove unnecessary
	CONFIG_PM_SLEEP
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

On 10/29/20 8:49 AM, Coiby Xu wrote:
> SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.
> 
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  drivers/iio/adc/stm32-adc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index b3f31f147347..42f9013730f8 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1988,7 +1988,6 @@ static int stm32_adc_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#if defined(CONFIG_PM_SLEEP)

Hi Coiby,

This generates warnings when building with W=1 and CONFIG_PM_SLEEP=n.
Could you please add also "__maybe_unused" attribute in suspend / resume
routines below.

>  static int stm32_adc_suspend(struct device *dev)
             ^
e.g. like: static int __maybe_unused stm32_adc_...

>  {
>  	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> @@ -2018,7 +2017,6 @@ static int stm32_adc_resume(struct device *dev)
>  
>  	return stm32_adc_buffer_postenable(indio_dev);
>  }
> -#endif
>  
>  #if defined(CONFIG_PM)

Same could be done also for runtime PM routines. For my own curiosity,
do you plan to do this as well ?

Best regards,
Fabrice
>  static int stm32_adc_runtime_suspend(struct device *dev)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
