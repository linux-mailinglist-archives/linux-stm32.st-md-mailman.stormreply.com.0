Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B855A782
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Jun 2022 08:37:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C967DC0D2C1;
	Sat, 25 Jun 2022 06:37:55 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp05.smtpout.orange.fr
 [80.12.242.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 023E7C03FC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jun 2022 06:37:53 +0000 (UTC)
Received: from [192.168.1.18] ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id 4zQToScCo6rrE4zQTo0f6d; Sat, 25 Jun 2022 08:37:53 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 25 Jun 2022 08:37:53 +0200
X-ME-IP: 90.11.190.129
Message-ID: <f2e89d3a-f6ad-6fdc-1bd1-eb38f5a8f569@wanadoo.fr>
Date: Sat, 25 Jun 2022 08:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: fabrice.gasnier@foss.st.com
References: <20220624155413.399190-1-fabrice.gasnier@foss.st.com>
 <20220624155413.399190-3-fabrice.gasnier@foss.st.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220624155413.399190-3-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/4] usb: typec: ucsi: stm32g0: add
 support for stm32g0 i2c controller
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

TGUgMjQvMDYvMjAyMiDDoCAxNzo1NCwgRmFicmljZSBHYXNuaWVyIGEgw6ljcml0wqA6Cj4gU1RN
MzJHMCBwcm92aWRlcyBhbiBpbnRlZ3JhdGVkIFVTQiBUeXBlLUMgYW5kIHBvd2VyIGRlbGl2ZXJ5
IGludGVyZmFjZS4KPiBJdCBjYW4gYmUgcHJvZ3JhbW1lZCB3aXRoIGEgZmlybXdhcmUgdG8gaGFu
ZGxlIFVDU0kgcHJvdG9jb2wgb3ZlciBJMkMKPiBpbnRlcmZhY2UuIEEgR1BJTyBpcyB1c2VkIGFz
IGFuIGludGVycnVwdCBsaW5lLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgR2FzbmllciA8
ZmFicmljZS5nYXNuaWVyLXJqMEllbC9KUjROQkRnaks3eTdUVVFAcHVibGljLmdtYW5lLm9yZz4K
PiAtLS0KPiAgIGRyaXZlcnMvdXNiL3R5cGVjL3Vjc2kvS2NvbmZpZyAgICAgICAgfCAgMTAgKysK
PiAgIGRyaXZlcnMvdXNiL3R5cGVjL3Vjc2kvTWFrZWZpbGUgICAgICAgfCAgIDEgKwo+ICAgZHJp
dmVycy91c2IvdHlwZWMvdWNzaS91Y3NpX3N0bTMyZzAuYyB8IDIxOCArKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyMjkgaW5zZXJ0aW9ucygrKQo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdXNiL3R5cGVjL3Vjc2kvdWNzaV9zdG0zMmcwLmMKPiAK
ClsuLi5dCgo+ICtzdGF0aWMgaW50IHVjc2lfc3RtMzJnMF9hc3luY193cml0ZShzdHJ1Y3QgdWNz
aSAqdWNzaSwgdW5zaWduZWQgaW50IG9mZnNldCwgY29uc3Qgdm9pZCAqdmFsLAo+ICsJCQkJICAg
IHNpemVfdCBsZW4pCj4gK3sKPiArCXN0cnVjdCB1Y3NpX3N0bTMyZzAgKmcwID0gdWNzaV9nZXRf
ZHJ2ZGF0YSh1Y3NpKTsKPiArCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSBnMC0+Y2xpZW50
Owo+ICsJc3RydWN0IGkyY19tc2cgbXNnW10gPSB7Cj4gKwkJewo+ICsJCQkuYWRkcgk9IGNsaWVu
dC0+YWRkciwKPiArCQkJLmZsYWdzICA9IDAsCj4gKwkJfQo+ICsJfTsKPiArCXVuc2lnbmVkIGNo
YXIgKmJ1ZjsKPiArCWludCByZXQ7Cj4gKwo+ICsJYnVmID0ga3phbGxvYyhsZW4gKyAxLCBHRlBf
S0VSTkVMKTsKCkhpLAoKTml0OiBrbWFsbG9jKCkgd291bGQgYmUgZW5vdWdoIGhlcmUsIHRoZSB3
aG9sZSBidWZmZXIgaXMgd3JpdHRlbiBqdXN0IGEgCmZldyBsaW5lcyBhZnRlci4KCj4gKwlpZiAo
IWJ1ZikKPiArCQlyZXR1cm4gLUVOT01FTTsKPiArCj4gKwlidWZbMF0gPSBvZmZzZXQ7Cj4gKwlt
ZW1jcHkoJmJ1ZlsxXSwgdmFsLCBsZW4pOwo+ICsJbXNnWzBdLmxlbiA9IGxlbiArIDE7Cj4gKwlt
c2dbMF0uYnVmID0gYnVmOwo+ICsKPiArCXJldCA9IGkyY190cmFuc2ZlcihjbGllbnQtPmFkYXB0
ZXIsIG1zZywgQVJSQVlfU0laRShtc2cpKTsKPiArCWtmcmVlKGJ1Zik7Cj4gKwlpZiAocmV0ICE9
IEFSUkFZX1NJWkUobXNnKSkgewo+ICsJCWRldl9lcnIoZzAtPmRldiwgImkyYyB3cml0ZSAlMDJ4
LCAlMDJ4IGVycm9yOiAlZFxuIiwgY2xpZW50LT5hZGRyLCBidWZbMF0sIHJldCk7CgpVc2UtYWZ0
ZXItZnJlZSBvZiBidWYuCgo+ICsKPiArCQlyZXR1cm4gcmV0IDwgMCA/IHJldCA6IC1FSU87Cj4g
Kwl9Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCgpKdXN0IG15IDJjLApDSgoKWy4uLl0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
