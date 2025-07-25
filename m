Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01070B12064
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 16:55:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48964C32EB0;
	Fri, 25 Jul 2025 14:55:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 720EBC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 14:55:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PCJhSE009250;
 Fri, 25 Jul 2025 16:54:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 EXHaox/1NzXqFsnH0dWanvrMBp8w7U0rZ5dj8B4pNPs=; b=m0jj0ZKW2V09n25s
 7B7U6M9MLZjvJcMWRYlZu2uFMoeeao9xbmKHMjp231wc1Gp9uJ4HcC8UklLPBTGC
 HTWTXgbC6XqRFU8qn68Fxm/2C7mfOYEEjoH3L0nmPMqHWADv7AcbyNsZ/tX/SrEH
 rQYs6bVDHl96QbwVaQLnkbATyLJrUKGt9anHUzsXgc2IeJzY+j7wo02hNDcoPKm3
 DSB5xGyi/yp2TLyA1KfNMc05VQx0e+AlozREVTRbbUAGcAD0asReA0mUXre8LULM
 XpTEtFaY8nJDqkhkeuyD2rbNFwh+uIwH1OJVtVHmyep5WVEsmMDd18//lFI0E8QJ
 8Y4cGg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 483w3j3kdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jul 2025 16:54:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D000040044;
 Fri, 25 Jul 2025 16:53:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC96979F3AB;
 Fri, 25 Jul 2025 16:52:16 +0200 (CEST)
Received: from [10.252.19.90] (10.252.19.90) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 16:52:15 +0200
Message-ID: <51f9e2bd-1129-4a82-b12a-72663e57ebda@foss.st.com>
Date: Fri, 25 Jul 2025 16:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-9-a59848e62cf9@foss.st.com>
 <85673db7-d311-47cc-be52-291d94e136e4@foss.st.com>
 <a00bb4e2-b0e8-44ef-bf14-5e4f5e60f9d0@foss.st.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <a00bb4e2-b0e8-44ef-bf14-5e4f5e60f9d0@foss.st.com>
X-Originating-IP: [10.252.19.90]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_04,2025-07-24_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 09/12] arm64: dts: st: add lvds support on
 stm32mp255
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

CgpPbiA3LzI1LzI1IDEzOjEzLCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToKPiBPbiA3LzI1LzI1
IDEzOjA4LCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToKPj4gSGkgUmFwaGFlbCwKPj4KPj4gT24g
Ny8yNS8yNSAxMjowNCwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPj4+IFRoZSBMVkRTIGlz
IHVzZWQgb24gU1RNMzJNUDIgYXMgYSBkaXNwbGF5IGludGVyZmFjZS4KPj4+Cj4+PiBBZGQgdGhl
IExWRFMgbm9kZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxy
YXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgo+Pj4gLS0tCj4+PiDCoCBhcmNoL2FybTY0
L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTUuZHRzaSB8IDEyICsrKysrKysrKysrKwo+Pj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU1LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvCj4+PiBk
dHMvc3Qvc3RtMzJtcDI1NS5kdHNpCj4+PiBpbmRleAo+Pj4gZjY4OWI0N2M1MDEwMDMzMTIwMTQ2
Y2YxOTU0ZDY2MjRjMDI3MDA0NS4uYTRkOTY1Zjc4NWZhNDJjNDU5NzQ5NDAxMDg1NWFlYzdlMWI5
ZmRkMQo+Pj4gMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAy
NTUuZHRzaQo+Pj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU1LmR0c2kK
Pj4+IEBAIC02LDYgKzYsMTggQEAKPj4+IMKgICNpbmNsdWRlICJzdG0zMm1wMjUzLmR0c2kiCj4+
PiDCoCAmcmlmc2Mgewo+Pj4gK8KgwqDCoCBsdmRzOiBsdmRzQDQ4MDYwMDAwIHsKPj4+ICvCoMKg
wqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInN0LHN0bTMybXAyNS1sdmRzIjsKPj4KPj4gRm9yIHRo
ZSBjb21wYXRpYmxlIHlvdSBub3cgbmVlZCBvbmUgY29tYXB0aWJsZSBwZXIgU29DLgo+PiBJdCBt
ZWFucyB5b3VyIGNvbXBhdGlibGUgc2hvdWxkIGxvb2sgbGlrZSA6ICJzdCxzdG0zMm1wMjUxLWx2
ZHMiLgo+PiBUaGlzIHdheSwgaWYgb24gdGhlIDI1MyBvciAyNTUgdGhlcmUgaXMgYW4gaXNzdWUg
eW91IGFyZSBhYmxlIHRvIGVhc2lseSBhZGQKPj4gbWF0Y2ggZGF0YSBpbiB0aGUgZHJpdmVyIHdp
dGggY29tcGF0aWJsZSAic3Qsc3RtMzJtcDI1My1sdmRzIiBvcgo+PiAic3Qsc3RtMzJtcDI1NS1s
dmRzIi4KPj4gQSBwcmlvciBkaXNjdXNzaW9uIG9uIHRoaXMgc3ViamVjdCBoYXMgYmVlbiByYWlz
ZWQgb24gbXkgVjEgb2YgSERQIGludm9sdmluZwo+PiBLcnp5c3p0b2YgYW5kIEFsZXhhbmRyZSA6
Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC80MThhODBhOS04YzA4LTRkZDEtIGJmNDkt
MWJkNzM3ODMyMWFhQGtlcm5lbC5vcmcvCj4gV29vcHMsIHRoaXMgY29tbWVudCBzaG91bGQgdGFy
Z2V0IHRoZSBhZGQgb2YgdGhlIGx0ZGMgY29tcGF0aWJsZSBhcyBJIHNlZSB0aGF0Cj4gbHZkcyBv
bmUgYWxyZWFkeSBleGlzdHMgYW5kIGNhbid0IGJlIGNoYW5nZWQuCj4gVGhvdWdoIHRoZSBtYWlu
IGlkZWEgaXMgaGVyZS4KCkluZGVlZCwgdGhlIGNvbXBhdGlibGUgaXMgd3JvbmcuCgpBZnRlciBj
YXJlZnVsbHkgcmVhZGluZyB0aGUgdGhyZWFkIHlvdSBwb2ludCB0bywgSSBzdWdnZXN0IHRoZSBm
b2xsb3dpbmc6CgoqIFJlbmFtZSB0aGUgbmV3IExUREMgY29tcGF0aWJsZSB0byAic3Qsc3RtMzJt
cDI1MS1sdGRjIgoqIEFkZCBhbm90aGVyIGNvbXBhdGlibGUgZm9yIHRoZSBMVkRTLiBTbyBpdCB3
b3VsZCBoYXZlICJzdCxzdG0zMm1wMjU1LWx2ZHMiLAphbmQgZmFsbHMgYmFjayB0byAic3Qsc3Rt
MzJtcDI1LWx2ZHMiLgoKTGlrZSBzbyB0aGUgTFZEUyBkcml2ZXIgd291bGQgbm90IGhhdmUgdG8g
YmUgbW9kaWZpZWQuCgpBbGV4LCBLcnp5c3p0b2YsIGRvZXMgdGhhdCBzZWVtIGdvb2QgdG8geW91
ID8KCkJlc3QgcmVnYXJkcywKUmFwaGHDq2wKPgo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgICNjbG9j
ay1jZWxscyA9IDwwPjsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHg0ODA2MDAwMCAweDIw
MDA+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwmcmNjIENLX0JVU19MVkRTPiwgPCZy
Y2MgQ0tfS0VSX0xWRFNQSFk+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gInBj
bGsiLCAicmVmIjsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXNldHMgPSA8JnJjYyBMVkRTX1I+Owo+
Pj4gK8KgwqDCoMKgwqDCoMKgIGFjY2Vzcy1jb250cm9sbGVycyA9IDwmcmlmc2MgODQ+Owo+Pj4g
K8KgwqDCoMKgwqDCoMKgIHBvd2VyLWRvbWFpbnMgPSA8JkNMVVNURVJfUEQ+Owo+Pj4gK8KgwqDC
oMKgwqDCoMKgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+PiArwqDCoMKgIH07Cj4+PiArCj4+PiDC
oMKgwqDCoMKgIHZkZWM6IHZkZWNANDgwZDAwMDAgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bXBhdGlibGUgPSAic3Qsc3RtMzJtcDI1LXZkZWMiOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJl
ZyA9IDwweDQ4MGQwMDAwIDB4M2M4PjsKPj4+Cj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gQ2zDqW1l
bnQKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
