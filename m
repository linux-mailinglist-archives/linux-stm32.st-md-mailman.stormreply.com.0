Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB8A605DF
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2019 14:25:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18809C35E01
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2019 12:25:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 640EFC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 12:25:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65CNqYQ030318; Fri, 5 Jul 2019 14:24:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=EFphJe1CVVP/nzRxA8x6BhXKv/0bjU3/TiVkvgOFPek=;
 b=BYLU4XNoWdTNPUWd8ceyUbCwUOTaR3Zl4KnD/DGwy4jIGIeLB91fgSU0JmDTNPxB+m8B
 snlkGg5ZlGmvMkbPmJtFJx1IBbJSAsrxEj8p2sFSRZ/55OFHIdcJn55lp4s138lzPju/
 2uKvrqJyrQP7KyltAKDUlXNckkyChpMBpj2exHAtp56yQ6Xe0YEzz3TMiVVDFV6yf+qK
 k4aCeQ/5gDkYiLxkHyPIu3B2qN1jxWF9hWyWQsPcWDqaTiLt5lzuSXvfC2uHYySkX71q
 yoaDFjY2zrcL7+8I9p+xMmvyzjquq0X4bq+uO99TSuQ+S57jzx1ZKE6MeT+G7r4ZXl4C nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdw4ajaab-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 14:24:14 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB07734;
 Fri,  5 Jul 2019 12:24:02 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72FD32C47;
 Fri,  5 Jul 2019 12:24:02 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 5 Jul
 2019 14:24:01 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 5 Jul 2019 14:24:02 +0200
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
Thread-Topic: [PATCH 1/3] drm/bridge: sii902x: fix missing reference to mclk
 clock
Thread-Index: AQHVMO2KR4mZoMb3BkGaiUB8X+1y2qa71auA
Date: Fri, 5 Jul 2019 12:24:02 +0000
Message-ID: <39d9bf8f-a906-7f69-582d-b2996e600c0f@st.com>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
 <1562082426-14876-2-git-send-email-olivier.moysan@st.com>
In-Reply-To: <1562082426-14876-2-git-send-email-olivier.moysan@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <DDC1C03DC92D944FA408C2A9B6DAE01F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH 1/3] drm/bridge: sii902x: fix missing
 reference to mclk clock
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
I do not see how audio could work without your patch, so:
Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
Philippe :-)

On 7/2/19 5:47 PM, Olivier Moysan wrote:
> Add devm_clk_get call to retrieve reference to master clock.
> 
> Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>   drivers/gpu/drm/bridge/sii902x.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index dd7aa466b280..36acc256e67e 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -750,6 +750,7 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
>   		sii902x->audio.i2s_fifo_sequence[i] |= audio_fifo_id[i] |
>   			i2s_lane_id[lanes[i]] |	SII902X_TPI_I2S_FIFO_ENABLE;
>   
> +	sii902x->audio.mclk = devm_clk_get(dev, "mclk");
>   	if (IS_ERR(sii902x->audio.mclk)) {
>   		dev_err(dev, "%s: No clock (audio mclk) found: %ld\n",
>   			__func__, PTR_ERR(sii902x->audio.mclk));
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
