Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C249B957F48
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 09:22:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71E3EC6B45B;
	Tue, 20 Aug 2024 07:22:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC772CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724138526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e0+qX0TrsxgkCOPXQaR02hk7ZTKpiv1mVn2GsQYYShY=;
 b=KU4TTO7ZaADORi1w7y+hHWMfAEejXNiVlLdec9cEMenNCFVmo1sT0CzUHuOvqmUAODFA9G
 w6dZtIo3iT/AWtUxTLo4V/iwvk6koMxveMzKFc/POVhnKjxyOCR69X6qhA5pq0qMHc6emZ
 tMOjfAxWT7aCl9o3bPjQBjsi0OXORUE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-9-I7sX77O4O1nilxpEv9tg-1; Tue, 20 Aug 2024 03:22:04 -0400
X-MC-Unique: 9-I7sX77O4O1nilxpEv9tg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4290cc01eb3so9507355e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 00:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724138523; x=1724743323;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ASIEWrzHXogS2+yni6jFmR1o/WYm2ANcxSxU4DhoyQc=;
 b=uZx28VmPMIbbmit8lU0NCiQPEkSIJt4LD929kWUaoXdP5fpQljRoPZOTMoxqqvXOAy
 Jd0W+I3a4O1NmfuIrCBZ1GFltisZihGlxgOCnJNiO3fCmB0+LUyv1+juPRpeQZLXdW19
 SxfZeDwwRf89rB08nlcy/a8Qbz+TatfHNSKb4ezSuKdku/1A73sH6HvZrMLUkjNGaq67
 wXb/NOcSajiuSoIorp8sGJzvPn/NbVEdAMKFSoNPqR+PutGALFAyvkLBtpdrh5xy5Dnx
 BkU4qRHuQQ1qGOjLCouAOGEB4OWtef3VjAJd9xUX+IU1OooUTkDWE5Tko5nYTQTSJ0hj
 Re0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgkIyRldtzzy7GE7UdwG62AHWQvxhhX9cA8w2r4hF1ebNw8jgMM25ahShfWye/xV74CqE5BuD3/VY9DV+CEsWiuWEIgYR/y/ypLW7V/+4TtK1mr8YaEggC
X-Gm-Message-State: AOJu0Yw0DJszECAY0uiuIjOwgOKelgMjlBzdHId09LJLLXDtk9E8hDow
 4ytmydC6wYYxKg/Cgnn72Hc2cwwAG7TAki1fRBkLty75q9zY5Vp7fEPVnWia+UK36ecBe9W5oNg
 hw8CrMrhHa+C+4AjtPfDnsNDujGZ53VI+8Sr9lmgaiP6+AWmADKUQXmWucqm22hLbry+l7ptKXM
 8Qlg==
X-Received: by 2002:a05:600c:1ca9:b0:425:65b1:abb4 with SMTP id
 5b1f17b1804b1-429ed62f54cmr55368015e9.0.1724138522948; 
 Tue, 20 Aug 2024 00:22:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtu6sXluOG26PWy70qwsbDcaM81TTK+UTUTvyjs1U84scjqTgJELEGk3SrTeSIfdGLnjJpqA==
X-Received: by 2002:a05:600c:1ca9:b0:425:65b1:abb4 with SMTP id
 5b1f17b1804b1-429ed62f54cmr55367605e9.0.1724138522431; 
 Tue, 20 Aug 2024 00:22:02 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dcc:1f00:bec1:681e:45eb:77e2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429eeadfafbsm130634445e9.47.2024.08.20.00.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 00:22:02 -0700 (PDT)
Message-ID: <267a021781f59d6efe798dbca63f29dd25359f2d.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: onathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, Wu Hao
 <hao.wu@intel.com>, Tom Rix <trix@redhat.com>, Moritz Fischer
 <mdf@kernel.org>,  Xu Yilun <yilun.xu@intel.com>, Andy Shevchenko
 <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Alvaro
 Karsz <alvaro.karsz@solid-run.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eugenio =?ISO-8859-1?Q?P=E9rez?= <eperezma@redhat.com>, Richard Cochran
 <richardcochran@gmail.com>, Mark Brown <broonie@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  Hannes Reinecke <hare@suse.de>, Damien Le
 Moal <dlemoal@kernel.org>, Chaitanya Kulkarni <kch@nvidia.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>
Date: Tue, 20 Aug 2024 09:22:00 +0200
In-Reply-To: <20240819165148.58201-6-pstanner@redhat.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-6-pstanner@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

T24gTW9uLCAyMDI0LTA4LTE5IGF0IDE4OjUxICswMjAwLCBQaGlsaXBwIFN0YW5uZXIgd3JvdGU6
Cj4gcGNpbV9pb21hcF9yZWdpb25zKCkgYW5kIHBjaW1faW9tYXBfdGFibGUoKSBoYXZlIGJlZW4g
ZGVwcmVjYXRlZCBieQo+IHRoZQo+IFBDSSBzdWJzeXN0ZW0gaW4gY29tbWl0IGUzNTRiYjg0YTRj
MSAoIlBDSTogRGVwcmVjYXRlCj4gcGNpbV9pb21hcF90YWJsZSgpLCBwY2ltX2lvbWFwX3JlZ2lv
bnNfcmVxdWVzdF9hbGwoKSIpLgo+IAo+IEluIG10aXAzMnh4LCB0aGVzZSBmdW5jdGlvbnMgY2Fu
IGVhc2lseSBiZSByZXBsYWNlZCBieSB0aGVpcgo+IHJlc3BlY3RpdmUKPiBzdWNjZXNzb3JzLCBw
Y2ltX3JlcXVlc3RfcmVnaW9uKCkgYW5kIHBjaW1faW9tYXAoKS4gTW9yZW92ZXIsIHRoZQo+IGRy
aXZlcidzIGNhbGwgdG8gcGNpbV9pb3VubWFwX3JlZ2lvbnMoKSBpcyBub3QgbmVjZXNzYXJ5LCBi
ZWNhdXNlCj4gaXQncwo+IGludm9rZWQgaW4gdGhlIHJlbW92ZSgpIGZ1bmN0aW9uLiBDbGVhbnVw
IGNhbiwgaGVuY2UsIGJlIHBlcmZvcm1lZCBieQo+IFBDSSBkZXZyZXMgYXV0b21hdGljYWxseS4K
PiAKPiBSZXBsYWNlIHBjaW1faW9tYXBfcmVnaW9ucygpIGFuZCBwY2ltX2lvbWFwX3RhYmxlKCku
Cj4gCj4gUmVtb3ZlIHRoZSBjYWxsIHRvIHBjaW1faW91bm1hcF9yZWdpb25zKCkuCj4gCj4gU2ln
bmVkLW9mZi1ieTogUGhpbGlwcCBTdGFubmVyIDxwc3Rhbm5lckByZWRoYXQuY29tPgo+IC0tLQo+
IMKgZHJpdmVycy9ibG9jay9tdGlwMzJ4eC9tdGlwMzJ4eC5jIHwgMTEgKysrKysrLS0tLS0KPiDC
oDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svbXRpcDMyeHgvbXRpcDMyeHguYwo+IGIvZHJpdmVycy9i
bG9jay9tdGlwMzJ4eC9tdGlwMzJ4eC5jCj4gaW5kZXggYzZlZjA1NDZmZmM5Li5jN2RhNjA5MDk1
NGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ibG9jay9tdGlwMzJ4eC9tdGlwMzJ4eC5jCj4gKysr
IGIvZHJpdmVycy9ibG9jay9tdGlwMzJ4eC9tdGlwMzJ4eC5jCj4gQEAgLTI3MTYsNyArMjcxNiw5
IEBAIHN0YXRpYyBpbnQgbXRpcF9od19pbml0KHN0cnVjdCBkcml2ZXJfZGF0YSAqZGQpCj4gwqAJ
aW50IHJ2Owo+IMKgCXVuc2lnbmVkIGxvbmcgdGltZW91dCwgdGltZXRha2VuOwo+IMKgCj4gLQlk
ZC0+bW1pbyA9IHBjaW1faW9tYXBfdGFibGUoZGQtPnBkZXYpW01USVBfQUJBUl07Cj4gKwlkZC0+
bW1pbyA9IHBjaW1faW9tYXAoZGQtPnBkZXYsIE1USVBfQUJBUiwgMCk7Cj4gKwlpZiAoIWRkLT5t
bWlvKQo+ICsJCXJldHVybiAtRU5PTUVNOwo+IMKgCj4gwqAJbXRpcF9kZXRlY3RfcHJvZHVjdChk
ZCk7Cj4gwqAJaWYgKGRkLT5wcm9kdWN0X3R5cGUgPT0gTVRJUF9QUk9EVUNUX1VOS05PV04pIHsK
PiBAQCAtMzcyNiw5ICszNzI4LDkgQEAgc3RhdGljIGludCBtdGlwX3BjaV9wcm9iZShzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwKPiDCoAl9Cj4gwqAKPiDCoAkvKiBNYXAgQkFSNSB0byBtZW1vcnkuICov
Cj4gLQlydiA9IHBjaW1faW9tYXBfcmVnaW9ucyhwZGV2LCAxIDw8IE1USVBfQUJBUiwKPiBNVElQ
X0RSVl9OQU1FKTsKPiArCXJ2ID0gcGNpbV9yZXF1ZXN0X3JlZ2lvbihwZGV2LCAxLCBNVElQX0RS
Vl9OQU1FKTsKClRoYXQncyBhIGJ1ZyBoZXJlLCBidHcuClNob3VsZCBiZSBNVElQX0FCQVIgaW5z
dGVhZCBvZiAxLgoKV2lsbCBmaXggaW4gdjIuCgpQLgoKPiDCoAlpZiAocnYgPCAwKSB7Cj4gLQkJ
ZGV2X2VycigmcGRldi0+ZGV2LCAiVW5hYmxlIHRvIG1hcCByZWdpb25zXG4iKTsKPiArCQlkZXZf
ZXJyKCZwZGV2LT5kZXYsICJVbmFibGUgdG8gcmVxdWVzdCByZWdpb25zXG4iKTsKPiDCoAkJZ290
byBpb21hcF9lcnI7Cj4gwqAJfQo+IMKgCj4gQEAgLTM4NDksNyArMzg1MSw3IEBAIHN0YXRpYyBp
bnQgbXRpcF9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCj4gwqAJCWRyb3BfY3B1KGRk
LT53b3JrWzJdLmNwdV9iaW5kaW5nKTsKPiDCoAl9Cj4gwqBzZXRtYXNrX2VycjoKPiAtCXBjaW1f
aW91bm1hcF9yZWdpb25zKHBkZXYsIDEgPDwgTVRJUF9BQkFSKTsKPiArCXBjaW1fcmVsZWFzZV9y
ZWdpb24ocGRldiwgTVRJUF9BQkFSKTsKPiDCoAo+IMKgaW9tYXBfZXJyOgo+IMKgCWtmcmVlKGRk
KTsKPiBAQCAtMzkyNSw3ICszOTI3LDYgQEAgc3RhdGljIHZvaWQgbXRpcF9wY2lfcmVtb3ZlKHN0
cnVjdCBwY2lfZGV2Cj4gKnBkZXYpCj4gwqAKPiDCoAlwY2lfZGlzYWJsZV9tc2kocGRldik7Cj4g
wqAKPiAtCXBjaW1faW91bm1hcF9yZWdpb25zKHBkZXYsIDEgPDwgTVRJUF9BQkFSKTsKPiDCoAlw
Y2lfc2V0X2RydmRhdGEocGRldiwgTlVMTCk7Cj4gwqAKPiDCoAlwdXRfZGlzayhkZC0+ZGlzayk7
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
