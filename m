Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E043395B884
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Aug 2024 16:34:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96358C71287;
	Thu, 22 Aug 2024 14:34:45 +0000 (UTC)
Received: from msa.smtpout.orange.fr (smtp-77.smtpout.orange.fr [80.12.242.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9F90C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 14:34:37 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id h8tQstrBMiKc3h8tQsUpzP; Thu, 22 Aug 2024 16:34:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1724337277;
 bh=hgzwBNoQY1MSKy8JqHT/xV1IQZfbcxzXziAOuuVi2Sk=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=neM6rCS1kmMJzPrHHqX9sK83O4PsWimcoBx2ciYUu4jh26tfT2sMCE4s40UqlTBAH
 4pFKq4KHjULk2fe4+fZ6VRyJeAMgtIfp+oGyCLsXgB/r4SDqjIC/klUcXqwPb+3hQq
 ADRdhkenk9OWOrEaS8Hwi6UcoL5ewwojw0zKgoHhyvgrV2QhZTBwmYx8O2aZ0e2M88
 ZbXlyF72bZipSOn5Vm9AiwL51amFk+l6PuHU3X+CkjQbwkYfL10zN0jD1hSy2FovO+
 n7u40WNIDo7cZt+P9gzfX3w8nCFiCUTY/aW2H2xUer/PM7tucP4iPsw8K9YXBmfbtp
 C7vH87XzyANow==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 22 Aug 2024 16:34:37 +0200
X-ME-IP: 90.11.132.44
Message-ID: <81de3898-9af7-4ad1-80ef-68d1f60d4c28@wanadoo.fr>
Date: Thu, 22 Aug 2024 16:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Philipp Stanner <pstanner@redhat.com>
References: <20240822134744.44919-1-pstanner@redhat.com>
 <20240822134744.44919-8-pstanner@redhat.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240822134744.44919-8-pstanner@redhat.com>
Cc: linux-doc@vger.kernel.org, alvaro.karsz@solid-run.com,
 linux-pci@vger.kernel.org, linus.walleij@linaro.org, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, xuanzhuo@linux.alibaba.com,
 corbet@lwn.net, brgl@bgdev.pl, mst@redhat.com, eperezma@redhat.com,
 joabreu@synopsys.com, trix@redhat.com, kuba@kernel.org, dlechner@baylibre.com,
 jasowang@redhat.com, hao.wu@intel.com, axboe@kernel.dk, kch@nvidia.com,
 richardcochran@gmail.com, u.kleine-koenig@pengutronix.de,
 virtualization@lists.linux.dev, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, broonie@kernel.org, christophe.jaillet@wanadoo.fr,
 hare@suse.de, bhelgaas@google.com, linux-arm-kernel@lists.infradead.org,
 andy@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, yilun.xu@intel.com,
 dlemoal@kernel.org, mcoquelin.stm32@gmail.com, mdf@kernel.org,
 linux-fpga@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v3 7/9] vdpa: solidrun: Fix UB bug with
	devres
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

TGUgMjIvMDgvMjAyNCDDoCAxNTo0NywgUGhpbGlwcCBTdGFubmVyIGEgw6ljcml0wqA6Cj4gSW4g
cHNuZXRfb3Blbl9wZl9iYXIoKSBhbmQgc25ldF9vcGVuX3ZmX2JhcigpIGEgc3RyaW5nIGxhdGVy
IHBhc3NlZCB0bwo+IHBjaW1faW9tYXBfcmVnaW9ucygpIGlzIHBsYWNlZCBvbiB0aGUgc3RhY2su
IE5laXRoZXIKPiBwY2ltX2lvbWFwX3JlZ2lvbnMoKSBub3IgdGhlIGZ1bmN0aW9ucyBpdCBjYWxs
cyBjb3B5IHRoYXQgc3RyaW5nLgo+IAo+IFNob3VsZCB0aGUgc3RyaW5nIGxhdGVyIGV2ZXIgYmUg
dXNlZCwgdGhpcywgY29uc2VxdWVudGx5LCBjYXVzZXMKPiB1bmRlZmluZWQgYmVoYXZpb3Igc2lu
Y2UgdGhlIHN0YWNrIGZyYW1lIHdpbGwgYnkgdGhlbiBoYXZlIGRpc2FwcGVhcmVkLgo+IAo+IEZp
eCB0aGUgYnVnIGJ5IGFsbG9jYXRpbmcgdGhlIHN0cmluZ3Mgb24gdGhlIGhlYXAgdGhyb3VnaAo+
IGRldm1fa2FzcHJpbnRmKCkuCj4gCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcJIyB2Ni4z
Cj4gRml4ZXM6IDUxYThmOWQ3ZjU4NyAoInZpcnRpbzogdmRwYTogbmV3IFNvbGlkTkVUIERQVSBk
cml2ZXIuIikKPiBSZXBvcnRlZC1ieTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmph
aWxsZXRAd2FuYWRvby5mcj4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC83
NGU5MTA5YS1hYzU5LTQ5ZTItOWIxZC1kODI1YzljOWY4OTFAd2FuYWRvby5mci8KPiBTdWdnZXN0
ZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5keUBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6
IFBoaWxpcHAgU3Rhbm5lciA8cHN0YW5uZXJAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMv
dmRwYS9zb2xpZHJ1bi9zbmV0X21haW4uYyB8IDEzICsrKysrKysrKy0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmRwYS9zb2xpZHJ1bi9zbmV0X21haW4uYyBiL2RyaXZlcnMvdmRwYS9zb2xpZHJ1
bi9zbmV0X21haW4uYwo+IGluZGV4IDk5NDI4YTA0MDY4ZC4uNjcyMzVmNjE5MGVmIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvdmRwYS9zb2xpZHJ1bi9zbmV0X21haW4uYwo+ICsrKyBiL2RyaXZlcnMv
dmRwYS9zb2xpZHJ1bi9zbmV0X21haW4uYwo+IEBAIC01NTUsNyArNTU1LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCB2ZHBhX2NvbmZpZ19vcHMgc25ldF9jb25maWdfb3BzID0gewo+ICAgCj4gICBz
dGF0aWMgaW50IHBzbmV0X29wZW5fcGZfYmFyKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBzdHJ1Y3Qg
cHNuZXQgKnBzbmV0KQo+ICAgewo+IC0JY2hhciBuYW1lWzUwXTsKPiArCWNoYXIgKm5hbWU7Cj4g
ICAJaW50IHJldCwgaSwgbWFzayA9IDA7Cj4gICAJLyogV2UgZG9uJ3Qga25vdyB3aGljaCBCQVIg
d2lsbCBiZSB1c2VkIHRvIGNvbW11bmljYXRlLi4KPiAgIAkgKiBXZSB3aWxsIG1hcCBldmVyeSBi
YXIgd2l0aCBsZW4gPiAwLgo+IEBAIC01NzMsNyArNTczLDEwIEBAIHN0YXRpYyBpbnQgcHNuZXRf
b3Blbl9wZl9iYXIoc3RydWN0IHBjaV9kZXYgKnBkZXYsIHN0cnVjdCBwc25ldCAqcHNuZXQpCj4g
ICAJCXJldHVybiAtRU5PREVWOwo+ICAgCX0KPiAgIAo+IC0Jc25wcmludGYobmFtZSwgc2l6ZW9m
KG5hbWUpLCAicHNuZXRbJXNdLWJhcnMiLCBwY2lfbmFtZShwZGV2KSk7Cj4gKwluYW1lID0gZGV2
bV9rYXNwcmludGYoJnBkZXYtPmRldiwgR0ZQX0tFUk5FTCwgInBzbmV0WyVzXS1iYXJzIiwgcGNp
X25hbWUocGRldikpOwo+ICsJaWYgKCFuYW1lKQo+ICsJCXJldHVybiAtRU5PTUVNOwo+ICsKPiAg
IAlyZXQgPSBwY2ltX2lvbWFwX3JlZ2lvbnMocGRldiwgbWFzaywgbmFtZSk7Cj4gICAJaWYgKHJl
dCkgewo+ICAgCQlTTkVUX0VSUihwZGV2LCAiRmFpbGVkIHRvIHJlcXVlc3QgYW5kIG1hcCBQQ0kg
QkFSc1xuIik7Cj4gQEAgLTU5MCwxMCArNTkzLDEyIEBAIHN0YXRpYyBpbnQgcHNuZXRfb3Blbl9w
Zl9iYXIoc3RydWN0IHBjaV9kZXYgKnBkZXYsIHN0cnVjdCBwc25ldCAqcHNuZXQpCj4gICAKPiAg
IHN0YXRpYyBpbnQgc25ldF9vcGVuX3ZmX2JhcihzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0
IHNuZXQgKnNuZXQpCj4gICB7Cj4gLQljaGFyIG5hbWVbNTBdOwo+ICsJY2hhciAqbmFtZTsKPiAg
IAlpbnQgcmV0Owo+ICAgCj4gLQlzbnByaW50ZihuYW1lLCBzaXplb2YobmFtZSksICJzbmV0WyVz
XS1iYXIiLCBwY2lfbmFtZShwZGV2KSk7Cj4gKwluYW1lID0gZGV2bV9rYXNwcmludGYoJnBkZXYt
PmRldiwgR0ZQX0tFUk5FTCwgInBzbmV0WyVzXS1iYXJzIiwgcGNpX25hbWUocGRldikpOwoKcy9w
c25ldC9zbmV0LwoKPiArCWlmICghbmFtZSkKPiArCQlyZXR1cm4gLUVOT01FTTsKPiAgIAkvKiBS
ZXF1ZXN0IGFuZCBtYXAgQkFSICovCj4gICAJcmV0ID0gcGNpbV9pb21hcF9yZWdpb25zKHBkZXYs
IEJJVChzbmV0LT5wc25ldC0+Y2ZnLnZmX2JhciksIG5hbWUpOwo+ICAgCWlmIChyZXQpIHsKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
