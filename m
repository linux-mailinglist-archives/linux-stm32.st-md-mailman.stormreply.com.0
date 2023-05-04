Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E9D6F6A46
	for <lists+linux-stm32@lfdr.de>; Thu,  4 May 2023 13:41:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4227FC6A5EE;
	Thu,  4 May 2023 11:41:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06624C69073
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 May 2023 11:41:45 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 344AjTRA008853; Thu, 4 May 2023 13:41:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=mgBoB7y0Q8zoPq556QTbRXqfnTsbr9KKVw24VOBMPss=;
 b=faVk5/gyvYdUZfYLgFTA0Mvxz3OAtcEYPbpOHVrcbPA6Ur2868y3TE0aiqVpRNMiPJpw
 +asAYHyLNtu4IC8ff6YwDLKhMYKpmNTBbhcWRfMyVgn7yDBt6Cvt2A3xPdafFNW99mC0
 BkZDqhwyA2REHvm1SA9/1AT+y31e/VHNE6kh/fGCzhO0J/6N3MHRLY1GsyV4xXDQrk1E
 QnrsQMfxe8kRLOjl7leqNWhl8DQin1kXHfiC4SEW7zgPynRKbNyH2jEoVBtjDEdtShey
 LdxRJ8brreakDeZqhc5TyJ7lIeW1AgRw/y5mbvqW2ccfMxzdnS5rQdlm17D2UAaDyU23 cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qbu1udpy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 13:41:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6EA7C10002A;
 Thu,  4 May 2023 13:41:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F6612171F8;
 Thu,  4 May 2023 13:41:25 +0200 (CEST)
Received: from [10.201.20.178] (10.201.20.178) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 4 May
 2023 13:41:24 +0200
Message-ID: <29974337-d4a0-e295-ed0f-59f6f27576fe@foss.st.com>
Date: Thu, 4 May 2023 13:41:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Sean Nyekjaer <sean@geanix.com>, <jic23@kernel.org>,
 <alexandre.torgue@foss.st.com>, <nuno.sa@analog.com>, Fabrice GASNIER
 <fabrice.gasnier@st.com>
References: <20230503162029.3654093-1-sean@geanix.com>
 <20230503162029.3654093-2-sean@geanix.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20230503162029.3654093-2-sean@geanix.com>
X-Originating-IP: [10.201.20.178]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_08,2023-05-04_01,2023-02-09_01
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 2/2] iio: adc: stm32-adc: skip
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

Thanks for your update
You can add my: Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

BRs
Olivier

On 5/3/23 18:20, Sean Nyekjaer wrote:
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
> Changes since v1:
> - Ignore extra channel for timestamps in PIO mode
> - Use single ended count in channel creation (Thanks Olivier Moysan)
> 
> Changes since v2:
> - Avoid calling device_property_read_u32_array with num_se 0 (Thanks Olivier Moysan)
> 
>   drivers/iio/adc/stm32-adc.c | 42 ++++++++++++++++++++-----------------
>   1 file changed, 23 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 14524c1b5583..f7613efb870d 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -2038,6 +2038,7 @@ static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
>   	struct stm32_adc_diff_channel diff[STM32_ADC_CH_MAX];
>   	struct device *dev = &indio_dev->dev;
>   	u32 num_diff = adc->num_diff;
> +	int num_se = nchans - num_diff;
>   	int size = num_diff * sizeof(*diff) / sizeof(u32);
>   	int scan_index = 0, ret, i, c;
>   	u32 smp = 0, smps[STM32_ADC_CH_MAX], chans[STM32_ADC_CH_MAX];
> @@ -2064,29 +2065,32 @@ static int stm32_adc_legacy_chan_init(struct iio_dev *indio_dev,
>   			scan_index++;
>   		}
>   	}
> -
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
> +	if (num_se > 0) {
> +		ret = device_property_read_u32_array(dev, "st,adc-channels", chans, num_se);
> +		if (ret) {
> +			dev_err(&indio_dev->dev, "Failed to get st,adc-channels %d\n", ret);
> +			return ret;
>   		}
>   
> -		/* Channel can't be configured both as single-ended & diff */
> -		for (i = 0; i < num_diff; i++) {
> -			if (chans[c] == diff[i].vinp) {
> -				dev_err(&indio_dev->dev, "channel %d misconfigured\n",	chans[c]);
> +		for (c = 0; c < num_se; c++) {
> +			if (chans[c] >= adc_info->max_channels) {
> +				dev_err(&indio_dev->dev, "Invalid channel %d\n",
> +					chans[c]);
>   				return -EINVAL;
>   			}
> +
> +			/* Channel can't be configured both as single-ended & diff */
> +			for (i = 0; i < num_diff; i++) {
> +				if (chans[c] == diff[i].vinp) {
> +					dev_err(&indio_dev->dev, "channel %d misconfigured\n",
> +						chans[c]);
> +					return -EINVAL;
> +				}
> +			}
> +			stm32_adc_chan_init_one(indio_dev, &channels[scan_index],
> +						chans[c], 0, scan_index, false);
> +			scan_index++;
>   		}
> -		stm32_adc_chan_init_one(indio_dev, &channels[scan_index],
> -					chans[c], 0, scan_index, false);
> -		scan_index++;
>   	}
>   
>   	if (adc->nsmps > 0) {
> @@ -2307,7 +2311,7 @@ static int stm32_adc_chan_fw_init(struct iio_dev *indio_dev, bool timestamping)
>   
>   	if (legacy)
>   		ret = stm32_adc_legacy_chan_init(indio_dev, adc, channels,
> -						 num_channels);
> +						 timestamping ? num_channels - 1 : num_channels);
>   	else
>   		ret = stm32_adc_generic_chan_init(indio_dev, adc, channels);
>   	if (ret < 0)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
