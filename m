Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F28831BF9
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jan 2024 16:07:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FB63C6DD6E;
	Thu, 18 Jan 2024 15:07:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93921C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jan 2024 15:07:27 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40I9TAE3019271; Thu, 18 Jan 2024 16:07:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=vFS8aLbSD8UDCY9TOifRYsHJeeKAdBfSeHqJo15h+XE=; b=hj
 k1SxoKdho21gk5m3VLBVzAdy/FjHWE056pqHiLzLfWpZCEIISMzeVSPZhyJlXSiK
 T/iztAfeC+pDsEG+RaIJoWcktjKHTYxyAUA0EIhUtASSdY75fF9KpcHuIeyxptz5
 yNAuIju3xlnz9AcuobI8TDbHzwsgxoS7H98pUzvnLYg+zEI5Lf4Y/veWxCxK2uyF
 BX0C++Lc944BDb2KJlnE7hkQ3MVNb25g86Xp0z7hwlqvr/GL0PpwkGPp6J4CijY2
 5HRlyijy2SIXx04MfgCX56XRrNvT+tkVzqwOhvI92fdJrQU9ZuMKV5BF50/OhoFJ
 jGlD2Vu+KM3saGZbQ+aw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmfyssw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jan 2024 16:07:00 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E3CB110007D;
 Thu, 18 Jan 2024 16:06:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D222322FA3A;
 Thu, 18 Jan 2024 16:06:57 +0100 (CET)
Received: from [10.129.178.37] (10.129.178.37) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 18 Jan
 2024 16:06:57 +0100
Message-ID: <23be859d-e757-4b59-b4ca-acf9b4dd1f9e@foss.st.com>
Date: Thu, 18 Jan 2024 16:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh@kernel.org>
References: <20240115132009.101718-1-raphael.gallais-pou@foss.st.com>
 <20240115132009.101718-2-raphael.gallais-pou@foss.st.com>
 <20240115154659.GA815331-robh@kernel.org>
 <3479c5d7-a9c3-40cf-a415-b8324f160ec7@foss.st.com>
 <e42818b2-8826-48f8-b9bd-35cbf464a08f@linaro.org>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <e42818b2-8826-48f8-b9bd-35cbf464a08f@linaro.org>
X-Originating-IP: [10.129.178.37]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_08,2024-01-17_01,2023-05-22_02
Cc: dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/6] dt-bindings: display: add
 dt-bindings for STM32 LVDS device
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

Ck9uIDEvMTYvMjQgMDg6NDIsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gT24gMTUvMDEv
MjAyNCAxNzo1MSwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPj4gT24gMS8xNS8yNCAxNjo0
NiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+PiBPbiBNb24sIEphbiAxNSwgMjAyNCBhdCAwMjoyMDow
NFBNICswMTAwLCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+Pj4+IEFkZCAic3Qsc3RtMzJt
cDI1LWx2ZHMiIGNvbXBhdGlibGUuCj4+Pj4KPiBBIG5pdCwgc3ViamVjdDogZHJvcCBzZWNvbmQv
bGFzdCwgcmVkdW5kYW50ICJkdC1iaW5kaW5ncyBmb3IiLiBUaGUKPiAiZHQtYmluZGluZ3MiIHBy
ZWZpeCBpcyBhbHJlYWR5IHN0YXRpbmcgdGhhdCB0aGVzZSBhcmUgYmluZGluZ3MuCj4gU2VlIGFs
c286Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNy1yYzgvc291cmNlL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0I0wx
OAo+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxs
YWlzLXBvdUBmb3NzLnN0LmNvbT4KPj4+PiAtLS0KPj4+PiBEZXBlbmRzIG9uOiAiZHQtYmluZGlu
Z3M6IHN0bTMyOiBhZGQgY2xvY2tzIGFuZCByZXNldCBiaW5kaW5nIGZvcgo+Pj4+IAkgICAgc3Rt
MzJtcDI1IHBsYXRmb3JtIiBieSBHYWJyaWVsIEZlcm5hbmRlego+Pj4+Cj4+Pj4gQ2hhbmdlcyBp
biB2MzoKPj4+PiAJLSBDbGFyaWZ5IGNvbW1pdCBkZXBlbmRlbmN5Cj4+Pj4gCS0gRml4IGluY2x1
ZGVzIGluIHRoZSBleGFtcGxlCj4+Pj4gCS0gRml4IFlBTUwKPj4+PiAJLSBBZGQgImNsb2NrLWNl
bGxzIiBkZXNjcmlwdGlvbgo+Pj4+IAktIHMvcmVncm91cHMvaXMgY29tcG9zZWQgb2YvCj4+Pj4g
CS0gQ2hhbmdlZCBjb21wYXRpYmxlIHRvIHNob3cgU29DIHNwZWNpZmljaXR5Cj4+Pj4KPj4+PiBD
aGFuZ2VzIGluIHYyOgo+Pj4+IAktIFN3aXRjaCBjb21wYXRpYmxlIGFuZCBjbG9jay1jZWxscyBy
ZWxhdGVkIGFyZWFzCj4+Pj4gCS0gUmVtb3ZlIGZhdWx0eSAjaW5jbHVkZSBpbiB0aGUgZXhhbXBs
ZS4KPj4+PiAJLSBBZGQgZW50cnkgaW4gTUFJTlRBSU5FUlMKPj4+PiAtLS0KPj4+PiAgLi4uL2Jp
bmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItbHZkcy55YW1sICAgICAgIHwgMTE5ICsrKysrKysrKysr
KysrKysrKwo+Pj4gRmlsZW5hbWUgbWF0Y2hpbmcgY29tcGF0aWJsZS4KPj4gSGkgUm9iLAo+Pgo+
Pgo+PiBJIHdhcyB1bnN1cmUgYWJvdXQgdGhpcy4KPj4KPj4gVGhlIGRyaXZlciB3aWxsIGV2ZW50
dWFsbHkgc3VwcG9ydCBzZXZlcmFsIFNvQ3Mgd2l0aCBkaWZmZXJlbnQgY29tcGF0aWJsZXMsCj4+
IHdvdWxkbid0IHRoaXMgYmUgbW9yZSBjb25mdXNpbmcgPwo+IE5vLiAiRXZlbnR1YWxseSIgbWln
aHQgbmV2ZXIgaGFwcGVuLgo+Cj4+IEkgYWxzbyB3YW50ZWQgdG8ga2VlcCB0aGUgc2ltaWxhcml0
eSB3aXRoIHRoZSAic3Qsc3RtMzItPGlwPi55YW1sIiBuYW1lIGZvciB0aGUKPj4gRFJNIFNUTSBk
cml2ZXJzLiBXb3VsZCB0aGF0IGJlIHBvc3NpYmxlID8KPiBCdXQgd2h5PyBUaGUgY29uc2lzdGVu
Y3kgd2Ugd2FudCBpcyB0aGUgZmlsZW5hbWUgbWF0Y2hpbmcgY29tcGF0aWJsZSwKPiBub3QgbWF0
Y2hpbmcgb3RoZXIgZmlsZW5hbWVzLiBJZiB5b3UgaGF2ZSBoZXJlIG11bHRpcGxlIGRldmljZXMs
Cj4gZG9jdW1lbnQgdGhlbSAqbm93Ki4KCgpIaSBLcnp5c3p0b2YsCgp8VGhlcmUgaXMgbm8gbXVs
dGlwbGUgZGV2aWNlcywgc28gSSB3aWxsIHN0aWNrIHRvIHRoZSAic3Qsc3RtMzJtcDI1LWx2ZHMi
CnBhdHRlcm4gZm9yIG5vdy58Cgo+Cj4+Cj4+IFJlZ2FyZHMsCj4+Cj4+IFJhcGhhw6tsCj4gSSBo
b3BlIHlvdSBkaWQgbm90IGlnbm9yZSByZXN0IG9mIHRoZSBjb21tZW50cy4uLiBXZSBleHBlY3Qg
c29tZSBzb3J0IG9mCj4gImFjay9vay9JJ2xsIGZpeC93aGF0ZXZlciIgbWVzc2FnZSBhbmQgeW91
IHdyb3RlIG5vdGhpbmcgZnVydGhlci4KCkFsdGhvdWdoIEkgZGlkIG5vdCBhY2tub3dsZWRnZWQg
d2hhdCBoYXMgYmVlbiBzYWlkIHByZXZpb3VzbHksIEkgYWx3YXlzIHRha2UKaW50byBhY2NvdW50
IGV2ZXJ5IGNvbW1lbnQgb24gbXkgcGF0Y2hlcy4gIEkgdW5kZXJzdGFuZCB0aGF0IGl0IGNhbiBs
ZWFkIHRvIHNvbWUgY29uZnVzaW9uLiAgU28gcmVzdCBhc3N1cmVkIHRoYXQgSSBkaWQgbm90Cmln
bm9yZSBSb2IncyBhbmQgRG1pdHJ5J3MgcmV2aWV3LgoKClJlZ2FyZHMsCgpSYXBoYcOrbAoKPgo+
IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
