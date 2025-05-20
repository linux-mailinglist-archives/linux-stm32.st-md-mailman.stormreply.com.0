Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 155D7ABD715
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 13:42:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4630C78F99;
	Tue, 20 May 2025 11:41:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02A84C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 11:41:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K9UC8E021011;
 Tue, 20 May 2025 13:41:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 UExusS9wGruu2jirSHupY+orQc1NwlzDHTp5gtaUL6E=; b=GzTXMwsiZejt1O8H
 HSMOo4JJMYdWKi4XLUZACmweuNUHMXMcoKBaBK4izDYF74vuwBPhTZk6IexHobg/
 qK9I73asI1F+eYDQZiyzxP43hKUrX/gpKv/++Q/63O4zRbJXsKcyIXJRe8YtHdoV
 RPwyyY04Tk6DjBcJZpMMLx0wfWgVldqOE1FvIgNQm9RI5S0gb+O/faMVPHN8vYO7
 xVKBfv+hc1nAbKmBD0/cmEDphgVskJ4VOESdBzuwEbJOODz1O+/U82sx8FwgyLMU
 7hCq2HGWxCcmbZsgQoNFKYIKbh+ZOklyV2oLZ5i1xQm8eShnTM2y/drHpPFlUzAG
 h0IOcQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pht1w43t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 13:41:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1C0F740049;
 Tue, 20 May 2025 13:38:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4B551AE2BFA;
 Tue, 20 May 2025 13:37:16 +0200 (CEST)
Received: from [10.252.29.31] (10.252.29.31) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 13:37:13 +0200
Message-ID: <b1d3f93b-8206-481b-bd8a-d7c0953e0ea5@foss.st.com>
Date: Tue, 20 May 2025 13:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-15-b8bc1f16d7aa@bootlin.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-15-b8bc1f16d7aa@bootlin.com>
X-Originating-IP: [10.252.29.31]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hui Pu <Hui.Pu@gehealthcare.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <lumag@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, freedreno@lists.freedesktop.org
Subject: Re: [Linux-stm32] [PATCH v3 15/22] drm/bridge: stm_lvds: convert to
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgTHVjYSwKCk9uIDUvOS8yNSAxNTo1MywgTHVjYSBDZXJlc29saSB3cm90ZToKPiBUaGlzIGlz
IHRoZSBuZXcgQVBJIGZvciBhbGxvY2F0aW5nIERSTSBicmlkZ2VzLgo+Cj4gU2lnbmVkLW9mZi1i
eTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4KPgo+IC0tLQo+Cj4g
Q2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4gQ2M6
IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KPiBDYzogUGhpbGlw
cGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QGZvc3Muc3QuY29tPgo+IENjOiBSYXBoYWVsIEdhbGxh
aXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgo+IENjOiBZYW5uaWNrIEZl
cnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4gLS0tCgpJIHdlbnQgYXdheSBmcm9t
IGtleWJvYXJkIGZvciBzb21lIHRpbWUuwqAgU29ycnkgZm9yIHRoZSBkZWxheSA6CgpBY2tlZC1i
eTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4K
CgpSZWdhcmRzLApSYXBoYcOrbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
