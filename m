Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8056C2AA5
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Mar 2023 07:46:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C380C6A603;
	Tue, 21 Mar 2023 06:46:49 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DA5AC6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 06:46:46 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id t5so18888960edd.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 23:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679381206;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LbW6WAMhZTX7WnxINd+j72LPEfzo1MLGZ6GMQv17NLo=;
 b=nd2EUf30Ha8guzZQeguGoOZ1uxedJlSDmM3C/DHeLd0pnss0I1EeRH94/e1glqS7ak
 7DTyb2vLUUWZlnRnUESGrKTw03BiXFv8cN/BjW3bifRXsr+MJhnM5mxqDrJhmO9FwuXg
 cks5cLJXSzsA9yFFlClT/AQy6L9ysIif5fG5oTczicCWIgI4uk7MIPHgr9RxLGLBnoqZ
 yBR9UtZF4d+BY3WmowQlf8h83zqsU7ynaF8r1JtE33mdQ90id+c9fiE0I0RdT/6/JtVA
 j4z6wexc+r+5GA/dd/1XMlLXEb2pYsJ/Zp9Ib8WvouBd8B/A25KhefWSN2q5AEJxPLw+
 TlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679381206;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LbW6WAMhZTX7WnxINd+j72LPEfzo1MLGZ6GMQv17NLo=;
 b=K3nQ+XueYEquNtQSONVDO+MbGPzZXoyjsarEkjEriPITPzZhmElp+X7p6hZ3euYOHW
 VmTp2KE1F5PqjsPY1idBvVc7JK2j3LjFVUVteSUJnhaN2D09TBlykBdLfuSJz3cdlgjc
 F7TGxQ6+IJNzOCfHli/HN+kW9mQ9oFTDGX9AvYWa8Z/xntroYTd7x39pyNjDATbInqHV
 7Tl5OxS2s8fWmlhB6oHzzz0aijDnfgPksLjEOTwNw/rxav9J3M38tY94aVSXNgvOw9gM
 TAhMlFeJWqHAEAshFZl/TAJrI4QoqePo5mLq1IuSuO2pPI5D7PFmdGHZzWOcza4THWLb
 iCtQ==
X-Gm-Message-State: AO0yUKUv+4I7GmI3z5h18tfCutXzO9PRiVAqx8gw2AWT62c+Xkc0/Lux
 k+r671XNWjU/kMKu7wQYAaltHg==
X-Google-Smtp-Source: AK7set+GNJOQMSqsHpsaDD+hA45a1SCbSDj2lMuArq2m8zTO2J7rS3eLvgQt/d/gPzLHoo0PsaGV0Q==
X-Received: by 2002:a17:906:4ec8:b0:931:95a1:a05a with SMTP id
 i8-20020a1709064ec800b0093195a1a05amr1837229ejv.62.1679381206457; 
 Mon, 20 Mar 2023 23:46:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817?
 ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
 by smtp.gmail.com with ESMTPSA id
 b26-20020a170906195a00b00930a4e5b46bsm5310855eje.211.2023.03.20.23.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 23:46:46 -0700 (PDT)
Message-ID: <68b68812-7317-bc55-7449-18912438eb46@linaro.org>
Date: Tue, 21 Mar 2023 07:46:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>, linux-kernel@vger.kernel.org
References: <20230320221617.236323-1-ahalaney@redhat.com>
 <20230320221617.236323-2-ahalaney@redhat.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320221617.236323-2-ahalaney@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 01/12] dt-bindings: net: snps,
 dwmac: Update interrupt-names
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
> From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> 
> As commit fc191af1bb0d ("net: stmmac: platform: Fix misleading
> interrupt error msg") noted, not every stmmac based platform
> makes use of the 'eth_wake_irq' or 'eth_lpi' interrupts.
> 
> So, update the 'interrupt-names' inside 'snps,dwmac' YAML
> bindings to reflect the same.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
