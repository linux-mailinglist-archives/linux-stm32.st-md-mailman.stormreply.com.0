Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BF996FF4B
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Sep 2024 04:55:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D63DC78013;
	Sat,  7 Sep 2024 02:55:48 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76ECDC6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Sep 2024 02:55:41 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X0yPv1pjQz1j80V;
 Sat,  7 Sep 2024 10:55:15 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id CDF491400CF;
 Sat,  7 Sep 2024 10:55:38 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemd500012.china.huawei.com (7.221.188.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 7 Sep 2024 10:55:37 +0800
Message-ID: <852686ba-7578-4a1c-ae65-df7162e4e8bc@huawei.com>
Date: Sat, 7 Sep 2024 10:55:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <florian.fainelli@broadcom.com>, 
 <andrew@lunn.ch>, <olteanv@gmail.com>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
 <heiko@sntech.de>, <yisen.zhuang@huawei.com>, <salil.mehta@huawei.com>,
 <hauke@hauke-m.de>, <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
 <mcoquelin.stm32@gmail.com>, <wellslutw@gmail.com>,
 <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>,
 <ajay.kathat@microchip.com>, <claudiu.beznea@tuxon.dev>, <kvalo@kernel.org>,
 <u.kleine-koenig@pengutronix.de>, <jacky_chou@aspeedtech.com>
References: <20240831021334.1907921-1-lizetao1@huawei.com>
 <6f3f79f2-5755-4286-98f6-9950e7e994c8@quicinc.com>
From: Li Zetao <lizetao1@huawei.com>
In-Reply-To: <6f3f79f2-5755-4286-98f6-9950e7e994c8@quicinc.com>
X-Originating-IP: [10.67.111.176]
X-ClientProxiedBy: dggpeml500004.china.huawei.com (7.185.36.140) To
 kwepemd500012.china.huawei.com (7.221.188.25)
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 00/12] net: Convert using
 devm_clk_get_enabled()/devm_clk_get_optional_enabled()
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

SGksCgrlnKggMjAyNC85LzcgNzoxNywgSmVmZiBKb2huc29uIOWGmemBkzoKPiBPbiA4LzMwLzIw
MjQgNzoxMyBQTSwgTGkgWmV0YW8gd3JvdGU6Cj4+IFRoZXJlIGFyZSBtYW55IGV4YW1wbGVzWzFd
WzJdIG9mIGNsayByZXNvdXJjZSBsZWFrYWdlIGluIExUUy4gVGhlCj4+IHJlYXNvbiBpcyB0aGF0
IGRldmVsb3BlcnMgbmVlZCB0byBtYWludGFpbiB0aGUgYWxsb2NhdGlvbiBhbmQgcmVsZWFzZQo+
PiBvZiBjbGsgcmVzb3VyY2VzIHRoZW1zZWx2ZXMsIGJ1dCB0aGlzIHdpbGwgaW5jcmVhc2UgdGhl
IGJ1cmRlbiBvbgo+PiBkZXZlbG9wZXJzLiBVc2luZyB0aGUgQVBJIHJlbGF0ZWQgdG8gZGV2bV9j
bGtfZ2V0XypfZW5hYmxlIGVuc3VyZXMKPj4gdGhhdCB0aGUgbGlmZSBjeWNsZSBvZiBjbGsgaXMg
Y29uc2lzdGVudCB3aXRoIHRoYXQgb2YgdGhlIGRldmljZSwKPj4gcmVkdWNpbmcgdGhlIHJpc2sg
b2YgdW5yZWxlYXNlZCByZXNvdXJjZXMgbGlrZSBjbGsuCj4+Cj4+IFNldmVyYWwgb3RoZXIgZGV2
ZWxvcGVycyBhcmUgYWxzbyB3b3JraW5nIG9uIGNvbnZlcnRpbmcgdG8gbW9yZQo+PiBzZWN1cmUg
aW50ZXJmYWNlcywgYW5kIHRoaXMgcGF0Y2ggc2V0IGlzIGluIHByaW5jaXBsZSB0aGUgc2FtZSBh
cwo+PiB0aGVpcnMuCj4gCj4gLi4uCj4gCj4+ICAgZHJpdmVycy9uZXQvZHNhL2JjbV9zZjIuYyAg
ICAgICAgICAgICAgICAgICAgIHwgMjggKystLS0tCj4+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQv
YWxsd2lubmVyL3N1bjRpLWVtYWMuYyAgIHwgMTMgKy0tCj4+ICAgZHJpdmVycy9uZXQvZXRoZXJu
ZXQvYXJjL2VtYWNfcm9ja2NoaXAuYyAgICAgIHwgMzQgKystLS0tLQo+PiAgIGRyaXZlcnMvbmV0
L2V0aGVybmV0L2V0aG9jLmMgICAgICAgICAgICAgICAgICB8IDE4ICsrLS0KPj4gICBkcml2ZXJz
L25ldC9ldGhlcm5ldC9mYXJhZGF5L2Z0Z21hYzEwMC5jICAgICAgfCAyNyArKy0tLQo+PiAgIGRy
aXZlcnMvbmV0L2V0aGVybmV0L2hpc2lsaWNvbi9oaXNpX2ZlbWFjLmMgICB8IDE3ICstLS0KPj4g
ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9sYW50aXFfeHJ4MjAwLmMgICAgICAgICAgfCAxNyArLS0t
Cj4+ICAgLi4uL3N0bWljcm8vc3RtbWFjL2R3bWFjLWR3Yy1xb3MtZXRoLmMgICAgICAgIHwgOTgg
KysrKy0tLS0tLS0tLS0tLS0tLQo+PiAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N1bnBsdXMvc3Bs
MnN3X2RyaXZlci5jICB8IDE4ICstLS0KPj4gICAuLi4vbmV0L2V0aGVybmV0L3hpbGlueC94aWxp
bnhfYXhpZW5ldF9tYWluLmMgfCAxNSArLS0KPj4gICAuLi4vbmV0L3dpcmVsZXNzL21pY3JvY2hp
cC93aWxjMTAwMC9zZGlvLmMgICAgfCAxMCArLQo+PiAgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL21p
Y3JvY2hpcC93aWxjMTAwMC9zcGkuYyB8ICA1ICstCj4gCj4gbm90ZSB0aGUgd2lmaSBkcml2ZXIg
Y2hhbmdlcyBnbyB0aHJvdWdoIHRoZSB3aXJlbGVzcyB0cmVlIGFuZCBub3QgdGhlIG5ldCB0cmVl
Cj4gc28gdGhvc2Ugc2hvdWxkIGJlIHNwbGl0IG91dCBzZXBhcmF0ZWx5CgpJIGhhdmUgc2VwYXJh
dGVkIHRoZSB3aWZpIHJlbGF0ZWQgcGF0Y2hlcyBhbmQgc2VudCB0aGVtIHRvIHRoZSBjb21tdW5p
dHk6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDkwMzExMDIwNS40MTI3NzA2LTEt
bGl6ZXRhbzFAaHVhd2VpLmNvbS8KPiAKPiAKVGhhbmtzLApMaSBaZXRhby4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
