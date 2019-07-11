Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C88653C8
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jul 2019 11:27:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19DB9D1AA57
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jul 2019 09:27:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D56C1D1AA55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2019 09:27:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6B9Qltj019115; Thu, 11 Jul 2019 11:27:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ozuHaFSyD+aZJ4haNAizK22rnLxhHA6aUOrq7v4rYzM=;
 b=BwUFcHBnsNVm3nBNpAUuttYo/2pyWXJoO+rXajtM4GNAlGhVGMdHqALX7vzbQnDTZm5Q
 aFtg9FJCiobvdsNyuS4/Tr/a160Goosfo41RUowkcDnUBF2ZVSe/oWcUn4+zgRT3xPyS
 QHSn0h2dlB6RhitmkIdM9nizn91BYHGlYGcTP4AFV1VZ+GBu7PPiiM2f6Bjlqs8bOmGK
 fhQZGbqpP6OcMYoSPja1MduluPvVF/S+XvofNbfbK3I+49Z4X0OyHCkqNON7EapvLHCD
 7OyZBcjV6Z/fL8+o62L1vLwyz3iSQo0M5GFQ12/vMmGjoivVQTuaZHmReke6Up4wkiXO 4A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tmvx04bpn-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 11 Jul 2019 11:27:34 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4779442;
 Thu, 11 Jul 2019 09:27:31 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 00F1C26BB;
 Thu, 11 Jul 2019 09:27:30 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 11 Jul
 2019 11:27:30 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 11 Jul 2019 11:27:30 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Olivier MOYSAN <olivier.moysan@st.com>, "a.hajda@samsung.com"
 <a.hajda@samsung.com>, "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@siol.net"
 <jernej.skrabec@siol.net>, "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Benjamin
 GAIGNARD" <benjamin.gaignard@st.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "jsarha@ti.com" <jsarha@ti.com>
Thread-Topic: [PATCH] drm/bridge: sii902x: add audio graph card support
Thread-Index: AQHVMXX5EUvh0puEZ0ygMEtXg5C9Kaa72VsAgAgKHwCAAS3HAA==
Date: Thu, 11 Jul 2019 09:27:30 +0000
Message-ID: <e29c1671-99fb-581d-bfb7-61ca2cfa8622@st.com>
References: <1562141052-26221-1-git-send-email-olivier.moysan@st.com>
 <7c17b3f2-afee-7548-7620-b67d11d09b24@st.com>
 <20190710152720.GR15868@phenom.ffwll.local>
In-Reply-To: <20190710152720.GR15868@phenom.ffwll.local>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <97E4496BC2C9B749B2D4DC4A340B3153@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-11_01:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH] drm/bridge: sii902x: add audio graph card
	support
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

Hi Daniel,


On 7/10/19 5:27 PM, Daniel Vetter wrote:
> On Fri, Jul 05, 2019 at 12:41:03PM +0000, Philippe CORNU wrote:
>> Hi Olivier,
>> and many thanks for your patch.
>> Good to have the audio graph card support, looks ok.
>> Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
> 
> Since you have drm-misc commit rights I'm assuming you're going to push
> this too. Correct?
> -Daniel

Regarding this patch in particular, there is still missing an acked-by 
from a "bridge" maintainer. Also it could be nice to wait for the 
reviewed-by from Jiry as it knows well this sii driver and sent recently 
good patches on it (already merged).

With that, Benjamin or I (or a bridge maintainer) can push this patch + 
the serie named "drm/bridge: sii902x: fix audio mclk management" as I 
think it is better to push this serie *before* this patch.

Thanks,
Philippe :-)


>> Philippe :-)
>>
>> On 7/3/19 10:04 AM, Olivier Moysan wrote:
>>> Implement get_dai_id callback of audio HDMI codec
>>> to support ASoC audio graph card.
>>> HDMI audio output has to be connected to sii902x port 3.
>>> get_dai_id callback maps this port to ASoC DAI index 0.
>>>
>>> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
>>> ---
>>>    drivers/gpu/drm/bridge/sii902x.c | 23 +++++++++++++++++++++++
>>>    1 file changed, 23 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
>>> index dd7aa466b280..daf9ef3cd817 100644
>>> --- a/drivers/gpu/drm/bridge/sii902x.c
>>> +++ b/drivers/gpu/drm/bridge/sii902x.c
>>> @@ -158,6 +158,8 @@
>>>    
>>>    #define SII902X_I2C_BUS_ACQUISITION_TIMEOUT_MS	500
>>>    
>>> +#define SII902X_AUDIO_PORT_INDEX		3
>>> +
>>>    struct sii902x {
>>>    	struct i2c_client *i2c;
>>>    	struct regmap *regmap;
>>> @@ -690,11 +692,32 @@ static int sii902x_audio_get_eld(struct device *dev, void *data,
>>>    	return 0;
>>>    }
>>>    
>>> +static int sii902x_audio_get_dai_id(struct snd_soc_component *component,
>>> +				    struct device_node *endpoint)
>>> +{
>>> +	struct of_endpoint of_ep;
>>> +	int ret;
>>> +
>>> +	ret = of_graph_parse_endpoint(endpoint, &of_ep);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	/*
>>> +	 * HDMI sound should be located at reg = <3>
>>> +	 * Return expected DAI index 0.
>>> +	 */
>>> +	if (of_ep.port == SII902X_AUDIO_PORT_INDEX)
>>> +		return 0;
>>> +
>>> +	return -EINVAL;
>>> +}
>>> +
>>>    static const struct hdmi_codec_ops sii902x_audio_codec_ops = {
>>>    	.hw_params = sii902x_audio_hw_params,
>>>    	.audio_shutdown = sii902x_audio_shutdown,
>>>    	.digital_mute = sii902x_audio_digital_mute,
>>>    	.get_eld = sii902x_audio_get_eld,
>>> +	.get_dai_id = sii902x_audio_get_dai_id,
>>>    };
>>>    
>>>    static int sii902x_audio_codec_init(struct sii902x *sii902x,
>>>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
