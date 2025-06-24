Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD1EAE62C5
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jun 2025 12:46:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B9D5C36B31;
	Tue, 24 Jun 2025 10:46:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D885C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jun 2025 10:46:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O89PlW018562;
 Tue, 24 Jun 2025 12:45:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 LowxC1XeO1Q3ptnV100NCfbZE/+FCacaRTlFDEZ7nw4=; b=NW+9A/iYDBIYOudx
 bupDVw7fFsOUiF1POCQhkWRdtrMnA2SQEgn3ffTStQz7psNYYvO1bykZpdgutoWy
 1WzDPo1HfRDTujMzGceUmoFF9dI3csRqk+OrSjX2U1Q82AHPZk0yuR9GirUQWEuY
 0uTXBDmqmhreOATOMkPOrAg+HFRtqZZO74LR/Kz8sUH5woYThZWMJktOCzrRuZP5
 jloxRIqQkKw51725g6fIFcIyiDtijqkG3NSDKgTMgLLmmSM6OD0+OHlCDgC/T3aL
 OBE2cZ+Obv2dvhAJpM9vhApHeFKzbOlpzSn/muvTc+F8R53Tnl46alaOILvOrx/r
 WA2Mzw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dkmjm6bk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Jun 2025 12:45:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5B79640046;
 Tue, 24 Jun 2025 12:44:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 974C5B51BAB;
 Tue, 24 Jun 2025 12:43:10 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 12:43:09 +0200
Message-ID: <5044c733-8836-43bd-85d7-0f552b000fb1@foss.st.com>
Date: Tue, 24 Jun 2025 12:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Gatien Chevallier
 <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
 <20250623-ddrperfm-upstream-v1-6-7dffff168090@foss.st.com>
 <9cb1575e-ae27-4a78-adb7-8a9e7072375e@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <9cb1575e-ae27-4a78-adb7-8a9e7072375e@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 06/13] perf: stm32: introduce DDRPERFM
	driver
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

T24gNi8yMy8yNSAxMTo0NSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKWy4uLl0KCkhpIEty
enlzenRvZiwKClNvcnJ5IEkgZm9yZ290IHRvIGFkZHJlc3MgY29tbWVudHMgYmVsb3cuCgo+PiAr
Cj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHN0bTMyX2Rkcl9wbXVfY2ZnIHN0bTMyX2Rkcl9wbXVf
Y2ZnX21wMSA9IHsKPj4gKwkucmVncyA9ICZzdG0zMl9kZHJfcG11X3JlZ3NwZWNfbXAxLAo+PiAr
CS5hdHRyaWJ1dGUgPSBzdG0zMl9kZHJfcG11X2F0dHJfZ3JvdXBzX21wMSwKPj4gKwkuY291bnRl
cnNfbmIgPSBNUDFfQ05UX05CLAo+PiArCS5ldnRfY291bnRlcnNfbmIgPSBNUDFfQ05UX05CIC0g
MSwgLyogVGltZSBjb3VudGVyIGlzIG5vdCBhbiBldmVudCBjb3VudGVyICovCj4+ICsJLnRpbWVf
Y250X2lkeCA9IE1QMV9USU1FX0NOVF9JRFgsCj4+ICsJLmdldF9jb3VudGVyID0gc3RtMzJfZGRy
X3BtdV9nZXRfZXZlbnRfY291bnRlcl9tcDEsCj4+ICt9Owo+PiArCj4+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IHN0bTMyX2Rkcl9wbXVfY2ZnIHN0bTMyX2Rkcl9wbXVfY2ZnX21wMiA9IHsKPj4gKwku
cmVncyA9ICZzdG0zMl9kZHJfcG11X3JlZ3NwZWNfbXAyLAo+PiArCS5hdHRyaWJ1dGUgPSBzdG0z
Ml9kZHJfcG11X2F0dHJfZ3JvdXBzX21wMiwKPj4gKwkuY291bnRlcnNfbmIgPSBNUDJfQ05UX05C
LAo+PiArCS5ldnRfY291bnRlcnNfbmIgPSBNUDJfQ05UX05CIC0gMSwgLyogVGltZSBjb3VudGVy
IGlzIGFuIGV2ZW50IGNvdW50ZXIgKi8KPj4gKwkudGltZV9jbnRfaWR4ID0gTVAyX1RJTUVfQ05U
X0lEWCwKPj4gKwkuZ2V0X2NvdW50ZXIgPSBzdG0zMl9kZHJfcG11X2dldF9ldmVudF9jb3VudGVy
X21wMiwKPj4gK307Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBzdG0z
Ml9kZHJfcG11X3BtX29wcyA9IHsKPj4gKwlTRVRfU1lTVEVNX1NMRUVQX1BNX09QUyhOVUxMLCBz
dG0zMl9kZHJfcG11X2RldmljZV9yZXN1bWUpCj4+ICt9Owo+PiArCj4+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBzdG0zMl9kZHJfcG11X29mX21hdGNoW10gPSB7Cj4+ICsJewo+
PiArCQkuY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMTMxLWRkci1wbXUiLAo+PiArCQkuZGF0YSA9
ICZzdG0zMl9kZHJfcG11X2NmZ19tcDEKPj4gKwl9LAo+PiArCXsKPj4gKwkJLmNvbXBhdGlibGUg
PSAic3Qsc3RtMzJtcDE1MS1kZHItcG11IiwKPj4gKwkJLmRhdGEgPSAmc3RtMzJfZGRyX3BtdV9j
ZmdfbXAxCj4gCj4gU28gZGV2aWNlcyBhcmUgY29tcGF0aWJsZSwgdGh1cyBleHByZXNzIGl0IGNv
cnJlY3RseSBhbmQgZHJvcCB0aGlzLgoKT2sgc28gSSBhc3N1bWUgdGhpcyBjb21lcyB3aXRoIHlv
dXIgY29tbWVudCBpbiB0aGUgYmluZGluZ3MgYW5kIApiYXNpY2FsbHkgZG9uJ3QgZ2V0IHlvdSBw
b2ludCBoZXJlLgpDYW4geW91IHBsZWFzZSBiZSBtb3JlIHByZWNpc2UgPwoKPiAKPj4gKwl9LAo+
PiArCXsKPj4gKwkJLmNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDI1MS1kZHItcG11IiwKPj4gKwkJ
LmRhdGEgPSAmc3RtMzJfZGRyX3BtdV9jZmdfbXAyCj4+ICsJfSwKPj4gKwl7IH0sCj4+ICt9Owo+
PiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3RtMzJfZGRyX3BtdV9vZl9tYXRjaCk7Cj4+ICsK
Pj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMyX2Rkcl9wbXVfZHJpdmVyID0g
ewo+PiArCS5kcml2ZXIgPSB7Cj4+ICsJCS5uYW1lID0gRFJJVkVSX05BTUUsCj4+ICsJCS5wbSA9
ICZzdG0zMl9kZHJfcG11X3BtX29wcywKPj4gKwkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hf
cHRyKHN0bTMyX2Rkcl9wbXVfb2ZfbWF0Y2gpLAo+IAo+IERyb3Agb2ZfbWF0Y2hfcHRyLCB5b3Ug
aGF2ZSBoZXJlIHdhcm5pbmdzLgoKWWVzIEluZGVlZC4KSSdsbCBhbHNvIGZpeCB0aGUgcG0gcG9p
bnRlciBieSB1c2luZyAicG1fc2xlZXBfcHRyIi4KCkJlc3QgcmVnYXJkcywKQ2zDqW1lbnQKCj4g
Cj4gCj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
