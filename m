Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A91D5CFED20
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 17:18:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76015C8F282;
	Wed,  7 Jan 2026 16:18:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A49FFC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 16:18:47 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6079CJtE2453910
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 7 Jan 2026 16:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HwZBs/pI4tqrM+YdLcnJrTnM
 DuBq2S6J78a0HWSkjHk=; b=pEqxtVM7ihUy+zNFC6MGh7WxN7cbgbo08zA/hynY
 4qHlzmqRIEP0uOC/QZOS03kyXGH5cV6Jg1Zs7DorHDtEsn0pmksseXi9TztcuRcz
 HFPBO+TTEU1Gnn6x5m4n2gwHD97Qb0AYcPFYKpv/prYihzGuaHkWbGECD3AwA8YM
 hiuQ/x2DQg9FmXWIk3V+jB8rYHeA3S2OhQBI5+7mslQFkWvaG2HKPwWA4rmbB1Yz
 Ra7FvnhBpgzwyhxD2jxvUV4l8utAzuJszDeEqpfnZabgaz+OIHGPgEWeXvBGAeMf
 e1rQPyb225OO+q0LrD2i9CW+DPXQ2nljlVewAoQl6AikJg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbh9fe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 16:18:46 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-9415ceb0a03so2988718241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 08:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767802725; x=1768407525;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HwZBs/pI4tqrM+YdLcnJrTnMDuBq2S6J78a0HWSkjHk=;
 b=Tn3mdXklxw6rghNFAUsZ2u6b+TwfRMW2FYSjQiwQXg7CbC+0zQqgtxY1qy4tdqfwzg
 lFAvzFqt42sgyilcwOk1RFgPSL4QTEeS8Z2IVPsqFokdhK3rsscPYD+T0psjcQY7R2Vh
 NI4xya9a2b8fThXERwjHGtt8R2M61HMUdFbqBTMJ6kHhZk93tWU4mSMWGZGpCztpaNC4
 U81W5sIEDLwzYdF4g3UCgVPX8a8S2clFFuzjEF2UJ9cxCc6S8cWX8Ww6mKYXaZ5QA0FC
 KNhnc7Wud5kr+9uSUW41wA+X30/k2eHzykTy3OSuLxThS0beQ7HvNshI7Rr78B4yKtfm
 SeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767802725; x=1768407525;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HwZBs/pI4tqrM+YdLcnJrTnMDuBq2S6J78a0HWSkjHk=;
 b=lp2cj3sH8IYB7T1ESCHzTb1f5X8yAelCWg/uR5qKPUp6PmB8sNYEe8YaAtyNp6VQQn
 9r+TNAnoC5PgXFhAuVPW3T+tybMF+EWE9TwLmJaI1lWfDWkwp7o5MVJIOZlKG86Zfl6u
 Hbr61eXnmEYctr+rk+KfixuD1RWTBYgHVTezxeQIFFstvC/pDOO8AnotuXG0OrD/9XDC
 f+K1BffhxtIJ4GjdPO6i6ecT1SyZ8iclvyPA/41BkrhfqdyE7LXfZePatYhzhBc5cV/V
 QxywVw5bDpGdiUOBmfeJ5Wm1jlfdQ/qSEk/VpXpqF+aQsrRrm8Mk3uTYPuIYb9U/GrZn
 I2fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB7Jdcm9SCBs955ISkb/JUvKisxuAACPsS79spXBiFeIWk4BNynA7P2GPurkeddgRvBSLtc4MJnszl7Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyQadayZ4tcnaAsD3sivo6x6KHp9JCxfgG45q7XBd6V47h1Ra6X
 qacf7moANxyUkK5J4dV9QIN9rGJwALm6ST6G8qQjlgoBR+A/xwH6qeLo8pzqY5uGO3DEt9c4Ltd
 NbF/Jyv6lW/vwl4mfB1zgqv7K2vlT8f8KXrhU2UVAARKA7Lg7LdWSWjBjOGLcTigTLtQ0K8SuJh
 C7S+2bEZc=
X-Gm-Gg: AY/fxX69uLGrvMnmiv1f4Apr2iXtoN5qIbdSNgvwILO4tqQHZxA9ouifx8o+Wtawh+V
 ZD30gtThlpRMjC1/JH+kPlEPlvov0UHxsLe3JkNy86OOH8geFIlxSDJ3ginw2ex7kGZTxG9Padw
 JNuk+y/Q093sfotIkf5uH71/X6woJ6hNnlTxJ9Jssv9EdQYQciHMbWaYlZ2fd+yCHkApG9Xqfsa
 K4uAddQPfe0efwFyhresJns0nfy1yBehHDjyFLNK3HNWGK5Qt5LJgVVgU3/wuJ63gUWm/dtePfs
 vw8S3m9tihrPZIILNyjTzzf1n8oGH8WFby3HbbCUsx8KWdynzDYh7MhhcJSMi9pLYd2Qyqrr6+2
 OMF3TOaugAIVl7dGD3UD6DrypJMutoulxNWGY3VPMNXh92r0qk95xdvrYPrC0BdTTUMHf0Jwp7l
 QdcfVGH/QKbItmlm7seJf7p84=
X-Received: by 2002:a05:6102:fa5:b0:5df:b2cd:12b4 with SMTP id
 ada2fe7eead31-5ecb694854bmr888636137.24.1767802724754; 
 Wed, 07 Jan 2026 08:18:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHB5ZRn1QY/K6daz0KlPYsnYXAnz+5ET9h4x0F463Jjq+1VY5FCZCLE1JA9Bad2LVDmCS3+A==
X-Received: by 2002:a05:6102:fa5:b0:5df:b2cd:12b4 with SMTP id
 ada2fe7eead31-5ecb694854bmr888602137.24.1767802723486; 
 Wed, 07 Jan 2026 08:18:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb8a9c39sm12016941fa.23.2026.01.07.08.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 08:18:42 -0800 (PST)
Date: Wed, 7 Jan 2026 18:18:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Message-ID: <lsvn2xjz6zxefs772tg26jg2cvfohbjcetrlxfn7mtq6ag5aig@ep6ofq4mrfrh>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-11-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-11-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyNyBTYWx0ZWRfX9UrBKkADO7j2
 FpMp4kyUPLWhFf46cFt1BIXbNseAldIOW0RCD0an5bWmMUyEwZ5c46E4jZonZkWJlI64k77bzuj
 vi+ctRvAHCZTUSO3j5iQsIctfwCtgYdoh62V0BMGYHFDO8GPbBvxQrIy56pbIWcVglHwIT2wBai
 RXumKROaK1H7wDoB53ItAmq4ZAssDwYNCNc4o+DMlgBb44c9keNU4B0rAP36f1VaRyWyuQ8LnG5
 ugZLDC5rQTm3XR8zERJhn5ThNSgkT/N/gj42Yi83mUAqjPSYLZEuDmCbaXjBhNnPsEO0NIEnr1R
 lAePZvfYgtUYokMuF7MdFYZnO0ODh5D+ikqX4mw5zqc80u7DGR4j779RwIEeQlnoku5h0De1BRm
 NgNYjeZ821ZEoAGBcj6BBXVURIxht4xsjkGSSOTTqnqgs2J8EhlOp+nm+6ZGzEfPnZJ/LFVn0Xy
 lKvpjRsabroV8UjcngQ==
X-Proofpoint-GUID: km4SC7erXaAo8Vq7UouZs7BDa2m9HzSf
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695e8766 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-momvpiiut8LGs_r7JQA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: km4SC7erXaAo8Vq7UouZs7BDa2m9HzSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070127
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [Linux-stm32] [PATCH v3 11/11] clk: qcom: Add support for GPUCC
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

On Wed, Jan 07, 2026 at 03:13:14PM +0530, Taniya Das wrote:
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
>  drivers/clk/qcom/gpucc-kaanapali.c    | 482 ++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gxclkctl-kaanapali.c |  76 ++++++
>  4 files changed, 568 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
