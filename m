Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C27F6C2AB1
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Mar 2023 07:48:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FDA9C6A603;
	Tue, 21 Mar 2023 06:48:01 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3061DC6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 06:47:59 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id t5so18896840edd.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 23:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679381278;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wInF6GafTuPljjFUA+Is8vEjW4Pl6T2we7ZsIWHpBdc=;
 b=t9qzeK5r/pPr7nWar54bwzgkW8DFarwVWfGFpk9NaytbIwZEw12umrs7bj5QwxiuK9
 +kES/0g4F0MOIqGI3y0l3OhtGun11qEdDNfxlGop6VqcPTYPWZiDsGR6MWW4HCkzKWje
 nIezYvISRxREMY9fTomU4/11ue8ESMWS4hggPvBp3S3VmXnorkI5pZ9V1KEZvhlPzbqy
 noAwHJARgZzzi+g7afH2SqNj6avLPLAFW13JEKXKc7AkAMtRUGwm40CRFQj9R3zAEcJQ
 bjV9n63wr2KXFRgENQYbp/6cJ6azeqYMXLsTGiaad8fCbNzd8Me7BOEfbYj8BF+dg5KV
 TqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679381278;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wInF6GafTuPljjFUA+Is8vEjW4Pl6T2we7ZsIWHpBdc=;
 b=oW08jgHnPBLmPAQ0jV5P/QevPz3bNfEFaoy7kjmAwhzWh6Yzxbj1qf6yW+R2pa20Iq
 c/Xhhls1DughzN5bf4lEpMzeIHnrM/VYqCQZOcjOYSnFnkilammAFkgUKmMHUyqUcqqj
 1HKbnsXg9xmONG6trcOqvZ36GhdzWUygbGO2x9OccnXPf+lph5H6QpefPPJnsa1iYdaO
 UOu16BX+dPsj8LAKsMUuyBexKDWduOL6Of46PbIItRHlflawQj1Ch5pEJn4DLVrYWPe5
 A3puRmfvJ8AsLxVVNjnwvVdlLjn0UlF4XA7K04ys4Aj4eCWYFigia+3n3+B3fZMGkwxQ
 VnrQ==
X-Gm-Message-State: AO0yUKWAL0V5gDZ8W7lPsNPUJTqnnRR+bqMrWKyh57iqCG0rEOVUpXoh
 0V9DRGcQR+6P4YkvXvnTXjzBcA==
X-Google-Smtp-Source: AK7set+yUBYPnpsgcGFshQfAIT5gVBUyoTKz/PVli/szhlsgnT8leqFozAyoOp7o+jk4oZaehIJKDw==
X-Received: by 2002:a17:906:397:b0:932:1af9:7386 with SMTP id
 b23-20020a170906039700b009321af97386mr2043033eja.27.1679381278702; 
 Mon, 20 Mar 2023 23:47:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817?
 ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
 by smtp.gmail.com with ESMTPSA id
 qq24-20020a17090720d800b008df7d2e122dsm5344909ejb.45.2023.03.20.23.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 23:47:58 -0700 (PDT)
Message-ID: <48261996-1993-7c9c-b090-eba68157aecf@linaro.org>
Date: Tue, 21 Mar 2023 07:47:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
References: <20230320221617.236323-1-ahalaney@redhat.com>
 <20230320221617.236323-5-ahalaney@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320221617.236323-5-ahalaney@redhat.com>
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 agross@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 echanude@redhat.com, mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v2 04/12] dt-bindings: net: qcom,
 ethqos: Add Qualcomm sc8280xp compatibles
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

On 20/03/2023 23:16, Andrew Halaney wrote:
> The sc8280xp has a new version of the ETHQOS hardware in it, EMAC v3.
> Add a compatible for this.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
> 
> Changes since v1:
> 	* Alphabetical sorting (Krzysztof)
> 
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 88234a2010b1..c60248e17e5a 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -21,6 +21,7 @@ properties:
>      enum:
>        - qcom,qcs404-ethqos
>        - qcom,sm8150-ethqos
> +      - qcom,sc8280xp-ethqos

This still needs sort.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
