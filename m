Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE57823A7
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Aug 2023 08:23:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6BFDC6B44E;
	Mon, 21 Aug 2023 06:23:01 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7218FC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 06:23:01 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-991c786369cso388360766b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Aug 2023 23:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692598981; x=1693203781;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mcCNA6Gfamy94/pLxijVh0qctBGX2/2bPxB/4YNlhrY=;
 b=MWto6spuOBnOh8QA0ql8wvzvvCrNr6DVv1N3pl6egZdE3UBfK/YKmcvtP0NCLkRWOt
 7tVWzFoXA+rUKLR1P2kkAQ/P1zljLzJIJREw0kVIAEofLZ7eYNMlJjCDEMvkeWG7MWAl
 OUofupmN7uR55nG0mY3d0gqk6v6/5F4JtfB2LM+AmsuuQr+vTheSuewniR3Ztsrju7ag
 ZJwxa6yBbGViuIxEEaMs4dU2+4McVT/qSAMnuid4pmi/t4J3ERIYZ/kXM9WX8jNWGPyy
 IVfljFeqVXapoJM5EkfgleGUbH73V1lJhZ0eQmudbUzWIucf/t7tPtYUjII9v2xTKPtP
 nmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692598981; x=1693203781;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mcCNA6Gfamy94/pLxijVh0qctBGX2/2bPxB/4YNlhrY=;
 b=FYuqqQmbFGnhD1zObMUmRFs1fm6Oh/opIU1dP6g+Eh6uvD67UdwC8cK1DHT/2+zIFT
 s+HCalS2eVMbeEOT9u0lN/YR1IaQ1ZMJh+1tc+00ioQZuoKAaeBLgvT1VNIW4vQc6GF2
 hvYgmStkgfVF3kU1v8EyZBhJ0jsScqPzo1qtqypSn00f9KL/+WEz7LvnyiX6U2eMbY6g
 c343bBm6qUPMOp45KXIstH4xEk2G4uawCxqch0WuMn/0dTj/iwuCb4a4SRrWneAt9D9/
 c3o4guUE0rqISc4Iv4cdvDdSvn8KOq7l6AxMp+2cv5mqZhHM2WvXuCdHmQPYP7wMfZrp
 MlZw==
X-Gm-Message-State: AOJu0Yw0STY94a9FZ2y9LskcuNbtBl3U/TICmKMwKLfArFzFNuAXPN2e
 heTAzaFyflQ29jvEEMJWrOi3kw==
X-Google-Smtp-Source: AGHT+IEYVmZ6aoUBBlNkEHfxtQ+b+xqMdy9bNDFQoDfMSE4A8BLuV0STpbMFSDD76wDRmJyL8evZhg==
X-Received: by 2002:a17:906:20de:b0:99e:f3c:2249 with SMTP id
 c30-20020a17090620de00b0099e0f3c2249mr4087672ejc.71.1692598980839; 
 Sun, 20 Aug 2023 23:23:00 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a1709064f1000b0099297c99314sm5028208eju.113.2023.08.20.23.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Aug 2023 23:23:00 -0700 (PDT)
Message-ID: <3a413a63-4e07-94ff-4e49-da7b1e3dd613@linaro.org>
Date: Mon, 21 Aug 2023 08:22:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20230820120213.2054-1-jszhang@kernel.org>
 <20230820120213.2054-2-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230820120213.2054-2-jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] dt-bindings: net: snps,
 dwmac: allow dwmac-3.70a to set pbl properties
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

On 20/08/2023 14:02, Jisheng Zhang wrote:
> snps dwmac 3.70a also supports setting pbl related properties, such as
> "snps,pbl", "snps,txpbl", "snps,rxpbl" and "snps,no-pbl-x8".
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index a916701474dc..7626289157df 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -659,6 +659,7 @@ allOf:
>                - qcom,sa8775p-ethqos
>                - qcom,sc8280xp-ethqos
>                - snps,dwmac-3.50a
> +              - snps,dwmac-3.70a

You might need to rebase your patch, because line number is quite
different, but anyway looks fine:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
