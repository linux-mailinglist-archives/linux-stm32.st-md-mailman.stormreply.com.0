Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C5995F792
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 19:13:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C567C7801A;
	Mon, 26 Aug 2024 17:13:05 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64DA6C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 17:12:58 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so522034666b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 10:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724692378; x=1725297178;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C5FXLuFC4tgnhX12okZbEegr8EajQMblPAiafgd65pE=;
 b=JLu2BrkTgQWAcf69Dz/6ms4AVDyCE1Au0YI4Lf4fgOWYHG4hdBe2gmd76mir++e8h/
 ecCG3GVHfLxJ6VdIJrPdIlY8sE1O7sQsBP5CfSCTRBcVI30QOKD2MhqoB9CFB6fAe2VA
 USeZBxFRAAemcXJbbKjiVEahez3AYpsmkGebzuZVqLhcFOQc2fXGchkTpJMk4K/HXBL0
 h64ciGS29uoSkLqAYK+/Oy4Eo7oI4zTI+KznJduzlCcOwIqczpePLfXu/Eg4Ud3c2n5i
 YZPXTFyq+OFQ4xiqZmfUuEh0KLNzs0CUWASg2rpv0I7iiZR2oR2W7lXmKFe6R0ZVmlns
 o5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724692378; x=1725297178;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C5FXLuFC4tgnhX12okZbEegr8EajQMblPAiafgd65pE=;
 b=LkySJFgIM/vLVvJQFeUKzNUs6xjTDB/maUW92y6diDo9JBX/lcPKo7yWucMwfcDtEv
 0tmxBjN2nwwhgq7ao4j+KqGifVRuTNUiNy/sMZHv80WbUsnTDI92zOB28zM3JCtGWfAJ
 YR1nEZyvCMSorGkv1ekIJgi8lYQFK14+/C8Av8Yq7Njs8ASODItXMziBT+CwNndN9X+P
 hUoU1drwAcpyUL+vhIuN4N70Mrgb4dZbdo4kZsy9Sle1pZQHoUnu7D2Oxz8n6/2wf0C5
 PIPsLFV+7pKKNKZUQYxZkG8dMoszTOzQcNH0HCl2DVmRK3cSKZsEuOiz3BfHQlHZyVdJ
 cR7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpf7asvSM0V+Gu4CdpoDozLWdjc1Cx7QF9kJnrdUSv/rWnigsEhiSup5ikaBhd8FHC7ggNgIZiudaBvg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yybrj1PZy8aZ7dB+kqn18VogfSS9guxtqogVGnCdGCCVLuE5Rzc
 fuuPLmPJ3uxnLgDBVLoxjH4NXk5AMio7iFeOdX68YlFi4O4v48cRe2qslDE6FBYLXPuolYHAUIk
 3dERbJiSVVA2rUQ6IV/IruV1dCk0=
X-Google-Smtp-Source: AGHT+IHOnow3s0g1qCPDF0qgfwkSpamrc3MZdI/hWzuSVu2jgy51rNUKPxKvH0/02EJM/ysKZeVBGzzN4FAWZd6sxPU=
X-Received: by 2002:a17:906:c105:b0:a86:9644:2a60 with SMTP id
 a640c23a62f3a-a86a5162f4fmr872581066b.6.1724692377440; Mon, 26 Aug 2024
 10:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240822134744.44919-1-pstanner@redhat.com>
 <20240822134744.44919-6-pstanner@redhat.com>
 <ZsdO2q8uD829hP-X@smile.fi.intel.com>
 <ad6af1c4194873e803df65dc4d595f8e4b26cb33.camel@redhat.com>
 <CAHp75VfKS_PWer2hEH8x0qgBUEPx05p8BA=c0UirAWjg0SaLeA@mail.gmail.com>
 <f2d6345a8a684f62035108d74938ec0b2e162019.camel@redhat.com>
In-Reply-To: <f2d6345a8a684f62035108d74938ec0b2e162019.camel@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 26 Aug 2024 20:12:20 +0300
Message-ID: <CAHp75VcgWdCOs0b51pqReLAMArno7FekYxiJmNnBTcdgGAyJMw@mail.gmail.com>
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

T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgNjo1MuKAr1BNIFBoaWxpcHAgU3Rhbm5lciA8cHN0YW5u
ZXJAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gT24gTW9uLCAyMDI0LTA4LTI2IGF0IDE4OjQxICswMzAw
LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6CgouLi4KCj4gVGhvdWdoIGlmIGl0IGhhcyAwIGRpc2Fk
dmFudGFnZXMgSSdkIHByb3Bvc2UgcHJvcG9zaW5nIHRvIHRoZSBnaXQtZGV2cwo+IHRvIG1ha2Ug
aXQgdGhlIGRlZmF1bHQuCgpJdCdzIHNsb3dlci4gc28gdGhlIHBlb3BsZSBmcm9tIGh0dHBzOi8v
b2NjLmRlYWRuZXQuc2UvYWJvdXQvIHdvbid0IGJlIGhhcHB5LgpBbmQgbW9yZSBwb3dlciBjb25z
dW1pbmcsIHNvIG1heWJlIG5vdCBzbyBlbnZpcm9ubWVudCBmcmllbmRseSBhZnRlciBhbGwgOi1Q
CgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
