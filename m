Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0AC95966C
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 10:23:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15DCCC6DD9A;
	Wed, 21 Aug 2024 08:23:07 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4B9CC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 08:22:59 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a8643235f99so243004966b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724228579; x=1724833379;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQJjqDz75DIjtI14ka6f6g6hkoeor8vPcSYTvVZiR7E=;
 b=Oo0wdxxLBiL9vX2qUr9w3m32AGQg8Wlt5Zavl5Hn+En0JKztBFQAAjhNHggTn7WRHP
 ILiC1XL2kHN0yGKYxUv9fJeVyAcjaQmc1j7jVnohzYwDq1ofqTKGMUKaG9g95DputwWL
 kI0Fm+1B1mQGk5iW1FVFrVK0zx5EaFs4IYVT3CZZmsjE/w2lrj7RyW2f+GzrYTQiT7/H
 2XlH2iHOxR/ZSAE6z6myGUONf5huFYmApqDslVsGVx062/EKvIlrKv7dr+tafgiRI3U3
 ESUcaDPDLgeZg9DnhLJTdvxPRzS8f/Miv2tNLC5NW5GVbXJacldx0gp0rGKhzfKJRqJ/
 HREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724228579; x=1724833379;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MQJjqDz75DIjtI14ka6f6g6hkoeor8vPcSYTvVZiR7E=;
 b=HukOzyj4vfGln5mImlJpXnD3DH50CAkK6TwFDFGwc1EPI7ISTrQRG/epJ/OoE94uHG
 X2aG8ezf4bwyChCl8bcuVPxHfKis7MLfeML1tddlbcYlfZ/IFytSi4idPBrop8r8uQ8X
 6XUwJHkL5m30gjPTEHBRM7IB06w3CwD1KtJAz0ozwnGfWVs1y5xPITux8p4yuVB2tjfw
 yRJDh8OKgm/kX8KnPjRwOeX6Xga607Dih8SZVj4lWMR5ZKvDKrveRRIPT3dP31bAkFdt
 2KGVS8V4oE28qBGusQ2cJpCaUomA3j1cUId6gULK+8IuYtiROdkqegvgAQbVqnAFSNvU
 r6Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSuky51HVv0rWuCv7ZrzANNdZnHvcjhTALqWOOCL13XDmhWded1zIADnAi5BoxKDJtnOWTPWV5a5jkLg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyEeod8MD8KUY4PLa1EhrTKOU0t5CCNXa0bWNVqZ4XRkm39uusX
 hbfu+yp8uTBsO/k5WMGx1/y/vMDxYkdiYXbn8NEKn7w7j21kWx6vNmrri0lvm+WiyI76VQeSE0B
 uyEHA+vzjk+5JOv+cKV3IH/VAxhQ=
X-Google-Smtp-Source: AGHT+IFIFdj7MeWYmPsiZH+WByhUHnKbrwVECRxS82N0iKD7flWPDhWf1z7riSsL+51FW+V5a66YfnwTfRw3oCdVfqc=
X-Received: by 2002:a17:907:f784:b0:a7a:9d1e:3b25 with SMTP id
 a640c23a62f3a-a866f36312emr101512566b.30.1724228578962; Wed, 21 Aug 2024
 01:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240821071842.8591-2-pstanner@redhat.com>
 <20240821071842.8591-4-pstanner@redhat.com>
In-Reply-To: <20240821071842.8591-4-pstanner@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Aug 2024 11:22:22 +0300
Message-ID: <CAHp75Vey-zwZG3FrU2fr0ZiQXBO7SV4UfoeutVwVPfk6vKvuTw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 2/9] fpga/dfl-pci.c: Replace deprecated
	PCI functions
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
bGUoKSwgcGNpbV9pb21hcF9yZWdpb25zX3JlcXVlc3RfYWxsKCkiKS4KPgo+IFBvcnQgZGZsLXBj
aS5jIHRvIHRoZSBzdWNjZXNzb3IsIHBjaW1faW9tYXBfcmVnaW9uKCkuCj4KPiBDb25zaXN0ZW50
bHksIHJlcGxhY2UgcGNpbV9pb3VubWFwX3JlZ2lvbnMoKSB3aXRoIHBjaW1faW91bm1hcF9yZWdp
b24oKS4KCj4gIHN0YXRpYyB2b2lkIF9faW9tZW0gKmNjaV9wY2lfaW9yZW1hcF9iYXIwKHN0cnVj
dCBwY2lfZGV2ICpwY2lkZXYpCj4gIHsKPiAtICAgICAgIGlmIChwY2ltX2lvbWFwX3JlZ2lvbnMo
cGNpZGV2LCBCSVQoMCksIERSVl9OQU1FKSkKPiArICAgICAgIHZvaWQgX19pb21lbSAqYmFyMDsK
PiArCj4gKyAgICAgICBiYXIwID0gcGNpbV9pb21hcF9yZWdpb24ocGNpZGV2LCAwLCBEUlZfTkFN
RSk7Cj4gKyAgICAgICBpZiAoSVNfRVJSKGJhcjApKQo+ICAgICAgICAgICAgICAgICByZXR1cm4g
TlVMTDsKPgo+IC0gICAgICAgcmV0dXJuIHBjaW1faW9tYXBfdGFibGUocGNpZGV2KVswXTsKPiAr
ICAgICAgIHJldHVybiBiYXIwOwo+ICB9CgpOb3cgdGhpcyBiZWNvbWVzIGFuIHVubmVlZGVkIHdy
YXBwZXIgb24gcGNpbV9pb3JlbWFwX3JlZ2lvbigpLiBDYW4gd2UKa2lsbCB0aGlzIGhlbHBlciBj
b21wbGV0ZWx5PwoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
