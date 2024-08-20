Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC3A9580A0
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 10:13:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA5EAC6DD66;
	Tue, 20 Aug 2024 08:13:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60BB1C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 08:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724141626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5x2Zwvil69v7j2QTmo/ru3l3YhUvaf/XafPWpjOjfD8=;
 b=V+ZmSPrWuPW6iLzzX/1uzcNwn98hDSrf6VhFntnNxB76lX0aWT4ijx7J/jymC2ubpNZoSc
 S+b3c5MZ348SKGP2k32ka4MpVzVZtZng0TyzFIh+Ta/wL9DolYpmYLiPrNL/2iNRMVE0dJ
 RpN3S3RxZZugSzgnHCeCxk/5URbfDM4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-M97tuXvuOxKZpXqGTPdqwA-1; Tue, 20 Aug 2024 04:13:45 -0400
X-MC-Unique: M97tuXvuOxKZpXqGTPdqwA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2f3f0ac6956so230981fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 01:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724141623; x=1724746423;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5x2Zwvil69v7j2QTmo/ru3l3YhUvaf/XafPWpjOjfD8=;
 b=H2vLeebTBFgZ0yg6PA97jyMM0FzXD0p5id5MVYP0Jsz2f5WlMHoRJIklBhihxzZBdO
 fpYrF4rnRouBMhxYI8DWM+HgO8IG3Z4U1El+CizN5+Bb9mzo6lMaZDN0PAXnq3rB5DhG
 1W3RzDS8fOGPG0stRvBlHFfXS+sRTvBZruVw2MiuQ1FMANIh80QOmF4dd1H7R1qA3qqf
 s/ENNLdGE1qtRU+VgKEv1MDx4n7wgSxyFmGDFCOzLPKZQH+Kbh7UguJPx3Cc1JTiprTz
 mZ+X6PkjiKxhh5W4HhwUQ2L/QNtE8nT7mny+/TKQrdLYgqrWdC1suagJbpnwZPAAPHxt
 36Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnnjh7F/LEbwWMtGjrx7A2KlKhEWfvJL3+VsbLPaS77PXUPFgIZ94arXZlmKJ/qwyed4yUQfxRA3+Zng==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YweDJjDXuHJb56n592uRinZ+/2/zrXDr++J7LYZsjHG49Jnlhl4
 hnhKIcBCQTQ2kle6yrBe9N/6rdSAye7tijKTMadJ4dgv5XQDqZX4+UacvMpsJ4zATVvlxaU7AGA
 NY6IxtU7iCrkdScPcwh23ZbQldPICbBlJTWc3Vxua+HzFLaR7qiA7TUlMBvjsbasKxxuq0xWVMp
 QZcA==
X-Received: by 2002:a05:6512:10c1:b0:530:e0fd:4a85 with SMTP id
 2adb3069b0e04-5331c6d4a61mr5183729e87.4.1724141623052; 
 Tue, 20 Aug 2024 01:13:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZQZIXMi/Gkd3uNyVjKj7Xpsxjs4S0/m1lMVeXOF/ppQ1u+jlQhYOCzCKjOM9+Rw34AQB54A==
X-Received: by 2002:a05:6512:10c1:b0:530:e0fd:4a85 with SMTP id
 2adb3069b0e04-5331c6d4a61mr5183700e87.4.1724141622413; 
 Tue, 20 Aug 2024 01:13:42 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dcc:1f00:bec1:681e:45eb:77e2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383935616sm724162966b.123.2024.08.20.01.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 01:13:42 -0700 (PDT)
Message-ID: <419e91cb2b698a450497dfc1fb86f2c46eb7d8fb.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andy@kernel.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>
Date: Tue, 20 Aug 2024 10:13:40 +0200
In-Reply-To: <ZsOQPbVGQFtUYSww@smile.fi.intel.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-10-pstanner@redhat.com>
 <74e9109a-ac59-49e2-9b1d-d825c9c9f891@wanadoo.fr>
 <ZsOQPbVGQFtUYSww@smile.fi.intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael
 S. Tsirkin" <mst@redhat.com>, Alvaro Karsz <alvaro.karsz@solid-run.com>,
 Tom Rix <trix@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, onathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org,
 Eugenio =?ISO-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Wu Hao <hao.wu@intel.com>,
 Richard Cochran <richardcochran@gmail.com>, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fpga@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 8/9] vdap: solidrun: Replace deprecated
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

T24gTW9uLCAyMDI0LTA4LTE5IGF0IDIxOjM0ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gTW9uLCBBdWcgMTksIDIwMjQgYXQgMDg6MTk6MjhQTSArMDIwMCwgQ2hyaXN0b3BoZSBK
QUlMTEVUIHdyb3RlOgo+ID4gTGUgMTkvMDgvMjAyNCDDoCAxODo1MSwgUGhpbGlwcCBTdGFubmVy
IGEgw6ljcml0wqA6Cj4gCj4gCj4gLi4uCj4gCj4gPiBVbnJlbGF0ZWQgdG8gdGhlIHBhdGNoLCBi
dXQgaXMgaXMgc2FmZSB0byBoYXZlICduYW1lJyBiZSBvbiB0aGUKPiA+IHN0YWNrPwo+ID4gCj4g
PiBwY2ltX2lvbWFwX3JlZ2lvbigpCj4gPiAtLT4gX19wY2ltX3JlcXVlc3RfcmVnaW9uKCkKPiA+
IC0tPiBfX3BjaW1fcmVxdWVzdF9yZWdpb25fcmFuZ2UoKQo+ID4gLS0+IHJlcXVlc3RfcmVnaW9u
KCkgb3IgX19yZXF1ZXN0X21lbV9yZWdpb24oKQo+ID4gLS0+IF9fcmVxdWVzdF9yZWdpb24oKQo+
ID4gLS0+IF9fcmVxdWVzdF9yZWdpb25fbG9ja2VkKCkKPiA+IC0tPiByZXMtPm5hbWUgPSBuYW1l
Owo+ID4gCj4gPiBTbyBhbiBhZGRyZXNzIG9uIHRoZSBzdGFjayBlbmRzIGluIHRoZSAnbmFtZScg
ZmllbGQgb2YgYSAic3RydWN0Cj4gPiByZXNvdXJjZSIuCj4gPiAKPiA+IEFjY29yZGluZyB0byBh
IGZldyBncmVwLCBpdCBsb29rcyByZWFsbHkgdW51c3VhbC4KPiA+IAo+ID4gSSBkb24ndCBrbm93
IGlmIGl0IGlzIHVzZWQsIGJ1dCBpdCBsb29rcyBzdHJhbmdlIHRvIG1lLgo+IAo+IEl0IG1pZ2h0
IGJlIHVzZWQgd2hlbiBwcmludGluZyAvcHJvYy9pb21lbSwgYnV0IEkgZG9uJ3QgcmVtZW1iZXIg
YnkKPiBoZWFydC4KPiAKPiA+IElmIGl0IGlzIGFuIGlzc3VlLCBpdCB3YXMgYXBwYXJlbnRseSBh
bHJlYWR5IHRoZXJlIGJlZm9yZSB0aGlzCj4gPiBwYXRjaC4KPiAKPiBUaGlzIHNlcmllcyBzZWVt
cyB0byByZXZlYWwgYSBsb3Qgb2YgaXNzdWVzIHdpdGggdGhlIHByb2JlL3JlbW92ZSBpbgo+IG1h
bnkKPiBkcml2ZXJzLiBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIG1ha2UgZml4ZXMgb2YgdGhlbSBi
ZWZvcmUgdGhpcyBzZXJpZXMKPiBmb3IKPiB0aGUgc2FrZSBvZiBlYXNpZXIgYmFja3BvcnRpbmcu
CgpKdXN0IHNvIHdlJ3JlIGluIHN5bmM6CkkgdGhpbmsgdGhlIG9ubHkgcmVhbCBidWcgaGVyZSBz
byBmYXIgaXMgdGhlIG9uZSBmb3VuZCBieSBDaHJpc3RvcGhlLgoKVGhlIHVzYWdlcyBvZiBwY2lf
ZGlzYWJsZV9kZXZpY2UoKSwgcGNpbV9pb3VubWFwX3JlZ2lvbnMoKSBhbmQgdGhlIGxpa2UKaW4g
cmVtb3ZlKCkgYW5kIGVycm9yIHVud2luZCBwYXRocyBhcmUgbm90IGVsZWdhbnQgYW5kIG1ha2Ug
ZGV2cmVzIGtpbmQKb2YgdXNlbGVzcyDigJMgYnV0IHRoZXkgYXJlIG5vdCBidWdzLiBTbyBJIHdv
dWxkbid0IGJhY2twb3J0IHRoZW0uCgpQLgoKPiAKPiBJZiBoZXJlIGlzIGEgcHJvYmxlbSwgdGhl
IGRldm1fa2FzcHJpbnRmKCkgc2hvdWxkIGJlIHVzZWQuCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
