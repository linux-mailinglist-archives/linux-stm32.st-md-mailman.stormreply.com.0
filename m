Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D305ADBB9
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 01:10:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 460FDC640F0;
	Mon,  5 Sep 2022 23:10:16 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 631DFC0C920
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 23:10:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C60E3B81598;
 Mon,  5 Sep 2022 23:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323CBC433D7;
 Mon,  5 Sep 2022 23:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662419413;
 bh=QhxqwrmKqk3hcDpE+kAWZJMWXWXiMx7OLmYa5+ea15I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cRSoeEfIVpvF6cCwlub3pnSJQf8zKCY4aEUPtHMtOkNaxfZe1+RUfK+stOROQ5pnl
 7FbU956qU800+Jb6U6hwdOBoxO4x2FzlbVVVUaZEp0hQquPlSpxbMl7gPJHmGlip/q
 WXeDk2lh/TK49oBj/AAQP6Dst1Z5bl84IrLyRgMJAafIN0kMLxsIsEAjQNvYyihGG9
 h4xRjXdkiTaHf2hIJ2Yatpca7TxPs6KBGxO+xPjerqLTUmJvu4k28lZ30772rihPEH
 I7n720bv3M7ihVFZNddbLANnIMiG1BrKlgvb+eKgjpWzR8KT6CpP2IYFa+iRtTPNF6
 YocV+oaaQMIFA==
Received: by pali.im (Postfix)
 id 400A37D7; Tue,  6 Sep 2022 01:10:10 +0200 (CEST)
Date: Tue, 6 Sep 2022 01:10:10 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Message-ID: <20220905231010.ojl4i4ph27qtebiy@pali>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
 <20220905070046.46nlhczkck2ufr4x@pali>
 <YxZ+PSDRYZnVKfFO@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YxZ+PSDRYZnVKfFO@google.com>
User-Agent: NeoMutt/20180716
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-watchdog@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v1 06/11] PCI: aardvark: switch to using
 devm_gpiod_get_optional()
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

T24gTW9uZGF5IDA1IFNlcHRlbWJlciAyMDIyIDE1OjU0OjUzIERtaXRyeSBUb3Jva2hvdiB3cm90
ZToKPiBPbiBNb24sIFNlcCAwNSwgMjAyMiBhdCAwOTowMDo0NkFNICswMjAwLCBQYWxpIFJvaMOh
ciB3cm90ZToKPiA+IE9uIFN1bmRheSAwNCBTZXB0ZW1iZXIgMjAyMiAyMzozMDo1OCBEbWl0cnkg
VG9yb2tob3Ygd3JvdGU6Cj4gPiA+IEkgd291bGQgbGlrZSB0byBzdG9wIGV4cG9ydGluZyBPRi1z
cGVjaWZpYyBkZXZtX2dwaW9kX2dldF9mcm9tX29mX25vZGUoKQo+ID4gPiBzbyB0aGF0IGdwaW9s
aWIgY2FuIGJlIGNsZWFuZWQgYSBiaXQsIHNvIGxldCdzIHN3aXRjaCB0byB0aGUgZ2VuZXJpYwo+
ID4gPiBkZXZpY2UgcHJvcGVydHkgQVBJLgo+ID4gPiAKPiA+ID4gSSBiZWxpZXZlIHRoYXQgdGhl
IG9ubHkgcmVhc29uIHRoZSBkcml2ZXIsIGluc3RlYWQgb2YgdGhlIHN0YW5kYXJkCj4gPiA+IGRl
dm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCksIHVzZWQgZGV2bV9ncGlvZF9nZXRfZnJvbV9vZl9ub2Rl
KCkgaXMKPiA+ID4gYmVjYXVzZSBpdCB3YW50ZWQgdG8gc2V0IHVwIGEgcHJldHR5IGNvbnN1bWVy
IG5hbWUgZm9yIHRoZSBHUElPLAo+ID4gCj4gPiBJSVJDIGNvbnN1bWVyIG5hbWUgaXMgbm90IHVz
ZWQgYXQgYWxsLgo+ID4gCj4gPiBUaGUgcmVhc29uIHdhcyB0byBzcGVjaWZ5IGZ1bGwgbmFtZSBv
ZiBEVFMgcHJvcGVydHksIGZvciBlYXNpZXIKPiA+IGlkZW50aWZpY2F0aW9uIG9mIHRoZSBjb2Rl
LiBEVFMgcHJvcGVydHkgaXMgInJlc2V0LWdwaW9zIiBidXQgQVBJCj4gPiBzcGVjaWZ5IG9ubHkg
InJlc2V0Ii4KPiAKPiBJIHNlZS4gRG8geW91IHdhbnQgbWUgdG8gcmVzZXQgdGhlIHBhdGNoIHdp
dGggdXBkYXRlZCBkZXNjdGlwdGlvbiBhcyB0bwo+IHRoZSByZWFzb24gZGV2bV9ncGlvZF9nZXRf
ZnJvbV9vZl9ub2RlKCkgd2FzIHVzZWQ/CgpJIHRoaW5rIGl0IGlzIGZpbmUuIFNvIGFkZCBteToK
CkFja2VkLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPgoKQW55d2F5IGFzIGFub3Ro
ZXIgaW1wcm92ZW1lbnQgZm9yIGZ1dHVyZSBJIHdvdWxkIHN1Z2dlc3Qgc29tZSBBUEkKZnVuY3Rp
b24gd2l0aCBfb3B0aW9uYWxfIGxvZ2ljLCBzbyBpdCBjb3VsZCBiZSB1c2VkIGZvciBtb3JlIFBD
SWUKY29udHJvbGxlciBkcml2ZXJzIChlLmcuIGFsc28gdGVncmEpIHdpdGhvdXQgbmVlZCB0byBy
ZWltcGxlbWVudAotRU5PRU5UIGhhbmRsaW5nLiBJdCBpcyByZWFsbHkgc3RyYW5nZSBpZiBmb3Ig
YWNxdWlyaW5nIHNhbWUgUEVSU1QjCmxpbmUgdmlhIEdQSU8gKCJyZXNldC1ncGlvcyIgRFQgcHJv
cGVydHkpIGFyZSB1c2VkIG1vcmUgQVBJIGZ1bmN0aW9ucwppbiBkaWZmZXJlbnQgUENJZSBkcml2
ZXJzLgoKPiA+IAo+ID4gPiBhbmQgd2Ugbm93IGhhdmUgYSBzcGVjaWFsIEFQSSBmb3IgdGhhdC4K
PiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9r
aG92QGdtYWlsLmNvbT4KPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL3BjaS1hYXJkdmFyay5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ktYWFyZHZh
cmsuYwo+ID4gPiBpbmRleCA0ODM0MTk4Y2M4NmIuLjRhOGE0YTg1MjJjYiAxMDA2NDQKPiA+ID4g
LS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ktYWFyZHZhcmsuYwo+ID4gPiArKysgYi9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS1hYXJkdmFyay5jCj4gPiA+IEBAIC0xODU2LDIwICsx
ODU2LDE5IEBAIHN0YXRpYyBpbnQgYWR2a19wY2llX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gPiA+ICAJCXJldHVybiByZXQ7Cj4gPiA+ICAJfQo+ID4gPiAgCj4gPiA+IC0J
cGNpZS0+cmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X2Zyb21fb2Zfbm9kZShkZXYsIGRldi0+
b2Zfbm9kZSwKPiA+ID4gLQkJCQkJCSAgICAgICAicmVzZXQtZ3Bpb3MiLCAwLAo+ID4gPiAtCQkJ
CQkJICAgICAgIEdQSU9EX09VVF9MT1csCj4gPiA+IC0JCQkJCQkgICAgICAgInBjaWUxLXJlc2V0
Iik7Cj4gPiA+ICsJcGNpZS0+cmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKGRl
diwgInJlc2V0IiwgR1BJT0RfT1VUX0xPVyk7Cj4gPiA+ICAJcmV0ID0gUFRSX0VSUl9PUl9aRVJP
KHBjaWUtPnJlc2V0X2dwaW8pOwo+ID4gPiAgCWlmIChyZXQpIHsKPiA+ID4gLQkJaWYgKHJldCA9
PSAtRU5PRU5UKSB7Cj4gPiA+IC0JCQlwY2llLT5yZXNldF9ncGlvID0gTlVMTDsKPiA+ID4gLQkJ
fSBlbHNlIHsKPiA+ID4gLQkJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikKPiA+ID4gLQkJCQlk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgcmVzZXQtZ3BpbzogJWlcbiIsCj4gPiA+IC0JCQkJ
CXJldCk7Cj4gPiA+IC0JCQlyZXR1cm4gcmV0Owo+ID4gPiAtCQl9Cj4gPiA+ICsJCWlmIChyZXQg
IT0gLUVQUk9CRV9ERUZFUikKPiA+ID4gKwkJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBy
ZXNldC1ncGlvOiAlaVxuIiwKPiA+ID4gKwkJCQlyZXQpOwo+ID4gPiArCQlyZXR1cm4gcmV0Owo+
ID4gPiArCX0KPiA+ID4gKwo+ID4gPiArCXJldCA9IGdwaW9kX3NldF9jb25zdW1lcl9uYW1lKHBj
aWUtPnJlc2V0X2dwaW8sICJwY2llMS1yZXNldCIpOwo+ID4gPiArCWlmIChyZXQpIHsKPiA+ID4g
KwkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gc2V0IHJlc2V0IGdwaW8gbmFtZTogJWRcbiIsIHJl
dCk7Cj4gPiA+ICsJCXJldHVybiByZXQ7Cj4gPiA+ICAJfQo+ID4gPiAgCj4gPiA+ICAJcmV0ID0g
b2ZfcGNpX2dldF9tYXhfbGlua19zcGVlZChkZXYtPm9mX25vZGUpOwo+ID4gPiAKPiA+ID4gLS0g
Cj4gPiA+IGI0IDAuMTAuMC1kZXYtZmM5MjEKPiAKPiBUaGFua3MuCj4gCj4gLS0gCj4gRG1pdHJ5
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
