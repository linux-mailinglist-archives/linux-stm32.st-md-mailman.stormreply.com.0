Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F489310CCC
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Feb 2021 15:59:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B0FBC57B59;
	Fri,  5 Feb 2021 14:59:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB931C3FADB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Feb 2021 14:58:22 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 115EpMwn029624; Fri, 5 Feb 2021 15:58:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=K2IpOPO6ClARdSjmSkkgxNEu1UWz7Lz6ahJgJgHk+gA=;
 b=QceFg4C0e8V4+jciH7pFCOiF5qdd/YicfYswp7k5N40Xa/wntSfdm/529T0uelU4KiOQ
 5pwuYdNMPURUyj3Fd1r3hmR6s/1ScXRBxwOtu+4kj1mX8mnDSe4mpcc8vS37kBA/+Ymp
 5lXzylnFbLs0fuGYhNLx0BM/+ZaQCWXmF4gUtBi413LgBk3nS8GNIRipXWoAZujLkkDx
 8GTDMTCyZg2J2dxwTH8qbXPX1u4+N59panQFAoCujY47LojUiirgR2ybCd2rviffVOJu
 JGECeCoUM4v7LV4U/4xrmO9dqIISHitcjiwqUrP1+q6+HMaAvYHx75qx51MRFceUw/lS TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36h1kear9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 15:58:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B248310002A;
 Fri,  5 Feb 2021 15:58:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C5942402B9;
 Fri,  5 Feb 2021 15:58:11 +0100 (CET)
Received: from lmecxl1060.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Feb
 2021 15:58:10 +0100
To: Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>,
 <robh+dt@kernel.org>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-2-git-send-email-alain.volmat@foss.st.com>
From: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <350e3fe2-e23a-6b6b-c513-276ce9fb6631@foss.st.com>
Date: Fri, 5 Feb 2021 15:58:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612515104-838-2-git-send-email-alain.volmat@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_09:2021-02-05,
 2021-02-05 signatures=0
X-Mailman-Approved-At: Fri, 05 Feb 2021 14:59:19 +0000
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] i2c: stm32f7: fix configuration of
	the digital filter
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

Hello all

Looks good to me

Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Regards

On 2/5/21 9:51 AM, Alain Volmat wrote:
> The digital filter related computation are present in the driver
> however the programming of the filter within the IP is missing.
> The maximum value for the DNF is wrong and should be 15 instead of 16.
> 
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 9aa8e65b511e..473fbe144b7e 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -57,6 +57,8 @@
>  #define STM32F7_I2C_CR1_RXDMAEN			BIT(15)
>  #define STM32F7_I2C_CR1_TXDMAEN			BIT(14)
>  #define STM32F7_I2C_CR1_ANFOFF			BIT(12)
> +#define STM32F7_I2C_CR1_DNF_MASK		GENMASK(11, 8)
> +#define STM32F7_I2C_CR1_DNF(n)			(((n) & 0xf) << 8)
>  #define STM32F7_I2C_CR1_ERRIE			BIT(7)
>  #define STM32F7_I2C_CR1_TCIE			BIT(6)
>  #define STM32F7_I2C_CR1_STOPIE			BIT(5)
> @@ -160,7 +162,7 @@ enum {
>  };
>  
>  #define STM32F7_I2C_DNF_DEFAULT			0
> -#define STM32F7_I2C_DNF_MAX			16
> +#define STM32F7_I2C_DNF_MAX			15
>  
>  #define STM32F7_I2C_ANALOG_FILTER_ENABLE	1
>  #define STM32F7_I2C_ANALOG_FILTER_DELAY_MIN	50	/* ns */
> @@ -725,6 +727,13 @@ static void stm32f7_i2c_hw_config(struct stm32f7_i2c_dev *i2c_dev)
>  	else
>  		stm32f7_i2c_set_bits(i2c_dev->base + STM32F7_I2C_CR1,
>  				     STM32F7_I2C_CR1_ANFOFF);
> +
> +	/* Program the Digital Filter */
> +	stm32f7_i2c_clr_bits(i2c_dev->base + STM32F7_I2C_CR1,
> +			     STM32F7_I2C_CR1_DNF_MASK);
> +	stm32f7_i2c_set_bits(i2c_dev->base + STM32F7_I2C_CR1,
> +			     STM32F7_I2C_CR1_DNF(i2c_dev->setup.dnf));
> +
>  	stm32f7_i2c_set_bits(i2c_dev->base + STM32F7_I2C_CR1,
>  			     STM32F7_I2C_CR1_PE);
>  }
> 

-- 
--
~ Py MORDRET
--
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
