Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C2C958093
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 10:09:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 960A1C6DD66;
	Tue, 20 Aug 2024 08:09:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 261D2C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 08:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724141384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Df70XQ1ykgUQrw1fVZpz027YZA27sohQWW93y4fszco=;
 b=KWJq0047esZBssF2KbIVpwJzEKo3YLfJndjvGgSC77EJt0fPN4LbNKsDS1pEYhICntw2zF
 CNDj5WteeS1ZZtaBB9vyTduKRGDVEZMBTb3eGtI8LNZKYmy9UxdTnUa62V3m5XSYsCxAP6
 4fUA8l+04Ngc/IJ2fD36xZk4FXWc2+U=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-ZyRRfWaAP3yaiAfw45-erw-1; Tue, 20 Aug 2024 04:09:42 -0400
X-MC-Unique: ZyRRfWaAP3yaiAfw45-erw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2f3f157cd18so189121fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 01:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724141381; x=1724746181;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pczNxSocdM26pcn5q5hEVOERw14zQBRp0K6rH/Gt/U8=;
 b=sbcSZxLyDfW6M//XaOfxXr1T4bM/6t46TvZuaxLUZJaCCrlzJ0l8B7brotOq4cnRj2
 mGPzK3OdAc5dUO62MRwjWGk1+TokwLWxBZqzOMfphAVjvE2wjruln+C1FLtg9k4mwoc/
 9I8iNmTB1+7MIDhWACQXw8kRgus0v7cBolGOFrdTxpBndvSQnia1Y3jSWd/nW4/2QQ6n
 NA5AIsH6GbJ7fxMUZvd8RBEBXwjelWP41c2ZHLp0Wr7qeihjosiLyOWuDuGFGY2tmoTc
 Rhkn7UfwqkOo1Uya1dtoe7fpzcQaXqcLVJiuUmzqHsA0LmXtrUq/lfeTzwP4HqaOZLYw
 uGaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq36CNsfjttEmq9YgxA2vVEYFMdLhfudiQMQMnPINxBbh3cz2HxTSSriCKENIi7p/X/liXx/1vdMcyKA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzpo7fftq5aaL/EH7jWT0ciIoB9Aa/GKFvjuu64/ut9P9/q9YLJ
 7IfI4sBLv12tngn26sTwH6SLqJfe9hIWVCTFp+Q20dM+yI/PnMo//rLtfc92dSxzCIw+lytRdFj
 0vE2L4Uvcbo4cQJ4i2+CA5fy0NBZtGD1mt2AxUl4DnX4onmpPCM0kn2Ot6gv6hqvW7icWJ/d6yk
 VoiA==
X-Received: by 2002:a05:651c:2211:b0:2ef:24a9:6aa8 with SMTP id
 38308e7fff4ca-2f3be3e14b8mr44110131fa.0.1724141380707; 
 Tue, 20 Aug 2024 01:09:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUKjHSOAziZ7PYgWrAVl4EdFwjiCRVXWWzixF1wxqW29HSPOlA0o0CuaPTeGWaikDKakA/tA==
X-Received: by 2002:a05:651c:2211:b0:2ef:24a9:6aa8 with SMTP id
 38308e7fff4ca-2f3be3e14b8mr44109861fa.0.1724141380001; 
 Tue, 20 Aug 2024 01:09:40 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dcc:1f00:bec1:681e:45eb:77e2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383935909sm728451466b.112.2024.08.20.01.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 01:09:39 -0700 (PDT)
Message-ID: <3e4288bb7300f3fd0883ff07b75ae69d0532019b.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, onathan Corbet
 <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, Wu Hao <hao.wu@intel.com>,
 Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>, Xu Yilun
 <yilun.xu@intel.com>,  Andy Shevchenko <andy@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alvaro Karsz <alvaro.karsz@solid-run.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Eugenio =?ISO-8859-1?Q?P=E9rez?=
 <eperezma@redhat.com>, Richard Cochran <richardcochran@gmail.com>, Mark
 Brown <broonie@kernel.org>
Date: Tue, 20 Aug 2024 10:09:37 +0200
In-Reply-To: <74e9109a-ac59-49e2-9b1d-d825c9c9f891@wanadoo.fr>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-10-pstanner@redhat.com>
 <74e9109a-ac59-49e2-9b1d-d825c9c9f891@wanadoo.fr>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

T24gTW9uLCAyMDI0LTA4LTE5IGF0IDIwOjE5ICswMjAwLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3Jv
dGU6Cj4gTGUgMTkvMDgvMjAyNCDDoCAxODo1MSwgUGhpbGlwcCBTdGFubmVyIGEgw6ljcml0wqA6
Cj4gPiBzb2xpZHJ1biB1dGlsaXplcyBwY2ltX2lvbWFwX3JlZ2lvbnMoKSwgd2hpY2ggaGFzIGJl
ZW4gZGVwcmVjYXRlZAo+ID4gYnkgdGhlCj4gPiBQQ0kgc3Vic3lzdGVtIGluIGNvbW1pdCBlMzU0
YmI4NGE0YzEgKCJQQ0k6IERlcHJlY2F0ZQo+ID4gcGNpbV9pb21hcF90YWJsZSgpLCBwY2ltX2lv
bWFwX3JlZ2lvbnNfcmVxdWVzdF9hbGwoKSIpLCBhbW9uZyBvdGhlcgo+ID4gdGhpbmdzIGJlY2F1
c2UgaXQgZm9yY2VzIHVzYWdlIG9mIHF1aXRlIGEgY29tcGxpY2F0ZWQgYml0bWFzawo+ID4gbWVj
aGFuaXNtLgo+ID4gVGhlIGJpdG1hc2sgaGFuZGxpbmcgY29kZSBjYW4gZW50aXJlbHkgYmUgcmVt
b3ZlZCBieSByZXBsYWNpbmcKPiA+IHBjaW1faW9tYXBfcmVnaW9ucygpIGFuZCBwY2ltX2lvbWFw
X3RhYmxlKCkuCj4gPiAKPiA+IFJlcGxhY2UgcGNpbV9pb21hcF9yZWdpb25zKCkgYW5kIHBjaW1f
aW9tYXBfdGFibGUoKSB3aXRoCj4gPiBwY2lfaW9tYXBfcmVnaW9uKCkuCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IFBoaWxpcHAgU3Rhbm5lciA8cHN0YW5uZXJAcmVkaGF0LmNvbT4KPiA+IC0tLQo+
ID4gwqAgZHJpdmVycy92ZHBhL3NvbGlkcnVuL3NuZXRfbWFpbi5jIHwgNDcgKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0KPiA+IC0tLS0tCj4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0
aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zk
cGEvc29saWRydW4vc25ldF9tYWluLmMKPiA+IGIvZHJpdmVycy92ZHBhL3NvbGlkcnVuL3NuZXRf
bWFpbi5jCj4gPiBpbmRleCA5OTQyOGEwNDA2OGQuLmFiZjAyN2NhMzVlMSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvdmRwYS9zb2xpZHJ1bi9zbmV0X21haW4uYwo+ID4gKysrIGIvZHJpdmVycy92
ZHBhL3NvbGlkcnVuL3NuZXRfbWFpbi5jCj4gPiBAQCAtNTU2LDMzICs1NTYsMjQgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMKPiA+IHNuZXRfY29uZmlnX29wcyA9IHsKPiA+
IMKgIHN0YXRpYyBpbnQgcHNuZXRfb3Blbl9wZl9iYXIoc3RydWN0IHBjaV9kZXYgKnBkZXYsIHN0
cnVjdCBwc25ldAo+ID4gKnBzbmV0KQo+ID4gwqAgewo+ID4gwqDCoAljaGFyIG5hbWVbNTBdOwo+
ID4gLQlpbnQgcmV0LCBpLCBtYXNrID0gMDsKPiA+ICsJaW50IGk7Cj4gPiArCj4gPiArCXNucHJp
bnRmKG5hbWUsIHNpemVvZihuYW1lKSwgInBzbmV0WyVzXS1iYXJzIiwKPiA+IHBjaV9uYW1lKHBk
ZXYpKTsKPiA+ICsKPiA+IMKgwqAJLyogV2UgZG9uJ3Qga25vdyB3aGljaCBCQVIgd2lsbCBiZSB1
c2VkIHRvIGNvbW11bmljYXRlLi4KPiA+IMKgwqAJICogV2Ugd2lsbCBtYXAgZXZlcnkgYmFyIHdp
dGggbGVuID4gMC4KPiA+IMKgwqAJICoKPiA+IMKgwqAJICogTGF0ZXIsIHdlIHdpbGwgZGlzY292
ZXIgdGhlIEJBUiBhbmQgdW5tYXAgYWxsIG90aGVyCj4gPiBCQVJzLgo+ID4gwqDCoAkgKi8KPiA+
IMKgwqAJZm9yIChpID0gMDsgaSA8IFBDSV9TVERfTlVNX0JBUlM7IGkrKykgewo+ID4gLQkJaWYg
KHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgaSkpCj4gPiAtCQkJbWFzayB8PSAoMSA8PCBpKTsKPiA+
IC0JfQo+ID4gLQo+ID4gLQkvKiBObyBCQVIgY2FuIGJlIHVzZWQuLiAqLwo+ID4gLQlpZiAoIW1h
c2spIHsKPiA+IC0JCVNORVRfRVJSKHBkZXYsICJGYWlsZWQgdG8gZmluZCBhIFBDSSBCQVJcbiIp
Owo+ID4gLQkJcmV0dXJuIC1FTk9ERVY7Cj4gPiAtCX0KPiA+IC0KPiA+IC0Jc25wcmludGYobmFt
ZSwgc2l6ZW9mKG5hbWUpLCAicHNuZXRbJXNdLWJhcnMiLAo+ID4gcGNpX25hbWUocGRldikpOwo+
ID4gLQlyZXQgPSBwY2ltX2lvbWFwX3JlZ2lvbnMocGRldiwgbWFzaywgbmFtZSk7Cj4gPiAtCWlm
IChyZXQpIHsKPiA+IC0JCVNORVRfRVJSKHBkZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBhbmQgbWFw
IFBDSQo+ID4gQkFSc1xuIik7Cj4gPiAtCQlyZXR1cm4gcmV0Owo+ID4gLQl9Cj4gPiArCQlpZiAo
cGNpX3Jlc291cmNlX2xlbihwZGV2LCBpKSkgewo+ID4gKwkJCXBzbmV0LT5iYXJzW2ldID0gcGNp
bV9pb21hcF9yZWdpb24ocGRldiwKPiA+IGksIG5hbWUpOwo+IAo+IEhpLAo+IAo+IFVucmVsYXRl
ZCB0byB0aGUgcGF0Y2gsIGJ1dCBpcyBpcyBzYWZlIHRvIGhhdmUgJ25hbWUnIGJlIG9uIHRoZQo+
IHN0YWNrPwo+IAo+IHBjaW1faW9tYXBfcmVnaW9uKCkKPiAtLT4gX19wY2ltX3JlcXVlc3RfcmVn
aW9uKCkKPiAtLT4gX19wY2ltX3JlcXVlc3RfcmVnaW9uX3JhbmdlKCkKPiAtLT4gcmVxdWVzdF9y
ZWdpb24oKSBvciBfX3JlcXVlc3RfbWVtX3JlZ2lvbigpCj4gLS0+IF9fcmVxdWVzdF9yZWdpb24o
KQo+IC0tPiBfX3JlcXVlc3RfcmVnaW9uX2xvY2tlZCgpCj4gLS0+IHJlcy0+bmFtZSA9IG5hbWU7
Cj4gCj4gU28gYW4gYWRkcmVzcyBvbiB0aGUgc3RhY2sgZW5kcyBpbiB0aGUgJ25hbWUnIGZpZWxk
IG9mIGEgInN0cnVjdAo+IHJlc291cmNlIi4KCk9oIG9oLi4uCgo+IAo+IEFjY29yZGluZyB0byBh
IGZldyBncmVwLCBpdCBsb29rcyByZWFsbHkgdW51c3VhbC4KPiAKPiBJIGRvbid0IGtub3cgaWYg
aXQgaXMgdXNlZCwgYnV0IGl0IGxvb2tzIHN0cmFuZ2UgdG8gbWUuCgoKSSBoYXZlIHNlZW4gaXQg
dXNlZCBpbiB0aGUga2VybmVsIHJpbmdidWZmZXIgbG9nIHdoZW4geW91IHRyeSB0bwpyZXF1ZXN0
IHNvbWV0aGluZyB0aGF0J3MgYWxyZWFkeSBvd25lZC4gSSB0aGluayBpdCdzIGhlcmUsIHJpZ2h0
IGluCl9fcmVxdWVzdF9yZWdpb25fbG9ja2VkKCk6CgovKgogKiBtbS9obW0uYyByZXNlcnZlcyBw
aHlzaWNhbCBhZGRyZXNzZXMgd2hpY2ggdGhlbgogKiBiZWNvbWUgdW5hdmFpbGFibGUgdG8gb3Ro
ZXIgdXNlcnMuICBDb25mbGljdHMgYXJlCiAqIG5vdCBleHBlY3RlZC4gIFdhcm4gdG8gYWlkIGRl
YnVnZ2luZyBpZiBlbmNvdW50ZXJlZC4KICovCmlmIChjb25mbGljdC0+ZGVzYyA9PSBJT1JFU19E
RVNDX0RFVklDRV9QUklWQVRFX01FTU9SWSkgewoJcHJfd2FybigiVW5hZGRyZXNzYWJsZSBkZXZp
Y2UgJXMgJXBSIGNvbmZsaWN0cyB3aXRoICVwUiIsCgkJY29uZmxpY3QtPm5hbWUsIGNvbmZsaWN0
LCByZXMpOwp9CgoKQXNzdW1pbmcgSSBpbnRlcnByZXQgdGhlIGNvZGUgY29ycmVjdGx5OgpUaGUg
Y29uZmxpY3RpbmcgcmVzb3VyY2UgaXMgZm91bmQgd2hlbiBhIG5ldyBjYWxsZXIgKGUuZy4gYW5v
dGhlcgpkcml2ZXIpIHRyaWVzIHRvIGdldCB0aGUgc2FtZSByZWdpb24uIFNvIGNvbmZsaWN0LT5u
YW1lIG9uIHRoZSBvcmlnaW5hbApyZXF1ZXN0ZXIncyBzdGFjayBpcyBieSBub3cgZ29uZSBhbmQg
eW91IGRvIGdldCBVQi4KClZlcnkgdW5saWtlbHkgVUIsIHNpbmNlIG9ubHkgcmFyZWx5IGRyaXZl
cnMgcmFjZSBmb3IgdGhlIHNhbWUgcmVzb3VyY2UsCmJ1dCBzdGlsbCBVQi4KCkJ1dCB0aGVyZSdz
IGFsc28gYSBmZXcgb3RoZXIgcGxhY2VzLiBHcmVwIGZvciAiY29uZmxpY3QtPm5hbWUiLgoKPiAK
PiAKPiBJZiBpdCBpcyBhbiBpc3N1ZSwgaXQgd2FzIGFwcGFyZW50bHkgYWxyZWFkeSB0aGVyZSBi
ZWZvcmUgdGhpcyBwYXRjaC4KCkkgdGhpbmsgdGhpcyBoYXMgdG8gYmUgZml4ZWQuCgpRdWVzdGlv
biB3b3VsZCBqdXN0IGJlIHdoZXRoZXIgb25lIHdhbnRzIHRvIGZpeCBpdCBsb2NhbGx5IGluIHRo
aXMKZHJpdmVyLCBvciBwcmV2ZW50IGl0IGZyb20gaGFwcGVuaW5nIGdsb2JhbGx5IGJ5IG1ha2lu
ZyB0aGUgY29tbW9uCmluZnJhc3RydWN0dXJlIGNvcHkgdGhlIHN0cmluZy4KCgpQLgoKCj4gCj4g
PiArCQkJaWYgKElTX0VSUihwc25ldC0+YmFyc1tpXSkpIHsKPiA+ICsJCQkJU05FVF9FUlIocGRl
diwgIkZhaWxlZCB0byByZXF1ZXN0Cj4gPiBhbmQgbWFwIFBDSSBCQVJzXG4iKTsKPiA+ICsJCQkJ
cmV0dXJuIFBUUl9FUlIocHNuZXQtPmJhcnNbaV0pOwo+ID4gKwkJCX0KPiA+ICsJCX0KPiA+IMKg
IAo+ID4gLQlmb3IgKGkgPSAwOyBpIDwgUENJX1NURF9OVU1fQkFSUzsgaSsrKSB7Cj4gPiAtCQlp
ZiAobWFzayAmICgxIDw8IGkpKQo+ID4gLQkJCXBzbmV0LT5iYXJzW2ldID0KPiA+IHBjaW1faW9t
YXBfdGFibGUocGRldilbaV07Cj4gPiDCoMKgCX0KPiA+IMKgIAo+ID4gwqDCoAlyZXR1cm4gMDsK
PiA+IEBAIC01OTEsMTggKzU4MiwxNSBAQCBzdGF0aWMgaW50IHBzbmV0X29wZW5fcGZfYmFyKHN0
cnVjdCBwY2lfZGV2Cj4gPiAqcGRldiwgc3RydWN0IHBzbmV0ICpwc25ldCkKPiA+IMKgIHN0YXRp
YyBpbnQgc25ldF9vcGVuX3ZmX2JhcihzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0IHNuZXQK
PiA+ICpzbmV0KQo+ID4gwqAgewo+ID4gwqDCoAljaGFyIG5hbWVbNTBdOwo+ID4gLQlpbnQgcmV0
Owo+ID4gwqAgCj4gPiDCoMKgCXNucHJpbnRmKG5hbWUsIHNpemVvZihuYW1lKSwgInNuZXRbJXNd
LWJhciIsCj4gPiBwY2lfbmFtZShwZGV2KSk7Cj4gPiDCoMKgCS8qIFJlcXVlc3QgYW5kIG1hcCBC
QVIgKi8KPiA+IC0JcmV0ID0gcGNpbV9pb21hcF9yZWdpb25zKHBkZXYsIEJJVChzbmV0LT5wc25l
dC0KPiA+ID5jZmcudmZfYmFyKSwgbmFtZSk7Cj4gPiAtCWlmIChyZXQpIHsKPiA+ICsJc25ldC0+
YmFyID0gcGNpbV9pb21hcF9yZWdpb24ocGRldiwgc25ldC0+cHNuZXQtCj4gPiA+Y2ZnLnZmX2Jh
ciwgbmFtZSk7Cj4gCj4gU2FtZQo+IAo+IEp1c3QgbXkgMmMuCj4gCj4gQ0oKPiAKPiA+ICsJaWYg
KElTX0VSUihzbmV0LT5iYXIpKSB7Cj4gPiDCoMKgCQlTTkVUX0VSUihwZGV2LCAiRmFpbGVkIHRv
IHJlcXVlc3QgYW5kIG1hcCBQQ0kgQkFSCj4gPiBmb3IgYSBWRlxuIik7Cj4gPiAtCQlyZXR1cm4g
cmV0Owo+ID4gKwkJcmV0dXJuIFBUUl9FUlIoc25ldC0+YmFyKTsKPiA+IMKgwqAJfQo+ID4gwqAg
Cj4gPiAtCXNuZXQtPmJhciA9IHBjaW1faW9tYXBfdGFibGUocGRldilbc25ldC0+cHNuZXQtCj4g
PiA+Y2ZnLnZmX2Jhcl07Cj4gPiAtCj4gPiDCoMKgCXJldHVybiAwOwo+ID4gwqAgfQo+ID4gwqAg
Cj4gPiBAQCAtNjUwLDE1ICs2MzgsMTIgQEAgc3RhdGljIGludCBwc25ldF9kZXRlY3RfYmFyKHN0
cnVjdCBwc25ldAo+ID4gKnBzbmV0LCB1MzIgb2ZmKQo+ID4gwqAgCj4gPiDCoCBzdGF0aWMgdm9p
ZCBwc25ldF91bm1hcF91bnVzZWRfYmFycyhzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0Cj4g
PiBwc25ldCAqcHNuZXQpCj4gPiDCoCB7Cj4gPiAtCWludCBpLCBtYXNrID0gMDsKPiA+ICsJaW50
IGk7Cj4gPiDCoCAKPiA+IMKgwqAJZm9yIChpID0gMDsgaSA8IFBDSV9TVERfTlVNX0JBUlM7IGkr
Kykgewo+ID4gwqDCoAkJaWYgKHBzbmV0LT5iYXJzW2ldICYmIGkgIT0gcHNuZXQtPmJhcm5vKQo+
ID4gLQkJCW1hc2sgfD0gKDEgPDwgaSk7Cj4gPiArCQkJcGNpbV9pb3VubWFwX3JlZ2lvbihwZGV2
LCBpKTsKPiA+IMKgwqAJfQo+ID4gLQo+ID4gLQlpZiAobWFzaykKPiA+IC0JCXBjaW1faW91bm1h
cF9yZWdpb25zKHBkZXYsIG1hc2spOwo+ID4gwqAgfQo+ID4gwqAgCj4gPiDCoCAvKiBSZWFkIFNO
RVQgY29uZmlnIGZyb20gUENJIEJBUiAqLwo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
