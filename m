Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D86B318CE
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 15:07:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B1D3C3F95B;
	Fri, 22 Aug 2025 13:07:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5C0DC3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 13:07:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MBCtNP004015;
 Fri, 22 Aug 2025 15:07:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 y4dfZmBKti9e9DTCpNwBo1wF53VJMOGIMax06H7HFHE=; b=fyuJccF/s7ggC7Ys
 XJTR9QPRN0IY/FWb5RFoJbpn7uySk9I5631NtBvMrBOFbAEhXLjcjg7+OjAN/jhz
 gg5kdf51Xz1wSV1t+152tqzPW5lie+cUeyz3auDWM1RdGUJU5wqRgrm9kqJl2WQO
 eCNHizL9rENpsgDW4UtPzjCgSnLzfPnJp7tK8oVihy7JAf7jtg5T82N9qUKlnVuG
 FPFcpjnb5OlxYF3+mtVSkFhBVnSGBpmmqI/GsAn967R8wjjXtK9FQOQUnut76wFn
 PW0KlPDut6fXdxXt/8BDVpeOMDq1llQoBBaFDwel/WfDeQBbHruoy8hsWkqPCs8s
 +4KGyg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48np7n78s6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Aug 2025 15:07:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9DEB840050;
 Fri, 22 Aug 2025 15:06:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6BEFB71CE44;
 Fri, 22 Aug 2025 15:05:26 +0200 (CEST)
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Aug
 2025 15:05:25 +0200
Message-ID: <6dc308d7-9b31-4b6d-ba68-69a91c8fcd32@foss.st.com>
Date: Fri, 22 Aug 2025 15:05:24 +0200
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
 <20250821-drm-misc-next-v4-10-7060500f8fd3@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250821-drm-misc-next-v4-10-7060500f8fd3@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 10/13] arm64: dts: st: add ltdc support
	on stm32mp255
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
dHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KCkxlIDIxLzA4LzIwMjUgw6AgMTM6MDks
IFJhcGhhZWwgR2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPiBBZGQgdGhlIExUREMgbm9kZSBmb3Ig
c3RtMzJtcDI1NSBTb0MgYW5kIGhhbmRsZSBpdHMgbG9vcGJhY2sgY2xvY2tzLgo+Cj4gY2tfa2Vy
X2x0ZGMgaGFzIHRoZSBDTEtfU0VUX1JBVEVfUEFSRU5UIGZsYWcuICBXaGlsZSBoYXZpbmcgdGhp
cyBmbGFnIGlzCj4gc2VtYW50aWNhbGx5IGNvcnJlY3QsIGl0IGZvciBub3cgbGVhZHMgdG8gYW4g
aW1wcm9wZXIgc2V0dGluZyBvZiB0aGUKPiBjbG9jayByYXRlLiAgVGhlIGNrX2tlcl9sdGRjIHBh
cmVudCBjbG9jayBpcyB0aGUgZmxleGdlbiAyNywgd2hpY2ggZG9lcwo+IG5vdCBzdXBwb3J0IGNo
YW5naW5nIHJhdGVzIHlldC4gIFRvIG92ZXJjb21lIHRoaXMgaXNzdWUsIGEgZml4ZWQgY2xvY2sK
PiBjYW4gYmUgdXNlZCBmb3IgdGhlIGtlcm5lbCBjbG9jay4KPgo+IFNpZ25lZC1vZmYtYnk6IFJh
cGhhZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+Cj4gLS0t
Cj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSB8IDYgKysrKysrCj4g
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTUuZHRzaSB8IDYgKysrKysrCj4gICAy
IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qv
c3RtMzJtcDI1MS5kdHNpCj4gaW5kZXggMzcyYTk5ZDljYzVjMzczMGU4ZmJlZGRlYjYxMzRhM2Ix
OGQ5MzhiNi4uYjQ0ZmYyMjFlMGRhOTY4YmUxMDRmZjgxOTVmOWJlZjc5YzkwYzU3YSAxMDA2NDQK
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaQo+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpCj4gQEAgLTUyLDYgKzUyLDEyIEBA
IGNsa19yY2JzZWM6IGNsay1yY2JzZWMgewo+ICAgCQkJY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9j
ayI7Cj4gICAJCQljbG9jay1mcmVxdWVuY3kgPSA8NjQwMDAwMDA+Owo+ICAgCQl9Owo+ICsKPiAr
CQljbGtfZmxleGdlbl8yN19maXhlZDogY2xrLTU0MDAwMDAwIHsKPiArCQkJI2Nsb2NrLWNlbGxz
ID0gPDA+Owo+ICsJCQljb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsKPiArCQkJY2xvY2stZnJl
cXVlbmN5ID0gPDU0MDAwMDAwPjsKPiArCQl9Owo+ICAgCX07Cj4gICAKPiAgIAlmaXJtd2FyZSB7
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1NS5kdHNpIGIv
YXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU1LmR0c2kKPiBpbmRleCBmNjg5YjQ3YzUw
MTAwMzMxMjAxNDZjZjE5NTRkNjYyNGMwMjcwMDQ1Li40OGE5NWFmMTc0MWM0MjMwMDE5NWI3NTNi
NzEwZTcxNGFiYzYwZDk2IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3Rt
MzJtcDI1NS5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU1LmR0
c2kKPiBAQCAtNSw2ICs1LDEyIEBACj4gICAgKi8KPiAgICNpbmNsdWRlICJzdG0zMm1wMjUzLmR0
c2kiCj4gICAKPiArJmx0ZGMgewo+ICsJY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMjU1LWx0ZGMi
Owo+ICsJY2xvY2tzID0gPCZjbGtfZmxleGdlbl8yN19maXhlZD4sIDwmcmNjIENLX0JVU19MVERD
PiwgPCZzeXNjZmc+LCA8Jmx2ZHM+Owo+ICsJY2xvY2stbmFtZXMgPSAibGNkIiwgImJ1cyIsICJy
ZWYiLCAibHZkcyI7Cj4gK307Cj4gKwo+ICAgJnJpZnNjIHsKPiAgIAl2ZGVjOiB2ZGVjQDQ4MGQw
MDAwIHsKPiAgIAkJY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMjUtdmRlYyI7Cj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
