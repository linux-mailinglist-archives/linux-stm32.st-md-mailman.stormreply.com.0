Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 844E019A7D1
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 10:52:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E596C36B0B;
	Wed,  1 Apr 2020 08:52:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49083C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 08:52:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0318mpWe009234; Wed, 1 Apr 2020 10:52:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=vu4qQWypR0pvt6vGhb+hu2zbxKSw9Xfk1eNnrYVVjv0=;
 b=Bz5kj7thRXHC1yRZ1OgULStYl0DaHIznaEan7Ase11XZ1sc9x8sL7teQc1JFPLYC+Im5
 ifwjAyXEU4WWfr+xelyILT9/TCw9fs3cPj4b0qa5KGOxye+GGeXJR2ULwEPb4X47SX9t
 MzH+MNq+jLX4/u0PMZlqgmMm0yb05L+/kiP/6hsNpPkusGJE8HITAXqbm9fZA8rkMC0T
 WJVyPRhnF1NTRjmxdz2YmS8UYxJjaSgfyGQBuH1Q1dPA/EUG4Y+YQBpQT7Qyoj1YaE7K
 OH/5wYFFf9UgZdHli+ae7HRf7epZfstEz92URSCMMXHK8pHxRS0xREIzT9ISQbWMlG7K mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y53x4nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 10:52:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2C7B510002A;
 Wed,  1 Apr 2020 10:52:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D83021D6CB;
 Wed,  1 Apr 2020 10:52:08 +0200 (CEST)
Received: from [10.211.14.17] (10.75.127.46) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 10:52:06 +0200
To: Benjamin Gaignard <benjamin.gaignard@st.com>, <lee.jones@linaro.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
 <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
References: <20200401083909.18886-1-benjamin.gaignard@st.com>
 <20200401083909.18886-4-benjamin.gaignard@st.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <a4be2faf-a698-6fa9-9280-940955b74d5c@st.com>
Date: Wed, 1 Apr 2020 10:52:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200401083909.18886-4-benjamin.gaignard@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 3/6] mfd: stm32: Add defines to be used
 for clkevent purpose
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

On 4/1/20 10:39 AM, Benjamin Gaignard wrote:
> Add defines to be able to enable/clear irq and configure one shot mode.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> ---
>  include/linux/mfd/stm32-lptimer.h | 5 +++++
>  1 file changed, 5 insertions(+)

Hi Benjamin,

Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Thanks,
Fabrice

> 
> diff --git a/include/linux/mfd/stm32-lptimer.h b/include/linux/mfd/stm32-lptimer.h
> index 605f62264825..90b20550c1c8 100644
> --- a/include/linux/mfd/stm32-lptimer.h
> +++ b/include/linux/mfd/stm32-lptimer.h
> @@ -27,10 +27,15 @@
>  #define STM32_LPTIM_CMPOK		BIT(3)
>  
>  /* STM32_LPTIM_ICR - bit fields */
> +#define STM32_LPTIM_ARRMCF		BIT(1)
>  #define STM32_LPTIM_CMPOKCF_ARROKCF	GENMASK(4, 3)
>  
> +/* STM32_LPTIM_IER - bit flieds */
> +#define STM32_LPTIM_ARRMIE	BIT(1)
> +
>  /* STM32_LPTIM_CR - bit fields */
>  #define STM32_LPTIM_CNTSTRT	BIT(2)
> +#define STM32_LPTIM_SNGSTRT	BIT(1)
>  #define STM32_LPTIM_ENABLE	BIT(0)
>  
>  /* STM32_LPTIM_CFGR - bit fields */
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
