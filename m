Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C862343EAE
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Mar 2021 11:59:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B294C57B5E;
	Mon, 22 Mar 2021 10:59:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE90BC57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 10:59:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12MAuxI5010598; Mon, 22 Mar 2021 11:59:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=URFJaqu4KP8rQ9APNeKDRJ//qCNcWIl4l8JzimvPV5c=;
 b=tz5JeK+H43b+lanXzOzY5yP1onDEcCO5vh2+Q1GT0nwgKqwgSZvrhNr9q05xt2ixtnJ9
 KQaA2s0ZtKJ+ntbO6ZDeFAhIlEKKPERwq596Ckt19LpcneSo6XPSRBpY6Hrfa9Xl5/0r
 K3xYmMVnu3KVIIk/u73b0hhaHtcaikdeSgAcGg3/W/eC09vFXML1BFCik5t/4RRjLoYz
 tiaf9RZBCGdT2pKncWQdY6AHxOWVIZQ5/vvJrwxuOhOnbdLZuy1MUyMQDp586bfEx9KY
 dX87zT6Jx0h2EZRy9CHk0NeTicYVCGQk0ddC1F5asN8n6Lo0SOaGQRzRlLWiGKY423ff tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37d7d7s83f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 11:59:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B35810002A;
 Mon, 22 Mar 2021 11:59:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36870244736;
 Mon, 22 Mar 2021 11:59:20 +0100 (CET)
Received: from [10.211.8.180] (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Mar
 2021 11:59:19 +0100
To: <lee.jones@linaro.org>
References: <1614793895-10504-1-git-send-email-fabrice.gasnier@foss.st.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ce30adb7-fe58-6b56-9cc9-3f19692b56c2@foss.st.com>
Date: Mon, 22 Mar 2021 11:59:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1614793895-10504-1-git-send-email-fabrice.gasnier@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_04:2021-03-22,
 2021-03-22 signatures=0
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, vilhelm.gray@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stm32-timers: avoid clearing auto
	reload register
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

On 3/3/21 6:51 PM, Fabrice Gasnier wrote:
> The ARR register is cleared unconditionally upon probing, after the maximum
> value has been read. This initial condition is rather not intuitive, when
> considering the counter child driver. It rather expects the maximum value
> by default:
> - The counter interface shows a zero value by default for 'ceiling'
>   attribute.
> - Enabling the counter without any prior configuration makes it doesn't
>   count.
> 
> The reset value of ARR register is the maximum. So Choice here
> is to backup it, and restore it then, instead of clearing its value.
> It also fixes the initial condition seen by the counter driver.
> 
> Fixes: d0f949e220fd ("mfd: Add STM32 Timers driver")
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/mfd/stm32-timers.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Hi,

It's just a gentle reminder to review this patch.

Best Regards,
Fabrice

> 
> diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
> index add6033..44ed2fc 100644
> --- a/drivers/mfd/stm32-timers.c
> +++ b/drivers/mfd/stm32-timers.c
> @@ -158,13 +158,18 @@ static const struct regmap_config stm32_timers_regmap_cfg = {
>  
>  static void stm32_timers_get_arr_size(struct stm32_timers *ddata)
>  {
> +	u32 arr;
> +
> +	/* Backup ARR to restore it after getting the maximum value */
> +	regmap_read(ddata->regmap, TIM_ARR, &arr);
> +
>  	/*
>  	 * Only the available bits will be written so when readback
>  	 * we get the maximum value of auto reload register
>  	 */
>  	regmap_write(ddata->regmap, TIM_ARR, ~0L);
>  	regmap_read(ddata->regmap, TIM_ARR, &ddata->max_arr);
> -	regmap_write(ddata->regmap, TIM_ARR, 0x0);
> +	regmap_write(ddata->regmap, TIM_ARR, arr);
>  }
>  
>  static int stm32_timers_dma_probe(struct device *dev,
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
