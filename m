Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 754CA6D4099
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 11:30:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 310FEC65E70;
	Mon,  3 Apr 2023 09:30:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0098EC64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 09:30:10 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3338Cqw1009872; Mon, 3 Apr 2023 11:29:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=D4P9laXrmA/FeNU6BwSI6EO7GivyJSWZ483Tfs0dNL4=;
 b=r9kliuGN4mZu2l+ze8b1MT6yPe7c+zy33NppexRrf5CGPAcYGM8+uzUUIkr73o3Qh88o
 7pPw34Qaug/KNscu7SXY9TSk3BQQ/lyiR4xYQfCKpK9CUrn1il60xTVXIBYAfFla3Mr5
 zLr253vQSCvTzuVOMNxvwFuHFkqbtLz3VpEGr1V9zUIm+L5Mj6hd6UKCSV9wYJBesUDU
 kkUKtFrwf6TCi9cwAB7a3FSA72ie2C+S2FqGy2sUi56XKsglCh0hTSJcfwOSW2b5Cw9m
 spAgGEWh9PqJI9k+450zs+fc3NBPydHay7dYYs5DWQakEqboPCUIM9akLrO7uYXLYCEa Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pqu38rgbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 11:29:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7A3410002A;
 Mon,  3 Apr 2023 11:29:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6AE1214D26;
 Mon,  3 Apr 2023 11:29:41 +0200 (CEST)
Received: from [10.252.15.35] (10.252.15.35) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 3 Apr
 2023 11:29:41 +0200
Message-ID: <019c8081-d7e0-931e-2bdf-87ba93a552f1@foss.st.com>
Date: Mon, 3 Apr 2023 11:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Sean Nyekjaer <sean@geanix.com>, <jic23@kernel.org>, <lars@metafoo.de>,
 <alexandre.torgue@foss.st.com>, <nuno.sa@analog.com>
References: <20230327083449.1098174-1-sean@geanix.com>
 <20230327083449.1098174-3-sean@geanix.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20230327083449.1098174-3-sean@geanix.com>
X-Originating-IP: [10.252.15.35]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_06,2023-03-31_01,2023-02-09_01
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 3/3] iio: adc: stm32-adc: skip
 adc-channels setup if none is present
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Sean,

Thanks for your patch.
You're right. The DT updates to use the generic bindings are not yet 
upstreamed, and there are some regressions on legacy bindings support.
Please, find here after some comments.

BRs
Olivier

On 3/27/23 10:34, Sean Nyekjaer wrote:
> If only adc differential channels are defined driver will fail with
> stm32-adc: probe of 48003000.adc:adc@0 failed with error -22
> 
> Fix this by skipping the initialization if no channels are defined.
> 
> This applies only to the legacy way of initializing adc channels.
> 
> Fixes: d7705f35448a ("iio: adc: stm32-adc: convert to device properties")
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>   drivers/iio/adc/stm32-adc.c | 38 +++++++++++++++++++------------------
>   1 file changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index a04fcb2dc80a..6d87cfaadb5d 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -2065,28 +2065,30 @@ static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
>   		}
>   	}
>   

In PIO mode an extra channel channel is defined for timestamps. This 
additional channel must be ignored in channel count when initializing 
single and diff channels.

This can be handled in stm32_adc_legacy_chan_init() call from 
stm32_adc_legacy_chan_init() function:

         ret = stm32_adc_legacy_chan_init(indio_dev, adc, channels, 
timestamping ? num_channels - 1 : num_channels);

> -	ret = device_property_read_u32_array(dev, "st,adc-channels", chans,
> -					     nchans);
> -	if (ret)
> -		return ret;
> -
> -	for (c = 0; c < nchans; c++) {
> -		if (chans[c] >= adc_info->max_channels) {
> -			dev_err(&indio_dev->dev, "Invalid channel %d\n",
> -				chans[c]);
> -			return -EINVAL;
> -		}
> +	if (nchans - num_diff > 0) {
> +		ret = device_property_read_u32_array(dev, "st,adc-channels", chans,
> +				nchans);

num_se = nchans - num_diff represents single ended channels number.
single ended count has to be used also in 
device_property_read_u32_array() call:
ret = device_property_read_u32_array(dev, "st,adc-channels", chans, 
num_se);

> +		if (ret)
> +			return ret;
> 
> -		/* Channel can't be configured both as single-ended & diff */
> -		for (i = 0; i < num_diff; i++) {
> -			if (chans[c] == diff[i].vinp) {
> -				dev_err(&indio_dev->dev, "channel %d misconfigured\n",	chans[c]);
> +		for (c = 0; c < nchans; c++) {

and also in this for loop:
for (c = 0; c < num_se; c++) {

> +			if (chans[c] >= adc_info->max_channels) {
> +				dev_err(&indio_dev->dev, "Invalid channel %d\n",
> +						chans[c]);
>   				return -EINVAL;
>   			}
> -		}
> -		stm32_adc_chan_init_one(indio_dev, &channels[scan_index],
> +
> +			/* Channel can't be configured both as single-ended & diff */
> +			for (i = 0; i < num_diff; i++) {
> +				if (chans[c] == diff[i].vinp) {
> +					dev_err(&indio_dev->dev, "channel %d misconfigured\n",	chans[c]);
> +					return -EINVAL;
> +				}
> +			}
> +			stm32_adc_chan_init_one(indio_dev, &channels[scan_index],
>   					chans[c], 0, scan_index, false);
> -		scan_index++;
> +			scan_index++;
> +		}
>   	}
>   
>   	if (adc->nsmps > 0) {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
