Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA10FB2B
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 16:15:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87753C35E06
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 14:15:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF62BC35E04
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 14:15:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3UE6LPL010303; Tue, 30 Apr 2019 16:14:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=wVAF4VcgCoPovYkYujuZ0SFBZ4zyMNXDHTC+k86k8nw=;
 b=BCZFve+8b1Ce+c9TwAg822fkbwuV9mhPNaYX2VdT+eyJjoxrzbP1dLC0O0DhWnIxv5sR
 V20FU+GsnPzgzASCtF5PN8SveBcI56I/zx0LyxaErFiUXi+YNftl6ym/8FoF0Ri0dLpa
 d4B5DTrq+f+uqUWNSrMYovsP+OlsIZifY7sWY3NNs7s/EbY61X7BohD5UVNAj9t03L/W
 X6Pqv/efSa002wINyidEzjP2UJSzUQ9bvL8okDcMuLdD/95nmjvb9umJ1Gqg2CF74LoR
 Bp86Wg4Xc7Gb1GPCZ5/s5br/Ip8FxzLtlmvy4E54ihFCIR2a1n5BP+ywlLfOnYe8KhHB wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s61r46fke-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Apr 2019 16:14:57 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1B49538;
 Tue, 30 Apr 2019 14:14:57 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag7node1.st.com [10.75.127.19])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DAFA82783;
 Tue, 30 Apr 2019 14:14:56 +0000 (GMT)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG7NODE1.st.com
 (10.75.127.19) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 30 Apr
 2019 16:14:56 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1347.000; Tue, 30 Apr 2019 16:14:56 +0200
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH v2 2/8] dt-bindings: remoteproc: add bindings for stm32
 remote processor driver
Thread-Index: AQHU9GTeXsjxiZVOtkWqZ1JzbzYVxKZT0GeAgADjc4A=
Date: Tue, 30 Apr 2019 14:14:56 +0000
Message-ID: <ff424530-6e7b-cec9-910f-1897d60de2a1@st.com>
References: <1555426699-5340-1-git-send-email-fabien.dessenne@st.com>
 <1555426699-5340-3-git-send-email-fabien.dessenne@st.com>
 <20190430004051.GA7391@bogus>
In-Reply-To: <20190430004051.GA7391@bogus>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <C401803B7776484DB68784B75992918A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_07:, , signatures=0
Cc: Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/8] dt-bindings: remoteproc: add
 bindings for stm32 remote processor driver
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

SGkgUm9iLA0KDQoNCk9uIDMwLzA0LzIwMTkgMjo0MCBBTSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+
IE9uIFR1ZSwgQXByIDE2LCAyMDE5IGF0IDA0OjU4OjEzUE0gKzAyMDAsIEZhYmllbiBEZXNzZW5u
ZSB3cm90ZToNCj4+IEFkZCB0aGUgZGV2aWNlIHRyZWUgYmluZGluZ3MgZG9jdW1lbnQgZm9yIHRo
ZSBzdG0zMiByZW1vdGVwcm9jIGRldmljZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRmFiaWVu
IERlc3Nlbm5lIDxmYWJpZW4uZGVzc2VubmVAc3QuY29tPg0KPj4gLS0tDQo+PiAgIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3JlbW90ZXByb2Mvc3RtMzItcnByb2MudHh0IHwgNjQgKysrKysrKysr
KysrKysrKysrKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQ0KPj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jl
bW90ZXByb2Mvc3RtMzItcnByb2MudHh0DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL3N0bTMyLXJwcm9jLnR4dCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL3N0bTMyLXJwcm9jLnR4dA0K
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAuLjQzMDEzMmMNCj4+IC0t
LSAvZGV2L251bGwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
ZW1vdGVwcm9jL3N0bTMyLXJwcm9jLnR4dA0KPj4gQEAgLTAsMCArMSw2NCBAQA0KPj4gK1NUTWlj
cm9lbGVjdHJvbmljcyBTVE0zMiBSZW1vdGVwcm9jDQo+PiArLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4+ICtUaGlzIGRvY3VtZW50IGRlZmluZXMgdGhlIGJpbmRpbmcgZm9y
IHRoZSByZW1vdGVwcm9jIGNvbXBvbmVudCB0aGF0IGxvYWRzIGFuZA0KPj4gK2Jvb3RzIGZpcm13
YXJlcyBvbiB0aGUgU1QzMk1QIGZhbWlseSBjaGlwc2V0Lg0KPj4gKw0KPj4gK1JlcXVpcmVkIHBy
b3BlcnRpZXM6DQo+PiArLSBjb21wYXRpYmxlOglNdXN0IGJlICJzdCxzdG0zMm1wMS1tNCINCj4+
ICstIHJlZzoJCUFkZHJlc3MgcmFuZ2VzIG9mIHRoZSByZW1vdGUgcHJvY2Vzc29yIGRlZGljYXRl
ZCBtZW1vcmllcy4NCj4+ICsJCVRoZSBwYXJlbnQgbm9kZSBzaG91bGQgcHJvdmlkZSBhbiBhcHBy
b3ByaWF0ZSByYW5nZXMgcHJvcGVydHkNCj4+ICsJCWZvciBwcm9wZXJseSB0cmFuc2xhdGluZyB0
aGVzZSBpbnRvIGJ1cyBhZGRyZXNzZXMuDQo+IGRtYS1yYW5nZXMsIGJ1dCB0aGF0J3MgaW5kZXBl
bmRlbnQgb2YgJ3JlZycuDQo+DQo+IEl0IG5lZWRzIHRvIGxpc3QgaG93IG1hbnkgcmVnIHJlZ2lv
bnMgYW5kIHdoYXQgdGhleSBhcmUuDQoNClRoZSAicmVnIiBwcm9wZXJ0eSBuZWVkcyB0byBiZSBy
ZW1vdmVkIHNpbmNlIGl0IGlzIG5vdCB1c2VkIGJ5IHRoZSANCmRyaXZlciA6IHRoZSAibWVtb3J5
LXJlZ2lvbiIgcHJvcGVydHkgKGRlZmluZWQgYmVsb3cpIHByb3ZpZGVzIHdpdGggYWxsIA0KdGhl
IG5lZWRlZCBtZW1vcnkgaW5mb3JtYXRpb24uDQoNClVuZm9ydHVuYXRlbHksIHdoZW4gSSByZW1v
dmUgdGhpcyAicmVnIiBwcm9wZXJ0eSBmcm9tIHRoZSBEZXZpY2VUcmVlLCBJIA0KaGF2ZSB0aGlz
IHdhcm5pbmcgd2hlbiBidWlsZGluZyAoVz0xMjMpIHRoZSBEVEI6DQoNCiDCoCJXYXJuaW5nIChh
dm9pZF91bm5lY2Vzc2FyeV9hZGRyX3NpemUpOiAvbWxhaGI6IHVubmVjZXNzYXJ5IA0KI2FkZHJl
c3MtY2VsbHMvI3NpemUtY2VsbHMgd2l0aG91dCAicmFuZ2VzIiBvciBjaGlsZCAicmVnIiBwcm9w
ZXJ0eSINCg0KSU1ITywgdGhlcmUgaXMgc29tZXRoaW5nIHdyb25nIGluIHRoZSBkdGMgc2NyaXB0
IHdoaWNoIHNlZW1zIHRvIGlnbm9yZSANCnRoZSAiZG1hLXJhbmdlcyIgcHJvcGVydHkgdGhhdCBu
ZWVkcyB0byBoYXZlICNhZGRyZXNzLWNlbGxzLyNzaXplLWNlbGxzIA0KZGVmaW5lZC4gSnVzdCBs
aWtlICJyYW5nZXMiLg0KDQpUaGUgcXVpY2sgcGF0Y2ggYmVsb3cgKGFkZCBjaGVjayBmb3IgImRt
YS1yYW5nZXMiICkgaW4gDQpzY3JpcHRzL2R0Yy9jaGVja3MuYyBzb2x2ZXMgdGhpcyBpc3N1ZS4N
Cg0Kc3RhdGljIHZvaWQgY2hlY2tfYXZvaWRfdW5uZWNlc3NhcnlfYWRkcl9zaXplKHN0cnVjdCBj
aGVjayAqYywgc3RydWN0IA0KZHRfaW5mbyAqZHRpLA0KIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgwqDCoMKgwqDCoCBzdHJ1Y3Qgbm9kZSAqbm9kZSkNCnsNCi4uLg0KIMKgwqDC
oCBpZiAoZ2V0X3Byb3BlcnR5KG5vZGUsICJyYW5nZXMiKSB8fCBnZXRfcHJvcGVydHkobm9kZSwg
DQoiZG1hLXJhbmdlcyIpIHx8ICFub2RlLT5jaGlsZHJlbikNCiDCoMKgwqAgwqDCoMKgIHJldHVy
bjsNCi4uLg0KDQpDYW4geW91IGNvbmZpcm0gdGhhdCBJIGNhbiByZW1vdmUgdGhlICJyZWciIHBy
b3BlcnR5IGFuZCBpZ25vcmUgdGhlIHdhcm5pbmc/DQoNCkJSDQoNCkZhYmllbg0KDQoNCj4NCj4+
ICstIHJlc2V0czoJUmVmZXJlbmNlIHRvIGEgcmVzZXQgY29udHJvbGxlciBhc3NlcnRpbmcgdGhl
IHJlbW90ZSBwcm9jZXNzb3IuDQo+PiArLSBzdCxzeXNjZmctaG9sZGJvb3Q6IFJlZmVyZW5jZSB0
byB0aGUgc3lzdGVtIGNvbmZpZ3VyYXRpb24gd2hpY2ggaG9sZHMgdGhlDQo+PiArCQlyZW1vdGUg
cHJvY2Vzc29yIHJlc2V0IGhvbGQgYm9vdA0KPj4gKwkxc3QgY2VsbDogcGhhbmRsZSBvZiBzeXNj
b24gYmxvY2sNCj4+ICsJMm5kIGNlbGw6IHJlZ2lzdGVyIG9mZnNldCBjb250YWluaW5nIHRoZSBo
b2xkIGJvb3Qgc2V0dGluZw0KPj4gKwkzcmQgY2VsbDogcmVnaXN0ZXIgYml0bWFzayBmb3IgdGhl
IGhvbGQgYm9vdCBmaWVsZA0KPj4gKy0gc3Qsc3lzY2ZnLXR6OiBSZWZlcmVuY2UgdG8gdGhlIHN5
c3RlbSBjb25maWd1cmF0aW9uIHdoaWNoIGhvbGRzIHRoZSBSQ0MgdHJ1c3QNCj4+ICsJCXpvbmUg
bW9kZQ0KPj4gKwkxc3QgY2VsbDogcGhhbmRsZSB0byBzeXNjb24gYmxvY2sNCj4+ICsJMm5kIGNl
bGw6IHJlZ2lzdGVyIG9mZnNldCBjb250YWluaW5nIHRoZSBSQ0MgdHJ1c3Qgem9uZSBtb2RlIHNl
dHRpbmcNCj4+ICsJM3JkIGNlbGw6IHJlZ2lzdGVyIGJpdG1hc2sgZm9yIHRoZSBSQ0MgdHJ1c3Qg
em9uZSBtb2RlIGJpdA0KPj4gKw0KPj4gK09wdGlvbmFsIHByb3BlcnRpZXM6DQo+PiArLSBpbnRl
cnJ1cHRzOglTaG91bGQgY29udGFpbiB0aGUgd2F0Y2hkb2cgaW50ZXJydXB0DQo+PiArLSBtYm94
ZXM6CVRoaXMgcHJvcGVydHkgaXMgcmVxdWlyZWQgb25seSBpZiB0aGUgcnBtc2cvdmlydGlvIGZ1
bmN0aW9uYWxpdHkNCj4+ICsJCWlzIHVzZWQuIExpc3Qgb2YgcGhhbmRsZSBhbmQgbWFpbGJveCBj
aGFubmVsIHNwZWNpZmllcnM6DQo+PiArCQktIGEgY2hhbm5lbCAoYSkgdXNlZCB0byBjb21tdW5p
Y2F0ZSB0aHJvdWdoIHZpcnRxdWV1ZXMgd2l0aCB0aGUNCj4+ICsJCSAgcmVtb3RlIHByb2MuDQo+
PiArCQkgIEJpLWRpcmVjdGlvbmFsIGNoYW5uZWw6DQo+PiArCQkgICAgICAtIGZyb20gbG9jYWwg
dG8gcmVtb3RlID0gc2VuZCBtZXNzYWdlDQo+PiArCQkgICAgICAtIGZyb20gcmVtb3RlIHRvIGxv
Y2FsID0gc2VuZCBtZXNzYWdlIGFjaw0KPj4gKwkJLSBhIGNoYW5uZWwgKGIpIHdvcmtpbmcgdGhl
IG9wcG9zaXRlIGRpcmVjdGlvbiBvZiBjaGFubmVsIChhKQ0KPj4gKwkJLSBhIGNoYW5uZWwgKGMp
IHVzZWQgYnkgdGhlIGxvY2FsIHByb2MgdG8gbm90aWZ5IHRoZSByZW1vdGUgcHJvYw0KPj4gKwkJ
ICB0aGF0IGl0IGlzIGFib3V0IHRvIGJlIHNodXQgZG93bi4NCj4+ICsJCSAgVW5pZGlyZWN0aW9u
YWwgY2hhbm5lbDoNCj4+ICsJCSAgICAgIC0gZnJvbSBsb2NhbCB0byByZW1vdGUsIHdoZXJlIEFD
SyBmcm9tIHRoZSByZW1vdGUgbWVhbnMNCj4+ICsJCSAgICAgICAgdGhhdCBpdCBpcyByZWFkeSBm
b3Igc2h1dGRvd24NCj4+ICstIG1ib3gtbmFtZXM6CVRoaXMgcHJvcGVydHkgaXMgcmVxdWlyZWQg
aWYgdGhlIG1ib3hlcyBwcm9wZXJ0eSBpcyB1c2VkLg0KPj4gKwkJLSBtdXN0IGJlICJ2cTAiIGZv
ciBjaGFubmVsIChhKQ0KPj4gKwkJLSBtdXN0IGJlICJ2cTEiIGZvciBjaGFubmVsIChiKQ0KPj4g
KwkJLSBtdXN0IGJlICJzaHV0ZG93biIgZm9yIGNoYW5uZWwgKGMpDQo+PiArLSBtZW1vcnktcmVn
aW9uOiBMaXN0IG9mIHBoYW5kbGVzIHRvIHRoZSByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucyBhc3Nv
Y2lhdGVkIHdpdGgNCj4+ICsJCXRoZSByZW1vdGVwcm9jIGRldmljZS4gVGhpcyBpcyB2YXJpYWJs
ZSBhbmQgZGVzY3JpYmVzIHRoZQ0KPj4gKwkJbWVtb3JpZXMgc2hhcmVkIHdpdGggdGhlIHJlbW90
ZSBwcm9jZXNzb3IgKGVnOiByZW1vdGVwcm9jDQo+PiArCQlmaXJtd2FyZSBhbmQgY2FydmVvdXRz
LCBycG1zZyB2cmluZ3MsIC4uLikuDQo+PiArCQkoc2VlIC4uL3Jlc2VydmVkLW1lbW9yeS9yZXNl
cnZlZC1tZW1vcnkudHh0KQ0KPj4gKy0gc3Qsc3lzY2ZnLXBkZHM6IFJlZmVyZW5jZSB0byB0aGUg
c3lzdGVtIGNvbmZpZ3VyYXRpb24gd2hpY2ggaG9sZHMgdGhlIHJlbW90ZQ0KPj4gKwkJcHJvY2Vz
c29yIGRlZXAgc2xlZXAgc2V0dGluZw0KPj4gKwkxc3QgY2VsbDogcGhhbmRsZSB0byBzeXNjb24g
YmxvY2sNCj4+ICsJMm5kIGNlbGw6IHJlZ2lzdGVyIG9mZnNldCBjb250YWluaW5nIHRoZSBkZWVw
IHNsZWVwIHNldHRpbmcNCj4+ICsJM3JkIGNlbGw6IHJlZ2lzdGVyIGJpdG1hc2sgZm9yIHRoZSBk
ZWVwIHNsZWVwIGJpdA0KPj4gKy0gYXV0b19ib290OglJZiBkZWZpbmVkLCB3aGVuIHJlbW90ZXBy
b2MgaXMgcHJvYmVkLCBpdCBsb2FkcyB0aGUgZGVmYXVsdA0KPj4gKwkJZmlybXdhcmUgYW5kIHN0
YXJ0cyB0aGUgcmVtb3RlIHByb2Nlc3Nvci4NCj4gc3QsYXV0by1ib290DQo+DQo+PiArDQo+PiAr
RXhhbXBsZToNCj4+ICsJbTRfcnByb2M6IG00QDAgew0KPj4gKwkJY29tcGF0aWJsZSA9ICJzdCxz
dG0zMm1wMS1tNCI7DQo+PiArCQlyZWcgPSA8MHgwMDAwMDAwMCAweDEwMDAwPiwNCj4+ICsJCSAg
ICAgIDwweDEwMDAwMDAwIDB4NDAwMDA+LA0KPj4gKwkJICAgICAgPDB4MzAwMDAwMDAgMHg0MDAw
MD47DQo+PiArCQlyZXNldHMgPSA8JnJjYyBNQ1VfUj47DQo+PiArCQlzdCxzeXNjZmctaG9sZGJv
b3QgPSA8JnJjYyAweDEwQyAweDE+Ow0KPj4gKwkJc3Qsc3lzY2ZnLXR6ID0gPCZyY2MgMHgwMDAg
MHgxPjsNCj4+ICsJfTsNCj4+IC0tIA0KPj4gMi43LjQNCj4+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
