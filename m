Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 934DA344B20
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Mar 2021 17:23:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F38EC57B5E;
	Mon, 22 Mar 2021 16:23:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1900C57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 16:23:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12MGMsqe030064; Mon, 22 Mar 2021 17:22:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=uUcuMAhnIlMw3NLgvCvihCxNTTfEvtuXNlKTWxdYRhU=;
 b=6salgYkkf4nvyZ2eMRIhTRLpJFoh8yY03BfME5PZrwPIZcdiY/NHEj7hDzJMtWXCF+Vc
 9t5sx6/xa87h50l2vW3cg9HYPR0BOpqNyy1EBVFjWCEuTr9SUgMDGzEzC9F+8IvvhVvK
 Xj2JrdnBXo1OnGn2ME3EHlZYNo+v+/TPm8aXNjMu/xRW+V5yrPAgkFu0e895RvROKi6f
 5PjAYDCxwqxK2OGobPjHlSxhDuY7IkNIzmWteitoMahowm+NGFnFaeZoePWEzuQFmNzX
 XkzvhF9iPPLV1fC9PX9hzhD/Dwf4FYtSj8mK9uQakygr0h2yvTN4A6Qd1F5rnvYcSyzm +Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37d72djs0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 17:22:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ABCA310002A;
 Mon, 22 Mar 2021 17:22:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 96BEE22A2A2;
 Mon, 22 Mar 2021 17:22:51 +0100 (CET)
Received: from [10.211.8.180] (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Mar
 2021 17:22:50 +0100
To: William Breathitt Gray <vilhelm.gray@gmail.com>, <jic23@kernel.org>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
 <b1baf33d515a911664650f006c035784c4d79eb2.1616150619.git.vilhelm.gray@gmail.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <b3a958a4-103c-59a3-6716-47f8167c59d6@foss.st.com>
Date: Mon, 22 Mar 2021 17:22:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b1baf33d515a911664650f006c035784c4d79eb2.1616150619.git.vilhelm.gray@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_08:2021-03-22,
 2021-03-22 signatures=0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, syednwaris@gmail.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, david@lechnology.com
Subject: Re: [Linux-stm32] [PATCH v10 11/33] counter: stm32-timer-cnt: Add
 const qualifier for functions_list array
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

On 3/19/21 12:00 PM, William Breathitt Gray wrote:
> The struct counter_count functions_list member expects a const enum
> counter_count_function array. This patch adds the const qualifier to the
> stm32_count_functions to match functions_list.
> 
> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/counter/stm32-timer-cnt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi William,

You can add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice

> 
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
> index 75bc401fdd18..0c18573a7837 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -50,7 +50,7 @@ enum stm32_count_function {
>  	STM32_COUNT_ENCODER_MODE_3,
>  };
>  
> -static enum counter_count_function stm32_count_functions[] = {
> +static const enum counter_count_function stm32_count_functions[] = {
>  	[STM32_COUNT_SLAVE_MODE_DISABLED] = COUNTER_COUNT_FUNCTION_INCREASE,
>  	[STM32_COUNT_ENCODER_MODE_1] = COUNTER_COUNT_FUNCTION_QUADRATURE_X2_A,
>  	[STM32_COUNT_ENCODER_MODE_2] = COUNTER_COUNT_FUNCTION_QUADRATURE_X2_B,
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
