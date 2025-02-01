Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDF5A24A09
	for <lists+linux-stm32@lfdr.de>; Sat,  1 Feb 2025 16:48:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2ECBBC7802F;
	Sat,  1 Feb 2025 15:48:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F3BBC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Feb 2025 15:48:31 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 511ENibJ001918
 for <linux-stm32@st-md-mailman.stormreply.com>; Sat, 1 Feb 2025 15:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8n2dQUsAQR8BGbcIRrC/eRUMfmfG1kg18Uqsc42/YA4=; b=Bt428S+3uxH+vEzk
 tnDluDLTVPQSs6ciBolYDkA7uHbbln9oqYOG57YImHkpp5ZMl0letkUDsP/aA7q1
 +4zexevqo/jQRGjiTXd/TwV2XHBkO6VQAYP66XLS+JbTc7QJEvjsHI/fqRuLT5ko
 5SoZO4pbhbCOpqjWnSZ6u7VcxE0jfnGnQbSwntG+h81k4saZ3Gzi1VYMbjw37+uC
 W9KapccKfQZ+KguK95pnyNCX2DgSq50Fa+z2a5yPt5QK4FvsfuL1S42I8YDKj3cp
 8ziqcu38WFZf5AZjyljX+qjL5ndVD6BqWaZF1SGTL41eVf6tAQSbl1NdarzHlQf3
 c3ri6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd6s12vw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 01 Feb 2025 15:48:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7b704c982eeso27604585a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 01 Feb 2025 07:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738424909; x=1739029709;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8n2dQUsAQR8BGbcIRrC/eRUMfmfG1kg18Uqsc42/YA4=;
 b=ENdzerT0lCOeQwudfAfLcsRsDGLB/66F3mpMaP7EmhDxRWq9zfqWbGhEMrug8jzcnq
 gLTXi4l30RuGM1OlCDJoRfaMtSIPyXcQU8KwPDwqWsg/tKLBkTrBzeHACd0TvPnphNJI
 toRPwagEm9sMdStQsviwBtVmV3WM0yR4SBkAbxd1dS2wDy0xhYaI6dN7g/OjtZpkbqfD
 0YOvXUpd48Jy0j6KzkTu/RK7Cn9VwndtHTQj+nZs5W/JBjGUMuO7i6SR4pQgq1u3utKL
 PPOIQUOPRDMb+da9d/OkowMBTz8OhIuPg4wxouLYgrJwck4t2Xb6yf8X8UiRDifXl2hG
 J1+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXreBmFDxMygjwMQcEYHW3ZG5i3abj7kgm4T3TEXLpLztNe7defjFhBhcUzs2cJzt71ny5ayVtAe/OA6Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzF3fhJpoa8Tr5sLbYCZjR9+RsfKUFeJ81mnYPCotjZFSzGVVRN
 RUCWdV/2L2zpjtFkkOUw9HLsNycXlB2L46h8znWDVgiwWtaWu+aV1hqI5RYHfxXSehXINpvPxgB
 VOsUjGGzVaa7BhC5PGA4NL7RZghp5NER6lk941PIzxj24WlAYMg+Hp6erROyq8qdRH1/aMcLMVh
 LsYhY=
X-Gm-Gg: ASbGnctQAbAZ3G4p1iHKK8KYDynuJIZxzUJsZ6ql5ESAYJnAeH0qXlrTlWmK8x/xqt9
 1/HkXfp4NHP2DyVBLMg8PEU/RJ/WSjBuhwMMRAx/gV1+jqHsiGX4/04IG1YgZkOHG+x3hDjLB76
 7amlyQC3a+gdaRSyfIgCTxRQkpIMKO60Yq7JJtz8wXiR4tfpqIDg7L/ec5PFxkpJwpU5tEe9kSl
 +zwLnauWSd2tD47i0K8fwBCakOxx6mp8Swwuc8UCmHWUobiJfp/Vi+Ko52HjJaODB9aqLJ6ja+q
 2TqIHv4VKEFe41M6vOy30bxzDBnehGAynb0EQdk+IC8wM5V/kOHepsL5Kk8=
X-Received: by 2002:a05:620a:44ce:b0:7be:5020:6df1 with SMTP id
 af79cd13be357-7c009b93599mr574151785a.15.1738424909323; 
 Sat, 01 Feb 2025 07:48:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxPpR9kTBzdbY+SmZntvSpbA0AmhKdf4LITbXaMdP95XvejXet1vO1PHrcj+dARpvQVLwZIw==
X-Received: by 2002:a05:620a:44ce:b0:7be:5020:6df1 with SMTP id
 af79cd13be357-7c009b93599mr574149185a.15.1738424908921; 
 Sat, 01 Feb 2025 07:48:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e49ff269sm453716666b.118.2025.02.01.07.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Feb 2025 07:48:28 -0800 (PST)
Message-ID: <30a82d74-a199-4ccf-997b-b8a6971cf973@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 16:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yijie Yang <quic_yijiyang@quicinc.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-3-fa4496950d8a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250121-dts_qcs615-v3-3-fa4496950d8a@quicinc.com>
X-Proofpoint-ORIG-GUID: 6W6SdSX6U8wMsGsIJIgRbYE6oUcxg30T
X-Proofpoint-GUID: 6W6SdSX6U8wMsGsIJIgRbYE6oUcxg30T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=583 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502010137
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/4] arm64: dts: qcom: qcs615: add
	ethernet node
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

On 21.01.2025 8:54 AM, Yijie Yang wrote:
> Add an ethernet controller node for QCS615 SoC to enable ethernet
> functionality.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
