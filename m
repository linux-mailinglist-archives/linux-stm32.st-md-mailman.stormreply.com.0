Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 231F05AD0A7
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 12:53:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1A58C55596;
	Mon,  5 Sep 2022 10:53:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE891C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 10:53:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98186611CC;
 Mon,  5 Sep 2022 10:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD170C43141;
 Mon,  5 Sep 2022 10:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662375225;
 bh=KnM89UV/QXbr+bD5uW61IQuouhORuL6HjctA/n6mRg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YXsW4xMlqP5G1yqVn2Vnp7wQDcPAoNf58U0cr8myKFBfvUzkhpC+Iscqcyg5rEIhZ
 0PMTgWItYJNmw8Z400ucNJ5B0XE0lekJpX4qyetV4qePiVhpwNvYixfPDpcUp14ikB
 22T/9xIpoVj9aJjbUdIR8NPhsD59irNN093isONgtwU/IDqAU6CwhROyPAZqKJ3Ax2
 Sj/95TQsCXTmoey/B358xD1yE1qexDQ+Le/UUWfUT+rUg92OQbc5mebVHkcJj3e8vm
 1Cb0U86VmYuGN9CH7WKr97gNp1kG1ChXDQHt2IQgh1P4RW98tzTzb6AB6Z4u/ySvYP
 V7b5ELppG5LAQ==
Received: by pali.im (Postfix)
 id E35A67D7; Mon,  5 Sep 2022 12:53:41 +0200 (CEST)
Date: Mon, 5 Sep 2022 12:53:41 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20220905105341.z2pjlpljitws3j6l@pali>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
 <20220905071902.fv4uozrsttk3mosu@pali>
 <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 USB <linux-usb@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>, linux-pci <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v1 01/11] PCI: tegra: switch to using
 devm_fwnode_gpiod_get
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

T24gTW9uZGF5IDA1IFNlcHRlbWJlciAyMDIyIDEzOjQ5OjIxIEFuZHkgU2hldmNoZW5rbyB3cm90
ZToKPiBPbiBNb24sIFNlcCA1LCAyMDIyIGF0IDEwOjIzIEFNIFBhbGkgUm9ow6FyIDxwYWxpQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4gT24gU3VuZGF5IDA0IFNlcHRlbWJlciAyMDIyIDIzOjMwOjUz
IERtaXRyeSBUb3Jva2hvdiB3cm90ZToKPiAKPiAuLi4KPiAKPiA+ID4gLSAgICAgICAgICAgICBy
cC0+cmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X2Zyb21fb2Zfbm9kZShkZXYsIHBvcnQsCj4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgInJlc2V0LWdwaW9zIiwgMCwKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHUElPRF9PVVRfTE9XLAo+ID4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxh
YmVsKTsKPiA+ID4gKyAgICAgICAgICAgICBycC0+cmVzZXRfZ3BpbyA9IGRldm1fZndub2RlX2dw
aW9kX2dldChkZXYsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgb2ZfZndub2RlX2hhbmRsZShwb3J0KSwKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicmVzZXQiLAo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdQSU9E
X09VVF9MT1csCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbGFiZWwpOwo+ID4KPiA+IFdoeSBpbiBwY2ktYWFyZHZhcmsuYyBmb3IgUEVS
U1QjIHJlc2V0LWdwaW8geW91IGhhdmUgdXNlZAo+ID4gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwo
KSBhbmQgaGVyZSBpbiBwY2ktdGVncmEuYyB5b3UgaGF2ZSB1c2VkCj4gPiBkZXZtX2Z3bm9kZV9n
cGlvZF9nZXQoKT8gSSB0aGluayB0aGF0IFBFUlNUIyBsb2dpYyBpcyBzYW1lIGluIGJvdGgKPiA+
IGRyaXZlcnMuCj4gCj4gSXQncyBub3QgdGhlIHNhbWUgZGV2IGFuZCBpdHMgbm9kZSBpbiB0aGlz
IGNhc2UuIFRoZXJlIGlzIG9uZSByZXNldAo+IGZvciBfYWxsXyBwb3J0cywgaGVyZSBpcyB0aGUg
cmVzZXQgb24gX3BlciBwb3J0XyBiYXNpcy4KCmFhcmR2YXJrIGlzIHNpbmdsZSBwb3J0IGNvbnRy
b2xsZXIuIFNvIGl0IGlzIGJhc2ljYWxseSBzYW1lLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
