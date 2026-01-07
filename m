Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AB0CFECFC
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 17:17:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42E8BC8F282;
	Wed,  7 Jan 2026 16:17:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA2C8C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 16:17:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6079cMA92877823
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 7 Jan 2026 16:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pNn2hydp6mFmiGWfG0RE3hVW
 bp3VHRZ/n5+RMle+1R8=; b=MqJT1EKHl9gRMK8gc0rPEEOryXVHNkKqHzOPhh/n
 AKEEjEqLEKTW2bGKBRI06bwASHx6DmgC1ikIzDdo7anBNcZ5nmByjlDBoE8wIxNV
 +qN2hpoZ7gwmTY6KSu0q6Pf4wE8zoHUNLC4X9c4L03FSu1IyrVpPQ8MJfDfJ0BxP
 JlfcRMskQheJx3n0Ayixqm/1rzn3HG8yNxshkN2Vuew7aB5yQgQmTG2ciXHcKFc5
 qZm3c85gkUlgOELx3bCYSq48So95d7h4f/ckw3AO3Myt+rakPPYY8a/OvLQAtatW
 Wz/OFC7xxjapfrQeP3diKItz8xhCoNAaIoK5tBrS5BdLzg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn1cs73j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 16:17:08 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-93f5e6c2110so3005928241.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 08:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767802628; x=1768407428;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pNn2hydp6mFmiGWfG0RE3hVWbp3VHRZ/n5+RMle+1R8=;
 b=UywQlr/U3sEWP88gSP+LIt/Yl3coG3a9VmiWMl0edsJwwlhFtZBwQpLiAve9OQvvCR
 gr02EGxF4LvWAv+kgoqzihzcmK/hY+95skFVEbKVk7N2N094QUOstm43fE1E5Dybcl49
 o5oN1H6bmc1vW9DHxxBW9SSc7oCp76NiLNTJBzUlMXjOtwJ7HGNtJQ+ZHfjAGDgYsWQA
 8qrmNuxBt9KoftL0CF8WHjK8lSXZjt4eaD/du510vgumim4Gd1JizJdf6F/QflFJ3irw
 mbYL67gN0TgbMS7KrjAoso9S8u8tT5SKo+6r5iJXef/V6I5nYnKimiC3tDvSHytGUFh0
 0nNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767802628; x=1768407428;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pNn2hydp6mFmiGWfG0RE3hVWbp3VHRZ/n5+RMle+1R8=;
 b=qV3Un8C02NaHaxLNtXuVAaehugQeKUtPxz4fjLK+Bbl2NxE0HEutKi4Srrp0r0Ce57
 VhWxWJi344J3/iOHeJfYkY9iqBeefNwkFBjFOZBDqjaPRw7lNSiHL2KjUjtiNCdrToex
 mWX7zeK082ltInapApsRRiZzNuOuRzfvhlXVovyJ2m9dv1NdRCcHwbQtp/CRIRnIWAwe
 xLdDHjTSSfTo64MIjAE1nB3bCmpnELd2F1iOW2GCnNOv91+nNMtq2rDXjl96BDgeBJzc
 L2s2r+6rG+90Lt0rJuVATcc1OlPpcoA+vOUPAXhO9Ifh0nmhNp8OqOKy0VPy1OvKDKgz
 F+qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6toX/zv79jqyfI3RJ6WEvSMe/RjJspq2JBatsAL8KOLftUxa2ZBr67CKW6Sq4AHxQx+wjvh4SCcCaAg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyia8WZ2LGJ0bwl1FWNrmB+hn2mcpTzA8Z895SxHFL3R/1kS2l3
 yCHk3qhTuwzhPomafRflvq34oFxj06X7qNP60F+b5MEhFoSNgiCFfmdh8ar0/mhql32W2Gv9sEZ
 7WU7/bh0I2C+FTN3ocHueGFzbhcHsPah0/jMTb/p2D0ryNvpX234pSNQjvBQHPKxhNsa45V2PBr
 p3guknN6w=
X-Gm-Gg: AY/fxX4jvaeHDZoE4wnFlBANRLMNxJY1iak/ofY/h/oACzdoA1qA8Gxd5uwSvuGB8pE
 40zCa0SIuQOHQ8dHiikQP86NNXxbddniadul3BIJKuctkeQOBz0SsHeAELfNJGrX4klYR1WAcdm
 fzEZS0tvEPNCD9ScZyfA5pQZQlSoshZ9oW0eZ/xthGEdVTMJwjpD4EkXdxjE9jHfBX76+vZJgUA
 wZACwV9F1+vMzHLhGYGXmcbU0S5UWPFwR9x+ejIZ+fgQYpYGxrmWLB8QLESIL9JjvfpizOBw4kM
 HppTfL36pabD35m9P5D8KIl1AqbhrDMDijpw/WyuboODA4qOgPuLZhFcL7G7TtrMZ5+HZddW/Tj
 YC2CRSmmoNkbz/d5jYdTvrh6rdWvg02YDMbdmmBFYVGSrRytTQBgHbXD3AIUx5l35P1vd2enRZB
 dnG4vihcWdEA2PHO7SGPa6gS0=
X-Received: by 2002:a05:6102:c50:b0:5d7:dec5:b6a7 with SMTP id
 ada2fe7eead31-5ecb65744b9mr936525137.7.1767802626962; 
 Wed, 07 Jan 2026 08:17:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWo7kmpZp++avSupk4Uz/4kHmAaLqQIgTBTPz0DzPK5KyO/RxzYBCX2g8LY9QhwFIztQxq7A==
X-Received: by 2002:a05:6102:c50:b0:5d7:dec5:b6a7 with SMTP id
 ada2fe7eead31-5ecb65744b9mr936476137.7.1767802626202; 
 Wed, 07 Jan 2026 08:17:06 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65cea872sm1384019e87.2.2026.01.07.08.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 08:17:05 -0800 (PST)
Date: Wed, 7 Jan 2026 18:17:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Message-ID: <3sbqfijv6b2lxvx3kwcu67a233d7xcpvc5x7ysc6ktk2o3d4qx@6eagaimfqd44>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-8-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-8-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyNyBTYWx0ZWRfX0uFxSUh6kOYL
 Fkx/iT4FooFxMhLYSMDJUqBaWoJtIaAkD/bxE0WXW7M+pSYaCvrUE+X3EwdKnj67IxuyUhT5tO+
 B/T5D1xRzUN4cAiOzVSiIeEl4O5yv5ZEgqOKqnCmYj94tDZOcIAtIkMkE4M9rOHQ5bt9eKlQE8n
 VVvzEvU7vD0BQVGpQ4n0pbU95R/QYbmCZ8et8nuzSloK0J09res+1laG7lrexfsCXtaPUpfTus7
 4wki34OhXoonUNvsYofMrhU3bIHUmvRrRBKq9ofn1fDyHpHlf1SqPPArUY+vqn2zpa6x+wzAScY
 vE/jCe00aBj3upJAmkmH0AinFWdkfXk7VQBsKgooZ05eZtCK0Bik3pZncbosiLdve6Q50ZZsmlq
 pdS7pAp4Y7XutfkdsVlUaLakWpN8FkGB5JXyyA0RHziIj7zvW38V9DGnR47Uy+7VeZN4W63W3N9
 uT++bWutWozHMk4F0LA==
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=695e8704 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gpaIcbXCgmfx5VOTBCIA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: qS35809EbTVtF-k9fiFn4VBs_uHtT-Dy
X-Proofpoint-GUID: qS35809EbTVtF-k9fiFn4VBs_uHtT-Dy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070127
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-clk@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 08/11] clk: qcom: dispcc: Add support
 for display clock controller Kaanapali
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

On Wed, Jan 07, 2026 at 03:13:11PM +0530, Taniya Das wrote:
> Support the clock controller driver for Kaanapali to enable display SW to
> be able to control the clocks.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig            |   10 +
>  drivers/clk/qcom/Makefile           |    1 +
>  drivers/clk/qcom/dispcc-kaanapali.c | 1956 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1967 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
