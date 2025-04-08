Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D383AA83ABA
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 09:19:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 801E7C7A835;
	Thu, 10 Apr 2025 07:19:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13A0AC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 11:59:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538B6Jcs010539
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 8 Apr 2025 11:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NEuaNgipirFcEWokWSaWAS/H
 yieGaYJXo6f7MVJMQQ8=; b=Xklge4heqEb6htj8B5O7IHd428xO57ftGWanUiIw
 mR4/sOdbi8VjXnwUa/ND193G+DoZbkPHxW2lv0gGqWArKaC4QvbiMDqbKNYNn0RF
 QVwRWcIUMVSe9xonU831+uYGwXOTZ17u7ZTIoMDhD7tO1bEtxkzMZZ39nOSo7AwW
 w3Wg1ispeItWnd1UvoIbgN1aDTOo/NYdJhqKlDXO0EFK5isRGO7hg2LaSSEawevu
 ftk6T7ByD0kTjgLBRvUix5cFS0MPr2WbshmO3ILW20l4gSXfoXM3mfraDwCcXWXJ
 fQytu+NoPZiBJqSR3yhMlc9oLW4/uxFhMHFSFd23bIDFqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1fhr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Apr 2025 11:59:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5e2a31f75so1731586885a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Apr 2025 04:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744113571; x=1744718371;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEuaNgipirFcEWokWSaWAS/HyieGaYJXo6f7MVJMQQ8=;
 b=bndf6pdgdI6r5/4OUGTumUdMnsebJqvMRIfUJDbCq91g20a7NjVBv6H9ATRUHPFYNh
 fiJXhn/kqyoZ5gIHfEkJsoltKVHMsfwsNcvi3SskTS1eVsW0zi0LQ7wdh4bDWSZUzJ7C
 dlt0Hdrl/tMFrt1eCm8TncztsJnD0La0xRJHXWioiBFIHxnEFaJhkGVzK21OdYRbSSkT
 mkZxdpw8VUzj0/1xXdQihs2ncT9DjVI6n3FQUjpyaZGXasYHqdsPnf8zrUdNuRGjVxbV
 u2Hgwfr4oJbZhJYCAqfYA5YW1Va3zZtK7uqri7s2iDUIM+vv00HEWTpI39h3rImW1zN7
 dbpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqSGLOzLFyy1WAh3FFTD0YmyhqtwRccY0defAYw6nENh0x9t3jMTqo/pYGT0oXRSQN6rH+uIF2KrIzhw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwK/x7qMyFwlKDmPoGa17mgmHqaBL7Rzmozj+vMdHXNJg1HIGWv
 ywNZYgpKzn3LdN8cRpI4xkUGKap/X3YCD4ESF90qt4phH4nIDwZFLgqyEFuQCwCw5vApUCeQT25
 cgxT60b4DSc76CMzSPVHNyh3hw5EleC7N+XCSaDmvJOGJUSSuZdNSm2sOmA6MOxAupNQzb3aHVJ
 tST5g=
X-Gm-Gg: ASbGncs5IyXVWDb3ST3M2u8H+zVfq7nD6L5vN/r3njaiL+noj9Ly0C2Xsl70AERJ/2x
 BW0w4/AGt1itKOE55D67YVqn0NaYY3SOfuCufllivVcAsGAOUtlYX/w5GvHniXAsG9C44LjWUL6
 cL+ljfIfyrWHAANLxbDibQ9e6HUt+TtBYHqtVUtxEkL3wDto0Xl7/IJ58yKH9kdNBvGigFtWM3H
 Ob2w0Ppn1v8xZB8xeaWnnzWRkE148pswaY/gyncEYy0OvBcDVaNiZY4rwhjuxvHuOWpfoxzGc7i
 R9Pt/yGsMIpIAiRLYmOfA1AKZ/oAg7SU6OGwW0UP2ySFcFU+wmb/aL66HXe4YhARRG9VFC5KOZU
 mFik=
X-Received: by 2002:a05:620a:4452:b0:7c5:5d4b:e63b with SMTP id
 af79cd13be357-7c774dd611emr2077711585a.38.1744113570965; 
 Tue, 08 Apr 2025 04:59:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO0pdqrUOojsKZC0LUZebfwayX/lBneIGD6ckCJRsQXTk8bZ4JOWxGmFcuR+OIU3QqcGFMkQ==
X-Received: by 2002:a05:620a:4452:b0:7c5:5d4b:e63b with SMTP id
 af79cd13be357-7c774dd611emr2077706885a.38.1744113570585; 
 Tue, 08 Apr 2025 04:59:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e5ab4e1sm1507877e87.23.2025.04.08.04.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 04:59:28 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:59:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <megx72fwv3xljmimtftryg6ueusjd2f3wv37u2lstdrjt2vlyf@3w32pt3ozivr>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-17-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-17-42113ff8d9c0@bootlin.com>
X-Proofpoint-ORIG-GUID: VV20MfU_kio0F0CwMJb5Rx0LnCCHl7pt
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f50fa3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=MqdoT2xZwiyagvIbdbwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: VV20MfU_kio0F0CwMJb5Rx0LnCCHl7pt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=811 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085
X-Mailman-Approved-At: Thu, 10 Apr 2025 07:19:28 +0000
Cc: imx@lists.linux.dev, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Simona Vetter <simona@ffwll.ch>, chrome-platform@lists.linux.dev,
 Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Hui Pu <Hui.Pu@gehealthcare.com>,
 linux-amlogic@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 17/34] drm/msm/dsi: convert to
	devm_drm_bridge_alloc() API
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

On Mon, Apr 07, 2025 at 04:23:32PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
