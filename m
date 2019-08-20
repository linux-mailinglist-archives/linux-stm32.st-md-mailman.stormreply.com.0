Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA2E9591C
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2019 10:10:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB186C35E01;
	Tue, 20 Aug 2019 08:10:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D348C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 08:10:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7K87JE1032130; Tue, 20 Aug 2019 10:10:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8T98DWxrHvJW0ljd24C3M5usmxTT+jRYLcAUdJHXif0=;
 b=OgGKWo5mxugXtpsbwOngyCCJe5b0icMidtAcdZvBcWrAP71xWAeABX/iIDxHtDDOJC18
 x0MMmkXFuZR9BO+HHR55YPiB0+PUa8Tqct17K4F1x5rJkU6vsCUFmXkm9LAz3q6Rjhqw
 tZtU24G2pPq29fR8EFbOaeLDelEteBVL3F2I5Iy3+Ik6atmUbZuPxap4IPmcud40jThA
 aAgkrwBy5iFdbZ7qR1eVnEwG5bSmVcveaVjVQTqvpF7/rjNZlrDDQ1uQHW3OLZ2lPjvC
 SQbe0O9n3bPq5lHEkKjsHiXaV5wL0bejsiPSW3O6FzUbdDCGRrcnP8XnTSz3+ssLhE35 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2ue8fgq6rm-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 20 Aug 2019 10:10:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D10BE3A;
 Tue, 20 Aug 2019 08:09:58 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C8FC2BC42F;
 Tue, 20 Aug 2019 10:09:58 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Aug
 2019 10:09:58 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Tue, 20 Aug 2019 10:09:58 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Alexandre TORGUE
 <alexandre.torgue@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>
Thread-Topic: [PATCH v7 0/4] DCMI bridge support
Thread-Index: AQHVVmonZD9iAGFT80+FGsi2F1VjYqcCDlyAgAGAl4A=
Date: Tue, 20 Aug 2019 08:09:58 +0000
Message-ID: <228dfbae-1e73-2a9c-f6f0-799a07cd31bc@st.com>
References: <1566204081-19051-1-git-send-email-hugues.fruchet@st.com>
 <0cd073d9-3d25-9e22-f243-f72e395e9e96@xs4all.nl>
 <5d36f437-0de5-1aa0-09bf-51d3a415ad2f@st.com>
In-Reply-To: <5d36f437-0de5-1aa0-09bf-51d3a415ad2f@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <954DBE3CD9A5444C89ECF19C5CD1E0B4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_02:, , signatures=0
Cc: Mickael GUENE <mickael.guene@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v7 0/4] DCMI bridge support
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

SGkgU2FrYXJpLCBIYW5zLA0KDQpzdC1taXBpZDAyIGNoYW5nZXMgYXJlIGFscmVhZHkgbWVyZ2Vk
LCB0aGFua3MgU2FrYXJpIGFuZCBzb3JyeSBmb3IgDQpkaXN0dXJiYW5jZS4NCg0KU3RpbGwgcmVt
YWluIHRoZSBWNEwyX0NJRF9MSU5LX0ZSRVEgZm9yIE9WNTY0MC4NCg0KDQpPbiA4LzE5LzE5IDEx
OjEzIEFNLCBIdWd1ZXMgRlJVQ0hFVCB3cm90ZToNCj4gSGkgSGFucywgU2FrYXJpLA0KPiANCj4g
T0sgdG8gcHVzaCBzZXBhcmF0ZWx5IHRoZSA4MCBjaGFyIGZpeC4NCj4gDQo+IFRoZXJlIHdhcyBw
ZW5kaW5nIHJlbGF0ZWQgY2hhbmdlcyBvbiBzdC1taXBpZDAyIGFuZCBvdjU2NDAgKGxpc3RlZCAN
Cj4gYmVsb3cpLCBkbyB5b3UgdGhpbmsgaXQncyBwb3NzaWJsZSB0byB0YWtlIHRoZW0gYWxzbyA/
DQo+IA0KPiANCj4gbWVkaWE6IHN0LW1pcGlkMDI6IGFkZCBzdXBwb3J0IG9mIFY0TDJfQ0lEX0xJ
TktfRlJFUSANCj4gaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcGF0Y2gvNTY5NjkvDQo+
IFN0YXRlwqDCoMKgIEFjY2VwdGVkDQo+IA0KPiBbdjIsMS8zXSBtZWRpYTogc3QtbWlwaWQwMjog
YWRkIHN1cHBvcnQgb2YgUkdCNTY1DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3Bh
dGNoLzU2OTcwLw0KPiBTdGF0ZcKgwqDCoCBBY2NlcHRlZA0KPiANCj4gW3YyLDIvM10gbWVkaWE6
IHN0LW1pcGlkMDI6IGFkZCBzdXBwb3J0IG9mIFlVWVY4IGFuZCBVWVZZOA0KPiBodHRwczovL3Bh
dGNod29yay5saW51eHR2Lm9yZy9wYXRjaC81Njk3MS8NCj4gU3RhdGXCoMKgwqAgQWNjZXB0ZWQN
Cj4gDQo+IFt2MiwzLzNdIG1lZGlhOiBzdC1taXBpZDAyOiBhZGQgc3VwcG9ydCBvZiBKUEVHIA0K
PiBodHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9wYXRjaC81Njk3My8NCj4gU3RhdGXCoMKg
wqAgQWNjZXB0ZWQNCj4gDQo+IA0KPiBbdjJdIG1lZGlhOiBvdjU2NDA6IGFkZCBzdXBwb3J0IG9m
IFY0TDJfQ0lEX0xJTktfRlJFUQ0KPiBodHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9wYXRj
aC81NzIxNS8NCj4gU3RhdGXCoMKgwqAgQ2hhbmdlcyBSZXF1ZXN0ZWQNCj4gPT4gVGhpcyBjaGFu
Z2UgaXMgbmVlZGVkIHRvIG1ha2UgaXQgd29yayB0aGUgd2hvbGUgc2V0dXAuDQo+ID0+IEkgZG9u
J3Qga25vdyB3aGF0IHRvIGNoYW5nZSBoZXJlLCBldmVuIGlmIHRoaXMgMzg0TUh6IGZpeGVkIHZh
bHVlIA0KPiBzZWVtcyBzdHJhbmdlLCBpdCB3b3JrcyBmaW5lIG9uIG15IHNldHVwLCBvbiBteSBv
cGluaW9uIGl0J3MgYmV0dGVyIHRoYW4gDQo+IG5vdGhpbmcuIFdlIGNvdWxkIGNvbWUgYmFjayBv
biB0aGlzIGxhdGVyIG9uIHdoZW4gb3RoZXIgT1Y1NjQwIENTSSANCj4gaW50ZXJmYWNlcyB3aWxs
IHJlcXVpcmUgVjRMMl9DSURfTElOS19GUkVRIHZhbHVlLg0KPiANCj4gU2FrYXJpLCB3aGF0IGRv
IHlvdSB0aGluayBhYm91dCB0aGlzID8NCj4gDQo+IA0KPiBCUiwNCj4gSHVndWVzLg0KDQpCUiwN
Ckh1Z3Vlcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
