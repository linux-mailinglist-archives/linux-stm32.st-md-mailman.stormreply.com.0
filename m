Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0061344B1C
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Mar 2021 17:23:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BE1CC57B5E;
	Mon, 22 Mar 2021 16:23:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D8EDC57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 16:23:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12MGKkaT018624; Mon, 22 Mar 2021 17:22:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1tEm0LmoLr9QwFq83AxQ2i0VrT9e0ARcTO7nkzGA04U=;
 b=0AGEEMO0j3xk3+SFfEulfxngvuilDc2lYuShqiVGZElpolMvcyFsxDvAl8BcG4Kg5ay2
 0tkh3QBK5p+wMYUqKEnANotXZkmtmfs5g2P2hju1Okz6B/wS9HlK4GTOTxJWGXmKWXLF
 2TmTz/+CpBIc0ZV6rNLWk7ZM281wpWSuhBntNYIu2izktYgj5Q1irvajwCNjLaDLEOll
 Bi2z57qnIS5vr/crd9hAB5wVj3xQr0TX31jlIAypskZTOoZFEpyTCdhcYrYD8B4PLD8k
 teyzcq45H5gVpul3CJ2gjBTT79mixSfGAvnpEYm2d0pyTTUJzscmOA2ucYbMHMwe/4d1 Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37d996acq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Mar 2021 17:22:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8115010002A;
 Mon, 22 Mar 2021 17:22:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4B8DF22A2A2;
 Mon, 22 Mar 2021 17:22:30 +0100 (CET)
Received: from [10.211.8.180] (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 22 Mar
 2021 17:22:28 +0100
To: William Breathitt Gray <vilhelm.gray@gmail.com>, <jic23@kernel.org>
References: <cover.1616150619.git.vilhelm.gray@gmail.com>
 <e5dc16652697919af7baed6a630c436359455131.1616150619.git.vilhelm.gray@gmail.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <fbc9bb93-30d0-eeb1-acf4-84570f59dde9@foss.st.com>
Date: Mon, 22 Mar 2021 17:22:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e5dc16652697919af7baed6a630c436359455131.1616150619.git.vilhelm.gray@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_08:2021-03-22,
 2021-03-22 signatures=0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v10 10/33] counter: stm32-lptimer-cnt: Add
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
> stm32_lptim_cnt_functions to match functions_list.
> 
> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  drivers/counter/stm32-lptimer-cnt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi William,

You can add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice
> 
> diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
> index 937439635d53..0f7d3f1ec1b6 100644
> --- a/drivers/counter/stm32-lptimer-cnt.c
> +++ b/drivers/counter/stm32-lptimer-cnt.c
> @@ -134,7 +134,7 @@ enum stm32_lptim_cnt_function {
>  	STM32_LPTIM_ENCODER_BOTH_EDGE,
>  };
>  
> -static enum counter_count_function stm32_lptim_cnt_functions[] = {
> +static const enum counter_count_function stm32_lptim_cnt_functions[] = {
>  	[STM32_LPTIM_COUNTER_INCREASE] = COUNTER_COUNT_FUNCTION_INCREASE,
>  	[STM32_LPTIM_ENCODER_BOTH_EDGE] = COUNTER_COUNT_FUNCTION_QUADRATURE_X4,
>  };
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
