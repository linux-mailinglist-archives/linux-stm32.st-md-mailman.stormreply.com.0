Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1012BC538B8
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 17:59:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3B5DC628D0;
	Wed, 12 Nov 2025 16:59:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C477BC60468
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 16:59:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5F67143670
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 16:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4354DC16AAE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 16:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762966795;
 bh=RVOBomhYRdwmTIvo3d1upFxr9xv6m2ioRcySu2Zct+c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XxxxjSUNde86wmg/dcnOrvIfN2jepikxpY7GV4lYOLhagr1EawmOpBYrVV2HAdtyO
 3TUYFKqPEPkY1rdnnXhBeoPa2xNa0hRO7yO1zs7ZhIVNnGwrszehllb7MZvKJSI+AF
 uMKxv9JnbGqVlPiq5Py5LSOsJpDK+jw9LCdAbRWbGK5UddHigpNjs2JQWovpDwxDMr
 SC6Bd8xvqKR5FbdKSYdtaX5S0iq5ObFngQn+ArfsBJw4HLkKHHe438BTi8m43lqaQJ
 W4DENohKvqRFDeQMktCHwYehTOpkJbeMA8rq58HHHrJFxIJsWMjthzdqM4TcXtCWYA
 ODaKBn0IoFE+Q==
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b7272012d30so180995166b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 08:59:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVBo3HENd/VmJgWxycpzNwschAQvn8ljvy+HDQOV8xRjnkCX0PD4GNLXFVVmhBTeIfp01ZrnmbqvjX9+Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw+JXDsZRz7jLX7IiylHrtTiP8St7Pi+xxKAE5EWvKRzn2OAMQx
 PDYm1X4n1e7VRcNJNFUbNlcLfiIY39qrCwJB4p5hBtbeWzjuHq0LGdjfUSzCwzGbXpwVSyI83sW
 YXbdkwkzdDYrna6spRcmEqHTYMjC16A==
X-Google-Smtp-Source: AGHT+IEOqt/wJY8Cvt+ACAz7CBaI8+ZUOPnH6TL37Ek0ZSDGOQg0lL8OZ1nhy6LAM/AdjuxvzXmeIb2YLoCTlRThoLE=
X-Received: by 2002:a17:907:3fa8:b0:b70:b077:b957 with SMTP id
 a640c23a62f3a-b733198f04fmr406767266b.15.1762966793516; Wed, 12 Nov 2025
 08:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20251031175926.1465360-1-robh@kernel.org> <aRN0fdOAV0B728qo@p14s>
 <20251111195923.GA3629535-robh@kernel.org>
 <CANLsYkwcbrTaKASdr5fj0m9ARS4xUgzVH8iWQKwTCvEsoZDDsQ@mail.gmail.com>
In-Reply-To: <CANLsYkwcbrTaKASdr5fj0m9ARS4xUgzVH8iWQKwTCvEsoZDDsQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 12 Nov 2025 10:59:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>
X-Gm-Features: AWmQ_bmxZCkzBm3PwPqC-n2_BEF69Zs3agW7isLAr86xc9rjwe66yE2yHIz-vl4
Message-ID: <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-remoteproc@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6] remoteproc: Use
	of_reserved_mem_region_* functions for "memory-region"
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

T24gV2VkLCBOb3YgMTIsIDIwMjUgYXQgOTo0M+KAr0FNIE1hdGhpZXUgUG9pcmllcgo8bWF0aGll
dS5wb2lyaWVyQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCAxMSBOb3YgMjAyNSBhdCAx
Mjo1OSwgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVl
LCBOb3YgMTEsIDIwMjUgYXQgMTA6Mzg6MDVBTSAtMDcwMCwgTWF0aGlldSBQb2lyaWVyIHdyb3Rl
Ogo+ID4gPiBIaSBSb2IsCj4gPiA+Cj4gPiA+IFBsZWFzZSBzZWUgbWF5IGNvbW1lbnQgZm9yIHN0
X3JlbW90ZXByb2MuYwo+ID4gPgo+ID4gPiBPbiBGcmksIE9jdCAzMSwgMjAyNSBhdCAxMjo1OToy
MlBNIC0wNTAwLCBSb2IgSGVycmluZyAoQXJtKSB3cm90ZToKPiA+ID4gPiBVc2UgdGhlIG5ld2x5
IGFkZGVkIG9mX3Jlc2VydmVkX21lbV9yZWdpb25fdG9fcmVzb3VyY2UoKSBhbmQKPiA+ID4gPiBv
Zl9yZXNlcnZlZF9tZW1fcmVnaW9uX2NvdW50KCkgZnVuY3Rpb25zIHRvIGhhbmRsZSAibWVtb3J5
LXJlZ2lvbiIKPiA+ID4gPiBwcm9wZXJ0aWVzLgoKWy4uLl0KCj4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcmVtb3RlcHJvYy9zdF9yZW1vdGVwcm9jLmMgYi9kcml2ZXJzL3JlbW90ZXByb2Mv
c3RfcmVtb3RlcHJvYy5jCj4gPiA+ID4gaW5kZXggZTY1NjZhOTgzOWRjLi4wNDMzNDgzNjY5MjYg
MTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9yZW1vdGVwcm9jL3N0X3JlbW90ZXByb2MuYwo+
ID4gPiA+ICsrKyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9zdF9yZW1vdGVwcm9jLmMKPiA+ID4gPiBA
QCAtMTIwLDQwICsxMjAsMzcgQEAgc3RhdGljIGludCBzdF9ycHJvY19wYXJzZV9mdyhzdHJ1Y3Qg
cnByb2MgKnJwcm9jLCBjb25zdCBzdHJ1Y3QgZmlybXdhcmUgKmZ3KQo+ID4gPiA+ICAgICBzdHJ1
Y3QgZGV2aWNlICpkZXYgPSBycHJvYy0+ZGV2LnBhcmVudDsKPiA+ID4gPiAgICAgc3RydWN0IGRl
dmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsKPiA+ID4gPiAgICAgc3RydWN0IHJwcm9jX21l
bV9lbnRyeSAqbWVtOwo+ID4gPiA+IC0gICBzdHJ1Y3QgcmVzZXJ2ZWRfbWVtICpybWVtOwo+ID4g
PiA+IC0gICBzdHJ1Y3Qgb2ZfcGhhbmRsZV9pdGVyYXRvciBpdDsKPiA+ID4gPiAtICAgaW50IGlu
ZGV4ID0gMDsKPiA+ID4gPiAtCj4gPiA+ID4gLSAgIG9mX3BoYW5kbGVfaXRlcmF0b3JfaW5pdCgm
aXQsIG5wLCAibWVtb3J5LXJlZ2lvbiIsIE5VTEwsIDApOwo+ID4gPiA+IC0gICB3aGlsZSAob2Zf
cGhhbmRsZV9pdGVyYXRvcl9uZXh0KCZpdCkgPT0gMCkgewo+ID4gPiA+IC0gICAgICAgICAgIHJt
ZW0gPSBvZl9yZXNlcnZlZF9tZW1fbG9va3VwKGl0Lm5vZGUpOwo+ID4gPiA+IC0gICAgICAgICAg
IGlmICghcm1lbSkgewo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoaXQu
bm9kZSk7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgInVuYWJsZSB0
byBhY3F1aXJlIG1lbW9yeS1yZWdpb25cbiIpOwo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4gLSAgICAgICAgICAgfQo+ID4gPiA+ICsgICBpbnQgaW5k
ZXggPSAwLCBtciA9IDA7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICB3aGlsZSAoMSkgewo+ID4gPiA+
ICsgICAgICAgICAgIHN0cnVjdCByZXNvdXJjZSByZXM7Cj4gPiA+ID4gKyAgICAgICAgICAgaW50
IHJldDsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgcmV0ID0gb2ZfcmVzZXJ2ZWRfbWVt
X3JlZ2lvbl90b19yZXNvdXJjZShucCwgbXIrKywgJnJlcyk7Cj4gPiA+ID4gKyAgICAgICAgICAg
aWYgKHJldCkKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gPgo+ID4g
PiBUaGUgb3JpZ2luYWwgY29kZSBjYWxscyBycHJvY19lbGZfbG9hZF9yc2NfdGFibGUoKSBbMV0g
YWZ0ZXIgaXRlcmF0aW5nIHRocm91Z2gKPiA+ID4gdGhlIG1lbW9yeSByZWdpb24sIHNvbWV0aGlu
ZyB0aGF0IHdvbid0IGhhcHBlbiB3aXRoIHRoZSBhYm92ZS4KPiA+Cj4gPiBJbmRlZWQuIGl0IG5l
ZWRzIHRoZSBmb2xsb3dpbmcgaW5jcmVtZW50YWwgY2hhbmdlLiBJdCBpcyBzbGlnaHRseQo+ID4g
ZGlmZmVyZW50IGluIHRoYXQgcnByb2NfZWxmX2xvYWRfcnNjX3RhYmxlKCkgaXMgbm90IGNhbGxl
ZCBpZgo+ID4gJ21lbW9yeS1yZWdpb24nIGlzIG1pc3NpbmcsIGJ1dCB0aGUgYmluZGluZyBzYXlz
IHRoYXQncyByZXF1aXJlZC4KPiA+Cj4gPiA4PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVtb3Rl
cHJvYy9zdF9yZW1vdGVwcm9jLmMgYi9kcml2ZXJzL3JlbW90ZXByb2Mvc3RfcmVtb3RlcHJvYy5j
Cj4gPiBpbmRleCAwNDMzNDgzNjY5MjYuLmNiMDljMjQ0ZmRiNSAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvcmVtb3RlcHJvYy9zdF9yZW1vdGVwcm9jLmMKPiA+ICsrKyBiL2RyaXZlcnMvcmVtb3Rl
cHJvYy9zdF9yZW1vdGVwcm9jLmMKPiA+IEBAIC0xMjAsMTUgKzEyMCwxOSBAQCBzdGF0aWMgaW50
IHN0X3Jwcm9jX3BhcnNlX2Z3KHN0cnVjdCBycHJvYyAqcnByb2MsIGNvbnN0IHN0cnVjdCBmaXJt
d2FyZSAqZncpCj4gPiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9IHJwcm9jLT5kZXYucGFy
ZW50Owo+ID4gICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOwo+
ID4gICAgICAgICBzdHJ1Y3QgcnByb2NfbWVtX2VudHJ5ICptZW07Cj4gPiAtICAgICAgIGludCBp
bmRleCA9IDAsIG1yID0gMDsKPiA+ICsgICAgICAgaW50IGluZGV4ID0gMDsKPiA+Cj4gPiAgICAg
ICAgIHdoaWxlICgxKSB7Cj4gPiAgICAgICAgICAgICAgICAgc3RydWN0IHJlc291cmNlIHJlczsK
PiA+ICAgICAgICAgICAgICAgICBpbnQgcmV0Owo+ID4KPiA+IC0gICAgICAgICAgICAgICByZXQg
PSBvZl9yZXNlcnZlZF9tZW1fcmVnaW9uX3RvX3Jlc291cmNlKG5wLCBtcisrLCAmcmVzKTsKPiA+
IC0gICAgICAgICAgICAgICBpZiAocmV0KQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIDA7Cj4gPiArICAgICAgICAgICAgICAgcmV0ID0gb2ZfcmVzZXJ2ZWRfbWVtX3JlZ2lvbl90
b19yZXNvdXJjZShucCwgaW5kZXgsICZyZXMpOwo+ID4gKyAgICAgICAgICAgICAgIGlmIChyZXQp
IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChpbmRleCkKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBl
bHNlCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAr
ICAgICAgICAgICAgICAgfQo+Cj4gVGhpcyBsb29rcyBicml0dGxlIGFuZCBJJ20gbm90IHN1cmUg
aXQgd291bGQgd29yay4KPgo+IEdvaW5nIGJhY2sgdG8gdGhlIG9yaWdpbmFsIGltcGxlbWVudGF0
aW9uLCB0aGUgb25seSB0aW1lIHdlIHdhbnQgdG8KPiAiYnJlYWsiIGlzIHdoZW4gQGluZGV4IGlz
IGVxdWFsIHRvIHRoZSBhbW91bnQgb2YgbWVtb3J5IHJlZ2lvbnMgX2FuZF8KPiByZXQgaXMgLUVJ
TlZBTC4gIEFueSBvdGhlciBjb25kaXRpb24gc2hvdWxkIHJldHVybi4KCkBpbmRleCBlcXVhbCB0
byBudW1iZXIgb2YgZW50cmllcyByZXR1cm5zIC1FTk9ERVYsIHNvIHRoYXQgY29uZGl0aW9uCmlz
IGltcG9zc2libGUuIFdlIGNhbiBzaW1wbHkgaXQgdG8gdGhpczoKCmlmIChyZXQgPT0gLUVOT0RF
ViAmJiBpbmRleCkKICAgIGJyZWFrOwplbHNlCiAgICByZXR1cm4gcmV0OwoKSWYgeW91IHdhbnQg
dG8ga2VlcCB0aGUgcHJpb3IgYmVoYXZpb3Igd2hlbiAnbWVtb3J5LXJlZ2lvbicgaXMKbWlzc2lu
ZywgdGhlbiAnJiYgaW5kZXgnIGNhbiBiZSByZW1vdmVkLCBidXQgSSB0aGluayB0aGF0IHdhcyB3
cm9uZwpiZWhhdmlvci4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
