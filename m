Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1800D96FF82
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Sep 2024 05:03:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CACCEC78018;
	Sat,  7 Sep 2024 03:03:46 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACEC2C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Sep 2024 03:03:39 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X0yZN1N4LzyRGp;
 Sat,  7 Sep 2024 11:02:36 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 622D714035E;
 Sat,  7 Sep 2024 11:03:37 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemd500012.china.huawei.com (7.221.188.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 7 Sep 2024 11:03:36 +0800
Message-ID: <33b03d5a-ec1e-4aa1-be17-3e67707ad6d2@huawei.com>
Date: Sat, 7 Sep 2024 11:03:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <mchehab@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <heiko@sntech.de>,
 <yisen.zhuang@huawei.com>, <salil.mehta@huawei.com>, <hauke@hauke-m.de>,
 <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
 <mcoquelin.stm32@gmail.com>, <wellslutw@gmail.com>,
 <radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>, <hdegoede@redhat.com>, 
 <ilpo.jarvinen@linux.intel.com>, <ruanjinjie@huawei.com>,
 <hverkuil-cisco@xs4all.nl>, <u.kleine-koenig@pengutronix.de>,
 <jacky_chou@aspeedtech.com>, <jacob.e.keller@intel.com>
References: <20240907031009.3591057-1-lizetao1@huawei.com>
From: Li Zetao <lizetao1@huawei.com>
In-Reply-To: <20240907031009.3591057-1-lizetao1@huawei.com>
X-Originating-IP: [10.67.111.176]
X-ClientProxiedBy: dggpeml500004.china.huawei.com (7.185.36.140) To
 kwepemd500012.china.huawei.com (7.221.188.25)
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/10] net: Convert using
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

U29ycnkgdG8gYm90aGVyIHlvdSwgSSBtYWRlIGEgc21hbGwgbWlzdGFrZSB3aGVuIEkgc2VudCB0
aGUgcGF0Y2guIApQbGVhc2UgaWdub3JlIHRoZSBwYXRjaHNldC4KCuWcqCAyMDI0LzkvNyAxMTow
OSwgTGkgWmV0YW8g5YaZ6YGTOgo+IHYxIC0+IHYyOgo+ICAgIDEpIFBhdGNoIDUgb3B0aW1pemVz
IHRoZSBjaGVjayBhbmQgYWRkcyBjb21taXQgaW5mb3JtYXRpb24gZm9yIGVhc2llcgo+ICAgIGlu
c3BlY3Rpb24uCj4gICAgMikgSXQgaXMgbm8gbG9uZ2VyIG5lY2Vzc2FyeSB0byB1c2UgY2xrLCBz
byBkZWxldGUgdGhlIGNsayBtZW1iZXIgb2YKPiAgICB0aGUgc3BsMnN3X2NvbW1vbiBzdHJ1Y3R1
cmUuCj4gICAgMykgUmVtb3ZlIHBhdGNoZXMgMTEgYW5kIDEyLCB0aGV5IHNob3VsZCBiZSBzZW50
IHRvIHdpcmVsZXNzLW5leHQKPiAgICBpbmRpdmlkdWFsbHkKPiAKPiB2MToKPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNDA4MzEwMjEzMzQuMTkwNzkyMS0xLWxpemV0YW8xQGh1YXdl
aS5jb20vCj4gCj4gVGhlcmUgYXJlIG1hbnkgZXhhbXBsZXNbMV1bMl0gb2YgY2xrIHJlc291cmNl
IGxlYWthZ2UgaW4gTFRTLiBUaGUKPiByZWFzb24gaXMgdGhhdCBkZXZlbG9wZXJzIG5lZWQgdG8g
bWFpbnRhaW4gdGhlIGFsbG9jYXRpb24gYW5kIHJlbGVhc2UKPiBvZiBjbGsgcmVzb3VyY2VzIHRo
ZW1zZWx2ZXMsIGJ1dCB0aGlzIHdpbGwgaW5jcmVhc2UgdGhlIGJ1cmRlbiBvbgo+IGRldmVsb3Bl
cnMuIFVzaW5nIHRoZSBBUEkgcmVsYXRlZCB0byBkZXZtX2Nsa19nZXRfKl9lbmFibGUgZW5zdXJl
cwo+IHRoYXQgdGhlIGxpZmUgY3ljbGUgb2YgY2xrIGlzIGNvbnNpc3RlbnQgd2l0aCB0aGF0IG9m
IHRoZSBkZXZpY2UsCj4gcmVkdWNpbmcgdGhlIHJpc2sgb2YgdW5yZWxlYXNlZCByZXNvdXJjZXMg
bGlrZSBjbGsuCj4gCj4gU2V2ZXJhbCBvdGhlciBkZXZlbG9wZXJzIGFyZSBhbHNvIHdvcmtpbmcg
b24gY29udmVydGluZyB0byBtb3JlCj4gc2VjdXJlIGludGVyZmFjZXMsIGFuZCB0aGlzIHBhdGNo
IHNldCBpcyBpbiBwcmluY2lwbGUgdGhlIHNhbWUgYXMKPiB0aGVpcnMuCj4gCj4gWzFdOgo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDgxMjE2MDEyOC4zMzgwNDExOTFAbGludXhm
b3VuZGF0aW9uLm9yZy8KPiBbMl06Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQw
ODEyMTYwMTM1Ljk5MjQ1MTA2NUBsaW51eGZvdW5kYXRpb24ub3JnLwo+IAo+IExpIFpldGFvICgx
MCk6Cj4gICAgbmV0OiBkc2E6IGJjbV9zZjI6IENvbnZlcnQgdXNpbmcgZGV2bV9jbGtfZ2V0X29w
dGlvbmFsX2VuYWJsZWQoKSBpbgo+ICAgICAgYmNtX3NmMl9zd19wcm9iZSgpCj4gICAgbmV0OiBl
dGhlcm5ldDogQ29udmVydCB1c2luZyBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIGluIGVtYWNfcHJv
YmUoKQo+ICAgIG5ldDogZXRoZXJuZXQ6IGFyYzogQ29udmVydCB1c2luZyBkZXZtX2Nsa19nZXRf
ZW5hYmxlZCgpIGluCj4gICAgICBlbWFjX3Byb2JlKCkKPiAgICBuZXQ6IGV0aGVybmV0OiBldGhv
YzogQ29udmVydCB1c2luZyBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIGluCj4gICAgICBldGhvY19w
cm9iZSgpCj4gICAgbmV0OiBmdGdtYWMxMDA6IENvbnZlcnQgdXNpbmcgZGV2bV9jbGtfZ2V0X2Vu
YWJsZWQoKSBpbgo+ICAgICAgZnRnbWFjMTAwX3NldHVwX2NsaygpCj4gICAgbmV0OiBldGhlcm5l
dDogaGlzaWxpY29uOiBDb252ZXJ0IHVzaW5nIGRldm1fY2xrX2dldF9lbmFibGVkKCkgaW4KPiAg
ICAgIGhpc2lfZmVtYWNfZHJ2X3Byb2JlKCkKPiAgICBuZXQ6IGxhbnRpcV94cngyMDA6IENvbnZl
cnQgdXNpbmcgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSBpbgo+ICAgICAgeHJ4MjAwX3Byb2JlKCkK
PiAgICBuZXQ6IHN0bW1hYzogZHdtYWMtZHdjLXFvcy1ldGg6IENvbnZlcnQgdXNpbmcgZGV2bV9j
bGtfZ2V0X2VuYWJsZWQoKQo+ICAgICAgaW4gZHdjX3Fvc19wcm9iZSgpCj4gICAgbmV0OiBldGhl
cm5ldDogc3VucGx1czogQ29udmVydCB1c2luZyBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIGluCj4g
ICAgICBzcGwyc3dfcHJvYmUoKQo+ICAgIG5ldDogeGlsaW54OiBheGllbmV0OiBDb252ZXJ0IHVz
aW5nIGRldm1fY2xrX2dldF9vcHRpb25hbF9lbmFibGVkKCkgaW4KPiAgICAgIGF4aWVuZXRfcHJv
YmUoKQo+IAo+ICAgZHJpdmVycy9uZXQvZHNhL2JjbV9zZjIuYyAgICAgICAgICAgICAgICAgICAg
IHwgMjggKystLS0tCj4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC9hbGx3aW5uZXIvc3VuNGktZW1h
Yy5jICAgfCAxMyArLS0KPiAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L2FyYy9lbWFjX3JvY2tjaGlw
LmMgICAgICB8IDM0ICsrLS0tLS0KPiAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L2V0aG9jLmMgICAg
ICAgICAgICAgICAgICB8IDE4ICsrLS0KPiAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L2ZhcmFkYXkv
ZnRnbWFjMTAwLmMgICAgICB8IDI2ICstLS0tCj4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC9oaXNp
bGljb24vaGlzaV9mZW1hYy5jICAgfCAxNyArLS0tCj4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC9s
YW50aXFfeHJ4MjAwLmMgICAgICAgICAgfCAxNyArLS0tCj4gICAuLi4vc3RtaWNyby9zdG1tYWMv
ZHdtYWMtZHdjLXFvcy1ldGguYyAgICAgICAgfCA5OCArKysrLS0tLS0tLS0tLS0tLS0tCj4gICBk
cml2ZXJzL25ldC9ldGhlcm5ldC9zdW5wbHVzL3NwbDJzd19kZWZpbmUuaCAgfCAgMSAtCj4gICBk
cml2ZXJzL25ldC9ldGhlcm5ldC9zdW5wbHVzL3NwbDJzd19kcml2ZXIuYyAgfCAyNSArKy0tLQo+
ICAgLi4uL25ldC9ldGhlcm5ldC94aWxpbngveGlsaW54X2F4aWVuZXRfbWFpbi5jIHwgMTUgKy0t
Cj4gICAxMSBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCAyMzAgZGVsZXRpb25zKC0p
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
