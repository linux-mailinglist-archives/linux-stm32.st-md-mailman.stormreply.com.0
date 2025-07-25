Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D0BB11D4E
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 13:11:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9DF8C30883;
	Fri, 25 Jul 2025 11:11:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB5F7C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 11:11:44 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PA7CB4004324;
 Fri, 25 Jul 2025 13:11:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 7EIFICZ6PcSv8Dm1Wx1IcEsY2QkDaiXmUkaUpQzq2mw=; b=N3M2Egl7vTiFztE5
 eWo2u9sUVXirJiniHCzcbmnm41xHXf33B3ctG5RtYCk9GRh++0Sz5JzTNNeOUard
 sPyHLHT1ipV3o770xZa2wnlHs2zl6ex/6pM3+PIhbuFun/95aqW3xttHRUDWEjQc
 DaXeKT7wLq6SpwVUaIo+qyhjkUj8aPtzFqqW67TZSFfRyJd7MjaOZGgO+r3uBnOd
 hJnDkqU+UvTrpxhWQFe4XxEgHYjeHOTcub0B/q+CpnKVWhc5GBlpBK0cakMJg1iY
 vo427FXrD3VPZtlgCF9U+oQsmx3WXVAC92qSFtQQ11nZn/zqjDW4Lcp7h9saIfPZ
 Lwyx9Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 483w3ett17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jul 2025 13:11:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 03F9B4004D;
 Fri, 25 Jul 2025 13:10:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE05C22306A;
 Fri, 25 Jul 2025 13:09:00 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 13:08:59 +0200
Message-ID: <85673db7-d311-47cc-be52-291d94e136e4@foss.st.com>
Date: Fri, 25 Jul 2025 13:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250725-drm-misc-next-v1-9-a59848e62cf9@foss.st.com>
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

SGkgUmFwaGFlbCwKCk9uIDcvMjUvMjUgMTI6MDQsIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6
Cj4gVGhlIExWRFMgaXMgdXNlZCBvbiBTVE0zMk1QMiBhcyBhIGRpc3BsYXkgaW50ZXJmYWNlLgo+
IAo+IEFkZCB0aGUgTFZEUyBub2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhZWwgR2FsbGFp
cy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+Cj4gLS0tCj4gICBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTUuZHRzaSB8IDEyICsrKysrKysrKysrKwo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9zdC9zdG0zMm1wMjU1LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0
bTMybXAyNTUuZHRzaQo+IGluZGV4IGY2ODliNDdjNTAxMDAzMzEyMDE0NmNmMTk1NGQ2NjI0YzAy
NzAwNDUuLmE0ZDk2NWY3ODVmYTQyYzQ1OTc0OTQwMTA4NTVhZWM3ZTFiOWZkZDEgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU1LmR0c2kKPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTUuZHRzaQo+IEBAIC02LDYgKzYsMTggQEAKPiAg
ICNpbmNsdWRlICJzdG0zMm1wMjUzLmR0c2kiCj4gICAKPiAgICZyaWZzYyB7Cj4gKwlsdmRzOiBs
dmRzQDQ4MDYwMDAwIHsKPiArCQljb21wYXRpYmxlID0gInN0LHN0bTMybXAyNS1sdmRzIjsKCkZv
ciB0aGUgY29tcGF0aWJsZSB5b3Ugbm93IG5lZWQgb25lIGNvbWFwdGlibGUgcGVyIFNvQy4KSXQg
bWVhbnMgeW91ciBjb21wYXRpYmxlIHNob3VsZCBsb29rIGxpa2UgOiAic3Qsc3RtMzJtcDI1MS1s
dmRzIi4KVGhpcyB3YXksIGlmIG9uIHRoZSAyNTMgb3IgMjU1IHRoZXJlIGlzIGFuIGlzc3VlIHlv
dSBhcmUgYWJsZSB0byBlYXNpbHkgCmFkZCBtYXRjaCBkYXRhIGluIHRoZSBkcml2ZXIgd2l0aCBj
b21wYXRpYmxlICJzdCxzdG0zMm1wMjUzLWx2ZHMiIG9yIAoic3Qsc3RtMzJtcDI1NS1sdmRzIi4K
QSBwcmlvciBkaXNjdXNzaW9uIG9uIHRoaXMgc3ViamVjdCBoYXMgYmVlbiByYWlzZWQgb24gbXkg
VjEgb2YgSERQIAppbnZvbHZpbmcgS3J6eXN6dG9mIGFuZCBBbGV4YW5kcmUgOgpodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvNDE4YTgwYTktOGMwOC00ZGQxLWJmNDktMWJkNzM3ODMyMWFhQGtl
cm5lbC5vcmcvCgo+ICsJCSNjbG9jay1jZWxscyA9IDwwPjsKPiArCQlyZWcgPSA8MHg0ODA2MDAw
MCAweDIwMDA+Owo+ICsJCWNsb2NrcyA9IDwmcmNjIENLX0JVU19MVkRTPiwgPCZyY2MgQ0tfS0VS
X0xWRFNQSFk+Owo+ICsJCWNsb2NrLW5hbWVzID0gInBjbGsiLCAicmVmIjsKPiArCQlyZXNldHMg
PSA8JnJjYyBMVkRTX1I+Owo+ICsJCWFjY2Vzcy1jb250cm9sbGVycyA9IDwmcmlmc2MgODQ+Owo+
ICsJCXBvd2VyLWRvbWFpbnMgPSA8JkNMVVNURVJfUEQ+Owo+ICsJCXN0YXR1cyA9ICJkaXNhYmxl
ZCI7Cj4gKwl9Owo+ICsKPiAgIAl2ZGVjOiB2ZGVjQDQ4MGQwMDAwIHsKPiAgIAkJY29tcGF0aWJs
ZSA9ICJzdCxzdG0zMm1wMjUtdmRlYyI7Cj4gICAJCXJlZyA9IDwweDQ4MGQwMDAwIDB4M2M4PjsK
PiAKCkJlc3QgcmVnYXJkcywKQ2zDqW1lbnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
