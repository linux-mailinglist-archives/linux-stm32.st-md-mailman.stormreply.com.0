Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B04958533
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 12:53:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE387C6DD66;
	Tue, 20 Aug 2024 10:53:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24BAFCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 10:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724151190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ALzNlpnv8W1ve517kEWtOATdbz8B5b34bUhQvatZNhc=;
 b=K4G3KZcyKKk2GCcvC/YmXMXUxfhq4u06aJqCkJtHA2D8UhlZluNEIJAMar+x+qmytBsNau
 Ezmvh8JlMIrDdsuxUNVa8RxCvOI4vIE+v9c3oLLY7CLCVWrjKwruPTh0dKfVW2mna38/iC
 l2nRUSgHPHxUIq+1uSAYS1dv3Koy20Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-NiI_tV1AP1-J-psMJ8NFlQ-1; Tue, 20 Aug 2024 06:53:07 -0400
X-MC-Unique: NiI_tV1AP1-J-psMJ8NFlQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5bebd4c8da4so634969a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 03:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724151186; x=1724755986;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fxNlY5XENKMDPYIPhdHxQsnynjxqCdYhZpUwRk8ipsw=;
 b=fcy7BzBGKzIpfoLmT3dy9MmzxN89eJMJ7jbHA9Qc1H6fIWZzsxHhL8K7drWORh25XP
 I4mYQODqI0r3flKHhaLTkabkoIJkcWyvJi3Rm5PizWVGyljUjlLJrYIE/bpwS8ftg4hN
 cFbdvpn64X9dQcff8z9NEbXU01LEKbbXdiPc6R9RcC7WyZC3RE+PzgaK3DzXzeX2rUhE
 2DuFAc2M9/xWAo67vr6U5DnWpAm3ULwKOab8svKAvCDcSnpX3Dl/OcE6MK+Nd8nERSdr
 XSFhWztNm6goR8DRCvXqMvediXkuJfsWcQw6aD9oxa53BzfTzNeVjxKT4bta/s2Ox+Yt
 /Zsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU31aO4SQ3cqhWobzq2vNLWiAcNQMPvr0OHbkWbqizCMHrxJ6Jn81ioVNV9uMs/ousuxOEtOw6tCZH7O+3QuBns6yt5zIj9UOUVawDaxx27BZq19+VEakHo
X-Gm-Message-State: AOJu0YwKxQLwI8ZSuxYQEYIDt4G6+psm+j2zAQ8BskZXcXUx8K/oZVnM
 4nDdl2DA/nENhl8Xq5PNLOUOyE7hPIrj3xv+282+17ppripEOLRZQF/nVaFbtJaiovkT1KotisD
 8Fbnk1VRZnzgL864fFLNNj3POZAx1vO3gFKtnHkWNA2q7wOTNiBQLom+uBVEgx/11ljhkLKdwcH
 xPOQ==
X-Received: by 2002:a17:907:3f1a:b0:a7a:9d1e:3b28 with SMTP id
 a640c23a62f3a-a8392a38e58mr576177566b.5.1724151185793; 
 Tue, 20 Aug 2024 03:53:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/6EAdgReMTOuAWpstVpYQ93cEgThMtXJsIXsKn8TtmEKi0Ohh4lrRQAZ64k0Fs71t1ZO4MQ==
X-Received: by 2002:a17:907:3f1a:b0:a7a:9d1e:3b28 with SMTP id
 a640c23a62f3a-a8392a38e58mr576173566b.5.1724151185214; 
 Tue, 20 Aug 2024 03:53:05 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dcc:1f00:bec1:681e:45eb:77e2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838cfae7sm750027466b.58.2024.08.20.03.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 03:53:04 -0700 (PDT)
Message-ID: <d34214f18f994d255f640aefdf7f31814faa76f1.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andy@kernel.org>
Date: Tue, 20 Aug 2024 12:53:03 +0200
In-Reply-To: <ZsRx6OyqHPL0ws0e@smile.fi.intel.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-9-pstanner@redhat.com>
 <ZsOO2uuGmD97Mocj@smile.fi.intel.com>
 <ef48369d230ef1912da157e7b437040bece6b5f4.camel@redhat.com>
 <ZsRx6OyqHPL0ws0e@smile.fi.intel.com>
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
Subject: Re: [Linux-stm32] [PATCH 7/9] ethernet: stmicro: Simplify PCI
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

T24gVHVlLCAyMDI0LTA4LTIwIGF0IDEzOjM3ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gVHVlLCBBdWcgMjAsIDIwMjQgYXQgMDk6NTI6NDBBTSArMDIwMCwgUGhpbGlwcCBTdGFu
bmVyIHdyb3RlOgo+ID4gT24gTW9uLCAyMDI0LTA4LTE5IGF0IDIxOjI4ICswMzAwLCBBbmR5IFNo
ZXZjaGVua28gd3JvdGU6Cj4gPiA+IE9uIE1vbiwgQXVnIDE5LCAyMDI0IGF0IDA2OjUxOjQ3UE0g
KzAyMDAsIFBoaWxpcHAgU3Rhbm5lciB3cm90ZToKPiAKPiAuLi4KPiAKPiA+ID4gbG9vbmdzb25f
ZHdtYWNfcHJvYmUoKQo+ID4gPiAKPiA+ID4gPiArCW1lbXNldCgmcmVzLCAwLCBzaXplb2YocmVz
KSk7Cj4gPiA+ID4gKwlyZXMuYWRkciA9IHBjaW1faW9tYXBfcmVnaW9uKHBkZXYsIDAsIHBjaV9u
YW1lKHBkZXYpKTsKPiA+ID4gPiArCWlmIChJU19FUlIocmVzLmFkZHIpKSB7Cj4gPiA+ID4gKwkJ
cmV0ID0gUFRSX0VSUihyZXMuYWRkcik7Cj4gPiA+ID4gKwkJZ290byBlcnJfZGlzYWJsZV9kZXZp
Y2U7Cj4gPiA+IAo+ID4gPiBJdCBzZWVtcyB5b3VyIHNlcmllcyByZXZlYWxzIGlzc3VlcyBpbiB0
aGUgZXJyb3IgcGF0aHMgb2YKPiA+ID4gLnByb2JlKCk6cwo+ID4gPiBpbiBtYW55IGRyaXZlcnMu
Li4KPiA+ID4gCj4gPiA+IElmIHdlIHVzZSBwY2ltIHZhcmlhbnQgdG8gZW5hYmxlIGRldmljZSwg
d2h5IGRvIHdlIG5lZWQgdG8KPiA+ID4gZXhwbGljaXRseQo+ID4gPiBkaXNhYmxlIGl0Pwo+ID4g
Cj4gPiBOby4KPiAKPiBDYW4geW91IGVsYWJvcmF0ZT8gTm8gaXNzdWVzIGJlaW5nIHJldmVhbGVk
LCBvciBubyBuZWVkIHRvIGRpc2FibGUgaXQKPiBleHBsaWNpdGx5LCBvci4uLj8KCk9oLCBteSBi
YWQsIEkgb3Zlcmxvb2tlZCB5b3VyICJ3aHkiIGluIHRoYXQgcXVlc3Rpb24uCgpXZSBkbyBub3Qg
ZXhwbGljaXRseSBoYXZlIHRvIGRpc2FibGUgaXQuIEl0J3Mgd3JvbmcgLyB1bm5lY2Vzc2FyeSwg
YXMKbWFueSBvZiB0aGUgb3RoZXIgY2FsbHMgeW91IGNyaXRpY2l6ZWQgaW4gdGhpcyBzZXJpZXMu
CgpwY2ltX2VuYWJsZV9kZXZpY2UoKSAoaW4gcGNpL2RldnJlcy5jKSBjYWxscyBkZXZtX2FkZF9h
Y3Rpb24oLi4uLApwY2ltX2Rpc2FibGVfZGV2aWNlLCAgLi4uKSwgd2hpY2ggd2lsbCBkaXNhYmxl
IHRoZSBkZXZpY2Ugb24gZHJpdmVyCmRldGFjaC4KClNvIHRoZSBjYWxsIG9mIHBjaV9kaXNhYmxl
X2RldmljZSgpIGFib3ZlIGlzIHJlZHVuZGFudC4gV2UgY291bGQgcmVtb3ZlCml0LgoKPiAKPiA+
ID4gPiDCoAl9Cj4gCj4gLi4uCj4gCj4gPiA+IGxvb25nc29uX2R3bWFjX3JlbW92ZSgpCj4gPiA+
IAo+ID4gPiA+IMKgCXBjaV9kaXNhYmxlX21zaShwZGV2KTsKPiA+ID4gPiDCoAlwY2lfZGlzYWJs
ZV9kZXZpY2UocGRldik7Cj4gPiA+IAo+ID4gPiBOb3Qgc3VyZSB3aHkgd2UgbmVlZCB0aGVzZSBl
aXRoZXIuLi4KPiA+IAo+ID4gSXQncyBjb21wbGljYXRlZC4KPiA+IAo+ID4gVGhlIGNvZGUgdXNl
cyBwY2lNX2VuYWJsZV9kZXZpY2UoKSwgYnV0IGhlcmUgaW4gcmVtb3ZlCj4gPiBwY2lfZGlzYWJs
ZV9kZXZpY2UoKS4KPiA+IAo+ID4gcGNpbV9lbmFibGVfZGV2aWNlKCkgc2V0cyB1cCBhIGRpc2Fi
bGUgY2FsbGJhY2sgd2hpY2ggb25seSBjYWxscwo+ID4gcGNpX2Rpc2FibGVfZGV2aWNlKCkgaWYg
cGNpbV9waW5fZGV2aWNlKCkgaGFzIG5vdCBiZWVuIGNhbGxlZC4KPiA+IAo+ID4gVGhpcyBjb2Rl
IGRvZXNuJ3Qgc2VlbSB0byBjYWxsIHBjaW1fcGluX2RldmljZSgpLCBzbyBJIHRoaW5rCj4gPiBw
Y2lfZGlzYWJsZV9kZXZpY2UoKSBjb3VsZCBiZSByZW1vdmVkLgo+ID4gCj4gPiAKPiA+IEkgZGVm
aW5pdGVseSB3b3VsZCBub3QgZmVlbCBjb25maWRlbnQgdG91Y2hpbmcgcGNpX2Rpc2FibGVfbXNp
KCksCj4gPiB0aG91Z2guIFRoZSBBRkFJSyBiaWdnZXN0IHByb2JsZW0gcmVtYWluaW5nIGluIFBD
SSBkZXZyZXMgaXMgdGhhdAo+ID4gdGhlCj4gPiBNU0kgY29kZSBiYXNlIGltcGxpY2l0bHkgY2Fs
bHMgaW50byBkZXZyZXMsIHNlZSBoZXJlIFsxXQo+IAo+IEJ1dCBpc24ndCBpdCBhIGJ1c3luZXNz
IG9mIFBDSSBjb3JlIHRvIGNhbGwgcGNpX2Rpc2FibGVfbXNpKCkgYXQgdGhlCj4gcmlnaHQKPiBt
b21lbnQ/IE9rYXksIEkgYWRtaXQgdGhhdCB0aGVyZSBtaWdodCBiZSBkZXZpY2VzIHRoYXQgcmVx
dWlyZSBhCj4gc3BlY2lhbAo+IHdvcmtmbG93IFdSVCBNU0ksIGlzIHRoaXMgdGhlIGNhc2UgaGVy
ZT8KCkkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgaG93IE1TSSBpcyBpbnRlbmRlZCB0byBiZSB1
c2VkLgoKRnJvbSB3aGF0IEkndmUgc2VlbiBpbiB0aGUgY29kZSBiYXNlLCBwY2ltX3NldHVwX21z
aV9yZWxlYXNlKCkgZG9lcwpyZWdpc3RlciBhIGRldnJlcyBjYWxsYmFjayB0aGF0IHdpbGwgaW5k
ZWVkIGNhbGwgcGNpX2Rpc2FibGVfbXNpKCkKYWZ0ZXIgc29tZSBpbnRlcm1lZGlhdGUgY2FsbHMu
CgpCdXQgaW4gbXkgaG9uZXN0IG9waW5pb24sIHRoYXQgY29kZSBpcyBfdmVyeV8gYnJva2VuLiBJ
IHdhcyB0aGlua2luZwphYm91dCBob3cgd2UgbWlnaHQgY2xlYW4gaXQgdXAsIGJ1dCBjb3VsZG4n
dCBjb21lIHVwIHdpdGggYW4gaWRlYSB5ZXQuCgpPbmx5IGFmdGVyIHRoZSBjb2RlIGluIHBjaS9t
c2kvIGhhcyBiZWVuIGNsZWFubHkgc2VwYXJhdGVkIGZyb20KaW1wbGljaXQgZGV2cmVzIEkgbXlz
ZWxmIHdvdWxkIHN0YXJ0IHRvdWNoaW5nIGZ1bmN0aW9uIGNhbGxzIHJlbGF0ZWQgdG8KTVNJLgoK
VGhhdCBiZWluZyBzYWlkLCBJIHN1c3BlY3QgdGhhdCBvbmUgY2FuIHJlbW92ZSBwY2lfZGlzYWJs
ZV9tc2koKSBpbiB0aGUKbGluZSBhYm92ZS4gQnV0IHRoZSByaXNrLWJlbmVmaXQtcmF0aW8gZG9l
c24ndCBwYXkgb2ZmIGZvciBtZS4KClAuCgoKPiAKPiA+IFsxXQo+ID4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsL2VlNDRlYTdhYzc2MGU3M2VkYWQzZjIwYjMwYjRkMmZmZjY2YzFhODUuY2Ft
ZWxAcmVkaGF0LmNvbS8KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
