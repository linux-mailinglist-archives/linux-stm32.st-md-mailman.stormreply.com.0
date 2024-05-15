Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E92518C60E0
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2024 08:41:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C9B0C6B47A;
	Wed, 15 May 2024 06:41:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 145A0C5E2D1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2024 06:41:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F056TZ012890;
 Wed, 15 May 2024 08:40:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=grZoncYN/Ex6YBE6MWMsZg3hoMkBe2yN4z13XwIKYPs=; b=mB
 AkrGGBA18gIrlZuvQmXNp+jkBFd/Ny1YXK83q03Q/JTRfAIhLZF24O0vxgOAthnz
 YpgtayqGlszvQD0STawOg0Hs04I2Vzo0F0iA7jnyXrQsJ9fnHXT8yJD6FLzwscgy
 GbNrcFpyE4Xm/XCLSWS/vlGQFi1JbTVcEhvm4ukk0HZPoiF9QwKywqdlQk+SGV6y
 IQuC9c8UrCuCcLh0Z+teECj+Ntxa89V4xGcDuiHfxzfSiTOM5jRethunhQ9CV0Xo
 DOb8x8dHxrT7QzrPjjPAhnOh+suDdQibNMgTBh9k9JpUQ1UkpX0LRR49ePaFAInK
 4lDJGc4oC67xjHGoIFJw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y1yjbe0u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 May 2024 08:40:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C5C5740044;
 Wed, 15 May 2024 08:40:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52EA920DD93;
 Wed, 15 May 2024 08:39:51 +0200 (CEST)
Received: from [10.252.19.151] (10.252.19.151) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 15 May
 2024 08:39:50 +0200
Message-ID: <b58c9073-02c6-4b5e-9082-fb11f388842d@foss.st.com>
Date: Wed, 15 May 2024 08:39:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sean Nyekjaer <sean@geanix.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Robert Foss
 <rfoss@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>
References: <20240322104732.2327060-1-sean@geanix.com>
 <lkrxoqhcitmvjvzslhx6mrdjaa6lpxtpmdjt7wwollm6z4h65q@jk5esjje6ppy>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <lkrxoqhcitmvjvzslhx6mrdjaa6lpxtpmdjt7wwollm6z4h65q@jk5esjje6ppy>
X-Originating-IP: [10.252.19.151]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_02,2024-05-14_01,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: dsi: relax mode_valid clock
	tolerance
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

thanks for your patch.

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>

I think that a helper could be useful in simplifying this part.
This might be reworked when a new helper will be implemented.

Best regards


On 4/22/24 16:05, Sean Nyekjaer wrote:
> On Fri, Mar 22, 2024 at 11:47:31AM +0100, Sean Nyekjaer wrote:
>> When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
>> to reguire the requested and the actual px clock to be within
>> 50Hz. A typical LVDS display requires the px clock to be within +-10%.
>>
>> In case for HDMI .5% tolerance is required.
>>
>> Fixes: e01356d18273 ("drm/stm: dsi: provide the implementation of mode_valid()")
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>> ---
> Any feedback on this?
>
>>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
>> index d5f8c923d7bc..97936b0ef702 100644
>> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
>> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
>> @@ -322,8 +322,6 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
>>   	return 0;
>>   }
>>   
>> -#define CLK_TOLERANCE_HZ 50
>> -
>>   static enum drm_mode_status
>>   dw_mipi_dsi_stm_mode_valid(void *priv_data,
>>   			   const struct drm_display_mode *mode,
>> @@ -375,9 +373,10 @@ dw_mipi_dsi_stm_mode_valid(void *priv_data,
>>   		/*
>>   		 * Filter modes according to the clock value, particularly useful for
>>   		 * hdmi modes that require precise pixel clocks.
>> +		 * Check that px_clock is within .5% tolerance.
>>   		 */
>> -		if (px_clock_hz < target_px_clock_hz - CLK_TOLERANCE_HZ ||
>> -		    px_clock_hz > target_px_clock_hz + CLK_TOLERANCE_HZ)
>> +		if (px_clock_hz < mult_frac(target_px_clock_hz, 995, 1000) ||
>> +		    px_clock_hz > mult_frac(target_px_clock_hz, 1005, 1000))
>>   			return MODE_CLOCK_RANGE;
>>   
>>   		/* sync packets are codes as DSI short packets (4 bytes) */
>> -- 
>> 2.44.0
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
