Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5F87BDD15
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 15:06:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C116C6A61D;
	Mon,  9 Oct 2023 13:06:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7CF0C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 13:06:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39988KWV002751; Mon, 9 Oct 2023 15:06:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=3PQ+2v2hmYuHs5jDOC8Az7oTSOTXepldPGCW+7kNOTA=; b=qj
 KXN6ucPltGfUQkCxs5eJy7A75jo7dich1n9YVbSe4Eii8m5W4Nbhpj+Fn/qDpai5
 Dbo9az6CTZcEyjF5vlr3tce4X4YgmKmg0OPJ9hnWqu9Z2OlOtebz6gtyJb2Z/J6t
 xc9ps9L7MmTXwV+T0t0XHRjixFUwKPPfuOqxzONPy2uecd6OVygRbjgmxK3toVK+
 nvZKlPFnhc10HgFuCJnCOVdHMdZCyGsQnj++QSIPoZ4XvfN80uhgRa/i7Ut6/+g+
 mtnknabD4AxY0yNQeLZBNya+nocaQ9n4k+zR2xJwwxvDkZzK/04tESU95bPjf5a4
 OiQr0lskndAPscCSkm3g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tkhfdw9uw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:06:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5FA51100063;
 Mon,  9 Oct 2023 15:06:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52ABC23D411;
 Mon,  9 Oct 2023 15:06:30 +0200 (CEST)
Received: from [10.201.20.120] (10.201.20.120) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 15:06:29 +0200
Message-ID: <fb77b886-b557-b2af-a2f5-c0057a95b589@foss.st.com>
Date: Mon, 9 Oct 2023 15:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Adam Ford <aford173@gmail.com>
References: <20231004091552.3531659-1-hugues.fruchet@foss.st.com>
 <20231004091552.3531659-4-hugues.fruchet@foss.st.com>
 <CAHCN7xKrriTPaRMJ-r86cSgFDUUP1At08imLBr_zEP0g3fga_g@mail.gmail.com>
 <20231006162703.GA4030032-robh@kernel.org>
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <20231006162703.GA4030032-robh@kernel.org>
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_11,2023-10-09_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/7] dt-bindings: media: Document
 STM32MP25 VENC video encoder
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

SGkgUm9iLAoKT24gMTAvNi8yMyAxODoyNywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gV2VkLCBP
Y3QgMDQsIDIwMjMgYXQgMDY6NDE6MDlQTSAtMDUwMCwgQWRhbSBGb3JkIHdyb3RlOgo+PiBPbiBX
ZWQsIE9jdCA0LCAyMDIzIGF0IDQ6MTbigK9BTSBIdWd1ZXMgRnJ1Y2hldAo+PiA8aHVndWVzLmZy
dWNoZXRAZm9zcy5zdC5jb20+IHdyb3RlOgo+Pj4KPj4+IEFkZCBTVE0zMk1QMjUgVkVOQyB2aWRl
byBlbmNvZGVyIGJpbmRpbmdzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEh1Z3VlcyBGcnVjaGV0
IDxodWd1ZXMuZnJ1Y2hldEBmb3NzLnN0LmNvbT4KPj4+IC0tLQo+Pj4gICAuLi4vYmluZGluZ3Mv
bWVkaWEvc3Qsc3RtMzJtcDI1LXZlbmMueWFtbCAgICAgfCA1NiArKysrKysrKysrKysrKysrKysr
Cj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCj4+PiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc3Qsc3RtMzJt
cDI1LXZlbmMueWFtbAo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvc3Qsc3RtMzJtcDI1LXZlbmMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMm1wMjUtdmVuYy55YW1sCj4+PiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jNjllMGEzNGY2NzUKPj4+
IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9zdCxzdG0zMm1wMjUtdmVuYy55YW1sCj4+PiBAQCAtMCwwICsxLDU2IEBACj4+PiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+Pj4g
Kwo+Pj4gKyVZQU1MIDEuMgo+Pj4gKy0tLQo+Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvbWVkaWEvc3Qsc3RtMzJtcDI1LXZlbmMueWFtbCMKPj4KPj4gQ2FuIHRoaXMgZHQt
YmluZGluZyBiZSBtYWRlIG1vcmUgZ2VuZXJpYywgbGlrZSBzb21ldGhpbmcgbGlrZQo+PiBoYW50
cm8taDEgb3IgVkM4MDAwTmFub0U/Cj4+Cj4+IEkgdGhpbmsgdGhlcmUgd2lsbCBiZSBtb3JlIGJv
YXJkcyB0aGF0IG1heSBpbmNvcnBvcmF0ZSB0aGUgSGFudHJvLUgxCj4+IG9yIGEgVkM4MDAwIGlu
IHRoZSBmdXR1cmUsIGJlY2F1c2UgSSBkb24ndCB0aGluayB0aGlzIElQIGlzIHVuaXF1ZSB0bwo+
PiB0aGUgU1RNMzJNUDI1Lgo+IAo+IFVubGVzcyB0aGUgdW5kZXJseWluZyBJUCBpcyB3ZWxsIGRv
Y3VtZW50ZWQgKGkuZS4gcHVibGljKSwgdGhlbiBpdCdzCj4ga2luZCBvZiBwb2ludGxlc3MuIEV2
ZXJ5b25lIHdpbGwganVzdCBpbnZlbnQgdGhlaXIgb3duIG51bWJlcnMgYW5kIG5hbWVzCj4gb2Yg
Y2xvY2tzLCByZXNldHMsIGV0Yy4gdW5sZXNzIHNvbWVvbmUgY2FuIGVuZm9yY2Ugbm90IGRvaW5n
IHRoYXQuCgpVbmZvcnR1bmF0ZWx5IHRoZSBJUCBkb2N1bWVudGF0aW9uIGlzIG5vdCBwdWJsaWMs
IHRoZXJlIGFyZSBubyBkb2N1bWVudHMgCnByb3ZpZGVkIHB1YmxpY2x5IGJ5IFZlcmlzaWxpY29u
IGZvciB0aGUgdGltZSBiZWluZy4KCj4gCj4gUm9iCgpCUiwKSHVndWVzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
