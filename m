Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D1FA83ABC
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 09:19:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A1FEC7A837;
	Thu, 10 Apr 2025 07:19:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B7D6C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 11:59:51 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Asv78019579
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 8 Apr 2025 11:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=J5UKc7ae/UXmKHiunvfff8Ov
 kaw6Ua5MEgH+S/e5ZyQ=; b=kAsOPgkPIbWTYpxxLnV2o/tiI/3bdehvaBEoCyZ0
 dKGf+6HEMV+mOXtQg3TKew5ae8DTSn+qdcXvJtxK8ge+EnSr0tx+sCis1veuSQzg
 3edDDEClKZRUG3Frlttq3EXW9eGg6Cq4X/qOzYcAUEzeYFIgmgXGz/jg2tCX0Qeh
 VWNmF31+A/CHv5/qZ4QGp8dwZPB7U8WGPeLlfGkV1qCdeh+Pr9a3vvCkTGjqRHjf
 xF2zmMvSqSQDEiIKdecpulOEdxi8iAwxtfFzVa7K2HvKyiTWyAFBTNH+DWP29d2W
 vg8Y4qTFoI8b2c5ttNqjBRTpAkdNMdU6PF+BTUhr0+c3xA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3fmnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Apr 2025 11:59:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5c82c6d72so983572185a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Apr 2025 04:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744113589; x=1744718389;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J5UKc7ae/UXmKHiunvfff8Ovkaw6Ua5MEgH+S/e5ZyQ=;
 b=YyorVNnnrXJDAziodKVUYvxTdmYbhCUo/KgJVTpFyTW1712WBUzi0FW8yAlihQBsjh
 4KJfqGFyelVEiIWlBLPE7XmWrBI6aod8c+11eskrqQfV8IT+Z7KVANQw9gQ1F1OCsVXS
 6cH0+ouuyqzHgKXQDa8FiBUleAx4FB30sD7LihnW/+7ujpEXI88oBDPFx996ol9/d6TU
 BRIAqyihacCYZatdHLzgKdIBMnkITXIzc20fNt2vL1OXpUesHWrOA/97qUVj/XMHC0iA
 HcSQXSR5hbyD3573YMRuccx1Iib7gwWAlt0s3Z+U4mY4kFYJn3lU1otZjfxsWwg2jIVx
 iGpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJJieK7h91A1q6UVQCFMt/IRvr6sfT4Q7WfEtRQ7PyBBPaU7gvauArl0B+lLNQ6ohCwymKc/ociWH/Gw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzML5BSHWi5hEDlqI2c31dT4wFqvR3dAKfSrum/7Wa0gmoMqiGC
 OSU8t7olEDKpcL2pQbMBhZnghd0w27age51oNLHs1JqAhoqkwbKO1zadtKA30Nw1Jkt6iG9umNi
 EpUU+0D18MgQ2R395fixjYTm3c0YIyQ9ygxTZvG6Bui+QmLGTcnqj536BpCIg8TQD45HHZ2jj93
 VGPS8=
X-Gm-Gg: ASbGncszwqM8i1K3D8kKVROMLrjSgh+Z69oA6eVwygCqiw9dU/00hLAg6z3Aih4GFsU
 6gCL+lhEsHJ00ISq4C9wxFAqaXVyvnmPqa0hVGRUwYkJ/kN6zXm51dNL+XNhcPI54E83MVuQ1tP
 /mQ4l9+AbHpf9ZTpvEOWCJJJU5Va4ILN76VsbplCuIJpipt9wF9r9RZvT4K01il4o1dPt4ucOxA
 AxrTPlHzE2XSxJQyXjXQdj4zw6PTzCohlIUIZGPXNRoUBRkSCFymk4g4Z0fwdjd1FQEvbmNBN8Z
 MhUZb/s0EjxDplc4ylh/VzvHM/3dbKrsZwdf7/+6Ex1Wovp7yl1xvZi0tvkjTUu6AjeWiEFaWSO
 NEoA=
X-Received: by 2002:a05:620a:3189:b0:7c5:a513:1fd2 with SMTP id
 af79cd13be357-7c7759e8788mr2682365285a.6.1744113589027; 
 Tue, 08 Apr 2025 04:59:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLjG0AgWeS1WAQhJR3SCJI5Qh4YJ14xwCKURGmhWqtrP5XHH87RDOupWg+DezPfWGcaUO7og==
X-Received: by 2002:a05:620a:3189:b0:7c5:a513:1fd2 with SMTP id
 af79cd13be357-7c7759e8788mr2682358785a.6.1744113588696; 
 Tue, 08 Apr 2025 04:59:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e6370ebsm1479003e87.130.2025.04.08.04.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 04:59:47 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:59:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <s5uvbdcv7pqogwg7gyy42vfxv3ubffj4ww7nili6sd3y67kdf5@byctauuurvwe>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-16-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-16-42113ff8d9c0@bootlin.com>
X-Proofpoint-GUID: bykYfb_E3PC0kIeW13JsIFkFBDIZa59V
X-Proofpoint-ORIG-GUID: bykYfb_E3PC0kIeW13JsIFkFBDIZa59V
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f50fb5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=Yq7wtpIrRiHUN6cIw-cA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=944 lowpriorityscore=0 spamscore=0
 clxscore=1011 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [Linux-stm32] [PATCH 16/34] drm/msm/dp: convert to
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

On Mon, Apr 07, 2025 at 04:23:31PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/dp/dp_drm.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
