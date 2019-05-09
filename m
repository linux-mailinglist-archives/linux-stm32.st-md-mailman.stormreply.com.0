Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3F418644
	for <lists+linux-stm32@lfdr.de>; Thu,  9 May 2019 09:40:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B492C54B1B
	for <lists+linux-stm32@lfdr.de>; Thu,  9 May 2019 07:40:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36C15C54B1A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 May 2019 07:40:53 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x497aplJ008618; Thu, 9 May 2019 09:40:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=sqNpP69L58AngmIqsKX38wmvLOxCSntjhIdSEkZAi8g=;
 b=jwEB7KhJEy+0Bn4pLlcxZ4JJRVqCaMQhypzCNZC5POQUwQCOiYHGKSTPOJOZqP57BPaT
 OuOfyzHm6n4o5ZcC04hKiy6Kn1Z1qAvTNwzNihgxs6IxhhQPNe0wVTMmLt28qabvvie6
 6ib/VRlY+Ox4yvlLBrjFAIjem9+Q2O9R8+PTGAzQZfoLA4SUPk1YQbgtckZ8+8WiQ/Rm
 Ht9hvU7jUDwc3/qe5FKgOswbnv07QtVoLEebmYo4DxHBqOXfM/rogcVp+tEp7RBUGq6X
 1clzep2LLQye4hK1yglkuqkQTbvoImGXhNGcZ33iRLxMkJZKgxQ+tLUyxbdufFbcYQUU Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2scdjp0rhx-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 09 May 2019 09:40:18 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3AD5342;
 Thu,  9 May 2019 07:40:16 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1355B1394;
 Thu,  9 May 2019 07:40:16 +0000 (GMT)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 9 May
 2019 09:40:15 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Thu, 9 May 2019 09:40:15 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
Thread-Topic: [PATCH] IIO: stm32: Remove quadrature related functions from
 trigger driver
Thread-Index: AQHVBLUCz+/gAEZUoUqVHnsxvwgdIqZfUXyAgAAmvICAAT3NAIABk+oA
Date: Thu, 9 May 2019 07:40:15 +0000
Message-ID: <e515e57d-697d-8d4b-3873-645aed53d394@st.com>
References: <20190507091224.17781-1-benjamin.gaignard@st.com>
 <20190507101729.GA3420@icarus>
 <CA+M3ks4LhOFTeArnh3d=C02qLJWj_u6tWDDOhD8kZnJPRkXC8w@mail.gmail.com>
 <20190508073434.GA3277@icarus>
In-Reply-To: <20190508073434.GA3277@icarus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <D844A18717961F469DF8736CA5405E54@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] IIO: stm32: Remove quadrature related
 functions from trigger driver
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

DQpPbiA1LzgvMTkgOTozNCBBTSwgV2lsbGlhbSBCcmVhdGhpdHQgR3JheSB3cm90ZToNCj4gT24g
VHVlLCBNYXkgMDcsIDIwMTkgYXQgMDI6Mzc6MDdQTSArMDIwMCwgQmVuamFtaW4gR2FpZ25hcmQg
d3JvdGU6DQo+PiBMZSBtYXIuIDcgbWFpIDIwMTkgw6AgMTI6MTksIFdpbGxpYW0gQnJlYXRoaXR0
IEdyYXkNCj4+IDx2aWxoZWxtLmdyYXlAZ21haWwuY29tPiBhIMOpY3JpdCA6DQo+Pj4gT24gVHVl
LCBNYXkgMDcsIDIwMTkgYXQgMTE6MTI6MjRBTSArMDIwMCwgQmVuamFtaW4gR2FpZ25hcmQgd3Jv
dGU6DQo+Pj4+IFF1YWRyYXR1cmUgZmVhdHVyZSBpcyBub3cgaG9zdGVkIG9uIGl0IG93biBmcmFt
ZXdvcmsuDQo+Pj4+IFJlbW92ZSBxdWFkcmF0dXJlIHJlbGF0ZWQgY29kZSBmcm9tIHN0bTMyLXRy
aWdnZXIgZHJpdmVyIHRvIGF2b2lkDQo+Pj4+IGNvZGUgZHVwbGljYXRpb24gYW5kIHNpbXBsaWZ5
IHRoZSBBQkkuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdhaWduYXJkIDxi
ZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+DQo+Pj4gQWx0aG91Z2ggdGhpcyBmdW5jdGlvbmFsaXR5
IGlzIG5vdyBwcm92aWRlZCBieSB0aGUgQ291bnRlciBzdWJzeXN0ZW0sIHdlDQo+Pj4gc2hvdWxk
IGtlZXAgdGhlIElJTyBDb3VudGVyIGludGVyZmFjZSBmb3IgdGhpcyBkcml2ZXIgaW50YWN0IHNp
bmNlDQo+Pj4gZXhpc3RpbmcgdXNlciBhcHBsaWNhdGlvbnMgbWF5IGRlcGVuZCBvbiBpdDsgdGhp
cyBpcyB0aGUgc2FtZSByZWFzb24gd2h5DQo+Pj4gdGhlIElJTyBDb3VudGVyIGNvZGUgaW4gdGhl
IDEwNC1RVUFELTggZGV2aWNlIGRyaXZlciB3YXMgbm90IHJlbW92ZWQNCj4+PiBkZXNwaXRlIG1v
dmluZyB0byB0aGUgQ291bnRlciBzdWJzeXN0ZW0uDQo+Pj4NCj4+PiBPbmNlIHVzZXIgYXBwbGlj
YXRpb25zIGhhdmUgaGFkIGVub3VnaCB0aW1lIHRvIG1pZ3JhdGUgdG8gdGhlIEdlbmVyaWMNCj4+
PiBDb3VudGVyIGludGVyZmFjZSwgd2UgY2FuIGNvbnNpZGVyIHJlbW92aW5nIHRoZSBkZXByZWNh
dGVkIElJTyBDb3VudGVyDQo+Pj4gaW50ZXJmYWNlLg0KPj4gSGkgV2lsbGlhbSwNCj4+DQo+PiBU
aGlzIFNvQyBpcyBub3QgeWV0IGluIHByb2R1Y3Rpb24gc28gdGhlaXIgaXMgbm8gbGVnYWN5IG9u
IHRoZSBvbGQgaW50ZXJmYWNlDQo+PiBhbmQgSSB3b3VsZCBsaWtlIHRvIGF2b2lkIHRvIGNyZWF0
ZSBvbmUuDQo+Pg0KPj4gQmVuamFtaW4NCj4gQWgsIEkgc2VlIHdoYXQgeW91IG1lYW4sIHRoaXMg
ZHJpdmVyIGlzIGZvciBmdXR1cmUgZGV2aWNlcy4gRG8gdGhlDQo+IGVhcmxpZXIgU1RNMzIgSDcg
c2VyaWVzIGRldmljZXMgaGF2ZSBhIHF1YWRyYXR1cmUgZmVhdHVyZSBhcyB3ZWxsLCBvciBpcw0K
PiB0aGlzIGZ1bmN0aW9uYWxpdHkgb25seSBhdmFpbGFibGUgd2l0aCB0aGUgbmV3IGRldmljZXM/
DQoNCkl0IGlzIGF2YWlsYWJsZSBvbiBTVE0zMiBINyBidXQgSSBoYXZlIG5ldmVyIHNlZSBhbnkg
TGludXggcHJvZHVjdCBvbiANCnRob3NlIFNPQw0KDQphbmQgZXZlbiBsZXNzIHVzaW5nIHF1YWRy
YXRpYyBlbmNvZGVyIDstKQ0KDQpCZW5qYW1pbg0KDQo+DQo+IFdpbGxpYW0gQnJlYXRoaXR0IEdy
YXkNCj4NCj4+PiBXaWxsaWFtIEJyZWF0aGl0dCBHcmF5DQo+Pj4NCj4+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPj4+IGxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0DQo+Pj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+
Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
