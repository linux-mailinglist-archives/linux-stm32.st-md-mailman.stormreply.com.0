Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 052E86977F4
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 09:18:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAA5CC6B445;
	Wed, 15 Feb 2023 08:18:49 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B139C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 18:06:54 +0000 (UTC)
Received: from [192.168.1.90] (unknown [86.120.32.152])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B8E866020A4;
 Tue, 14 Feb 2023 18:06:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676398013;
 bh=ft8PH/ZqA6nSgApIqin+YnV9fYbavSwte6N7D71qPzY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Tw/5LqZEgofQMm+jUdg1ofHxTTLysSEGiKAK2I5nemTdfdb+gbMdIoqHQBC2up2c7
 IQURtYbXkNEgW3EWE5RDCRXlmI7GZ2+JnuRafMUmhIk+Fl9XrDoypvR7x5Q3xnfQKs
 Tz/AAOZS9L/NcQKckHwdb5WWXm+Q6W3OWUX6SQJ9tT9dWaUr83u0WMhVowSq1cIuJU
 2m3NmAatl/MPmyhMUBiG3WbjrJmCeth69VFTvcV17fZHQylzNJDnBjv26rwQ5qGzPP
 CRTqFqSfedTHbhAElWszPSsMja6HWQypl72R+5CRptn6hKxBjpbQQqimgz6IM5yC7x
 9hoBu6favdwZA==
Message-ID: <3256853a-d744-4a41-41b6-752b5c95eedc@collabora.com>
Date: Tue, 14 Feb 2023 20:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Ben Dooks <ben.dooks@codethink.co.uk>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-6-cristian.ciocaltea@collabora.com>
 <f1a6c357-b7e0-2869-72e0-e850b63e6ca9@codethink.co.uk>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <f1a6c357-b7e0-2869-72e0-e850b63e6ca9@codethink.co.uk>
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:41 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/12] riscv: Implement non-coherent DMA
 support via SiFive cache flushing
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

T24gMi8xMy8yMyAxMDozMCwgQmVuIERvb2tzIHdyb3RlOgo+IE9uIDExLzAyLzIwMjMgMDM6MTgs
IENyaXN0aWFuIENpb2NhbHRlYSB3cm90ZToKPj4gRnJvbTogRW1pbCBSZW5uZXIgQmVydGhpbmcg
PGtlcm5lbEBlc21pbC5kaz4KPj4KPj4gVGhpcyB2YXJpYW50IGlzIHVzZWQgb24gdGhlIFN0YXJG
aXZlIEpINzEwMCBTb0MuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEVtaWwgUmVubmVyIEJlcnRoaW5n
IDxrZXJuZWxAZXNtaWwuZGs+Cj4+IFNpZ25lZC1vZmYtYnk6IENyaXN0aWFuIENpb2NhbHRlYSA8
Y3Jpc3RpYW4uY2lvY2FsdGVhQGNvbGxhYm9yYS5jb20+Cj4+IC0tLQo+PiDCoCBhcmNoL3Jpc2N2
L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNiArKysrLS0KPj4gwqAgYXJj
aC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYyB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jp
c2N2L0tjb25maWcKPj4gaW5kZXggOWM2ODdkYTc3NTZkLi4wNWY2Yzc3ZmFmNmYgMTAwNjQ0Cj4+
IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4g
QEAgLTIzMiwxMiArMjMyLDE0IEBAIGNvbmZpZyBMT0NLREVQX1NVUFBPUlQKPj4gwqDCoMKgwqDC
oCBkZWZfYm9vbCB5Cj4+IMKgIGNvbmZpZyBSSVNDVl9ETUFfTk9OQ09IRVJFTlQKPj4gLcKgwqDC
oCBib29sCj4+ICvCoMKgwqAgYm9vbCAiU3VwcG9ydCBub24tY29oZXJlbnQgRE1BIgo+PiArwqDC
oMKgIGRlZmF1bHQgU09DX1NUQVJGSVZFCj4+IMKgwqDCoMKgwqAgc2VsZWN0IEFSQ0hfSEFTX0RN
QV9QUkVQX0NPSEVSRU5UCj4+ICvCoMKgwqAgc2VsZWN0IEFSQ0hfSEFTX0RNQV9TRVRfVU5DQUNI
RUQKPj4gK8KgwqDCoCBzZWxlY3QgQVJDSF9IQVNfRE1BX0NMRUFSX1VOQ0FDSEVECj4+IMKgwqDC
oMKgwqAgc2VsZWN0IEFSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9ERVZJQ0UKPj4gwqDCoMKgwqDCoCBz
ZWxlY3QgQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0NQVQo+PiDCoMKgwqDCoMKgIHNlbGVjdCBBUkNI
X0hBU19TRVRVUF9ETUFfT1BTCj4+IC3CoMKgwqAgc2VsZWN0IERNQV9ESVJFQ1RfUkVNQVAKPj4g
wqAgY29uZmlnIEFTX0hBU19JTlNOCj4+IMKgwqDCoMKgwqAgZGVmX2Jvb2wgJChhcy1pbnN0ciwu
aW5zbiByIDUxJChjb21tYSkgMCQoY29tbWEpIDAkKGNvbW1hKSAKPj4gdDAkKGNvbW1hKSB0MCQo
Y29tbWEpIHplcm8pCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVu
dC5jIAo+PiBiL2FyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMKPj4gaW5kZXggZDkxOWVm
YWI2ZWJhLi5lMDdlNTNhZWE1MzcgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZG1hLW5v
bmNvaGVyZW50LmMKPj4gKysrIGIvYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYwo+PiBA
QCAtOSwxNCArOSwyMSBAQAo+PiDCoCAjaW5jbHVkZSA8bGludXgvZG1hLW1hcC1vcHMuaD4KPj4g
wqAgI2luY2x1ZGUgPGxpbnV4L21tLmg+Cj4+IMKgICNpbmNsdWRlIDxhc20vY2FjaGVmbHVzaC5o
Pgo+PiArI2luY2x1ZGUgPHNvYy9zaWZpdmUvc2lmaXZlX2NjYWNoZS5oPgo+PiDCoCBzdGF0aWMg
Ym9vbCBub25jb2hlcmVudF9zdXBwb3J0ZWQ7Cj4+IMKgIHZvaWQgYXJjaF9zeW5jX2RtYV9mb3Jf
ZGV2aWNlKHBoeXNfYWRkcl90IHBhZGRyLCBzaXplX3Qgc2l6ZSwKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQo+PiDC
oCB7Cj4+IC3CoMKgwqAgdm9pZCAqdmFkZHIgPSBwaHlzX3RvX3ZpcnQocGFkZHIpOwo+PiArwqDC
oMKgIHZvaWQgKnZhZGRyOwo+PiArwqDCoMKgIGlmIChzaWZpdmVfY2NhY2hlX2hhbmRsZV9ub25j
b2hlcmVudCgpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzaWZpdmVfY2NhY2hlX2ZsdXNoX3Jhbmdl
KHBhZGRyLCBzaXplKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gK8KgwqDCoCB9Cj4+
ICsKPj4gK8KgwqDCoCB2YWRkciA9IHBoeXNfdG9fdmlydChwYWRkcik7Cj4+IMKgwqDCoMKgwqAg
c3dpdGNoIChkaXIpIHsKPj4gwqDCoMKgwqDCoCBjYXNlIERNQV9UT19ERVZJQ0U6Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBBTFRfQ01PX09QKGNsZWFuLCB2YWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9i
bG9ja19zaXplKTsKPj4gQEAgLTM1LDggKzQyLDE0IEBAIHZvaWQgYXJjaF9zeW5jX2RtYV9mb3Jf
ZGV2aWNlKHBoeXNfYWRkcl90IHBhZGRyLCAKPj4gc2l6ZV90IHNpemUsCj4+IMKgIHZvaWQgYXJj
aF9zeW5jX2RtYV9mb3JfY3B1KHBoeXNfYWRkcl90IHBhZGRyLCBzaXplX3Qgc2l6ZSwKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGly
KQo+PiDCoCB7Cj4+IC3CoMKgwqAgdm9pZCAqdmFkZHIgPSBwaHlzX3RvX3ZpcnQocGFkZHIpOwo+
PiArwqDCoMKgIHZvaWQgKnZhZGRyOwo+PiArCj4+ICvCoMKgwqAgaWYgKHNpZml2ZV9jY2FjaGVf
aGFuZGxlX25vbmNvaGVyZW50KCkpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHNpZml2ZV9jY2FjaGVf
Zmx1c2hfcmFuZ2UocGFkZHIsIHNpemUpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+PiAr
wqDCoMKgIH0KPiAKPiBvaywgd2hhdCBoYXBwZW5zIGlmIHdlIGhhdmUgYW4gc3lzdGVtIHdoZXJl
IHRoZSBjY2FjaGUgYW5kIGFub3RoZXIgbGV2ZWwKPiBvZiBjYWNoZSBhbHNvIHJlcXVpcmVzIG1h
aW50ZW5hbmNlIG9wZXJhdGlvbnM/CgpBY2NvcmRpbmcgdG8gWzFdLCB0aGUgaGFuZGxpbmcgb2Yg
bm9uLWNvaGVyZW50IERNQSBvbiBSSVNDLVYgaXMgCmN1cnJlbnRseSBiZWluZyB3b3JrZWQgb24s
IHNvIEkgd2lsbCByZXNwaW4gdGhlIHNlcmllcyBhcyBzb29uIGFzIHRoZSAKcHJvcGVyIHN1cHBv
cnQgYXJyaXZlcy4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL1krZDM2bnoweGRm
WG1ESTFAc3B1ZC8KCgo+PiArwqDCoMKgIHZhZGRyID0gcGh5c190b192aXJ0KHBhZGRyKTsKPj4g
wqDCoMKgwqDCoCBzd2l0Y2ggKGRpcikgewo+PiDCoMKgwqDCoMKgIGNhc2UgRE1BX1RPX0RFVklD
RToKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiBAQCAtNDksMTAgKzYyLDMwIEBAIHZv
aWQgYXJjaF9zeW5jX2RtYV9mb3JfY3B1KHBoeXNfYWRkcl90IHBhZGRyLCAKPj4gc2l6ZV90IHNp
emUsCj4+IMKgwqDCoMKgwqAgfQo+PiDCoCB9Cj4+ICt2b2lkICphcmNoX2RtYV9zZXRfdW5jYWNo
ZWQodm9pZCAqYWRkciwgc2l6ZV90IHNpemUpCj4+ICt7Cj4+ICvCoMKgwqAgaWYgKHNpZml2ZV9j
Y2FjaGVfaGFuZGxlX25vbmNvaGVyZW50KCkpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gc2lm
aXZlX2NjYWNoZV9zZXRfdW5jYWNoZWQoYWRkciwgc2l6ZSk7Cj4+ICsKPj4gK8KgwqDCoCByZXR1
cm4gYWRkcjsKPj4gK30KPj4gKwo+PiArdm9pZCBhcmNoX2RtYV9jbGVhcl91bmNhY2hlZCh2b2lk
ICphZGRyLCBzaXplX3Qgc2l6ZSkKPj4gK3sKPj4gK8KgwqDCoCBpZiAoc2lmaXZlX2NjYWNoZV9o
YW5kbGVfbm9uY29oZXJlbnQoKSkKPj4gK8KgwqDCoMKgwqDCoMKgIHNpZml2ZV9jY2FjaGVfY2xl
YXJfdW5jYWNoZWQoYWRkciwgc2l6ZSk7Cj4+ICt9Cj4+ICsKPj4gwqAgdm9pZCBhcmNoX2RtYV9w
cmVwX2NvaGVyZW50KHN0cnVjdCBwYWdlICpwYWdlLCBzaXplX3Qgc2l6ZSkKPj4gwqAgewo+PiDC
oMKgwqDCoMKgIHZvaWQgKmZsdXNoX2FkZHIgPSBwYWdlX2FkZHJlc3MocGFnZSk7Cj4+ICvCoMKg
wqAgaWYgKHNpZml2ZV9jY2FjaGVfaGFuZGxlX25vbmNvaGVyZW50KCkpIHsKPj4gK8KgwqDCoMKg
wqDCoMKgIG1lbXNldChmbHVzaF9hZGRyLCAwLCBzaXplKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHNp
Zml2ZV9jY2FjaGVfZmx1c2hfcmFuZ2UoX19wYShmbHVzaF9hZGRyKSwgc2l6ZSk7Cj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm47Cj4+ICvCoMKgwqAgfQo+PiArCj4+IMKgwqDCoMKgwqAgQUxUX0NN
T19PUChmbHVzaCwgZmx1c2hfYWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsKPj4g
wqAgfQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
