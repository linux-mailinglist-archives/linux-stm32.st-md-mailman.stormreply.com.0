Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ADE95F593
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 17:52:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89E95C7801A;
	Mon, 26 Aug 2024 15:52:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 891EDC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 15:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724687526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dwazc+e0kXeS2xTQ712+0BIKFANt7k7hBlcLvCAFWPU=;
 b=e3FIzBZv0Hz32L1TuWGAEqcXh08IH0x7Lx5jYTzEncSKtvkEHFz/C8+6Qv9ZDgaKJXX6dV
 DPNVfAIFDexax9KOZNnjrhRSuck18vVR2tiODw3gCeoRaDGftiQSTnnw6/isBH2mvkQsjE
 /DjFLCEo3GPWtDMgObc1wTfG3WUS+xM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-WaD7CvepN_yI1sUU6wwSEw-1; Mon, 26 Aug 2024 11:52:05 -0400
X-MC-Unique: WaD7CvepN_yI1sUU6wwSEw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3718bf7d54aso2938989f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 08:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724687524; x=1725292324;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dwazc+e0kXeS2xTQ712+0BIKFANt7k7hBlcLvCAFWPU=;
 b=b5SoVpQYGyXsJchWWdnPEidnzWg5nlO3OeuaxWlvHUnF11zmxXGiYw1K3Kyh6QZNpU
 +mypNEvHz8pBOQveirYsJ8ttrTOI4SqrZC//fDZub40nLwWPuwUY2vHN9hVeO1A9I005
 8UIxJXh1N642q9kGp7JEG0S66nqtLu5J9/n6nPOpqzqgH5HPpmF6b0H0rmcYU83cOzlb
 bXTA9cmuHW2+zijVj71nPO0nZTDPEQjVrvDCv/rWVfgT41HEwTAaTkR13gdvdLiLeXXN
 QdxBXz4FmjAPL6yjQ6ubGOdd3NV1eYjVqu7WQswxLYXWPpODIeIN3ynNu6K3OuMIyEsY
 6xaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtPBFyfuMhVWMoV8EBilLqtXwv0l0KnbhYnHfYwR8WKVNDJBDMpzJHuaUCAuNXq5+xxBk1z8w62lPH+A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw3u3uvnPIiWl2yeiAOYCliD/NxCpAzQ9d3bFVAQJr+grEEF+OE
 GGFc92G1H6cv16D2RyFZSBlRaTMKhatwYvUR5QgBkv9kLFyKIYvSOFXgYEW2ywq3Egwt2G+ZWeF
 r6vRIfKwawYDLKX3/R1KI46D2+6pCJIWsEU1uGubZoAZkxZ+RXKfWRS6o6vsDXkg/mbRcOP7a/Z
 uhbw==
X-Received: by 2002:adf:e44b:0:b0:360:7c4b:58c3 with SMTP id
 ffacd0b85a97d-3748c835e08mr49204f8f.54.1724687524279; 
 Mon, 26 Aug 2024 08:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxAzHOXHhnfnYaxqHhgL/uz7vF7Nw5k64KjkexckDk+9QWCj+MHZcvnBNc7cGqudRMU7r7fA==
X-Received: by 2002:adf:e44b:0:b0:360:7c4b:58c3 with SMTP id
 ffacd0b85a97d-3748c835e08mr49174f8f.54.1724687523730; 
 Mon, 26 Aug 2024 08:52:03 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730814602asm11021638f8f.44.2024.08.26.08.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 08:52:02 -0700 (PDT)
Message-ID: <f2d6345a8a684f62035108d74938ec0b2e162019.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 26 Aug 2024 17:52:00 +0200
In-Reply-To: <CAHp75VfKS_PWer2hEH8x0qgBUEPx05p8BA=c0UirAWjg0SaLeA@mail.gmail.com>
References: <20240822134744.44919-1-pstanner@redhat.com>
 <20240822134744.44919-6-pstanner@redhat.com>
 <ZsdO2q8uD829hP-X@smile.fi.intel.com>
 <ad6af1c4194873e803df65dc4d595f8e4b26cb33.camel@redhat.com>
 <CAHp75VfKS_PWer2hEH8x0qgBUEPx05p8BA=c0UirAWjg0SaLeA@mail.gmail.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org,
 Eugenio =?ISO-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
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

T24gTW9uLCAyMDI0LTA4LTI2IGF0IDE4OjQxICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgNTo1MeKAr1BNIFBoaWxpcHAgU3Rhbm5lciA8cHN0
YW5uZXJAcmVkaGF0LmNvbT4KPiB3cm90ZToKPiA+IE9uIFRodSwgMjAyNC0wOC0yMiBhdCAxNzo0
NCArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4gPiBPbiBUaHUsIEF1ZyAyMiwgMjAy
NCBhdCAwMzo0NzozN1BNICswMjAwLCBQaGlsaXBwIFN0YW5uZXIgd3JvdGU6Cj4gCj4gLi4uCj4g
Cj4gPiA+ID4gLcKgwqAgZXJyID0gcGNpbV9pb21hcF9yZWdpb25zKHBkZXYsIDEgPDwgUENJX1BU
UF9CQVJfTk8sCj4gPiA+ID4gcGNpX25hbWUocGRldikpOwo+ID4gPiA+IC3CoMKgIGlmIChlcnIp
Cj4gPiA+ID4gK8KgwqAgY2xvY2stPnJlZ19iYXNlID0gcGNpbV9pb21hcF9yZWdpb24ocGRldiwg
UENJX1BUUF9CQVJfTk8sCj4gPiA+ID4gcGNpX25hbWUocGRldikpOwo+ID4gPiA+ICvCoMKgIGlm
IChJU19FUlIoY2xvY2stPnJlZ19iYXNlKSkgewo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oCBlcnIgPSBQVFJfRVJSKGNsb2NrLT5yZWdfYmFzZSk7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIGVycm9yX2ZyZWU7Cj4gPiA+ID4gLQo+ID4gPiA+IC3CoMKgIGNsb2NrLT5y
ZWdfYmFzZSA9IHBjaW1faW9tYXBfdGFibGUocGRldilbUENJX1BUUF9CQVJfTk9dOwo+ID4gPiA+
ICvCoMKgIH0KPiA+ID4gCj4gPiA+IFBlcmhhcHMKPiA+ID4gCj4gPiA+IMKgwqDCoMKgwqAgY2xv
Y2stPnJlZ19iYXNlID0gcGNpbV9pb21hcF9yZWdpb24ocGRldiwgUENJX1BUUF9CQVJfTk8sCj4g
PiA+IHBjaV9uYW1lKHBkZXYpKTsKPiA+ID4gwqDCoMKgwqDCoCBlcnIgPSBQVFJfRVJSX09SX1pF
Uk8oY2xvY2stPnJlZ19iYXNlKTsKPiA+ID4gwqDCoMKgwqDCoCBpZiAoZXJyKQo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycm9yX2ZyZWU7Cj4gPiA+IAo+ID4gPiBUaGlz
IHdpbGwgbWFrZSB5b3VyIHBhdGNoIHNtYWxsZXIgYW5kIG5lYXRlci4KPiA+ID4gCj4gPiA+IFAu
Uy4gRG8geW91IHVzZSAtLWhpc3RvZ3JhbSBkaWZmIGFsZ28gd2hlbiBwcmVwYXJpbmcgcGF0Y2hl
cz8KPiA+IAo+ID4gU28gZmFyIG5vdC4KPiA+IFNob3VsZCBvbmUgZG8gdGhhdD8KPiAKPiBJZCBk
b2Vzbid0IGFsdGVyIHlvdXIgY29kZSwgaXQncyBpbiBhZGRpdGlvbiB0byB3aGF0IEkgc3VnZ2Vz
dGVkLCBidXQKPiBhcyBMaW51cyBzaGFyZWQgdGhhdCB0aGVyZSBpcyBubyByZWFzb24gdG8gYXZv
aWQgdXNpbmcgLS1oaXN0b2dyYW0KPiBub3QKPiBvbmx5IGluIExpbnV4IGtlcm5lbCwgYnV0IGlu
IGdlbmVyYWwgYXMgaXQgcHJvZHVjZXMgbW9yZQo+IGh1bWFuLXJlYWRhYmxlIGRpZmY6cy4KCklm
IHRoZSBCb3NzIHNheXMgc28sIG9uZSBjYW4gc3VyZWx5IGRvIHRoYXQgXG8vCgpUaG91Z2ggaWYg
aXQgaGFzIDAgZGlzYWR2YW50YWdlcyBJJ2QgcHJvcG9zZSBwcm9wb3NpbmcgdG8gdGhlIGdpdC1k
ZXZzCnRvIG1ha2UgaXQgdGhlIGRlZmF1bHQuCgoKUC4KCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
