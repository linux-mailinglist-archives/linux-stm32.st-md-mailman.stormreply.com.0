Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3C381B6FF
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 14:08:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65F2CC6B477;
	Thu, 21 Dec 2023 13:08:45 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63B20C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 13:08:44 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BLAIATv023361; Thu, 21 Dec 2023 14:08:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=0l3CJIF0YF007rW0bGlIBQ9AkCLi54Vt0zTpMSyEszk=; b=0w
 0mEaaVchzg0y3gIqMJgY9PbojsKnCH4cyWBSUBcla6RU/Ft+0dOFWs1msjk0EhCN
 H0xTIYGqiUC+C/FoKCfd0+c8x0PjaNz4hX5HNB5uIM+SY1V5mZgTiuuY8f3O9L5M
 lq44oS32APSol9xYPTNmT6ZbWDl4A8PUdoiuEYJTzYlu4Mmc+QmosY7TOqOEZpCT
 vYsJC4AYbJb91xDhI418Hj/BZ2P65mKKfp4aa+oVcDlMCr41LzfIgHDtmCm69Rfz
 Uka0EVZErKoz+ZOl+8L4ZRBvinik2OVzJboztuQpqRi8MbZIw2syuU0rwVi13tv/
 QYrF4ayhsCHpSMcrJz3Q==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v3q810t43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Dec 2023 14:08:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 768F0100053;
 Thu, 21 Dec 2023 14:08:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6CABE2C38C0;
 Thu, 21 Dec 2023 14:08:25 +0100 (CET)
Received: from [10.201.20.120] (10.201.20.120) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 21 Dec
 2023 14:08:24 +0100
Message-ID: <a240d2ac-db0e-481b-8d13-3ae76cfd2fe7@foss.st.com>
Date: Thu, 21 Dec 2023 14:08:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alex Bee <knaerzche@gmail.com>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>
References: <20231221084723.2152034-1-hugues.fruchet@foss.st.com>
 <769a1510-f8d2-4095-9879-42f413141dee@gmail.com>
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <769a1510-f8d2-4095-9879-42f413141dee@gmail.com>
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-21_06,2023-12-20_01,2023-05-22_02
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
 Philipp Zabel <p.zabel@pengutronix.de>
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

SGkgQWxleCwKClRoaXMgaXMgYmVjYXVzZSBWREVDIGFuZCBWRU5DIGFyZSB0d28gc2VwYXJhdGVk
IElQcyB3aXRoIHRoZWlyIG93biAKaGFyZHdhcmUgcmVzb3VyY2VzIGFuZCBubyBsaW5rcyBiZXR3
ZWVuIGJvdGguCk9uIGZ1dHVyZSBTb0NzLCBWREVDIGNhbiBzaGlwIG9uIGl0cyBvd24sIHNhbWUg
Zm9yIFZFTkMuCgpIb3BpbmcgdGhhdCB0aGlzIGNsYXJpZnkuCgpCZXN0IHJlZ2FyZHMsCkh1Z3Vl
cy4KCk9uIDEyLzIxLzIzIDEzOjQwLCBBbGV4IEJlZSB3cm90ZToKPiBIaSBIdWd1ZXMsIEhpIE5p
Y29sYXMsCj4gCj4gaXMgdGhlcmUgYW55IHNwZWNpZmljIHJlYXNvbiBJJ20gbm90IHVuZGVyc3Rh
bmRpbmcgLyBzZWVpbmcgd2h5IHRoaXMgaXMgCj4gYWRkZWQgaW4gdHdvIHNlcGVyYXRlIHZkZWMq
IC8gdmVuYyogZmlsZXMgYW5kIG5vdCBhIHNpbmdsZSB2cHUqIGZpbGU/IElzIAo+IGl0IG9ubHkg
Zm9yIHRoZSBzZXBlcmF0ZSBjbG9ja3MgKC1uYW1lcykgLyBpcnFzICgtbmFtZXMpIC8gY2FsbGJh
Y2tzPyAKPiBUaG9zZSBhcmUgZGVmaW5lZCBwZXIgdmFyaWFudCBhbmQgcGVyZmVjdGx5IGZpdCBp
biBhIHNpbmdsZSBmaWxlIGhvbGRpbmcgCj4gb25lIHZkZWMgYW5kIG9uZSB2ZW5jIHZhcmlhbnQu
Cj4gCj4gQWxleAo+IAo+IEFtIDIxLjEyLjIzIHVtIDA5OjQ3IHNjaHJpZWIgSHVndWVzIEZydWNo
ZXQ6Cj4+IFRoaXMgcGF0Y2hzZXQgaW50cm9kdWNlcyBzdXBwb3J0IGZvciBWREVDIHZpZGVvIGhh
cmR3YXJlIGRlY29kZXIKPj4gYW5kIFZFTkMgdmlkZW8gaGFyZHdhcmUgZW5jb2RlciBvZiBTVE1p
Y3JvZWxlY3Ryb25pY3MgU1RNMzJNUDI1Cj4+IFNvQyBzZXJpZXMuCj4+Cj4+IFRoaXMgaW5pdGlh
bCBzdXBwb3J0IGltcGxlbWVudHMgSDI2NCBkZWNvZGluZywgVlA4IGRlY29kaW5nIGFuZAo+PiBK
UEVHIGVuY29kaW5nLgo+Pgo+PiBUaGlzIGhhcyBiZWVuIHRlc3RlZCBvbiBTVE0zMk1QMjU3Ri1F
VjEgZXZhbHVhdGlvbiBib2FyZC4KPj4KPj4gPT09PT09PT09PT0KPj4gPSBoaXN0b3J5ID0KPj4g
PT09PT09PT09PT0KPj4gdmVyc2lvbiA1Ogo+PiDCoMKgwqAgLSBQcmVjaXNlIHRoYXQgdmlkZW8g
ZGVjb2RpbmcgYXMgYmVlbiBzdWNjZXNzZnVsbHkgdGVzdGVkIHVwIHRvIAo+PiBmdWxsIEhECj4+
IMKgwqDCoCAtIEFkZCBOaWNvbGFzIER1ZnJlc25lIHJldmlld2VkLWJ5Cj4+Cj4+IHZlcnNpb24g
NDoKPj4gwqDCoMKgIC0gRml4IGNvbW1lbnRzIGZyb20gTmljb2xhcyBhYm91dCBkcm9wcGluZyBl
bmNvZGVyIHJhdyBzdGVwcwo+Pgo+PiB2ZXJzaW9uIDM6Cj4+IMKgwqDCoCAtIEZpeCByZW1hcmtz
IGZyb20gS3J6eXN6dG9mIEtvemxvd3NraToKPj4gwqDCoMKgwqAgLSBkcm9wICJpdGVtcyIsIHdl
IGtlZXAgc2ltcGxlIGVudW0gaW4gc3VjaCBjYXNlCj4+IMKgwqDCoMKgIC0gZHJvcCBzZWNvbmQg
ZXhhbXBsZSAtIGl0IGlzIHRoZSBzYW1lIGFzIHRoZSBmaXJzdAo+PiDCoMKgwqAgLSBEcm9wIHVu
dXNlZCBub2RlIGxhYmVscyBhcyBzdWdnZXN0ZWQgYnkgQ29ub3IgRG9vbGV5Cj4+IMKgwqDCoCAt
IFJldmlzaXQgbWluL21heCByZXNvbHV0aW9ucyBhcyBzdWdnZXN0ZWQgYnkgTmljb2xhcyBEdWZy
ZXNuZQo+Pgo+PiB2ZXJzaW9uIDI6Cj4+IMKgwqDCoCAtIEZpeCByZW1hcmtzIGZyb20gS3J6eXN6
dG9mIEtvemxvd3NraSBvbiB2MToKPj4gwqDCoMKgwqAgLSBzaW5nbGUgdmlkZW8tY29kZWMgYmlu
ZGluZyBmb3IgYm90aCBWREVDL1ZFTkMKPj4gwqDCoMKgwqAgLSBnZXQgcmlkIG9mICItbmFtZXMi
Cj4+IMKgwqDCoMKgIC0gdXNlIG9mIGdlbmVyaWMgbm9kZSBuYW1lICJ2aWRlby1jb2RlYyIKPj4K
Pj4gdmVyc2lvbiAxOgo+PiDCoMKgIC0gSW5pdGlhbCBzdWJtaXNzaW9uCj4+Cj4+IEh1Z3VlcyBG
cnVjaGV0ICg1KToKPj4gwqDCoCBkdC1iaW5kaW5nczogbWVkaWE6IERvY3VtZW50IFNUTTMyTVAy
NSBWREVDICYgVkVOQyB2aWRlbyBjb2RlY3MKPj4gwqDCoCBtZWRpYTogaGFudHJvOiBhZGQgc3Vw
cG9ydCBmb3IgU1RNMzJNUDI1IFZERUMKPj4gwqDCoCBtZWRpYTogaGFudHJvOiBhZGQgc3VwcG9y
dCBmb3IgU1RNMzJNUDI1IFZFTkMKPj4gwqDCoCBhcm02NDogZHRzOiBzdDogYWRkIHZpZGVvIGRl
Y29kZXIgc3VwcG9ydCB0byBzdG0zMm1wMjU1Cj4+IMKgwqAgYXJtNjQ6IGR0czogc3Q6IGFkZCB2
aWRlbyBlbmNvZGVyIHN1cHBvcnQgdG8gc3RtMzJtcDI1NQo+Pgo+PiDCoCAuLi4vbWVkaWEvc3Qs
c3RtMzJtcDI1LXZpZGVvLWNvZGVjLnlhbWzCoMKgwqDCoMKgwqAgfMKgIDUwICsrKysrKysrCj4+
IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpwqDCoMKgwqDCoMKgwqAg
fMKgIDEyICsrCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1NS5kdHNpwqDC
oMKgwqDCoMKgwqAgfMKgIDE3ICsrKwo+PiDCoCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Zlcmlz
aWxpY29uL0tjb25maWfCoMKgwqAgfMKgIDE0ICsrLQo+PiDCoCBkcml2ZXJzL21lZGlhL3BsYXRm
b3JtL3ZlcmlzaWxpY29uL01ha2VmaWxlwqDCoCB8wqDCoCA0ICsKPj4gwqAgLi4uL21lZGlhL3Bs
YXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19kcnYuY8KgwqAgfMKgwqAgNCArCj4+IMKgIC4uLi9t
ZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9faHcuaMKgwqDCoCB8wqDCoCAyICsKPj4g
wqAgLi4uL3BsYXRmb3JtL3ZlcmlzaWxpY29uL3N0bTMybXAyNV92ZGVjX2h3LmPCoCB8wqAgOTIg
KysrKysrKysrKysrKysKPj4gwqAgLi4uL3BsYXRmb3JtL3ZlcmlzaWxpY29uL3N0bTMybXAyNV92
ZW5jX2h3LmPCoCB8IDExNSArKysrKysrKysrKysrKysrKysKPj4gwqAgOSBmaWxlcyBjaGFuZ2Vk
LCAzMDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4gwqAgY3JlYXRlIG1vZGUgMTAw
NjQ0IAo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc3Qsc3RtMzJt
cDI1LXZpZGVvLWNvZGVjLnlhbWwKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IAo+PiBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL3N0bTMybXAyNV92ZGVjX2h3LmMKPj4gwqAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IAo+PiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL3N0
bTMybXAyNV92ZW5jX2h3LmMKPj4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
