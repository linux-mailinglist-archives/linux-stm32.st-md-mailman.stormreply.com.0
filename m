Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B97F9B2F433
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Aug 2025 11:40:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D0BEC3F954;
	Thu, 21 Aug 2025 09:40:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED378C3F953
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 09:40:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L73mkn017291;
 Thu, 21 Aug 2025 11:39:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 WlqqfI0U0npfmgU+tmlUwSHbK4ZelsnQ4LVffls/8aw=; b=n5hHxiHwTKdbVyRl
 vHBWgMduDM+tlhtZeSXTi/mGPgVEsu/HOgOcBgDrwFVAPAVlc6/35j9oQpPweKad
 b2qSUj3MTwx77kAkK3nbKgC77W4lGqLmIjx7LNzvM/UjDvLLrDJrMHOuAU6CtxCr
 xjP3lYfEXbJUS0nBw/4kiq15Gi9Rf9+B5RecphEiZFJCv1mCLprGvM8uV+5MUVZT
 fO1CxdWtOi6kMZTY82cKed2gYCB3d7Ds4+8ggAbvIlE4ywU/hhm9sKiDDh5r8zpz
 /8z7stmnBupg7HBOfEsgTrji6B2v+Hp+gya+hzkvCOsMcbEyZJRxy1z+LDv1JwVz
 vEpSJg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n70de72d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Aug 2025 11:39:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3446F40046;
 Thu, 21 Aug 2025 11:37:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3EAD73DB5A;
 Thu, 21 Aug 2025 11:36:15 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 11:36:14 +0200
Message-ID: <86adb9ce-68de-494f-92e8-6e11773987fe@foss.st.com>
Date: Thu, 21 Aug 2025 11:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
 <20250811-drm-clk-round-rate-v2-7-4a91ccf239cf@redhat.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-7-4a91ccf239cf@redhat.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
Cc: imx@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 7/9] drm/stm/lvds: convert from
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgQnJpYW4sCgp0aGFua3MgZm9yIHRoZSBwYXRjaC4KCkFja2VkLWJ5OiBZYW5uaWNrIEZlcnRy
ZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+CgpMZSAxMS8wOC8yMDI1IMOgIDEyOjU2LCBC
cmlhbiBNYXNuZXkgYSDDqWNyaXTCoDoKPiBUaGUgcm91bmRfcmF0ZSgpIGNsayBvcHMgaXMgZGVw
cmVjYXRlZCwgc28gbWlncmF0ZSB0aGlzIGRyaXZlciBmcm9tCj4gcm91bmRfcmF0ZSgpIHRvIGRl
dGVybWluZV9yYXRlKCkgdXNpbmcgdGhlIENvY2NpbmVsbGUgc2VtYW50aWMgcGF0Y2gKPiBvbiB0
aGUgY292ZXIgbGV0dGVyIG9mIHRoaXMgc2VyaWVzLgo+Cj4gQWNrZWQtYnk6IFJhcGhhZWwgR2Fs
bGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogQnJpYW4gTWFzbmV5IDxibWFzbmV5QHJlZGhhdC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vc3RtL2x2ZHMuYyB8IDEyICsrKysrKystLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vc3RtL2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHZkcy5jCj4gaW5kZXggMDc3
ODhlOGQzZDgzMDJhMzk1MWU5N2Q2NDczNmI3MjEwMzM5OThkMy4uZmUzOGMwOTg0YjJiNTUyZTFj
Y2FlZjRkMWU1ODliOWQ4NmE0MGVlMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3Rt
L2x2ZHMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHZkcy5jCj4gQEAgLTY4Miw4ICs2
ODIsOCBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBsdmRzX3BpeGVsX2Nsa19yZWNhbGNfcmF0ZShz
dHJ1Y3QgY2xrX2h3ICpodywKPiAgIAlyZXR1cm4gKHVuc2lnbmVkIGxvbmcpbHZkcy0+cGl4ZWxf
Y2xvY2tfcmF0ZTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgbG9uZyBsdmRzX3BpeGVsX2Nsa19yb3Vu
ZF9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LCB1bnNpZ25lZCBsb25nIHJhdGUsCj4gLQkJCQkgICAg
ICB1bnNpZ25lZCBsb25nICpwYXJlbnRfcmF0ZSkKPiArc3RhdGljIGludCBsdmRzX3BpeGVsX2Ns
a19kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPiArCQkJCQkgc3RydWN0IGNsa19y
YXRlX3JlcXVlc3QgKnJlcSkKPiAgIHsKPiAgIAlzdHJ1Y3Qgc3RtX2x2ZHMgKmx2ZHMgPSBjb250
YWluZXJfb2YoaHcsIHN0cnVjdCBzdG1fbHZkcywgbHZkc19ja19weCk7Cj4gICAJdW5zaWduZWQg
aW50IHBsbF9pbl9raHosIGJkaXYgPSAwLCBtZGl2ID0gMCwgbmRpdiA9IDA7Cj4gQEAgLTcwMyw3
ICs3MDMsNyBAQCBzdGF0aWMgbG9uZyBsdmRzX3BpeGVsX2Nsa19yb3VuZF9yYXRlKHN0cnVjdCBj
bGtfaHcgKmh3LCB1bnNpZ25lZCBsb25nIHJhdGUsCj4gICAJbW9kZSA9IGxpc3RfZmlyc3RfZW50
cnkoJmNvbm5lY3Rvci0+bW9kZXMsCj4gICAJCQkJc3RydWN0IGRybV9kaXNwbGF5X21vZGUsIGhl
YWQpOwo+ICAgCj4gLQlwbGxfaW5fa2h6ID0gKHVuc2lnbmVkIGludCkoKnBhcmVudF9yYXRlIC8g
MTAwMCk7Cj4gKwlwbGxfaW5fa2h6ID0gKHVuc2lnbmVkIGludCkocmVxLT5iZXN0X3BhcmVudF9y
YXRlIC8gMTAwMCk7Cj4gICAKPiAgIAlpZiAobHZkc19pc19kdWFsX2xpbmsobHZkcy0+bGlua190
eXBlKSkKPiAgIAkJbXVsdGlwbGllciA9IDI7Cj4gQEAgLTcxOSwxNCArNzE5LDE2IEBAIHN0YXRp
YyBsb25nIGx2ZHNfcGl4ZWxfY2xrX3JvdW5kX3JhdGUoc3RydWN0IGNsa19odyAqaHcsIHVuc2ln
bmVkIGxvbmcgcmF0ZSwKPiAgIAlsdmRzLT5waXhlbF9jbG9ja19yYXRlID0gKHVuc2lnbmVkIGxv
bmcpcGxsX2dldF9jbGtvdXRfa2h6KHBsbF9pbl9raHosIGJkaXYsIG1kaXYsIG5kaXYpCj4gICAJ
CQkJCSAqIDEwMDAgKiBtdWx0aXBsaWVyIC8gNzsKPiAgIAo+IC0JcmV0dXJuIGx2ZHMtPnBpeGVs
X2Nsb2NrX3JhdGU7Cj4gKwlyZXEtPnJhdGUgPSBsdmRzLT5waXhlbF9jbG9ja19yYXRlOwo+ICsK
PiArCXJldHVybiAwOwo+ICAgfQo+ICAgCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMg
bHZkc19waXhlbF9jbGtfb3BzID0gewo+ICAgCS5lbmFibGUgPSBsdmRzX3BpeGVsX2Nsa19lbmFi
bGUsCj4gICAJLmRpc2FibGUgPSBsdmRzX3BpeGVsX2Nsa19kaXNhYmxlLAo+ICAgCS5yZWNhbGNf
cmF0ZSA9IGx2ZHNfcGl4ZWxfY2xrX3JlY2FsY19yYXRlLAo+IC0JLnJvdW5kX3JhdGUgPSBsdmRz
X3BpeGVsX2Nsa19yb3VuZF9yYXRlLAo+ICsJLmRldGVybWluZV9yYXRlID0gbHZkc19waXhlbF9j
bGtfZGV0ZXJtaW5lX3JhdGUsCj4gICB9Owo+ICAgCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGNs
a19pbml0X2RhdGEgY2xrX2RhdGEgPSB7Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
