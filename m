Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CF7343DD4
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Mar 2021 11:29:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB506C57B60;
	Mon, 22 Mar 2021 10:29:13 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51D69C5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Mar 2021 10:29:10 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F3rMR6z02z1s1Jn;
 Mon, 22 Mar 2021 11:29:07 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F3rMR136vz1qv9k;
 Mon, 22 Mar 2021 11:29:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id LMI6HZNx46EO; Mon, 22 Mar 2021 11:29:05 +0100 (CET)
X-Auth-Info: OdWZttE73T3wEDb4s/kUALOAD3JZlDfgmD+lEgdjvh0=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 22 Mar 2021 11:29:05 +0100 (CET)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201224061832.92010-1-marex@denx.de>
 <YFfvjyllBa/tqTqI@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <4372d1cd-ffdb-e545-7262-d1ad1a649770@denx.de>
Date: Mon, 22 Mar 2021 11:29:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFfvjyllBa/tqTqI@pendragon.ideasonboard.com>
Content-Language: en-US
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 Yannick Fertre <yannick.fertre@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [Linux-stm32] [PATCH V2] drm/bridge: lvds-codec: Add support
 for pixel data sampling edge select
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

On 3/22/21 2:14 AM, Laurent Pinchart wrote:
> Hi Marek,

Hi,

[...]

>> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>> index e5e3c72630cf..399a6528780a 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>> @@ -74,6 +74,13 @@ properties:
>>   
>>       additionalProperties: false
>>   
>> +  pixelclk-active:
>> +    description: |
>> +      Data sampling on rising or falling edge.
>> +      Use 0 to sample pixel data on rising edge and
>> +      Use 1 to sample pixel data on falling edge and
>> +    enum: [0, 1]
> 
> The idea is good, but instead of adding a custom property, how about
> reusing the pclk-sample property defined in
> ../../media/video-interfaces.yaml ?

Repeating myself from V1 discussion ... Either is fine by me, but I 
think pixelclk-active, which comes from panel-timings.yaml is closer to 
the video than multimedia bindings.

> The property is only valid for encoders, so I would at least mention
> that in the description, or, better, handle this based on the compatible
> string to allow validation.

How does that work in the Yaml file ?

>> +
>>     powerdown-gpios:
>>       description:
>>         The GPIO used to control the power down line of this device.
>> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
>> index dcf579a4cf83..cab81ccd895d 100644
>> --- a/drivers/gpu/drm/bridge/lvds-codec.c
>> +++ b/drivers/gpu/drm/bridge/lvds-codec.c

[...]

>> @@ -126,6 +146,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
>>   	 */
>>   	lvds_codec->bridge.of_node = dev->of_node;
>>   	lvds_codec->bridge.funcs = &funcs;
>> +	lvds_codec->bridge.timings = &lvds_codec->timings;
>>   	drm_bridge_add(&lvds_codec->bridge);
>>   
>>   	platform_set_drvdata(pdev, lvds_codec);
>> @@ -142,19 +163,20 @@ static int lvds_codec_remove(struct platform_device *pdev)
>>   	return 0;
>>   }
>>   
>> +static const struct lvds_codec_data decoder_data = {
>> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
>> +	.is_encoder = false,
> 
> The two fields are a bit redundant, as the decoder is always
> LVDS-to-DPI, and the encoder DPI-to-LVDS. I don't mind too much, but
> maybe we could drop the connector_type field, and derive the connector
> type from is_encoder ?

Or the other way around instead ? That is, if the connector_type is 
LVDS, then it is encoder , otherwise its decoder ?

> One may then say that we could drop the lvds_codec_data structure as it
> contains a single field, but I foresee a need to have device-specific
> timings at some point, so I think it's a good addition.

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
