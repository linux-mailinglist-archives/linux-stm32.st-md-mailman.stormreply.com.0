Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B83EBB8DE8
	for <lists+linux-stm32@lfdr.de>; Sat, 04 Oct 2025 15:25:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8445BC32E92;
	Sat,  4 Oct 2025 13:25:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F663C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Oct 2025 13:25:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1CFDF60144;
 Sat,  4 Oct 2025 13:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C60C4CEF1;
 Sat,  4 Oct 2025 13:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759584326;
 bh=bc5bP7EqrX/7tverHK4ahEMxMXdfuaRoCJxs+IXR4UI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=isrBaMWfApwQ1NDz1qxYerr3ggmdcFTR9LgDdgHJYQ39uEppFCwRZbzDkDTYqIZO8
 BtOqmkcx73Hww6vj5nUDaAK5msqyyJqgg9lGfSngFsus5mReiwGCb4TIzeDMlSKyxM
 S39iQ9sSMoUSCQYj82BBrXcE/ZfosunC3Xuk2z9JEDJ+Zc5x3pQRwTCAMD/kRn6OUt
 tYN6hcLHKcPxTOrcjOTjWdzGTocQp/+z5/AlZlMcWZZcV9n08/CT2hsiF5iOM2/QfM
 mCEyOYo8cWREIDsLjD7+CLWL0tbQD1Qtt+a0o5WlqGonWbx4jZRB3ZbpLJ5Z6ht4/I
 IAWGofaVST+GQ==
Date: Sat, 4 Oct 2025 14:25:17 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Message-ID: <20251004142517.0cf3e7a2@jic23-huawei>
In-Reply-To: <5243c2c5a8f3dd24f40e30a695e2a3d4f948f388.camel@gmail.com>
References: <20251002112250.2270144-1-olivier.moysan@foss.st.com>
 <5243c2c5a8f3dd24f40e30a695e2a3d4f948f388.camel@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-dfsdm: fix st,
 adc-alt-channel property handling
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

T24gRnJpLCAwMyBPY3QgMjAyNSAwNzoxNTo1NiArMDEwMApOdW5vIFPDoSA8bm9uYW1lLm51bm9A
Z21haWwuY29tPiB3cm90ZToKCj4gT24gVGh1LCAyMDI1LTEwLTAyIGF0IDEzOjIyICswMjAwLCBP
bGl2aWVyIE1veXNhbiB3cm90ZToKPiA+IEluaXRpYWxseSBzdCxhZGMtYWx0LWNoYW5uZWwgcHJv
cGVydHkgd2FzIGRlZmluZWQgYXMgYW4gZW51bSBpbiB0aGUgREZTRE0KPiA+IGJpbmRpbmcuIFRo
ZSBERlNETSBiaW5kaW5nIGhhcyBiZWVuIGNoYW5nZWQgdG8gdXNlIHRoZSBuZXcgSUlPIGJhY2tl
bmQKPiA+IGZyYW1ld29yaywgYWxvbmcgd2l0aCB0aGUgYWRvcHRpb24gb2YgSUlPIGdlbmVyaWMg
Y2hhbm5lbHMuCj4gPiBJbiB0aGlzIG5ldyBiaW5kaW5nIHN0LGFkYy1hbHQtY2hhbm5lbCBpcyBk
ZWZpbmVkIGFzIGEgYm9vbGVhbiBwcm9wZXJ0eSwKPiA+IGJ1dCBpdCBpcyBzdGlsbCBoYW5kbGVk
IGhhcyBhbiBlbnVtIGluIERGU0RNIGRyaXZlci4KPiA+IEZpeCBzdCxhZGMtYWx0LWNoYW5uZWwg
cHJvcGVydHkgaGFuZGxpbmcgaW4gREZTRE0gZHJpdmVyLgo+ID4gCj4gPiBGaXhlczogMzIwOGZh
MGNkOTE5ICgiaWlvOiBhZGM6IHN0bTMyLWRmc2RtOiBhZG9wdCBnZW5lcmljIGNoYW5uZWxzIGJp
bmRpbmdzIikKPiA+IFNpZ25lZC1vZmYtYnk6IE9saXZpZXIgTW95c2FuIDxvbGl2aWVyLm1veXNh
bkBmb3NzLnN0LmNvbT4KPiA+IC0tLSAgCj4gCj4gUmV2aWV3ZWQtYnk6IE51bm8gU8OhIDxudW5v
LnNhQGFuYWxvZy5jb20+CkFwcGxpZWQgdG8gbXkgdGVtcG9yYXJ5IGZpeGVzIGJyYW5jaCB0aGF0
IEknbGwgcmViYXNlIG9uIHJjMSBvbmNlIGF2YWlsYWJsZS4KQWxzbyBtYXJrZWQgZm9yIHN0YWJs
ZS4KCnRoYW5rcywKCkpvbmF0aGFuCgo+IAo+ID4gwqBkcml2ZXJzL2lpby9hZGMvc3RtMzItZGZz
ZG0tYWRjLmMgfCA1ICsrLS0tCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvc3Rt
MzItZGZzZG0tYWRjLmMgYi9kcml2ZXJzL2lpby9hZGMvc3RtMzItZGZzZG0tYWRjLmMKPiA+IGlu
ZGV4IDc0YjFiNGRjNmU4MS4uOTY2NGI5YmQ3NWQ0IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9p
aW8vYWRjL3N0bTMyLWRmc2RtLWFkYy5jCj4gPiArKysgYi9kcml2ZXJzL2lpby9hZGMvc3RtMzIt
ZGZzZG0tYWRjLmMKPiA+IEBAIC03MjUsOSArNzI1LDggQEAgc3RhdGljIGludCBzdG0zMl9kZnNk
bV9nZW5lcmljX2NoYW5uZWxfcGFyc2Vfb2Yoc3RydWN0Cj4gPiBzdG0zMl9kZnNkbSAqZGZzZG0s
Cj4gPiDCoAl9Cj4gPiDCoAlkZl9jaC0+c3JjID0gdmFsOwo+ID4gwqAKPiA+IC0JcmV0ID0gZndu
b2RlX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJzdCxhZGMtYWx0LWNoYW5uZWwiLCAmZGZfY2gt
ICAKPiA+ID5hbHRfc2kpOyAgCj4gPiAtCWlmIChyZXQgIT0gLUVJTlZBTCkKPiA+IC0JCWRmX2No
LT5hbHRfc2kgPSAwOwo+ID4gKwlpZiAoZndub2RlX3Byb3BlcnR5X3ByZXNlbnQobm9kZSwgInN0
LGFkYy1hbHQtY2hhbm5lbCIpKQo+ID4gKwkJZGZfY2gtPmFsdF9zaSA9IDE7Cj4gPiDCoAo+ID4g
wqAJaWYgKGFkYy0+ZGV2X2RhdGEtPnR5cGUgPT0gREZTRE1fSUlPKSB7Cj4gPiDCoAkJYmFja2Vu
ZCA9IGRldm1faWlvX2JhY2tlbmRfZndub2RlX2dldCgmaW5kaW9fZGV2LT5kZXYsIE5VTEwsCj4g
PiBub2RlKTsgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
