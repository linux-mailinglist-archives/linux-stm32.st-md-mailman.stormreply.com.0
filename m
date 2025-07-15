Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBD6B06282
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 17:12:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3278C349C0;
	Tue, 15 Jul 2025 15:12:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE8EFC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 15:12:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8BDlY000421
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 15 Jul 2025 15:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/8/GQmYozt0hkVdJKNP3dY4c
 27MmXYLwdf8DyqAf4/8=; b=ElfxlvT0VzYDBYqLPcqcx5u7gpdJm/0FYmMwnBnG
 y+B4eho5GQ38s7gyWa5V2do3XLCADnVdKyNIdYEaRxCT0C1n6voidTAPb/dJ8PNM
 cQjD55+s9FTC8E0DR8gaP1UR/8u1e6FZJsdhUG9oFq65KyWJvm1FKx/OIVGZhCDY
 GqP34VrlblGX7kQjhS4nxUIVXBXKFZ9NLggE072UbjrSEaUUDqK9bPvusCTM1sc8
 TYWch1G+ETibhGOgFvTa8N8/FWEZDaZpp8bAT7BoxZ0ifVXNJ6WcBNJaKwt99/uv
 EPvODnurcR0dUiYP2bhTrorQpVZq/UucSCwyWS482wIFPA==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu88n0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 15:12:17 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3df309d9842so129947965ab.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 08:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752592337; x=1753197137;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8/GQmYozt0hkVdJKNP3dY4c27MmXYLwdf8DyqAf4/8=;
 b=rwhUo/buDW+ff6HXDVUYtFMeVPWETGHf8bZEpp7OGEDswyZjSYQjanL/EORy4eolsy
 1GbpBmS3VU0lOysStMfTCyg+xYqaJj8rpldQR21b69qF9Uh6N8LXrThELRlsxTKaTOYH
 WHVuC8m17NMnOGHAFh8oVq9zT4OHQ6kY4W+btMlN6Zz4vG5BgrZskexCIEEHo1Kai/pR
 pUA3OJPlZYPbcmEhG9onvyu0mHA9V/oLpvHZZn2rC+NUgDfDCaiIZA/XjbuqMy/oimCT
 in5yc3gaAFUGB9ItXROWPqMBls7gLw9buxuyx5wBSfwpMiB86lvCLaLiN8CtJxQKUVY2
 +T2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvGMKm0JkREHfUGDchofcERkKnbLbgkRYIgD39KagMJ0/Qn7/sQwsiy8FL/py4EjKvVlqGOgnYN419rA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwyE2jKzv9RB19z4/WqSKEVeYr5vNxaf4liHgchfX77LmMkLCUk
 6lWa/XH5wS4g/pQq/3yZuxg85qbJF1hu3isGCHug+CABvj3nzaqk8eyDr7mprRiI5R7pzLsykN0
 vg7CMjALGR+T/vSQ9rz4QS6fEW+TR+3LNekMmU7sXTRToDcBzRsFu66vK4C/m6VEkihtwzR8uyv
 K08EVejuU=
X-Gm-Gg: ASbGnctZzgp7i+XjGisDHe+4AOzneP5cv3xlrYuP8FhmL/VqPtRBMDD+M/aCKPDwaBi
 2zbOcVwDvzHXPSaGqunpIPo37kmLX9IBkaHRBSCiTByz6kV5yT9zy/+jEltlL/qB4Y738y/Bxux
 N7shg2PhxLwInXYYVg7JxHxW0HUOglZ2VW+5d3hbEf/gob5+IU5Jcexq8h532xeNB9O02hzFnyz
 qFR1Z4HqJeUj9sFp/B4MwAMi5uQK0//qty8MB1WL7EwhWhJ82xsTGSNX/KRbBtLAVy2ErrNZb/s
 emiCCcEJh8eIXpypYYe2W7Q5EWFzcioG8BBVATCWL3V7dEVzOJfWLLYYP2UdBut14Kr21j4p6PI
 zSd4oE3K8U0rgEmrpIQkDxpT0mv5TgPZLNZmVe4uf2LG1+RIetaAI
X-Received: by 2002:a05:6e02:b23:b0:3e0:5042:6a0e with SMTP id
 e9e14a558f8ab-3e253317f2fmr190550445ab.14.1752592336570; 
 Tue, 15 Jul 2025 08:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuCcHGzu/NV0coaNVvZvnyxMM3fWdvavBShiCcBGZwVBVkpyKA9SgxNyTJ8HCuKA2VAmYM7Q==
X-Received: by 2002:a05:6e02:b23:b0:3e0:5042:6a0e with SMTP id
 e9e14a558f8ab-3e253317f2fmr190549775ab.14.1752592336031; 
 Tue, 15 Jul 2025 08:12:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c7f380dsm2345658e87.83.2025.07.15.08.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 08:12:15 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:12:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Message-ID: <tkqu2zt5yulnngwvda462fhmkmtmtjnwieruel6lfjr475h7ld@47goit7jldgk>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOSBTYWx0ZWRfXw/jJSc22CZnX
 x9cvqruX26aPZvoKUFGKjT1aXjy5kC0JdojJRlvNtBq8JWa8u9oTyXO6RACd81QGfqzzukQP/k4
 wWKVtc417agTxOHQ2FMD6XsxJJF+qsdDOg2xcT9lsrfhyVU+TyLeyvPQY38lmVoU8kOZq4dsUUk
 C7iJAupHOgSNJvr3Skvb9b9RNSGfroKGdigWbP/FcL+x6U6HjRLg+z8s7zbZZZgdNURXG8krWi/
 l69nUCh23bUtdVysLzwGXJcra5dHOPIZZWJEl5BbuRvMVLj2kL0zrqZp3SjxFbT3qTxA/+W0Q4a
 O9++VtDmA5STNhlRIkYJD98+UyBZbqbGoDts5672luxZmBDK32TqqJpozPa/RsKFSjfoO6xy/Hh
 V75VeAxUUJ47TcGWSI9euOq9dn9ooeOnv/QYo/Crvg3bPlv08JEGQvegriE9qynLnSXxIXPH
X-Proofpoint-ORIG-GUID: AGp256mii_FEVBYpTtf7VyI90TZX5BBD
X-Proofpoint-GUID: AGp256mii_FEVBYpTtf7VyI90TZX5BBD
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68766fd1 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=862 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150139
Cc: imx@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, freedreno@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll:
 convert from round_rate() to determine_rate()
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

On Thu, Jul 10, 2025 at 01:43:04PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please take this via the drm-misc tree (I assume the rest is going to be
merged that way).

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
