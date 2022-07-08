Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E758694A
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 14:00:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21006C640F4;
	Mon,  1 Aug 2022 12:00:12 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17421C0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Jul 2022 09:07:49 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LfS6Q2vNtz1L8tg;
 Fri,  8 Jul 2022 17:05:18 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 17:07:46 +0800
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 8 Jul 2022 17:07:45 +0800
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Richard Weinberger
 <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <64cde893efca8f4dc381184cd7f6e5a54cd000f9.1656960335.git.christophe.jaillet@wanadoo.fr>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <16e6eef2-bf83-f5c1-6543-8c49a70c7d85@huawei.com>
Date: Fri, 8 Jul 2022 17:07:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <64cde893efca8f4dc381184cd7f6e5a54cd000f9.1656960335.git.christophe.jaillet@wanadoo.fr>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 01 Aug 2022 12:00:10 +0000
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ubi: fastmap: Use the bitmap API to
	allocate bitmaps
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

1NogMjAyMi83LzUgMjo0NiwgQ2hyaXN0b3BoZSBKQUlMTEVUINC0tcA6Cj4gVXNlIGJpdG1hcF96
YWxsb2MoKS9iaXRtYXBfZnJlZSgpIGluc3RlYWQgb2YgaGFuZC13cml0aW5nIHRoZW0uCj4gCj4g
SXQgaXMgbGVzcyB2ZXJib3NlIGFuZCBpdCBpbXByb3ZlcyB0aGUgc2VtYW50aWMuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRv
by5mcj4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS9mYXN0bWFwLmMgfCAxMCArKysrLS0tLS0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvZmFzdG1hcC5jIGIvZHJpdmVycy9tdGQvdWJp
L2Zhc3RtYXAuYwo+IGluZGV4IDZlOTVjNGIxNDczZS4uY2EyZDllZmU2MmMzIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL3ViaS9mYXN0bWFwLmMKPiArKysgYi9kcml2ZXJzL210ZC91YmkvZmFz
dG1hcC5jCj4gQEAgLTIwLDggKzIwLDcgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nICpp
bml0X3NlZW4oc3RydWN0IHViaV9kZXZpY2UgKnViaSkKPiAgIAlpZiAoIXViaV9kYmdfY2hrX2Zh
c3RtYXAodWJpKSkKPiAgIAkJcmV0dXJuIE5VTEw7Cj4gICAKPiAtCXJldCA9IGtjYWxsb2MoQklU
U19UT19MT05HUyh1YmktPnBlYl9jb3VudCksIHNpemVvZih1bnNpZ25lZCBsb25nKSwKPiAtCQkg
ICAgICBHRlBfS0VSTkVMKTsKPiArCXJldCA9IGJpdG1hcF96YWxsb2ModWJpLT5wZWJfY291bnQs
IEdGUF9LRVJORUwpOwo+ICAgCWlmICghcmV0KQo+ICAgCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVN
KTsKPiAgIAo+IEBAIC0zNCw3ICszMyw3IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyAq
aW5pdF9zZWVuKHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpCj4gICAgKi8KPiAgIHN0YXRpYyBpbmxp
bmUgdm9pZCBmcmVlX3NlZW4odW5zaWduZWQgbG9uZyAqc2VlbikKPiAgIHsKPiAtCWtmcmVlKHNl
ZW4pOwo+ICsJYml0bWFwX2ZyZWUoc2Vlbik7Cj4gICB9Cj4gICAKPiAgIC8qKgo+IEBAIC0xMTA4
LDggKzExMDcsNyBAQCBpbnQgdWJpX2Zhc3RtYXBfaW5pdF9jaGVja21hcChzdHJ1Y3QgdWJpX3Zv
bHVtZSAqdm9sLCBpbnQgbGViX2NvdW50KQo+ICAgCWlmICghdWJpLT5mYXN0X2F0dGFjaCkKPiAg
IAkJcmV0dXJuIDA7Cj4gICAKPiAtCXZvbC0+Y2hlY2ttYXAgPSBrY2FsbG9jKEJJVFNfVE9fTE9O
R1MobGViX2NvdW50KSwgc2l6ZW9mKHVuc2lnbmVkIGxvbmcpLAo+IC0JCQkJR0ZQX0tFUk5FTCk7
Cj4gKwl2b2wtPmNoZWNrbWFwID0gYml0bWFwX3phbGxvYyhsZWJfY291bnQsIEdGUF9LRVJORUwp
Owo+ICAgCWlmICghdm9sLT5jaGVja21hcCkKPiAgIAkJcmV0dXJuIC1FTk9NRU07Cj4gICAKPiBA
QCAtMTExOCw3ICsxMTE2LDcgQEAgaW50IHViaV9mYXN0bWFwX2luaXRfY2hlY2ttYXAoc3RydWN0
IHViaV92b2x1bWUgKnZvbCwgaW50IGxlYl9jb3VudCkKPiAgIAo+ICAgdm9pZCB1YmlfZmFzdG1h
cF9kZXN0cm95X2NoZWNrbWFwKHN0cnVjdCB1Ymlfdm9sdW1lICp2b2wpCj4gICB7Cj4gLQlrZnJl
ZSh2b2wtPmNoZWNrbWFwKTsKPiArCWJpdG1hcF9mcmVlKHZvbC0+Y2hlY2ttYXApOwo+ICAgfQo+
ICAgCj4gICAvKioKPiAKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1
YXdlaS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
