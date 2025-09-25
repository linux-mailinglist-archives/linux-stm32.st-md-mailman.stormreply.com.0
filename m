Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D37FDB9E249
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 10:55:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB8CAC3F93B;
	Thu, 25 Sep 2025 08:55:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C387C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 08:30:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 605B96040A;
 Thu, 25 Sep 2025 08:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59717C4CEF0;
 Thu, 25 Sep 2025 08:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758789004;
 bh=97eP1RrZK1CzM7LJ/PhdktA7pOXsynV5Pvzv79A+srE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S+VmzwDHVzfldoxi7HY1QHRXIjxUHBqpvaSHHtiAvoATuXZpUo4wVDIoXmF5P/mRr
 2dIDoKuLD8cmq8wBVAmbf1lLzpZ3llVAM8GzgxjjB+KV7gyf1Bag9HupYchLUhrY4I
 zrIbv0AZjlKOompmLwjfOzXNL3w5q8OLHvj4pOwPgNbkF+BpzciAQtBRQpdU8TPmcV
 jakS27dQHZMDO8Y2dCXKfJFMYrp5w7tnkACv0VmzCFtCfUayN1pI3qbjdeMZolO3/R
 fTQr9Q8SdFFQKSbdWjafnyVoyWeQG44KWS1VK6UdIgo3Z84LttwqpajJYpyU4zQAa8
 h/ylSOSv0Sm3A==
Message-ID: <a8ebec72-eee2-4a02-ac6b-57678aa7c50f@kernel.org>
Date: Thu, 25 Sep 2025 09:29:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
X-Mailman-Approved-At: Thu, 25 Sep 2025 08:55:07 +0000
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: clock: sm8450-camcc:
 Remove sc8280xp camcc to from sm8450 camcc
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

On 25/09/2025 00:56, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
> which now supports both MMCX and MXC power domains. Hence move SC8280XP
> camcc from SM8450.
> 
> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index c1e06f39431e..dbfcc399f10b 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -63,7 +63,6 @@ allOf:
>           compatible:
>             contains:
>               enum:
> -              - qcom,sc8280xp-camcc
>                 - qcom,sm8450-camcc
>                 - qcom,sm8550-camcc
>       then:
> 

This is not a revert.

Where does the compat string go ?

You are missing the part where you move the compat string to where you 
think it should be...

Also why is this patch appearing in a series about _adding_ Kanaapali to 
CAMCC ?

NAK

---
bod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
