Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A414BA183E
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Sep 2025 23:20:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08678C36B3C;
	Thu, 25 Sep 2025 21:20:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6E93C36B2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 21:20:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPnqC027798
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 25 Sep 2025 21:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MNWENP4TW6FfVNRa3Q4FonUZ
 vk/5CHP1DhoTM0WHlGU=; b=ncHx4GVXQYg6MMTCJ7RYXegpCgTcsQFO1PK2sWkd
 mdL+P05vzuo37QgxtWCzzjikvqfRIbzHDBPK0ez5c46VeFHhwz7tzQ00lD0zRCDM
 6DWYi0TmadbPFFIfDdo0O6Z7RL7udFzvm+hF+04cD1yL4uY5ez4uY2kW475XsnPF
 VSDF673dU2WEOcAl+v5CXgx523H6ACDBNMghyE+5idEDNK0MmUPSrrIrXewH3s7h
 VRxwnx6B61lB4j/f03MpkZCK2HL3bKA1fX7lN4hoDrufJ/SzHv9Qe3g94hySXbIR
 9jkzrczffUacIFjInqYrqkaby4P9/hURvoHJSDHISC8cvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0e6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 21:20:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4cce66e91e3so47272731cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Sep 2025 14:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758835246; x=1759440046;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MNWENP4TW6FfVNRa3Q4FonUZvk/5CHP1DhoTM0WHlGU=;
 b=T8MxS8ooko9joTotjb4GwyuZNdulmlJ0c2UgmhDl+gtWCAaNzCqKtgLWhfhhj3yZbt
 H3r8fENOb+edmmbzHR3g8xkoNrbcRsxXujLyHbZB9QyVvRP5k7ikPVJumoT9q21aW0Yh
 NBFXZaBu52QMGES9EPxeeM1AnusEcvoOfR5Vd1xQ5CCNAvHvK9UZj+J1PVPzW7oPlsal
 cSS3IzCUKkveanqV4aa43gn5ZLBzeykESY1LTtq9ZxJrPWopSwl2nfRAfOVoQw/f/uuE
 6PKOjaDQ/vGq5gZXQWlFCbWdJIPMjoMmuWWbsXl+YlEGjn36JLnl6oW5caCN+jpyzoSg
 CNFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX10PfKXn2dblDIuI2Outwp9CMmtGrxBP+jroZwPwNh9rPh/kYoxTEdQEDNcZjMRLZ9nCEVGeSCYIrYw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzeCaaB7C3kPcmAHh9avk7FkdNW5RDqeA/lhSzF0fuKIZxkLpaL
 i9dDSxAAO9FIEgkIBxZKaS2Laf6PjOFD6UOWfrVPNBEl0HhJkSKrAG7fdiaq3Gmb1su70AY7zax
 DqXxZHai0dyg4eC2i6f1ySors1qX08InuZ9sUbqQEvUB3P9J4fornhc0KhgdMrmidsrVOiWwzdC
 l0v1rOC58=
X-Gm-Gg: ASbGncuv8h5AwoGMbBDIJT7qJgxi9iFZ98Igm1cu5/Jo6Sx7tU5ikhCtsg5HH98MyXC
 XZ9VPL4g3Zsu0R3x9fW9VsF5ymQ5paCMIH+vd5QD2A036t89sV4ZkzFGoMZaQWkfB05yQjy5pjY
 SPvlVUhVpzlWslqxvy4gsG4vJfkL0zHtmGdPcbH1v9JKn6ItOAs9A8nuPO3VXK87LqCXThurRxF
 k1Jg3dmEmVfxIyCYOefmNnr2CFkc6h4K43JddU8NzrWGrZv8IAqNyGUE94jW8MyY/CON4Yyb0Ev
 qr6LfJf00suyxoPs2K+skvmt6K8QRRmGQnGLoT5j6Hm0/wp4ijRE60fLeQpLnPTtHog0O6B4+k3
 uHAdw0nk1FcIs0VfwBBoVTdyBylbIRFas7fhZb1GkhUmXrc35UfKj
X-Received: by 2002:ac8:5852:0:b0:4c0:9328:18d1 with SMTP id
 d75a77b69052e-4da4cd4705emr60742361cf.62.1758835246275; 
 Thu, 25 Sep 2025 14:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1zqTH59YzrLbgWLCbgeEbMpGPbOhNPJ4n+cnP8cXc6+u2Aei7sqWMXJ8qxBaawt/sIexYRQ==
X-Received: by 2002:ac8:5852:0:b0:4c0:9328:18d1 with SMTP id
 d75a77b69052e-4da4cd4705emr60742011cf.62.1758835245791; 
 Thu, 25 Sep 2025 14:20:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58316a3102asm1122425e87.97.2025.09.25.14.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 14:20:44 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:20:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Message-ID: <34esqueoush5gnawnzl7hmnpwr77vip2iqf2w7eiac7jqyghvl@nquuefkyjive>
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXzpvYmrqBFGaM
 dvVQN/yO7JuZaV5r5Nw4uKclm3VEdI75C7tzx18JX/8jiFlHaobqaaADK9leYB03IQAvJ3b8uR7
 RQ/bZRHox5/ZGsovFWxJI4MUQ0dtX11+mgdbb9HnOW9R3oFcztfdCKQhq5yCEmDShCC83p3b4IY
 qMR4zSTutp7sUa0grPq1jmPhUP0nk2OcCXQ/2EEuAJJRO3tYWe1C9uvPUiJx5DJdK2nDM4dY/u4
 kUGxJMyfeYyzhjtjdeA+SzTQCbFZH9tDSPrWG5cmlOtJxmcC8vi03qilcwG+fdbu+KAgi/RyPBZ
 6FmcJh9+eO6H0OapLGN03K5nNf0FLjolf7Ik29vqBstnVWyv7ZnxOijBUXTBX1V1EpZIEjB/x+Z
 Fgxy5RqGlNzMkC9r47F1H4pUJ0Ng0Q==
X-Proofpoint-GUID: Ks3bMt2M0dd7gY22cBAjUuwPRQjWwM86
X-Proofpoint-ORIG-GUID: Ks3bMt2M0dd7gY22cBAjUuwPRQjWwM86
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d5b22f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=awjpS8ss-hU3v18DcjkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, yijie.yang@oss.qualcomm.com,
 Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, aiqun.yu@oss.qualcomm.com,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 trilok.soni@oss.qualcomm.com
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: clock: sm8450-camcc:
 Remove sc8280xp camcc to from sm8450 camcc
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

On Wed, Sep 24, 2025 at 04:56:43PM -0700, Jingyi Wang wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
> which now supports both MMCX and MXC power domains. Hence move SC8280XP
> camcc from SM8450.

The commit message needs to be change to describe this change instead of
the generic facts about SC8280XP and SM8450.

> 
> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index c1e06f39431e..dbfcc399f10b 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -63,7 +63,6 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - qcom,sc8280xp-camcc
>                - qcom,sm8450-camcc
>                - qcom,sm8550-camcc
>      then:
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
