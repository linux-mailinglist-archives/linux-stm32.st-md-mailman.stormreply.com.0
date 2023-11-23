Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1437F5E82
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 12:57:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A4CDC6B476;
	Thu, 23 Nov 2023 11:57:58 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FA60C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 11:57:56 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-507ad511315so1055254e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 03:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700740675; x=1701345475;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1PIIYPDZcaUUtbo5ldUSpIo3Jpbx+2SXqPzhdvBEuU0=;
 b=p3drBN+Q0YiBtdfLGIYp7wpZ4V/m5uXnHJP6gg4usI15loLxgYFzm+qzTN/e2vbLmo
 PiCFkxiBiXZWWT24nczwBMuRIk7bkVpPCj4zW5L1bv+242WE/781M3KgeddZ1AmAfKWs
 e7kh+2V3q6eCREe0r6OrDIwSsDxg1mNO2ZvHvw9wWZBq6qCAODW2EVe8PGqLstVV3VyE
 NpWQX6gXk1qWi1+0iQG04jy9+MuGs/+M6SaIqkdu9DO3GImY6q9Xvu5fUMPF4oXUOK9o
 +8BQkWz3IrWsJykoziobdn8bD6JOYVU2SZwE5IUiM4V1JjnpVIMsAC30O8GLUoB0UOTj
 iAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700740675; x=1701345475;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1PIIYPDZcaUUtbo5ldUSpIo3Jpbx+2SXqPzhdvBEuU0=;
 b=cnqrbvdfHg3MOxA3FQ0DzvuhSx612+xHHLDbfawklgagAH5OoRbJA75ac7BjLYFurx
 Umb2aAyEBtLyDufa4UB12zDpBkiPGzezHaTJ/VhfbZUiBBOt8cL+BR2RtXBPVbslTv2W
 3Xnagd3ABhGPDCr4KWjeXpKBV1bjg8nGMvtEtcbpBWCfXCuf+TIdOM1IKdz+CmMkEDET
 1UhoiLoQ9cvx1PCjQbgrwdKEmTG2edkGRKSf056vjYfZA8RtyzI4L2wYtZrHiKZpVKmk
 yTXR48X3499lgmQVtfMbpk+6eATzo9oMuwBKSV5qrhtoTDSfWwJ+KkcvXKkc4h+Iflbp
 CgQQ==
X-Gm-Message-State: AOJu0YzAEEyVrh5Ii3FjSAdUZnIljjsoLm9gXRBUdTEzbwKe5EdUYQEe
 l2Rwi4B+HvGbBNaqOnAYVN3FnA==
X-Google-Smtp-Source: AGHT+IHEzwFsSiUrHxerkzp2AE6ef97hiVMKuGwN8td7j6ph1CSPFLbE8yWNAIQwxbq6Fe3tMk0EHw==
X-Received: by 2002:a05:6512:3d0a:b0:50a:aa30:f9d7 with SMTP id
 d10-20020a0565123d0a00b0050aaa30f9d7mr4942548lfv.67.1700740675512; 
 Thu, 23 Nov 2023 03:57:55 -0800 (PST)
Received: from [172.30.204.221] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 w28-20020a05651204dc00b0050a71f99960sm167359lfq.197.2023.11.23.03.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:57:55 -0800 (PST)
Message-ID: <3cb4834f-18c0-43d6-8c81-5689df7b1d60@linaro.org>
Date: Thu, 23 Nov 2023 12:57:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>
References: <cover.1700737841.git.quic_jsuraj@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <cover.1700737841.git.quic_jsuraj@quicinc.com>
Cc: kernel@quicinc.com
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/3] Ethernet DWMAC5 fault IRQ
	support
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



On 11/23/23 12:38, Suraj Jaiswal wrote:
> Suraj Jaiswal (3):
>    dt-bindings: net: qcom,ethqos: add binding doc for fault IRQ for
>      sa8775p
>    arm64: dts: qcom: sa8775p: enable Fault IRQ
>    net: stmmac: Add driver support for DWMAC5 fault IRQ Support
Missing cover letter with explanations/an abstract

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
