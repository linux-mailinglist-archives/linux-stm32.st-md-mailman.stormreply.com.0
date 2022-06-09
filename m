Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C617E544B7D
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jun 2022 14:14:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64546C5EC76;
	Thu,  9 Jun 2022 12:14:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44A43C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jun 2022 12:14:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2598hdMB005036;
 Thu, 9 Jun 2022 14:14:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bSH8k7jHxKUyrpoyMJgrVh2iKbBNDn/nCbRq/ihGCaQ=;
 b=EfLJTcbmaMgZQdN1oH42I7AOQhGK+l87T4temiXrsnVJ52EXeiLiANWgDLtU5o1+4Xbp
 S2mkEJOoIP2Lweijv22F2RwKe3z3RvH3SG3ztZJWtqkvhsVlKFJ2sZhj88HIKp1tlA5e
 BNruinEEzRsTv56RyLsRAn9+hgdgvOOdiiwnUdbw4HmdUrUsXGvQo+NLPmmEGxfauDMT
 Zk5oNrBRN8OqDTDkjrC3Q+quD5DynvBryk7baKMGsw//HdtO7BlCcv1+/aOrlmuOgfay
 0RcptKu1pKgrsosu5p3aNr5m3ppQFYASOvFRjipp6IQ1FPZt8aQCPEYxuH1MsZu8U1/l hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gj3d40h8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 14:14:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7E4110002A;
 Thu,  9 Jun 2022 14:14:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF6D62171F4;
 Thu,  9 Jun 2022 14:14:17 +0200 (CEST)
Received: from [10.48.1.102] (10.75.127.47) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 9 Jun
 2022 14:14:16 +0200
Message-ID: <587eed11-8418-24a2-e8f7-d624ec570ebe@foss.st.com>
Date: Thu, 9 Jun 2022 14:14:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Paul Cercueil <paul@crapouillou.net>
References: <20220609095234.375925-1-olivier.moysan@foss.st.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20220609095234.375925-1-olivier.moysan@foss.st.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_09,2022-06-09_01,2022-02-23_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32: fix maximum clock rate
	for stm32mp15x
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

On 6/9/22 11:52, Olivier Moysan wrote:
> Change maximum STM32 ADC input clock rate to 36MHz, as specified
> in STM32MP15x datasheets.
> 
> Fixes: d58c67d1d851 ("iio: adc: stm32-adc: add support for STM32MP1")
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>

Hi Olivier,

You can add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice
> ---
>  drivers/iio/adc/stm32-adc-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 142656232157..ce1a63a82034 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -805,7 +805,7 @@ static const struct stm32_adc_priv_cfg stm32h7_adc_priv_cfg = {
>  static const struct stm32_adc_priv_cfg stm32mp1_adc_priv_cfg = {
>  	.regs = &stm32h7_adc_common_regs,
>  	.clk_sel = stm32h7_adc_clk_sel,
> -	.max_clk_rate_hz = 40000000,
> +	.max_clk_rate_hz = 36000000,
>  	.has_syscfg = HAS_VBOOSTER | HAS_ANASWVDD,
>  	.num_irqs = 2,
>  };
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
