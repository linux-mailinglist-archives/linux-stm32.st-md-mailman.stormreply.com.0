Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 749FEB9E357
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 11:10:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23685C3F949;
	Thu, 25 Sep 2025 09:10:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F95AC3F93B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 09:10:21 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-46e37d10f3eso1493745e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 02:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758791420; x=1759396220;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nMuA4DWC6qNeuux3AJTay/iyO89ifrzsRhDuGmNfotc=;
 b=TgZNj3D9fu9+XV5Oq93HI5QiBNlLi6dulMjs+d4K2LOVV92GtqBrEaAXVHS13vUJFR
 mg5ucdQHEdCnXSM2lb4eTpdDyzIiNas5yxLhjLTcT9cg/s6JujQs0XwbiKtJasjUiz8H
 83szEXPjUKGr/kzi9nAzmsQLA/aNyY4o2ewoAxbYdwXhxE+IxxJc/IAjLxZRxEra8XwI
 CDXYdwuVCrUFShq9pQac0m/r6vi+qj468LSbFuc45W7K9d3zkLp4LZGX4D6LcQNrLHCB
 QQZSgqfjfYMwYje8s5nH0lYtEisDuib7EvfTTK8uIoa23vWNbxpB5/oZ2XOedMO1viSy
 A4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758791420; x=1759396220;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nMuA4DWC6qNeuux3AJTay/iyO89ifrzsRhDuGmNfotc=;
 b=KpU8D8GvlJ2vJZVBp7yGpA5+11SyWG8unUr2wUG0Nc/ppwxZUDF86Z6tdMWbTgOHJc
 0ZaIqUbaAhX7uCskPAZakGQN7HCyuPTnWxon5mU9x3v87Towunrk7VqTj2sn05CM6yIc
 HkriZoXemhAmNYScEnPpo0SpZ/5ZeNrcPUTMBK7kTYN24WBNWULhOWMx+tJjLaHNNVch
 sFV+yJh7jbWONT5Ug5dzMNCgohXJLZYlw3O8aUrvwD1vSIg0YCFYd6ObeK4qEB+Bu40l
 5QWFnoUCW43qe6j2jdxxwJx7zzWPBDRZARut5jPORnLrg1YKs6Ipho6mdPz6x6Dr/xbl
 KffQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEIZutc8Y9IF3ic67FwAK6lgAkRkSZNwrZgPPBwF9Z6ojzMoWPUGw9SxPMZmwln7WWsCGw7KnuJeqIfQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz3FGku6DAN8at6iD0C+l5xAQjQnzXm0MQbyr+GneamoAyTVZgC
 VHKt74mTa0i6nQuWbaxIuNGKZaMnKuJHKMiANIY0IKO6fMoP2ycMq9heE4LSo/pkC8o=
X-Gm-Gg: ASbGnctUhPhu2O0NR/rG4ipmrPZa/VqFoBF23ZDyjWbF3ibE9Kn8UnZm1pWPPKqN63k
 VsLAS80cVa/qU4k+mryiO94+D0MWEZj/WbTseHWkURHm1ie5+uBOrYi+4aIiYWXWYDlZo9vNUnY
 BPNjcDg7hq2bqsxiJFO/TmO24zVpUAVn9cHDXauPRcd6m3EBG0++6oH2rf95pt/U4Yup3yADfpz
 4mgmzWldDfZkSEHbFTFcoYfKVqfV441/qa/AlDt4FovoA2bcJcHWoQRdv05twf1bzKyB0wDrSLa
 0YG1hu7IA0lteZu0GwTd0ycz8XFqHQDpKcoICXVJS9HmeYQp/ZrsM2nEnMafOlRc5CgZVXExq9u
 Bj1gcI4ZufeYU1dVwGiVQ99XLcmjGUJWhKOE3ZmQYTyzD8Nxs7dKuncsZi3ygMfp2tNpdwSs2cR
 wlFI7iT3JrTtii2uWMpJct
X-Google-Smtp-Source: AGHT+IFDpMpHsFRgd6YSWfaUgP4h+TK2gackvhjt2ED62B1HXzzX5IdszOWCjQD2qcaPDSO7lAZ6/Q==
X-Received: by 2002:a05:6000:2484:b0:3f1:2671:6d9e with SMTP id
 ffacd0b85a97d-40e497c346fmr2389638f8f.1.1758791420460; 
 Thu, 25 Sep 2025 02:10:20 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33b9e3bdsm27566255e9.2.2025.09.25.02.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 02:10:19 -0700 (PDT)
Message-ID: <d18c5196-dd8e-47d6-87bd-de0ac94fbf3b@linaro.org>
Date: Thu, 25 Sep 2025 10:10:18 +0100
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
 <20250924-knp-mmclk-v1-7-d7ea96b4784a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250924-knp-mmclk-v1-7-d7ea96b4784a@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 7/9] clk: qcom: camcc: Add support for
 camera clock controller for Kaanapali
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
> +static u32 cam_cc_kaanapali_critical_cbcrs[] = {
> +	0x21398, /* CAM_CC_DRV_AHB_CLK */
> +	0x21390, /* CAM_CC_DRV_XO_CLK */
> +	0x21364, /* CAM_CC_GDSC_CLK */
> +	0x21368, /* CAM_CC_SLEEP_CLK */
> +};

How is this critical list decided ?

For example why is the AHB clock critical but the CAMNOC and AXI clocks 
not critical ?

---
bod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
