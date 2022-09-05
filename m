Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 416A55AD0B0
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 12:54:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05F28C640F2;
	Mon,  5 Sep 2022 10:54:40 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D4D5C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 10:54:38 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id j1so6160657qvv.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 03:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Kl0QJJuFrqWw0yrcvdhKbmcA1hZ+nxHWOs1loNonK4k=;
 b=BT3xLpeH3RjbxWQzTHtluGWFLcpz2c3gkUTiSpzfoPpU7gaIO6czvS8W4reMZ4cCO4
 3eMf/g+K3UKbJS6Jk0JxrWeNOy6+42NuOyskDMGWojnEiJoNCccaKDrBXpafZBuULjuW
 dYcA7PiA983MMDKcYZKgKx3pSqByFVARqZpiSeVPU2Zd8gAbIKhjyD904CbNMtAzjOUC
 uG1HJFkRMuzcZrZpIhoUBQgxwknWCtImNXXD19IvU58Ts2K5UQm4oyao9nlr1q38XCd5
 l4cO9hdybc4SBkJmevuxR16Y4XsOdXf+9PHct3p0BX/cs/X4ebLeTYqHTloP7bvoOCLm
 luuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Kl0QJJuFrqWw0yrcvdhKbmcA1hZ+nxHWOs1loNonK4k=;
 b=tOLk/BfUKp+6iz6yYZnF+cnNTGTC4KVuR9Zf6Tg7hqcTXB72kLTMfZmKAF3yEzmbYm
 J1I2orm5oy+CacCR95GqiHs+p0E+guj+HhffYjmroklICmuuQD//VPN4BqRPlc5OgoNU
 Y6e/W5Yx5Lvt5AVtcOM5nyzRlbCRRHzJb3dCGrrprg1vTPVnSck5tyuylxLd6SPtSouO
 IhTG3eyjvshkwii31E0AKr/uBtFIhTOT848aUJ/pepEXchGF4vCps9XqUTYjkOMW4oIq
 nn5TStj/XiZrKhwJtxvK6J0a/2ZtL93tUhK6YEX11bn6tsa1yadmthG+qZgVujfh5zYN
 RdEw==
X-Gm-Message-State: ACgBeo2A+yaKj1A+zaL1pyZSc8fydYydd0OAkciC1Nqe7IvAzzH30pel
 iU+FmJarKGodCarPewvoYU/cj+d/VA6hfkUNGCk=
X-Google-Smtp-Source: AA6agR5qY7QHGswD32uCDWcX3OPsA9Qr7QwZIbiYbOgQNRx+s2EA487X6YBau9sHW1SCIA7Zbx5vkCR0pqATT7Z+4Es=
X-Received: by 2002:ad4:5f8f:0:b0:4a9:b75a:e33c with SMTP id
 jp15-20020ad45f8f000000b004a9b75ae33cmr757802qvb.82.1662375277275; Mon, 05
 Sep 2022 03:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
 <20220905071902.fv4uozrsttk3mosu@pali>
 <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
In-Reply-To: <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:54:00 +0300
Message-ID: <CAHp75VfDZXzRQjTZSYO6tb3k6WDWmPz1Fpw8Y_RBx8cz79j2=Q@mail.gmail.com>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
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

T24gTW9uLCBTZXAgNSwgMjAyMiBhdCAxOjQ5IFBNIEFuZHkgU2hldmNoZW5rbwo8YW5keS5zaGV2
Y2hlbmtvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCA1LCAyMDIyIGF0IDEwOjIz
IEFNIFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gT24gU3VuZGF5IDA0
IFNlcHRlbWJlciAyMDIyIDIzOjMwOjUzIERtaXRyeSBUb3Jva2hvdiB3cm90ZToKPgo+IC4uLgo+
Cj4gPiA+IC0gICAgICAgICAgICAgcnAtPnJlc2V0X2dwaW8gPSBkZXZtX2dwaW9kX2dldF9mcm9t
X29mX25vZGUoZGV2LCBwb3J0LAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyZXNldC1ncGlvcyIsIDAsCj4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR1BJ
T0RfT1VUX0xPVywKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBsYWJlbCk7Cj4gPiA+ICsgICAgICAgICAgICAgcnAtPnJlc2V0
X2dwaW8gPSBkZXZtX2Z3bm9kZV9ncGlvZF9nZXQoZGV2LAo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mX2Z3bm9kZV9oYW5kbGUocG9y
dCksCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgInJlc2V0IiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBHUElPRF9PVVRfTE9XLAo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsKTsKPiA+Cj4gPiBXaHkgaW4g
cGNpLWFhcmR2YXJrLmMgZm9yIFBFUlNUIyByZXNldC1ncGlvIHlvdSBoYXZlIHVzZWQKPiA+IGRl
dm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCkgYW5kIGhlcmUgaW4gcGNpLXRlZ3JhLmMgeW91IGhhdmUg
dXNlZAo+ID4gZGV2bV9md25vZGVfZ3Bpb2RfZ2V0KCk/IEkgdGhpbmsgdGhhdCBQRVJTVCMgbG9n
aWMgaXMgc2FtZSBpbiBib3RoCj4gPiBkcml2ZXJzLgo+Cj4gSXQncyBub3QgdGhlIHNhbWUgZGV2
IGFuZCBpdHMgbm9kZSBpbiB0aGlzIGNhc2UuIFRoZXJlIGlzIG9uZSByZXNldAo+IGZvciBfYWxs
XyBwb3J0cywgaGVyZSBpcyB0aGUgcmVzZXQgb24gX3BlciBwb3J0XyBiYXNpcy4KCkFjdHVhbGx5
IEknbSB3cm9uZywgdGhlIGFhcmR2YXJrIGhhcyBvbmx5IG9uZSBwb3J0ICg/KSB0byBzZXJ2ZSB0
aGVyZS4KSW4gYW55IGNhc2UsIGhlcmUgZGV2ID09IGRldi0+b2Zfbm9kZSwgaGVyZSBkZXYgIT0g
cG9ydC4KCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
