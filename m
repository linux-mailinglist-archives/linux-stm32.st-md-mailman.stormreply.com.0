Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A0B60603
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2019 14:37:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C4C6C35E01
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2019 12:37:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F8D4C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 12:37:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65CWUBO015894; Fri, 5 Jul 2019 14:36:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nuMS6p+p3kSwZitSa3B2HZ8uP0JDZ2NWsyUgLamNnd0=;
 b=NEVk99+KVuuwQZPkG0kmtuAaoM+1yQYeq2y07wKKVR5WjnQccS0/1HiOmmHp73HOR9N5
 14Gq/eo3rYJLA6vGhwt0M0pufNUc3aE6mpbN8pZfVkbKPNWLoFx5Ym+pjNbBVmUDgUFz
 gchrebzYFkXdBgiX5AVCz3bEW5mCajFgor1PLMi960cttvIjiX/2ZCM6hzqrN0f66p3G
 mOAUyy30RfXCWGaVmAJLuUYcWKweyTVnWHc9ya1pxJutg7ydvnPwlRrHNkXybc01Qbiw
 znhM9q4rEBN9AylBWAWk9SpdUZ6y6woQN1iqTJ39KqDWhiNLO9ENi24xJvCTGXaF3Mfi Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdxvjjgj1-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 14:36:13 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C90531;
 Fri,  5 Jul 2019 12:36:12 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4862E2C7F;
 Fri,  5 Jul 2019 12:36:12 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 5 Jul
 2019 14:36:11 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 5 Jul 2019 14:36:11 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Olivier MOYSAN <olivier.moysan@st.com>, "a.hajda@samsung.com"
 <a.hajda@samsung.com>, "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@siol.net"
 <jernej.skrabec@siol.net>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "jsarha@ti.com" <jsarha@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Thread-Topic: [PATCH 3/3] drm/bridge: sii902x: make audio mclk optional
Thread-Index: AQHVMO2M8CUkPHajiUCKtjETQ0unPqa72RGA
Date: Fri, 5 Jul 2019 12:36:11 +0000
Message-ID: <2828a8ca-6d25-fe49-f97a-cfd86e5d5fac@st.com>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
 <1562082426-14876-4-git-send-email-olivier.moysan@st.com>
In-Reply-To: <1562082426-14876-4-git-send-email-olivier.moysan@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <94B1862D7883AE44876E6AC9CEA4D8CD@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH 3/3] drm/bridge: sii902x: make audio mclk
	optional
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

Hi Olivier,
and many thanks for your patch.

Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
Philippe :-)

On 7/2/19 5:47 PM, Olivier Moysan wrote:
> The master clock on i2s bus is not mandatory,
> as sii902X internal PLL can be used instead.
> Make use of mclk optional.
> 
> Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>   drivers/gpu/drm/bridge/sii902x.c | 39 +++++++++++++++++++++++----------------
>   1 file changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 36acc256e67e..a08bd9fdc046 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -562,19 +562,21 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
>   		}
>   	}
>   
> -	ret = clk_prepare_enable(sii902x->audio.mclk);
> -	if (ret) {
> -		dev_err(dev, "Enabling mclk failed: %d\n", ret);
> -		return ret;
> -	}
> +	if (sii902x->audio.mclk) {
> +		ret = clk_prepare_enable(sii902x->audio.mclk);
> +		if (ret) {
> +			dev_err(dev, "Enabling mclk failed: %d\n", ret);
> +			return ret;
> +		}
>   
> -	mclk_rate = clk_get_rate(sii902x->audio.mclk);
> +		mclk_rate = clk_get_rate(sii902x->audio.mclk);
>   
> -	ret = sii902x_select_mclk_div(&i2s_config_reg, params->sample_rate,
> -				      mclk_rate);
> -	if (mclk_rate != ret * params->sample_rate)
> -		dev_dbg(dev, "Inaccurate reference clock (%ld/%d != %u)\n",
> -			mclk_rate, ret, params->sample_rate);
> +		ret = sii902x_select_mclk_div(&i2s_config_reg,
> +					      params->sample_rate, mclk_rate);
> +		if (mclk_rate != ret * params->sample_rate)
> +			dev_dbg(dev, "Inaccurate reference clock (%ld/%d != %u)\n",
> +				mclk_rate, ret, params->sample_rate);
> +	}
>   
>   	mutex_lock(&sii902x->mutex);
>   
> @@ -640,7 +642,8 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
>   	mutex_unlock(&sii902x->mutex);
>   
>   	if (ret) {
> -		clk_disable_unprepare(sii902x->audio.mclk);
> +		if (sii902x->audio.mclk)
> +			clk_disable_unprepare(sii902x->audio.mclk);
>   		dev_err(dev, "%s: hdmi audio enable failed: %d\n", __func__,
>   			ret);
>   	}
> @@ -659,7 +662,8 @@ static void sii902x_audio_shutdown(struct device *dev, void *data)
>   
>   	mutex_unlock(&sii902x->mutex);
>   
> -	clk_disable_unprepare(sii902x->audio.mclk);
> +	if (sii902x->audio.mclk)
> +		clk_disable_unprepare(sii902x->audio.mclk);
>   }
>   
>   int sii902x_audio_digital_mute(struct device *dev, void *data, bool enable)
> @@ -752,9 +756,12 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
>   
>   	sii902x->audio.mclk = devm_clk_get(dev, "mclk");
>   	if (IS_ERR(sii902x->audio.mclk)) {
> -		dev_err(dev, "%s: No clock (audio mclk) found: %ld\n",
> -			__func__, PTR_ERR(sii902x->audio.mclk));
> -		return 0;
> +		if (PTR_ERR(sii902x->audio.mclk) != -ENOENT) {
> +			dev_err(dev, "%s: No clock (audio mclk) found: %ld\n",
> +				__func__, PTR_ERR(sii902x->audio.mclk));
> +			return PTR_ERR(sii902x->audio.mclk);
> +		}
> +		sii902x->audio.mclk = NULL;
>   	}
>   
>   	sii902x->audio.pdev = platform_device_register_data(
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
