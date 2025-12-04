Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC30CA2909
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Dec 2025 07:49:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE23CC5F1FC;
	Thu,  4 Dec 2025 06:49:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B16DCC3F95E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 06:49:40 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B468ZsG644099
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 4 Dec 2025 06:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JmxQysCR134n2X2yxpyzNPSzsppqGu72HHKjpEfLnis=; b=nEbNRvz3p6bWvbuz
 zIVmKDC76NjnOBKZIurOuqhCfda/Ts78YN8JAzPecRnMrO8cFPPf2Pwy6K8iqK6K
 VhVop6n2h4dfB7Fe9lSnPJlfJdxeiukr9mxMniq2djLwY5C62SPIyKIvAVTJ6Vwt
 DNEDrUw/Oj/KMQaqhMp1n9vModfHFXj/DgQIyfvJtnzGlG+BP1Y3PlmcnoQyWNNZ
 EPrQ5KDidEL/mE39n/kHwWw86JH2wB637uGrLj8evMf7DYDrRjSTJ3gNUr9d819Y
 53fapIOGp4InouwBBNhbmJsXuWQtulYCID9Flug3jcRE1fxfqsbsKKuNsc74Nsib
 d3Sodg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atsar2499-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Dec 2025 06:49:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-299d221b749so11807835ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Dec 2025 22:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764830978; x=1765435778;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JmxQysCR134n2X2yxpyzNPSzsppqGu72HHKjpEfLnis=;
 b=DiTDPz/9ojbF/1XM8ywaHHEELCZPGvMWRCbEHxm9iD3QHeDHnpoVWbt9efG3g11hrt
 MlDCcMtf3Wpiql5eiwiop843qFwZzfFNI0YIRIwoMON78lHoxUSWGH6ZGLS509ix7Dfl
 GZXQmsxNxGMG6cctXC2JkURaGGfAJiZ3WupEwYt6qk99MG5AAxjWXS71+3yQ5BR0TXhn
 pHMuHyKX6+K2e0PC8pC3J83v65iSRboGv3i3UYrYTvgpNGBoWv6svvcpM3LDukPmQicY
 d22YdshEJJXmY8KclFK5vDn1ousd3YixxVkWNDO3fNBzkfrac+8ChZcyB4ewHjVUgLc7
 /Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764830978; x=1765435778;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JmxQysCR134n2X2yxpyzNPSzsppqGu72HHKjpEfLnis=;
 b=SYfOQyPayQ4HWXwYIqHxmmHeerLFGWdKMEtgqlmw4IBLtbHa4zqV40HuLSBDC+wdZ/
 3TY6C885nNbTblDG+cxZkThg0ykmjK1A4gXOoxnJDFbtAG+j7pdl1ZjMm91QIj3S9vcD
 BUU6LO8TREUj8anx3L0/vPWpmVPJJfEIrxhPTDR+lWiBTp0+A/HKuZTBjwctHx9Oi/a9
 bpOQ49006ezBO/xX7G4zBjajjobipjpIfEhbPSg/a8LR7oDaQREdTE8MwaS4fw5SfqUZ
 rhd527cGAuKQpkwuaHFCiizYchmOj2FP5gV6YYeqnBaP9LIpmTdgjtQvoFCEb7CiNYEw
 tCCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+kZpH/gr6v+NBp8pKSFtyb96ZOJn/jybGIhfpzGe2oZ4/CNxDD7ZkaSTsCDRKqoPz4iUcCiOVKP/zQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzLhR+2SHRW61kPQoqr0qEDnAdy6qmo1y6IP0lynjrnnL5DYKcK
 OlkY/8ylqp5rht9zf0ojLmZwC7kvgIYjvIZBRXtGDpXcArJ9YsGRhy2Y+nOe5/S59DY0S+lJvRZ
 wuHQQls1dHPHVQgklBIHGMJiuUqs6070C44j/hY78UMqH9M95oUrTg46UmPlUCVAiqFweRF1fyf
 yI/bUM0kc=
X-Gm-Gg: ASbGncuUv312wSz8Q12Y1i8qbdiGMpcmH6phhBX5pX/ShwcSRmg5SAgz6mU89OIXKK7
 RLXFTw5YzUoAgyKAplNOW9Wd98HpeXA3pnwDGtvjT+HrRLo19P3iA47q/z9Vf8pZaAgzGk7DwYW
 B72fIOW9bvSMYvtUYyrluwCnbUqzfPihvlnnn4Xny4QxKlXuNIOBm+LvgwVL3g88CkBMszBahfk
 8yiCtEW0QHaBJyqrgJ+62eZLrgvYmSR7SzyKSAnXgmNpVBpLWkbABmTsJRq2zcMlgJL2YPJIZra
 tpG1ITziNaCdYRWY83Diz23iTHsRWJMX1ck8MNyZC/oMKGElBaLHWritjxgyyr8iqHl7/M1+qPx
 LzxfOp57lc8rC928PCLm8dIFEfxY9eu8QlDq+jw==
X-Received: by 2002:a17:903:3504:b0:297:df4e:fdd5 with SMTP id
 d9443c01a7336-29d68374edcmr58468425ad.23.1764830977703; 
 Wed, 03 Dec 2025 22:49:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgbdk7irsBvw1LZJUA0OWs78tPE68m1BrsOGzvi1/Vkcfye2t+5+TQ2h6idk9qPOk7MkUtEg==
X-Received: by 2002:a17:903:3504:b0:297:df4e:fdd5 with SMTP id
 d9443c01a7336-29d68374edcmr58467915ad.23.1764830976979; 
 Wed, 03 Dec 2025 22:49:36 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29daeaac16fsm8526875ad.87.2025.12.03.22.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 22:49:36 -0800 (PST)
Message-ID: <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 12:19:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251126-elated-stoic-scorpion-25b630@kuoka>
X-Proofpoint-ORIG-GUID: cGBKVtVwg3YUUYlzbeJGajvHjqH8DuGN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1MyBTYWx0ZWRfX8pEcmNdoYQ+v
 PnBPXDKcN6u4vgrXXaN4FZ1pNSOzib7wKMtupz8p8LTUD3LNtbA0ONSXjy9m5bz0ZGOhyAAeGyT
 fEF1w/k1PvZ5IG3w2Ky0bMktvnDzQQSy53iGHOQ/2IMiE9FEQl5TkTjQoLS4P7n5paYfTFhvYM/
 HFNMl/nGKOufyGvJiTxSh7yhWUO0FnBzsYmpj8trrTp3qH85NeyOhDN5z/A3mhIreeVzLxXtuB6
 Y/AzJK2c0wYBD84K0ypbkqnBt05BKwOK3P4UnHVRqIXzoCODRxIFIanC28AR+7e27e3nqXrGFIM
 7EM6j9V8DaVN32LnNdybVFzwLpqN4ZplXj5MDrXvd5Nljccj+z8CZ7PiSeS8m4ty4lSTsSHWiWd
 w7opntJXQgSLV598ZSXmOlYk13c6GQ==
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=69312f02 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=llZtH8EMZHlCI_xCz4EA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cGBKVtVwg3YUUYlzbeJGajvHjqH8DuGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040053
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 07/11] dt-bindings: clock: qcom:
 document the Kaanapali GPU Clock Controller
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



On 11/26/2025 3:05 PM, Krzysztof Kozlowski wrote:
> On Tue, Nov 25, 2025 at 11:15:16PM +0530, Taniya Das wrote:
>> Add bindings documentation for the Kaanapali Graphics Clock and Graphics
>> power domain Controller.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 63 ++++++++++++++++++++++
>>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
>>  include/dt-bindings/clock/qcom,kaanapali-gpucc.h   | 47 ++++++++++++++++
>>  .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    | 12 +++++
>>  4 files changed, 124 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..31398aec839d88007c9f1de7e1a248beae826640
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
>> @@ -0,0 +1,63 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,kaanapali-gxclkctl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Graphics power domain Controller on Kaanapali
> 
> "Power Domain"
> 

will fix in the next patch.

>> +
>> +maintainers:
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm graphics power domain control module provides the power
>> +  domains on Qualcomm SoCs. This module exposes the GDSC power domain
>> +  which helps the recovery of Graphics subsystem.
>> +
>> +  See also::
> 
> Just one ':'
> 

My bad, will fix it in the next series.


>> +    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,kaanapali-gxclkctl
>> +
>> +  power-domains:
>> +    description:
>> +      Power domains required for the clock controller to operate
>> +    items:
>> +      - description: GFX power domain
>> +      - description: GMXC power domain
>> +      - description: GPUCC(CX) power domain
>> +
>> +  '#power-domain-cells':
> 
> Power domain controllers do not belong to clocks, so this is:
> 1. Misplaced - wrong folder
> 2. Probably wrongly named. gxclkctl sounds like clock controller, but
> this is domain controller?
> 

The GFXCLKCTL is actually a clock controller which has PLLs, clocks and
Power domains (GDSC), but the requirement here is to use the GDSC from
the clock controller to recover the GPU firmware in case of any
failure/hangs. The rest of the resources of the clock controller are
being used by the firmware of GPU. The GDSC is a clock controller
resource and modeled from the clock controller drivers across chipsets.

>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - power-domains
>> +  - '#power-domain-cells'
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clock-controller@3d68024 {
>> +            compatible = "qcom,kaanapali-gxclkctl";
>> +            reg = <0 0x3d68024 0x0 0x8>;
> 
> Keep consistent hex, so first 0 -> 0x0.

Sure, will fix this.

> But the problem is that you defined a device for two registers,
> basically one domain. I have doubts now whether this is complete and
> real device.
> 

As the Linux GPU driver requires only the GDSC, I have mapped the region
which is required by the clock controller driver. If required, the
entire region can be mapped as well.

>> +            power-domains = <&rpmhpd RPMHPD_GFX>,
>> +                            <&rpmhpd RPMHPD_GMXC>,
>> +                            <&gpucc 0>;
>> +            #power-domain-cells = <1>;
> 
> And cells 1 makes no sense in such case.
> 

We would like to leverage the existing common clock driver(GDSC) code to
register the power-domains and also maintain uniformity across chipsets
and consistency in consumer GDSC phandle usage.


-- 
Thanks,
Taniya Das

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
