Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5510C957F95
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 09:30:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F112CC6DD66;
	Tue, 20 Aug 2024 07:30:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4A0FC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 07:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724138999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AlJM5Qv/GX1s6egsP+eZlh57ESRHviZz0UwPlmxz6+w=;
 b=NzoalZini66av893UJI3DF554hu5qjZ15I+KY0BcxwpTMkWBP/wXTaHe7/I7m6S9pROYS4
 JviWGwuCW0QM8GjO5YkM8+p3O6d9SgfD0ivLnshbqib9sxDdjY0NNNC2uiTk+JFhtMhTmg
 30CmLTiOdGROQxSsRJQDC+lvmLy4Xtw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-sFLbq2SUOJmyaWPoJAHHFw-1; Tue, 20 Aug 2024 03:29:57 -0400
X-MC-Unique: sFLbq2SUOJmyaWPoJAHHFw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2f3ed3d9b03so202891fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 00:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724138996; x=1724743796;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v1KpD0+PO3KEd8vqUb0exw949el+ZQlXzH10gWUK9kY=;
 b=WLEo77pAa1Wo+tnXfI8TZjJyqD2GSsxEzuT6a5a2fECN0lA/2E7dyESclckglHExZz
 i4D6TDyijNRu2O0LnKw8MpcgDMsen9QMvZnXFJSCVPEqnrcJsH/G/UuDiEb/PGxC3VfO
 cBH/dVFuNqZd2/jEaC8nIeE6Y0WyTyYKpvlh9sF82cV+K3KmySMFyZ/2Q93POyU3E3Fu
 Apq2IuENnwxfnqPxz/Mrw7xlyAtHKjbqDpt5odxPFQBiyXBM4gPQl8HzmWCj2lomomz0
 X9ZOErU+qNEIZ3oS0cvG3qU3Ga9bFGx7kghrJhNPeCXSOJEaXhifQ51n+2zmxqCEbmC7
 U4sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1szoYLrwMrf6uK4fEZS553JR/2Tv1LrIkkTCsjkPAd0cXUHKYYIgA6IaDghyr081AJ0fUmhfZ5CtgOg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzsXd/kPb/J8OGbPVttZdet+UHtl1nbSmTw9niyWOJpF0vCoa+W
 nNEVk7cM0GanHqZx7+/RQgpSOll4LuAt6siJ8pH7yvBWG/l0BgSbrGyfBqHcsl1G9AOztuiHI7Z
 NFDmYI2Tk7Z/4gjsIYvm5I6kQ64Ao9dmDMKJ5UdUDaEQZEYz8OHE+dBCiBxmRrcYOai5kTMlOrZ
 PLGQ==
X-Received: by 2002:a05:6512:b26:b0:52e:9b87:2340 with SMTP id
 2adb3069b0e04-5331c6e45bdmr4732145e87.6.1724138995627; 
 Tue, 20 Aug 2024 00:29:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkOoAmJQBqRwOrXRXs1aVQSYuEizZw5AiMeBmrPImJpZCWeJexcEAw/Dy4dkV+vYq52Tea8Q==
X-Received: by 2002:a05:6512:b26:b0:52e:9b87:2340 with SMTP id
 2adb3069b0e04-5331c6e45bdmr4732103e87.6.1724138995010; 
 Tue, 20 Aug 2024 00:29:55 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dcc:1f00:bec1:681e:45eb:77e2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83839471b4sm725856366b.164.2024.08.20.00.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 00:29:54 -0700 (PDT)
Message-ID: <e406ba06180571564b47872f090623b19e4ad87e.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andy@kernel.org>
Date: Tue, 20 Aug 2024 09:29:52 +0200
In-Reply-To: <ZsOJONEA2x93bSpO@smile.fi.intel.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-6-pstanner@redhat.com>
 <ZsOJONEA2x93bSpO@smile.fi.intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael
 S. Tsirkin" <mst@redhat.com>, Alvaro Karsz <alvaro.karsz@solid-run.com>,
 Tom Rix <trix@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-pci@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, onathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org,
 Eugenio =?ISO-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Wu Hao <hao.wu@intel.com>,
 Chaitanya Kulkarni <kch@nvidia.com>,
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
Subject: Re: [Linux-stm32] [PATCH 4/9] block: mtip32xx: Replace deprecated
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

T24gTW9uLCAyMDI0LTA4LTE5IGF0IDIxOjA0ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gTW9uLCBBdWcgMTksIDIwMjQgYXQgMDY6NTE6NDRQTSArMDIwMCwgUGhpbGlwcCBTdGFu
bmVyIHdyb3RlOgo+ID4gcGNpbV9pb21hcF9yZWdpb25zKCkgYW5kIHBjaW1faW9tYXBfdGFibGUo
KSBoYXZlIGJlZW4gZGVwcmVjYXRlZCBieQo+ID4gdGhlCj4gPiBQQ0kgc3Vic3lzdGVtIGluIGNv
bW1pdCBlMzU0YmI4NGE0YzEgKCJQQ0k6IERlcHJlY2F0ZQo+ID4gcGNpbV9pb21hcF90YWJsZSgp
LCBwY2ltX2lvbWFwX3JlZ2lvbnNfcmVxdWVzdF9hbGwoKSIpLgo+ID4gCj4gPiBJbiBtdGlwMzJ4
eCwgdGhlc2UgZnVuY3Rpb25zIGNhbiBlYXNpbHkgYmUgcmVwbGFjZWQgYnkgdGhlaXIKPiA+IHJl
c3BlY3RpdmUKPiA+IHN1Y2Nlc3NvcnMsIHBjaW1fcmVxdWVzdF9yZWdpb24oKSBhbmQgcGNpbV9p
b21hcCgpLiBNb3Jlb3ZlciwgdGhlCj4gPiBkcml2ZXIncyBjYWxsIHRvIHBjaW1faW91bm1hcF9y
ZWdpb25zKCkgaXMgbm90IG5lY2Vzc2FyeSwgYmVjYXVzZQo+ID4gaXQncwo+ID4gaW52b2tlZCBp
biB0aGUgcmVtb3ZlKCkgZnVuY3Rpb24uIENsZWFudXAgY2FuLCBoZW5jZSwgYmUgcGVyZm9ybWVk
Cj4gPiBieQo+ID4gUENJIGRldnJlcyBhdXRvbWF0aWNhbGx5Lgo+ID4gCj4gPiBSZXBsYWNlIHBj
aW1faW9tYXBfcmVnaW9ucygpIGFuZCBwY2ltX2lvbWFwX3RhYmxlKCkuCj4gPiAKPiA+IFJlbW92
ZSB0aGUgY2FsbCB0byBwY2ltX2lvdW5tYXBfcmVnaW9ucygpLgo+IAo+IC4uLgo+IAo+IGludCBt
dGlwX3BjaV9wcm9iZSgpCj4gCj4gPiDCoHNldG1hc2tfZXJyOgo+ID4gLQlwY2ltX2lvdW5tYXBf
cmVnaW9ucyhwZGV2LCAxIDw8IE1USVBfQUJBUik7Cj4gPiArCXBjaW1fcmVsZWFzZV9yZWdpb24o
cGRldiwgTVRJUF9BQkFSKTsKPiAKPiBCdXQgd2h5PwoKRU1PUkVJTkZPUkVRVUlSRUQKV2h5IEkg
cmVwbGFjZSBpdCBvciB3aHkgSSBkb24ndCByZW1vdmUgaXQgY29tcGxldGVseT8KCj4gCj4gLi4u
Cj4gCj4gbXRpcF9wY2lfcmVtb3ZlKCkKPiAKPiA+IMKgCXBjaV9kaXNhYmxlX21zaShwZGV2KTsK
PiA+IMKgCj4gPiAtCXBjaW1faW91bm1hcF9yZWdpb25zKHBkZXYsIDEgPDwgTVRJUF9BQkFSKTsK
PiAKPiBUaGlzIGlzIG9rYXkuCgpSZW1vdmluZyBpdCBpcyBva2F5LCB5b3UgbWVhbi4KCj4gCj4g
Li4uCj4gCj4gPiDCoAlwY2lfc2V0X2RydmRhdGEocGRldiwgTlVMTCk7Cj4gCj4gU2lkZSBub3Rl
OiBUaGlzIGlzIGRvbmUgYnkgZHJpdmVyIGNvcmUgZm9yIHRoZSBsYXN0IDEwKyB5ZWFyc+KApgoK
QWggeW91IGtub3cgQW5keSwga2VybmVsIHByb2dyYW1tZXJzIGJlIGxpa2U6ICJXaGVuIHlvdSdy
ZSBodW50aW5nIHlvdQpiZXR0ZXIgbWFrZSBzdXJlIHRoZSB3aWxkIHNvdyBpcyByZWFsbHkgZGVh
ZCBiZWZvcmUgeW91IGxvYWQgaXQgaW4geW91cgp0cnVuayIgO3AKClAuCgo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
