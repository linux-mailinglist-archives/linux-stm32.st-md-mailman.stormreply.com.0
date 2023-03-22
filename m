Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 134F96C52E6
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Mar 2023 18:43:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEC76C6A5F6;
	Wed, 22 Mar 2023 17:43:37 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79F32C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Mar 2023 17:43:36 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id w9so76223118edc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Mar 2023 10:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679507016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bz0GFwOBw4FSvdCteGZo11Dbw1t8O4+71KL8pO8s3Fw=;
 b=OHOI8Z/2mnCkG1BpVa4vIPM872lkUsqnVFmvtNoXvprqmK453DF3RoKxCCkBTFmeLG
 lLGk+LcT+GomsR5UIY53XrwQwOolIPtrnVFv7t9YVjzlxnRG4kY/TNHLD/wPpSfaokiY
 Orxpz9nzQc3haBs0ggypW+juXJ663D0kdfN2LmYI6H2FUxycUsiN+663lEdkAxYQ519N
 0k0z4yPhkn2rbgzYAfUEpeIgfYjMYVHdjf3ia/niqQLKHepo3AGDUfRCd+NWfgGanzy1
 Vx7xyC68Azr7wFQqeAhCQhZJncHO5CsPpuS/bcYpWqyKyRJk8b3kPZyAaRaqxZgojD4j
 ipXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679507016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bz0GFwOBw4FSvdCteGZo11Dbw1t8O4+71KL8pO8s3Fw=;
 b=LKOTMiMOLHu4QqyieeApfJ41eTf3xWQ8i5x91Otz01IU9f7LZA8shdG7dG4K+DA82g
 hEOAM1RvTA9httX9xFgA3RulN9cz0QNSGPCdtbHdRNjmUeAtzRWg+bArhmhRxwxapXta
 zKZLKcJioTKmgH+DEKGt9Hz7hSo5yIxZnm02Aw2cl1AvCue2zGUyl4r52XCCwJCoRk8z
 JwTI60zN1KIKrnWBkSmeltWUNS1nq5VR1QTtblDJVbOnx2CuCDf7FSz2ULK92Sw6UvLn
 YjjCm6rB3Uiuo+r0r5a6BvjNERzbqcGMhsRMrjko9VP/SwEQRGiYTsTsQ60sBla/6rbl
 K7OQ==
X-Gm-Message-State: AO0yUKUQ1JStbaE6HdC2UuJupwvBGjRO3q4r66YL6rZt9AFDxad5wGUy
 GRUgtZViFMvPSLoG/El8LEqh5Q==
X-Google-Smtp-Source: AK7set+nkmtoqjYEzZaku0D/7qQI5HO9as0edhrib1GD9nZDSZ9uxRhZ1jH+E0y8NuK4755/15GYjw==
X-Received: by 2002:a17:907:7050:b0:932:b7ce:27b4 with SMTP id
 ws16-20020a170907705000b00932b7ce27b4mr7503749ejb.27.1679507016059; 
 Wed, 22 Mar 2023 10:43:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6?
 ([2a02:810d:15c0:828:5050:151b:e755:1c6])
 by smtp.gmail.com with ESMTPSA id
 bu6-20020a170906a14600b00933c52c2a0esm4959743ejb.173.2023.03.22.10.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 10:43:35 -0700 (PDT)
Message-ID: <af57ecdb-5f06-9a5c-30d2-0bfd71c798cd@linaro.org>
Date: Wed, 22 Mar 2023 18:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michal Simek <michal.simek@xilinx.com>
References: <20230322173449.3970718-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322173449.3970718-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mailbox: Drop unneeded quotes
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

On 22/03/2023 18:34, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
