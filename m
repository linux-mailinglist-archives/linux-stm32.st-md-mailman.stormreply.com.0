Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A18FDA46CA9
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 21:44:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69A31C7A833;
	Wed, 26 Feb 2025 20:44:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8DD1C7A830
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 20:44:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QG2v7O015427;
 Wed, 26 Feb 2025 21:43:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 soQ5BkZDufwYMdgMJdG7Zd6+UrF3nw3Qs6ixs6vY/CM=; b=6jTbVLkocKgNzD6j
 Y/2AYcivvlHsnAgchC1i19FlTLWjy2/Dl/Dyx+v5WaESHovbd3tpxosNSRjjv6FC
 zbcDphxZ+h0rc5bJoAAXPFgjoA9PpK7823zFRc/4/jKZ9nknFWX8rEYmmdHexX/7
 bmUN9BmFoVtFIpAAPMKmY0q+CVneVa7zsksQfphYbUf/KppXC0YQ2hx/My1Buby6
 HPsOOmfkMvhpAPGEBhyju4qcL1aPWoROj07o6guNinEP2MPtp8dB+8MbWuZTMXWQ
 KDVrdwQ4+xgiyWoNCccx7fxkUXKKMe7HeCev2w/MBb2eNy3JeGzOHxBJuuO+COPN
 sppSaw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psuekdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2025 21:43:39 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 04D6E4008B;
 Wed, 26 Feb 2025 21:42:20 +0100 (CET)
Received: by euls16034.sgp.st.com (STMicroelectronics, from userid 89)
 id 744C145206A; Wed, 26 Feb 2025 19:14:03 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4EC05332BB;
 Wed, 26 Feb 2025 19:14:03 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 19:14:03 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 19:14:02 +0100
Message-ID: <157348a3-9b22-4196-b4b1-ee8fcc46a84d@foss.st.com>
Date: Wed, 26 Feb 2025 19:14:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250224180150.3689638-1-fabrice.gasnier@foss.st.com>
 <20250224180150.3689638-5-fabrice.gasnier@foss.st.com>
 <20250225-purring-herring-of-reputation-1aed2f@krzk-bin>
 <2df7bdd9-5072-4a9a-b142-1e1e3f20130c@foss.st.com>
Content-Language: en-US
In-Reply-To: <2df7bdd9-5072-4a9a-b142-1e1e3f20130c@foss.st.com>
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_06,2025-02-26_01,2024-11-22_01
Cc: robh@kernel.org, conor+dt@kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 ukleinek@kernel.org, linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
 will@kernel.org, tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH 4/8] clocksource: stm32-lptimer: add
	stm32mp25 support
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

T24gMi8yNS8yNSAxNTo1NywgRmFicmljZSBHYXNuaWVyIHdyb3RlOgo+IE9uIDIvMjUvMjUgMTM6
MDIsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+IE9uIE1vbiwgRmViIDI0LCAyMDI1IGF0
IDA3OjAxOjQ2UE0gKzAxMDAsIEZhYnJpY2UgR2FzbmllciB3cm90ZToKPj4+IEZyb206IFBhdHJp
Y2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+Pgo+Pj4gQWRkIHRo
ZSBzdXBwb3J0IG9mIHRoZSBuZXcgY29tcGF0aWJsZSBmb3IgU1RNMzJNUDI1IFNvQyBpbiBkcml2
ZXIsIGFzCj4+PiBkZXNjcmliZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21mZC9zdCxzdG0zMi1scHRpbWVyLnlhbWwKPj4+IGFuZCB1c2VkIGluIGFyY2gvYXJtNjQvYm9v
dC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sg
RGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBGYWJyaWNlIEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KPj4+IC0tLQo+
Pj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItc3RtMzItbHAuYyB8IDEgKwo+Pj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
b2Nrc291cmNlL3RpbWVyLXN0bTMyLWxwLmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN0
bTMyLWxwLmMKPj4+IGluZGV4IGE0Yzk1MTYxY2IyMi4uZGIwNTUzNDhlMmNjIDEwMDY0NAo+Pj4g
LS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1zdG0zMi1scC5jCj4+PiArKysgYi9kcml2
ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN0bTMyLWxwLmMKPj4+IEBAIC0xOTcsNiArMTk3LDcgQEAg
c3RhdGljIGludCBzdG0zMl9jbGtldmVudF9scF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+Pj4gIAo+Pj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN0bTMy
X2Nsa2V2ZW50X2xwX29mX21hdGNoW10gPSB7Cj4+PiAgCXsgLmNvbXBhdGlibGUgPSAic3Qsc3Rt
MzItbHB0aW1lci10aW1lciIsIH0sCj4+PiArCXsgLmNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDI1
LWxwdGltZXItdGltZXIiLCB9LAo+Pj4gIAl7fSwKPj4KPj4gU2FtZSBxdWVzdGlvbi4KPiAKPiBP
b3BzLCBJIGp1c3QgZmlndXJlZCBvdXQgSSBoYXZlIG1pc3NlZCBhIGNoYW5nZSB0byB0aGlzIGRy
aXZlciwgdG8KPiBlbmFibGUgaW50ZXJydXB0cywgaW4gb3JkZXIgdG8gY29tcGx5IHdpdGggdGhl
IExQVGltZXIgc3BlYywgc3RhcnRpbmcKPiB3aXRoIFNUTTMyTVAyNS4KPiAKPiBFLmcuIHdpdGgg
ZWFybGllciBTVE0zMk1QMTMsIFNUTTMyTVAxNSBvciBldmVuIFNUTTMySDc6Cj4gKiBUaGUgTFBU
SU1fSUVSIHJlZ2lzdGVyIG11c3Qgb25seSBiZSBtb2RpZmllZCB3aGVuIHRoZSBMUFRJTSBpcwo+
IGRpc2FibGVkIChFTkFCTEUgYml0IHJlc2V0IHRvIOKAmDDigJkpCj4gCj4gT24gU1RNMzJNUDI1
Ogo+ICogVGhlIExQVElNeF9ESUVSIHJlZ2lzdGVyIG11c3Qgb25seSBiZSBtb2RpZmllZCB3aGVu
IHRoZSBMUFRJTSBpcwo+IGVuYWJsZWQgKEVOQUJMRSBiaXQgc2V0IHRvIDEpCj4gCj4gSSdsbCBh
ZGQgdGhpcyBhcyBjb21wYXRpYmxlIGRhdGEgaW4gbmV4dCByZXZpc2lvbi4KClRoaXMgaXMgc3Bl
Y2lmaWMgYmVoYXZpb3IsIHRvIHRoZSBuZXcgcmV2aXNpb24gb2YgdGhlIExQVGltZXIgaGFyZHdh
cmUuCkl0IGNhbiBiZSByZWFkIGZyb20gcmV2aXNpb24vaWRlbnRpZmljYXRpb24gcmVnaXN0ZXJz
LiBTbyB0aGlzIG5ldwpjb21wYXRpYmxlIGNhbiBiZSBkcm9wcGVkLgoKSSdsbCByZW1vdmUgInN0
LHN0bTMybXAyNS1scHRpbWVyLXRpbWVyIiBjb21wYXRpYmxlIHN0cmluZyBpbiBuZXh0IHJldmlz
aW9uLgoKVGhhbmtzIGZvciByZXZpZXdpbmcsCkJSLApGYWJyaWNlCgo+IAo+IEJlc3QgcmVnYXJk
cywKPiBGYWJyaWNlCj4gCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gS3J6eXN6dG9mCj4+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
