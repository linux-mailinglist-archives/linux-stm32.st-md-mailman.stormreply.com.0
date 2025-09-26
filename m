Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 321F1BA21CE
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Sep 2025 02:55:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7252BC3F94F;
	Fri, 26 Sep 2025 00:55:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D523BC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 00:55:54 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-46e317bc647so10997215e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 17:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758848154; x=1759452954;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9e9NdOcaym+Fuz3o7AoDLOamjILGzKfxxMvCkH865N8=;
 b=GHWqh4TsHoxgDSJu562PvTcz7L985n7gQCiLitpZGO69TwbQk3WSgkgTu5o/tZVwbc
 B3t3Y5d8SdWIyz9lWB15lrVXbPBHzxxAASDlWd+sO+xdUJ2hpf3mrTEU39TGobIKbnM6
 SaFfE1yA+OYUeXvSB88yM9Ydabj5ehc8AoY+lM6Rnu1BdEPTAhmLS0aOkMDxnSenji+g
 xgjTVcD8ZqCD7rdiFWNSLYP9aXYRPTTYt4ZYnmKMgm2YjK1KzUs3fnvc2PPYtm/LdlVL
 pLl0q1MfEi8VrEK31K/3EImTptNOmheXUVY700Y5uZf0kGpiObZO0ExwEBc2XxF+nnqa
 qcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758848154; x=1759452954;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9e9NdOcaym+Fuz3o7AoDLOamjILGzKfxxMvCkH865N8=;
 b=i7OBORT3UGmd5zX9/BAQUi+YaFmy2EHUohc5eljWyc/rbYEYv/H3Uml2cyxoamtbml
 24ak+nxHk0xrPpmPJThSEK0w4Qdh7n3JM6OdEk9INLo/N+WzE0QOwrINzxHh/WzGBKqg
 N4PxsGFDHLzO8yhqCz3jQ3hrRylZPNaRaGF+Qc7X2x8bMndRpxkXFEqTF4qixTKfQbXl
 cDDnmagOKuZnE2eO/isLcaDJKlao8nC7uyvjwrcZiI0K4g1CZDzpHC4xOSRrDxxHd0Wp
 KRFzBRiUFkGS4YKrOSjVkTIgcci+f+YTGruTqMz+w+HItsm8R7/blpC1K9vU9WNobO2h
 u4Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVktGjjILuNgYHNeUNPj/FuReWZZX1sPu58hb6bpvjW8Gt/JAiVbZPJJ6RhKNmgTEVw35LoL5CclMl2LA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwGnzJ4WkD5nfM7y7pPrI6SG/AXw+Ef410OE5+rW3TnJPenxFAF
 Z7uKQNc8qy6P0BQ8gRnovmH6cjXSMaDuUeN5mJEsfVyc758mLyrXKF6Mvwt5AoKW+DE=
X-Gm-Gg: ASbGncvyxqq/CtHlthtyJ3Uh+AH6JyqbF5T5fVS+IcUzKwUnglE8HmtItPRAqMRtiiP
 WGmoPttGJOKTbbHZVCUG8IQWFiVOh/gG4hxzzBSReILbc/anJjf00m/Vf8eaIaobcCjqton9HQz
 EviWDfzF7KshAIcUdIhNPO3Ip4yke/V56sJLHp9CQBcLA+Sk6W1KOtHn4rqg2foqk5paAvvcbAq
 SXMbgiy4fTGE635aCdBardnVibixHTMz/FsGCW8BezvWILPh7fxOW5ZY6Prs5c3bZn3N2cbDx9g
 SBnNWU8lu8tW9tqwYIbPgzr1gdmxivjQTMK59tZkSloaD5Tsa7HkFCO+0+mU16HyB/Z3IkYJNir
 glojMtjVdTc+tsUWqElZxmi/U7vRCId2bITPDQVi+BVabL8OFWA8xOGEwNxn1ukbyWZ22CMwbgY
 PjIV72vU+2IkkQYr2f3gsu
X-Google-Smtp-Source: AGHT+IEi7fDGWCixHLoidioieRVuXJUMu0nnRncjPtslMOdDH/jitf97iTqziYXoLsGnOKsP4maIXg==
X-Received: by 2002:a05:600c:3551:b0:46d:a04:50c6 with SMTP id
 5b1f17b1804b1-46e32a10ef4mr59198215e9.30.1758848154080; 
 Thu, 25 Sep 2025 17:55:54 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab62233sm97057095e9.21.2025.09.25.17.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 17:55:53 -0700 (PDT)
Message-ID: <f705e9b3-864d-46bf-a6b3-f3be4756293b@linaro.org>
Date: Fri, 26 Sep 2025 01:55:51 +0100
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
 <20250924-knp-mmclk-v1-8-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-8-d7ea96b4784a@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 8/9] clk: qcom: Add support for VideoCC
 driver for Kaanapali
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
> +	/*
> +	 *	Maximize ctl data download delay and enable memory redundancy:
> +	 *	MVS0A CFG3
> +	 *	MVS0 CFG3
> +	 *	MVS0 VPP1 CFG3
> +	 *	MVS0 VPP0 CFG3
> +	 *	MVS0C CFG3
> +	 */
> +	regmap_set_bits(regmap, 0x8088, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x80b4, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x8100, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x812c, ACCU_CFG_MASK);
> +	regmap_set_bits(regmap, 0x8158, ACCU_CFG_MASK);
> +}

How ?

You're doing the right thing commenting on what is being done but, 
you're not providing any context on what that thing is done.

Write a set of unnamed bits ?

+#define ACCU_CFG_MASK GENMASK(25, 21)

It's only five of them, please name in your comment at least a give a 
clue as to what they do.

---
bod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
