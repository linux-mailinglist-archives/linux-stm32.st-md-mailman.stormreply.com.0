Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A457467E06A
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jan 2023 10:37:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 491B4C65E4B;
	Fri, 27 Jan 2023 09:37:57 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69104C6507E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jan 2023 09:37:55 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id q10so4412800wrm.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jan 2023 01:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yksAV7yHL3wN3w9c8k40mCMMPiyV1hd99TyFgaBpDUE=;
 b=Q1IgsFXQgA4vRbKnGHEV09YcIKYNHOU6wbfDCYOa/8oRhBoDcw6DOo3ZtKEAlh/hVz
 DJXrF3MPff5EwbaLVr5ax7Z1ASkgVRgaqhrum6TGTC4BF4AzSIDJb3HMsnFv3BL0KI6/
 hDyRGvdPoXOnHloSa515sLqxxEYhkDAy5I3adl8lqK6S6sLoLLXSpvC4rxcCWqU2ePVU
 g4M/iYrz5B1PflrG4UZ8+Cg4sFR761tiBYlxlG4aqy9XJdeCYl+0isoKHa/U8upK4wMy
 xZmtzVlG9Z1mYf0Zgf3inLuQupaVfE7vsRrndR0C/EA1zbyvM6leuc7wKxEh9L+cR0JY
 QEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yksAV7yHL3wN3w9c8k40mCMMPiyV1hd99TyFgaBpDUE=;
 b=C79FiPJZnGQ6dvDpl6HbyHMkI248Bpq8VxWOMfsBYOvgOwFPf859D88OevgBpwfwmf
 1tXOzE95lyjVFt6FIa6Sw18QOIxG9wRmXwmJZkG5rW5FtQMTnmCdhJQJsT9JxmXesYvl
 PDq+kkxU3cmPCs8PdgBc67kDPHJtmT9yoITLIrCwyVESnEq1M+z/GQmdQQC5dKPz54ZK
 6JtBBO3XnY2zPQ1HO6PfyJtt3FW+R2IEpjug7oK7BP0tVGt3CHGath5Wsn1MWzKSc5P+
 gIxEiUwIgvRS13rOX66ap1ntqecko8KURk1F3O8f+zmEeaPsDvica0s9DI34nFkmZdja
 zaDQ==
X-Gm-Message-State: AO0yUKV5At5QIEvUYVTHAqvF4DKDS6DHn74c00hAK0Hc6dT13lkMHc1d
 VR0OkgMMgpNijhD/fc+quzWbJw==
X-Google-Smtp-Source: AK7set88fvpm7mZ/TBDrWIqtjTBm/K9NABW+jcJf7uWpwGFZ9Oh/xUoCN/DyAVGGqWyO2zpOiFJfPA==
X-Received: by 2002:a5d:65cd:0:b0:2bf:bd43:aacc with SMTP id
 e13-20020a5d65cd000000b002bfbd43aaccmr7088381wrw.55.1674812274879; 
 Fri, 27 Jan 2023 01:37:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a7bcbc6000000b003d237d60318sm3842947wmi.2.2023.01.27.01.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 01:37:54 -0800 (PST)
Message-ID: <7e941a2d-25d9-44e0-7438-13225c87d8ac@linaro.org>
Date: Fri, 27 Jan 2023 10:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
 <cd803c70-faf0-963e-fca3-0edd13fa8a29@linaro.org>
 <c092c11f-870f-6520-ad89-001468ed59dc@xs4all.nl>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c092c11f-870f-6520-ad89-001468ed59dc@xs4all.nl>
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

On 13/01/2023 10:04, Hans Verkuil wrote:
> Hi Krzysztof,
> 
> On 13/01/2023 09:59, Krzysztof Kozlowski wrote:
>> On 08/12/2022 11:31, Krzysztof Kozlowski wrote:
>>> Hi,
>>>
>>> Changes since v3
>>> ================
>>> 1. cec-gpio: Add missing SPDX.
>>> 2. nvidia,tegra114-cec: Correct path in maintainers.
>>>
>>
>>
>> Mauro (and maybe Hans?), any comments here. Can you apply the patchset?
> 
> No comments yet. I plan to review and likely merge this next week.

Hi Hans,

I hope they didn't get forgotten and you still have a plan to look at
these. Patchwork shows they are waiting for review:
https://patchwork.kernel.org/project/linux-media/patch/20221208103115.25512-2-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
