Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDA84B5359
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Feb 2022 15:30:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0D93C5F1F9;
	Mon, 14 Feb 2022 14:30:16 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 846FCC5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 14:30:15 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso12142wmi.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 06:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Qp0QN+QEErhlcS3GAx4mKpRDEEq8dEC8vvszvRmZuYs=;
 b=jnKm8XvoIMBGarRRZ4hzi45VYlJ478uh2abfv7JlrxZ1M6wFaz7itAVx1xJ+BlMqib
 qQC2TtbcHoCafKsj1jBoxHNnFdumz5p4amZKrLHYNs27PWfMjMD8Ph1ny/ijfkT4OvRA
 Dk4e8CWS4ZpazAVpRJ+lMkq0Nn5+eqlZO3727SvncCzFtaQLYabnojLtYInIQU3XUqQG
 52nE4W9F96sTI4su2+/eezi4lU4zd14RzEnrT0jhtBLMcq+sHJ44P+0CY+2Zrn7QFZsy
 vUQVpCj1Jeg05S/pRLKh1oWTW7UOVmcYCYg9/xHreAEbGWp9skhlxzIae/CfhcasUpNE
 jXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Qp0QN+QEErhlcS3GAx4mKpRDEEq8dEC8vvszvRmZuYs=;
 b=qzlyzayUc4EvLydx0BcFk8iq+RRfM6sRk7YFVB1J4zQ1qVLEwZ4iiZJWCu3/c6/vuN
 WbcJINbcCjRPQsCY3xRYRnIHcFs3cIN8/9oQgUKlPJkgIGu/oxYdtbpvVHDbOo6iwes4
 o9WFXMo5fJ73ismd0JF7a/vpOWEp2M0K+VKbnEQ5+7j929bUPissU9wQKXxxPkN50Wh/
 oHaIv+r9eee9WfROZt/PBVq/xlwfNz4ylyNBJPf2szhIv+KOidNKOkAhJf82vjVR16Nm
 DQ8GVo0mm/x5YvaaP+ceunfBOfztIXLYnr0uCfrOkBz7cT3tFso95jkQ5IPCGeNGUFMJ
 VjFw==
X-Gm-Message-State: AOAM533/AFQdLbH/1rxHwJvhyu0PjK9mJ58euKJduCwv8RkYrN6QnYwD
 5n1f+a9996AtSoXo4SU88ixv4A==
X-Google-Smtp-Source: ABdhPJxLQcXVZpjbmecg6yZuPlyk5ci26cfg2TtBYKtnC5XZytL2DW2wV5Ub0p6x+25l9jdRm5vzHA==
X-Received: by 2002:a7b:cdfa:: with SMTP id p26mr11414512wmj.109.1644849015011; 
 Mon, 14 Feb 2022 06:30:15 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id t16sm2741411wmq.43.2022.02.14.06.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 06:30:14 -0800 (PST)
Date: Mon, 14 Feb 2022 14:30:12 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <YgpndOadzi0+5jQr@google.com>
References: <20220207081709.27288-1-u.kleine-koenig@pengutronix.de>
 <YgpdPTDurgsvR9mk@google.com>
 <20220214140639.jmdldyne6ffq4dlq@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214140639.jmdldyne6ffq4dlq@pengutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx: Improve error message
 triggered by regulator fault in .remove()
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

T24gTW9uLCAxNCBGZWIgMjAyMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IE9uIE1vbiwg
RmViIDE0LCAyMDIyIGF0IDAxOjQ2OjM3UE0gKzAwMDAsIExlZSBKb25lcyB3cm90ZToKPiA+IE9u
IE1vbiwgMDcgRmViIDIwMjIsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gCj4gPiA+IFJl
dHVybmluZyBhIG5vbi16ZXJvIHZhbHVlIGluIGFuIGkyYyByZW1vdmUgY2FsbGJhY2sgcmVzdWx0
cyBpbiB0aGUgaTJjCj4gPiA+IGNvcmUgZW1pdHRpbmcgYSB2ZXJ5IGdlbmVyaWMgZXJyb3IgbWVz
c2FnZSAoInJlbW92ZSBmYWlsZWQgKC1FU09NRVRISU5HKSwKPiA+ID4gd2lsbCBiZSBpZ25vcmVk
IikgYW5kIGFzIHRoZSBtZXNzYWdlIGluZGljYXRlcyBub3QgZnVydGhlciBlcnJvciBoYW5kbGlu
Zwo+ID4gPiBpcyBkb25lLgo+ID4gPiAKPiA+ID4gSW5zdGVhZCBlbWl0IGEgbW9yZSBzcGVjaWZp
YyBlcnJvciBtZXNzYWdlIGFuZCB0aGVuIHJldHVybiB6ZXJvIGluCj4gPiA+IC5yZW1vdmUoKS4K
PiA+ID4gCj4gPiA+IFRoZSBsb25nLXRlcm0gZ29hbCBpcyB0byBtYWtlIHRoZSBpMmMgcmVtb3Zl
IHByb3RvdHlwZSByZXR1cm4gdm9pZCwgbWFraW5nCj4gPiA+IGFsbCBpbXBsZW1lbnRhdGlvbnMg
cmV0dXJuIDAgaXMgcHJlcGFyYXRvcnkgd29yayBmb3IgdGhpcyBjaGFuZ2UuCj4gPiA+IAo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1
dHJvbml4LmRlPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvbWZkL3N0bWZ4LmMgfCAxNiArKysr
KysrKysrKy0tLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9zdG1meC5j
IGIvZHJpdmVycy9tZmQvc3RtZnguYwo+ID4gPiBpbmRleCBlMDk1YTM5MzAxNDIuLjE2NjMxYzY3
NWYyZiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9tZmQvc3RtZnguYwo+ID4gPiArKysgYi9k
cml2ZXJzL21mZC9zdG1meC5jCj4gPiA+IEBAIC0zOTIsMTcgKzM5MiwyMSBAQCBzdGF0aWMgaW50
IHN0bWZ4X2NoaXBfaW5pdChzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+ID4gPiAgCXJldHVy
biByZXQ7Cj4gPiA+ICB9Cj4gPiA+ICAKPiA+ID4gLXN0YXRpYyBpbnQgc3RtZnhfY2hpcF9leGl0
KHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4gPiA+ICtzdGF0aWMgdm9pZCBzdG1meF9jaGlw
X2V4aXQoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiA+ID4gIHsKPiA+ID4gIAlzdHJ1Y3Qg
c3RtZnggKnN0bWZ4ID0gaTJjX2dldF9jbGllbnRkYXRhKGNsaWVudCk7Cj4gPiA+ICAKPiA+ID4g
IAlyZWdtYXBfd3JpdGUoc3RtZngtPm1hcCwgU1RNRlhfUkVHX0lSUV9TUkNfRU4sIDApOwo+ID4g
PiAgCXJlZ21hcF93cml0ZShzdG1meC0+bWFwLCBTVE1GWF9SRUdfU1lTX0NUUkwsIDApOwo+ID4g
PiAgCj4gPiA+IC0JaWYgKHN0bWZ4LT52ZGQpCj4gPiA+IC0JCXJldHVybiByZWd1bGF0b3JfZGlz
YWJsZShzdG1meC0+dmRkKTsKPiA+ID4gKwlpZiAoc3RtZngtPnZkZCkgewo+ID4gPiArCQlpbnQg
cmV0ID0gcmVndWxhdG9yX2Rpc2FibGUoc3RtZngtPnZkZCk7Cj4gPiA+ICAKPiA+ID4gLQlyZXR1
cm4gMDsKPiA+ID4gKwkJaWYgKHJldCkKPiA+IAo+ID4gTml0OiBQcmVtaXNlIG9mIHRoZSBwYXRj
aCBpcyBmaW5lLCBidXQgcGxlYXNlIGNhbiB5b3UgdXNlIHRoZSBzdGFuZGFyZAo+ID4gZnVuY3Rp
b24gY2FsbCwgY2hlY2sgdGhlIHJldHVybiB2YWx1ZSBmb3JtYXQgcGxlYXNlLiAgU29tZXRoaW5n
IGFib3V0Cj4gPiB0aGlzIGlzIHRyaWdnZXJpbmcgbXkgT0NEISA6KQo+ID4gCj4gPiAgICAgIAlp
bnQgcmV0Owo+ID4gCj4gPiAJcmV0ID0gcmVndWxhdG9yX2Rpc2FibGUoc3RtZngtPnZkZCk7Cj4g
PiAJaWYgKHJldCkKPiA+IAkJZG9fdGhpbmcoKTsKPiAKPiBOb3Qgc3VyZSBJIHVuZGVyc3RhbmQg
eW91IGNvcnJlY3RseS4gRG8geW91IHdhbnQganVzdDoKPiAKPiAgCXJlZ21hcF93cml0ZShzdG1m
eC0+bWFwLCBTVE1GWF9SRUdfU1lTX0NUUkwsIDApOwo+ICAKPiAgCWlmIChzdG1meC0+dmRkKSB7
Cj4gLQkJaW50IHJldCA9IHJlZ3VsYXRvcl9kaXNhYmxlKHN0bWZ4LT52ZGQpOwo+ICsJCWludCBy
ZXQ7Cj4gKwo+ICsJCXJldCA9IHJlZ3VsYXRvcl9kaXNhYmxlKHN0bWZ4LT52ZGQpOwo+ICAJCWlm
IChyZXQpCj4gIC4uLgo+IAo+IHNxdWFzaGVkIGludG8gdGhlIHBhdGNoPwoKRWZmZWN0aXZlbHks
IHllcyBwbGVhc2UuCgpUaGUgZGlmZiB3b3VsZCBsb29rIGxpa2U6Cgo+ID4gPiAtCWlmIChzdG1m
eC0+dmRkKQo+ID4gPiAtCQlyZXR1cm4gcmVndWxhdG9yX2Rpc2FibGUoc3RtZngtPnZkZCk7Cj4g
PiA+ICsJaWYgKHN0bWZ4LT52ZGQpIHsKPiA+ID4gKwkJaW50IHJldDsKPiA+ID4gKwo+ID4gPiAr
CQlyZXQgPSByZWd1bGF0b3JfZGlzYWJsZShzdG1meC0+dmRkKTsKPiA+ID4gLQo+ID4gPiAtCXJl
dHVybiAwOwo+ID4gPiArCQlpZiAocmV0KQoKVGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C8
5pavXQpQcmluY2lwYWwgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
