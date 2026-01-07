Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 928D9CFED11
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 17:18:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61BD5C8F282;
	Wed,  7 Jan 2026 16:18:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 275DCC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 16:18:16 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6079CKPa2453915
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 7 Jan 2026 16:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=IVuHe0wt1etXnyCGWeXSp+IZ
 3Qg2MMH2Kny/0EnRpgQ=; b=M7ommpBtDPH5Y2ncr1awtSMNvETTSlM1jTl+9vJP
 WmQGzKpcCpRugST+xcH7Z+lv0RagNJ3ZEMe3aWzIMur6OwWqMElh6SRhrGC9dwA3
 as6c/lkESylKRgTqvcR6XUUXU521nL83yf+ZKdUrwg8CYucGIXKKLcQm2s7PUWiN
 y2JGdPQ0F+R5YOrPPthSHj64qgu7sE/UFbEA8cckO1mP7n6eGkOqyXUiNT1p2Sd0
 AfrACZnMFWHwgiXaszqyXKUJ+Zdx7hs1C6fD2His0GATr+lbzn+v+fqAenK2O6yx
 vg4roz1ujWe2Z6j5IyU9jKTuSkZJq8J2F+zhsgzVNgYA6g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbh9ds-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 16:18:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c38129a433so567462885a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 08:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767802694; x=1768407494;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IVuHe0wt1etXnyCGWeXSp+IZ3Qg2MMH2Kny/0EnRpgQ=;
 b=TfDFy5gk7vjpBdj+TLyRf+/x0MeKSlGwPMOexCy9ZMfIBm0WNnV41agzixtmRTvO89
 Y28vhjJlP7E4RSHJyU9EjFGKvS4v2PvpewNg38k0SKxlYJ9wbET5Kle+1YqgazgB80kM
 8dNwycXS8JDtEwJekXy5Ve/I/8mVvQHjF8Eoc4d+KmA2ultdxObrI6bg7flEGHqWHXU4
 U5lWvCJMHP1NB9XV+Iiztw+sG4xxt7zhFgGn1Z3ZUtBUo98XMLLfm+61gvHBL1Tx6z8M
 MMeDY9AoUUZ1RyCxgLI1KjWubwzcemOEEhrn5yVoZ5TwTkpMRBltDmkko2XCE5/ScWXP
 vSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767802694; x=1768407494;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IVuHe0wt1etXnyCGWeXSp+IZ3Qg2MMH2Kny/0EnRpgQ=;
 b=h/EHS3dIyb5EQPLrGGxqL+8Ucfel4y2mS2r9EV2q4laiu5zFZNz/RDjQkIcfALonpA
 nxA9mWxw1/IZtRgtAVGNeD39D3/dyyVKV1blwnODo3w9USErToEBxIikl9J07AUEoOQt
 V11Wu1Ssr+P0ZqfTuhyLQg72zEp/CAD7iTbLRqWnQ8OJyAzLHV8j/maeflMQA+fHbVNj
 E9b8MDEzAXP1mlN03yioIYVMaexvneV8e7bXXSdRfSO69B++2KHNcq0FFLrp6jm+LyrO
 DeVjSrBY8KwfkzGQYCHFaIu0/NNo4PmXm5LcefFI5v7vjK/aDRvT0I3nBqF8QC+T3OON
 e9/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGKcU5HbEzzdFGT0B0gGGVICZSUcCxNJPUD35O6OnyM5E9HEGYYPyVgiNNXN4h7aauoFmXWBhwnQjRuQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyHoFJsSrbICN2qyPULqovPdXBcqlUdOR8fT5AcRc3BHpa+G32F
 SZgcyAG+pVm5SNtUg3DgqxJgC43rc2wo+JijwDhQ2GIh55qHbIQzr1po7UEudRMoCOsvbSBiKaG
 nTQuOrR8VtelpIirSxoVYHs3NRV84HpPPYEiJVuzDcliH+6LP2wK//EWKfhPC8WqL374HoOsfVR
 yVcEYLfZQ=
X-Gm-Gg: AY/fxX4odKvSNcIZCNb7O4GTqAJ5fDc4rOumBqYKPjVwkEpHjuR9mMTPT1MR8zeqWtr
 7eNO/xLwSjCS+RfhvzDpO+IuQCiJe7aKNtM7OID20hoyBdGipTVXCfeWcBn7f9t5bc/6FF2ulXd
 8+uo4gnGEUKymj0/PjBClH1IApyyfjsB1uXUuzgYdcI3iutq2U79G+3ccPcoUDkiFRywBDBtmq5
 uZCLVWfGhwqFmfYG84aW9ChBJe9fqR1RvhY48hv6nLLZdPaPWHS1rmnLJDyTd1b83XdI3N6jM5l
 yLRO6BpMi3HCf+aRnnEbqqf4FWdUZ1rv9uI2yrwr07Is6Sv//KkWJLucxECsSMMlaAs628d8lyP
 TMjhZfxWhVLT148aL7NSXUW5MRI2obGFfWh/fsI7lxsgsWIJd4STp/g4lCaVqa0q2/VM/KroX0i
 3ks7lsTxDVVHXX9aSHg7LKyQA=
X-Received: by 2002:a05:622a:4209:b0:4f4:e6b0:7120 with SMTP id
 d75a77b69052e-4ffb4b5da0emr34184491cf.82.1767802694076; 
 Wed, 07 Jan 2026 08:18:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHY38emXXXkVnOMgdE65Id2wbfbRgInUDB1ehakjGirLO2ZFzXh0B1U67TMsqyhlMzUF0FBw==
X-Received: by 2002:a05:622a:4209:b0:4f4:e6b0:7120 with SMTP id
 d75a77b69052e-4ffb4b5da0emr34183661cf.82.1767802693489; 
 Wed, 07 Jan 2026 08:18:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65ced9absm1402000e87.5.2026.01.07.08.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 08:18:12 -0800 (PST)
Date: Wed, 7 Jan 2026 18:18:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Message-ID: <cfp2ukahbgay4fbm5bqq22mn2jumj5o577wskrfsjtftpznpa3@cksi2qp7igjm>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-10-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-10-8e10adc236a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyNyBTYWx0ZWRfX2B+A22tBFUSI
 Xo7gh0/kY7YO4HnJZp5ou/sJtX2N5nNcglJYyo4ZCnxOQE4xWIUESOmS9t6hHbmv3AQDsP2ps9e
 7njUm7GF6Ktvaf1j/kE1BxpJTVEo+qwqOUtgc6EXRBY7qWcX8YV3ZuQ7rLO1bjsTod/LRbqVkqP
 RlbQVfDCLuYb3W+uEnDgg2/s8jw4jO82qtlytIklTCN2Ze4nEzn6FkLxISv58XcKAI2Xr6DOdNz
 9SdHTcl54lUx81kUSJSJNBvbcw1k1qnMlXFUblH+XUyq/Ar6vvMGqDi1nTOXkdtqCjN+1CWKuKG
 5DIfYj5VTF7NyR5gK1omrZEw3XUTuY8OQulk20s6AkvgIANM++wb1DVDvPtZeE7Wxo5CazXzUuI
 pWI53DwON6K/SI9vHiFNo46pX2THHVcZIbKMeFcV9o7xsGXgstKYhSr6Z9IC+ZZY5Piy2u9Jag6
 aBXDa9voLXn9wuQpNZw==
X-Proofpoint-GUID: XSdmI3r_dxxXjbwutEm47HKsUm8ZmM-u
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695e8747 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0FKzuNh7WTnq1YNKSakA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: XSdmI3r_dxxXjbwutEm47HKsUm8ZmM-u
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
Subject: Re: [Linux-stm32] [PATCH v3 10/11] clk: qcom: Add support for
 VideoCC driver for Kaanapali
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

On Wed, Jan 07, 2026 at 03:13:13PM +0530, Taniya Das wrote:
> Enable Kaanapali video clock driver for video SW to be able to control
> the clocks from the Video SW driver.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig             |   9 +
>  drivers/clk/qcom/Makefile            |   1 +
>  drivers/clk/qcom/videocc-kaanapali.c | 821 +++++++++++++++++++++++++++++++++++
>  3 files changed, 831 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
