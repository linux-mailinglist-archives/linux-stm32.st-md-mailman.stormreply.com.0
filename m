Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE5582431A
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jan 2024 14:51:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E713C6B476;
	Thu,  4 Jan 2024 13:51:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71029C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jan 2024 13:51:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 404AXOvq022627; Thu, 4 Jan 2024 14:51:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=au43nqK7nHZ8BJAhVEW3trO9826zxXlgdNutC4+DT1Y=; b=vP
 krYsx+7jfA0/FQ9Acpp/VHNZUmXIRAhIVuHq3tDml8QxhOrG8l9OIBMYLgB2PJdE
 4fzmztnfFVG17nwDJD0vmW7tm+LiegstY1zbKLffvs/v3b1gI952+7KM7fk2+JIa
 MMp/PbftaUayc1uYuVwFxWlXGbTV9xvUFyluEmzLy5l13FOG2o6UAlqi9ynqneOv
 J0UbYJtSrLp6GHBuQHCPcYsHq21/TGiGIVEfzIuav9t/cS/pnw83ngikvj2J/smZ
 6yJA2NkH5UKLQuAMcRzR0DFAvQ4Wp0U2h5kTKfpQEoOBatPAP2T6xY32fmEo945+
 vQvZDBNcgAuLCO829vDQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vdjtu2nrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jan 2024 14:51:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E4DB10002A;
 Thu,  4 Jan 2024 14:51:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D61322FA44;
 Thu,  4 Jan 2024 14:51:10 +0100 (CET)
Received: from [10.252.5.254] (10.252.5.254) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 4 Jan
 2024 14:51:08 +0100
Message-ID: <29b3092f-4d4d-4b6d-9667-aa04eddd2956@foss.st.com>
Date: Thu, 4 Jan 2024 14:51:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Horman <horms@kernel.org>
References: <20231204101113.276368-1-raphael.gallais-pou@foss.st.com>
 <20231204101113.276368-4-raphael.gallais-pou@foss.st.com>
 <20231208165855.GA8459@kernel.org>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20231208165855.GA8459@kernel.org>
X-Originating-IP: [10.252.5.254]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-04_07,2024-01-03_01,2023-05-22_02
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/4] drm/stm: dsi: expose DSI PHY
	internal clock
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

Ck9uIDEyLzgvMjMgMTc6NTgsIFNpbW9uIEhvcm1hbiB3cm90ZToKPiBPbiBNb24sIERlYyAwNCwg
MjAyMyBhdCAxMToxMToxMkFNICswMTAwLCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+Cj4g
Li4uCj4KPj4gQEAgLTUxNCwxOCArNjc1LDQwIEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfc3Rt
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAJCWRzaS0+bGFuZV9tYXhf
a2JwcyAqPSAyOwo+PiAgCX0KPj4gIAo+PiAtCWR3X21pcGlfZHNpX3N0bV9wbGF0X2RhdGEuYmFz
ZSA9IGRzaS0+YmFzZTsKPj4gLQlkd19taXBpX2RzaV9zdG1fcGxhdF9kYXRhLnByaXZfZGF0YSA9
IGRzaTsKPj4gKwlkc2ktPnBkYXRhID0gKnBkYXRhOwo+PiArCWRzaS0+cGRhdGEuYmFzZSA9IGRz
aS0+YmFzZTsKPj4gKwlkc2ktPnBkYXRhLnByaXZfZGF0YSA9IGRzaTsKPj4gKwo+PiArCWRzaS0+
cGRhdGEubWF4X2RhdGFfbGFuZXMgPSAyOwo+PiArCWRzaS0+cGRhdGEucGh5X29wcyA9ICZkd19t
aXBpX2RzaV9zdG1fcGh5X29wczsKPj4gIAo+PiAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYs
IGRzaSk7Cj4+ICAKPj4gLQlkc2ktPmRzaSA9IGR3X21pcGlfZHNpX3Byb2JlKHBkZXYsICZkd19t
aXBpX2RzaV9zdG1fcGxhdF9kYXRhKTsKPj4gKwlkc2ktPmRzaSA9IGR3X21pcGlfZHNpX3Byb2Jl
KHBkZXYsICZkc2ktPnBkYXRhKTsKPj4gIAlpZiAoSVNfRVJSKGRzaS0+ZHNpKSkgewo+PiAgCQly
ZXQgPSBQVFJfRVJSKGRzaS0+ZHNpKTsKPj4gIAkJZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgIkZh
aWxlZCB0byBpbml0aWFsaXplIG1pcGkgZHNpIGhvc3RcbiIpOwo+PiAgCQlnb3RvIGVycl9kc2lf
cHJvYmU7Cj4+ICAJfQo+PiAgCj4+ICsJLyoKPj4gKwkgKiBXZSBuZWVkIHRvIHdhaXQgZm9yIHRo
ZSBnZW5lcmljIGJyaWRnZSB0byBwcm9iZSBiZWZvcmUgZW5hYmxpbmcgYW5kCj4+ICsJICogcmVn
aXN0ZXIgdGhlIGludGVybmFsIHBpeGVsIGNsb2NrLgo+PiArCSAqLwo+PiArCXJldCA9IGNsa19w
cmVwYXJlX2VuYWJsZShkc2ktPnBjbGspOwo+PiArCWlmIChyZXQpIHsKPj4gKwkJRFJNX0VSUk9S
KCIlczogRmFpbGVkIHRvIGVuYWJsZSBwZXJpcGhlcmFsIGNsa1xuIiwgX19mdW5jX18pOwo+PiAr
CQlnb3RvIGVycl9kc2lfcHJvYmU7Cj4+ICsJfQo+PiArCj4+ICsJcmV0ID0gZHdfbWlwaV9kc2lf
Y2xrX3JlZ2lzdGVyKGRzaSwgZGV2KTsKPj4gKwlpZiAocmV0KSB7Cj4+ICsJCURSTV9FUlJPUigi
RmFpbGVkIHRvIHJlZ2lzdGVyIERTSSBwaXhlbCBjbG9jazogJWRcbiIsIHJldCk7Cj4gSGkgUmFw
aGFlbCwKCkhpIFNpbW9uLAoKWW91IGFyZSByaWdodCzCoCBkc2ktPmNsayBuZWVkcyB0byBiZSBk
aXNhYmxlZCBpbiBjYXNlIHRoZSBjbG9jayByZWdpc3RlciBmYWlscwpiZWZvcmUgZXhpdGluZyB0
aGUgcHJvYmUuCgpJJ3ZlIHNlbnQgYSB2Mywgd2hpY2ggbm9ybWFsbHkgZml4ZXMgaXQuCgoKUmVn
YXJkcywKClJhcGhhw6tsCgo+Cj4gRG9lcyBjbGtfZGlzYWJsZV91bnByZXBhcmUoZHNpLT5wY2xr
KSBuZWVkIHRvIGJlIGFkZGVkIHRvIHRoaXMgdW53aW5kCj4gY2hhaW4/Cj4KPiBGbGFnZ2VkIGJ5
IFNtYXRjaC4KPgo+PiArCQlnb3RvIGVycl9kc2lfcHJvYmU7Cj4+ICsJfQo+PiArCj4+ICsJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKGRzaS0+cGNsayk7Cj4+ICsKPj4gIAlyZXR1cm4gMDsKPj4gIAo+
PiAgZXJyX2RzaV9wcm9iZToKPiAuLi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
