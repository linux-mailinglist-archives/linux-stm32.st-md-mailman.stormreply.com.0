Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3AA95972E
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 11:36:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7936EC6DD9A;
	Wed, 21 Aug 2024 09:36:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5461C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 09:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724233003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jj5eIkUkWg3KtRXn0z2L0PWnJAu5W4Pyl+E7wKNe/xw=;
 b=gP+fEckErQQ9mO1Us3sQ5jONRu7AQSJJ+gHqBEwxnc4HrP//RDK9rZeQjddCaHL8ZVVePM
 YpAs5yThu2f40uAZoL3ZY0nqWldKL0h0U2EMHkB2BpKh7LD1BuE9biYGs7X1vA1Uh3IlmO
 zth+VRgG940nLYfvL48dCPWalKwNfW8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-22lv5ngZN0m5QDHok17aEQ-1; Wed, 21 Aug 2024 05:36:40 -0400
X-MC-Unique: 22lv5ngZN0m5QDHok17aEQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-428fc34f41bso56147995e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 02:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724232999; x=1724837799;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jj5eIkUkWg3KtRXn0z2L0PWnJAu5W4Pyl+E7wKNe/xw=;
 b=ULmDvFXD+NLpuikWPKoj21edXZ8bLDFpla5Pv9efsodogu8PFJiHLnmRfrHKMpXPoj
 i/MPRLEKkCzoldodNJySBYFKc2IUB+3X8Zb8hn5nLgUjqxYYmc4qljI9JO6KZ8NgsVVs
 FXXj3axgwSFG9Ng+QdDRxPcVi0MTazEnKGSvrLI5nuRbpTUdfsTR76iLvU5KqT3Y9Tzi
 rTYfUN4okgXiqEqSRdPyfrt7Xb5QvgCon6yV1k7WLhxHhI2fC7feLq4yP6QuyLmzZJBm
 ipABhAR9mbQjCq5IHTaIoqXWM/eLFYnNB61uyXjTL92oN4rb+e0SwoqevXpr8bXNDIxe
 6cHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLinghIBGXOnKoCuG1Zsky1z6QO6sQom1/Ok570jMYQQvv114mAHfd4jxi+T4OhXP0Xq6eICNklzs4FQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw9TGgFGzMsRN5jtI4peV9fy8d3kuSsA0wczGK+yGKGDFT5KcGr
 iuHc8uxOkFXAZYyUzdHlozFUnVzlb7Q4fS0aTA0BEEh4TWsvRrwWNlvfa4sDGSW0Jk0v7RsPhKi
 Ter5mqZsxtm1pZwM0ottA6C6Fs5K1YKOABAwE0wFCbcnAl5eivYd9l2HclAIF7Pgv8zGTfz9dEi
 iT0Q==
X-Received: by 2002:a05:600c:3ba2:b0:426:6ed5:fd5 with SMTP id
 5b1f17b1804b1-42abd112115mr13371985e9.6.1724232999155; 
 Wed, 21 Aug 2024 02:36:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5uFdtqh3Nnxq7uvkwhVWuYvEqJNhXSjOOFCdMvyLVN5q9k/xJob4MdVvdN0iwQqkOmix49g==
X-Received: by 2002:a05:600c:3ba2:b0:426:6ed5:fd5 with SMTP id
 5b1f17b1804b1-42abd112115mr13371545e9.6.1724232998634; 
 Wed, 21 Aug 2024 02:36:38 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42abee8bcecsm19203885e9.17.2024.08.21.02.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 02:36:38 -0700 (PDT)
Message-ID: <be1c2f6fb63542ccdcb599956145575293625c37.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Aug 2024 11:36:36 +0200
In-Reply-To: <CAHp75VduuT=VLtXS+zha4ZNe3ZvBV-jgZpn2oP4WkzDdt6Pnog@mail.gmail.com>
References: <20240821071842.8591-2-pstanner@redhat.com>
 <20240821071842.8591-8-pstanner@redhat.com>
 <CAHp75VduuT=VLtXS+zha4ZNe3ZvBV-jgZpn2oP4WkzDdt6Pnog@mail.gmail.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org,
 Eugenio =?ISO-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
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

T24gV2VkLCAyMDI0LTA4LTIxIGF0IDExOjE0ICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gV2VkLCBBdWcgMjEsIDIwMjQgYXQgMTA6MTnigK9BTSBQaGlsaXBwIFN0YW5uZXIKPiA8
cHN0YW5uZXJAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiAKPiA+IHN0bWljcm8gdXNlcyBQQ0kgZGV2
cmVzIGluIHRoZSB3cm9uZyB3YXkuIFJlc291cmNlcyByZXF1ZXN0ZWQKPiA+IHRocm91Z2ggcGNp
bV8qIGZ1bmN0aW9ucyBkb24ndCBuZWVkIHRvIGJlIGNsZWFuZWQgdXAgbWFudWFsbHkgaW4KPiA+
IHRoZQo+ID4gcmVtb3ZlKCkgY2FsbGJhY2sgb3IgaW4gdGhlIGVycm9yIHVud2luZCBwYXRoIG9m
IGEgcHJvYmUoKQo+ID4gZnVuY3Rpb24uCj4gCj4gPiBNb3Jlb3ZlciwgdGhlcmUgaXMgYW4gdW5u
ZWNlc3NhcnkgbG9vcCB3aGljaCBvbmx5IHJlcXVlc3RzIGFuZAo+ID4gaW9yZW1hcHMKPiA+IEJB
UiAwLCBidXQgaXRlcmF0ZXMgb3ZlciBhbGwgQkFScyBuZXZlcnRoZWxlc3MuCj4gCj4gU2VlbXMg
bGlrZSBsb29uZ3NvbiB3YXMgY2FyZ28tY3VsdGVkIGEgbG90IHdpdGhvdXQgYSBjbGVhcgo+IHVu
ZGVyc3RhbmRpbmcgb2YgdGhpcyBjb2RlIGluIHRoZSBtYWluIGRyaXZlci4uLgo+IAo+ID4gRnVy
dGhlcm1vcmUsIHBjaW1faW9tYXBfcmVnaW9ucygpIGFuZCBwY2ltX2lvbWFwX3RhYmxlKCkgaGF2
ZSBiZWVuCj4gPiBkZXByZWNhdGVkIGJ5IHRoZSBQQ0kgc3Vic3lzdGVtIGluIGNvbW1pdCBlMzU0
YmI4NGE0YzEgKCJQQ0k6Cj4gPiBEZXByZWNhdGUKPiA+IHBjaW1faW9tYXBfdGFibGUoKSwgcGNp
bV9pb21hcF9yZWdpb25zX3JlcXVlc3RfYWxsKCkiKS4KPiA+IAo+ID4gUmVwbGFjZSB0aGVzZSBm
dW5jdGlvbnMgd2l0aCBwY2ltX2lvbWFwX3JlZ2lvbigpLgo+ID4gCj4gPiBSZW1vdmUgdGhlIHVu
bmVjZXNzYXJ5IG1hbnVhbCBwY2ltXyogY2xlYW51cCBjYWxscy4KPiA+IAo+ID4gUmVtb3ZlIHRo
ZSB1bm5lY2Vzc2FyeSBsb29wIG92ZXIgYWxsIEJBUnMuCj4gCj4gLi4uCj4gCj4gPiAtwqDCoMKg
wqDCoMKgIGZvciAoaSA9IDA7IGkgPCBQQ0lfU1REX05VTV9CQVJTOyBpKyspIHsKPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIGkpID09
IDApCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29u
dGludWU7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwY2ltX2lvdW5tYXBfcmVn
aW9ucyhwZGV2LCBCSVQoaSkpOwo+IAo+IEhlcmUgaXMgdGhlIEJBUngsIHdoaWNoIGNvbnRyYWRp
Y3RzIHRoZSBwcm9iZSA6LSkKCkknbSBub3Qgc3VyZSB3aGF0IHNob3VsZCBiZSBkb25lIGFib3V0
IGl0LiBUaGUgb25seSBpbnRlcmVzdGluZwpxdWVzdGlvbiBpcyB3aGV0aGVyIHRoZSBvdGhlciBj
b2RlIHdpdGggcGNpbV9pb21hcF9yZWdpb25zKC4uLiBCSVQoaSkKZG9lcyBhbHNvIG9ubHkgZ3Jh
cCBCQVIgMC4KSW4gdGhhdCBjYXNlIHRoZSBkcml2ZXIgd291bGRuJ3QgZXZlbiBiZSBrbm93aW5n
IHdoYXQgaXRzIG93biBoYXJkd2FyZQppcyAvIGRvZXMsIHRob3VnaC4KCgpQLgoKPiAKPiA+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4gLcKgwqDCoMKgwqDCoCB9Cj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
