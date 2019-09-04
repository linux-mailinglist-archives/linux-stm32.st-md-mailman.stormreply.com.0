Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C4EA82AE
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2019 14:43:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6CC8C35E01;
	Wed,  4 Sep 2019 12:43:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DB8FC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 12:43:40 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1B4DA2000E;
 Wed,  4 Sep 2019 12:43:33 +0000 (UTC)
Date: Wed, 4 Sep 2019 14:43:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <20190904144332.46ab190f@xps13>
In-Reply-To: <20190904122939.23780-2-yuehaibing@huawei.com>
References: <20190904122939.23780-1-yuehaibing@huawei.com>
 <20190904122939.23780-2-yuehaibing@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mans@mansr.com, mmayer@broadcom.com, eric@anholt.net,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de,
 amit.kucheria@verdurent.com, f.fainelli@gmail.com, daniel.lezcano@linaro.org,
 phil@raspberrypi.org, linux-rockchip@lists.infradead.org, agross@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-msm@vger.kernel.org,
 rui.zhang@intel.com, marc.w.gonzalez@free.fr, rjui@broadcom.com,
 edubezval@gmail.com, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, gregory.0xf0@gmail.com,
 matthias.bgg@gmail.com, horms+renesas@verge.net.au, talel@amazon.com,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, wahrenst@gmx.net,
 mcoquelin.stm32@gmail.com, jun.nie@linaro.org, computersforpeace@gmail.com,
 shawnguo@kernel.org
Subject: Re: [Linux-stm32] [PATCH -next 01/15] thermal: armada: use
 devm_platform_ioremap_resource() to simplify code
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

SGkgWXVlLAoKWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPiB3cm90ZSBvbiBXZWQs
IDQgU2VwIDIwMTkgMjA6Mjk6MjUKKzA4MDA6Cgo+IFVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBf
cmVzb3VyY2UoKSB0byBzaW1wbGlmeSB0aGUgY29kZSBhIGJpdC4KPiBUaGlzIGlzIGRldGVjdGVk
IGJ5IGNvY2NpbmVsbGUuCj4gCj4gUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3
ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNv
bT4KPiAtLS0KPiAgZHJpdmVycy90aGVybWFsL2FybWFkYV90aGVybWFsLmMgfCA0ICstLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvYXJtYWRhX3RoZXJtYWwuYyBiL2RyaXZlcnMvdGhlcm1h
bC9hcm1hZGFfdGhlcm1hbC5jCj4gaW5kZXggNzA5YTIyZi4uNzBmZTljNiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3RoZXJtYWwvYXJtYWRhX3RoZXJtYWwuYwo+ICsrKyBiL2RyaXZlcnMvdGhlcm1h
bC9hcm1hZGFfdGhlcm1hbC5jCj4gQEAgLTcwOCwxMiArNzA4LDEwIEBAIHN0YXRpYyBpbnQgYXJt
YWRhX3RoZXJtYWxfcHJvYmVfbGVnYWN5KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCj4g
IAkJCQkgICAgICAgc3RydWN0IGFybWFkYV90aGVybWFsX3ByaXYgKnByaXYpCj4gIHsKPiAgCXN0
cnVjdCBhcm1hZGFfdGhlcm1hbF9kYXRhICpkYXRhID0gcHJpdi0+ZGF0YTsKPiAtCXN0cnVjdCBy
ZXNvdXJjZSAqcmVzOwo+ICAJdm9pZCBfX2lvbWVtICpiYXNlOwo+ICAKPiAgCS8qIEZpcnN0IG1l
bW9yeSByZWdpb24gcG9pbnRzIHRvd2FyZHMgdGhlIHN0YXR1cyByZWdpc3RlciAqLwo+IC0JcmVz
ID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKPiAtCWJh
c2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgcmVzKTsKPiArCWJhc2UgPSBk
ZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7Cj4gIAlpZiAoSVNfRVJSKGJh
c2UpKQo+ICAJCXJldHVybiBQVFJfRVJSKGJhc2UpOwo+ICAKClJldmlld2VkLWJ5OiBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
