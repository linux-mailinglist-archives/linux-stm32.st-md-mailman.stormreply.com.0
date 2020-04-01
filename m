Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9413A19A7D5
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 10:52:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D152C36B0B;
	Wed,  1 Apr 2020 08:52:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B7A5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 08:52:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0318mpeP020674; Wed, 1 Apr 2020 10:52:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=r52PE0j1vMBkkUz5Eegf2p3sdm+5DC8eaQV1TiyeLGc=;
 b=FKKmCM/2e0k3XoRM0JKKuHFS2qqrsvmHjmUccd+uxE4Ew0LCbN9KoV0O1Tj5tVpM3KV+
 lNFxoVqXzamJb+sQAVbXSq+hZdZOm89oGFjXbZ8MfQCnmqQnSLr8/DqFBUP+cFwglzKc
 SPJTxchaIbiSbBRyhyIiSHwnkzzG6K87sG4RiBGw4jhZn6kB5cdjOCwHQTXGxpE+teb4
 mDKtb8K+Q78N0SU6eFj+bjiUvQGj/DhC735mYO6WEFoK3NZwL9FCwazdzWd6ke/BSWx5
 DWamg2/bzA2cqAK1BIbq07ZDH6uATLWCWzTYsTI38t5Lzv22YwNcYmOGjQUH27IZWOHc HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301xbmm00j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 10:52:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E61B100039;
 Wed,  1 Apr 2020 10:52:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 695BA21D6CC;
 Wed,  1 Apr 2020 10:52:22 +0200 (CEST)
Received: from [10.211.14.17] (10.75.127.47) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 10:52:21 +0200
To: Benjamin Gaignard <benjamin.gaignard@st.com>, <lee.jones@linaro.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
 <daniel.lezcano@linaro.org>, <tglx@linutronix.de>
References: <20200401083909.18886-1-benjamin.gaignard@st.com>
 <20200401083909.18886-5-benjamin.gaignard@st.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <4ca5f15f-c967-9c84-4a9f-13a11f71a72a@st.com>
Date: Wed, 1 Apr 2020 10:52:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200401083909.18886-5-benjamin.gaignard@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 4/6] mfd: stm32: enable regmap fast_io
 for stm32-lptimer
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
> Because stm32-lptimer need to write in registers in interrupt context
> enable regmap fast_io to use a spin_lock to protect registers access
> rather than a mutex.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  drivers/mfd/stm32-lptimer.c | 1 +
>  1 file changed, 1 insertion(+)
Hi Benjamin,

Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Thanks,
Fabrice
> 
> diff --git a/drivers/mfd/stm32-lptimer.c b/drivers/mfd/stm32-lptimer.c
> index a00f99f36559..746e51a17cc8 100644
> --- a/drivers/mfd/stm32-lptimer.c
> +++ b/drivers/mfd/stm32-lptimer.c
> @@ -17,6 +17,7 @@ static const struct regmap_config stm32_lptimer_regmap_cfg = {
>  	.val_bits = 32,
>  	.reg_stride = sizeof(u32),
>  	.max_register = STM32_LPTIM_MAX_REGISTER,
> +	.fast_io = true,
>  };
>  
>  static int stm32_lptimer_detect_encoder(struct stm32_lptimer *ddata)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
