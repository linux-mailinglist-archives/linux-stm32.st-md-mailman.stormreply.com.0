Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FAE1A188
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 18:31:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6A17CB3CC9
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 16:31:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E673DC9AE2D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:31:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AGLv9N031400; Fri, 10 May 2019 18:31:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Pq3HEnrBxmHUg804ylDScZo6PUgqA6F9UaBUW1RWHPI=;
 b=gOlmJhgmOkGbep51THZZMi4O2FhvBcTzgQ6viq9a6pEYpvVqGwiC8r2elc9KHCQvJZAF
 6S8BAiwTBWqUFfTne9SUAPkStXRe1vYQzNQfph+8rTc8qTprHP13hIPowXbaXRZDT8VS
 y6T8X68iHKpnzxjY4z1wDc9ZwhQAuUutoR9F6uicYTvWO7l2T5PwW3ad4WZhBteaeryM
 /8PLBgqZPKNJ7l4+Pf/FvGpOnJqXC2pjg34m8uP7nKOzqIe7F5U6QC+YVTj6VX/lRvh9
 brgUU4YHRA76bAyjY0+cvNnB0ONfxYzxxpr4UPPUXhSHI8+gsJLUHigS3oEHHr44Zkay /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2scfv2ssg2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:31:03 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DC8B431;
 Fri, 10 May 2019 16:31:01 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D97A2C7B;
 Fri, 10 May 2019 16:31:01 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 May
 2019 18:31:01 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Fri, 10 May 2019 18:31:01 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, Vincent ABRIOU <vincent.abriou@st.com>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH] drm/stm: dsi: check hardware version
Thread-Index: AQHVB0F6WdJZvFc8KES7qWS4k2MwuKZka3YA
Date: Fri, 10 May 2019 16:31:00 +0000
Message-ID: <aa466c60-9110-630e-3c75-99e632207334@st.com>
References: <1557500579-19720-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1557500579-19720-1-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <80D47EC4139D2044A2187849EEE1B1A4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH] drm/stm: dsi: check hardware version
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

DQpEZWFyIFlhbm5pY2ssDQpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2gsDQoNCkFja2VkLWJ5OiBQ
aGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KDQpEZWFyIEJlbmphbWluLA0K
SWYgeW91IGFyZSBmaW5lIHdpdGggdGhpcyBwYXRjaCwgcGxlYXNlIHB1c2ggaXQgKmFmdGVyKiB0
aGUgcGF0Y2ggbmFtZWQgDQoiZHJtL3N0bTogZHNpOiBhZGQgc3VwcG9ydCBvZiBhbiBvcHRpb25h
bCByZWd1bGF0b3IiIChpZiBJIHdlbGwgDQp1bmRlcnN0b29kIHRob3NlIHR3byBwYXRjaGVzKQ0K
DQpUaGFuayB5b3UNClBoaWxpcHBlIDotKQ0KDQoNCk9uIDUvMTAvMTkgNTowMiBQTSwgWWFubmlj
ayBGZXJ0csOpIHdyb3RlOg0KPiBDaGVjayB2ZXJzaW9uIG9mIERTSSBoYXJkd2FyZSBJUC4gT25s
eSB2ZXJzaW9ucyAxLjMwICYgMS4zMQ0KPiBhcmUgc3VwcG9ydGVkLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+DQo+IC0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMgfCAyNCArKysrKysrKysrKysr
KysrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9k
c2ktc3RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jDQo+IGluZGV4
IDIyYmQwOTUuLjI5MTA1ZTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdf
bWlwaV9kc2ktc3RtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1z
dG0uYw0KPiBAQCAtMjI3LDcgKzIyNyw2IEBAIGR3X21pcGlfZHNpX2dldF9sYW5lX21icHModm9p
ZCAqcHJpdl9kYXRhLCBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwNCj4gICAJ
dTMyIHZhbDsNCj4gICANCj4gICAJLyogVXBkYXRlIGxhbmUgY2FwYWJpbGl0aWVzIGFjY29yZGlu
ZyB0byBodyB2ZXJzaW9uICovDQo+IC0JZHNpLT5od192ZXJzaW9uID0gZHNpX3JlYWQoZHNpLCBE
U0lfVkVSU0lPTikgJiBWRVJTSU9OOw0KPiAgIAlkc2ktPmxhbmVfbWluX2ticHMgPSBMQU5FX01J
Tl9LQlBTOw0KPiAgIAlkc2ktPmxhbmVfbWF4X2ticHMgPSBMQU5FX01BWF9LQlBTOw0KPiAgIAlp
ZiAoZHNpLT5od192ZXJzaW9uID09IEhXVkVSXzEzMSkgew0KPiBAQCAtMzA2LDYgKzMwNSw3IEBA
IHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfc3RtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiAg
IAlzdHJ1Y3QgZHdfbWlwaV9kc2lfc3RtICpkc2k7DQo+ICsJc3RydWN0IGNsayAqcGNsazsNCj4g
ICAJc3RydWN0IHJlc291cmNlICpyZXM7DQo+ICAgCWludCByZXQ7DQo+ICAgDQo+IEBAIC0zNDcs
NiArMzQ3LDI4IEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfc3RtX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgCQlnb3RvIGVycl9jbGtfZ2V0Ow0KPiAgIAl9DQo+ICAg
DQo+ICsJcGNsayA9IGRldm1fY2xrX2dldChkZXYsICJwY2xrIik7DQo+ICsJaWYgKElTX0VSUihw
Y2xrKSkgew0KPiArCQlyZXQgPSBQVFJfRVJSKHBjbGspOw0KPiArCQlEUk1fRVJST1IoIlVuYWJs
ZSB0byBnZXQgcGVyaXBoZXJhbCBjbG9jazogJWRcbiIsIHJldCk7DQo+ICsJCWdvdG8gZXJyX2Rz
aV9wcm9iZTsNCj4gKwl9DQo+ICsNCj4gKwlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUocGNsayk7
DQo+ICsJaWYgKHJldCkgew0KPiArCQlEUk1fRVJST1IoIiVzOiBGYWlsZWQgdG8gZW5hYmxlIHBl
cmlwaGVyYWwgY2xrXG4iLCBfX2Z1bmNfXyk7DQo+ICsJCWdvdG8gZXJyX2RzaV9wcm9iZTsNCj4g
Kwl9DQo+ICsNCj4gKwlkc2ktPmh3X3ZlcnNpb24gPSBkc2lfcmVhZChkc2ksIERTSV9WRVJTSU9O
KSAmIFZFUlNJT047DQo+ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHBjbGspOw0KPiArDQo+ICsJ
aWYgKGRzaS0+aHdfdmVyc2lvbiAhPSBIV1ZFUl8xMzAgJiYgZHNpLT5od192ZXJzaW9uICE9IEhX
VkVSXzEzMSkgew0KPiArCQlyZXQgPSAtRU5PREVWOw0KPiArCQlEUk1fRVJST1IoImJhZCBkc2kg
aGFyZHdhcmUgdmVyc2lvblxuIik7DQo+ICsJCWdvdG8gZXJyX2RzaV9wcm9iZTsNCj4gKwl9DQo+
ICsNCj4gICAJZHdfbWlwaV9kc2lfc3RtX3BsYXRfZGF0YS5iYXNlID0gZHNpLT5iYXNlOw0KPiAg
IAlkd19taXBpX2RzaV9zdG1fcGxhdF9kYXRhLnByaXZfZGF0YSA9IGRzaTsNCj4gICANCj4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
