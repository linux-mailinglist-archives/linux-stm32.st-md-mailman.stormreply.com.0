Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78595AA0B29
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Apr 2025 14:09:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1ACAFC78F63;
	Tue, 29 Apr 2025 12:09:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BCDDC78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 12:09:38 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA1BZk015407
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 29 Apr 2025 12:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yAp0LdgXVQkJihbVytViUFNy
 VYiIbcoCGNDRQ8jMoF4=; b=KkGLmgB1DUQVYWqXwzauECf/oT8pq4VmjVHlEunk
 60PS2gs7/H0DESvhb9ZkWdajJVWYBc8XZJ6+r3VBlX/PrWCpiVFsMOKOjWwsLZ4t
 sXQTvabHEZhXvFjTVeV6ojv0tXyQyMf+4VwIdfW/+cvhKbD2+Cptb0qLFNbYBKOV
 kCgjxc0jZnxjzNKDyp8jynZy9R89u8Wrt01rbIVpNTIlJHDyWm9hQWyDs49ffJbI
 SEEtVDUFdikzuWOxvPwun+mTwUweeuxz304qGFE9FgTXReqbnwaHZSozHf/PX2XC
 DS17DjEVCDPYU9BhBSG7uHOMyzzuv/3KfNKxuKl89G/dGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwve9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 12:09:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5f3b8b1a1so980819685a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 05:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745928577; x=1746533377;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=;
 b=NK4+GEempvNaA3xp7wgkkXx79U9xoHhc7hxVNC4AbU5ae0uYddGs6FZb9uaoL/nP7P
 1LJFPbdzqwLu/CyWEFFJ5c/6GUOrAfQcqDwO5knwNHYyg0IgHV6R9ngkKyNBJ4BwUBVe
 fU1Yvt+HdZ8fKKtmymZMTXweJl3DtPR/oKufEA4fFtcAv2chEGIKWQ6IW3kNyRoeJ04A
 hwYJI8TjkVe/EjODEc7aND4UPHFKzM6OTvNJJBtFGBoJ+mjvzecvcZU14oKabDayss2R
 t+O/QZ/GQklWhPUtNC8SmmdNH2vrH3AYuEMgSWptKPVoFKWm685eFWTN7aS4h/DlPL5h
 /3Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0FbkIBSS6prFS02PheMcoNsHaZwXrTlvpx/8Fg+He7X3EKzsVm7ETSgEDkRP+DjveDjE+mT3Mj4mCxA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLZgbCFLh/DjHFZFHO+esAMXs+71o53b0ngg0W1YGl1qZd4p+U
 LmnxDVamGUxxyUxmEoKYM0vRDc0TINRDKQPmmKV06lHUd2zDyxTRpFOwSAw7wM++UO7ZdbFrGla
 4qA/tKwOzAzUExMaYuYpxan+gR6702tPuVTl6USLLkHdUupho2anlKtP5ARAxWAcj9NJs7GwRbJ
 PvQu8=
X-Gm-Gg: ASbGnctJr5HNfABYKAc5cCsxzpHIOyB6bS9zTRc4ssZkXrOtjOazQtirxnWlsMMxNvl
 8Z6vDNgVsSZFAhyAxVYMNSPCIPsEYelD5MoQ3eKkCDHWYb5YA1/S8VD8fgVTe3vm1qV81Y8JLyy
 giHrxM7XgTaZ72rmEVzr+XyzS5jxsHoiDDFPFdTIphNyH4p9/gbwlhefQnawiBJNB/TEz4YwhpE
 Z3EMeRFONeN91ND8nFuVVmDQc5xQBvMbAANd3dKHqSwA6P9TcuxLZvp2kYtmqHJVqRZZEq20inT
 DNnYUa5Iss0oTWsowIU3F5xl2Avv0XH3CSwM4Zbin8E68wD6r2HgY1qrD40F0AA3ZAs4C52/H1s
 =
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id
 af79cd13be357-7cabdd8fac8mr556721085a.31.1745928576986; 
 Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+WiBW2dMdMKjL5rCtckyag5tI3q0y87zTTMxYAoMUgZTNEX197tRyQ4loVEQ9A423pNGqNQ==
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id
 af79cd13be357-7cabdd8fac8mr556713685a.31.1745928576612; 
 Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d16a85ecsm24278761fa.72.2025.04.29.05.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 05:09:35 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:09:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <lg5hhtncppqy2vreut2z7h36mmnuzn2xhw7asrjmftqg7koaqh@as6jetr3pw3b>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
X-Proofpoint-ORIG-GUID: YhlDox58RAMeRBCXaYiN6zEMx6ZG5WXp
X-Proofpoint-GUID: YhlDox58RAMeRBCXaYiN6zEMx6ZG5WXp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MCBTYWx0ZWRfX5yaKG5Y6O6eK
 iD/fNur9nJGanVYm6WvvpmHZ3oK/2fkwpy4s0nkaL+NIw9If54Auy56U5euuPBJ+P6ASvGCsw02
 CurEgL6eZPT7fdmvQG0RfhOQyEIAv3YB6KDZkebnU62EAji7UaHkXlE+qLmJl5CzNDvCPTCG39m
 0MzkNeWlMFq6IxaKuF/r0+0G+TTy8GBUOYFgfcexLe2Y/TXO7SOoITVJ0STzH559mtdrKvNnv9U
 DvpdeH3DC79JEFqct4eJh2xZLpyuHIbKNS8mkauWztU3zN+lpjKxUH36jVodqZY59hwkktrx9ov
 17kWoVX/+D7cg0fdxQXeQI6Mek7KdHGnYtS/QEkIOFCh/cXUdF/LOUP7BQk2RW1S3shRkZtrIlR
 J/j5lLEL3iT8r3p+/t43f8RdmorpLiMJuFFKfz2MKqOtc8yskEY9FvM5A8j6tYTy4xEVlIkV
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=6810c181 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=iF-wyJFYdUVxq7VKmwgA:9
 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=726
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290090
Cc: imx@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 07/34] drm/bridge: lt9611uxc: convert
 to devm_drm_bridge_alloc() API
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

On Thu, Apr 24, 2025 at 08:59:14PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
