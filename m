Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D1DAA0F41
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Apr 2025 16:42:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E354C78F67;
	Tue, 29 Apr 2025 14:42:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50132C78F63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 14:42:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9sTnk022955
 for <linux-stm32@st-md-mailman.stormreply.com>; Tue, 29 Apr 2025 14:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=95T6lUWWSMvDyPMIc22M5eNK
 HqFKHq2wCTghZ6/oaJE=; b=WaLLtT5C8FQJcBDimbkuPt6TTht/cqWy5fKvWqMW
 ILpQ4FF1A55IxDrswWlIclW1piFJUsnCWdTYFUGmuQysFPqImmV7yUh6xBE/ilPR
 bb2G6myBogFm4RPgPQrk+conHuGunajECg0n9cIdzK9XsFIwHOvJ5mFV1RUDGjbs
 ZNqm9qaxetcA0D+BTMmzHMm8am9RMW5W5xHeAzwGubxvVQ5DwqDd/2+Mf+3fMfTg
 YZ47bkm9K/StMh6cpwHU8/Epk21WTDsx2zpEdRJiFUZw5CT6/OzmtbcaRFmkse0p
 jVHxBm/tqOBWWPBV3MuZV4aGW4uImQHirEavkGqJTHITLQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jm6h7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 14:42:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5e2a31f75so810336585a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 07:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745937762; x=1746542562;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=95T6lUWWSMvDyPMIc22M5eNKHqFKHq2wCTghZ6/oaJE=;
 b=WCI92jrR6iSddoLKt6kdD278QBRK1+FUbZDmJs6Dc9kQRy5Nl7dlEsoIw10+TCFxbD
 J6/fjhcxyu74zAC2J8EJlrVgl4+8CiLRLlhoPTsH8L0Hk9dk4TgLDc2ULNBdqEmjNL3W
 4M22Wa4XUjh23XTunU/xvBxaXl3X5HmobZqzwCEiHm2flwNOk7uJldCikD00Zq3UfNrt
 FTJbwR9ZXwYBhDh4Nnv4bS31jWnEBFIyWKjrhwf2yW8ev8GOshIGoFuQGiq/9+/aR/Q2
 9TZS3o8AX+p6Q15feJ+shHEuO9w8fbAEGdHsK6r+WodalrOXrx+DWYB1QnlIpaZ7s8H/
 v8Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9Gkk1EXFUf7PLtTbZeer4OIyrhATfjAtcnKQuuVUpxC1ycFbe3PZpdia7SpHCE2RtAUiToEc/1s/O8A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz2sUDMe+TRpLtSHc23+WsaaZsEPQy6iOQIm1qT+y/drw6lE1sb
 xHqGYQyJAarpwHkD0SHcVTQZPZppTGXf5vCJWYBCIOexrVDQ21rtZT0Mexhp0Nk5ff/9Rpz8Gd4
 Fmen4JkuewSMnNATLhRjYM1hq0xRAZPzlTPW8qY6BaQ5Hd008zlGGS94RGJNzIOcw9fJQ1gnz5i
 WIENA=
X-Gm-Gg: ASbGncvNAROHKjOpjURXPTBYzHrTOBnCTONfAUuFsMUnaOraJdL3c7U+nI3Segm6rAA
 X/6Ffv4HTHx3qg6jr3yFqbcy1qg5v8puJOyW6CmG4f7BTu7KCeP45P0KogOb+w6ewTZf3ODAMMM
 IGaZ4VOPaDsKDIYk72lQ8Vw/vCdt8It7FzTJCcOBZLZe4kKitO1ExjB7KPGfHjphw/JLYybsQYC
 Lu3umg7xHeJofasNHSbhfUxRhYhpLXY+sk+T8DnJaqlfS8RF5aoE9oS75U1dWxWZIsXS44BeL5J
 /lQBfLuFmHBZ69Ghe23ypXpl525FntiKpDyVrhIc4YQXcRJO805hUAEgQK8Ukmsoi9m3JTlBXYQ
 =
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id
 af79cd13be357-7c9668cdc37mr2109278885a.58.1745937761681; 
 Tue, 29 Apr 2025 07:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDNJAkS5MxDnNhkLq8y60Bm1ZZecLba9P4Zw5IB7TV0UsyjpIf9foZNs6LWwIvq9tQDTlZsQ==
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id
 af79cd13be357-7c9668cdc37mr2109266985a.58.1745937761023; 
 Tue, 29 Apr 2025 07:42:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb26258sm1895708e87.17.2025.04.29.07.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 07:42:40 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:42:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Message-ID: <sdiwpe7nnhud3fvkgijjbfyenlwpchbxgehyxmsy7c5loo257h@hkfcawkjrlhd>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDExMCBTYWx0ZWRfX5jf7o4jqIqDw
 HWiPonUmTjx17v6gxwQq0G8JbkQB81io1m19gT3kZ2xHrOKo8wJRDaVcyL5L2YNusefzpC6kaZV
 qMUQ8T7Oznqq3bEP6Z0+WyCffnbXwSWCJT+RPU9yhI4jSCywqX0LY1iKrnZR1Ztm8zrxkqY/21h
 tbOQMgPQk8ozIssvhuPNW9xva/gtNhUO0RAcgtakw3818qR1imLvoa/06ZKkthz9I5m8S7qKjzJ
 A+JErT1/JqHpQeefquHdvXNoCXydgjT+7YgtVYcL0mswdCz6mRu1amghQRC/dc+eftTGFsw/DRt
 M+GPnatMDcwpLzt+EWKKUXIxhyHXxnYfkL4bajIhnBWyzKbD/J46K/TfG5St17wHqVCgmwyLJs0
 8vj7guSiT0+lIZxFNCsXpVy3GjlJ8sqLEI1BeqLAvbp/ukhY509YJnSNR4Wd3ECc0VSYpHuh
X-Proofpoint-GUID: W388FWLtlbzDyBY9zf_4s2Nftw0J2I77
X-Proofpoint-ORIG-GUID: W388FWLtlbzDyBY9zf_4s2Nftw0J2I77
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=6810e563 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=1X4oNAvfgwtBicUf-4YA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=967 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290110
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Herve Codina <herve.codina@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Adam Ford <aford173@gmail.com>, Anusha Srivatsa <asrivats@redhat.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Jani Nikula <jani.nikula@intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Pin-yen Lin <treapking@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Phong LE <ple@baylibre.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 freedreno@lists.freedesktop.org,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Guenter Roeck <groeck@chromium.org>, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Fabio Estevam <festevam@gmail.com>,
 Helge Deller <deller@gmx.de>, Sugar Zhang <sugar.zhang@rock-chips.com>,
 Ian Ray <ian.ray@ge.com>, Dharma Balasubiramani <dharma.b@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Kevin Hilman <khilman@baylibre.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 imx@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 platform-driver-x86@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Vitalii Mordan <mordan@ispras.ru>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Benson Leung <bleung@chromium.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 asahi@lists.linux.dev, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Shawn Guo <shawnguo@kernel.org>, Aleksandr Mishin <amishin@t-argos.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Janne Grunau <j@jannau.net>, Russell King <linux@armlinux.org.uk>,
 "Rob Herring \(Arm\)" <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-mediatek@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [Linux-stm32] (subset) [PATCH v2 00/34] drm: convert all
 bridges to devm_drm_bridge_alloc()
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

On Tue, Apr 29, 2025 at 11:27:51AM +0200, Louis Chauvet wrote:
> 
> On Thu, 24 Apr 2025 20:59:07 +0200, Luca Ceresoli wrote:
> > devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a DRM
> > bridge, and the only one supported from now on. It is also necessary for
> > implementing reference counting and thus needed to support removal of
> > bridges from a still existing DRM pipeline without use-after-free.
> > 
> > This series converts all DRM bridges to the new API.
> > 
> > [...]
> 
> Applied, thanks!
> 

[...]

> [16/34] drm/msm/dp: convert to devm_drm_bridge_alloc() API
>         commit: b2aabe5c6b65516d88214aba4b12ce2ca78bac6c
> [17/34] drm/msm/dsi: convert to devm_drm_bridge_alloc() API
>         commit: fffc8847743e45604c4478f554d628481b985556
> [18/34] drm/msm/hdmi: convert to devm_drm_bridge_alloc() API
>         commit: e11532be87e437648521a8ed5358c56df11933b4

Why? These drivers are explicitly handled outside of drm-misc. Please be
more careful next time.

-- 
With best wishes
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
