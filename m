Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 267CA6A91D3
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Mar 2023 08:42:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA08FC6A604;
	Fri,  3 Mar 2023 07:42:42 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D975DC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Mar 2023 07:42:41 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id ay14so3130626edb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Mar 2023 23:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677829361;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6NaYC7Z7KE3/xDS+ojWZnShCIrXPLH1EZcxegpj4uXo=;
 b=vRw8wJ2r4i7Z3/3FQ0GALVawwqYtGc5IZ3nkCeTKZwVvCJ93pC8TOrhqdS/aiSDqGa
 MDEEySc4FT8jD+H4FeVR1ZU1fmdhh5Ezx6susvVz5f0LEC9MWQSNzts23IizlW6LDRDk
 uAibihwPv3kGtZbFMyuYBpmULGzMsY5BNim0FTLQkSJY0q7VQ8TYL76kG7xy5r5U0C9+
 3JK+o8axtWR8oFBgB9y3Mu0LKtrfZjbPM1DSawcJMj8LZEqZ6LGoxS8FzGwfxM8RHpHE
 ijWPbrA27y6Mu4FFYtk8aztOvKlBsUYe6emc2JHIkURRoLWOZiyVIDTd2J+O5AazW4jh
 iA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677829361;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6NaYC7Z7KE3/xDS+ojWZnShCIrXPLH1EZcxegpj4uXo=;
 b=7HSvue47bQPuLHowlzCTtaLdQAK8jNgFftc2dU0m9/rlD4TTTxzMTmdbN8vDx7UqYH
 HgqL5RpKiW96ydvkCQCsGPtfYKNQLcFlu4YLnCMCTQxlueLDZS6X3USoBAHjVMRVhlJG
 GKMm0BRzkzu5IHnAhGP3L7IX+s278d3BroOYWkcF9ntOwRZWfQT0CFbSDUOh2SRfLrNc
 rFWZUgEtHBo1+/II8U9vEtx97WKFay32j96wUDhjyJMFf4rXwqoE44b2fA0RaIyOF7mM
 zqiuutltAQvgu36fTgRjOqKjQ07whyTYpnPbY7HpZ5aOu/XZwszQ7fjyaVDVQfIJtnw1
 z0wA==
X-Gm-Message-State: AO0yUKVc4dueeEtcm2oqG77FUKSsaUxAFql3uwShwHZdLhvB/nKoGyHS
 B+FXYnYk9lszMkB7u/gkvNDhEw==
X-Google-Smtp-Source: AK7set9XQN5XXL8B1oRWyaxYB8OqaN+rULhPoZWgFzO6jicJxzYWXiJ+BxcApbrfFSwmxpwqMut0ow==
X-Received: by 2002:aa7:c153:0:b0:4ac:b614:dcfc with SMTP id
 r19-20020aa7c153000000b004acb614dcfcmr1347767edp.9.1677829361326; 
 Thu, 02 Mar 2023 23:42:41 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 rk9-20020a170907214900b008d2d2d617ccsm676760ejb.17.2023.03.02.23.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 23:42:40 -0800 (PST)
Message-ID: <54ee2141-f00a-3193-0821-2faaff826254@linaro.org>
Date: Fri, 3 Mar 2023 08:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230302141234.169985-1-y.oudjana@protonmail.com>
 <0969ff46-3fba-f679-7943-52da7528185a@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0969ff46-3fba-f679-7943-52da7528185a@collabora.com>
Cc: devicetree@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 02/03/2023 17:08, AngeloGioacchino Del Regno wrote:
> Il 02/03/23 15:12, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> Several DT bindings of MediaTek display blocks make unnecessary use of
>> "oneOf" and "items". Remove them and replace them with enums where
>> necessary.


>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
>> index 7d7cc1ab526b..52f233fe1c0f 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
>> @@ -20,9 +20,7 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    oneOf:
>> -      - items:
>> -          - const: mediatek,mt8173-disp-wdma
>> +    const: mediatek,mt8173-disp-wdma
>>   
> 
> This is present on all MediaTek SoCs - literally. The issue is that the driver
> currently does not support command mode panels for real, so this binding is...
> ...well, somehow in forgotten-land...
> 
> I would hope that command mode panels get implemented soon(er-than-later), but
> I'll leave the choice to you and Krzysztof - I'm only providing the information
> here. :-)

Yep, if you predict now that oneOf sooner or later will come back to
these, just keep it. Does not hurt much and later re-introducing it
makes patch much more difficult to read. Therefore I prefer to have
unused oneOf than later a patch which introduces new compatible and
re-indents old one (so unneeded diff changes).


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
