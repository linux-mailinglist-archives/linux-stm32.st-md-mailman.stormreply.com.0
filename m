Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 925FB8B1CF1
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Apr 2024 10:40:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42BCCC7128B;
	Thu, 25 Apr 2024 08:40:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38209C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 08:40:29 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P6qDLG021448;
 Thu, 25 Apr 2024 10:39:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=LRhWlaI0E/bPuzJE9gA99asyOQ64g4iYmBkgLuI8Mhk=; b=8Y
 w2iR3x+4ZE+cuaIZ6o4AV0FjVL3brTpCgwYQuGbhf9qO/ZQHIOYkoCPV9UmHQEPu
 ZOzeQV7AncbhVTkY7TKSl4WWTGZDOLX78vmtZgpfbb/UufW5Rbj+OtWV0zQq30p5
 vIiqHWDdjXfkLo4L2+8pB3hQRNxVHP8GbB0lFrYNp5dXayPpnqRcjke9XU/3f10/
 ldbcp0kbkQBwHPAFy2pJWrbMUYaE4KqyisDhH2TDHcPs0XEmaXSs5eNfyxDyaP0a
 HBofEGeRpviBi62llC9rsge5nJ17NfLMx7KaMGJhNzF4zMf7rqKIbpoacRYf1dmb
 z0Em6yXFbshMko1crwNQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm51wcypa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Apr 2024 10:39:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B9C8840048;
 Thu, 25 Apr 2024 10:38:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB00D214D1C;
 Thu, 25 Apr 2024 10:37:39 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 10:37:38 +0200
Message-ID: <562f0e8f-4730-4142-936b-25fb0f3024eb@foss.st.com>
Date: Thu, 25 Apr 2024 10:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
References: <20240422002006.243687-1-marex@denx.de>
 <f02c63b3-d6e1-495d-a73a-493e39e40b2e@kernel.org>
 <fc42c239-1dff-4848-a0cf-4b21e3e59d8e@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <fc42c239-1dff-4848-a0cf-4b21e3e59d8e@denx.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_07,2024-04-25_01,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sean Nyekjaer <sean@geanix.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 01/20] dt-bindings: arm: stm32: Add
 compatible string for DH electronics STM32MP13xx DHCOR DHSBC board
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

SGkgTWFyZWsKCk9uIDQvMjIvMjQgMTQ6NTIsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDQvMjIv
MjQgNjoyMSBBTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMjIvMDQvMjAyNCAw
MjoxOSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+PiBBZGQgRFQgY29tcGF0aWJsZSBzdHJpbmcgZm9y
IERIIGVsZWN0cm9uaWNzIFNUTTMyTVAxM3h4IERIQ09SIFNvTSBhbmQKPj4+IERIU0JDIGNhcnJp
ZXIgYm9hcmQuIFRoaXMgc3RtMzJtcDEzNWYtZGhjb3ItZGhzYmMgYm9hcmQgaXMgYSBzdGFjayBv
Zgo+Pj4gREhDT1IgU29NIGJhc2VkIG9uIFNUTTMyTVAxMzVGIFNvQyAoOTAwTUh6IC8gY3J5cHRv
IGNhcGFiaWxpdGllcykKPj4+IHBvcHVsYXRlZCBvbiBESFNCQyBjYXJyaWVyIGJvYXJkLgo+Pj4K
Pj4+IFRoZSBTb00gY29udGFpbnMgdGhlIGZvbGxvd2luZyBwZXJpcGhlcmFsczoKPj4+IC0gU1RQ
TUlDIChwb3dlciBkZWxpdmVyeSkKPj4+IC0gNTEyTUIgRERSM0wgbWVtb3J5Cj4+PiAtIGVNTUMg
YW5kIFNESU8gV2lGaSBtb2R1bGUKPj4+Cj4+PiBUaGUgREhTQkMgY2FycmllciBib2FyZCBjb250
YWlucyB0aGUgZm9sbG93aW5nIHBlcmlwaGVyYWxzOgo+Pj4gLSBUd28gUkdNSUkgRXRoZXJuZXQg
cG9ydHMKPj4+IC0gVVNCLUEgSG9zdCBwb3J0LCBVU0ItQyBwZXJpcGhlcmFsIHBvcnQsIFVTQi1D
IHBvd2VyIHN1cHBseSBwbHVnCj4+PiAtIEV4cGFuc2lvbiBjb25uZWN0b3IKPj4+Cj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4+IC0tLQo+Pj4gQ2M6ICJM
ZW9uYXJkIEfDtmhycyIgPGwuZ29laHJzQHBlbmd1dHJvbml4LmRlPgo+Pj4gQ2M6IEFobWFkIEZh
dG91bSA8YS5mYXRvdW1AcGVuZ3V0cm9uaXguZGU+Cj4+PiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8
YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPj4+IENjOiBBbmRyZSBQcnp5d2FyYSA8YW5k
cmUucHJ6eXdhcmFAYXJtLmNvbT4KPj4+IENjOiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5l
bC5vcmc+Cj4+PiBDYzogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgo+Pj4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9y
Zz4KPj4+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4+PiBD
YzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+Pj4gQ2M6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+PiBDYzogU2VhbiBOeWVramFlciA8c2VhbkBn
ZWFuaXguY29tPgo+Pj4gQ2M6IFN0ZWZmZW4gVHJ1bXRyYXIgPHMudHJ1bXRyYXJAcGVuZ3V0cm9u
aXguZGU+Cj4+PiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKPj4+IENjOiBrZXJuZWxA
ZGgtZWxlY3Ryb25pY3MuY29tCj4+PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCj4+PiBDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+
Pj4gLS0tCj4+PiDCoCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMy
L3N0bTMyLnlhbWwgfCA2ICsrKysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwgCj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbAo+Pj4gaW5kZXggYmMyZjQzMzMwYWU0Mi4uN2Y2
MTIyM2I4ZWYyNCAxMDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sCj4+PiBAQCAtNTksNiArNTksMTIgQEAg
cHJvcGVydGllczoKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHBydCxwcnR0
MXPCoMKgICMgUHJvdG9uaWMgUFJUVDFTCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29u
c3Q6IHN0LHN0bTMybXAxNTEKPj4+ICvCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IERIIFNUTTMy
TVAxMzUgREhDT1IgU29NIGJhc2VkIEJvYXJkcwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGl0ZW1zOgo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBkaCxzdG0zMm1wMTM1Zi1kaGNvci1kaHNi
Ywo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBkaCxzdG0zMm1wMTMxYS1kaGNvci1z
b20KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogc3Qsc3RtMzJtcDEzNQo+Pgo+PiBU
aGUgZW50cmllcyBsb29rIG9yZGVyZWQgYnkgbGFzdCBjb21wYXRpYmxlLCBzbyB0aGlzIGJyZWFr
cyB0aGUgb3JkZXIuCj4gCj4gQW5kIHVoIC4uLiBJIHdpbGwgbm90IGRvIGxhc3QgbWludXRlIGNo
YW5nZXMgYmVmb3JlIHNlbmRpbmcgb3V0IGxhcmdlIAo+IHNlcmllcyBuZXh0IHRpbWUsIHNvcnJ5
Lgo+IAo+IEknbGwgd2FpdCBmb3IgQWxleCB0byBzZWUgaWYgMDIuLjE5IGJldHRlciBiZSBzcXVh
c2hlZCBvciBzZXBhcmF0ZSwgYW5kIAo+IHRoZW4gZml4IHRoaXMgdXAgYW5kIHNlbmQgVjIuCgpZ
ZXMgSSB3b3VsZCBwcmVmZXIgdGhhdCB5b3Ugc3F1YXNoIHBpbnMgZGVmaW5pdGlvbiBwYXRjaGVz
LgoKVGhhbmtzCkFsZXgKCj4gCj4gVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
