Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF5B81B8EC
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 14:56:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F41BC6B477;
	Thu, 21 Dec 2023 13:56:23 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02E04C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 13:56:21 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BLB0OGY023358; Thu, 21 Dec 2023 14:55:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=eKzjm6QU0a00qgRB4u+dhzVmhDqaXByxEhCymCUwNY0=; b=KE
 9e65inuRwUDjJqFiRYo+q2aLdwLdrxXe+0VbAvgpRTVyhFeZW9Wu6LKrSbIRK6fQ
 V4P7DhZ6sBtYDENSVm1SrtbOYn37emf0wN9QsBAf4aj+c6ASso0I5s0cRcl3pecw
 f3yAIB8vAPqg+1/bBVORpSWluK4v7hV0WBkISpv6hI4HA5ruYyUX77GHO3F/1JcD
 SMOb5Nu8LYjSmdH/WSu/4l/Pt01neAiKzo/C5d+uJwCFe3r/8n9FDa8htvG2Hz3L
 +3gBVfLLvZX/IVmTYYvMuWFliTrTzCTUlohc7W/Ow4kk5TfOqrASf17n0oGxTrCd
 gAbyCbh9vNDF7NoB9GoA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v3q8110ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Dec 2023 14:55:58 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83C23100053;
 Thu, 21 Dec 2023 14:55:56 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 744532B568E;
 Thu, 21 Dec 2023 14:55:56 +0100 (CET)
Received: from [10.201.20.120] (10.201.20.120) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 21 Dec
 2023 14:55:55 +0100
Message-ID: <6d26d307-eb7a-43ad-b4f3-57f8ac7ce8f0@foss.st.com>
Date: Thu, 21 Dec 2023 14:55:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alex Bee <knaerzche@gmail.com>
References: <20231221084723.2152034-1-hugues.fruchet@foss.st.com>
 <769a1510-f8d2-4095-9879-42f413141dee@gmail.com>
 <a240d2ac-db0e-481b-8d13-3ae76cfd2fe7@foss.st.com>
 <e5ba1e14-4bbf-43e3-933a-fee6d4b90641@gmail.com>
 <CAHCN7xJ3Ktn+TnoOYdnNvKTddGCfLp4OQ+gM0WonWj-aqnsGuA@mail.gmail.com>
 <b03a7ddc-65c5-44c3-a563-d52ee938148a@gmail.com>
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <b03a7ddc-65c5-44c3-a563-d52ee938148a@gmail.com>
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-21_07,2023-12-20_01,2023-05-22_02
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v5 0/5] Add support for video hardware
 codec of STMicroelectronics STM32 SoC series
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

SGkgQWxleCwKCk9uIDEyLzIxLzIzIDE0OjQ2LCBBbGV4IEJlZSB3cm90ZToKPiAKPiBBbSAyMS4x
Mi4yMyB1bSAxNDozOCBzY2hyaWViIEFkYW0gRm9yZDoKPj4gT24gVGh1LCBEZWMgMjEsIDIwMjMg
YXQgNzozMeKAr0FNIEFsZXggQmVlIDxrbmFlcnpjaGVAZ21haWwuY29tPiB3cm90ZToKPj4+IEhp
IEh1Z3VlcywKPj4+Cj4+PiBBbSAyMS4xMi4yMyB1bSAxNDowOCBzY2hyaWViIEh1Z3VlcyBGUlVD
SEVUOgo+Pj4+IEhpIEFsZXgsCj4+Pj4KPj4+PiBUaGlzIGlzIGJlY2F1c2UgVkRFQyBhbmQgVkVO
QyBhcmUgdHdvIHNlcGFyYXRlZCBJUHMgd2l0aCB0aGVpciBvd24KPj4+PiBoYXJkd2FyZSByZXNv
dXJjZXMgYW5kIG5vIGxpbmtzIGJldHdlZW4gYm90aC4KPj4+PiBPbiBmdXR1cmUgU29DcywgVkRF
QyBjYW4gc2hpcCBvbiBpdHMgb3duLCBzYW1lIGZvciBWRU5DLgo+Pj4+Cj4+PiBJIHRoaW5rIHRo
YXQncyB3aGF0IHRoZSBkcml2ZXIgaXMvd2FzIGRlc2lnbmVkIGZvciA6KQo+Pj4KPj4+IEkgZG9u
J3TCoCB0aGluayB0aGVyZSBfaGFzXyB0byBiZSBhIGxpbmsgYmV0d2VlbiB2YXJpYW50cyBpbiB0
aGUgc2FtZSAKPj4+IGZpbGUuCj4+PiBGb3IgUm9ja2NoaXAgd2Ugb25seSBoYWQgdGhlIGlzc3Vl
IHRoYXQgdGhlcmUgX2lzXyBhIGxpbmsgKHNoYXJlZAo+Pj4gcmVzb3VyY2VzKSBiZXR3ZWVuIGVu
Y29kZXIgYW5kIGRlY29kZXIgYW5kIHRoZXkgaGFkIChmb3IgdGhhdCByZWFzb24pIAo+Pj4gdG8g
YmUKPj4+IGRlZmluZWQgaGFzIGEgX3NpbmdsZV8gdmFyaWFudC4gQW5kIHRoZXJlIGlzIG5vIHJl
YXNvbiB5b3UgY2FuIHNoaXAgCj4+PiBkZWNvZGVyCj4+PiBhbmQgZW5jb2RlciBzZXBlcmF0ZWQg
d2hlbiB5b3UgaGF2ZSB0d28gdmFyaWFudHMgKHdpdGggZGlmZmVyZW50Cj4+PiBjb21wYXRpYmxl
cykuCj4+PiBGb3IgUm9ja2NoaXAgYW5kIGlNWCB0aG9zZSBmaWxlcyBhcmUgZXZlbiBjb250YWlu
aW5nIHZhcmlhbnRzIGZvciAKPj4+IGNvbXBsZXRseQo+Pj4gZGlmZmVyZW50IGdlbmVyYXRpb25z
IC8gZGlmZmVyZW50IFNvQ3MuIEkgaGFkIHRvIGNsZWFudXAgdGhpcyBtZXNzIGZvcgo+PiBUaGUg
aS5NWDhNIE1pbmkgYW5kIFBsdXMgaGF2ZSBkaWZmZXJlbnQgcG93ZXIgZG9tYWlucyBmb3IgZW5j
b2RlciBhbmQKPj4gZGVjb2RlcnMgYXMgd2VsbCBhcyBkaWZmZXJlbnQgY2xvY2tzLsKgIEtlZXBp
bmcgdGhlbSBzZXBhcmF0ZSB3b3VsZAo+PiBhbG1vc3QgYmUgbmVjZXNzYXJ5Lgo+IEkgZ3Vlc3Mg
dGhlcmUgaXMgbWlzc3VuZGVyc3RhbmRpbmc6IEkgZGlkbid0IHNheSB0aGUgdHdvIFNUTSB2YXJp
YW50cwo+IHNob3VsZCBiZSBtZXJnZWQgaW4gb25lIHZhcmlhbnQsIGJ1dCB0aGUgdHdvIHZhcmlh
bnRzIHNob3VsZCBiZSB3aXRoaW4gdGhlCj4gc2FtZSBfZmlsZV8sIGxpa2UgdGhlIG90aGVyIHBs
YXRmb3JtcyBhcmUgZG9pbmcgOikKCkkgaGF2ZSB0d28gc2VwYXJhdGVkIGhhcmR3YXJlOiBWREVD
IGFuZCBWRU5DLCBub3QgYSBzaW5nbGUgYmxvY2sgbGlrZSAKIlZQVSIgZm9yIGV4YW1wbGUuIFNv
IHdoYXQgbmFtZSBzaG91bGQgaGF2ZSB0aGlzIGZpbGUgPwpPdGhlciBwbGF0Zm9ybXMgaGFkIGEg
Y29tbW9uIGZpbGUgYmVjYXVzZSB0aGVyZSB3YXMgYSBjb21tb24gYmxvY2sgCmVtYmVkZGluZyBi
b3RoIGRlY29kZXIgYW5kIGVuY29kZXIsIHNvbWV0aW1lcyB3aXRoIGxpbmtzL2RlcGVuZGVuY2ll
cyAKYmV0d2VlbiBib3RoLgpTQU1BNUQ0IGhhcyBvbmx5IGEgZGVjb2Rlciwgb25seSBhIHNpbmds
ZSBmaWxlIGNhbGxlZCAiX3ZkZWNfaHcuYyIuLi4Kc28gaXQgaXMgcXVpdGUgbG9naWNhbCBmb3Ig
bWUgdG8gaGF2ZSBvbmUgZmlsZSBwZXIgaW5kZXBlbmRlbnQgSVAuCgo+PiBhZGFtCj4+Cj4+PiBS
b2NrY2hpcCBvbmNlIC0gYW5kIGl0IHdhcyBubyBmdW4gOikgQW55d2F5czogSXQncyB1cCB0byB0
aGUgCj4+PiBtYWludGFpbmVycyBJCj4+PiBndWVzcyAtIEkganVzdCB3YW50ZWQgdG8gYXNrIGlm
IEkgbWlzc3VuZGVyc3RhbmQgc29tZXRoaW5nIGhlcmUuCj4+Pgo+Pj4gR3JlZXRpbmdzLAo+Pj4K
Pj4+IEFsZXgKPj4+Cj4+Pj4gSG9waW5nIHRoYXQgdGhpcyBjbGFyaWZ5Lgo+Pj4+Cj4+Pj4gQmVz
dCByZWdhcmRzLAo+Pj4+IEh1Z3Vlcy4KPj4+Pgo+Pj4+IE9uIDEyLzIxLzIzIDEzOjQwLCBBbGV4
IEJlZSB3cm90ZToKPj4+Pj4gSGkgSHVndWVzLCBIaSBOaWNvbGFzLAo+Pj4+Pgo+Pj4+PiBpcyB0
aGVyZSBhbnkgc3BlY2lmaWMgcmVhc29uIEknbSBub3QgdW5kZXJzdGFuZGluZyAvIHNlZWluZyB3
aHkgdGhpcwo+Pj4+PiBpcyBhZGRlZCBpbiB0d28gc2VwZXJhdGUgdmRlYyogLyB2ZW5jKiBmaWxl
cyBhbmQgbm90IGEgc2luZ2xlIHZwdSoKPj4+Pj4gZmlsZT8gSXMgaXQgb25seSBmb3IgdGhlIHNl
cGVyYXRlIGNsb2NrcyAoLW5hbWVzKSAvIGlycXMgKC1uYW1lcykgLwo+Pj4+PiBjYWxsYmFja3M/
IFRob3NlIGFyZSBkZWZpbmVkIHBlciB2YXJpYW50IGFuZCBwZXJmZWN0bHkgZml0IGluIGEKPj4+
Pj4gc2luZ2xlIGZpbGUgaG9sZGluZyBvbmUgdmRlYyBhbmQgb25lIHZlbmMgdmFyaWFudC4KPj4+
Pj4KPj4+Pj4gQWxleAo+Pj4+Pgo+Pj4+PiBBbSAyMS4xMi4yMyB1bSAwOTo0NyBzY2hyaWViIEh1
Z3VlcyBGcnVjaGV0Ogo+Pj4+Pj4gVGhpcyBwYXRjaHNldCBpbnRyb2R1Y2VzIHN1cHBvcnQgZm9y
IFZERUMgdmlkZW8gaGFyZHdhcmUgZGVjb2Rlcgo+Pj4+Pj4gYW5kIFZFTkMgdmlkZW8gaGFyZHdh
cmUgZW5jb2RlciBvZiBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzJNUDI1Cj4+Pj4+PiBTb0Mgc2Vy
aWVzLgo+Pj4+Pj4KPj4+Pj4+IFRoaXMgaW5pdGlhbCBzdXBwb3J0IGltcGxlbWVudHMgSDI2NCBk
ZWNvZGluZywgVlA4IGRlY29kaW5nIGFuZAo+Pj4+Pj4gSlBFRyBlbmNvZGluZy4KPj4+Pj4+Cj4+
Pj4+PiBUaGlzIGhhcyBiZWVuIHRlc3RlZCBvbiBTVE0zMk1QMjU3Ri1FVjEgZXZhbHVhdGlvbiBi
b2FyZC4KPj4+Pj4+Cj4+Pj4+PiA9PT09PT09PT09PQo+Pj4+Pj4gPSBoaXN0b3J5ID0KPj4+Pj4+
ID09PT09PT09PT09Cj4+Pj4+PiB2ZXJzaW9uIDU6Cj4+Pj4+PiDCoMKgwqDCoCAtIFByZWNpc2Ug
dGhhdCB2aWRlbyBkZWNvZGluZyBhcyBiZWVuIHN1Y2Nlc3NmdWxseSB0ZXN0ZWQgdXAgdG8KPj4+
Pj4+IGZ1bGwgSEQKPj4+Pj4+IMKgwqDCoMKgIC0gQWRkIE5pY29sYXMgRHVmcmVzbmUgcmV2aWV3
ZWQtYnkKPj4+Pj4+Cj4+Pj4+PiB2ZXJzaW9uIDQ6Cj4+Pj4+PiDCoMKgwqDCoCAtIEZpeCBjb21t
ZW50cyBmcm9tIE5pY29sYXMgYWJvdXQgZHJvcHBpbmcgZW5jb2RlciByYXcgc3RlcHMKPj4+Pj4+
Cj4+Pj4+PiB2ZXJzaW9uIDM6Cj4+Pj4+PiDCoMKgwqDCoCAtIEZpeCByZW1hcmtzIGZyb20gS3J6
eXN6dG9mIEtvemxvd3NraToKPj4+Pj4+IMKgwqDCoMKgwqAgLSBkcm9wICJpdGVtcyIsIHdlIGtl
ZXAgc2ltcGxlIGVudW0gaW4gc3VjaCBjYXNlCj4+Pj4+PiDCoMKgwqDCoMKgIC0gZHJvcCBzZWNv
bmQgZXhhbXBsZSAtIGl0IGlzIHRoZSBzYW1lIGFzIHRoZSBmaXJzdAo+Pj4+Pj4gwqDCoMKgwqAg
LSBEcm9wIHVudXNlZCBub2RlIGxhYmVscyBhcyBzdWdnZXN0ZWQgYnkgQ29ub3IgRG9vbGV5Cj4+
Pj4+PiDCoMKgwqDCoCAtIFJldmlzaXQgbWluL21heCByZXNvbHV0aW9ucyBhcyBzdWdnZXN0ZWQg
YnkgTmljb2xhcyBEdWZyZXNuZQo+Pj4+Pj4KPj4+Pj4+IHZlcnNpb24gMjoKPj4+Pj4+IMKgwqDC
oMKgIC0gRml4IHJlbWFya3MgZnJvbSBLcnp5c3p0b2YgS296bG93c2tpIG9uIHYxOgo+Pj4+Pj4g
wqDCoMKgwqDCoCAtIHNpbmdsZSB2aWRlby1jb2RlYyBiaW5kaW5nIGZvciBib3RoIFZERUMvVkVO
Qwo+Pj4+Pj4gwqDCoMKgwqDCoCAtIGdldCByaWQgb2YgIi1uYW1lcyIKPj4+Pj4+IMKgwqDCoMKg
wqAgLSB1c2Ugb2YgZ2VuZXJpYyBub2RlIG5hbWUgInZpZGVvLWNvZGVjIgo+Pj4+Pj4KPj4+Pj4+
IHZlcnNpb24gMToKPj4+Pj4+IMKgwqDCoCAtIEluaXRpYWwgc3VibWlzc2lvbgo+Pj4+Pj4KPj4+
Pj4+IEh1Z3VlcyBGcnVjaGV0ICg1KToKPj4+Pj4+IMKgwqDCoCBkdC1iaW5kaW5nczogbWVkaWE6
IERvY3VtZW50IFNUTTMyTVAyNSBWREVDICYgVkVOQyB2aWRlbyBjb2RlY3MKPj4+Pj4+IMKgwqDC
oCBtZWRpYTogaGFudHJvOiBhZGQgc3VwcG9ydCBmb3IgU1RNMzJNUDI1IFZERUMKPj4+Pj4+IMKg
wqDCoCBtZWRpYTogaGFudHJvOiBhZGQgc3VwcG9ydCBmb3IgU1RNMzJNUDI1IFZFTkMKPj4+Pj4+
IMKgwqDCoCBhcm02NDogZHRzOiBzdDogYWRkIHZpZGVvIGRlY29kZXIgc3VwcG9ydCB0byBzdG0z
Mm1wMjU1Cj4+Pj4+PiDCoMKgwqAgYXJtNjQ6IGR0czogc3Q6IGFkZCB2aWRlbyBlbmNvZGVyIHN1
cHBvcnQgdG8gc3RtMzJtcDI1NQo+Pj4+Pj4KPj4+Pj4+IMKgwqAgLi4uL21lZGlhL3N0LHN0bTMy
bXAyNS12aWRlby1jb2RlYy55YW1swqDCoMKgwqDCoMKgIHzCoCA1MCArKysrKysrKwo+Pj4+Pj4g
wqDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzacKgwqDCoMKgwqDCoMKg
IHzCoCAxMiArKwo+Pj4+Pj4gwqDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTUu
ZHRzacKgwqDCoMKgwqDCoMKgIHzCoCAxNyArKysKPj4+Pj4+IMKgwqAgZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS92ZXJpc2lsaWNvbi9LY29uZmlnwqDCoMKgIHzCoCAxNCArKy0KPj4+Pj4+IMKgwqAg
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9NYWtlZmlsZcKgwqAgfMKgwqAgNCAr
Cj4+Pj4+PiDCoMKgIC4uLi9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9fZHJ2LmPC
oMKgIHzCoMKgIDQgKwo+Pj4+Pj4gwqDCoCAuLi4vbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24v
aGFudHJvX2h3LmjCoMKgwqAgfMKgwqAgMiArCj4+Pj4+PiDCoMKgIC4uLi9wbGF0Zm9ybS92ZXJp
c2lsaWNvbi9zdG0zMm1wMjVfdmRlY19ody5jwqAgfMKgIDkyICsrKysrKysrKysrKysrCj4+Pj4+
PiDCoMKgIC4uLi9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9zdG0zMm1wMjVfdmVuY19ody5jwqAgfCAx
MTUKPj4+Pj4+ICsrKysrKysrKysrKysrKysrKwo+Pj4+Pj4gwqDCoCA5IGZpbGVzIGNoYW5nZWQs
IDMwNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4+Pj4gwqDCoCBjcmVhdGUgbW9k
ZSAxMDA2NDQKPj4+Pj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9z
dCxzdG0zMm1wMjUtdmlkZW8tY29kZWMueWFtbAo+Pj4+Pj4gwqDCoCBjcmVhdGUgbW9kZSAxMDA2
NDQKPj4+Pj4+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vc3RtMzJtcDI1X3Zk
ZWNfaHcuYwo+Pj4+Pj4gwqDCoCBjcmVhdGUgbW9kZSAxMDA2NDQKPj4+Pj4+IGRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vdmVyaXNpbGljb24vc3RtMzJtcDI1X3ZlbmNfaHcuYwo+Pj4+Pj4KCkJlc3Qg
cmVnYXJkcywKSHVndWVzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
