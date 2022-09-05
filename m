Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6895AD0B3
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 12:55:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26E70C640FE;
	Mon,  5 Sep 2022 10:55:14 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A4DDC640F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 10:55:12 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id a10so6042081qkl.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 03:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=u5wXdybY4V4FdQrWKDhVN8YtAVKPzLButJ1sTRP8l1Y=;
 b=fN9ls9YPkyuUBAxr4wBmegmBCd5C9P/xaFPwXqy2FgkVzhIWNFNVR0bIehn1eXCf3d
 zobAQyMxj0Z6zjuSqQChSLqXx/lGBZnOoXZuh0swZ9USSGOks25+oXU6FAesXBD3v2DQ
 L68l4C/DyY0LtBFJIREWTz0QAYiKWOW4FJBp9fKNmjWxzb09XWs8F+aM06q4SUWIESBO
 xHTM6IpS/sM1qQMre3AApRlHWbfBdhbDuAOnnGrdzMosW5f0QYLusQvgZq38fCbtCj8+
 st+OCZ16eP1EI4yU9tRWvtbyzF+xtAD5mGA4eMQrLw3MtKQV7zXu1TtVJ7pKICr8G27y
 D+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=u5wXdybY4V4FdQrWKDhVN8YtAVKPzLButJ1sTRP8l1Y=;
 b=N8DR6Xgr0WKjzsZKytd2YLq9TOir2KGMPsNQBxBVP6bwkb9SbGnJfrqEK6KBoHb0RI
 1WgUQeyfg2XWYGdac5tUv7fO5cFmt083+18UqSIQzhagCk7nakpvYYeKxNrtmbGxrMSk
 aR8HHp4kWOn23mee06XdltXCgQqNU4jmdJyvV79KHzrNs1dwrAnw720Zz0oKkUx8knYW
 jP+pSkkqJabHchiuQADcZVW+dXpZUeBxL8XpBoUeCvcLc3jdffBWSZ1KRPdDCm+bTKEJ
 W4KEnQrhxGKYRrwDTjIPZkZaivIwjhzPTR5ef5n/2eszWXn/B9DM577C0ZM5xqUpkKZd
 aH9A==
X-Gm-Message-State: ACgBeo1thyL2En3lLp8526pKol8qUUslkWJVEXbLPXQOck2V6ZpBgrwK
 yiDJZsQtHhW8ZXLz6bSBgCC9e1i6cFUysifgHNU=
X-Google-Smtp-Source: AA6agR4kYjGXWf3gIvqIWbBUJGizexBviWISl//lL9gbx6ZDHQvEVsxtbzoy40VfO0zOsVmlCvX9hRiizwzJ1xcnYOU=
X-Received: by 2002:a05:620a:2987:b0:6ba:dc04:11ae with SMTP id
 r7-20020a05620a298700b006badc0411aemr31582222qkp.748.1662375311598; Mon, 05
 Sep 2022 03:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
 <20220905071902.fv4uozrsttk3mosu@pali>
 <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
 <20220905105341.z2pjlpljitws3j6l@pali>
In-Reply-To: <20220905105341.z2pjlpljitws3j6l@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:54:35 +0300
Message-ID: <CAHp75VedhWXbEG6kpObbpnyPE3M3dCM7nEyupJr+rwKj0kVC8w@mail.gmail.com>
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

T24gTW9uLCBTZXAgNSwgMjAyMiBhdCAxOjUzIFBNIFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5v
cmc+IHdyb3RlOgo+IE9uIE1vbmRheSAwNSBTZXB0ZW1iZXIgMjAyMiAxMzo0OToyMSBBbmR5IFNo
ZXZjaGVua28gd3JvdGU6CgouLi4KCj4gPiBJdCdzIG5vdCB0aGUgc2FtZSBkZXYgYW5kIGl0cyBu
b2RlIGluIHRoaXMgY2FzZS4gVGhlcmUgaXMgb25lIHJlc2V0Cj4gPiBmb3IgX2FsbF8gcG9ydHMs
IGhlcmUgaXMgdGhlIHJlc2V0IG9uIF9wZXIgcG9ydF8gYmFzaXMuCj4KPiBhYXJkdmFyayBpcyBz
aW5nbGUgcG9ydCBjb250cm9sbGVyLiBTbyBpdCBpcyBiYXNpY2FsbHkgc2FtZS4KClllcCwganVz
dCByZXBsaWVkIHRvIG15IG1lc3NhZ2UuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hl
dmNoZW5rbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
