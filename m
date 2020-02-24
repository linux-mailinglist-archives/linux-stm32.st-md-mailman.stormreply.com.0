Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40A16A01C
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2020 09:35:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEF6AC36B0B;
	Mon, 24 Feb 2020 08:35:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7152C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2020 08:35:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01O8STP6003173; Mon, 24 Feb 2020 09:35:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=7PELC+vweWKrffU05WDizALZGrVFR9H5KIm3RrEooxQ=;
 b=wRAQs8o8BEZqlLbBZ1wvX6wvXH7UNrKHG13FBW/Ti8d6aGeSSshAVDNMLH31SKfZOarv
 Xmbxj/bSW5C2YMf334oQCkox5EKvCAEjEJbiBuY9qBXHPmc1SoTCggIuY5cy2+iRYX8n
 FS+AMngbggT+7rFUIkIke3J0xn88p64gk9KzemQkv/FyUfXOGXEDPclKIVs0D26uiL/D
 kAFmKfeevfCJ49NejpLt0XCrLkm8jwWVvwylhRGBFkyGVGVysQ3PJgeu4h0DS+/CPqy9
 8YoHhlN/0vd4ZVU5uT8edVZBXExC+zKTecm0xbrG7rQlFhOEchteElHK3V7VwFkE8D3x xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yatn5rnad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2020 09:35:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14F5110002A;
 Mon, 24 Feb 2020 09:35:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F305D2B0958;
 Mon, 24 Feb 2020 09:35:22 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 24 Feb
 2020 09:35:22 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 24 Feb 2020 09:35:22 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Marek Vasut <marex@denx.de>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [PATCH V2 6/6] ARM: dts: stm32: Add DH Electronics DHCOM
 STM32MP1 SoM and PDK2 board
Thread-Index: AQHVzvxWZmvQfipRJEWVD8cExEN3RagUsYEAgBRNboCAATz3oA==
Date: Mon, 24 Feb 2020 08:35:22 +0000
Message-ID: <5efd7978050e48d783d10c989b5e78f5@SFHDAG6NODE3.st.com>
References: <20200119191143.50033-1-marex@denx.de>
 <20200119191143.50033-6-marex@denx.de>
 <1b288811-8ffb-a150-71ef-4c006e6d5740@st.com>
 <1ec643e9-217d-c83d-793f-c05d6c4502bd@denx.de>
In-Reply-To: <1ec643e9-217d-c83d-793f-c05d6c4502bd@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-24_02:2020-02-21,
 2020-02-24 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH V2 6/6] ARM: dts: stm32: Add DH
 Electronics DHCOM STM32MP1 SoM and PDK2 board
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

SGkgTWFyZWssDQoNCj4gRnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+IFNlbnQ6
IGRpbWFuY2hlIDIzIGbDqXZyaWVyIDIwMjAgMTU6MzgNCj4gDQo+IE9uIDIvMTAvMjAgNTozNSBQ
TSwgQWxleGFuZHJlIFRvcmd1ZSB3cm90ZToNCj4gPiBIaSBNYXJlaw0KPiANCj4gSGksDQo+IA0K
PiA+IE9uIDEvMTkvMjAgODoxMSBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6DQo+ID4+IEFkZCBzdXBw
b3J0IGZvciBESCBFbGVjdHJvbmljcyBESENPTSBTb00gYW5kIFBESzIgcmV2LiA0MDAgY2Fycmll
cg0KPiA+PiBib2FyZC4gVGhpcyBpcyBhbiBTb00gd2l0aCBTVE0zMk1QMTU3QyBhbmQgYW4gZXZh
bHVhdGlvbiBraXQuIFRoZQ0KPiA+PiBiYXNlYm9hcmQgcHJvdmlkZXMgRXRoZXJuZXQsIFVBUlQs
IFVTQiwgQ0FOIGFuZCBvcHRpb25hbCBkaXNwbGF5Lg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4gPj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUg
PGFsZXhhbmRyZS50b3JndWVAc3QuY29tPg0KPiA+PiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29x
dWVsaW4uc3RtMzJAZ21haWwuY29tPg0KPiA+PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNl
LmNob3RhcmRAc3QuY29tPg0KPiA+PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxh
dW5heUBzdC5jb20+DQo+ID4+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tDQo+ID4+IFRvOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4g
Pj4gLS0tDQo+ID4+IFYyOiAtIEFkZCBzdG0zMm1wMSBpbnRvIHRoZSBzdWJqZWN0IGFuZCBjb21t
aXQgbWVzc2FnZQ0KPiA+PiDCoMKgwqDCoCAtIFNvcnQgRFQgYWxwaGFudW1lcmljYWxseQ0KPiA+
PiDCoMKgwqDCoCAtIE1vdmUgYWxsIHBpbmNvbnRyb2wgZW50cmllcyBpbnRvIHN0bTMybXAxNS1w
aW5jdHJsLmR0c2kNCj4gPj4gLS0tDQo+ID4NCj4gPiBUaGFua3MgdG8gYWRkIGEgbmV3IFNUTTMy
IGJvYXJkLg0KPiA+DQo+ID4gU2VyaWVzIGFwcGxpZWQgb24gc3RtMzItbmV4dC4NCj4gDQo+IEhv
dyBjb21lIHRoZXNlIGFyZSBub3QgaW4gbmV4dC9tYXN0ZXIgeWV0LCBpcyB0aGUgYnJhbmNoIG5v
dCBiZWluZyBtZXJnZWQgaW50bw0KPiBuZXh0IHJlZ3VsYXJseSA/DQoNClRoaXMgYWNjZXB0ZWQg
cGF0Y2ggaXMgYWxyZWFkeSBpbiBzdG0zMi1tYXN0ZXIsIGluY2x1ZGVkIGluIGxhc3RlZCBwdWxs
IHJlcXVlc3QgdS1ib290LXN0bTMyLTIwMjAwMjE0DQoNClNIQTEgPSAxOTk1MzczMDliYTUzZDI5
NGMzMTI4MzA2NGQ2M2RhZmM5OTVmYmVkDQoNCk1lcmdlZCBpbiB1LWJvb3QvbWFzdGVyIGp1c3Rl
IGFmdGVyIHYyMDIwLjA0LXJjMg0KDQpSZWdhcmRzLA0KDQpQYXRyaWNrDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
