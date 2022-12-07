Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE4864560F
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Dec 2022 10:08:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0F1CC65E6B;
	Wed,  7 Dec 2022 09:08:42 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CD1DC65E5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 09:08:40 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id s10so6135856ljg.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Dec 2022 01:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8WyD6+4TOtnUZ3buZrfTvZlmLnV/84EmqHh/FS/HaPA=;
 b=L51sXgM7Hxi4SbUu1GAGwaWH8+oChEaG+fH/OfL9hIiFxjSBSLXKFotpowsHk3SDhN
 p4cZ9Blp6YSzDOgACKD9avjX7BW17+aEsZ3QYKvjRXFuZp75GP7SmTGJDzFOnsShyeDj
 11UruWJXKsGl029Y26Lg4SX+I2DtKEoj5FTQFMCWtF3/Z1KuUX3gM0t7OuDl12x3tc+j
 /1IvglKFAGAeHBnwqkQne+a7jkoBQfQ6jVctZJsAT1zyYX5oj/Wev1yD4YvQfff/nUh8
 p//ZmuGEqWgyIBpjMAU1ix+krZXB5tg9XLOL6SGmrshHF3sfOrGuBANw9h9OADYmOT2g
 6cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8WyD6+4TOtnUZ3buZrfTvZlmLnV/84EmqHh/FS/HaPA=;
 b=pY0cjrHZ/7/iSO6U81mYELvYggT0y80HOjG4tAnrV/iILcEVpQaUgI0onQFKTkkDmM
 HdYCXlpyZKnzVfAqMXvfyIYyk03Slg1BzXPGbH5z1rA2RPA8Qv1UpSSe38wR/puDwSkl
 UDLO8zO4t2Rq4nbec7/o1Asohc7Z7btG8BTr32TtNOBdhCCQbbWZCPqoTlanXsPxDtM/
 WzR7xwXFleLdxaefa5SsiNKxH0pGvk4FrQff5dWTQdfb5rH8j3ieZvv51Ct4PncM3nUW
 7DdPX2hsd46sJzdq35G6u8LZu/cfCSlSer7OYJTHU8jvWapvCrYmL6InFRq4Wslor6LD
 EkGQ==
X-Gm-Message-State: ANoB5pmiQ+qw3OiCNSK9ikTHPEW61G7HAtEwA29FeCV125k/3uHPvQPb
 1oOJx6/FgBOKF0Fy49g0AJvhKA==
X-Google-Smtp-Source: AA0mqf5csyV+ZQkovsgzCNVOH5rNxgnnX0/bj5YjAEE7jb/b2fXvUxMbfi0o2/X1/JDCViBzm8O8bg==
X-Received: by 2002:a2e:96d6:0:b0:279:dcde:84b2 with SMTP id
 d22-20020a2e96d6000000b00279dcde84b2mr7575311ljj.207.1670404120162; 
 Wed, 07 Dec 2022 01:08:40 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 142-20020a2e0994000000b00279a5b85791sm69308ljj.88.2022.12.07.01.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 01:08:39 -0800 (PST)
Message-ID: <ebd963e5-fc27-b70d-8cc4-b18978a5de39@linaro.org>
Date: Wed, 7 Dec 2022 10:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Thierry Reding <thierry.reding@gmail.com>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-9-krzysztof.kozlowski@linaro.org>
 <Y49vm34cwgilAA33@orome>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y49vm34cwgilAA33@orome>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jeff Chase <jnchase@google.com>, Joe Tessler <jrt@google.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [Linux-stm32] [PATCH v2 8/9] media: dt-bindings: nvidia,
 tegra-cec: convert to DT schema
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

On 06/12/2022 17:36, Thierry Reding wrote:
> On Mon, Dec 05, 2022 at 04:18:44PM +0100, Krzysztof Kozlowski wrote:
>> Convert Nvidia Tegra HDMI CEC bindings to DT schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  .../bindings/media/cec/nvidia,tegra-cec.yaml  | 58 +++++++++++++++++++
>>  .../devicetree/bindings/media/tegra-cec.txt   | 27 ---------
>>  MAINTAINERS                                   |  2 +-
>>  3 files changed, 59 insertions(+), 28 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
>> new file mode 100644
>> index 000000000000..9a4025ff7fad
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
> 
> For consistency with other DT bindings on Tegra, it'd be good to name
> this nvidia,tegra114-cec.yaml since that's the first generation where
> this IP was added. Not a big deal, though.

Sure, I can rename it.

> 
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/cec/nvidia,tegra-cec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nvidia Tegra HDMI CEC
> 
> Again, for consistency with other bindings, NVIDIA is the preferred
> spelling. It's not a big deal and could be fixed up in a subsequent
> patch, there are a few other cases where the alternative spelling has
> been used.
> 
> The rest looks okay, so either way:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

OK

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
