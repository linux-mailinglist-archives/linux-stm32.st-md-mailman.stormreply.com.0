Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD228B9E2B8
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 11:01:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73D2DC3F949;
	Thu, 25 Sep 2025 09:01:41 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C271AC3F93B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 09:01:40 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-46dfd711172so5903675e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 02:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758790900; x=1759395700;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yqstp8v0w5ZqvhHqs9nCFyjLloZ4iTt0o1sbH2L91Q0=;
 b=HVAFYmEnTiTs+v1jhCXKuzpZhHxOzCryg9vqdILJOY3fh4/7Y67SE/96cGcPs8wbir
 rcpc8TLIzaCo8YNHoOj/HzhrdKdi+4I2mCEc8FA7us4hpH1CSTdW2r4rQYBLUD3b4Xct
 w62F3mGLIw2S1Yb6KO/6jqnaX4KWp0mofvefpaQo6GEmZg9grIY4vck8wNQX9HGnu2pD
 miJ2KdSFE/doupS3E4m63xrp0kJBIEVvtiHUJQPncdMXbf/3nfXOuDul2+X3CyGXrgFo
 MMOohpKe8w9eLgCbq0kBdc0KMn/pJllc+omUTQxpd0hpgnxaKApNHSt+odyOWvYESow+
 aT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758790900; x=1759395700;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yqstp8v0w5ZqvhHqs9nCFyjLloZ4iTt0o1sbH2L91Q0=;
 b=OQaCb4B87cEwzySgXMZH2drKcAywflE3EpbffijXV3czg5g0+IPvX6nbOJdWaAFoqr
 V0BhoZx5GZIwA1mVUEonnLXBD20tqlMJ5wx3m49dI1DTky0sGNP/FdC6Y0aQ775jvCM9
 t5G3JqyY6Sg5wv9hqeELROHjNnZSBVKIWEn1XnYUuPuRWsrHvJ+Iq2tyhl3DDhPuh09r
 C6uv8tiEUEbrf6f/MRJdo37rxQXzB/PxqboJU+LJmEH5XHe6fDAZLBhR3ETdCYWjOGZf
 ApTA2qqZoXBOMO2c2oNcZi3zxuRylxBjvpdrL9BpzdfX6EmMbnFEJnamUwU5XiEVuK2r
 wpRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8PrYuDzcNVA90IA/oKJw69hpCCz/gJWU/xZ/Q34ErH+3qgIWwfv3RjyDriirWjiFJrPuAVZ6sFA7oZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxUtEinOn9q/lorxDlWLnpQSRebUH+9Mz+2DnLS6snfnXI2e28P
 O45U/KUDPxpC5RMBudaEXfaxeICYMgfL87qJQdvfRv0DgHtwjMiuRiyhqM8CEc9Z8Ng=
X-Gm-Gg: ASbGnct4v3ncqci8VRuuRU35Q7Klby2jt3YWdQOyymlX7bp2Z22NvCs+WEMoZm22j7j
 gKW9CmI6RsuHTiDf46PfSvgh/Mav8R3MVDhZ6ngmotwYR61z6Mo7n76knRQ/mlaL1upHcpQcDcy
 NlewOCmSOUaffOJw8NvWQmeEpIm71g3AU/Jm2tkFAaGQp4D6zPNPhhZLV5sCqiLhDxjSQM+2/My
 U6NVFbWMMOInDBR9/6JfVIg8pDw/aV1dq0rO6xHBbxCzxV70CbHXL0UnGPboMOufCyAWn2nFdJZ
 QalBtkN2cBebCrlj2taFEUpoT+kW+Zj1E9Bb6oq8oCzqdY/QGwnUWoNmFo+aDvTP4FkWR0RSyRE
 0c1ruW/kEBVgWWxTN8EsFZ/BSz1zfQpwbop30NKR+cfUA3l1MiuFxZGoJ8AG8mg4IXVI7/e21Ev
 TI4fOfzEKvMpfzONhVZLdlcXqcIQW8HEQ=
X-Google-Smtp-Source: AGHT+IFPH5bNTpMjVvNRN26DifPNLAFoSeAoicHRC1HEEH9oRvExzs+S4YeuHSGoOiaUNTFghFYSSQ==
X-Received: by 2002:a05:600c:358e:b0:468:9798:1b4d with SMTP id
 5b1f17b1804b1-46e329d1b47mr30509265e9.7.1758790900027; 
 Thu, 25 Sep 2025 02:01:40 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb7203b8asm2128929f8f.9.2025.09.25.02.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 02:01:39 -0700 (PDT)
Message-ID: <14df3870-6cb1-4e5d-9c4d-bb8acef8c594@linaro.org>
Date: Thu, 25 Sep 2025 10:01:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Taniya Das <quic_tdas@quicinc.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
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
 <20250924-knp-mmclk-v1-3-d7ea96b4784a@oss.qualcomm.com>
 <4315205b-5320-4a8f-a707-45f5eb35ae51@linaro.org>
 <8c558ac3-541b-47c4-be4b-c9101997de7c@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8c558ac3-541b-47c4-be4b-c9101997de7c@quicinc.com>
Cc: devicetree@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 3/9] dt-bindings: clock: qcom: Add support
 for CAMCC for Kaanapali
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

On 25/09/2025 09:46, Taniya Das wrote:
>> BIST == Built In Self Test ?
>>
>> Can this not just be put into one camcc header ?
> These are two different clock controllers CAMCC and CAM_BIST_MCLK they
> should not be in the same header.

BIST means Built In Self Test ?

Is this really something to be upstreamed ?

---
bod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
