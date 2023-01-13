Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A27266920A
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jan 2023 09:59:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC216C65E45;
	Fri, 13 Jan 2023 08:59:37 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9181BC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jan 2023 08:59:35 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id ss4so43492888ejb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jan 2023 00:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9YM8Shx2IZukw9YcFp8FhnA2qd5i13IeliX120PH17I=;
 b=UswNafJ8Hcq8szwzEdclRDjcNXXT+kfG7zB9GvtX0hGjvzrZfoStfz9NgA0jc+sJR3
 Rixfzk4u9VFwLwgURno/IXUlVFigpNu39LT9NDc5Xw8YuyEjr0CWwYATZyCodqdH1c81
 LpzCJ5kKDL0FzvtYfXLmrJuwXjxK5Tz2XZbNW9Lrn/B/jTpyk8/A4/avobX/texpV4H0
 unOstmnettk1gSMvYCtzZWZiRcF5otG5OlQau/8UI/hZ82dJiVTh9sTwE37KjRaysgSw
 uquU+BTFsZXsw+9vVCkEjnOKOrgswmnORNmMR+V1qEAi7/K3ojaXMj/PYkoitAjerQsE
 B4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9YM8Shx2IZukw9YcFp8FhnA2qd5i13IeliX120PH17I=;
 b=5vcHyzE3P8v0KqNG+i5quTFwjb2LzVTV7n5rg1lrofFJXFIHfYCiSPXuTtLZTcWMoj
 87zRl82eCLwEKY9uXl6gWFgPyW7fg2MORWt6UZPOzOtId3xh61Es9klGy2NW7hhsRD6x
 BdD4EC7yDh//vB/TFFoMivylu7J0bX62RqFU/5nuRhmir25SFoVnexhgyAVMFKH1zV2K
 6nH8rcjiMuvCVhAyEHjPtWp6uo4bB+8VC/DpI1r3YvrH0atma5RMENxatplbjb6eF5Y7
 /PuS/Uk9OVLEa2ZTWyw85RUaXzDoYVdnrzFbqdOZgEKqyjg7SSp8Xu93F4kGdpV1gPjR
 /c6A==
X-Gm-Message-State: AFqh2kqJvlbmh4VPoHUe1qV0psdX0sdzeQsaqcsNenM+lIWJ7xw2jDzc
 1gVXm1NVulP3CZo36Lb8i/VLcQ==
X-Google-Smtp-Source: AMrXdXsPxc2oqEqJfGabmBqgzaWDsQkxV3GmdjQPkiDF+d6dv+FHlRbTN+U0t+9cYBoJoZb4U0H6gg==
X-Received: by 2002:a17:906:1e8a:b0:864:223:40b with SMTP id
 e10-20020a1709061e8a00b008640223040bmr6721662ejj.33.1673600374808; 
 Fri, 13 Jan 2023 00:59:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 en6-20020a056402528600b00499b3d09bd2sm5792349edb.91.2023.01.13.00.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:59:33 -0800 (PST)
Message-ID: <cd803c70-faf0-963e-fca3-0edd13fa8a29@linaro.org>
Date: Fri, 13 Jan 2023 09:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jeff Chase <jnchase@google.com>, Joe Tessler <jrt@google.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 0/9] media: dt-bindings: common CEC
	properties
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

On 08/12/2022 11:31, Krzysztof Kozlowski wrote:
> Hi,
>
> Changes since v3
> ================
> 1. cec-gpio: Add missing SPDX.
> 2. nvidia,tegra114-cec: Correct path in maintainers.
>


Mauro (and maybe Hans?), any comments here. Can you apply the patchset?

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
