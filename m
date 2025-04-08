Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9A1A83ABD
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 09:19:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE04DC7A839;
	Thu, 10 Apr 2025 07:19:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A706AC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 12:07:04 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538ArRO9026116
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 8 Apr 2025 12:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=okr4ff8snDUBXMIQ3O2Kjam3
 gElpjdiFVfB7cr7ArbI=; b=UGSHs8IecqIbnMxL8cE1GcJ8I8WeNKJR9JUc1AsP
 p2wvlCfST4uFdb8kTot56MzlQCypCTyqcHkcu2J3Qmv04DDP3odCH20qUYjQ/iTS
 kwXyL9wAxYAOKtbt689MAPkn7omIy0lc0PpDQJaXZgEyWtU8KXMEpVqisIDfCHRT
 bnq8uH65plRDMMdvgxhTBO752R41Uy/u53ibTzjTFWiJQAxUePstp8LhNa0vLEOa
 AbeGPbXj9HaHmT4/4Vm/khvxuTFXxbU9EUMvBR76FsXMDx9zvgfxxfbUUAd93t2U
 SsRWUWH/PFGqGXW7N15KN9AEjSCq4Ll8kmt8vWaOufuYjA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgfpy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Apr 2025 12:07:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8ec18a29aso63959486d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Apr 2025 05:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744114022; x=1744718822;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okr4ff8snDUBXMIQ3O2Kjam3gElpjdiFVfB7cr7ArbI=;
 b=RY+iyAvr/AGpD8MrZx62gjHLSA8tyz8uULaNV8D3hR90wqk8OCv9LAk9m0kCjVSCPo
 M85epVLQ4ssUdKQ5uSUKjNzxBpUy3jymxjDSenBW1MhSM3Odu+txyWyd6IzjylDS4R5P
 DJ+7laV0jBky3SivMvacl3xsxilmViVgeOpEnAsFS48YC648kJc+Nk36WME8R5H0P5xN
 tEB0/mMKqZFZply3Ec4nxgugHn97jxRftDOg4NrXoTkd5ItbXbZsJTjlQz6H6/DBgqUd
 fJ2GKdXQDVOGrlLSWEy/yVygU9BdQt/EBWRL8+zOrQ1YZ2Vc1p94wor2LiLlwez9Xy6a
 YYMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMIbfV49jwIOcw5yPSBTCBvjvolXrxTNb9bolQGup/53NtktFOiilRQS0S44HZy+85jAEkevJ+GZA8wA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJOcb4b0L4jIq6IzYPS56JSh62zVmzTZMv8nbvpIW73UzBJQpj
 uuT9x2pYjoZ7Lcqvq36JT7nA6k4Yqi4yRbcx541JDdRQ5krodxJreXJM/KRQwSvNtBUJXmdzQFE
 dUYpNF/AXvfFlC6zEOOaUQVQ3qLEhcNkiiPfMyGfHMXP4FC5ITSwAXBF4UB1qHVMLHkjTfdE2Vm
 vRSGM=
X-Gm-Gg: ASbGnctYWQffe5eBdHRauMwhVZ965BADUOVsyNi4wagr0tKMbWhRig+kWYc7A9gQwd6
 yqFGXtz6/1P2eKgEZHaFPnC+odIJbfvob0MnDfhU3NuTjTcTQD2jGmKALUOgWL+8laMR1q5GSar
 ZcWrGNqRTvReGmYbMa67TuPzbX/MTA/5TE/FQyB737JD9deBaiftMe4QO6HUcWdRDc9beks4rdg
 zI4IvEpp6HhWZYgxqh83OLoceCu6H6wGH5HZ2+IBUVJs4l6gilBX4nMlrJDbTwflIbsP8/rfufL
 oTVnYXXvaSnv7+KU8cns73kIWgB7mY69LoD6l1k0GSw0t36Rbpn7PWELkH7t4E6+NfAmKBdXEa2
 lMvs=
X-Received: by 2002:a05:6214:2588:b0:6e6:5d61:4f01 with SMTP id
 6a1803df08f44-6f0584a4650mr222250676d6.8.1744114022420; 
 Tue, 08 Apr 2025 05:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9w2RBz2reqBHaAnbyBnIgRXepoq+7WOMXuECx/UyL5hge9Ble8kyyEI6oTqzp8dfXIATI6A==
X-Received: by 2002:a05:6214:2588:b0:6e6:5d61:4f01 with SMTP id
 6a1803df08f44-6f0584a4650mr222250096d6.8.1744114022090; 
 Tue, 08 Apr 2025 05:07:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e66377esm1493456e87.209.2025.04.08.05.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 05:07:00 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:06:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <o23cjtq5i6m5xwjj7ymknorjsv32e27anugbek42nao643kdct@6nghdmm746ij>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-6-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-6-42113ff8d9c0@bootlin.com>
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f51167 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=IO8BAnyXGLrJ2ajCqTsA:9
 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: VJ-6KhGNnkWZ3zot_Cm6lgpfewAkETOx
X-Proofpoint-GUID: VJ-6KhGNnkWZ3zot_Cm6lgpfewAkETOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=863 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080086
X-Mailman-Approved-At: Thu, 10 Apr 2025 07:19:28 +0000
Cc: imx@lists.linux.dev, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 06/34] drm/bridge: display-connector:
 convert to devm_drm_bridge_alloc() API
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

On Mon, Apr 07, 2025 at 04:23:21PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
