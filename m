Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 312BB959667
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 10:21:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC1F1C6DD9A;
	Wed, 21 Aug 2024 08:21:33 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C631C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 08:21:26 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52f04c29588so8457204e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 01:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724228485; x=1724833285;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A1mM7VOy3wYhnD2rAhzlxVmwa5gojTJ+lhe9geIJYUs=;
 b=SxB98HFpDjiaTmsDQHg5s6dLOnvhCaAAfzyjpHpIgFVjsC6nQQyQMAjpeRVCbm1X/a
 L27S7tiKWOqFquOwn1wSARW4u1MIFPTLE/Mj7Cs0Jtmns78nB+chdK/PM64tHMSryT27
 Ii72s+OdkMJSUT4OYYIlOvteTiwnQIZBGzbVbQxQtq4/Nd4AC+nbd8A48q+gxpob+0qY
 UA4XGeRq3lirCppgoyY5JjIOv57Lu2rIaSY8golkPLZL5e1ZiDq/2tAr932wUo3mx9XB
 LVBgyIqO0rVuxqfsvEIs53BqTR+S4uw1Fb3qrQE6RBU1H5nmf5S5rmQKhGfYmg4Mv9aF
 4w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724228485; x=1724833285;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A1mM7VOy3wYhnD2rAhzlxVmwa5gojTJ+lhe9geIJYUs=;
 b=XWEKoce2I/QEXe+AOjhADHXz3GkIQLbkVxLqfecpgkYRhETyV98Ivujh8S6Ph7F01d
 CoCVdJApBt76Y1hPYbFbm2+B0lTaT0XPq/uCL79RSHKz4lQAq/xctydCPLdRlrnZ5njc
 jwWkGpB45jGGfbsEjjBOIXrJyTpqawGQMobPBrI7VwHMpr6uwIM5jPsYYExa/rBGCy4j
 1/JLz6SuyrmErhzFrDgxMwq7Wdh87hrbd27XTz0wWjCPvwfHkLD8IMRrjSR00/q1BxNq
 aTvMsG/XlEJ3zti3GnFpve9M3AQwAAnGTALhSk5Ai80sj/0aZP6eDA+Si9oPV0BqQnVj
 EI/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1wwnSsXgPjePN+tpTw0AMQxZE07kOMHtqOiYLQ8qbgqg4SPANfatrVBz5osXhZOVdCaMv+VRJpec0PA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy9bT8HU6YwFFKtZjRRVojOLzUGWsETrLg8xpunhWMB6t6sTaxG
 GIHuDLpiqBMuehyTGCX8V0gmETc9TT0s+UR6lclAWm46daXqVomvX96aVO+FNmQU9Q7Tj4syedn
 bGqtNqcf2ePKLNx7Jwf+euVCGZW8=
X-Google-Smtp-Source: AGHT+IE5lCR7HVY/g4hFvBV/RGv3qIBpIhbmfnMcQQ7lowungeDx3xymow/Bwb+dY3WdhUTB7lf53PrUHtbP7MuHfPo=
X-Received: by 2002:a05:6512:3512:b0:533:482f:afbe with SMTP id
 2adb3069b0e04-533485af9eamr639466e87.24.1724228484968; Wed, 21 Aug 2024
 01:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240821071842.8591-2-pstanner@redhat.com>
 <20240821071842.8591-5-pstanner@redhat.com>
In-Reply-To: <20240821071842.8591-5-pstanner@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Aug 2024 11:20:48 +0300
Message-ID: <CAHp75Ve02c61V7pyAhbJr15jt5nb7Sjn58HzhoY6VH0C7YKVDA@mail.gmail.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Wu Hao <hao.wu@intel.com>,
 Andy Shevchenko <andy@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 virtualization@lists.linux.dev, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Hannes Reinecke <hare@suse.de>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, David Lechner <dlechner@baylibre.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xu Yilun <yilun.xu@intel.com>, Damien Le Moal <dlemoal@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fpga@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 3/9] block: mtip32xx: Replace
	deprecated PCI functions
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

T24gV2VkLCBBdWcgMjEsIDIwMjQgYXQgMTA6MTnigK9BTSBQaGlsaXBwIFN0YW5uZXIgPHBzdGFu
bmVyQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gcGNpbV9pb21hcF9yZWdpb25zKCkgYW5kIHBjaW1f
aW9tYXBfdGFibGUoKSBoYXZlIGJlZW4gZGVwcmVjYXRlZCBieSB0aGUKPiBQQ0kgc3Vic3lzdGVt
IGluIGNvbW1pdCBlMzU0YmI4NGE0YzEgKCJQQ0k6IERlcHJlY2F0ZQo+IHBjaW1faW9tYXBfdGFi
bGUoKSwgcGNpbV9pb21hcF9yZWdpb25zX3JlcXVlc3RfYWxsKCkiKS4KPgo+IEluIG10aXAzMnh4
LCB0aGVzZSBmdW5jdGlvbnMgY2FuIGVhc2lseSBiZSByZXBsYWNlZCBieSB0aGVpciByZXNwZWN0
aXZlCj4gc3VjY2Vzc29ycywgcGNpbV9yZXF1ZXN0X3JlZ2lvbigpIGFuZCBwY2ltX2lvbWFwKCku
IE1vcmVvdmVyLCB0aGUKPiBkcml2ZXIncyBjYWxscyB0byBwY2ltX2lvdW5tYXBfcmVnaW9ucygp
IGluIHByb2JlKCkncyBlcnJvciBwYXRoIGFuZCBpbgo+IHJlbW92ZSgpIGFyZSBub3QgbmVjZXNz
YXJ5LiBDbGVhbnVwIGNhbiBiZSBwZXJmb3JtZWQgYnkgUENJIGRldnJlcwo+IGF1dG9tYXRpY2Fs
bHkuCj4KPiBSZXBsYWNlIHBjaW1faW9tYXBfcmVnaW9ucygpIGFuZCBwY2ltX2lvbWFwX3RhYmxl
KCkuCj4KPiBSZW1vdmUgdGhlIGNhbGxzIHRvIHBjaW1faW91bm1hcF9yZWdpb25zKCkuCgouLi4K
Cj4gIHNldG1hc2tfZXJyOgo+IC0gICAgICAgcGNpbV9pb3VubWFwX3JlZ2lvbnMocGRldiwgMSA8
PCBNVElQX0FCQVIpOwo+IC0KPiAgaW9tYXBfZXJyOgoKTm93IG9uZSBvZiB0aGUgbGFiZWxzIGlz
IHJlZHVuZGFudC4KCj4gICAgICAgICBrZnJlZShkZCk7Cj4gICAgICAgICBwY2lfc2V0X2RydmRh
dGEocGRldiwgTlVMTCk7CgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
