Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74272B06142
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 16:35:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36750C3F933;
	Tue, 15 Jul 2025 14:35:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 764C4C3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 14:35:30 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FE4gGV025660;
 Tue, 15 Jul 2025 16:34:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 dgu36HNp6Ey5tbWJzea7xTs+Q7Z2LXx/xuvpNQ1pA7w=; b=EDaNcNLd5XIOq7Sr
 WEFVM9cWVQkLDtI+tD5DoTxUM1/PjExjGSx895DC4+l386R7fL28nPGPptNoSqxq
 eAdz2y9fmkQPer6/hLzzgavwPgIVa+JQIJbEd2TgJiw2sMrN3uCfIma3AeiVT9+y
 GKX/c3E236Qy1buK2A4KGTLtvfS5A0A9SI+WYNctil/EZO1NOz59AVfITTfdHEHc
 xZZL0kRPox+X+93cIKfd+woucWbm2t4V3Ecc6BfuuUZBQMZy7qhUG7ZnWmvUrscN
 6rWp21CgMYxQ+5IhN3Lzaq1gzMSuLq6lcYk1SnIt2d1VE1Enh8n7zGKsmnWkq6tp
 muaJoA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47ud4mp9pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jul 2025 16:34:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B01FE40045;
 Tue, 15 Jul 2025 16:31:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1DE1BAFFBB;
 Tue, 15 Jul 2025 16:29:28 +0200 (CEST)
Received: from [10.130.74.78] (10.130.74.78) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 16:29:27 +0200
Message-ID: <1df0432a-b950-4baf-93f1-25ced11ab243@foss.st.com>
Date: Tue, 15 Jul 2025 16:29:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-6-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-6-601b9ea384c3@redhat.com>
X-Originating-IP: [10.130.74.78]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-15_01,2025-03-28_01
Cc: imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 6/9] drm/stm/dw_mipi_dsi-stm: convert from
 round_rate() to determine_rate()
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

CgpPbiA3LzEwLzI1IDE5OjQzLCBCcmlhbiBNYXNuZXkgd3JvdGU6Cj4gVGhlIHJvdW5kX3JhdGUo
KSBjbGsgb3BzIGlzIGRlcHJlY2F0ZWQsIHNvIG1pZ3JhdGUgdGhpcyBkcml2ZXIgZnJvbQo+IHJv
dW5kX3JhdGUoKSB0byBkZXRlcm1pbmVfcmF0ZSgpIHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNlbWFu
dGljIHBhdGNoCj4gb24gdGhlIGNvdmVyIGxldHRlciBvZiB0aGlzIHNlcmllcy4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPgo+IC0tLQoKSGkgQnJp
YW4sCgpBY2tlZC1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBm
b3NzLnN0LmNvbT4KClRoYW5rcyAhCgpCZXN0IHJlZ2FyZHMsClJhcGhhw6tsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
