Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4898655364A
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jun 2022 17:39:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA731C5E2C6;
	Tue, 21 Jun 2022 15:39:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02108C03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 15:39:24 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LCNK4x006621;
 Tue, 21 Jun 2022 17:38:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7wHS4RrrYBEtrsvSBNdXWADwm7X95Mf23VVgUaHRP10=;
 b=HoLxW7TLAl7UigaZQ6mU4IMQYuNMnW1PQDVsSZuYQEQs2QftbIOcBFYzyRtVU+Cf3DQG
 +TKucfW1Civp6sCeGFdgGVYeTFJl4GsaaGrEA6WDBnWunsFMQz8wPxrv2i8PZEVtgUA1
 DmeQQM7uLXUyINSEJd+kkEskZ9M3yG4W1Hm0Vwq0sbRdydV4pJ/wX1MiLY8yp6INIrtx
 TuXV6RXBH2Pvx3mTLkNtyLwcJvLfdvrMfzIFqVfaawW7pzpq9Hqi4tpHXSb/jvL9cPPn
 SSSl3FOZCaVsCqGI/tYAkNj9FWej/loQr+sEcu29IK81DRQA1Z59h3TabIxag/5VRTDO ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gua1n2td5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 17:38:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 15F0B10002A;
 Tue, 21 Jun 2022 17:38:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E1C122F7A2;
 Tue, 21 Jun 2022 17:38:54 +0200 (CEST)
Received: from [10.252.18.52] (10.75.127.116) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 21 Jun
 2022 17:38:53 +0200
Message-ID: <9b43b142-e62c-d46b-8b42-449720682463@foss.st.com>
Date: Tue, 21 Jun 2022 17:38:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Wan
 Jiabing <wanjiabing@vivo.com>
References: <20220620154738.801706-1-olivier.moysan@foss.st.com>
 <20220620154738.801706-2-olivier.moysan@foss.st.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20220620154738.801706-2-olivier.moysan@foss.st.com>
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_08,2022-06-21_01,2022-02-23_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/2] iio: adc: stm32-adc: make safe adc
	disable
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

On 6/20/22 17:47, Olivier Moysan wrote:
> From ADC reference manual the software is allowed to write the
> control bit ADDIS of the ADC_CR register only if the ADC is enabled.
> Return immediately from stm32h7_adc_disable() if ADC is already disabled.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>

Hi Olivier,

You can add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice

> ---
>  drivers/iio/adc/stm32-adc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index a68ecbda6480..80e333f65ddd 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -876,6 +876,9 @@ static void stm32h7_adc_disable(struct iio_dev *indio_dev)
>  	int ret;
>  	u32 val;
>  
> +	if (!(stm32_adc_readl(adc, STM32H7_ADC_CR) & STM32H7_ADEN))
> +		return;
> +
>  	/* Disable ADC and wait until it's effectively disabled */
>  	stm32_adc_set_bits(adc, STM32H7_ADC_CR, STM32H7_ADDIS);
>  	ret = stm32_adc_readl_poll_timeout(STM32H7_ADC_CR, val,
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
