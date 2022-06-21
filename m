Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA1755364B
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jun 2022 17:39:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 075C3C5EC6B;
	Tue, 21 Jun 2022 15:39:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2ECABC03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 15:39:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LCe1mn006624;
 Tue, 21 Jun 2022 17:39:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UN5uEoUEwzsIoc43ELZbzUPrXzYLEx6ffknHGW66Lbo=;
 b=TkBwqxSba9+dCF/11e1Hh627aHD2f/KXTnIbTNaRSFSO0mGAXmCK+9pvrop8SvQrlZRg
 A5EjG0IjCSX8nEAh6GWaV0jBZZN8Gba5DDeg6xo1UPMewCOfZnTNJR0l6UueV27WnuQg
 UwSj9ZXzo6+TCvZzEqB2J+p9QwFwnESGrMRza0SpZO5s5gfhEPAL4Hpes5tD8QrfmDg6
 HhDEFLY2n9qcdaNal8ICTmB+XwXV5WSG6ouhQXYgCMgdoSEoLDYVtmweomgxBorsy1Y2
 PwkLdpL3rgmqa1uwvbgW4B0HAV/ONAIbZu+dHXbZIxfv+q6ZW/RQKnN5PmUIuo3QhyQV 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gua1n2tdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 17:39:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 524BE10002A;
 Tue, 21 Jun 2022 17:39:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E32822F7A3;
 Tue, 21 Jun 2022 17:39:10 +0200 (CEST)
Received: from [10.252.18.52] (10.75.127.118) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 21 Jun
 2022 17:39:08 +0200
Message-ID: <9504e87e-78a5-36c5-2df9-c933c70a9103@foss.st.com>
Date: Tue, 21 Jun 2022 17:39:08 +0200
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
 <20220620154738.801706-3-olivier.moysan@foss.st.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20220620154738.801706-3-olivier.moysan@foss.st.com>
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_08,2022-06-21_01,2022-02-23_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/2] iio: adc: stm32-adc: disable adc
	before calibration
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
> The calibration is launched from prepare callback.
> The ADC state when entering this function may be unknown as the
> ADC may have been left enabled by boot stage.
> One prerequisite for ADC calibration is to have ADC in disabled state.
> If the calibration is started when ADC is still enabled, the behavior is
> unpredictable, and the calibration may fail with a timeout error.
> 
> Force ADC to disabled state in stm32h7_adc_selfcalib().
> ADC enabling is ensured by stm32h7_adc_enable() call,
> before leaving prepare callback.
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
> index 80e333f65ddd..3985fe972892 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1019,6 +1019,9 @@ static int stm32h7_adc_selfcalib(struct iio_dev *indio_dev)
>  	if (adc->cal.calibrated)
>  		return true;
>  
> +	/* ADC must be disabled for calibration */
> +	stm32h7_adc_disable(indio_dev);
> +
>  	/*
>  	 * Select calibration mode:
>  	 * - Offset calibration for single ended inputs
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
