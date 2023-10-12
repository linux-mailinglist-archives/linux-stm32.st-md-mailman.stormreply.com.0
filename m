Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D97C6324
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Oct 2023 04:57:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6ED82C6B45E;
	Thu, 12 Oct 2023 02:57:58 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EBE9C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 02:57:56 +0000 (UTC)
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4S5Z4l2Jlpz1M98b;
 Thu, 12 Oct 2023 10:55:19 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 12 Oct 2023 10:57:52 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
References: <20230828063845.3142561-1-chengzhihao1@huawei.com>
Message-ID: <ee01780b-f5ef-26c8-f632-3bc56cd46b96@huawei.com>
Date: Thu, 12 Oct 2023 10:57:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230828063845.3142561-1-chengzhihao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
Cc: bagasdotme@gmail.com, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 00/12] ubi: fastmap: Fix a series of
 wear leveling problems
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

1NogMjAyMy84LzI4IDE0OjM4LCBaaGloYW8gQ2hlbmcg0LS1wDoKPiBUaGlzIHNlcmllcyBvZiBw
YXRjaGVzIGZpeCB0aHJlZSBwcm9ibGVtczoKPiAxLiBJbmNvbnNpc3RlbnQgZXJhc2UgY291bnRl
ciBmcm9tIHdsIGVudHJ5IGFuZCBkaXNrLCBmb3IgcGF0Y2hlcyAxfjQuCj4gMi4gU2FtZSBQRUIg
aXMgYWx3YXlzIHJlc3VlZCBmb3IgZmFzdG1hcCBkYXRhLCBmb3IgcGF0Y2hlcyA1fjkuCj4gMy4g
Rmlyc3QgNjQgUEVCcyBoYXZlIGxhcmdlIGVyYXNlIGNvdW50ZXIgdGhhbiBvdGhlcnMsIGZvciBw
YXRjaGVzIDEwfjEyLgo+IAo+IEJlc2lkZXMsIHBhdGNoZXMgNC81IGJyaW5nIGFuIGltcHJvdmVt
ZW50IG9mIHRoZSBVQkkgc2VydmljZSBsaWZlLgo+IAo+IFJlZ3Jlc3Npb24gdGVzdHMgYXJlIGlu
IFtMaW5rXS4KPiAKPiBMaW5rOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcu
Y2dpP2lkPTIxNzc4Ny4KPiAKPiB2MS0+djI6Cj4gICAgUGF0Y2ggNjogQ2hhbmdlIHdhaXQgY29u
ZGl0aW9uIGluIHdhaXRfZnJlZV9wZWJzX2Zvcl9wb29sKCksIHRoZXJlIGFyZQo+IAkgICB0d28g
c2l0dWF0aW9ucyB0aGF0IGNhdXNlIHdhaXRpbmcgaW5maW5hdGVseToKPiAJICAgMS4gX19lcmFz
ZV93b3JrZXIgc2NoZWR1bGVzIGl0c2VsZiBpZiAtRUJVU1kgcmV0dXJuZWQgd2hlbgo+IAkgICAg
ICBzaHV0dGluZyBkb3duIHN5c3RlbS4KPiAJICAgMi4gVGhlICdtaW5fZXhwZWN0X2ZyZWUnIGNh
bm5vdCBiZSBzYXRpc2ZpZWQgd2hlbiBiYWQgYmxvY2sKPiAJICAgICAgb2NjdXJzIGFuZCB1Ymkg
YmVjb21lcyBybyhUaGUgZXJhc2VkIFBFQiBzaG91bGQgYmUgdGhlCj4gICAgICAgICAgICAgICAg
bGFzdCBvbmUgb2YgJ21pbl9leHBlY3RfZnJlZScsIGJ1dCBpdCBiZWNvbWVzIGJhZCBpbgo+IAkg
ICAgICBfX2VyYXNlX3dvcmtlcikuCj4gICBQUzogQWZ0ZXIgcmUtdGVzdGluZywgdGhlIHRlc3Rp
bmcgcmVzdWx0cyBpbiBbTGlua10gaXMgbm90IGFmZmVjdGVkLgo+IAoKSGksIFJpY2hhcmQuIEkg
aG9wZSB5b3UgY2FuIHRha2Ugc29tZSB0aW1lKHdoZW4geW91IGhhdmUgZnJlZSB0aW1lKSB0byAK
aGF2ZSBhIGdsYW5jZSBvZiB0aGlzIHNlcmllcyBvZiBwYXRjaGVzLCBJIGhhdmUgbWFkZSBzb21l
IHRlc3RzIG9uIAp2aXJ0dWFsIG1hY2hpbmUgZm9yIDIrIG1vbnRocyhhbmQgaGFsZiBtb250aCBm
b3IgcGh5c2ljYWwgbmFuZCBmbGFzaCksIApzbyBmYXIgdWJpIHdvcmtzIGZpbmUgd2l0aCBwYXRj
aGVzIGFwcGxpZWQuCgo+IAo+IFpoaWhhbyBDaGVuZyAoMTIpOgo+ICAgIHViaTogZmFzdG1hcDog
Rml4IG1pc3NlZCBlYyB1cGRhdGluZyBhZnRlciBlcmFzaW5nIG9sZCBmYXN0bWFwIGRhdGEKPiAg
ICAgIGJsb2NrCj4gICAgdWJpOiBmYXN0bWFwOiBlcmFzZV9ibG9jazogR2V0IGVyYXNlIGNvdW50
ZXIgZnJvbSB3bF9lbnRyeSByYXRoZXIgdGhhbgo+ICAgICAgZmxhc2gKPiAgICB1Ymk6IGZhc3Rt
YXA6IEFsbG9jYXRlIG1lbW9yeSB3aXRoIEdGUF9OT0ZTIGluIHViaV91cGRhdGVfZmFzdG1hcAo+
ICAgIHViaTogUmVwbGFjZSBlcmFzZV9ibG9jaygpIHdpdGggc3luY19lcmFzZSgpCj4gICAgdWJp
OiBmYXN0bWFwOiBVc2UgZnJlZSBwZWJzIHJlc2VydmVkIGZvciBiYWQgYmxvY2sgaGFuZGxpbmcK
PiAgICB1Ymk6IGZhc3RtYXA6IFdhaXQgdW50aWwgdGhlcmUgYXJlIGVub3VnaCBmcmVlIFBFQnMg
YmVmb3JlIGZpbGxpbmcKPiAgICAgIHBvb2xzCj4gICAgdWJpOiBmYXN0bWFwOiBSZW1vdmUgdW5u
ZWVkZWQgYnJlYWsgY29uZGl0aW9uIHdoaWxlIGZpbGxpbmcgcG9vbHMKPiAgICB1Ymk6IGZhc3Rt
YXA6IG1heV9yZXNlcnZlX2Zvcl9mbTogRG9uJ3QgcmVzZXJ2ZSBQRUIgaWYgZm1fYW5jaG9yCj4g
ICAgICBleGlzdHMKPiAgICB1Ymk6IGZhc3RtYXA6IEdldCB3bCBQRUIgZXZlbiBlYyBiZXlvbmRz
IHRoZSAnbWF4JyBpZiBmcmVlIFBFQnMgYXJlCj4gICAgICBydW4gb3V0Cj4gICAgdWJpOiBmYXN0
bWFwOiBGaXggbGFwc2VkIHdlYXIgbGV2ZWxpbmcgZm9yIGZpcnN0IDY0IFBFQnMKPiAgICB1Ymk6
IGZhc3RtYXA6IEFkZCBtb2R1bGUgcGFyYW1ldGVyIHRvIGNvbnRyb2wgcmVzZXJ2aW5nIGZpbGxp
bmcgcG9vbAo+ICAgICAgUEVCcwo+ICAgIHViaTogZmFzdG1hcDogQWRkIGNvbnRyb2wgaW4gJ1VC
SV9JT0NBVFQnIGlvY3RsIHRvIHJlc2VydmUgUEVCcyBmb3IKPiAgICAgIGZpbGxpbmcgcG9vbHMK
PiAKPiAgIGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jICAgICAgfCAgMjUgKysrKysrKy0KPiAgIGRy
aXZlcnMvbXRkL3ViaS9jZGV2LmMgICAgICAgfCAgIDMgKy0KPiAgIGRyaXZlcnMvbXRkL3ViaS9l
YmEuYyAgICAgICAgfCAgIDMgLQo+ICAgZHJpdmVycy9tdGQvdWJpL2Zhc3RtYXAtd2wuYyB8IDEx
MiArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAgZHJpdmVycy9tdGQvdWJp
L2Zhc3RtYXAuYyAgICB8ICA2NiArKystLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvbXRk
L3ViaS91YmkuaCAgICAgICAgfCAgMTAgKysrLQo+ICAgZHJpdmVycy9tdGQvdWJpL3dsLmMgICAg
ICAgICB8ICA0OCArKysrKysrKystLS0tLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS93bC5oICAgICAg
ICAgfCAgIDYgKy0KPiAgIGluY2x1ZGUvdWFwaS9tdGQvdWJpLXVzZXIuaCAgfCAgIDQgKy0KPiAg
IDkgZmlsZXMgY2hhbmdlZCwgMTY0IGluc2VydGlvbnMoKyksIDExMyBkZWxldGlvbnMoLSkKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
