Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB7F7F5E7C
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 12:57:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDB05C6B476;
	Thu, 23 Nov 2023 11:57:49 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92043C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 11:57:48 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-507a5f2193bso833148e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 03:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700740668; x=1701345468;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GQKfSQzvl6n50M4875CnD5xT+T/rNm01RbmwONA33QU=;
 b=iApPfr/MowJ2rxsnkvGa/Jw75r3TEVz1dCmXoOt521bK2bGvr65v0VHtslnjJD1H8a
 FcXNlSt4nsvD870PZjCLEU7PtCrB2qLbOa7iJfshB/R83Z4SVpR8uCvq6BK6gVacyBeh
 k7PnqmZBpxYOVLGtBVMa1lEJvUpUeBPw41ZPL7DRq/gFo/hc7rpF7Gh+f/we7nUkoejz
 cEFCymXpTFm7i9iYr6DWpeUpfF9JIWyKxi4py7miYKLqc9MKAwoblOwW1zvY7YT2o6wz
 /XosCvXqk4ePSjFHKF7F1ghAXbYSkEJjqeCHybUcncaHEPrmb+Wj6mDXCPJlghgLU4Ex
 6E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700740668; x=1701345468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GQKfSQzvl6n50M4875CnD5xT+T/rNm01RbmwONA33QU=;
 b=ZQ0eCKlUACZZhH1XEm7hPCw61W3a7jxNCX+qWmdp5o2Knsbyp+rDe0AbnJ+LqCLlOu
 w9TIo/cLNdhcUtutc8aKc3d9NGd6VsLCfLcAoEk34uGKtEhao5LcuSSK8np1h+h7bbmw
 We2A4OIBxPiYr0gBkgpy2c34PMyOyiNtGY8efB6wBs1wNyajJ/mh1nEviLihfT3jQ/fC
 lUCOByg6qhEmdfFqWSHsliajWogjT3U5JA7Me4/6+49w4Q3WCE8Zyamr6kJDpWu0d/Sy
 /XmAQjwfEZ2zmvWB6reRPsrv2rQnzYMamFIHp4oFpBLNqRiNEo/9yFX895j9HA1uLoeH
 uL0A==
X-Gm-Message-State: AOJu0YwMge77GSCzENEOPRLo8WvSVm6BMxl+tKPPFBcJMGPc/GQ98TFy
 j/A7jj9SCzW491ul/kuQZ224vw==
X-Google-Smtp-Source: AGHT+IE+19JiYtimOS/PBEDLWjSlimik3++amKqAhSSo37eVU9RxdRbmAlBsZzwdcxUkAGtJ0DjG8g==
X-Received: by 2002:a05:6512:3710:b0:507:9b69:6028 with SMTP id
 z16-20020a056512371000b005079b696028mr738559lfr.24.1700740667712; 
 Thu, 23 Nov 2023 03:57:47 -0800 (PST)
Received: from [172.30.204.221] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 w28-20020a05651204dc00b0050a71f99960sm167359lfq.197.2023.11.23.03.57.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:57:47 -0800 (PST)
Message-ID: <1846a5c7-da25-4cc8-992a-3898bbf403d5@linaro.org>
Date: Thu, 23 Nov 2023 12:57:45 +0100
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



On 11/23/23 12:53, Suraj Jaiswal wrote:
> Suraj Jaiswal (3):
>    dt-bindings: net: qcom,ethqos: add binding doc for fault IRQ for
>      sa8775p
>    arm64: dts: qcom: sa8775p: enable Fault IRQ
>    net: stmmac: Add driver support for DWMAC5 fault IRQ Support
You resent this series 15 minutes after the last submission,
with no changelog, with no increased revision number and no explanations.

Please refer to the following documents:

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html
[2] https://b4.docs.kernel.org/

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
