Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F00A959772
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 12:00:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF1B1C6DD9A;
	Wed, 21 Aug 2024 10:00:42 +0000 (UTC)
Received: from msa.smtpout.orange.fr (smtp-84.smtpout.orange.fr [80.12.242.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE170C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 10:00:35 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id gi8bsVe5vQYYugi8bs0j4Z; Wed, 21 Aug 2024 12:00:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1724234435;
 bh=w6AIYrBySrGuhkddExNCWqzXmH7gBMeTgtXfKwkDmGI=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=QxT2yLCSf3emNohfH/QMtChqPSQqqWCz+jg4/sJ1vsmTOCfCHpgaAvyqx/WbsPUgZ
 j0w3Ifi/pO/A9j3NexJSl4xUQGdgAwPSojkhWMogfJYjmNkm75D5FBLvWvzBfsoLnx
 RtgE/n5BJ2UFiEIPD8sFOVl2YVWvD1WoFHghd/fnChM3vrdlWGJ60YZx+cSO1POKe/
 UrZjsxDAjN7K04ZUGLvQezWqRv7RkY5CN3xSXxVmxM1ACtkvF+GMWCeH8yp3vLp82I
 DfoFXgyExAGvtjtoSmSR/NevfVwszwgh3H/mUaKphifhnf+W+FZJJpCz9TpFGY61l8
 ZEZ3P0e9kIg0Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 21 Aug 2024 12:00:35 +0200
X-ME-IP: 90.11.132.44
Message-ID: <40db668d-8e8b-4782-8a0b-4a0e9965f086@wanadoo.fr>
Date: Wed, 21 Aug 2024 12:00:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Philipp Stanner <pstanner@redhat.com>
References: <20240821071842.8591-2-pstanner@redhat.com>
 <20240821071842.8591-9-pstanner@redhat.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240821071842.8591-9-pstanner@redhat.com>
Cc: linux-doc@vger.kernel.org, alvaro.karsz@solid-run.com,
 linux-pci@vger.kernel.org, linus.walleij@linaro.org, bhelgaas@google.com,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 xuanzhuo@linux.alibaba.com, corbet@lwn.net, brgl@bgdev.pl, mst@redhat.com,
 eperezma@redhat.com, joabreu@synopsys.com, trix@redhat.com, kuba@kernel.org,
 dlechner@baylibre.com, jasowang@redhat.com, hao.wu@intel.com, axboe@kernel.dk,
 richardcochran@gmail.com, u.kleine-koenig@pengutronix.de,
 virtualization@lists.linux.dev, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, broonie@kernel.org, christophe.jaillet@wanadoo.fr,
 hare@suse.de, kbusch@kernel.org, linux-arm-kernel@lists.infradead.org,
 andy@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, yilun.xu@intel.com,
 dlemoal@kernel.org, mcoquelin.stm32@gmail.com, mdf@kernel.org,
 linux-fpga@vger.kernel.org, davem@davemloft.net
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

TGUgMjEvMDgvMjAyNCDDoCAwOToxOCwgUGhpbGlwcCBTdGFubmVyIGEgw6ljcml0wqA6Cj4gSW4g
cHNuZXRfb3Blbl9wZl9iYXIoKSBhIHN0cmluZyBsYXRlciBwYXNzZWQgdG8gcGNpbV9pb21hcF9y
ZWdpb25zKCkgaXMKPiBwbGFjZWQgb24gdGhlIHN0YWNrLiBOZWl0aGVyIHBjaW1faW9tYXBfcmVn
aW9ucygpIG5vciB0aGUgZnVuY3Rpb25zIGl0Cj4gY2FsbHMgY29weSB0aGF0IHN0cmluZy4KPiAK
PiBTaG91bGQgdGhlIHN0cmluZyBsYXRlciBldmVyIGJlIHVzZWQsIHRoaXMsIGNvbnNlcXVlbnRs
eSwgY2F1c2VzCj4gdW5kZWZpbmVkIGJlaGF2aW9yIHNpbmNlIHRoZSBzdGFjayBmcmFtZSB3aWxs
IGJ5IHRoZW4gaGF2ZSBkaXNhcHBlYXJlZC4KPiAKPiBGaXggdGhlIGJ1ZyBieSBhbGxvY2F0aW5n
IHRoZSBzdHJpbmcgb24gdGhlIGhlYXAgdGhyb3VnaAo+IGRldm1fa2FzcHJpbnRmKCkuCj4gCj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcJIyB2Ni4zCj4gRml4ZXM6IDUxYThmOWQ3ZjU4NyAo
InZpcnRpbzogdmRwYTogbmV3IFNvbGlkTkVUIERQVSBkcml2ZXIuIikKPiBSZXBvcnRlZC1ieTog
Q2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4KPiBDbG9z
ZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC83NGU5MTA5YS1hYzU5LTQ5ZTItOWIxZC1k
ODI1YzljOWY4OTFAd2FuYWRvby5mci8KPiBTdWdnZXN0ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8
YW5keUBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHAgU3Rhbm5lciA8cHN0YW5u
ZXJAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmRwYS9zb2xpZHJ1bi9zbmV0X21haW4u
YyB8IDcgKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL3NvbGlkcnVuL3NuZXRfbWFp
bi5jIGIvZHJpdmVycy92ZHBhL3NvbGlkcnVuL3NuZXRfbWFpbi5jCj4gaW5kZXggOTk0MjhhMDQw
NjhkLi40ZDQyYTA1ZDcwZmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92ZHBhL3NvbGlkcnVuL3Nu
ZXRfbWFpbi5jCj4gKysrIGIvZHJpdmVycy92ZHBhL3NvbGlkcnVuL3NuZXRfbWFpbi5jCj4gQEAg
LTU1NSw3ICs1NTUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZkcGFfY29uZmlnX29wcyBzbmV0
X2NvbmZpZ19vcHMgPSB7Cj4gICAKPiAgIHN0YXRpYyBpbnQgcHNuZXRfb3Blbl9wZl9iYXIoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYsIHN0cnVjdCBwc25ldCAqcHNuZXQpCgpzbmV0X29wZW5fdmZfYmFy
KCkgYWxzbyBuZWVkcyB0aGUgc2FtZSBtb2RpZmljYXRpb24gKHNlZSBBbmR5J3MgY29tbWVudCAK
b24gcGF0Y2ggOC85KQoKQ0oKCj4gICB7Cj4gLQljaGFyIG5hbWVbNTBdOwo+ICsJY2hhciAqbmFt
ZTsKPiAgIAlpbnQgcmV0LCBpLCBtYXNrID0gMDsKPiAgIAkvKiBXZSBkb24ndCBrbm93IHdoaWNo
IEJBUiB3aWxsIGJlIHVzZWQgdG8gY29tbXVuaWNhdGUuLgo+ICAgCSAqIFdlIHdpbGwgbWFwIGV2
ZXJ5IGJhciB3aXRoIGxlbiA+IDAuCj4gQEAgLTU3Myw3ICs1NzMsMTAgQEAgc3RhdGljIGludCBw
c25ldF9vcGVuX3BmX2JhcihzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0IHBzbmV0ICpwc25l
dCkKPiAgIAkJcmV0dXJuIC1FTk9ERVY7Cj4gICAJfQo+ICAgCj4gLQlzbnByaW50ZihuYW1lLCBz
aXplb2YobmFtZSksICJwc25ldFslc10tYmFycyIsIHBjaV9uYW1lKHBkZXYpKTsKPiArCW5hbWUg
PSBkZXZtX2thc3ByaW50ZigmcGRldi0+ZGV2LCBHRlBfS0VSTkVMLCAicHNuZXRbJXNdLWJhcnMi
LCBwY2lfbmFtZShwZGV2KSk7Cj4gKwlpZiAoIW5hbWUpCj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4g
Kwo+ICAgCXJldCA9IHBjaW1faW9tYXBfcmVnaW9ucyhwZGV2LCBtYXNrLCBuYW1lKTsKPiAgIAlp
ZiAocmV0KSB7Cj4gICAJCVNORVRfRVJSKHBkZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBhbmQgbWFw
IFBDSSBCQVJzXG4iKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
