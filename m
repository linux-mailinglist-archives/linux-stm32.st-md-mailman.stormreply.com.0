Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F8CCC7CDA
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Dec 2025 14:23:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AB40C01FBF;
	Wed, 17 Dec 2025 13:23:07 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E95F9C01E77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 13:23:05 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BHCL5lH3330428
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 17 Dec 2025 13:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bs68MhyXjy7fggb+VYhXusf+j0KV8hvgnqpT+o0xydA=; b=Vh0VhrlRe+qfdspW
 Ke+P6MKuPj3SkYIbkzCss2knZCvJ57jGNEOImc+7DLIZBSqgdy6B+Mc+Y/e7KFZb
 DLhGjmiNDw+C8qqyuLVK2qnURttWKh09KVZ8UYJUnbkPqYpogVFNGzYZbnJMLRDc
 cyaynSEmqSHXVokaJM1+xzD43eYtRdRAlMK4YZwT9nSTCtdCDUrEll+kEUorsTH1
 NhnzXfiPNRGo41vXulp88CmIMK6wd/ASjDkk2huGxpgn/NXXVS8OCfATGfwic4sG
 /7pjJUPg1vm24XLtan8VSK92c/DlxLcYHiqmuRCkgfud/IZoWQxVPILZozhugJZR
 hZ/74Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkhjmv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 13:23:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee07f794fcso17015371cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 05:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765977784; x=1766582584;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bs68MhyXjy7fggb+VYhXusf+j0KV8hvgnqpT+o0xydA=;
 b=c2rEw7DhB5jSkquE3475XUgmEo4Z/Bx3Ib+x4JnCZBL6YcoOCLNEkvFbhiBuY/7OQT
 H3d7NSztBQNGwdOJHtFV96ioxUWt1FjX9ZhBe2byhdVA3EUgn50SRrb29g0HeNguS9wG
 4A6jWsNdq8LktDxQDCya3QJxffZInvw8CJnpH3BNIkOgDj2q/vSeYBDdh2BKai1X8Hc+
 CdwR+x+hSpCq38QQjNW+80iCpoOFMzmIiHOuIcwMoAXAhtk1eD6kjr/1dC/WpE83AHH7
 xAuOu+DKrUNEqMaCTz+26FPnbY0Isdzg+2GqhT11OaCC2Y8kvLR3J3zOHlQwU86oUzHl
 UbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765977784; x=1766582584;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bs68MhyXjy7fggb+VYhXusf+j0KV8hvgnqpT+o0xydA=;
 b=s8urEUPbhPJ+teCdDkXAFkD72Bn9T65TgAWd9id90KiPjrhxrWvXutmN6HnM3Rfnq4
 jbia3AA0OKt8bRdPqmqcKCWaK/g2ISYNvnyXywx0TCVJ1eEAK2FwTalM9lz/cIwpb9Px
 Chl4Y7zalXg0hK5h0HI/T2gDdsd5BOJJmFS0U57Y2Enoyb5JS/47BVAFri/+JFsnZuyT
 L5/ZdKhciibatiehP/hEzeen0heKy/IeR0cbEokjMe3rlZb4WJLqpYUwNb1eOi/CDQuV
 ob61Evc2uSJCn9+KsmN8pSShLbzDBXU8RKDrpDe21wD8hYv+PY4hjUbUJrjXi2hJ3jnC
 uzoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYScZcDmCBzGhcSB91NEWYKLpasJ18iPz9lG9RHZYIpNsgraoQg8/HKGtO657eNfdxQM5Migt/ghjHRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwXDVfbN9SuiFN4kYtH15Lu/lw67meatxYu5ojIRWidd16jFVfR
 Cm48t2NT8sZCXIRnXYu5CYm3nxc2TNTQXU41wYyo+2sRCXHzf+NOa+5KhjlNTKAfODsdcKew5p6
 jiliclbQI9ffEo2jTnUM+HyypkY4dMJQOnwSX1npILbIhcOorPRE2wfOOoA35/YDu2FZt7l8jZN
 m+jg0WEQw=
X-Gm-Gg: AY/fxX6hTH4xM15rgGxIJsED2oZV3BGLNoQtAkWZ8P/aR4wnRdkYMkKpQMr5fH4K09I
 BYd/VHO3KTQuhehN2+dDGkIEacZJPcB1a/MwHHW7yAudG7bNUPLslualJgda0TGS/2sWz+kt87Q
 wUenjUxsTfHKz75WIsWB1GfXGPe54PifoEvG1A6M5HzQi+WHChpfW1yyB9XqF57z1SC5GdP6hfH
 5P4NnoCNnXUGCc7zZlDDNtLMhLJawLoQBU6Stvc2JUGZfsRkwP8i5W6C+BfC7vaihyqUdNFTq6u
 5dhKNsrUmLTWAj9ICBn4tlZv4QwkbyjveuIJPMwCGf0Ih1kEQhLhQXst6CQmP/J0dSoje+nG73P
 4mbp+HoUCMgb2sIh0dM6zzvJ+aBliO6X2rVwpJt4Qlrw1x38ZJSB2zs5IvRKXd1zKSg==
X-Received: by 2002:a05:622a:4b:b0:4ee:2638:ea2 with SMTP id
 d75a77b69052e-4f1d05fc5acmr193029251cf.9.1765977783912; 
 Wed, 17 Dec 2025 05:23:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpn5aLn1iOCruV7FBHk9VV/Ny6pCd5cdcHqaZz8vOqqKcrW2tjqlTPVxasp9W9wjhhdHf/Rw==
X-Received: by 2002:a05:622a:4b:b0:4ee:2638:ea2 with SMTP id
 d75a77b69052e-4f1d05fc5acmr193028721cf.9.1765977783290; 
 Wed, 17 Dec 2025 05:23:03 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa29eb76sm1969402266b.12.2025.12.17.05.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 05:23:02 -0800 (PST)
Message-ID: <ed17edd9-fd96-4562-a3dc-45cf7185f66a@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-11-fb44e78f300b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251125-kaanapali-mmcc-v2-v2-11-fb44e78f300b@oss.qualcomm.com>
X-Proofpoint-GUID: RXHbfz391WsEcZJZTLPzQOgHqJsdKHKS
X-Proofpoint-ORIG-GUID: RXHbfz391WsEcZJZTLPzQOgHqJsdKHKS
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=6942aeb8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=91OgtvA7_0Jf-gwRHFQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMyBTYWx0ZWRfXwfBrKpcN6x+w
 U8RLZJoHyP0Bn3VwnKdXwXMLob3DrubWnRGMspUTIkms+my0MYfOf+XmahnbHzqBrpMkyW8JMXH
 fLhPp0O6Y6yEB6IXx0RYXw7sfr9U3XsippDfurmDV0bi/5e58LAVbydceGFk6EBnH/0G25J4q95
 aCUHXnlKKSULxftromaZuSn9GGv6pZAXw0XuUAV6+30m9s2odg1wA/DXh9ssJV6xtUgHpzwT91Q
 6URK9m+ldF5JMBB4kcoWOG+WoETnFbkblQ8VDM7FYeZOoEJnJImM0tA5kiC13oBNYnRkteHuE/b
 ro/3Fi4W98P5bYgNcKZ4OXyLOc99qes0DDGC0jIzhMmZaZtUFEpJoypdVHDGGarrJbwQZxZ8M0u
 HuSI3GcPEq1kM8mnbFpsM8hXzSF7rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170103
Cc: devicetree@vger.kernel.org, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 11/11] clk: qcom: Add support for GPUCC
 and GXCLK for Kaanapali
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

On 11/25/25 6:45 PM, Taniya Das wrote:
> Support the graphics clock controller for Kaanapali for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig              |   9 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/gpucc-kaanapali.c    | 494 ++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gxclkctl-kaanapali.c |  76 ++++++

I previously proposed bunching the little guy with the other
object file:

https://lore.kernel.org/linux-arm-msm/20250723-topic-8750_gpucc-v2-2-56c93b84c390@oss.qualcomm.com/

And I still think that's a better idea. Alternatively, we could
create a small "gxclkctl.c" and make it common across all such
platforms, but I'm not sure that makes sense, if for each one of
them we're already going to carry a gpucc-xyz.c anyway

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
