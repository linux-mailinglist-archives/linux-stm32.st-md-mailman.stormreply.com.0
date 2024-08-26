Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B35495F55D
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 17:42:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0FF6C7801A;
	Mon, 26 Aug 2024 15:42:21 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66467C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 15:42:14 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-533521cd1c3so5170914e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724686933; x=1725291733;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FH/rM9r8vy15gTO0SvqG09ShUwI8MYLfcApXi3x19VU=;
 b=Yg7/RJZ8fBIOw/dFc+/Yd+Zf/VxVWcuQnWqszSiJ/G9XPOBw5wr1o1C82PYS/Lc44Y
 Zho09ulMxyX7FdM8o4YZPU3DX+aN+BtesiwvjxyiYrCaAqUhErezDDfSIcZ9NA/usWFa
 pXFYAcK9LmvyeU4jc++K2oeGKdg4vQkfhFH09qWYeWSibKbxUjouZDZnybnpT0/KpNvK
 8NeUqtybHyaFBkpZheZ/JrNS9sww2X4fcV7lgnzfximmkGAiS9E32RKiFSv8e1EjYphe
 OslGbeTGsdyozqxlP3/Ayil2hstzWSRBuTgqeRXTO0NlBhTRq4Y6qqbIVqr9WLSH7brw
 yJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724686933; x=1725291733;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FH/rM9r8vy15gTO0SvqG09ShUwI8MYLfcApXi3x19VU=;
 b=PzW0olHUNzX8ifHNsqaN0s8YoZBLzt/cO0PCFO2tFQvYanOwWIMqtC+JoasmBHzyqa
 0oIdiF0BjW7z5KMAQ0chPQp+FZ5Drh3FGZZpgrb6eiapBijJxUa6EzCD4XelslmZGvMM
 KiN/g0dLJxYm5hd6iTw8ptE1SWEFOLtl1nfTh2dYcan6p/wU2BFgaCmnxiN94syMk4VI
 upCMjCNjhP5ERXbVtq4LF71mIUNMobXmooZwWTRBhWHCBjDPgOUWya4oXy2aOanFP24o
 ErFs9qxTSJy8m4E3pO6827XvdF1pqLJZwk2oAOutEO6/eSbSJk+DhljzPa6IxcN6tupF
 bCRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv2Pt4HE1t9MtsBP9rcN5aCCQJkdlFe9XOgjMrExNbeWukz4zj1dkFJ6vD1ujFt3DfvdoL+OCBH+3FpQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzYXC4UXD85xN3qbP0k3KVwhpXgaFB/nR2IA0XvQbQFOi6f6Lka
 wP8dNNpiCMyk8yfjzqBX2heIMb0TnhOMyLspsLB13GqBsO6BIYZk/6tQ3bkylJk6yy9Ecp+Sjfg
 TjAhGVBABy0+hm0crxwITSeyLf/8=
X-Google-Smtp-Source: AGHT+IEO+gUPPoFWhnVIZyFPIRMKkPjZZ1g7sFSpxYSDeKMazFoujBp34K9I3yoSDp0PEZ365NhxrirOyyk84oqJOVc=
X-Received: by 2002:ac2:4e06:0:b0:52e:936e:a237 with SMTP id
 2adb3069b0e04-53438846debmr7930724e87.16.1724686932982; Mon, 26 Aug 2024
 08:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240822134744.44919-1-pstanner@redhat.com>
 <20240822134744.44919-6-pstanner@redhat.com>
 <ZsdO2q8uD829hP-X@smile.fi.intel.com>
 <ad6af1c4194873e803df65dc4d595f8e4b26cb33.camel@redhat.com>
In-Reply-To: <ad6af1c4194873e803df65dc4d595f8e4b26cb33.camel@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 26 Aug 2024 18:41:36 +0300
Message-ID: <CAHp75VfKS_PWer2hEH8x0qgBUEPx05p8BA=c0UirAWjg0SaLeA@mail.gmail.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Wu Hao <hao.wu@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Chaitanya Kulkarni <kch@nvidia.com>,
 Richard Cochran <richardcochran@gmail.com>, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 David Lechner <dlechner@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fpga@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 5/9] ethernet: cavium: Replace
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

T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgNTo1MeKAr1BNIFBoaWxpcHAgU3Rhbm5lciA8cHN0YW5u
ZXJAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gT24gVGh1LCAyMDI0LTA4LTIyIGF0IDE3OjQ0ICswMzAw
LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAyMiwgMjAyNCBhdCAwMzo0
NzozN1BNICswMjAwLCBQaGlsaXBwIFN0YW5uZXIgd3JvdGU6CgouLi4KCj4gPiA+IC0gICBlcnIg
PSBwY2ltX2lvbWFwX3JlZ2lvbnMocGRldiwgMSA8PCBQQ0lfUFRQX0JBUl9OTywKPiA+ID4gcGNp
X25hbWUocGRldikpOwo+ID4gPiAtICAgaWYgKGVycikKPiA+ID4gKyAgIGNsb2NrLT5yZWdfYmFz
ZSA9IHBjaW1faW9tYXBfcmVnaW9uKHBkZXYsIFBDSV9QVFBfQkFSX05PLAo+ID4gPiBwY2lfbmFt
ZShwZGV2KSk7Cj4gPiA+ICsgICBpZiAoSVNfRVJSKGNsb2NrLT5yZWdfYmFzZSkpIHsKPiA+ID4g
KyAgICAgICAgICAgZXJyID0gUFRSX0VSUihjbG9jay0+cmVnX2Jhc2UpOwo+ID4gPiAgICAgICAg
ICAgICBnb3RvIGVycm9yX2ZyZWU7Cj4gPiA+IC0KPiA+ID4gLSAgIGNsb2NrLT5yZWdfYmFzZSA9
IHBjaW1faW9tYXBfdGFibGUocGRldilbUENJX1BUUF9CQVJfTk9dOwo+ID4gPiArICAgfQo+ID4K
PiA+IFBlcmhhcHMKPiA+Cj4gPiAgICAgICBjbG9jay0+cmVnX2Jhc2UgPSBwY2ltX2lvbWFwX3Jl
Z2lvbihwZGV2LCBQQ0lfUFRQX0JBUl9OTywKPiA+IHBjaV9uYW1lKHBkZXYpKTsKPiA+ICAgICAg
IGVyciA9IFBUUl9FUlJfT1JfWkVSTyhjbG9jay0+cmVnX2Jhc2UpOwo+ID4gICAgICAgaWYgKGVy
cikKPiA+ICAgICAgICAgICAgICAgZ290byBlcnJvcl9mcmVlOwo+ID4KPiA+IFRoaXMgd2lsbCBt
YWtlIHlvdXIgcGF0Y2ggc21hbGxlciBhbmQgbmVhdGVyLgo+ID4KPiA+IFAuUy4gRG8geW91IHVz
ZSAtLWhpc3RvZ3JhbSBkaWZmIGFsZ28gd2hlbiBwcmVwYXJpbmcgcGF0Y2hlcz8KPgo+IFNvIGZh
ciBub3QuCj4gU2hvdWxkIG9uZSBkbyB0aGF0PwoKSWQgZG9lc24ndCBhbHRlciB5b3VyIGNvZGUs
IGl0J3MgaW4gYWRkaXRpb24gdG8gd2hhdCBJIHN1Z2dlc3RlZCwgYnV0CmFzIExpbnVzIHNoYXJl
ZCB0aGF0IHRoZXJlIGlzIG5vIHJlYXNvbiB0byBhdm9pZCB1c2luZyAtLWhpc3RvZ3JhbSBub3QK
b25seSBpbiBMaW51eCBrZXJuZWwsIGJ1dCBpbiBnZW5lcmFsIGFzIGl0IHByb2R1Y2VzIG1vcmUK
aHVtYW4tcmVhZGFibGUgZGlmZjpzLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZj
aGVua28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
