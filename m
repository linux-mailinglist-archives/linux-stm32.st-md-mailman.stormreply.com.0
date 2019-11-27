Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CAB10B2FF
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 17:13:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D02FC36B0E;
	Wed, 27 Nov 2019 16:13:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30454C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 16:13:55 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARGD2Gk022984; Wed, 27 Nov 2019 17:13:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=N0R/5k+FQrkEg1dliWlCmRaXaD6fZGnSUrPITJyt5O8=;
 b=xbNrJBvQ3ZXlZPs5VVE6ycWuq5hugyng9abUhyfuQDpbZRhmZnbVhsyTVmUsgXJh5RyJ
 scZ/L/7SXKnbOmj0mxHPiG0LwHhqnPz6A/qncuxwq8CbKY+of7epL69WY9RA2SToyP+m
 Dzt3Zn/Ro8UesSm1j7mHBW+3Wl3u176sPhGETzH6sKT4UKjikvG6ny5iWn92S0A2hXrC
 7b8vOpYXegWERMimUiWKT2e86REc0ayLuGc/sWQb/NixXlQGR3Y3khzkMMDl7/reTMBe
 fzRO1Dp6E9kDhQCwqEUiCEA6DjlGDbValedxYwyP9mnmV+Z2nQCfknjG6rUxVR9ysFrT pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2whcxj4ktm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 17:13:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4721E100038;
 Wed, 27 Nov 2019 17:13:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36DF92C38D5;
 Wed, 27 Nov 2019 17:13:14 +0100 (CET)
Received: from [10.48.0.192] (10.75.127.46) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Nov
 2019 17:13:13 +0100
To: Olivier Moysan <olivier.moysan@st.com>, <jic23@kernel.org>,
 <knaack.h@gmx.de>, <lars@metafoo.de>, <pmeerw@pmeerw.net>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
 <linux-iio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@st.com>
References: <20191127130729.18511-1-olivier.moysan@st.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <114f6002-9577-52b2-0482-5350effda3e4@st.com>
Date: Wed, 27 Nov 2019 17:13:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127130729.18511-1-olivier.moysan@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_04:2019-11-27,2019-11-27 signatures=0
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-dfsdm: fix single
	conversion
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

On 11/27/19 2:07 PM, Olivier Moysan wrote:
> Apply data formatting to single conversion,
> as this is already done in continuous and trigger modes.
> 
> Fixes: 102afde62937 ("iio: adc: stm32-dfsdm: manage data resolution in trigger mode")
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
Hi Olivier,

Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Thanks,
Fabrice

> ---
> changes in version 2:
> - correct title
> ---
>  drivers/iio/adc/stm32-dfsdm-adc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index e493242c266e..0339ecdd06bd 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -1204,6 +1204,8 @@ static int stm32_dfsdm_single_conv(struct iio_dev *indio_dev,
>  
>  	stm32_dfsdm_stop_conv(adc);
>  
> +	stm32_dfsdm_process_data(adc, res);
> +
>  stop_dfsdm:
>  	stm32_dfsdm_stop_dfsdm(adc->dfsdm);
>  
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
