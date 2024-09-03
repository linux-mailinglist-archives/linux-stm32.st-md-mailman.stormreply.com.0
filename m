Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFB0969ACD
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Sep 2024 12:53:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EC26C78011;
	Tue,  3 Sep 2024 10:53:00 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82839C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2024 10:52:52 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Wyj9k0Zx5z145xm;
 Tue,  3 Sep 2024 18:51:54 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 262C31800FE;
 Tue,  3 Sep 2024 18:52:50 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemd500012.china.huawei.com (7.221.188.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 3 Sep 2024 18:52:49 +0800
Message-ID: <021d4b46-a559-4047-a6ca-98e30fd3e6b3@huawei.com>
Date: Tue, 3 Sep 2024 18:52:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kalle Valo <kvalo@kernel.org>
References: <20240831021334.1907921-1-lizetao1@huawei.com>
 <20240831021334.1907921-12-lizetao1@huawei.com> <87a5gqko2q.fsf@kernel.org>
From: Li Zetao <lizetao1@huawei.com>
In-Reply-To: <87a5gqko2q.fsf@kernel.org>
X-Originating-IP: [10.67.111.176]
X-ClientProxiedBy: dggpeml500005.china.huawei.com (7.185.36.59) To
 kwepemd500012.china.huawei.com (7.221.188.25)
Cc: andrew@lunn.ch, heiko@sntech.de, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, radhey.shyam.pandey@amd.com,
 ajay.kathat@microchip.com, florian.fainelli@broadcom.com, samuel@sholland.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, kuba@kernel.org,
 pabeni@redhat.com, yisen.zhuang@huawei.com, linux-sunxi@lists.linux.dev,
 jacky_chou@aspeedtech.com, hauke@hauke-m.de, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, salil.mehta@huawei.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 claudiu.beznea@tuxon.dev, mcoquelin.stm32@gmail.com, wellslutw@gmail.com,
 olteanv@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 11/12] wifi: wilc1000: Convert
 using devm_clk_get_optional_enabled() in wilc_sdio_probe()
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

SGksCgrlnKggMjAyNC85LzMgMDozOCwgS2FsbGUgVmFsbyDlhpnpgZM6Cj4gTGkgWmV0YW8gPGxp
emV0YW8xQGh1YXdlaS5jb20+IHdyaXRlczoKPiAKPj4gVXNlIGRldm1fY2xrX2dldF9vcHRpb25h
bF9lbmFibGVkKCkgaW5zdGVhZCBvZiBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoKSArCj4+IGNsa19w
cmVwYXJlX2VuYWJsZSgpLCB3aGljaCBjYW4gbWFrZSB0aGUgY2xrIGNvbnNpc3RlbnQgd2l0aCB0
aGUgZGV2aWNlCj4+IGxpZmUgY3ljbGUgYW5kIHJlZHVjZSB0aGUgcmlzayBvZiB1bnJlbGVhc2Vk
IGNsayByZXNvdXJjZXMuIFNpbmNlIHRoZQo+PiBkZXZpY2UgZnJhbWV3b3JrIGhhcyBhdXRvbWF0
aWNhbGx5IHJlbGVhc2VkIHRoZSBjbGsgcmVzb3VyY2UsIHRoZXJlIGlzCj4+IG5vIG5lZWQgdG8g
ZXhlY3V0ZSBjbGtfZGlzYWJsZV91bnByZXBhcmUoY2xrKSBvbiB0aGUgZXJyb3IgcGF0aCwgZHJv
cAo+PiB0aGUgY2xrX2Rpc2FibGVfdW5wcmVwYXJlIGxhYmVsLCBhbmQgdGhlIG9yaWdpbmFsIGVy
cm9yIHByb2Nlc3MgY2FuIGNoYW5nZQo+PiB0byBkaXNwb3NlX2lycS4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogTGkgWmV0YW8gPGxpemV0YW8xQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMv
bmV0L3dpcmVsZXNzL21pY3JvY2hpcC93aWxjMTAwMC9zZGlvLmMgfCAxMCArKystLS0tLS0tCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiB3
aWZpIHBhdGNoZXMgKHBhdGNoZXMgMTEgYW5kIDEyKSBnbyB2aWEgd2lyZWxlc3MtbmV4dCwgcGxl
YXNlIHN1Ym1pdAo+IHRob3NlIHNlcGFyYXRlbHkuCk9rLCBJIHdpbGwgcmVzZW5kIHRob3NlIHNl
cGFyYXRlbHkuCj4gCgpUaGFua3MsCkxpIFpldGFvLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
