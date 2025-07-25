Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A1FB11D5B
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 13:16:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 257D2C3089D;
	Fri, 25 Jul 2025 11:16:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E97ECC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 11:16:13 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PAXQj6003648;
 Fri, 25 Jul 2025 13:15:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 bvHvjwd6XOG8gaFWJcVrEpn5/3TbrGK3z3uZ5mkkCQ4=; b=KwR+EWxBDubt5KZK
 KwTbP7hwmwQB918hKeREw1OoQlG78H3x+rh43s42Cjq4rbrZC2aVqeQ3H6cm2UAE
 opBjmNl9Lz/uXptDv6+oPJy5zUhCAoQzU3hMzAvDRyi8BwfSV7K7tPsZAbPaSWaC
 jc23JYGcJppcXjF4an+x9dqZ5eqShkjxIbB4sof2tZiqIgaNjv7PfkOz1afK8d5W
 iRCoF6bzj6SWpGnHhnXe/zpXEmaFMlbf3aOumMNiUjT8XCntqQXgHkuaonTeqOhS
 Rlq0blQ71ejJWutjyN9F5RvgR+qPbxDdXS0kJqCFBXqRgOGIiCNt9+ITfOSLKCOB
 Y/8O1g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 483w3m2trd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jul 2025 13:15:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DB8284004B;
 Fri, 25 Jul 2025 13:14:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D0D137A632;
 Fri, 25 Jul 2025 13:13:24 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 13:13:23 +0200
Message-ID: <a00bb4e2-b0e8-44ef-bf14-5e4f5e60f9d0@foss.st.com>
Date: Fri, 25 Jul 2025 13:13:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre
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
Content-Language: en-US
In-Reply-To: <85673db7-d311-47cc-be52-291d94e136e4@foss.st.com>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gNy8yNS8yNSAxMzowOCwgQ2xlbWVudCBMRSBHT0ZGSUMgd3JvdGU6Cj4gSGkgUmFwaGFlbCwK
PiAKPiBPbiA3LzI1LzI1IDEyOjA0LCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+PiBUaGUg
TFZEUyBpcyB1c2VkIG9uIFNUTTMyTVAyIGFzIGEgZGlzcGxheSBpbnRlcmZhY2UuCj4+Cj4+IEFk
ZCB0aGUgTFZEUyBub2RlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91
IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9hcm02
NC9ib290L2R0cy9zdC9zdG0zMm1wMjU1LmR0c2kgfCAxMiArKysrKysrKysrKysKPj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1NS5kdHNpIGIvYXJjaC9hcm02NC9ib290LyAKPj4gZHRz
L3N0L3N0bTMybXAyNTUuZHRzaQo+PiBpbmRleCAKPj4gZjY4OWI0N2M1MDEwMDMzMTIwMTQ2Y2Yx
OTU0ZDY2MjRjMDI3MDA0NS4uYTRkOTY1Zjc4NWZhNDJjNDU5NzQ5NDAxMDg1NWFlYzdlMWI5ZmRk
MSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU1LmR0c2kK
Pj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU1LmR0c2kKPj4gQEAgLTYs
NiArNiwxOCBAQAo+PiDCoCAjaW5jbHVkZSAic3RtMzJtcDI1My5kdHNpIgo+PiDCoCAmcmlmc2Mg
ewo+PiArwqDCoMKgIGx2ZHM6IGx2ZHNANDgwNjAwMDAgewo+PiArwqDCoMKgwqDCoMKgwqAgY29t
cGF0aWJsZSA9ICJzdCxzdG0zMm1wMjUtbHZkcyI7Cj4gCj4gRm9yIHRoZSBjb21wYXRpYmxlIHlv
dSBub3cgbmVlZCBvbmUgY29tYXB0aWJsZSBwZXIgU29DLgo+IEl0IG1lYW5zIHlvdXIgY29tcGF0
aWJsZSBzaG91bGQgbG9vayBsaWtlIDogInN0LHN0bTMybXAyNTEtbHZkcyIuCj4gVGhpcyB3YXks
IGlmIG9uIHRoZSAyNTMgb3IgMjU1IHRoZXJlIGlzIGFuIGlzc3VlIHlvdSBhcmUgYWJsZSB0byBl
YXNpbHkgCj4gYWRkIG1hdGNoIGRhdGEgaW4gdGhlIGRyaXZlciB3aXRoIGNvbXBhdGlibGUgInN0
LHN0bTMybXAyNTMtbHZkcyIgb3IgCj4gInN0LHN0bTMybXAyNTUtbHZkcyIuCj4gQSBwcmlvciBk
aXNjdXNzaW9uIG9uIHRoaXMgc3ViamVjdCBoYXMgYmVlbiByYWlzZWQgb24gbXkgVjEgb2YgSERQ
IAo+IGludm9sdmluZyBLcnp5c3p0b2YgYW5kIEFsZXhhbmRyZSA6Cj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzQxOGE4MGE5LThjMDgtNGRkMS0gCj4gYmY0OS0xYmQ3Mzc4MzIxYWFAa2Vy
bmVsLm9yZy8KV29vcHMsIHRoaXMgY29tbWVudCBzaG91bGQgdGFyZ2V0IHRoZSBhZGQgb2YgdGhl
IGx0ZGMgY29tcGF0aWJsZSBhcyBJIApzZWUgdGhhdCBsdmRzIG9uZSBhbHJlYWR5IGV4aXN0cyBh
bmQgY2FuJ3QgYmUgY2hhbmdlZC4KVGhvdWdoIHRoZSBtYWluIGlkZWEgaXMgaGVyZS4KCj4gCj4+
ICvCoMKgwqDCoMKgwqDCoCAjY2xvY2stY2VsbHMgPSA8MD47Cj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZWcgPSA8MHg0ODA2MDAwMCAweDIwMDA+Owo+PiArwqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZy
Y2MgQ0tfQlVTX0xWRFM+LCA8JnJjYyBDS19LRVJfTFZEU1BIWT47Cj4+ICvCoMKgwqDCoMKgwqDC
oCBjbG9jay1uYW1lcyA9ICJwY2xrIiwgInJlZiI7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXNldHMg
PSA8JnJjYyBMVkRTX1I+Owo+PiArwqDCoMKgwqDCoMKgwqAgYWNjZXNzLWNvbnRyb2xsZXJzID0g
PCZyaWZzYyA4ND47Cj4+ICvCoMKgwqDCoMKgwqDCoCBwb3dlci1kb21haW5zID0gPCZDTFVTVEVS
X1BEPjsKPj4gK8KgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+ICvCoMKgwqAg
fTsKPj4gKwo+PiDCoMKgwqDCoMKgIHZkZWM6IHZkZWNANDgwZDAwMDAgewo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMjUtdmRlYyI7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCByZWcgPSA8MHg0ODBkMDAwMCAweDNjOD47Cj4+Cj4gCj4gQmVzdCByZWdhcmRzLAo+
IENsw6ltZW50CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
