Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C13775AD082
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 12:48:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B949C55596;
	Mon,  5 Sep 2022 10:48:20 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62ACBC0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 10:48:18 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id cr9so5832997qtb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Sep 2022 03:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=ocC0mA23fnRz/a4YbrfNwFrDwQYg+GSA5oW5v/yTckg=;
 b=KeR2rGIjPnYKiKG2aILzh6gWMDTnViE8fXPWXXXixLovTbpx00/oSEAU+Q4L2OCzAK
 GRraxIbhCS4mi4IuRHOlRDlrrUGLqMd7GLM+J1Hc2/d7WSNIQDHGywQYnYEyBYPDgjiz
 uY13i1u0RDIQGheVM8QVFqtoKIkC9biCE4wbzSZrKtBJ1m2pvxKw60ny4f6bBZ/B8u0u
 Zr23UPD2YvAu/KuN+tEjHJX9M8xugOLPnNs4g2YR3PzTM6X60zVPevAOqAjIm6WKdYct
 vHLBCofCn+v7V2zJuE2kdbx3Wmz7GLi7XsxEmH7dNee6uir7hoWh+8c0e9HZN2r8BTuM
 JH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ocC0mA23fnRz/a4YbrfNwFrDwQYg+GSA5oW5v/yTckg=;
 b=7ZkxpBAqsvBAn1wX4b3MBCarozJDDhIJEuJ9ZDh9IkC2tEOMskePWw1Fd1khpRfHRv
 zEs2bXgjUh7dmS+B6Otw4c/fi8t2RymTj4XhnPaxyEw8c1VLR2ZvMYmjXIWYrCFsnFJp
 YtNq9FBZt1Eb262tyNSXCdlnYSS1N4OeNRj4ClokZwO/W0A7bvj/7WHG0iaa0Ay5BF7G
 Sk7PUOQXwgk3nyk5Mh2aZ3vrbF1/iDTkCLRlBctnoVm+FfVBn1L8STkxM6roRkB2yM4y
 Ol5drxgJfHt0jz+s8k/KsJafPu6DqiC4uZdfYpn2FU9+IrbhDs+yzlZTpj7YC3YP34nI
 TkGQ==
X-Gm-Message-State: ACgBeo1T2ERfiyoTNf2/QX6CO2lN324CkdYeskSj1mptHPHprwkHAfUH
 jw784uefsdxdw4WYLyOsykl4Vfhf6keb3X1tQvM=
X-Google-Smtp-Source: AA6agR6PNo2Qc8lpj2itrEExN36xqc7ZpSaZEm3ZnHtwljImH3P9PTPtYv87hNYI8E9dEPcysm+pNwOsTzObwqbdpdc=
X-Received: by 2002:ac8:5786:0:b0:343:3051:170d with SMTP id
 v6-20020ac85786000000b003433051170dmr38497148qta.429.1662374897323; Mon, 05
 Sep 2022 03:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-6-b29adfb27a6c@gmail.com>
 <20220905070046.46nlhczkck2ufr4x@pali>
In-Reply-To: <20220905070046.46nlhczkck2ufr4x@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:47:41 +0300
Message-ID: <CAHp75VcFv7ipLqXmOwbXpY-_ccYNA9PgF0h4T8RY1Z-UNNpaTg@mail.gmail.com>
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

T24gTW9uLCBTZXAgNSwgMjAyMiBhdCAxMDowMiBBTSBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwu
b3JnPiB3cm90ZToKPiBPbiBTdW5kYXkgMDQgU2VwdGVtYmVyIDIwMjIgMjM6MzA6NTggRG1pdHJ5
IFRvcm9raG92IHdyb3RlOgo+ID4gSSB3b3VsZCBsaWtlIHRvIHN0b3AgZXhwb3J0aW5nIE9GLXNw
ZWNpZmljIGRldm1fZ3Bpb2RfZ2V0X2Zyb21fb2Zfbm9kZSgpCj4gPiBzbyB0aGF0IGdwaW9saWIg
Y2FuIGJlIGNsZWFuZWQgYSBiaXQsIHNvIGxldCdzIHN3aXRjaCB0byB0aGUgZ2VuZXJpYwo+ID4g
ZGV2aWNlIHByb3BlcnR5IEFQSS4KPiA+Cj4gPiBJIGJlbGlldmUgdGhhdCB0aGUgb25seSByZWFz
b24gdGhlIGRyaXZlciwgaW5zdGVhZCBvZiB0aGUgc3RhbmRhcmQKPiA+IGRldm1fZ3Bpb2RfZ2V0
X29wdGlvbmFsKCksIHVzZWQgZGV2bV9ncGlvZF9nZXRfZnJvbV9vZl9ub2RlKCkgaXMKPiA+IGJl
Y2F1c2UgaXQgd2FudGVkIHRvIHNldCB1cCBhIHByZXR0eSBjb25zdW1lciBuYW1lIGZvciB0aGUg
R1BJTywKPgo+IElJUkMgY29uc3VtZXIgbmFtZSBpcyBub3QgdXNlZCBhdCBhbGwuCgpJdCdzLiBU
aGUgdXNlciBzcGFjZSB0b29scyB1c2UgaXQgYXMgYSBsYWJlbC4gU28sIEdQSU8gbGluZSBjYW4g
aGF2ZQoibmFtZSIgKHRoaXMgaXMgcHJvdmlkZXIgc3BlY2lmaWMpIGFuZCAibGFiZWwiICh3aGlj
aCBpcyBjb25zdW1lcgpzcGVjaWZpYywgaS5vLncuIGhvdyB3ZSB1c2UgdGhpcyBsaW5lKS4KCi4u
LgoKPiA+ICsgICAgICAgICAgICAgaWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCByZXNldC1ncGlvOiAl
aVxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCk7Cj4gPiArICAgICAg
ICAgICAgIHJldHVybiByZXQ7CgpJIHVuZGVyc3RhbmQgdGhhdCBpbiB0aGUgaW5wdXQgc3Vic3lz
dGVtIG1haW50YWluZXIncyBoYXQgeW91IGRvbid0Cmxpa2UgZGV2X2Vycl9wcm9iZSgpLCBidXQg
aXQncyBhIGdvb2QgY2FzZSB0byBoYXZlIGl0IGhlcmUuCgouLi4KCj4gPiArICAgICByZXQgPSBn
cGlvZF9zZXRfY29uc3VtZXJfbmFtZShwY2llLT5yZXNldF9ncGlvLCAicGNpZTEtcmVzZXQiKTsK
PiA+ICsgICAgIGlmIChyZXQpIHsKPiA+ICsgICAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWls
ZWQgdG8gc2V0IHJlc2V0IGdwaW8gbmFtZTogJWRcbiIsIHJldCk7Cj4gPiArICAgICAgICAgICAg
IHJldHVybiByZXQ7Cj4gPiAgICAgICB9CgpEaXR0by4KCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMs
CkFuZHkgU2hldmNoZW5rbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
