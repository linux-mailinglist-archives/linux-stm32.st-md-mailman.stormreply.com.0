Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F177959662
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 10:20:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEE29C6DD9A;
	Wed, 21 Aug 2024 08:20:14 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27AB1C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 08:20:07 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f3f163e379so21098751fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724228406; x=1724833206;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WdhYZISuTETd5XZ8LEV8qzxmVjQjEonrE8b5iyMQ2ws=;
 b=At4mCZLJhwNedb/Cnh4XIkMM/opoiKZ1NiDej7CJLa1/g7ZDd39MbXAX0lGcKJjhze
 T0RTJ4m6NOLBSG2tUIIxNLGOnblGgpW8yHv2DF06VApBhrblCUnCxvkJ/Ga2Y6a0FqaC
 8S4uPRMWAmVvUOCz0Y14qUg6/gU9t6K8d7g82bH972Rg8K5KUJ8vrXteCtk4kxErjIhK
 kF7DIH2ogfLN45PSvwa+bwK71Y/qkJ0o3/pGlsWIXWwqMlx2KA9ruWNppCVS/tdT20Se
 d9AD6GaSJHdB87MDkhnM/pRbmAi7sQlZj2v0uZVY12RQR1vH39beP/Lk+/SdAKPjyTDT
 JdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724228406; x=1724833206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WdhYZISuTETd5XZ8LEV8qzxmVjQjEonrE8b5iyMQ2ws=;
 b=XKuEoz6bnBMj++iiamuqjRL492sxcEsw1s+0PGRKv6wHjHghJD/bJ42JnixoproQHg
 TbbTEV3GFUEf6BSJNMJBUjbhHn8d5ITgAYzpn+610SGUxM4GvEmKUrygWkqRdG5ELwJE
 IuU54sn73QWUu1qfNKgYNRt74x2iiDe+DUyrs5sIGy7iWJi/T5OmdxnJlXqhe7aZ/FzZ
 3U4N3u0ZRrkZ9qfuesvj1jPPfVCdhEadQOj1UFCFrF8RfrdkcduUK8CHCfIz65IJEXx1
 lpDCW5fCSB0182lMFcHO9X7QVKNk8UoQeVF8sjZ8LJKCzaWkPNsX6O8wMavUO3rz4uND
 XuYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVTqhgGKGisvUsuUM7jybshAzgvF6OuyLNsf9bSGuR6i0fv4ChGCNZtJkRXrhO1Bk3I/rQ3PBr/guWhA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxMJrJ+yetn2f36datz1EV06Hi58Og7VG3TBUXExSQUGRtafSiG
 dPocbUpfxtVs5KwS9Wwu9sJwpVNwk6AK9uSFT+LLuvDMa32yt+n4ZKghV3aMFCbg1Zrh5YdWbtr
 sX/dkr/tQpOJKQaFs4qC1xn00zok=
X-Google-Smtp-Source: AGHT+IGy365Pc9TKJF5GAK0armKU9Hpgj1dovYSvRFuHJ1yV+fMbVBAOtQzki539dYAOujtFA/EPC2D0nPczB6xkNv0=
X-Received: by 2002:a2e:854f:0:b0:2f1:67de:b536 with SMTP id
 38308e7fff4ca-2f3f8890618mr10493191fa.24.1724228406003; Wed, 21 Aug 2024
 01:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240821071842.8591-2-pstanner@redhat.com>
 <20240821071842.8591-10-pstanner@redhat.com>
In-Reply-To: <20240821071842.8591-10-pstanner@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Aug 2024 11:19:30 +0300
Message-ID: <CAHp75Ve13TpA+OdUbiehZORjbNEi9qjJK3bg=C5CscoC=G=f4Q@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 8/9] vdap: solidrun: Replace deprecated
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
bmVyQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gc29saWRydW4gdXRpbGl6ZXMgcGNpbV9pb21hcF9y
ZWdpb25zKCksIHdoaWNoIGhhcyBiZWVuIGRlcHJlY2F0ZWQgYnkgdGhlCj4gUENJIHN1YnN5c3Rl
bSBpbiBjb21taXQgZTM1NGJiODRhNGMxICgiUENJOiBEZXByZWNhdGUKPiBwY2ltX2lvbWFwX3Rh
YmxlKCksIHBjaW1faW9tYXBfcmVnaW9uc19yZXF1ZXN0X2FsbCgpIiksIGFtb25nIG90aGVyCj4g
dGhpbmdzIGJlY2F1c2UgaXQgZm9yY2VzIHVzYWdlIG9mIHF1aXRlIGEgY29tcGxpY2F0ZWQgYml0
bWFzayBtZWNoYW5pc20uCj4gVGhlIGJpdG1hc2sgaGFuZGxpbmcgY29kZSBjYW4gZW50aXJlbHkg
YmUgcmVtb3ZlZCBieSByZXBsYWNpbmcKPiBwY2ltX2lvbWFwX3JlZ2lvbnMoKSBhbmQgcGNpbV9p
b21hcF90YWJsZSgpLgo+Cj4gUmVwbGFjZSBwY2ltX2lvbWFwX3JlZ2lvbnMoKSBhbmQgcGNpbV9p
b21hcF90YWJsZSgpIHdpdGgKPiBwY2lfaW9tYXBfcmVnaW9uKCkuCgouLi4KCj4gIHN0YXRpYyBp
bnQgc25ldF9vcGVuX3ZmX2JhcihzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0IHNuZXQgKnNu
ZXQpCj4gIHsKPiAgICAgICAgIGNoYXIgbmFtZVs1MF07Cj4gLSAgICAgICBpbnQgcmV0Owo+Cj4g
ICAgICAgICBzbnByaW50ZihuYW1lLCBzaXplb2YobmFtZSksICJzbmV0WyVzXS1iYXIiLCBwY2lf
bmFtZShwZGV2KSk7CgpTaG91bGRuJ3QgdGhpcyBiZSBhbHNvIGRldm1fa2FzcHJpbnRmKCk/Cgo+
ICAgICAgICAgLyogUmVxdWVzdCBhbmQgbWFwIEJBUiAqLwo+IC0gICAgICAgcmV0ID0gcGNpbV9p
b21hcF9yZWdpb25zKHBkZXYsIEJJVChzbmV0LT5wc25ldC0+Y2ZnLnZmX2JhciksIG5hbWUpOwo+
IC0gICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgc25ldC0+YmFyID0gcGNpbV9pb21hcF9yZWdp
b24ocGRldiwgc25ldC0+cHNuZXQtPmNmZy52Zl9iYXIsIG5hbWUpOwo+ICsgICAgICAgaWYgKElT
X0VSUihzbmV0LT5iYXIpKSB7Cj4gICAgICAgICAgICAgICAgIFNORVRfRVJSKHBkZXYsICJGYWls
ZWQgdG8gcmVxdWVzdCBhbmQgbWFwIFBDSSBCQVIgZm9yIGEgVkZcbiIpOwo+IC0gICAgICAgICAg
ICAgICByZXR1cm4gcmV0Owo+ICsgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihzbmV0LT5i
YXIpOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBzbmV0LT5iYXIgPSBwY2ltX2lvbWFwX3RhYmxl
KHBkZXYpW3NuZXQtPnBzbmV0LT5jZmcudmZfYmFyXTsKPiAtCj4gICAgICAgICByZXR1cm4gMDsK
PiAgfQoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
