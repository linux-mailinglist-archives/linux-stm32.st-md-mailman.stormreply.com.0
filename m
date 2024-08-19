Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C73295738A
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 20:39:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB013C6DD72;
	Mon, 19 Aug 2024 18:39:20 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0CB1C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 18:39:13 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53212e0aa92so5204111e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 11:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724092753; x=1724697553;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SWpGCGgfSTInA73Lkq9d3XSm6SVeqmrSlW6/NUDvBMM=;
 b=H0anqrGb8mB+AtaWovp2aBCAu4/CKy/emzUg0AihJ9cGyhvtTPyX6R2JPYUInqaVAV
 DRGm/5DFYD5v0Mm8B7z/CSrRBtcj6ZxNg/fYEMgVPOylrakYt8G3AKv/F8I8AgCEbFcF
 K/6b51VFjM746XIVnT3LJhMt3WbOb6/o0XeBoQQYct91tGOX5xuXRCFFPogTvKYfb55S
 LyaDbd0IbriIfLP5qyKrXfPh116pgyDjKfd34szactckJNxXE6d/qzfQV6zlXMK3M6CE
 evmEX0V/cj17K87gdru/xhc0W8iWxsJZLY7lIkrj98hD8UT1VL9yoxw63E/drRWUH74W
 5NTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724092753; x=1724697553;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SWpGCGgfSTInA73Lkq9d3XSm6SVeqmrSlW6/NUDvBMM=;
 b=VTd6WQY1dpcmeB5JaHh9jqXxM4tS4jCQHt+dUzCMJd5Lo65PAb4AkGYCB+jNcV1RVx
 bxcRnXtBQqhdlfGyj7re0OJK0xBw6YkNSra8TBeaJnDg7KOGu1HPkmv7pmTVsRC2NEOF
 wFqVI3lE38uIWgHvsbT6hNBM2DSq+CEwoadMDpriPlruO7cTYr3/tJZuwrrjiKNORhli
 28f4bPldh0Uzpd2soVesqoh3QV0Am46O0bcWabF/5FsFsj0nC/47HpYn3MCfebIiEoWJ
 +xpMPFraxxW4FiE0iFCg7WVVoTcYF+vE/Zo77Y+FBnWjjdY6l4P4wFReYrgvgFkAbXKP
 PpYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ0UIZA38YO9T0nwU4ppJMm3heNkHgPqMbzSFq/0oqj8jPWT+8eugv2tUqWGDrXBv/XiUDBl3mC5Rsy7KIqktDp3bCGCSk/Gk174rNQhIglJfco7HAAEfZ
X-Gm-Message-State: AOJu0Ywy7oKoWIHqKwax1xh0Jlw9wO0PsSNsrbwSRdHobU0rZ/ZnCUaV
 hJ5ux8entbEdX7ZvCvAZllZqMdG5aODd6YWeOcDn775TwEquqOhXW7o6bmFU9Fy7OBGQZJV115x
 gqlwtndh7vHFRcS9PNm2LNknYt/uy528CLn+wrA==
X-Google-Smtp-Source: AGHT+IHelUVu+3Ik9JdWKk+zeumpW2YAF7qu0Ohxq5buMaU2cv0DmlPnfzkmnuU6AUlGRzMu60+m9UNlwGENsdtWTIk=
X-Received: by 2002:a05:6512:3e22:b0:533:d3e:16e6 with SMTP id
 2adb3069b0e04-5331c6af14dmr8387737e87.25.1724092752397; Mon, 19 Aug 2024
 11:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-7-pstanner@redhat.com>
In-Reply-To: <20240819165148.58201-7-pstanner@redhat.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 Aug 2024 20:39:01 +0200
Message-ID: <CAMRc=MdLsLeXqm+40wb4O2PmNX9C-g0is13berDF6yDQ1EBh+w@mail.gmail.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, onathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Wu Hao <hao.wu@intel.com>,
 Andy Shevchenko <andy@kernel.org>, Chaitanya Kulkarni <kch@nvidia.com>,
 Richard Cochran <richardcochran@gmail.com>, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, David Lechner <dlechner@baylibre.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fpga@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 5/9] gpio: Replace deprecated PCI functions
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

T24gTW9uLCBBdWcgMTksIDIwMjQgYXQgNjo1M+KAr1BNIFBoaWxpcHAgU3Rhbm5lciA8cHN0YW5u
ZXJAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBwY2ltX2lvbWFwX3JlZ2lvbnMoKSBhbmQgcGNpbV9p
b21hcF90YWJsZSgpIGhhdmUgYmVlbiBkZXByZWNhdGVkIGJ5IHRoZQo+IFBDSSBzdWJzeXN0ZW0g
aW4gY29tbWl0IGUzNTRiYjg0YTRjMSAoIlBDSTogRGVwcmVjYXRlCj4gcGNpbV9pb21hcF90YWJs
ZSgpLCBwY2ltX2lvbWFwX3JlZ2lvbnNfcmVxdWVzdF9hbGwoKSIpLgo+Cj4gUmVwbGFjZSB0aG9z
ZSBmdW5jdGlvbnMgd2l0aCBjYWxscyB0byBwY2ltX2lvbWFwX3JlZ2lvbigpLgo+Cj4gU2lnbmVk
LW9mZi1ieTogUGhpbGlwcCBTdGFubmVyIDxwc3Rhbm5lckByZWRoYXQuY29tPgo+IC0tLQoKQWNr
ZWQtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9y
Zz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
