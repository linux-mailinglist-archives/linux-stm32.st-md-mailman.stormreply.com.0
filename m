Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5315BAC51DF
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 17:22:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05DD5C36B19;
	Tue, 27 May 2025 15:22:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E9C7C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 15:22:25 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCGuLT003391;
 Tue, 27 May 2025 17:22:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 hbHNouSnQewHtCw/SpQZz4t8tZtV7Zvd/CNWYDPfUXg=; b=dqZKUk+AjY8oTCLb
 yIybiOmE6D7Wl7tTUckvFudQYRN0SGBHIqLAeWFYLoLjaP3OjnDWpz5tQnkkT6lO
 OctAbTkeANzoV711TYQSJd8HD2FwGAKA8h2+NuLzumklUt9rqX5x5PELo5yc2xPQ
 xTMUaTvyeuM+rt66BjhdNtF/Y0F6ch9krfc31geOikyR8vsMfQHwU4sRwHRKKEE8
 FOWwAgbSvtxN73BjNOCm9jOtD8nmLtJWZgk7A4GdKwk+EqDFZ7rifjx0C36Y6wFj
 1KZdeFEaZuyY/4wQGEpcakGSLIXI+EjeNyFj+IBvAAbasb+VmFv6BAy5dpzOoozu
 QIaIBQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u5f24s5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 17:22:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3764F40046;
 Tue, 27 May 2025 17:19:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 06CEDB1A49A;
 Tue, 27 May 2025 17:18:47 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 17:18:46 +0200
Message-ID: <6b9ad1a0-4f7d-498e-ac0d-49ac41a2532b@foss.st.com>
Date: Tue, 27 May 2025 17:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 "amelie.delaunay@foss.st.com" <amelie.delaunay@foss.st.com>
References: <20250524100319.22521-1-himanshu.bhavani@siliconsignals.io>
 <20250524100319.22521-2-himanshu.bhavani@siliconsignals.io>
 <9d3df716-343f-4c32-9e2e-2058bc1a9b6f@foss.st.com>
 <PN0P287MB201936022C3BF4389C7BF8B79A64A@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <PN0P287MB201936022C3BF4389C7BF8B79A64A@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Roan van Dijk <roan@protonic.nl>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v1 1/2] ARM: dts: stm32: add support of
 stm32mp157f-dk2 board
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

SGkgSGltYW5zaHUKCk9uIDUvMjcvMjUgMDg6MzYsIEhpbWFuc2h1IEJoYXZhbmkgd3JvdGU6Cj4g
SGkgQWxleGFuZHJlLAo+IAo+PiBIaSBIaW1hbnNodQo+Pgo+PiBPbiA1LzI0LzI1IDEyOjAzLCBI
aW1hbnNodSBCaGF2YW5pIHdyb3RlOgo+Pj4gU1RNMzJNUDE1N0YgaXMgc2ltaWxhciB0byB0aGUg
U1RNMzJNUDE1N0MsIHNvIHJldXNlIHRoZSBleGlzdGluZwo+Pj4gc3RtMzJtcDE1N2MtZGsyLmR0
cyBhcyBhIGJhc2UgZm9yIHRoZSBTVE0zMk1QMTU3Ri1ESzIgYm9hcmQuCj4+Pgo+Pj4gRGF0YXNo
ZWV0OiBodHRwczovL3d3dy5zdC5jb20vcmVzb3VyY2UvZW4vZGF0YV9icmllZi9zdG0zMm1wMTU3
Zi1kazIucGRmCj4+PiBTaWduZWQtb2ZmLWJ5OiBIaW1hbnNodSBCaGF2YW5pIDxoaW1hbnNodS5i
aGF2YW5pQHNpbGljb25zaWduYWxzLmlvPgo+Pj4gLS0tCj4+PiAgwqDCoCBhcmNoL2FybS9ib290
L2R0cy9zdC9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKystCj4+PiAgwqDC
oCBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTU3Zi1kazIuZHRzIHwgMTUgKysrKysrKysr
KysrKysrCj4+PiAgwqDCoCAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPj4+ICDCoMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9z
dC9zdG0zMm1wMTU3Zi1kazIuZHRzCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3N0L01ha2VmaWxlIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3QvTWFrZWZpbGUKPj4+IGluZGV4
IDYwZDU1NTE2ZjcyMy4uMzgxNzk2MzhlNWViIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvc3QvTWFrZWZpbGUKPj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L01ha2VmaWxl
Cj4+PiBAQCAtNzAsNyArNzAsOCBAQCBkdGItJChDT05GSUdfQVJDSF9TVE0zMikgKz0gXAo+Pj4g
IMKgwqDCoMKgwqDCoCBzdG0zMm1wMTU3Yy1seGEtdGFjLWdlbjIuZHRiIFwKPj4+ICDCoMKgwqDC
oMKgwqAgc3RtMzJtcDE1N2Mtb2R5c3NleS5kdGIgXAo+Pj4gIMKgwqDCoMKgwqDCoCBzdG0zMm1w
MTU3Yy1vc2QzMm1wMS1yZWQuZHRiIFwKPj4+IC3CoMKgwqDCoCBzdG0zMm1wMTU3Yy1waHljb3Jl
LXN0bTMybXAxLTMuZHRiCj4+PiArwqDCoMKgwqAgc3RtMzJtcDE1N2MtcGh5Y29yZS1zdG0zMm1w
MS0zLmR0YiBcCj4+PiArwqDCoMKgwqAgc3RtMzJtcDE1N2YtZGsyLmR0Ygo+Pj4gIMKgwqAgZHRi
LSQoQ09ORklHX0FSQ0hfVTg1MDApICs9IFwKPj4+ICDCoMKgwqDCoMKgwqAgc3RlLXNub3diYWxs
LmR0YiBcCj4+PiAgwqDCoMKgwqDCoMKgIHN0ZS1ocmVmcHJldjYwLXN0dWliLmR0YiBcCj4+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2YtZGsyLmR0cyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdmLWRrMi5kdHMKPj4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmFiNDA2YjJjNDRjMQo+Pj4gLS0tIC9kZXYv
bnVsbAo+Pj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2YtZGsyLmR0cwo+
Pj4gQEAgLTAsMCArMSwxNSBAQAo+Pj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMCsgT1IgQlNELTMtQ2xhdXNlKQo+Pj4gKy8qCj4+PiArICogQ29weXJpZ2h0IChDKSAyMDI1
IFNpbGljb24gU2lnbmFscyBQdnQuIEx0ZC4KPj4+ICsgKgo+Pj4gKyAqIEF1dGhvcjogSGltYW5z
aHUgQmhhdmFuaSA8aGltYW5zaHUuYmhhdmFuaUBzaWxpY29uc2lnbmFscy5pbz4KPj4+ICsgKi8K
Pj4+ICsKPj4+ICsvZHRzLXYxLzsKPj4+ICsKPj4+ICsjaW5jbHVkZSAic3RtMzJtcDE1N2MtZGsy
LmR0cyIKPj4KPj4gSW4gdGhpcyBjYXNlIHdoYXQgaXMgdGhlIGFpbSBvZiB0aGlzIHNlcmllcyBp
ZiB5b3UganVzdCB1c2Ugc3RtMzJtcDE1N0MKPj4gZGV2aWNldHJlZSA/Cj4gCj4gVGhpcyBwYXRj
aCBzZXJpZXMgYWltcyB0byBhZGQgc3VwcG9ydCBmb3IgdGhlIFNUTTMyTVAxNTdGIGJvYXJkIGRl
dmljZQo+IHRyZWUuIFRoZSBwcmltYXJ5IG1vdGl2YXRpb24gaXMgdG8gZW5zdXJlIHRoYXQgdXNl
cnMgd29ya2luZyB3aXRoIHRoZQo+IFNUTTMyTVAxNTdGIHZhcmlhbnQgaGF2ZSBhIHJlZmVyZW5j
ZSBEVFMgYXZhaWxhYmxlLiBDdXJyZW50bHksIG5vIHN1Y2gKPiBkZXZpY2UgdHJlZSBleGlzdHMs
IGV2ZW4gdGhvdWdoIHRoZSBTVE0zMk1QMTU3RiBhbmQgU1RNMzJNUDE1N0MgYXJlCj4gbGFyZ2Vs
eSBzaW1pbGFyLgo+IAo+PiBTVCBwZW9wbGUgKG1haW5seSBBbcOpbGllKSBhcmUgcHJlcGFyaW5n
IGEgZnVsbCBzdXBwb3J0IG9mCj4+IFNUTTMyTVAxNTdGLURLMiBsZXZlcmFnaW5nIHRoZSBGIHZh
cmlhbnQgY29tcGFyZSB0byB0aGUgQyB2YXJpYW50Lgo+PiBTZXJpZXMgd2lsbCBiZSBzZW50IHRo
aXMgd2Vlay4KPiAKPiBJZiBTVCBpcyB3b3JraW5nIG9uIGEgZGVkaWNhdGVkIERUUyBmb3IgdGhl
IEYgdmFyaWFudCwgaXQncyBsaWtlbHkgdGhleSBhcmUgc3RhcnRpbmcKPiBmcm9tIHRoZSBDIHZh
cmlhbnQgYXMgYSBiYXNlLCB0aGlzIGlzIGV4YWN0bHkgdGhlIGFwcHJvYWNoIEnigJl2ZSB0YWtl
biBoZXJlLiBBdCB0aGlzCj4gc3RhZ2UsIEkgaGF2ZSBub3QgaW5jbHVkZWQgYW4gU0NNSS1iYXNl
ZCB2ZXJzaW9uIG9mIHRoZSBib2FyZCBzaW5jZSBpdCBoYXNuJ3QKPiBiZWVuIHRlc3RlZCB5ZXQu
CgpQbGVhc2UgaGF2ZSBhIGxvb2sgb246CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NTA1Mjctc3RtMzJtcDE1N2YtZGsyLXYxLTAtOGFlZjg4NWE0OTI4QGZvc3Muc3QuY29tLwoKVGhl
IGlkZWEgaXMgdG8gaGF2ZSB0aGUgc2FtZSBhcHByb2FjaCB0aGFuIGZvciBTVE0zMk1QMTMgYW5k
IFNUTTMyTVAyNSAKcmVseWluZyBvbiBTQ01JIGFuZCBwcmVwYXJpbmcgdGhlIGFkZCBvZiBGIHZh
cmlhbnQgZmVhdHVyZTogRFZGUy9jcHVmcmVxLgoKcmVnYXJkcwphbGV4CgoKPiBQbGVhc2UgbGV0
IG1lIGtub3cgaWYgeW91IGhhdmUgYW55IGZ1cnRoZXIgc3VnZ2VzdGlvbnMuCj4gCj4gCj4gQmVz
dCBSZWdhcmRzLAo+IEhpbWFuc2h1Cj4gCj4+IFJlZ2FyZHMKPj4gQWxleAo+Pgo+Pj4gKwo+Pj4g
Ky8gewo+Pj4gK8KgwqDCoMKgIG1vZGVsID0gIlNUTWljcm9lbGVjdHJvbmljcyBTVE0zMk1QMTU3
Ri1ESzIgRGlzY292ZXJ5IEJvYXJkIjsKPj4+ICvCoMKgwqDCoCBjb21wYXRpYmxlID0gInN0LHN0
bTMybXAxNTdmLWRrMiIsICJzdCxzdG0zMm1wMTU3IjsKPj4+ICt9OwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
