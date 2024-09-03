Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 942FC96916B
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Sep 2024 04:28:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37DEBC78011;
	Tue,  3 Sep 2024 02:28:04 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31E71C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2024 02:27:57 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WyTxl6gknzgYtl;
 Tue,  3 Sep 2024 10:25:47 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 7E3E21800FE;
 Tue,  3 Sep 2024 10:27:54 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemd500012.china.huawei.com (7.221.188.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 3 Sep 2024 10:27:53 +0800
Message-ID: <73e02ee9-6631-4473-8219-d75253aaf0fc@huawei.com>
Date: Tue, 3 Sep 2024 10:27:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "florian.fainelli@broadcom.com" <florian.fainelli@broadcom.com>,
 "andrew@lunn.ch" <andrew@lunn.ch>, "olteanv@gmail.com" <olteanv@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
 <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>, "wens@csie.org" <wens@csie.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "samuel@sholland.org"
 <samuel@sholland.org>, "heiko@sntech.de" <heiko@sntech.de>,
 "yisen.zhuang@huawei.com" <yisen.zhuang@huawei.com>, "salil.mehta@huawei.com"
 <salil.mehta@huawei.com>, "hauke@hauke-m.de" <hauke@hauke-m.de>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, "wellslutw@gmail.com" <wellslutw@gmail.com>,
 "Simek, Michal" <michal.simek@amd.com>, "ajay.kathat@microchip.com"
 <ajay.kathat@microchip.com>, "claudiu.beznea@tuxon.dev"
 <claudiu.beznea@tuxon.dev>, "kvalo@kernel.org" <kvalo@kernel.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "jacky_chou@aspeedtech.com" <jacky_chou@aspeedtech.com>
References: <20240831021334.1907921-1-lizetao1@huawei.com>
 <20240831021334.1907921-11-lizetao1@huawei.com>
 <MN0PR12MB595396074210F8390ACE409DB7912@MN0PR12MB5953.namprd12.prod.outlook.com>
From: Li Zetao <lizetao1@huawei.com>
In-Reply-To: <MN0PR12MB595396074210F8390ACE409DB7912@MN0PR12MB5953.namprd12.prod.outlook.com>
X-Originating-IP: [10.67.111.176]
X-ClientProxiedBy: dggpeml100004.china.huawei.com (7.185.36.247) To
 kwepemd500012.china.huawei.com (7.221.188.25)
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 10/12] net: xilinx: axienet:
 Convert using devm_clk_get_optional_enabled() in axienet_probe()
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

CgrlnKggMjAyNC85LzEgMjA6MjgsIFBhbmRleSwgUmFkaGV5IFNoeWFtIOWGmemBkzoKPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogTGkgWmV0YW8gPGxpemV0YW8xQGh1YXdl
aS5jb20+Cj4+IFNlbnQ6IFNhdHVyZGF5LCBBdWd1c3QgMzEsIDIwMjQgNzo0NCBBTQo+PiBUbzog
Zmxvcmlhbi5mYWluZWxsaUBicm9hZGNvbS5jb207IGFuZHJld0BsdW5uLmNoOyBvbHRlYW52QGdt
YWlsLmNvbTsKPj4gZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsgZWR1bWF6ZXRAZ29vZ2xlLmNvbTsga3Vi
YUBrZXJuZWwub3JnOwo+PiBwYWJlbmlAcmVkaGF0LmNvbTsgd2Vuc0Bjc2llLm9yZzsgamVybmVq
LnNrcmFiZWNAZ21haWwuY29tOwo+PiBzYW11ZWxAc2hvbGxhbmQub3JnOyBoZWlrb0BzbnRlY2gu
ZGU7IHlpc2VuLnpodWFuZ0BodWF3ZWkuY29tOwo+PiBzYWxpbC5tZWh0YUBodWF3ZWkuY29tOyBo
YXVrZUBoYXVrZS1tLmRlOwo+PiBhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tOyBqb2FicmV1
QHN5bm9wc3lzLmNvbTsKPj4gbWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbTsgd2VsbHNsdXR3QGdt
YWlsLmNvbTsgUGFuZGV5LCBSYWRoZXkKPj4gU2h5YW0gPHJhZGhleS5zaHlhbS5wYW5kZXlAYW1k
LmNvbT47IFNpbWVrLCBNaWNoYWwKPj4gPG1pY2hhbC5zaW1la0BhbWQuY29tPjsgYWpheS5rYXRo
YXRAbWljcm9jaGlwLmNvbTsKPj4gY2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2OyBrdmFsb0BrZXJu
ZWwub3JnOyBsaXpldGFvMUBodWF3ZWkuY29tOwo+PiB1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGU7IGphY2t5X2Nob3VAYXNwZWVkdGVjaC5jb20KPj4gQ2M6IG5ldGRldkB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtCj4+IHN1
bnhpQGxpc3RzLmxpbnV4LmRldjsgbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZzsg
bGludXgtc3RtMzJAc3QtCj4+IG1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb207IGxpbnV4LXdpcmVs
ZXNzQHZnZXIua2VybmVsLm9yZwo+PiBTdWJqZWN0OiBbUEFUQ0ggbmV0LW5leHQgMTAvMTJdIG5l
dDogeGlsaW54OiBheGllbmV0OiBDb252ZXJ0IHVzaW5nCj4+IGRldm1fY2xrX2dldF9vcHRpb25h
bF9lbmFibGVkKCkgaW4gYXhpZW5ldF9wcm9iZSgpCj4+Cj4+IFVzZSBkZXZtX2Nsa19nZXRfb3B0
aW9uYWxfZW5hYmxlZCgpIGluc3RlYWQgb2YgZGV2bV9jbGtfZ2V0X29wdGlvbmFsKCkgKwo+PiBj
bGtfcHJlcGFyZV9lbmFibGUoKSwgd2hpY2ggY2FuIG1ha2UgdGhlIGNsayBjb25zaXN0ZW50IHdp
dGggdGhlIGRldmljZSBsaWZlCj4+IGN5Y2xlIGFuZCByZWR1Y2UgdGhlIHJpc2sgb2YgdW5yZWxl
YXNlZCBjbGsgcmVzb3VyY2VzLiBTaW5jZSB0aGUgZGV2aWNlCj4+IGZyYW1ld29yayBoYXMgYXV0
b21hdGljYWxseSByZWxlYXNlZCB0aGUgY2xrIHJlc291cmNlLCB0aGVyZSBpcyBubyBuZWVkIHRv
Cj4+IGV4ZWN1dGUgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGNsaykgb24gdGhlIGVycm9yIHBhdGgu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IExpIFpldGFvIDxsaXpldGFvMUBodWF3ZWkuY29tPgo+IAo+
IFJldmlld2VkLWJ5OiBSYWRoZXkgU2h5YW0gUGFuZGV5IDxyYWRoZXkuc2h5YW0ucGFuZGV5QGFt
ZC5jb20+Cj4gVGhhbmtzIQo+IAo+PiAtLS0KPj4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC94aWxp
bngveGlsaW54X2F4aWVuZXRfbWFpbi5jIHwgMTUgKysrKy0tLS0tLS0tLS0tCj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC94aWxpbngveGlsaW54X2F4aWVuZXRfbWFpbi5jCj4+
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQveGlsaW54L3hpbGlueF9heGllbmV0X21haW4uYwo+PiBp
bmRleCBmZTZhMGUyZTQ2M2YuLjQ4YjQxZTk1YWE3NCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9u
ZXQvZXRoZXJuZXQveGlsaW54L3hpbGlueF9heGllbmV0X21haW4uYwo+PiArKysgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC94aWxpbngveGlsaW54X2F4aWVuZXRfbWFpbi5jCj4+IEBAIC0yNTg0LDIy
ICsyNTg0LDE3IEBAIHN0YXRpYyBpbnQgYXhpZW5ldF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlCj4+ICpwZGV2KQo+PiAgIAlzZXFjb3VudF9tdXRleF9pbml0KCZscC0+aHdfc3RhdHNfc2Vx
Y291bnQsICZscC0+c3RhdHNfbG9jayk7Cj4+ICAgCUlOSVRfREVGRVJSQUJMRV9XT1JLKCZscC0+
c3RhdHNfd29yaywgYXhpZW5ldF9yZWZyZXNoX3N0YXRzKTsKPj4KPj4gLQlscC0+YXhpX2NsayA9
IGRldm1fY2xrX2dldF9vcHRpb25hbCgmcGRldi0+ZGV2LCAic19heGlfbGl0ZV9jbGsiKTsKPj4g
LQlpZiAoIWxwLT5heGlfY2xrKSB7Cj4+ICsJbHAtPmF4aV9jbGsgPSBkZXZtX2Nsa19nZXRfb3B0
aW9uYWxfZW5hYmxlZCgmcGRldi0+ZGV2LAo+PiAic19heGlfbGl0ZV9jbGsiKTsKPj4gKwlpZiAo
IWxwLT5heGlfY2xrKQo+PiAgIAkJLyogRm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHksIGlmIG5h
bWVkIEFYSSBjbG9jayBpcyBub3QKPj4gcHJlc2VudCwKPj4gICAJCSAqIHRyZWF0IHRoZSBmaXJz
dCBjbG9jayBzcGVjaWZpZWQgYXMgdGhlIEFYSSBjbG9jay4KPj4gICAJCSAqLwo+PiAtCQlscC0+
YXhpX2NsayA9IGRldm1fY2xrX2dldF9vcHRpb25hbCgmcGRldi0+ZGV2LCBOVUxMKTsKPj4gLQl9
Cj4+ICsJCWxwLT5heGlfY2xrID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsX2VuYWJsZWQoJnBkZXYt
PmRldiwKPj4gTlVMTCk7Cj4+ICsKPj4gICAJaWYgKElTX0VSUihscC0+YXhpX2NsaykpIHsKPj4g
ICAJCXJldCA9IFBUUl9FUlIobHAtPmF4aV9jbGspOwo+PiAgIAkJZ290byBmcmVlX25ldGRldjsK
Pj4gICAJfQo+PiAtCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShscC0+YXhpX2Nsayk7Cj4+IC0J
aWYgKHJldCkgewo+PiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJVbmFibGUgdG8gZW5hYmxlIEFY
SSBjbG9jazogJWRcbiIsCj4+IHJldCk7Cj4+IC0JCWdvdG8gZnJlZV9uZXRkZXY7Cj4+IC0JfQo+
Pgo+PiAgIAlscC0+bWlzY19jbGtzWzBdLmlkID0gImF4aXNfY2xrIjsKPj4gICAJbHAtPm1pc2Nf
Y2xrc1sxXS5pZCA9ICJyZWZfY2xrIjsKPj4gQEAgLTI5MTUsNyArMjkxMCw2IEBAIHN0YXRpYyBp
bnQgYXhpZW5ldF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlCj4+ICpwZGV2KQo+PiAgIAkJ
YXhpZW5ldF9tZGlvX3RlYXJkb3duKGxwKTsKPj4gICBjbGVhbnVwX2NsazoKPiAKPiBJIGFsc28g
ZmluZCB0aGF0IHRoZXJlIGlzIGdvdG8gdG8gY2xlYW51cF9jbGsgd2hlbiBkZXZtX2Nsa19idWxr
X2dldF9vcHRpb25hbC8KPiBjbGtfYnVsa19wcmVwYXJlX2VuYWJsZSBmYWlscyB3aGljaCBpcyBu
b3QgY29ycmVjdCBidXQgYXMgaXQgaXMgZXhpc3RpbmcgYnVnIGl0Cj4gY2FuIGdvIGEgc2VwYXJh
dGUgcGF0Y2guClRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLCBJIGNvbnNpZGVyZWQgc29sdmluZyB0
aGlzIHByb2JsZW0gYnkgdXNpbmcgCmRldm1fYWRkX2FjdGlvbl9vcl9yZXNldAoKVGhhbmtzLApM
aSBaZXRhby4KPiAKPj4gICAJY2xrX2J1bGtfZGlzYWJsZV91bnByZXBhcmUoWEFFX05VTV9NSVND
X0NMT0NLUywgbHAtCj4+PiBtaXNjX2Nsa3MpOwo+PiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZShs
cC0+YXhpX2Nsayk7Cj4+Cj4+ICAgZnJlZV9uZXRkZXY6Cj4+ICAgCWZyZWVfbmV0ZGV2KG5kZXYp
Owo+PiBAQCAtMjkzOSw3ICsyOTMzLDYgQEAgc3RhdGljIHZvaWQgYXhpZW5ldF9yZW1vdmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZQo+PiAqcGRldikKPj4gICAJYXhpZW5ldF9tZGlvX3RlYXJkb3du
KGxwKTsKPj4KPj4gICAJY2xrX2J1bGtfZGlzYWJsZV91bnByZXBhcmUoWEFFX05VTV9NSVNDX0NM
T0NLUywgbHAtCj4+PiBtaXNjX2Nsa3MpOwo+PiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZShscC0+
YXhpX2Nsayk7Cj4+Cj4+ICAgCWZyZWVfbmV0ZGV2KG5kZXYpOwo+PiAgIH0KPj4gLS0KPj4gMi4z
NC4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
