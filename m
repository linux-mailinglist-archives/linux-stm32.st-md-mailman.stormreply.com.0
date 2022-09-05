Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C40B55AD08B
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 12:50:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91FD5C0C920;
	Mon,  5 Sep 2022 10:49:59 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3038EC0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 10:49:58 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id c6so3800379qvn.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=c2nRQWb+fQUQq5AQnrIySgvmnHVhBaOL/o7B8oGby/I=;
 b=bJcqTGACtFXLmXsUFqpw+PFDufx4FlXQ9j/RFhHUQVHKZqoTndY/JkV19g6BLOeeUo
 4hwSoSeec32Tbw+OMHEGG0r6M3e1GMJ/NJcg/FZwHW1SClzced4lWIu+/ZShrdu3JDTD
 V762GqyZZIhqeYexr860HlDH8BBXqi/Xiv+2j3KgGGGsMmOP08meZgz/a8ltQBauY42v
 3tIliUsfRb5Lb2wvCwZlmuODmHlyxQTZ+r40eHwZ7AsK+hrNiFx9jEpz+HZY8XcSMnnB
 5QEIV3Pay913kDLF3Na3+KE+sGrpwp4YFq2VvbdqUoXS9I37A0JHt+Mwwdcik+o8Vvzp
 uBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=c2nRQWb+fQUQq5AQnrIySgvmnHVhBaOL/o7B8oGby/I=;
 b=tqSMAWLj0fGm7ESRgAYDV+leFLH4yIxWjQn7d3ctf2cvcJ+s3r+r2RD9qCyKi81ZWr
 d5vVuGrbFgro4ivQAOhePaAtLUtmKoXccTYygZDCjzsSfUsNhf4LDbBapp2Liv4GYVzb
 ddnfuMu0w0XWBqxnDaCcFl5WvOMHBdELI7LKX6gbmlS73xgxMc35ZQKTutDy9GGVSlJL
 2ZHY9mkjBno7pWqVZS0bKVrUCF/sN7I4XYhwuoYdyYXrfD1wb0aZ9KgxM/2dI+2ITlju
 o2sOjNZBekrvGjofmQbcEIhvSOJT/7Qmm9SgYVAHdT2vWi8qMV0HeKPvGTemAqH33fhf
 2/1A==
X-Gm-Message-State: ACgBeo3NLQDfVIuV5BljwH/hPDvKQrGbpc7kv+sFZbehIqRUofqD7nFb
 AzBtcrKEjTnOR+HrkrZj/8CioxPSHWj+ElqUYto=
X-Google-Smtp-Source: AA6agR4zgtLgNA+6EPAv70W9Z01Gulpe7vTobIsUEmKS5Gup9hLVk95/eNnOn1IhVSGIautSBTqi9ZJMAl53duUVpgY=
X-Received: by 2002:ad4:5f8f:0:b0:4a9:b75a:e33c with SMTP id
 jp15-20020ad45f8f000000b004a9b75ae33cmr746972qvb.82.1662374997159; Mon, 05
 Sep 2022 03:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
 <20220905071902.fv4uozrsttk3mosu@pali>
In-Reply-To: <20220905071902.fv4uozrsttk3mosu@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:49:21 +0300
Message-ID: <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
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

T24gTW9uLCBTZXAgNSwgMjAyMiBhdCAxMDoyMyBBTSBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwu
b3JnPiB3cm90ZToKPiBPbiBTdW5kYXkgMDQgU2VwdGVtYmVyIDIwMjIgMjM6MzA6NTMgRG1pdHJ5
IFRvcm9raG92IHdyb3RlOgoKLi4uCgo+ID4gLSAgICAgICAgICAgICBycC0+cmVzZXRfZ3BpbyA9
IGRldm1fZ3Bpb2RfZ2V0X2Zyb21fb2Zfbm9kZShkZXYsIHBvcnQsCj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyZXNldC1ncGlv
cyIsIDAsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEdQSU9EX09VVF9MT1csCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsKTsKPiA+ICsgICAgICAgICAg
ICAgcnAtPnJlc2V0X2dwaW8gPSBkZXZtX2Z3bm9kZV9ncGlvZF9nZXQoZGV2LAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvZl9md25vZGVf
aGFuZGxlKHBvcnQpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAicmVzZXQiLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBHUElPRF9PVVRfTE9XLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsYWJlbCk7Cj4KPiBXaHkgaW4g
cGNpLWFhcmR2YXJrLmMgZm9yIFBFUlNUIyByZXNldC1ncGlvIHlvdSBoYXZlIHVzZWQKPiBkZXZt
X2dwaW9kX2dldF9vcHRpb25hbCgpIGFuZCBoZXJlIGluIHBjaS10ZWdyYS5jIHlvdSBoYXZlIHVz
ZWQKPiBkZXZtX2Z3bm9kZV9ncGlvZF9nZXQoKT8gSSB0aGluayB0aGF0IFBFUlNUIyBsb2dpYyBp
cyBzYW1lIGluIGJvdGgKPiBkcml2ZXJzLgoKSXQncyBub3QgdGhlIHNhbWUgZGV2IGFuZCBpdHMg
bm9kZSBpbiB0aGlzIGNhc2UuIFRoZXJlIGlzIG9uZSByZXNldApmb3IgX2FsbF8gcG9ydHMsIGhl
cmUgaXMgdGhlIHJlc2V0IG9uIF9wZXIgcG9ydF8gYmFzaXMuCgotLSAKV2l0aCBCZXN0IFJlZ2Fy
ZHMsCkFuZHkgU2hldmNoZW5rbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
