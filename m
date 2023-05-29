Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF04714776
	for <lists+linux-stm32@lfdr.de>; Mon, 29 May 2023 11:54:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D795EC6A614;
	Mon, 29 May 2023 09:54:52 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69F5EC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 May 2023 09:54:51 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B384A84735;
 Mon, 29 May 2023 11:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685354090;
 bh=db2/0jhEQ1Ay6cgSGxPYGzJJhbyarHWQB1FeiHON+yU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=stg3lphYIBiYglR9o8zo1bU1Q7StF5VBbmN8WKFt79S6EQGJuTazU/lu3n/aJYRvS
 PKIGEsGb9mfeEX9x2Pc2KCL3jqpFCHAVappvtfshIXB0EstlL+LJXjeNvb0HqPmqlt
 h/MaLgb04lJi2sa2MHFfkutZFTY5u8lxUFRiBkOOJDL3oPdttnYlzQn3RN+p/9TxyY
 XYpoyVF8Nrywlul9WwR13w2bFIGuCgZ0mbIHHR17PbOy/vT62PY9Xi/KlXxWi5Az7g
 53uYhc+ILRQ6ZJ8vkorUAVPvN265xyqt0tjRzBY8iNQxK6guq+UFOQjT7RM13Nd+cN
 UbQELe2JZdplQ==
Message-ID: <948ad9a2-f346-c42f-7b1f-47edda19a823@denx.de>
Date: Mon, 29 May 2023 11:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
References: <20230517143542.284029-1-raphael.gallais-pou@foss.st.com>
 <20230517143542.284029-4-raphael.gallais-pou@foss.st.com>
 <f64de05b-8854-4345-80c2-f424968defdc@denx.de>
 <e963370c-7018-243a-712d-62ca8463bfd8@foss.st.com>
 <5f201903-17cb-5054-763c-f03b1066db1d@denx.de>
 <32fafa74-8964-c9cf-f95b-f2cd084f46c6@foss.st.com>
 <b23ddf9e-6bba-68df-cf28-cc0e2c4218ac@denx.de>
 <cc6a1064-8b53-c63d-9592-92748b67639a@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <cc6a1064-8b53-c63d-9592-92748b67639a@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] ARM: dts: stm32: fix several DT
 warnings on stm32mp15
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

On 5/29/23 10:07, Raphael Gallais-Pou wrote:

Hi,

>>>> I think if you retain the stm32mp151.dtsi &ltdc { port { #address-cells = <1>;
>>>> #size-cells = <0>; }; }; part, then you wouldn't be getting any warnings
>>>> regarding LTDC , and you wouldn't have to remove the unit-address from
>>>> endpoint@0 .
>>>>
>>>> btw. I do use both endpoint@0/endpoint@1 in Avenger96 DTOs, but those are not
>>>> submitted yet, I have to clean them up a bit more first.
>>>>
>>>>> One way to do it would be to make the endpoint@0 go down in the device-tree
>>>>> with
>>>>> its dependencies, so that both endpoints are the same level without generating
>>>>> noise.
>>>>
>>>> I'm afraid I really don't quite understand which warning you're referring to.
>>>> Can you please share that warning and ideally how to trigger it (the
>>>> command-line incantation) ?
>>>
>>> Using '$ make dtbs W=1', you can observe several of the followings:
>>>
>>> arch/arm/boot/dts/stm32mp151.dtsi:1533.9-1536.6: Warning
>>> (avoid_unnecessary_addr_size): /soc/display-controller@5a001000/port:
>>> unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>>> arch/arm/boot/dts/stm32mp151.dtsi:1533.9-1536.6: Warning (graph_child_address):
>>> /soc/display-controller@5a001000/port: graph node has single child node
>>> 'endpoint@0', #address-cells/#size-cells are not necessary
>>>
>>> This &ltdc { port { #address-cells = <1>; #size-cells = <0>; }; }; part is
>>> actually annoying. This is because there is several device-trees that only got
>>> one endpoint, and some other that includes two.
>>>
>>> For instance: stm32mp15xx-dhcor-avenger96.dtsi vs stm32mp157c-dk2.dts.
>>>
>>> I would like to remove to root part of address/size field and let only the lower
>>> device-trees with with multiple endpoints handle their own fields. I hope this
>>> explains a bit better my process.
>>
>> After thinking about this some more, and digging through LTDC driver, and
>> testing on EV1, I think dropping the LTDC node endpoint@N and reg=<N>
>> altogether and just using port/endpoint (singular) is fine.
>>
>> You might want to split the DSI node specific changes and the LTDC node
>> specific changes into separate patches (LTDC specific change like you did in
>> 1/3).
> 
> Yes, I prepared a new serie with that split, to that it is better to read and
> review.

Thank you !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
