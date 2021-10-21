Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A8B43610C
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Oct 2021 14:05:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36A47C5C854;
	Thu, 21 Oct 2021 12:05:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85346C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Oct 2021 12:04:52 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19L8h2sI007645; 
 Thu, 21 Oct 2021 14:04:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=hvddE42Q9bJ7IvzpAni+KWpr1V0kd9MuytQRIK1sshU=;
 b=0WK/cvMW+iNDuWqG0pNhSG7kEReA9R122vl0mFaH6fKU0vMCD2rEqHgXgVENJhXEQs5p
 Mm8EF8zrtqp9JVfkNxWgy9PEZVAgwcuz3gsZJLKXutUihuSHg5Wirx8j8rSbtdpOw7gt
 yxlt7ertC45S1yqJm0Ra+HLmv/CM8OPJRNY83lyUcuiwozKZelgaqFTswqavZIvW0sku
 JgsCDxF4+1+lMJmJdSoh+jOTNOVJ5i/QJBFV+RF/9qc86HorUtiLmC8uFCDeSGoBwOjB
 HuAfS8BB0QjqlZUytxDSSk/OnCNosDpXWEZe7Ez+o/2ANbUYi71Qnds9kLlqbZqBG0Kd sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3btywkb956-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 14:04:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E665210002A;
 Thu, 21 Oct 2021 14:04:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DDFE821CA96;
 Thu, 21 Oct 2021 14:04:14 +0200 (CEST)
Received: from [10.211.1.225] (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 21 Oct
 2021 14:04:13 +0200
To: Wan Jiabing <wanjiabing@vivo.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Xu Wang <vulab@iscas.ac.cn>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 <linux-iio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20211021112452.9491-1-wanjiabing@vivo.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <46423a73-5c4f-84d8-6f2c-5889bc14cd53@foss.st.com>
Date: Thu, 21 Oct 2021 14:04:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211021112452.9491-1-wanjiabing@vivo.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-21_02,2021-10-21_02,2020-04-07_01
Cc: kael_w@yeah.net
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: Fix of_node_put()
	issue in stm32-adc
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

On 10/21/21 1:24 PM, Wan Jiabing wrote:
> Fix following coccicheck warning:
> ./drivers/iio/adc/stm32-adc.c:2014:1-33: WARNING: Function
> for_each_available_child_of_node should have of_node_put() before return.
> 
> Early exits from for_each_available_child_of_node should decrement the
> node reference counter. Replce return by goto here.

Hi Wan,

typo: Replace

I guess there's no need for a Fixes tag. (I'm pretty sure Jonathan will
advise on this if needed).

> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Apart from that, you can add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks for the fix,
Best Regards,
Fabrice

> ---
>  drivers/iio/adc/stm32-adc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 6245434f8377..7f1fb36c747c 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -2024,7 +2024,8 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
>  			if (strlen(name) >= STM32_ADC_CH_SZ) {
>  				dev_err(&indio_dev->dev, "Label %s exceeds %d characters\n",
>  					name, STM32_ADC_CH_SZ);
> -				return -EINVAL;
> +				ret = -EINVAL;
> +				goto err;
>  			}
>  			strncpy(adc->chan_name[val], name, STM32_ADC_CH_SZ);
>  			ret = stm32_adc_populate_int_ch(indio_dev, name, val);
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
