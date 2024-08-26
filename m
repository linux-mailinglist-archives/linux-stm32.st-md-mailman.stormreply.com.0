Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC2595E8C9
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 08:30:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE20CC6DD72;
	Mon, 26 Aug 2024 06:30:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DA17C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 06:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724653833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nxishIfe/1ssux79NyxoEgk0FairCh1OMu70D4Eejk=;
 b=UKEwpdaE2SSZC81OvV04l2H0sEfpjUFQ4qdVQaJOnSX47kWZd9BwQbim7h6c0hcvWVcKwM
 pzc4+p6ajJ1Md9KJ0BNPIiqUQPA+Sg4jZZvGJM69OndaQTvhr58WZxAV0X8TUPoIJmQ+3K
 Dcz2IhnQUOtSNn0Wo8g8H6c6hF5rO9k=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-gVpv7PWPMPay8glZgd0ahA-1; Mon, 26 Aug 2024 02:30:32 -0400
X-MC-Unique: gVpv7PWPMPay8glZgd0ahA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6bf698a3f2eso52412816d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Aug 2024 23:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724653831; x=1725258631;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jJFTNQ6Wct6NFpa/rz2wXYP7UMNXrnzBHL4pGlquRbc=;
 b=cUtCNYUyBrkzr+SHDCT/Denpz1T+k1BZHPFTRnbyKVfOC775iKFZgcPzxXD3oVwsPH
 bLTRfjlBrYqDeHkKqmTP3bW4bIF5LMsDC5la0jqtM0OCARFh7SDIqTUhbfnsLZZkgMsm
 B1VvIwZhGn/WavATjqBz0TcZEd0i0c8L+8Y9QjjZTOUudzqCoHDMBou5Gt9Qm6zYZACy
 7tdMtHiUk5nS6X0ZcG9enm5R+jMs+E/olPVHlMzm95VT/G/jWEgrowIbvjZbL2ia/V1+
 ZGAE2z8p3y0IEwoApe8TwTDytmr0HEw7mEN8aiFsMlgnuW+uN59TlktgNWh/qcgFXwPK
 b2EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/SgLEoJ0yUPKRBlEddyC3DBuNALmkNeT2CsIBCVVJiD5XkTBiwjk1nxVQaQhjLgc9qO7TY4Ivxjx2vQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyMlTeVacMJVbd3h0qiIN6NURzinBpBE9YMsi+/i89qoIWYzxzI
 ukBbwsJx3yuCmowISjaNq4zHK/reqo05JcopoiUdAUAMnT3qj+H/IULlpqYqeors/gcnFe5Q/jh
 xzsjT3LmGqQpp3nom9zOsHvdGHDqkoS8MYm7GLUBJ5Lhyuy9wMXcMAD3EckG3/UX4uJlllryL2u
 //rA==
X-Received: by 2002:a05:6214:3a87:b0:6c1:6b38:2fa4 with SMTP id
 6a1803df08f44-6c16dc7ae95mr108606406d6.24.1724653831059; 
 Sun, 25 Aug 2024 23:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjcrM+de6Fn6cHOIaSi480as1GF3hlSLum1vFYi4hcws7Awk5SxCY7Nx45ugpgCSJ72TftWg==
X-Received: by 2002:a05:6214:3a87:b0:6c1:6b38:2fa4 with SMTP id
 6a1803df08f44-6c16dc7ae95mr108605926d6.24.1724653830595; 
 Sun, 25 Aug 2024 23:30:30 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162db0685sm43302446d6.101.2024.08.25.23.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2024 23:30:30 -0700 (PDT)
Message-ID: <6e93c43e6e513559f0306085211245578c2c9d3f.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Serge Semin <fancer.lancer@gmail.com>
Date: Mon, 26 Aug 2024 08:30:23 +0200
In-Reply-To: <6q4pcpyqqt6mhj422pfkgggvwu7jhweu5446y6prcjgjql6xeq@jztt7z4fr6rg>
References: <20240822134744.44919-1-pstanner@redhat.com>
 <20240822134744.44919-7-pstanner@redhat.com>
 <6q4pcpyqqt6mhj422pfkgggvwu7jhweu5446y6prcjgjql6xeq@jztt7z4fr6rg>
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
 Andy Shevchenko <andy@kernel.org>, Chaitanya Kulkarni <kch@nvidia.com>,
 Richard Cochran <richardcochran@gmail.com>, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 David Lechner <dlechner@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fpga@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 6/9] ethernet: stmicro: Simplify PCI
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

T24gRnJpLCAyMDI0LTA4LTIzIGF0IDEyOjI5ICswMzAwLCBTZXJnZSBTZW1pbiB3cm90ZToKPiBI
aSBQaGlsaXBwCj4gCj4gT24gVGh1LCBBdWcgMjIsIDIwMjQgYXQgMDM6NDc6MzhQTSArMDIwMCwg
UGhpbGlwcCBTdGFubmVyIHdyb3RlOgo+ID4gc3RtaWNybyB1c2VzIFBDSSBkZXZyZXMgaW4gdGhl
IHdyb25nIHdheS4gUmVzb3VyY2VzIHJlcXVlc3RlZAo+ID4gdGhyb3VnaCBwY2ltXyogZnVuY3Rp
b25zIGRvbid0IG5lZWQgdG8gYmUgY2xlYW5lZCB1cCBtYW51YWxseSBpbgo+ID4gdGhlCj4gPiBy
ZW1vdmUoKSBjYWxsYmFjayBvciBpbiB0aGUgZXJyb3IgdW53aW5kIHBhdGggb2YgYSBwcm9iZSgp
Cj4gPiBmdW5jdGlvbi4KPiA+IAo+ID4gTW9yZW92ZXIsIHRoZXJlIGlzIGFuIHVubmVjZXNzYXJ5
IGxvb3Agd2hpY2ggb25seSByZXF1ZXN0cyBhbmQKPiA+IGlvcmVtYXBzCj4gPiBCQVIgMCwgYnV0
IGl0ZXJhdGVzIG92ZXIgYWxsIEJBUnMgbmV2ZXJ0aGVsZXNzLgo+ID4gCj4gPiBGdXJ0aGVybW9y
ZSwgcGNpbV9pb21hcF9yZWdpb25zKCkgYW5kIHBjaW1faW9tYXBfdGFibGUoKSBoYXZlIGJlZW4K
PiA+IGRlcHJlY2F0ZWQgYnkgdGhlIFBDSSBzdWJzeXN0ZW0gaW4gY29tbWl0IGUzNTRiYjg0YTRj
MSAoIlBDSToKPiA+IERlcHJlY2F0ZQo+ID4gcGNpbV9pb21hcF90YWJsZSgpLCBwY2ltX2lvbWFw
X3JlZ2lvbnNfcmVxdWVzdF9hbGwoKSIpLgo+ID4gCj4gPiBSZXBsYWNlIHRoZXNlIGZ1bmN0aW9u
cyB3aXRoIHBjaW1faW9tYXBfcmVnaW9uKCkuCj4gPiAKPiA+IFJlbW92ZSB0aGUgdW5uZWNlc3Nh
cnkgbWFudWFsIHBjaW1fKiBjbGVhbnVwIGNhbGxzLgo+ID4gCj4gPiBSZW1vdmUgdGhlIHVubmVj
ZXNzYXJ5IGxvb3Agb3ZlciBhbGwgQkFScy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUGhpbGlw
cCBTdGFubmVyIDxwc3Rhbm5lckByZWRoYXQuY29tPgo+IAo+IFRoYW5rcyBmb3IgdGhlIHNlcmll
cy4gQnV0IHBsZWFzZSBub3RlIHRoZSBuZXR3b3JrIHN1YnN5c3RlbQo+IGRldi1wcm9jZXNzIHJl
cXVpcmVzIHRvIHN1Ym1pdCB0aGUgY2xlYW51cC9mZWF0dXJlIGNoYW5nZXMgb24gdG9wIG9mCj4g
dGhlIG5ldC1uZXh0IHRyZWU6Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbmV0ZGV2L25ldC1uZXh0LmdpdC8KClRoYXQgc2VlbXMgYSBwb2xpY3kgSSBo
YXZlbid0IHNlZW4gc28gZmFyOyB1c3VhbGx5IHRoZSBhc3N1bXB0aW9uIGlzCnRoYXQgeW91IGJy
YW5jaCBvdXQgZnJvbSBMaW51cydzIG1hc3Rlci4KCkFueXdheXMsIEkgb2YgY291cnNlIGFtIGdv
aW5nIHRvIGhlbHAgd2l0aCBzZXR0aW5nIHVwIHNvbWV0aGluZwptZXJnZWFibGUKCj4gCj4gSnVz
dCByZWNlbnRseSBhIFlhbnRlbmcnICgrY2MpIHNlcmllcwo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL25ldGRldi9jb3Zlci4xNzIzMDE0NjExLmdpdC5zaXlhbnRlbmdAbG9vbmdzb24uY24vCj4g
d2FzIG1lcmdlZCBpbiB3aGljaCBzaWduaWZpY2FudGx5IHJlZmFjdG9yZWQgdGhlIExvb25nc29u
IE1BQyBkcml2ZXIuCj4gU2VlaW5nIHlvdXIgcGF0Y2ggaXNuJ3QgYmFzZWQgb24gdGhlc2UgY2hh
bmdlcywgdGhlcmUgaXMgYSBoaWdoCj4gcHJvYmFiaWxpdHkgdGhhdCB0aGUgcGF0Y2ggd29uJ3Qg
Z2V0IGNsZWFubHkgYXBwbGllZCBvbnRvIHRoZQo+IG5ldC1uZXh0IHRyZWUuIFNvIHBsZWFzZSBl
aXRoZXIgcmViYXNlIHlvdXIgcGF0Y2ggb250byB0aGUgbmV0LW5leHQKPiB0cmVlLCBvciBhdCBs
ZWFzdCBtZXJnZSBpbiB0aGUgWWFudGVuZycgc2VyaWVzIGluIHlvdXIgdHJlZSBhbmQKPiByZWJh
c2UgdGhlIHBhdGNoIG9udG8gaXQgYW5kIGxldCdzIGhvcGUgdGhlcmUgaGF2ZSBiZWVuIG5vIG90
aGVyCj4gY29uZmxpY3RpbmcgcGF0Y2hlcyBtZXJnZWQgaW4gaW50byB0aGUgbmV0LW5leHQgdHJl
ZS4KCkknbGwgdGFrZSBhIGxvb2sgaW50byB0aGF0LCB0aHgKCgpQLgoKPiAKPiAtU2VyZ2UoeSkK
PiAKPiAKPiA+IC0tLQo+ID4gwqAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbG9v
bmdzb24uY8KgIHwgMjUgKysrKystLS0tLS0tLS0tCj4gPiAtLS0tCj4gPiDCoC4uLi9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BjaS5jwqAgfCAxOCArKysrKy0tLS0tLS0tCj4g
PiDCoDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYy1sb29uZ3Nvbi5jCj4gPiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L2R3bWFjLWxvb25nc29uLmMKPiA+IGluZGV4IDllNDBjMjhkNDUzYS4uNWQ0MmE5ZmFkNjcyIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMt
bG9vbmdzb24uYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
ZHdtYWMtbG9vbmdzb24uYwo+ID4gQEAgLTUwLDcgKzUwLDcgQEAgc3RhdGljIGludCBsb29uZ3Nv
bl9kd21hY19wcm9iZShzdHJ1Y3QgcGNpX2Rldgo+ID4gKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lf
ZGV2aWNlX2lkCj4gPiDCoAlzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXQ7Cj4gPiDC
oAlzdHJ1Y3Qgc3RtbWFjX3Jlc291cmNlcyByZXM7Cj4gPiDCoAlzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wOwo+ID4gLQlpbnQgcmV0LCBpLCBwaHlfbW9kZTsKPiA+ICsJaW50IHJldCwgcGh5X21vZGU7
Cj4gPiDCoAo+ID4gwqAJbnAgPSBkZXZfb2Zfbm9kZSgmcGRldi0+ZGV2KTsKPiA+IMKgCj4gPiBA
QCAtODgsMTQgKzg4LDExIEBAIHN0YXRpYyBpbnQgbG9vbmdzb25fZHdtYWNfcHJvYmUoc3RydWN0
IHBjaV9kZXYKPiA+ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZAo+ID4gwqAJCWdv
dG8gZXJyX3B1dF9ub2RlOwo+ID4gwqAJfQo+ID4gwqAKPiA+IC0JLyogR2V0IHRoZSBiYXNlIGFk
ZHJlc3Mgb2YgZGV2aWNlICovCj4gPiAtCWZvciAoaSA9IDA7IGkgPCBQQ0lfU1REX05VTV9CQVJT
OyBpKyspIHsKPiA+IC0JCWlmIChwY2lfcmVzb3VyY2VfbGVuKHBkZXYsIGkpID09IDApCj4gPiAt
CQkJY29udGludWU7Cj4gPiAtCQlyZXQgPSBwY2ltX2lvbWFwX3JlZ2lvbnMocGRldiwgQklUKDAp
LAo+ID4gcGNpX25hbWUocGRldikpOwo+ID4gLQkJaWYgKHJldCkKPiA+IC0JCQlnb3RvIGVycl9k
aXNhYmxlX2RldmljZTsKPiA+IC0JCWJyZWFrOwo+ID4gKwltZW1zZXQoJnJlcywgMCwgc2l6ZW9m
KHJlcykpOwo+ID4gKwlyZXMuYWRkciA9IHBjaW1faW9tYXBfcmVnaW9uKHBkZXYsIDAsIHBjaV9u
YW1lKHBkZXYpKTsKPiA+ICsJaWYgKElTX0VSUihyZXMuYWRkcikpIHsKPiA+ICsJCXJldCA9IFBU
Ul9FUlIocmVzLmFkZHIpOwo+ID4gKwkJZ290byBlcnJfZGlzYWJsZV9kZXZpY2U7Cj4gPiDCoAl9
Cj4gPiDCoAo+ID4gwqAJcGxhdC0+YnVzX2lkID0gb2ZfYWxpYXNfZ2V0X2lkKG5wLCAiZXRoZXJu
ZXQiKTsKPiA+IEBAIC0xMTYsOCArMTEzLDYgQEAgc3RhdGljIGludCBsb29uZ3Nvbl9kd21hY19w
cm9iZShzdHJ1Y3QgcGNpX2Rldgo+ID4gKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lk
Cj4gPiDCoAo+ID4gwqAJbG9vbmdzb25fZGVmYXVsdF9kYXRhKHBsYXQpOwo+ID4gwqAJcGNpX2Vu
YWJsZV9tc2kocGRldik7Cj4gPiAtCW1lbXNldCgmcmVzLCAwLCBzaXplb2YocmVzKSk7Cj4gPiAt
CXJlcy5hZGRyID0gcGNpbV9pb21hcF90YWJsZShwZGV2KVswXTsKPiA+IMKgCj4gPiDCoAlyZXMu
aXJxID0gb2ZfaXJxX2dldF9ieW5hbWUobnAsICJtYWNpcnEiKTsKPiA+IMKgCWlmIChyZXMuaXJx
IDwgMCkgewo+ID4gQEAgLTE1OCwxOCArMTUzLDEwIEBAIHN0YXRpYyB2b2lkIGxvb25nc29uX2R3
bWFjX3JlbW92ZShzdHJ1Y3QKPiA+IHBjaV9kZXYgKnBkZXYpCj4gPiDCoHsKPiA+IMKgCXN0cnVj
dCBuZXRfZGV2aWNlICpuZGV2ID0gZGV2X2dldF9kcnZkYXRhKCZwZGV2LT5kZXYpOwo+ID4gwqAJ
c3RydWN0IHN0bW1hY19wcml2ICpwcml2ID0gbmV0ZGV2X3ByaXYobmRldik7Cj4gPiAtCWludCBp
Owo+ID4gwqAKPiA+IMKgCW9mX25vZGVfcHV0KHByaXYtPnBsYXQtPm1kaW9fbm9kZSk7Cj4gPiDC
oAlzdG1tYWNfZHZyX3JlbW92ZSgmcGRldi0+ZGV2KTsKPiA+IMKgCj4gPiAtCWZvciAoaSA9IDA7
IGkgPCBQQ0lfU1REX05VTV9CQVJTOyBpKyspIHsKPiA+IC0JCWlmIChwY2lfcmVzb3VyY2VfbGVu
KHBkZXYsIGkpID09IDApCj4gPiAtCQkJY29udGludWU7Cj4gPiAtCQlwY2ltX2lvdW5tYXBfcmVn
aW9ucyhwZGV2LCBCSVQoaSkpOwo+ID4gLQkJYnJlYWs7Cj4gPiAtCX0KPiA+IC0KPiA+IMKgCXBj
aV9kaXNhYmxlX21zaShwZGV2KTsKPiA+IMKgCXBjaV9kaXNhYmxlX2RldmljZShwZGV2KTsKPiA+
IMKgfQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L3N0bW1hY19wY2kuYwo+ID4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9z
dG1tYWNfcGNpLmMKPiA+IGluZGV4IDM1MmIwMTY3OGMyMi4uZjg5YThhNTRjNGU4IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BjaS5j
Cj4gPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcGNp
LmMKPiA+IEBAIC0xODgsMTEgKzE4OCwxMSBAQCBzdGF0aWMgaW50IHN0bW1hY19wY2lfcHJvYmUo
c3RydWN0IHBjaV9kZXYKPiA+ICpwZGV2LAo+ID4gwqAJCXJldHVybiByZXQ7Cj4gPiDCoAl9Cj4g
PiDCoAo+ID4gLQkvKiBHZXQgdGhlIGJhc2UgYWRkcmVzcyBvZiBkZXZpY2UgKi8KPiA+ICsJLyog
UmVxdWVzdCB0aGUgYmFzZSBhZGRyZXNzIEJBUiBvZiBkZXZpY2UgKi8KPiA+IMKgCWZvciAoaSA9
IDA7IGkgPCBQQ0lfU1REX05VTV9CQVJTOyBpKyspIHsKPiA+IMKgCQlpZiAocGNpX3Jlc291cmNl
X2xlbihwZGV2LCBpKSA9PSAwKQo+ID4gwqAJCQljb250aW51ZTsKPiA+IC0JCXJldCA9IHBjaW1f
aW9tYXBfcmVnaW9ucyhwZGV2LCBCSVQoaSksCj4gPiBwY2lfbmFtZShwZGV2KSk7Cj4gPiArCQly
ZXQgPSBwY2ltX3JlcXVlc3RfcmVnaW9uKHBkZXYsIGksCj4gPiBwY2lfbmFtZShwZGV2KSk7Cj4g
PiDCoAkJaWYgKHJldCkKPiA+IMKgCQkJcmV0dXJuIHJldDsKPiA+IMKgCQlicmVhazsKPiA+IEBA
IC0yMDUsNyArMjA1LDEwIEBAIHN0YXRpYyBpbnQgc3RtbWFjX3BjaV9wcm9iZShzdHJ1Y3QgcGNp
X2Rldgo+ID4gKnBkZXYsCj4gPiDCoAkJcmV0dXJuIHJldDsKPiA+IMKgCj4gPiDCoAltZW1zZXQo
JnJlcywgMCwgc2l6ZW9mKHJlcykpOwo+ID4gLQlyZXMuYWRkciA9IHBjaW1faW9tYXBfdGFibGUo
cGRldilbaV07Cj4gPiArCS8qIEdldCB0aGUgYmFzZSBhZGRyZXNzIG9mIGRldmljZSAqLwo+ID4g
KwlyZXMuYWRkciA9IHBjaW1faW9tYXAocGRldiwgaSwgMCk7Cj4gPiArCWlmICghcmVzLmFkZHIp
Cj4gPiArCQlyZXR1cm4gLUVOT01FTTsKPiA+IMKgCXJlcy53b2xfaXJxID0gcGRldi0+aXJxOwo+
ID4gwqAJcmVzLmlycSA9IHBkZXYtPmlycTsKPiA+IMKgCj4gPiBAQCAtMjMxLDE2ICsyMzQsNyBA
QCBzdGF0aWMgaW50IHN0bW1hY19wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYKPiA+ICpwZGV2LAo+
ID4gwqAgKi8KPiA+IMKgc3RhdGljIHZvaWQgc3RtbWFjX3BjaV9yZW1vdmUoc3RydWN0IHBjaV9k
ZXYgKnBkZXYpCj4gPiDCoHsKPiA+IC0JaW50IGk7Cj4gPiAtCj4gPiDCoAlzdG1tYWNfZHZyX3Jl
bW92ZSgmcGRldi0+ZGV2KTsKPiA+IC0KPiA+IC0JZm9yIChpID0gMDsgaSA8IFBDSV9TVERfTlVN
X0JBUlM7IGkrKykgewo+ID4gLQkJaWYgKHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgaSkgPT0gMCkK
PiA+IC0JCQljb250aW51ZTsKPiA+IC0JCXBjaW1faW91bm1hcF9yZWdpb25zKHBkZXYsIEJJVChp
KSk7Cj4gPiAtCQlicmVhazsKPiA+IC0JfQo+ID4gwqB9Cj4gPiDCoAo+ID4gwqBzdGF0aWMgaW50
IF9fbWF5YmVfdW51c2VkIHN0bW1hY19wY2lfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4g
PiAtLSAKPiA+IDIuNDYuMAo+ID4gCj4gPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
