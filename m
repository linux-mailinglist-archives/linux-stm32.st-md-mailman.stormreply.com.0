Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B69A395804E
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 09:52:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6059DC6DD66;
	Tue, 20 Aug 2024 07:52:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1440C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 07:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724140367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3moRxRTX6JqCQ+Nk3VGwB60d7xMCZ9uzBRro5gwz1k=;
 b=d+6m0JY5GIZKNkQShlnGnQCpY6MRF3PzrBcoPNrK3LB9vgb8ej8HBJ++eIZqKSX4mPbhcO
 kU9XQ23xWceTqa7Seg0Ap1liBnSszGWmOT1dwch9g23f3QbKkOttjC5kmX2KVjSsLYLBsm
 Zo6oPGkuo0Sm/LPe+jlbRPTjhwjRXFg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-AODeKmBJMVCqxSoyeEYbpQ-1; Tue, 20 Aug 2024 03:52:44 -0400
X-MC-Unique: AODeKmBJMVCqxSoyeEYbpQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5bed69fd657so524949a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 00:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724140363; x=1724745163;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YeiSyPiPKmNnwOfGWuoS296+qVzydzMPMNriUvsyur4=;
 b=uQ/byPWjJ5Wt4G8GPmybEI8RmMz/i3fTFycpwKWeuyd87dpaBA4Tk9BQAxOiFy1wcy
 TwxMvwEPPDK/lIXGMbCvetE/wIB4YHzzSvEczIfu+dZBs76OsndJV/h8CBJfhl6y2g6L
 KChcFFiTrUNlAlhOkjhxt8PSK/wo7cUKHJvusSDqdcoaTqmCa3ByA/d3wO6zZy5BaOEG
 YMbsfqdvYw0l50+mb+k7zpcTs/8KAAtAP1oFgTVHXCGv46pOHAR/tcu0bS7bXlkzwRa2
 FaKKC46pMlX/jFKAJ2SP3K3Exqs5GZA6R5qbJMhmtZAHkFolEcS8cxlTUGtd6XB+9zdF
 yXLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7MMm7on1pac8jpkoWIma+yockDKdET3kko2EqvCow13PSHEUzi/DHh0uqHyw1zft4WHTHEXmZVWnZJcugviBc7jGnsFOh2DYChRQoO8UTSHWfjUgMmvUJ
X-Gm-Message-State: AOJu0Ywf4UWwuLTf5LIPuxmflsVh5CHANXmZLAE9zHCReV93XGFghzNK
 sgxWsmJM5RY8XNcUHCOWjCj8upgZO7ZT77iD0mGQM2QrUaa1MoZvuOSavt/mXN9nwSWTb9kgaOX
 mmy5zMhwPgQGScaEag3OzCbIgPnE4fyZGuGQikgnDN12c/T63xwluirGg8Q8JoXdP/v9RrgU6Rb
 QEUg==
X-Received: by 2002:a17:907:7da8:b0:a7a:a33e:47cd with SMTP id
 a640c23a62f3a-a8392f0f09amr559790566b.8.1724140363135; 
 Tue, 20 Aug 2024 00:52:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCcSzDTDTcLcwJLqj7qP91xXOb0HQ7Ix0WDiy6h5hU0b8EQrJaBGayIlt+2svr7xzZZtOaow==
X-Received: by 2002:a17:907:7da8:b0:a7a:a33e:47cd with SMTP id
 a640c23a62f3a-a8392f0f09amr559788066b.8.1724140362524; 
 Tue, 20 Aug 2024 00:52:42 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dcc:1f00:bec1:681e:45eb:77e2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383946973sm722531566b.160.2024.08.20.00.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 00:52:42 -0700 (PDT)
Message-ID: <ef48369d230ef1912da157e7b437040bece6b5f4.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andy@kernel.org>
Date: Tue, 20 Aug 2024 09:52:40 +0200
In-Reply-To: <ZsOO2uuGmD97Mocj@smile.fi.intel.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-9-pstanner@redhat.com>
 <ZsOO2uuGmD97Mocj@smile.fi.intel.com>
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

T24gTW9uLCAyMDI0LTA4LTE5IGF0IDIxOjI4ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gTW9uLCBBdWcgMTksIDIwMjQgYXQgMDY6NTE6NDdQTSArMDIwMCwgUGhpbGlwcCBTdGFu
bmVyIHdyb3RlOgo+ID4gc3RtaWNybyB1c2VzIFBDSSBkZXZyZXMgaW4gdGhlIHdyb25nIHdheS4g
UmVzb3VyY2VzIHJlcXVlc3RlZAo+ID4gdGhyb3VnaCBwY2ltXyogZnVuY3Rpb25zIGRvbid0IG5l
ZWQgdG8gYmUgY2xlYW5lZCB1cCBtYW51YWxseSBpbgo+ID4gdGhlCj4gPiByZW1vdmUoKSBjYWxs
YmFjayBvciBpbiB0aGUgZXJyb3IgdW53aW5kIHBhdGggb2YgYSBwcm9iZSgpCj4gPiBmdW5jdGlv
bi4KPiA+IAo+ID4gTW9yZW92ZXIsIHRoZXJlIGlzIGFuIHVubmVjZXNzYXJ5IGxvb3Agd2hpY2gg
b25seSByZXF1ZXN0cyBhbmQKPiA+IGlvcmVtYXBzCj4gPiBCQVIgMCwgYnV0IGl0ZXJhdGVzIG92
ZXIgYWxsIEJBUnMgbmV2ZXJ0aGVsZXNzLgo+ID4gCj4gPiBGdXJ0aGVybW9yZSwgcGNpbV9pb21h
cF9yZWdpb25zKCkgYW5kIHBjaW1faW9tYXBfdGFibGUoKSBoYXZlIGJlZW4KPiA+IGRlcHJlY2F0
ZWQgYnkgdGhlIFBDSSBzdWJzeXN0ZW0gaW4gY29tbWl0IGUzNTRiYjg0YTRjMSAoIlBDSToKPiA+
IERlcHJlY2F0ZQo+ID4gcGNpbV9pb21hcF90YWJsZSgpLCBwY2ltX2lvbWFwX3JlZ2lvbnNfcmVx
dWVzdF9hbGwoKSIpLgo+ID4gCj4gPiBSZXBsYWNlIHRoZXNlIGZ1bmN0aW9ucyB3aXRoIHBjaW1f
aW9tYXBfcmVnaW9uKCkuCj4gPiAKPiA+IFJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgbWFudWFsIHBj
aW1fKiBjbGVhbnVwIGNhbGxzLgo+ID4gCj4gPiBSZW1vdmUgdGhlIHVubmVjZXNzYXJ5IGxvb3Ag
b3ZlciBhbGwgQkFScy4KPiAKPiAuLi4KPiAKPiBsb29uZ3Nvbl9kd21hY19wcm9iZSgpCj4gCj4g
PiArCW1lbXNldCgmcmVzLCAwLCBzaXplb2YocmVzKSk7Cj4gPiArCXJlcy5hZGRyID0gcGNpbV9p
b21hcF9yZWdpb24ocGRldiwgMCwgcGNpX25hbWUocGRldikpOwo+ID4gKwlpZiAoSVNfRVJSKHJl
cy5hZGRyKSkgewo+ID4gKwkJcmV0ID0gUFRSX0VSUihyZXMuYWRkcik7Cj4gPiArCQlnb3RvIGVy
cl9kaXNhYmxlX2RldmljZTsKPiAKPiBJdCBzZWVtcyB5b3VyIHNlcmllcyByZXZlYWxzIGlzc3Vl
cyBpbiB0aGUgZXJyb3IgcGF0aHMgb2YgLnByb2JlKCk6cwo+IGluIG1hbnkgZHJpdmVycy4uLgo+
IAo+IElmIHdlIHVzZSBwY2ltIHZhcmlhbnQgdG8gZW5hYmxlIGRldmljZSwgd2h5IGRvIHdlIG5l
ZWQgdG8gZXhwbGljaXRseQo+IGRpc2FibGUgaXQ/CgpOby4KCj4gCj4gPiDCoAl9Cj4gCj4gLi4u
Cj4gCj4gbG9vbmdzb25fZHdtYWNfcmVtb3ZlKCkKPiAKPiA+IMKgCXBjaV9kaXNhYmxlX21zaShw
ZGV2KTsKPiA+IMKgCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKPiAKPiBOb3Qgc3VyZSB3aHkg
d2UgbmVlZCB0aGVzZSBlaXRoZXIuLi4KCkl0J3MgY29tcGxpY2F0ZWQuCgpUaGUgY29kZSB1c2Vz
IHBjaU1fZW5hYmxlX2RldmljZSgpLCBidXQgaGVyZSBpbiByZW1vdmUKcGNpX2Rpc2FibGVfZGV2
aWNlKCkuCgpwY2ltX2VuYWJsZV9kZXZpY2UoKSBzZXRzIHVwIGEgZGlzYWJsZSBjYWxsYmFjayB3
aGljaCBvbmx5IGNhbGxzCnBjaV9kaXNhYmxlX2RldmljZSgpIGlmIHBjaW1fcGluX2RldmljZSgp
IGhhcyBub3QgYmVlbiBjYWxsZWQuCgpUaGlzIGNvZGUgZG9lc24ndCBzZWVtIHRvIGNhbGwgcGNp
bV9waW5fZGV2aWNlKCksIHNvIEkgdGhpbmsKcGNpX2Rpc2FibGVfZGV2aWNlKCkgY291bGQgYmUg
cmVtb3ZlZC4KCgpJIGRlZmluaXRlbHkgd291bGQgbm90IGZlZWwgY29uZmlkZW50IHRvdWNoaW5n
IHBjaV9kaXNhYmxlX21zaSgpLAp0aG91Z2guIFRoZSBBRkFJSyBiaWdnZXN0IHByb2JsZW0gcmVt
YWluaW5nIGluIFBDSSBkZXZyZXMgaXMgdGhhdCB0aGUKTVNJIGNvZGUgYmFzZSBpbXBsaWNpdGx5
IGNhbGxzIGludG8gZGV2cmVzLCBzZWUgaGVyZSBbMV0KCgpQLgoKClsxXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvZWU0NGVhN2FjNzYwZTczZWRhZDNmMjBiMzBiNGQyZmZmNjZjMWE4NS5j
YW1lbEByZWRoYXQuY29tLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
