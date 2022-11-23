Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B7F635AEA
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Nov 2022 12:05:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48D6EC6506F;
	Wed, 23 Nov 2022 11:05:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4930DC5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 11:05:07 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANAapRm023568; Wed, 23 Nov 2022 12:04:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=u0sShtivsgK/20XBxCveeAhPRdkeUJsHdC8lqu1cuGU=;
 b=Eg240EFQCP7w8o+l4HFuPIv4z4pgaDZZUT9YTRzpEYf5NNFxEr3HvWzQUb9IRNSCt8Uo
 CyXtcytbZhL7PM/FRT8YJ1n1XIkh6PpkeRJ95DIQMHnWp2d3f3357cqMszu2PAj9DVBT
 aKgSQmD6Z5Ij2vKyHvw87cOQcZA9SUyUyZJlF/U+jLmruAHiBEILu951zRkDUkXtiLMh
 xxzOv9E+D6kBXxGEWQOuL1Jr4hj/DKcdEI9uhfhC7xHLVOPVDQukR0GrcJnwCMqr6hmI
 TFd7fTNvMKtXgOPVWlq/ebzIY+57NHlKMR+nfHmT/WD61oUuB8z9QDziJV2jdg8hCTZl Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m10c4e1wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 12:04:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 13458100034;
 Wed, 23 Nov 2022 12:04:38 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0DD0421A229;
 Wed, 23 Nov 2022 12:04:38 +0100 (CET)
Received: from [10.48.1.102] (10.48.1.102) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 23 Nov
 2022 12:04:37 +0100
Message-ID: <f7a2a680-4879-b6cf-3546-e890b3c96e32@foss.st.com>
Date: Wed, 23 Nov 2022 12:04:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20221115103124.70074-1-olivier.moysan@foss.st.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20221115103124.70074-1-olivier.moysan@foss.st.com>
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_05,2022-11-23_01,2022-06-22_01
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/3] iio: adc: stm32: add smart calibration
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

On 11/15/22 11:31, Olivier Moysan wrote:
> Refine offset and linear calibration strategy for STM32MP15 and
> STM32MP13 SoCs:
> 
> - offset calibration
> This calibration depends on factors such as temperature and voltage.
> As it is not time consuming, it's worth doing it on each ADC
> start, to get the best accuracy. There is no need to save these data.
> 
> - linear calibration
> This calibration is basically SoC dependent, so it can be done only once.
> When this calibration has been performed at boot stage, the ADC kernel
> driver can retrieve the calibration data from the ADC registers.
> Otherwise, the linear calibration is performed once by the ADC driver.
> The backup of these data, allows to restore them on successive ADC starts.
> 
> Olivier Moysan (3):
>   iio: adc: stm32-adc: smart calibration support
>   iio: adc: stm32-adc: improve calibration error log
>   iio: adc: stm32-adc: add debugfs to read raw calibration result

Hi Olivier,

For the series, you can add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice

> 
>  drivers/iio/adc/stm32-adc-core.h |   1 +
>  drivers/iio/adc/stm32-adc.c      | 135 ++++++++++++++++++-------------
>  2 files changed, 78 insertions(+), 58 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
