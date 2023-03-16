Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B1E6BC6EC
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 08:19:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C886CC6904C;
	Thu, 16 Mar 2023 07:19:11 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DD32C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 07:19:10 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id eh3so3688102edb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 00:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678951150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bm96tdwLx6fPQGeDjINABDetH/ZY7i77lBQjLJrR1ts=;
 b=lknDG8yZUnixEHyBPesXoiJREWN5L9q5lFvMBm9EJDIKbdAGhkgNdYivDsc4vUhQDD
 8y2W+FyY+fXV3a9MIhsebmNN/Z/QCZvIAw8g7dtZRXX3ZhkZ2e4RQ40HOBjSqx39BetR
 db37n60Az/c8hzlRRM4JzCsJ4dSySNlmMS7VJHt0PyA2U4aobJKcbHV7y6osDRonesgJ
 +0EPdHijgkWkHXIlOLjPPXZwZQ2uVRe+A84j58m1duRUFqEf1ReWf1pNJoK18ONLvUZd
 7UYyNmFLfknWngTkP5/NZfhqWVoyDWJxlLuoy7vEt6SxAcK8HnGSRSJQkuelMVg2EQ+p
 8w7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678951150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bm96tdwLx6fPQGeDjINABDetH/ZY7i77lBQjLJrR1ts=;
 b=oCkKc/foLeArPw8vuCv7Ev68siJxrJwODFPJlfgxlZM4WQrh5SBHhqNT758+r0R8bn
 YNlmvAnIkyyoHY1XBp1kysgZHqmhMu3FUUu395fwFm7x3o/MZLc2MwJDkrExkCUvBozG
 Mhtkn8IP9xKhYT7Jw7VITf5v8aXJQ4m7q4mc0izWl82GCRNp30DoNA1otucZGvD2Nsfx
 C69wVPPo8SG0HvQbie8x1VbkpUdQn9jhUhyFWYVhujoSh3dqp89b48NDuGiEwHWUszsY
 0b6YzZx/l548APPL0gag2Ve6ukcdy+FMOMqIbxhRHfz8N8ox2Dm9kbbKzx0D8TwfoPEc
 IYwQ==
X-Gm-Message-State: AO0yUKWpLp9omrNZkP57elWuvCcnH5diO7garKr67x0TeQYJ0p3/Cwnw
 BJzv0OSmoTryy+5fAhsPeeROfw==
X-Google-Smtp-Source: AK7set9cPxmxsJC+fDgnp9bdjaIupZwvekzcVHxzUtQcTePr9a9/UyCWNrhIzW+IZivrsS671zcVmg==
X-Received: by 2002:a17:906:4e02:b0:8f7:48fe:319d with SMTP id
 z2-20020a1709064e0200b008f748fe319dmr1626347eju.17.1678951150203; 
 Thu, 16 Mar 2023 00:19:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
 by smtp.gmail.com with ESMTPSA id
 r24-20020a50d698000000b004af71e8cc3dsm3387915edi.60.2023.03.16.00.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 00:19:09 -0700 (PDT)
Message-ID: <47fd240a-847b-e034-5a6a-4ed14f453612@linaro.org>
Date: Thu, 16 Mar 2023 08:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-5-ahalaney@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313165620.128463-5-ahalaney@redhat.com>
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
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 04/11] dt-bindings: net: qcom,
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

On 13/03/2023 17:56, Andrew Halaney wrote:
> The sc8280xp has a new version of the ETHQOS hardware in it, EMAC v3.
> Add a compatible for this.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 68ef43fb283d..89c17ed0442f 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -24,6 +24,7 @@ properties:
>      enum:
>        - qcom,qcs404-ethqos
>        - qcom,sm8150-ethqos
> +      - qcom,sc8280xp-ethqos

Alphabetical order, same in other places.


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
