Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C5F95965A
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 10:15:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7060CC6DD9A;
	Wed, 21 Aug 2024 08:15:06 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBD1DC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 08:14:58 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a7ac469e4c4so90987166b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 01:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724228098; x=1724832898;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4/bwSEYo5Qt1Y4vdeeF4jF0uVtsiIk4nNlCmcuIeMvU=;
 b=Ok11Ccps+iGUf+z7+YsmoI33Haapkp4Wu2xPRZse0eydYu8hWlNcL31ZW7IcUIwPjQ
 O/boIW7OIqaPTeWziA4kvvJqSrYNuRYdZ9bIBafudgsaPF6w43NhJNXq0nYJMyB27lIW
 w3f/zXPiac+SJ5OtYUh5Y5cQ6ZQDTNPDqj0iVDQ60CiM6bSAvDlQQFZo6jwwv9PCRzQ5
 PPZnCQfaNjhaxqd+qXWOCJ294+XL5jGhJ9JuKMXQNq+VTWCJnZXNUnTv4XStT0R/iO3v
 U/1JBjwJ0fS47UeZg9ChNJLe0gvbmkjvEGwogs+8u1G5mr5KSAVtT25WwJ4RGAzCtiE8
 SWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724228098; x=1724832898;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4/bwSEYo5Qt1Y4vdeeF4jF0uVtsiIk4nNlCmcuIeMvU=;
 b=OP+ajvTX19J59cisigqfTAiUKyQExHPjueD1/axd1zFH7lnW5ClkCmRq0IQXLf+1dm
 qlaiSx++8snr8w6Cb38lEa1fHmG3pn5tXz/pmEVP/ObzBDVyidqype7eIB1FuibhQhY0
 4sXtrgIQWepq2aBnD0vAD9qwvoQAvUNJDxPtXjKdqrZ3lLzq9xN+QH2dP9281R0K0bdp
 5mYEl2BE5lG1olYOL6nKVw1gW7IbK08iDjrNkGJjxv1byKGAiGK+4Q7pqVD7RuX73AO6
 k5eR2V3CY+Vf76eVpPvChIKrY5Iq4UnxxEwxHH6RqJ/VoNvpJ4FaQLi2rcCUBnz5xvj4
 kHxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7t6IGemKo4dEJhFmt5Y6oUctrT+UecsL/ZCAkQOKPNVXc6C2UeD9cFhmFVQsDf9Hw5wSKtkK0sllqBA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyOOljMz3g0HB0Tpqm9WM91OaPK3xGeigLb+d9gX7oQKIcI4YIg
 Yk0nTeOCI9RbK41NAHrXNB0UWANulGuuO0xqWVqG6vL91UWG2eykVEtbPibaYJot8Z3VcKliXeq
 piNYwUXdfha0EwAFgwb5JqhqFQgs=
X-Google-Smtp-Source: AGHT+IHXeDFRnTQE0pLZlEZNONDmr3JlN5sqQBHhtFZ2nKA4GnNGhGlYKiud1j1pywVXDIqvTC/jKaVR2p6DxNez5+c=
X-Received: by 2002:a17:907:1b1e:b0:a80:f616:5cf9 with SMTP id
 a640c23a62f3a-a866fbfda68mr155136066b.0.1724228097818; Wed, 21 Aug 2024
 01:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240821071842.8591-2-pstanner@redhat.com>
 <20240821071842.8591-8-pstanner@redhat.com>
In-Reply-To: <20240821071842.8591-8-pstanner@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Aug 2024 11:14:21 +0300
Message-ID: <CAHp75VduuT=VLtXS+zha4ZNe3ZvBV-jgZpn2oP4WkzDdt6Pnog@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 6/9] ethernet: stmicro: Simplify PCI
	devres usage
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
bmVyQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gc3RtaWNybyB1c2VzIFBDSSBkZXZyZXMgaW4gdGhl
IHdyb25nIHdheS4gUmVzb3VyY2VzIHJlcXVlc3RlZAo+IHRocm91Z2ggcGNpbV8qIGZ1bmN0aW9u
cyBkb24ndCBuZWVkIHRvIGJlIGNsZWFuZWQgdXAgbWFudWFsbHkgaW4gdGhlCj4gcmVtb3ZlKCkg
Y2FsbGJhY2sgb3IgaW4gdGhlIGVycm9yIHVud2luZCBwYXRoIG9mIGEgcHJvYmUoKSBmdW5jdGlv
bi4KCj4gTW9yZW92ZXIsIHRoZXJlIGlzIGFuIHVubmVjZXNzYXJ5IGxvb3Agd2hpY2ggb25seSBy
ZXF1ZXN0cyBhbmQgaW9yZW1hcHMKPiBCQVIgMCwgYnV0IGl0ZXJhdGVzIG92ZXIgYWxsIEJBUnMg
bmV2ZXJ0aGVsZXNzLgoKU2VlbXMgbGlrZSBsb29uZ3NvbiB3YXMgY2FyZ28tY3VsdGVkIGEgbG90
IHdpdGhvdXQgYSBjbGVhcgp1bmRlcnN0YW5kaW5nIG9mIHRoaXMgY29kZSBpbiB0aGUgbWFpbiBk
cml2ZXIuLi4KCj4gRnVydGhlcm1vcmUsIHBjaW1faW9tYXBfcmVnaW9ucygpIGFuZCBwY2ltX2lv
bWFwX3RhYmxlKCkgaGF2ZSBiZWVuCj4gZGVwcmVjYXRlZCBieSB0aGUgUENJIHN1YnN5c3RlbSBp
biBjb21taXQgZTM1NGJiODRhNGMxICgiUENJOiBEZXByZWNhdGUKPiBwY2ltX2lvbWFwX3RhYmxl
KCksIHBjaW1faW9tYXBfcmVnaW9uc19yZXF1ZXN0X2FsbCgpIikuCj4KPiBSZXBsYWNlIHRoZXNl
IGZ1bmN0aW9ucyB3aXRoIHBjaW1faW9tYXBfcmVnaW9uKCkuCj4KPiBSZW1vdmUgdGhlIHVubmVj
ZXNzYXJ5IG1hbnVhbCBwY2ltXyogY2xlYW51cCBjYWxscy4KPgo+IFJlbW92ZSB0aGUgdW5uZWNl
c3NhcnkgbG9vcCBvdmVyIGFsbCBCQVJzLgoKLi4uCgo+IC0gICAgICAgZm9yIChpID0gMDsgaSA8
IFBDSV9TVERfTlVNX0JBUlM7IGkrKykgewo+IC0gICAgICAgICAgICAgICBpZiAocGNpX3Jlc291
cmNlX2xlbihwZGV2LCBpKSA9PSAwKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVl
Owo+IC0gICAgICAgICAgICAgICBwY2ltX2lvdW5tYXBfcmVnaW9ucyhwZGV2LCBCSVQoaSkpOwoK
SGVyZSBpcyB0aGUgQkFSeCwgd2hpY2ggY29udHJhZGljdHMgdGhlIHByb2JlIDotKQoKPiAtICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gLSAgICAgICB9CgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFu
ZHkgU2hldmNoZW5rbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
