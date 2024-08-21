Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FF0959BBD
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 14:26:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3505C6DD9D;
	Wed, 21 Aug 2024 12:26:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9B0FC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 12:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724243165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kW2VqGrolN/VEoRIr+pu9F37y2nTmIqDv+Snge4AAqg=;
 b=e/qZqaCSvFNCWfptF/YkL18R0ShKsiuqGE6cOjxSlyMuIbgKEEPxci85tJccc+diT8KLV5
 /L7WNPLR3BgH9VlzOEm4/S2hxoMe5h7GG1v26hLeFRx8O6vdw0aFDtI3yeslQoVwTE4a+e
 SwlbnvYwb2UGk6xz3V9EiRyhXG/+F48=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-rIi05PcrP-ON-QTKe2e3oA-1; Wed, 21 Aug 2024 08:26:04 -0400
X-MC-Unique: rIi05PcrP-ON-QTKe2e3oA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6bf6d3e210eso72348516d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 05:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724243164; x=1724847964;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F+8Zd9p9xEaFFxq9bSwT6CVTjqvDBBcELEezra/NBmQ=;
 b=Mu2Ksiiaal85+V4sfbbe+ZpxA9d8ICHQbtr+IVUkEX2IOLF4Cf1TM9GF44r7GlCAu8
 MrbebqkQzYKc49az+K8dZgC+AR2i3gCziGHs5tAV+LP1Lne5oTKjySBRpcNhgJgk5i+a
 puGhpk6cnrt3iBA01wpcI38u7uzytIAn+Z9zcrMb2EuCG2FyRpyQCfgs5kfHl8kn2hK7
 gMUXRPcAzMuRAqhz4C4qSIWb2OiJKOXCR/OkZXnkV98Pm3PrCPoNts8p3mXJn3DaoRlc
 kiWcEiXLqes39enG2oqalMf8safAN8hRo+cIvvGXM3GP+M6XUmjBcIMNRZaaRf6Hue0+
 Tntw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUtARI8duHbNUvOgEcBfcU47chNdcdQ6LYN1JmWkfltvQaFHklxD1RBJMZRgMY4I0dkjJGn2vkdwk7ew==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw+sCG5c3mpWUPfWj7qklb/Fd+aWG0PgrtPVzv3TF6iU9UhTFdw
 w+YMxSLnhOOl0bNjHRO6mR1qE/qHIYex1uIwTnojt2xIpvdpu1BqJfaRbWkVYi0f1pMXWMZaLLT
 9ZdmNub51jPrIAO+hKHepCm1BQWBFW5WMblc7tEEdPeYdRdqAiY+GqZOdG3kASMeD0vboAFntmw
 3mRg==
X-Received: by 2002:a05:6214:4881:b0:6bf:a721:9945 with SMTP id
 6a1803df08f44-6c1567fabf5mr30554746d6.24.1724243163962; 
 Wed, 21 Aug 2024 05:26:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0sBOMGGLa2XcF/yRLMaOTYNrH07fkAWiC1e2c/uh8oASqBZoK+O1goCyf57ZnaX9oaF0YiA==
X-Received: by 2002:a05:6214:4881:b0:6bf:a721:9945 with SMTP id
 6a1803df08f44-6c1567fabf5mr30554416d6.24.1724243163535; 
 Wed, 21 Aug 2024 05:26:03 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bf6ff0dcdasm60220946d6.140.2024.08.21.05.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 05:26:03 -0700 (PDT)
Message-ID: <cf9591d720c9b25dafd46b627ff8b6ed9f417745.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Date: Wed, 21 Aug 2024 14:25:57 +0200
In-Reply-To: <20240821081213-mutt-send-email-mst@kernel.org>
References: <20240821071842.8591-2-pstanner@redhat.com>
 <20240821071842.8591-9-pstanner@redhat.com>
 <20240821081213-mutt-send-email-mst@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: linux-doc@vger.kernel.org, Alvaro Karsz <alvaro.karsz@solid-run.com>,
 Tom Rix <trix@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-pci@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
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
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Xu Yilun <yilun.xu@intel.com>, Damien Le Moal <dlemoal@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-fpga@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 7/9] vdpa: solidrun: Fix potential UB
	bug with devres
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

T24gV2VkLCAyMDI0LTA4LTIxIGF0IDA4OjEyIC0wNDAwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3Jv
dGU6Cj4gT24gV2VkLCBBdWcgMjEsIDIwMjQgYXQgMDk6MTg6NDBBTSArMDIwMCwgUGhpbGlwcCBT
dGFubmVyIHdyb3RlOgo+ID4gSW4gcHNuZXRfb3Blbl9wZl9iYXIoKSBhIHN0cmluZyBsYXRlciBw
YXNzZWQgdG8KPiA+IHBjaW1faW9tYXBfcmVnaW9ucygpIGlzCj4gPiBwbGFjZWQgb24gdGhlIHN0
YWNrLiBOZWl0aGVyIHBjaW1faW9tYXBfcmVnaW9ucygpIG5vciB0aGUgZnVuY3Rpb25zCj4gPiBp
dAo+ID4gY2FsbHMgY29weSB0aGF0IHN0cmluZy4KPiA+IAo+ID4gU2hvdWxkIHRoZSBzdHJpbmcg
bGF0ZXIgZXZlciBiZSB1c2VkLCB0aGlzLCBjb25zZXF1ZW50bHksIGNhdXNlcwo+ID4gdW5kZWZp
bmVkIGJlaGF2aW9yIHNpbmNlIHRoZSBzdGFjayBmcmFtZSB3aWxsIGJ5IHRoZW4gaGF2ZQo+ID4g
ZGlzYXBwZWFyZWQuCj4gPiAKPiA+IEZpeCB0aGUgYnVnIGJ5IGFsbG9jYXRpbmcgdGhlIHN0cmlu
ZyBvbiB0aGUgaGVhcCB0aHJvdWdoCj4gPiBkZXZtX2thc3ByaW50ZigpLgo+ID4gCj4gPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwkjIHY2LjMKPiA+IEZpeGVzOiA1MWE4ZjlkN2Y1ODcgKCJ2
aXJ0aW86IHZkcGE6IG5ldyBTb2xpZE5FVCBEUFUgZHJpdmVyLiIpCj4gPiBSZXBvcnRlZC1ieTog
Q2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4KPiA+IENs
b3NlczoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC83NGU5MTA5YS1hYzU5LTQ5ZTIt
OWIxZC1kODI1YzljOWY4OTFAd2FuYWRvby5mci8KPiA+IFN1Z2dlc3RlZC1ieTogQW5keSBTaGV2
Y2hlbmtvIDxhbmR5QGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFN0YW5u
ZXIgPHBzdGFubmVyQHJlZGhhdC5jb20+Cj4gCj4gSSBkb24ndCBnZXQgd2h5IGlzIHRoaXMgYSBw
YXJ0IG9mIGEgY2xlYW51cCBzZXJpZXMgLQo+IGxvb2tzIGxpa2UgYW4gdW5yZWxhdGVkIGJ1Z2Zp
eD8KCkl0IHdhcyBkaXNjb3ZlcmVkIGluIHRoZSBkaXNjdXNzaW9uIG9mIHYxIG9mIHRoaXMgc2Vy
aWVzLgoKSXQgaW5kZWVkIGlzIGFuIHVucmVsYXRlZCBidWdmaXggYW5kIGNvdWxkIGJlIG1lcmdl
ZCBzZXBhcmF0ZWx5LiBCdXQgbXkKcGF0Y2ggIzggZGVwZW5kcyBvbiBpdC4KClNvIGl0IHdvdWxk
IGJlIGNvbnZlbmllbnQgdG8gbWVyZ2UgaXQgaW50byBtYWlubGluZSB0aHJvdWdoIHRoaXMKc2Vy
aWVzLCBhbmQgaGF2ZSBzdGFibGUganVzdCBwaWNrIHBhdGNoICM3LgoKT3Igc2hvdWxkIGl0IGJl
IGRvbmUgZGlmZmVyZW50bHksIGluIHlvdXIgb3Bpbmlvbj8KClAuCgo+IAo+IAo+ID4gLS0tCj4g
PiDCoGRyaXZlcnMvdmRwYS9zb2xpZHJ1bi9zbmV0X21haW4uYyB8IDcgKysrKystLQo+ID4gwqAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL3NvbGlkcnVuL3NuZXRfbWFpbi5jCj4gPiBiL2RyaXZl
cnMvdmRwYS9zb2xpZHJ1bi9zbmV0X21haW4uYwo+ID4gaW5kZXggOTk0MjhhMDQwNjhkLi40ZDQy
YTA1ZDcwZmMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3ZkcGEvc29saWRydW4vc25ldF9tYWlu
LmMKPiA+ICsrKyBiL2RyaXZlcnMvdmRwYS9zb2xpZHJ1bi9zbmV0X21haW4uYwo+ID4gQEAgLTU1
NSw3ICs1NTUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZkcGFfY29uZmlnX29wcwo+ID4gc25l
dF9jb25maWdfb3BzID0gewo+ID4gwqAKPiA+IMKgc3RhdGljIGludCBwc25ldF9vcGVuX3BmX2Jh
cihzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0IHBzbmV0Cj4gPiAqcHNuZXQpCj4gPiDCoHsK
PiA+IC0JY2hhciBuYW1lWzUwXTsKPiA+ICsJY2hhciAqbmFtZTsKPiA+IMKgCWludCByZXQsIGks
IG1hc2sgPSAwOwo+ID4gwqAJLyogV2UgZG9uJ3Qga25vdyB3aGljaCBCQVIgd2lsbCBiZSB1c2Vk
IHRvIGNvbW11bmljYXRlLi4KPiA+IMKgCSAqIFdlIHdpbGwgbWFwIGV2ZXJ5IGJhciB3aXRoIGxl
biA+IDAuCj4gPiBAQCAtNTczLDcgKzU3MywxMCBAQCBzdGF0aWMgaW50IHBzbmV0X29wZW5fcGZf
YmFyKHN0cnVjdCBwY2lfZGV2Cj4gPiAqcGRldiwgc3RydWN0IHBzbmV0ICpwc25ldCkKPiA+IMKg
CQlyZXR1cm4gLUVOT0RFVjsKPiA+IMKgCX0KPiA+IMKgCj4gPiAtCXNucHJpbnRmKG5hbWUsIHNp
emVvZihuYW1lKSwgInBzbmV0WyVzXS1iYXJzIiwKPiA+IHBjaV9uYW1lKHBkZXYpKTsKPiA+ICsJ
bmFtZSA9IGRldm1fa2FzcHJpbnRmKCZwZGV2LT5kZXYsIEdGUF9LRVJORUwsICJwc25ldFslc10t
Cj4gPiBiYXJzIiwgcGNpX25hbWUocGRldikpOwo+ID4gKwlpZiAoIW5hbWUpCj4gPiArCQlyZXR1
cm4gLUVOT01FTTsKPiA+ICsKPiA+IMKgCXJldCA9IHBjaW1faW9tYXBfcmVnaW9ucyhwZGV2LCBt
YXNrLCBuYW1lKTsKPiA+IMKgCWlmIChyZXQpIHsKPiA+IMKgCQlTTkVUX0VSUihwZGV2LCAiRmFp
bGVkIHRvIHJlcXVlc3QgYW5kIG1hcCBQQ0kKPiA+IEJBUnNcbiIpOwo+ID4gLS0gCj4gPiAyLjQ2
LjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
