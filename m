Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E833FC878
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Aug 2021 15:40:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D626C57B7A;
	Tue, 31 Aug 2021 13:40:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AE99C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Aug 2021 13:40:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17V923tF014249;
 Tue, 31 Aug 2021 15:39:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7TWD+I2wmEXOmT9BAsUP1oRCwO+F14w5H0sbol1tPM0=;
 b=GKm6shn98d6ivZJO4J1igf5qaGP/Grc7aFiFfP7e0KzbQtmH6CsDEos2UgkI6/+MmR7f
 PVeynkBbLlk9XbwWU5BIqSiDli9bFWukWfTfx8L1bjuMMHx8UIkmgYR+4rxtbOLNjP0I
 f3lET4OVSlEJ4P2++7ZcWzUda5hURORDBs1c68AcoM6GRSwASN8Q2PzkzZ+hv0NP/9k4
 4XZqdnv7h07XNLR9vMsOwEn4Qi+/iiMPSUHwPQqTtgbtrDsv+Jx6gdZtDwtPyRyQQ6on
 t82JG+oB1DTs4cGRIGr4BOAnxsDnvyPbrSfRG+yotOvZZ4DVd0G0EnysjRO9ct4J8D2S RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3asheh1h64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 15:39:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4AFA510002A;
 Tue, 31 Aug 2021 15:39:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22513246929;
 Tue, 31 Aug 2021 15:39:13 +0200 (CEST)
Received: from [10.211.11.146] (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 15:39:11 +0200
To: William Breathitt Gray <vilhelm.gray@gmail.com>, <jic23@kernel.org>
References: <cover.1630031207.git.vilhelm.gray@gmail.com>
 <a111c8905c467805ca530728f88189b59430f27e.1630031207.git.vilhelm.gray@gmail.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ec80f7a8-5f2e-522f-6a66-ab25092618c2@foss.st.com>
Date: Tue, 31 Aug 2021 15:38:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a111c8905c467805ca530728f88189b59430f27e.1630031207.git.vilhelm.gray@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-31_05,2021-08-31_01,2020-04-07_01
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v16 01/14] counter: stm32-lptimer-cnt:
 Provide defines for clock polarities
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



On 8/27/21 5:47 AM, William Breathitt Gray wrote:
> The STM32 low-power timer permits configuration of the clock polarity
> via the LPTIMX_CFGR register CKPOL bits. This patch provides
> preprocessor defines for the supported clock polarities.
> 
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/counter/stm32-lptimer-cnt.c | 6 +++---
>  include/linux/mfd/stm32-lptimer.h   | 5 +++++
>  2 files changed, 8 insertions(+), 3 deletions(-)

Hi William,

You can add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice

> 
> diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
> index 13656957c45f..7367f46c6f91 100644
> --- a/drivers/counter/stm32-lptimer-cnt.c
> +++ b/drivers/counter/stm32-lptimer-cnt.c
> @@ -140,9 +140,9 @@ static const enum counter_function stm32_lptim_cnt_functions[] = {
>  };
>  
>  enum stm32_lptim_synapse_action {
> -	STM32_LPTIM_SYNAPSE_ACTION_RISING_EDGE,
> -	STM32_LPTIM_SYNAPSE_ACTION_FALLING_EDGE,
> -	STM32_LPTIM_SYNAPSE_ACTION_BOTH_EDGES,
> +	STM32_LPTIM_SYNAPSE_ACTION_RISING_EDGE = STM32_LPTIM_CKPOL_RISING_EDGE,
> +	STM32_LPTIM_SYNAPSE_ACTION_FALLING_EDGE = STM32_LPTIM_CKPOL_FALLING_EDGE,
> +	STM32_LPTIM_SYNAPSE_ACTION_BOTH_EDGES = STM32_LPTIM_CKPOL_BOTH_EDGES,
>  	STM32_LPTIM_SYNAPSE_ACTION_NONE,
>  };
>  
> diff --git a/include/linux/mfd/stm32-lptimer.h b/include/linux/mfd/stm32-lptimer.h
> index 90b20550c1c8..06d3f11dc3c9 100644
> --- a/include/linux/mfd/stm32-lptimer.h
> +++ b/include/linux/mfd/stm32-lptimer.h
> @@ -45,6 +45,11 @@
>  #define STM32_LPTIM_PRESC	GENMASK(11, 9)
>  #define STM32_LPTIM_CKPOL	GENMASK(2, 1)
>  
> +/* STM32_LPTIM_CKPOL */
> +#define STM32_LPTIM_CKPOL_RISING_EDGE	0
> +#define STM32_LPTIM_CKPOL_FALLING_EDGE	1
> +#define STM32_LPTIM_CKPOL_BOTH_EDGES	2
> +
>  /* STM32_LPTIM_ARR */
>  #define STM32_LPTIM_MAX_ARR	0xFFFF
>  
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
