Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE4196ADD9
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 03:27:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A6ADC78013;
	Wed,  4 Sep 2024 01:27:18 +0000 (UTC)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B05FEC78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 01:27:10 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wz4Tv11ddz69LX;
 Wed,  4 Sep 2024 09:22:11 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 35A5D140158;
 Wed,  4 Sep 2024 09:27:08 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemd500012.china.huawei.com (7.221.188.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 4 Sep 2024 09:27:07 +0800
Message-ID: <b4f6e9ae-bda8-4496-82a7-de70004e2f29@huawei.com>
Date: Wed, 4 Sep 2024 09:27:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20240831021334.1907921-1-lizetao1@huawei.com>
 <20240831021334.1907921-10-lizetao1@huawei.com>
 <20240903151649.1b466145@kernel.org>
From: Li Zetao <lizetao1@huawei.com>
In-Reply-To: <20240903151649.1b466145@kernel.org>
X-Originating-IP: [10.67.111.176]
X-ClientProxiedBy: dggpeml100007.china.huawei.com (7.185.36.28) To
 kwepemd500012.china.huawei.com (7.221.188.25)
Cc: andrew@lunn.ch, heiko@sntech.de, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, radhey.shyam.pandey@amd.com,
 ajay.kathat@microchip.com, florian.fainelli@broadcom.com, samuel@sholland.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org, wens@csie.org,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, pabeni@redhat.com,
 yisen.zhuang@huawei.com, linux-sunxi@lists.linux.dev,
 jacky_chou@aspeedtech.com, hauke@hauke-m.de, kvalo@kernel.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 salil.mehta@huawei.com, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 claudiu.beznea@tuxon.dev, mcoquelin.stm32@gmail.com, wellslutw@gmail.com,
 olteanv@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 09/12] net: ethernet: sunplus:
 Convert using devm_clk_get_enabled() in spl2sw_probe()
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

SGksCgrlnKggMjAyNC85LzQgNjoxNiwgSmFrdWIgS2ljaW5za2kg5YaZ6YGTOgo+IE9uIFNhdCwg
MzEgQXVnIDIwMjQgMTA6MTM6MzEgKzA4MDAgTGkgWmV0YW8gd3JvdGU6Cj4+ICsJY29tbS0+Y2xr
ID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgTlVMTCk7Cj4gCj4gWW91IGNhbiBy
ZW1vdmUgY2xrIGZyb20gdGhlIGRyaXZlciBzdHJ1Y3Qgbm93LgpJIGRvbuKAmXQgcXVpdGUgdW5k
ZXJzdGFuZCB3aHkgY2xrIGNhbiBiZSByZW1vdmVkIGZyb20gdGhlIGRyaXZlciBzdHJ1Y3QsIApt
YXliZSBJIG1pc3NlZCBzb21lIGltcG9ydGFudCBkaXNjdXNzaW9uIGluZm9ybWF0aW9uIGluIHRo
ZSBjb21tdW5pdHksIApwbGVhc2UgbGV0IG1lIGtub3csIHRoYW5rIHlvdS4KPiBQbGVhc2UgY2hl
Y2sgaWYgdGhlIHNhbWUgYXBwbGllcyB0byBvdGhlciBwYXRjaGVzLgoKVGhhbmtzLApMaSBaZXRh
by4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
