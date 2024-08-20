Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E53958002
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 09:40:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A0ABC6DD66;
	Tue, 20 Aug 2024 07:40:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D1A1C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 07:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724139617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jxzUdmNZBc9jEjirNcUdJ3a5fT7IPVhG9RuosEJ8BVw=;
 b=bX+yPfALlN0RJmmtilB+GweBz1FQQc/fxODJCFKj7mjp8zUpX7TNkPAVAAHBf4h91qn2R6
 x4O4laInsbO2QhpnzlNudphbWwtJE+ivowNTLNVw3/RWTMYF1rKMXHde5knnLUthDYtnWg
 V/YVlXo+vsx/xstXk+EENPL/PIb31TQ=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-fVMyz89xPQauCAJKIjd0ag-1; Tue, 20 Aug 2024 03:40:14 -0400
X-MC-Unique: fVMyz89xPQauCAJKIjd0ag-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2f3f157cd18so136421fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 00:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724139612; x=1724744412;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LI6kfa5oLV045Jmdu7a0CojUb3GQJzHs7H4OiymNEbE=;
 b=hEycae4TIwwzpezsjyGIgRYoQ9HN5T1epbCgCRYJ4aitbqGtLfU7iNpBoouniYQSMZ
 LaSX6lnTy5LHebXCbz1mw7Il+Ro2Nt87IKLxgdeh5d6Nu7bcWPy5WEutgy6GFS5zX8eI
 97zM9pWKNBBKyNk8TEkxT65IhsddMzDCmrIigjcKWFlAUApuE5C18n4fiPGhtT+x1wOZ
 Lz3BNhYI7P6StOh4s2MIT8pYMvQgMoYj3U4uvf/wUzygZkVFOcnnMidMFjCZCwNnGlDF
 gL+iP3FU4+JKTn/i+2h4pj3G3Dpn3nOLBuxwGyXS4H9TjnjsyXnPC8OxjLtfKjao92HE
 0frg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIWz7YbrEwjyrwejRB1UBe/F8xMuhsiJhkxp8AmF0QZgdRKZQitb7P/dgNIzap9M3blplgxCzO894UEg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyB3+VuX13WLELxeJByz89VVKeCuz5jCJlA9xiQXejLAoBU3gY3
 CqfvMuVqDf4+heTRrNGNu0WfI9prlrWbKNn+JSLIIaBaWivLem8s1HotVqm+Y4DgN5+rN+VWpJW
 xpFWGgNa3wJ3yK/Fasie6wtm+2DOoCSTmVGvfVJmG9CXT5OLLkF7ZFs8ZOQQANVZV4pt+b9JKiE
 DaVg==
X-Received: by 2002:a05:6512:3d04:b0:52f:c0dd:d168 with SMTP id
 2adb3069b0e04-5331c6e53bfmr4778927e87.7.1724139612408; 
 Tue, 20 Aug 2024 00:40:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuY9Bjt5iBWcm2YKpDyt42mNkBOnX16tyh4gc9tacJQihXtDb0AW33sxGPjl0kWgtMyZPzMQ==
X-Received: by 2002:a05:6512:3d04:b0:52f:c0dd:d168 with SMTP id
 2adb3069b0e04-5331c6e53bfmr4778883e87.7.1724139611750; 
 Tue, 20 Aug 2024 00:40:11 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dcc:1f00:bec1:681e:45eb:77e2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83839344fdsm726051366b.100.2024.08.20.00.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 00:40:11 -0700 (PDT)
Message-ID: <5d70794731198ec7bc59bd95e50a8aa81cf97c7b.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andy@kernel.org>
Date: Tue, 20 Aug 2024 09:40:09 +0200
In-Reply-To: <ZsONiNkdXGMKMbRL@smile.fi.intel.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-8-pstanner@redhat.com>
 <ZsONiNkdXGMKMbRL@smile.fi.intel.com>
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
Subject: Re: [Linux-stm32] [PATCH 6/9] ethernet: cavium: Replace deprecated
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

T24gTW9uLCAyMDI0LTA4LTE5IGF0IDIxOjIzICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gTW9uLCBBdWcgMTksIDIwMjQgYXQgMDY6NTE6NDZQTSArMDIwMCwgUGhpbGlwcCBTdGFu
bmVyIHdyb3RlOgo+ID4gcGNpbV9pb21hcF9yZWdpb25zKCkgYW5kIHBjaW1faW9tYXBfdGFibGUo
KSBoYXZlIGJlZW4gZGVwcmVjYXRlZCBieQo+ID4gdGhlIFBDSSBzdWJzeXN0ZW0gaW4gY29tbWl0
IGUzNTRiYjg0YTRjMSAoIlBDSTogRGVwcmVjYXRlCj4gPiBwY2ltX2lvbWFwX3RhYmxlKCksIHBj
aW1faW9tYXBfcmVnaW9uc19yZXF1ZXN0X2FsbCgpIikuCj4gPiAKPiA+IFJlcGxhY2UgdGhlc2Ug
ZnVuY3Rpb25zIHdpdGggdGhlIGZ1bmN0aW9uIHBjaW1faW9tYXBfcmVnaW9uKCkuCj4gCj4gLi4u
Cj4gCj4gY2F2aXVtX3B0cF9wcm9iZSgpCj4gCj4gPiAtCXBjaW1faW91bm1hcF9yZWdpb25zKHBk
ZXYsIDEgPDwgUENJX1BUUF9CQVJfTk8pOwo+ID4gKwlwY2ltX2lvdW5tYXBfcmVnaW9uKHBkZXYs
IFBDSV9QVFBfQkFSX05PKTsKPiA+IMKgCj4gPiDCoGVycm9yX2ZyZWU6Cj4gPiDCoAlkZXZtX2tm
cmVlKGRldiwgY2xvY2spOwo+IAo+IEJvdGggYXJlIHF1ZXN0aW9uYWJsZS4gV2h5IGRvIHdlIG5l
ZWQgZWl0aGVyIG9mIHRoZW0/CgpZb3Ugc2VlbSB0byBjcml0aWNpemUgbXkgcGNpbV9pb3VubWFw
X3JlZ2lvbigpIGV0Yy4gaW4gb3RoZXIgdW53aW5kCnBhdGhzLCB0b28uIEkgdGhpbmsgeW91ciBj
cml0aWNpc20gaXMgb2Z0ZW4ganVzdGlmaWVkLiBUaGlzIGRyaXZlcgpoZXJlLCBob3dldmVyLCB3
YXMgdGhlIG9uZSB3aGljaCBtYWRlIG1lIHN1c3BpY2lvdXMgYW5kIGhlc2l0YXRlIGFuZApyZW1v
dmluZyB0aG9zZSBjYWxsczsgYmVjYXVzZSBvZiB0aGUgY29kZSBiZWxvdzoKCgoJcGNpbV9pb3Vu
bWFwX3JlZ2lvbihwZGV2LCBQQ0lfUFRQX0JBUl9OTyk7CgplcnJvcl9mcmVlOgoJZGV2bV9rZnJl
ZShkZXYsIGNsb2NrKTsKCmVycm9yOgoJLyogRm9yIGBjYXZpdW1fcHRwX2dldCgpYCB3ZSBuZWVk
IHRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiB0aGUgY2FzZQoJICogd2hlbiB0aGUgY29yZSBoYXMg
bm90IHRyaWVkIHRvIHByb2JlIHRoaXMgZGV2aWNlIGFuZCB0aGUgY2FzZSB3aGVuCgkgKiB0aGUg
cHJvYmUgZmFpbGVkLiAgSW4gdGhlIGxhdGVyIGNhc2Ugd2UgcHJldGVuZCB0aGF0IHRoZQoJICog
aW5pdGlhbGl6YXRpb24gd2FzIHN1Y2Nlc3NmdWwgYW5kIGtlZXAgdGhlIGVycm9yIGluCgkgKiBg
ZGV2LT5kcml2ZXJfZGF0YWAuCgkgKi8KCXBjaV9zZXRfZHJ2ZGF0YShwZGV2LCBFUlJfUFRSKGVy
cikpOwoJcmV0dXJuIDA7Cn0KCgpTbyBpbiBjYXNlIG9mIGFuIGVycm9yIHRoZXkgcmV0dXJuIDAg
YW5kIGRvLi4uIHN0dWZmLgoKSSBkb24ndCB3YW50IHRvIHRvdWNoIHRoYXQgd2l0aG91dCBzb21l
b25lIHdobyBtYWludGFpbnMgKGFuZCwgaWRlYWxseSwKdW5kZXJzdGFuZHMpIHRoZSBjb2RlIGRl
dGFpbHMgd2hhdCdzIGdvaW5nIG9uIGhlcmUuCgoKUC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
