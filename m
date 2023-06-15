Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2757D731A2D
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 15:37:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4993C65E58;
	Thu, 15 Jun 2023 13:37:34 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9715C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 13:37:33 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-977cf86aae5so267431866b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686836253; x=1689428253;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mYo4mo9LxJ5Bb1u21M6AxJhHfaaBpi4Yfj8oS2RZGik=;
 b=gwnpCAL+9XD9YTcrhW22JHHze+0ln59G79fG0PbzPCPkUume7cpPMe9N1MpVazB8T0
 1VNcvHhrMsDbjcPaCwwELzdmSj2CInEWwxUmLYNOwRUXECqbkD21NOCA6zL0LkId1xTe
 Jmz5KNhEGQlTF8AQJe7uUwDQ4+pi/99NutlpmFMGKD3/SppKORWaGtI+PmV14ZbcTUXg
 SQ/xFGrRUrJug8frUn3FxCFoHdEvGjOv0zxfZtED6wTv76W+YYbrOe0XjczsTNc6FnX6
 BTbrSi6sWw9Hr8PLExxfqiIVT6LsvR3Q/5vN6OlV0JnK2Yv0FbMnNpMYEzZJu4bCBpMD
 RaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686836253; x=1689428253;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mYo4mo9LxJ5Bb1u21M6AxJhHfaaBpi4Yfj8oS2RZGik=;
 b=aYL9550F5ydqNpRt8ikQEBiB/UCeSJ3RHLPXpuYqpRqremxfzUnGy9AOge4wh4Tvlw
 cKpiSPTFdTlPEDSBZddBZGrEKZQ2yIk/tHkBm4qHiiY3gDtztYJHva94zL4p6e182ksr
 ednNBj+T4ACCm9oLUetc7/gQVRYLEQAvovjClZDFjqBEGBnDSQ/NZ2xAexKQpFuXnD2q
 TbWgDTAlSDhYy4JJzFQoT5vz5QkAbsYraBw01VXULP1tjVcieEH8gC1le6/lSAvGMA1q
 YMDSkBT8LCMcT58pHF5EH8LsHNcQ6uEQNILEyQpMwHgWqRUsUJm/GPZqGYNpN1ZVofhW
 kcYw==
X-Gm-Message-State: AC+VfDxO3EiS2onizNnQQ7VnxCfTSRXRzwmOa4B8x2N98afsjtpjQRqR
 nvTmwomOE1nAQCak5AkQfPs6IQ==
X-Google-Smtp-Source: ACHHUZ4+n13L4jhgYrrrc4ptTI3RmwMq1dwvCZV4MDbjtdu4sLMN7fnVBOOcDFGxP2/w6+shDoBlfg==
X-Received: by 2002:a17:906:6a07:b0:982:a376:1d3f with SMTP id
 qw7-20020a1709066a0700b00982a3761d3fmr1542823ejc.41.1686836253221; 
 Thu, 15 Jun 2023 06:37:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a17090648d700b00982c84e5dadsm196414ejt.170.2023.06.15.06.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jun 2023 06:37:32 -0700 (PDT)
Message-ID: <b326151c-24ed-e603-d1c7-3ebe8dbaa6c4@linaro.org>
Date: Thu, 15 Jun 2023 15:37:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
References: <20230615121419.175862-1-brgl@bgdev.pl>
 <20230615121419.175862-18-brgl@bgdev.pl>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230615121419.175862-18-brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 17/23] dt-bindings: net: qcom,
 ethqos: add description for sa8775p
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

On 15/06/2023 14:14, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the compatible for the MAC controller on sa8775p platforms. This MAC
> works with a single interrupt so add minItems to the interrupts property.
> The fourth clock's name is different here so change it. Enable relevant
> PHY properties. Add the relevant compatibles to the binding document for
> snps,dwmac as well.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
