Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDB9B31899
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 15:00:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B13AFC3F95B;
	Fri, 22 Aug 2025 13:00:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29AA2C3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 13:00:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MCoe7v030096;
 Fri, 22 Aug 2025 14:59:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 fdRuwvgpdfkzMUyKr6tHlpFHvNuuCdXxV4D+HC6QaMA=; b=KI/XT+6MJhFi2WeZ
 w5MTkk1UGOx796nFOR/zy+WvJGJudHm7jyOVRGMaXPZ8w3xyHBktOam8O+P/3qVX
 VHDVymxUsP8rpSaly0cSlknRRPL6vW9aO4zwzjIUFMukfMXWBkOUO/R1oZ8meTeE
 +3JvIr4Rbjysy0r1W0Q/J9U7xURtq1A05uWJ4tvY912gefWrZ6GZBa/HvUhyXXpX
 HxiAMdLAgdqNKPU1FHAuEoJ9zVdZywDzhv7Qk6PQCRxrdKDMtOL2kaUPbwAAgvuw
 htF5OKdOLwYHZctSLYtibJWJz5iaAjqC+/wUYlz1RUa9qnLm8+DKybMjl1Az8Lhr
 hFtBYg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48np7n77uc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Aug 2025 14:59:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 23DE04004B;
 Fri, 22 Aug 2025 14:58:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4281871EE31;
 Fri, 22 Aug 2025 14:57:40 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 14:57:39 +0200
Message-ID: <7278430c-0b01-4a35-b1c0-b906e6cf464a@foss.st.com>
Date: Fri, 22 Aug 2025 14:57:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
References: <20250821-drm-misc-next-v4-0-7060500f8fd3@foss.st.com>
 <20250821-drm-misc-next-v4-9-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-9-7060500f8fd3@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 09/13] arm64: dts: st: add ltdc support
	on stm32mp251
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

SGkgUmFwaGFlbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKQWNrZWQtYnk6IFlhbm5pY2sgRmVy
dHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KCkxlIDIxLzA4LzIwMjUgw6AgMTM6MDgs
IFJhcGhhZWwgR2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPiBUaGUgTENELVRGVCBEaXNwbGF5IENv
bnRyb2xsZXIgKExUREMpIGhhbmRsZXMgZGlzcGxheSBjb21wb3NpdGlvbiwKPiBzY2FsaW5nIGFu
ZCByb3RhdGlvbi4gIEl0IHByb3ZpZGVzIGEgcGFyYWxsZWwgZGlnaXRhbCBSR0IgZmxvdyB0byBi
ZQo+IHVzZWQgYnkgZGlzcGxheSBpbnRlcmZhY2VzLgo+Cj4gQWRkIHRoZSBMVERDIG5vZGUuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91
QGZvc3Muc3QuY29tPgo+IC0tLQo+ICAgYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUx
LmR0c2kgfCAxMiArKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0
c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaQo+IGluZGV4IDMwM2Fi
ZjkxNWI4ZTQ4OTY3MWI1MWE4YzgzMjA0MWMxNGE0MmVjYjguLjM3MmE5OWQ5Y2M1YzM3MzBlOGZi
ZWRkZWI2MTM0YTNiMThkOTM4YjYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9z
dC9zdG0zMm1wMjUxLmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAy
NTEuZHRzaQo+IEBAIC0xNTc2LDYgKzE1NzYsMTggQEAgZGNtaXBwOiBkY21pcHBANDgwMzAwMDAg
ewo+ICAgCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gICAJCQl9Owo+ICAgCj4gKwkJCWx0ZGM6
IGRpc3BsYXktY29udHJvbGxlckA0ODAxMDAwMCB7Cj4gKwkJCQljb21wYXRpYmxlID0gInN0LHN0
bTMybXAyNTEtbHRkYyI7Cj4gKwkJCQlyZWcgPSA8MHg0ODAxMDAwMCAweDQwMD47Cj4gKwkJCQlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgMTU4IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+ICsJCQkJCTxH
SUNfU1BJIDE1OSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArCQkJCWNsb2NrcyA9IDwmcmNjIENL
X0tFUl9MVERDPiwgPCZyY2MgQ0tfQlVTX0xUREM+Owo+ICsJCQkJY2xvY2stbmFtZXMgPSAibGNk
IiwgImJ1cyI7Cj4gKwkJCQlyZXNldHMgPSA8JnJjYyBMVERDX1I+Owo+ICsJCQkJYWNjZXNzLWNv
bnRyb2xsZXJzID0gPCZyaWZzYyA4MD47Cj4gKwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICsJ
CQl9Owo+ICsKPiAgIAkJCWNvbWJvcGh5OiBwaHlANDgwYzAwMDAgewo+ICAgCQkJCWNvbXBhdGli
bGUgPSAic3Qsc3RtMzJtcDI1LWNvbWJvcGh5IjsKPiAgIAkJCQlyZWcgPSA8MHg0ODBjMDAwMCAw
eDEwMDA+Owo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
