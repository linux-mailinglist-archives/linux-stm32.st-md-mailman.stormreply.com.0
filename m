Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 536246A91E4
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Mar 2023 08:47:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17012C6A604;
	Fri,  3 Mar 2023 07:47:03 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEB5DC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Mar 2023 07:47:01 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id cy23so6709611edb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Mar 2023 23:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677829621;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Omx5oHf0JnIS1Sef0sR/U5gX7Qg/sqJ2a4muWjko1WQ=;
 b=ozc1VrHETnrLhQtBcnplwt73aiOVOejbuXeswiFjg0HWLRLQOy3gEvhXlzf/FARwmO
 FvUHYQzrNvPMqc2elIVOaZWMmO+L7M9ehaPkcOuXD5zXJ52ZUNogyOQjHr761hsQI8AD
 QrCwlblgvnyRS6ffpq0NUAlQRp9redAtRmyosagwbE+t1uoCzcqh0awzf/NflocnaBv3
 QYhXEIzN2IY4IoRgWCmxr5fpJj8v70caDmMt0pmeDuesVix00uyIyV+EqdCnwIbmvkwE
 a3bmffeIu9eDx7rZAeO4CSuRRWikb8VMaqwpypJ6OmHT+NjNf6gIna6tszLa1z5BUZzg
 ELeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677829621;
 h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Omx5oHf0JnIS1Sef0sR/U5gX7Qg/sqJ2a4muWjko1WQ=;
 b=HksS0JcXfw292aEJ1xKAB89raW6ZL4r10O8QOsx2lGFHDS2A6INRQZZb1vjWUEQudJ
 U6Xupkr2awPMuSEuQKoPjfTqmtdT9sfHO7aXetSALR4p4rS7JEilQim/dGjXHADRbstv
 gtxBpz7qjmoOIdyAZumjYbrdDMnML+5c4AIlsSqVTsz2irq8meIJFb+9UYQFdUeUMQj5
 uegrWt5JzDBWPo1MNvogPFotckSfStj/lo1zftjCmpEfyoQPl2ZC96oC+68AqpOqmxaQ
 z9PlK9NO/3CkX7seIIe9OI0haiapm6XCPhk1uws+A70sh/y7rxWlKl6h/RR5YfZPbUlt
 WuHA==
X-Gm-Message-State: AO0yUKUiPRWOIu3gS221eA7dQS+ToQ97pFwW3iKTQjAZFZjaweFOAXgU
 yat5f2kuBCMTz0rK0OlMlns=
X-Google-Smtp-Source: AK7set9P2tOy3fmUEkyPvahxzEgIJcBPccB35rreiCFEC2kbf7LU1iSxpNhOStPDkAOGDwzPoyYmWA==
X-Received: by 2002:aa7:d6c6:0:b0:4af:59c0:d303 with SMTP id
 x6-20020aa7d6c6000000b004af59c0d303mr1014386edr.26.1677829620883; 
 Thu, 02 Mar 2023 23:47:00 -0800 (PST)
Received: from [10.33.2.246] ([95.183.227.97])
 by smtp.gmail.com with ESMTPSA id
 19-20020a508e13000000b004acbdf23cd2sm820955edw.29.2023.03.02.23.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 23:47:00 -0800 (PST)
Date: Fri, 03 Mar 2023 10:46:49 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-Id: <1MPXQR.LIW1MS7NJON23@gmail.com>
In-Reply-To: <0969ff46-3fba-f679-7943-52da7528185a@collabora.com>
References: <20230302141234.169985-1-y.oudjana@protonmail.com>
 <0969ff46-3fba-f679-7943-52da7528185a@collabora.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: display: mediatek:
 Compatible list cleanup
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


On Thu, Mar 2 2023 at 05:08:30 PM +01:00:00, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 02/03/23 15:12, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
>> Several DT bindings of MediaTek display blocks make unnecessary use 
>> of
>> "oneOf" and "items". Remove them and replace them with enums where
>> necessary.
>> 
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>> Changes since v1:
>> - Leave enums with 1 element as they are.
>> 
>>   .../bindings/display/mediatek/mediatek,ccorr.yaml   |  7 +++----
>>   .../bindings/display/mediatek/mediatek,color.yaml   | 10 ++++------
>>   .../bindings/display/mediatek/mediatek,dither.yaml  |  3 +--
>>   .../bindings/display/mediatek/mediatek,dsc.yaml     |  4 +---
>>   .../bindings/display/mediatek/mediatek,gamma.yaml   |  7 +++----
>>   .../bindings/display/mediatek/mediatek,merge.yaml   |  8 +++-----
>>   .../bindings/display/mediatek/mediatek,od.yaml      |  8 +++-----
>>   .../bindings/display/mediatek/mediatek,ovl-2l.yaml  |  7 +++----
>>   .../bindings/display/mediatek/mediatek,ovl.yaml     | 13 
>> +++++--------
>>   .../display/mediatek/mediatek,postmask.yaml         |  3 +--
>>   .../bindings/display/mediatek/mediatek,rdma.yaml    | 13 
>> +++++--------
>>   .../bindings/display/mediatek/mediatek,split.yaml   |  4 +---
>>   .../bindings/display/mediatek/mediatek,ufoe.yaml    |  4 +---
>>   .../bindings/display/mediatek/mediatek,wdma.yaml    |  4 +---
>>   14 files changed, 35 insertions(+), 60 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
>> index b04820c95b22..dc22bd522523 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
>> @@ -21,10 +21,9 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt8183-disp-ccorr
>> -      - items:
>> -          - const: mediatek,mt8192-disp-ccorr
>> +      - enum:
>> +          - mediatek,mt8183-disp-ccorr
>> +          - mediatek,mt8192-disp-ccorr
> 
> This change is ok.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt8188-disp-ccorr
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> index 62306c88f485..d0ea77fc4b06 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> @@ -22,12 +22,10 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt2701-disp-color
>> -      - items:
>> -          - const: mediatek,mt8167-disp-color
>> -      - items:
>> -          - const: mediatek,mt8173-disp-color
>> +      - enum:
>> +          - mediatek,mt2701-disp-color
>> +          - mediatek,mt8167-disp-color
>> +          - mediatek,mt8173-disp-color
> 
> OK.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt7623-disp-color
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
>> index 5c7445c174e5..9d74de63fe63 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
>> @@ -22,8 +22,7 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt8183-disp-dither
>> +      - const: mediatek,mt8183-disp-dither
> 
> OK.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt8186-disp-dither
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
>> index 49248864514b..37bf6bf4a1ab 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
>> @@ -19,9 +19,7 @@ description: |
>>     properties:
>>     compatible:
>> -    oneOf:
>> -      - items:
>> -          - const: mediatek,mt8195-disp-dsc
>> +    const: mediatek,mt8195-disp-dsc
> 
> This will grow, and you'll get devicetree declaring something like:
> 
> compatible = "mediatek,(different-new-chip)-disp-dsc";
> 
> and
> 
> compatible = "mediatek,(current-chip)-disp-dsc", 
> "mediatek,mt8195-disp-dsc";
> 
> Note: Some smartphone SoCs (Dimensity series) do have the same 
> disp-dsc as
> the Chromebook variant MT8195! :-)
> 
>>       reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
>> index a5c6a91fac71..6c2be9d6840b 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
>> @@ -21,10 +21,9 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt8173-disp-gamma
>> -      - items:
>> -          - const: mediatek,mt8183-disp-gamma
>> +      - enum:
>> +          - mediatek,mt8173-disp-gamma
>> +          - mediatek,mt8183-disp-gamma
> 
> This change is ok.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt8186-disp-gamma
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
>> index 69ba75777dac..c474ee6fa05b 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
>> @@ -20,11 +20,9 @@ description: |
>>     properties:
>>     compatible:
>> -    oneOf:
>> -      - items:
>> -          - const: mediatek,mt8173-disp-merge
>> -      - items:
>> -          - const: mediatek,mt8195-disp-merge
>> +    enum:
>> +      - mediatek,mt8173-disp-merge
>> +      - mediatek,mt8195-disp-merge
> 
> I'm mostly sure that you (yes, you, Yassine) will sooner or later 
> write a
> devicetree node containing the following compatible string on merge0:
> 
> compatible = "mediatek,mt6735-disp-merge", 
> "mediatek,mt8173-disp-merge";
> 
> Am I wrong? :-)

Actually MT6735 doesn't have this block so no, I won't be doing that :)

> 
> In that case, that `oneOf:` will have to return back to this file, so 
> it's
> not worth removing it.
> 
>>       reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
>> index 853fcb9db2be..7e6bbf8b5c60 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
>> @@ -20,11 +20,9 @@ description: |
>>     properties:
>>     compatible:
>> -    oneOf:
>> -      - items:
>> -          - const: mediatek,mt2712-disp-od
>> -      - items:
>> -          - const: mediatek,mt8173-disp-od
>> +    enum:
>> +      - mediatek,mt2712-disp-od
>> +      - mediatek,mt8173-disp-od
>> 
> Same story with this one...

It doesn't have this one either.

> 
>>     reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
>> index 4e94f4e947ad..c7dd0ef02dcf 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
>> @@ -21,10 +21,9 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt8183-disp-ovl-2l
>> -      - items:
>> -          - const: mediatek,mt8192-disp-ovl-2l
>> +      - enum:
>> +          - mediatek,mt8183-disp-ovl-2l
>> +          - mediatek,mt8192-disp-ovl-2l
> 
> This change is ok.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt8186-disp-ovl-2l
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
>> index 065e526f950e..92e320d54ba2 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
>> @@ -21,14 +21,11 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt2701-disp-ovl
>> -      - items:
>> -          - const: mediatek,mt8173-disp-ovl
>> -      - items:
>> -          - const: mediatek,mt8183-disp-ovl
>> -      - items:
>> -          - const: mediatek,mt8192-disp-ovl
>> +      - enum:
>> +          - mediatek,mt2701-disp-ovl
>> +          - mediatek,mt8173-disp-ovl
>> +          - mediatek,mt8183-disp-ovl
>> +          - mediatek,mt8192-disp-ovl
> 
> This is ok too.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt7623-disp-ovl
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
>> index 27de64495401..12ec410bb921 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
>> @@ -21,8 +21,7 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt8192-disp-postmask
>> +      - const: mediatek,mt8192-disp-postmask
> 
> Should be fine as well.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt8186-disp-postmask
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
>> index 3ade2ece3fed..42059efad45d 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
>> @@ -23,14 +23,11 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - items:
>> -          - const: mediatek,mt2701-disp-rdma
>> -      - items:
>> -          - const: mediatek,mt8173-disp-rdma
>> -      - items:
>> -          - const: mediatek,mt8183-disp-rdma
>> -      - items:
>> -          - const: mediatek,mt8195-disp-rdma
>> +      - enum:
>> +          - mediatek,mt2701-disp-rdma
>> +          - mediatek,mt8173-disp-rdma
>> +          - mediatek,mt8183-disp-rdma
>> +          - mediatek,mt8195-disp-rdma
> 
> OK.
> 
>>         - items:
>>             - enum:
>>                 - mediatek,mt8188-disp-rdma
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
>> index 35ace1f322e8..54b7b0531144 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
>> @@ -20,9 +20,7 @@ description: |
>>     properties:
>>     compatible:
>> -    oneOf:
>> -      - items:
>> -          - const: mediatek,mt8173-disp-split
>> +    const: mediatek,mt8173-disp-split
>> 
> 
> compatible = "mediatek,mt6795-disp-split", 
> "mediatek,mt8173-disp-split";
> 
> I have exactly that in my local devicetree for Xperia M5 (not 
> upstream yet) so
> no, I wouldn't do that :-)

Would only removing "items" and keeping "oneOf" be alright then?

> 
>>     reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
>> index b8bb135fe96b..87523b45a210 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
>> @@ -21,9 +21,7 @@ description: |
>>     properties:
>>     compatible:
>> -    oneOf:
>> -      - items:
>> -          - const: mediatek,mt8173-disp-ufoe
>> +    const: mediatek,mt8173-disp-ufoe
>> 
> Same, and I think UFOE is present on your MT6735 as well.

It isn't. In fact its input and output muxes are present, but the UFOE 
block itself
is absent. My guess is Mediatek reused the dispsys skeleton in several 
SoCs and
plugged in processing blocks as needed. Removing the muxes would've 
probably required
additional work to reroute the connections between blocks before and 
after UFOE, so
they just kept the muxes untouched.

BTW, this patch comes in preparation for adding bindings for almost all 
MT6735 display
blocks, so I haven't gotten rid of something that I'd need later. 
Although I didn't reuse
MT8173 and MT8167 compatibles (the 2 SoCs functionally closest to 
MT6735 in terms of
display) but instead added new MT6735 compatibles to the drivers (none 
of this is sent yet
of course).

> 
>>     reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
>> index 7d7cc1ab526b..52f233fe1c0f 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
>> @@ -20,9 +20,7 @@ description: |
>>     properties:
>>     compatible:
>> -    oneOf:
>> -      - items:
>> -          - const: mediatek,mt8173-disp-wdma
>> +    const: mediatek,mt8173-disp-wdma
>> 
> This is present on all MediaTek SoCs - literally. The issue is that 
> the driver
> currently does not support command mode panels for real, so this 
> binding is...
> ...well, somehow in forgotten-land...

What does it have to do with command mode panels? I thought it was used 
for off-screen
image processing. Or was that MDP WDMA?

Also with all the command mode stuff the driver currently has, it 
doesn't properly support
command mode panels? I mean it even switches to command mode to send 
configuration commands
to video mode panels rather than using VM_CMD (something that took me a 
while to get right
on MT6735, because its DSI controller acts funny when modes are 
switched frequently), so I
imagined it had better support for command mode.

> 
> I would hope that command mode panels get implemented 
> soon(er-than-later), but
> I'll leave the choice to you and Krzysztof - I'm only providing the 
> information
> here. :-)
> 
>>     reg:
>>       maxItems: 1
> 
> Thanks for the effort!
> 
> Cheers,
> Angelo
> 

Anyway, I don't mind dropping the changes you NACKed, especially since 
they don't
affect me at all, but I do want to know the motive behind discouraging 
simplifying
the bindings now and adding these things back if needed in the future.

Thanks,
Yassine



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
