Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1728A2196B
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 09:51:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 671F8C78026;
	Wed, 29 Jan 2025 08:51:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0C4EC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 08:51:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T70Awj014044;
 Wed, 29 Jan 2025 09:51:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 K4w3bUSNuMoGr2Kig4zaKtlQZ0vMGzt2g+mK00D8dss=; b=tMvjzHGTjT58kuPG
 X0FNR92wGAnCeJMLNfeQFLG0aDfxwj/uiGbml2Ii/aOgWYwPzqCvNSKYu4GqOQB1
 q1zub79jG4YxfVTmRzRjhsB+0NFWyp48k9O6ZEYsIMKxNY2J/mhhgIeJ6OrLvqo3
 XiabZikb1wAXVUlZonEdRkJ7cBZsOTPLe9GSPXYeYVWaleVh0N8Kj77R2pgesZ7X
 Ga/mTCjDbvKDu4U8caR4kWuElNBbKqk0rjZNvInU3YgFQoW7db0zqsD8Ws6CJOHt
 kG5vTlESpG9lepXzb7FzZ9WgFpxyOQLUtHyCGovn59v9A9BRx26SxRnrp2kjgeKl
 zKhhZA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44f41325qu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 09:51:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8809B40054;
 Wed, 29 Jan 2025 09:50:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E0912ACA61;
 Wed, 29 Jan 2025 09:47:36 +0100 (CET)
Received: from [10.129.178.211] (10.129.178.211) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 29 Jan
 2025 09:47:34 +0100
Message-ID: <5131c24e-fb8d-45f1-9b1b-e65b2613e85f@foss.st.com>
Date: Wed, 29 Jan 2025 09:47:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, Alison Wang
 <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao
 <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Alexey Brodkin <abrodkin@synopsys.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-10-0d1609a29587@redhat.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250128-cocci-memory-api-v1-10-0d1609a29587@redhat.com>
X-Originating-IP: [10.129.178.211]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 10/14] drm/stm: move to
 devm_platform_ioremap_resource() usage
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

Ck9uIDEvMjgvMjUgMjM6MjksIEFudXNoYSBTcml2YXRzYSB3cm90ZToKPiBSZXBsYWNlIHBsYXRm
b3JtX2dldF9yZXNvdXJjZSArIGRldm1faW9yZW1hcF9yZXNvdXJjZQo+IHdpdGgganVzdCBkZXZt
X3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UoKQo+Cj4gVXNlZCBDb2NjaW5lbGxlIHRvIGRvIHRo
aXMgY2hhbmdlLiBTbVBsIHBhdGNoOgo+IEBydWxlXzFACj4gaWRlbnRpZmllciByZXM7Cj4gZXhw
cmVzc2lvbiBpb3JlbWFwX3JlczsKPiBpZGVudGlmaWVyIHBkZXY7Cj4gQEAKPiAtc3RydWN0IHJl
c291cmNlICpyZXM7Cj4gLi4uCj4gLXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LC4u
Lik7Cj4gLWlvcmVtYXBfcmVzID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKC4uLik7Cj4gK2lvcmVt
YXBfcmVzID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsMCk7Cj4KPiBDYzog
WWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgo+IENjOiBSYXBoYWVs
IEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgo+IENjOiBQaGls
aXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAZm9zcy5zdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
QW51c2hhIFNyaXZhdHNhIDxhc3JpdmF0c0ByZWRoYXQuY29tPgoKCkhpIEFudXNoYSwKCgpUaGFu
a3MgZm9yIHlvdXIgd29yayAhCkFja2VkLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVs
LmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgoKClJlZ2FyZHMsClJhcGhhw6tsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
