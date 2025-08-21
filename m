Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6381CB2F42B
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Aug 2025 11:40:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FF74C3F954;
	Thu, 21 Aug 2025 09:40:11 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 912B2C3F953
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 09:40:10 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L8uf03028719;
 Thu, 21 Aug 2025 11:39:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 kHxcorhp5czLlBBNNIvPxeZEYbfShmd+8rRbKqHVLQc=; b=x54WHZWtHoVtnKSh
 GwXIq32qEehSt5QN4pnCvtl8/TiFHUGkCVxLDpTAaQktot64B36wulxk1ei+r5EB
 q4oJU0m5ApNcrcGtHJTtGKf8JmVGtpf2P+Nqv7T7elfSWoaqyewnWBbT/y30hkyM
 QztQ5odjdA0mMraCkgbl+w7JGJlgWV4xAyEG9fI/kLcwVxziU/qGhGPxTAw20d6i
 hM/4vG1IQ1AxUrf3PLjbdmzhAQKlbABlritN7UG4B85uzMmfNcd9IrPQzWD/XlfS
 /PHF7fjxPPYQDRwv1ACERxT7tPpV8bBLheQgLG2lpZ+jXslc/76fxC3S4Xlo4gTt
 cUUJxA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48n81wnyun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Aug 2025 11:39:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 50FE64002D;
 Thu, 21 Aug 2025 11:36:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3FF873DB4E;
 Thu, 21 Aug 2025 11:35:26 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 11:35:25 +0200
Message-ID: <ea6b8999-4f5d-4cc2-b92b-b0776c2b1363@foss.st.com>
Date: Thu, 21 Aug 2025 11:35:24 +0200
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
 <20250811-drm-clk-round-rate-v2-6-4a91ccf239cf@redhat.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-6-4a91ccf239cf@redhat.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 6/9] drm/stm/dw_mipi_dsi-stm: convert
 from round_rate() to determine_rate()
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
dS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jIHwgMTQgKysrKysrKystLS0tLS0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMKPiBpbmRleCAyYzdiYzA2NGJjNjZjNmE1ODkwM2EyMDdj
YmU4MDkxYTE0MjMxYzJiLi41OGVhZTY4MDRjYzgyZDE3NDMyMzc0NDIwNmJlNzA0NjU2OGI5MDVj
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jCj4gQEAgLTI3NCw4ICsy
NzQsOCBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBkd19taXBpX2RzaV9jbGtfcmVjYWxjX3JhdGUo
c3RydWN0IGNsa19odyAqaHcsCj4gICAJcmV0dXJuICh1bnNpZ25lZCBsb25nKXBsbF9vdXRfa2h6
ICogMTAwMDsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgbG9uZyBkd19taXBpX2RzaV9jbGtfcm91bmRf
cmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZyByYXRlLAo+IC0JCQkJICAgICAg
IHVuc2lnbmVkIGxvbmcgKnBhcmVudF9yYXRlKQo+ICtzdGF0aWMgaW50IGR3X21pcGlfZHNpX2Ns
a19kZXRlcm1pbmVfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywKPiArCQkJCQkgIHN0cnVjdCBjbGtf
cmF0ZV9yZXF1ZXN0ICpyZXEpCj4gICB7Cj4gICAJc3RydWN0IGR3X21pcGlfZHNpX3N0bSAqZHNp
ID0gY2xrX3RvX2R3X21pcGlfZHNpX3N0bShodyk7Cj4gICAJdW5zaWduZWQgaW50IGlkZiwgbmRp
diwgb2RmLCBwbGxfaW5fa2h6LCBwbGxfb3V0X2toejsKPiBAQCAtMjgzLDE0ICsyODMsMTQgQEAg
c3RhdGljIGxvbmcgZHdfbWlwaV9kc2lfY2xrX3JvdW5kX3JhdGUoc3RydWN0IGNsa19odyAqaHcs
IHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiAgIAo+ICAgCURSTV9ERUJVR19EUklWRVIoIlxuIik7Cj4g
ICAKPiAtCXBsbF9pbl9raHogPSAodW5zaWduZWQgaW50KSgqcGFyZW50X3JhdGUgLyAxMDAwKTsK
PiArCXBsbF9pbl9raHogPSAodW5zaWduZWQgaW50KShyZXEtPmJlc3RfcGFyZW50X3JhdGUgLyAx
MDAwKTsKPiAgIAo+ICAgCS8qIENvbXB1dGUgYmVzdCBwbGwgcGFyYW1ldGVycyAqLwo+ICAgCWlk
ZiA9IDA7Cj4gICAJbmRpdiA9IDA7Cj4gICAJb2RmID0gMDsKPiAgIAo+IC0JcmV0ID0gZHNpX3Bs
bF9nZXRfcGFyYW1zKGRzaSwgcGxsX2luX2toeiwgcmF0ZSAvIDEwMDAsCj4gKwlyZXQgPSBkc2lf
cGxsX2dldF9wYXJhbXMoZHNpLCBwbGxfaW5fa2h6LCByZXEtPnJhdGUgLyAxMDAwLAo+ICAgCQkJ
CSAmaWRmLCAmbmRpdiwgJm9kZik7Cj4gICAJaWYgKHJldCkKPiAgIAkJRFJNX1dBUk4oIldhcm5p
bmcgZHNpX3BsbF9nZXRfcGFyYW1zKCk6IGJhZCBwYXJhbXNcbiIpOwo+IEBAIC0yOTgsNyArMjk4
LDkgQEAgc3RhdGljIGxvbmcgZHdfbWlwaV9kc2lfY2xrX3JvdW5kX3JhdGUoc3RydWN0IGNsa19o
dyAqaHcsIHVuc2lnbmVkIGxvbmcgcmF0ZSwKPiAgIAkvKiBHZXQgdGhlIGFkanVzdGVkIHBsbCBv
dXQgdmFsdWUgKi8KPiAgIAlwbGxfb3V0X2toeiA9IGRzaV9wbGxfZ2V0X2Nsa291dF9raHoocGxs
X2luX2toeiwgaWRmLCBuZGl2LCBvZGYpOwo+ICAgCj4gLQlyZXR1cm4gcGxsX291dF9raHogKiAx
MDAwOwo+ICsJcmVxLT5yYXRlID0gcGxsX291dF9raHogKiAxMDAwOwo+ICsKPiArCXJldHVybiAw
Owo+ICAgfQo+ICAgCj4gICBzdGF0aWMgaW50IGR3X21pcGlfZHNpX2Nsa19zZXRfcmF0ZShzdHJ1
Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZyByYXRlLAo+IEBAIC0zNTEsNyArMzUzLDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfb3BzIGR3X21pcGlfZHNpX3N0bV9jbGtfb3BzID0gewo+
ICAgCS5kaXNhYmxlID0gZHdfbWlwaV9kc2lfY2xrX2Rpc2FibGUsCj4gICAJLmlzX2VuYWJsZWQg
PSBkd19taXBpX2RzaV9jbGtfaXNfZW5hYmxlZCwKPiAgIAkucmVjYWxjX3JhdGUgPSBkd19taXBp
X2RzaV9jbGtfcmVjYWxjX3JhdGUsCj4gLQkucm91bmRfcmF0ZSA9IGR3X21pcGlfZHNpX2Nsa19y
b3VuZF9yYXRlLAo+ICsJLmRldGVybWluZV9yYXRlID0gZHdfbWlwaV9kc2lfY2xrX2RldGVybWlu
ZV9yYXRlLAo+ICAgCS5zZXRfcmF0ZSA9IGR3X21pcGlfZHNpX2Nsa19zZXRfcmF0ZSwKPiAgIH07
Cj4gICAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
