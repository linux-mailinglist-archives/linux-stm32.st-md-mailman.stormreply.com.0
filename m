Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9C8550539
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Jun 2022 15:54:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3F90C56630;
	Sat, 18 Jun 2022 13:54:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE482C035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Jun 2022 13:54:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3863460BA0;
 Sat, 18 Jun 2022 13:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A83C3411A;
 Sat, 18 Jun 2022 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655560474;
 bh=pEznlvbLCZMIZNrAGFvIthCC7BXrhairfIEqdywRBMA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GxhaPL32MMwD2706Sgr0GI/8Mp639UZnJ/ycF0FAHU3CsKxLwYzNMZLBY46ng/Cl6
 cA2tu+QHDcQ8szJt/XGkInJSooj3a8X6Z1+plT7627KxxpiLc29CdY5kWroUwI8a+x
 hooq9bpCJ0AR9emay7LD7rtZfEpWlUKjW/+2wuflJJ8FqazBIbIKr+lZJFjX5Q55nJ
 tiMMkcQQQ6AkUozXeP6350UGS9sK9EWEJVaxD1Gi+gcvZcYiKq9bE9qvY2Sl8Ib6BE
 oLDu0po4j9wgXmjAX9w74l2+KupzYd9kZ4nW7FUXvm5f6jOVFEW79O2m2kE4U8KvNx
 YWwjBtPyUuy9w==
Date: Sat, 18 Jun 2022 15:03:40 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Message-ID: <20220618150340.64e639df@jic23-huawei>
In-Reply-To: <5e81f73b996de80445c2e905c44ebb18c63a739b.camel@gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-21-nuno.sa@analog.com>
 <CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
 <ef73aa5801ae1c8078e6a930f22feb6214038176.camel@gmail.com>
 <20220611155902.2a5a7738@jic23-huawei>
 <5e81f73b996de80445c2e905c44ebb18c63a739b.camel@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: chrome-platform@lists.linux.dev,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
	Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	dl-linux-imx <linux-imx@nxp.com>,
	moderated@stm-ict-prod-mailman-01.stormreply.prv,
	"list:ARM/Mediatek"@stm-ict-prod-mailman-01.stormreply.prv,
	SoC@stm-ict-prod-mailman-01.stormreply.prv,
	support@stm-ict-prod-mailman-01.stormreply.prv,
	"          <linux-mediatek@lists.infradead.org>,  linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm  <linux-arm-msm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>,  OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cai Huoqing  <cai.huoqing@linux.dev>, Benjamin Fair <benjaminfair@google.com>, Jishnu  Prakash <quic_jprakash@quicinc.com>, Linus Walleij  <linus.walleij@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre  Torgue <alexandre.torgue@foss.st.com>, Amit Kucheria <amitk@kernel.org>,  Andy Gross <agross@kernel.org>, Michael Hennerich  <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>, Benson  Leung <bleung@chromium.org>, ,  linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>"@stm-ict-prod-mailman-01.stormreply.prv
Subject: Re: [Linux-stm32] [PATCH 20/34] iio: inkern: only relase the device
 node when done with it
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

T24gTW9uLCAxMyBKdW4gMjAyMiAwOToyMDoyNiArMDIwMApOdW5vIFPDoSA8bm9uYW1lLm51bm9A
Z21haWwuY29tPiB3cm90ZToKCj4gT24gU2F0LCAyMDIyLTA2LTExIGF0IDE1OjU5ICswMTAwLCBK
b25hdGhhbiBDYW1lcm9uIHdyb3RlOgo+ID4gCj4gPiArQ2MgTWFyayBCcm93biBmb3IgYSBxdWVy
eSBvbiBvcmRlcmluZyBpbiBkZXZpY2UgdHJlZSBiYXNlZCBTUEkKPiA+IHNldHVwLgo+ID4gCj4g
PiBPbiBGcmksIDEwIEp1biAyMDIyIDIyOjA4OjQxICswMjAwCj4gPiBOdW5vIFPDoSA8bm9uYW1l
Lm51bm9AZ21haWwuY29tPiB3cm90ZToKPiA+ICAgCj4gPiA+IE9uIEZyaSwgMjAyMi0wNi0xMCBh
dCAxNjo1NiArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOiAgCj4gPiA+ID4gT24gRnJpLCBK
dW4gMTAsIDIwMjIgYXQgMTA6NDggQU0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KPiA+
ID4gPiB3cm90ZTrCoCAgIAo+ID4gPiA+ID4gCj4gPiA+ID4gPiAnb2Zfbm9kZV9wdXQoKScgY2Fu
IHBvdGVudGlhbGx5IHJlbGVhc2UgdGhlIG1lbW9yeSBwb2ludGVkIHRvCj4gPiA+ID4gPiBieQo+
ID4gPiA+ID4gJ2lpb3NwZWMubnAnIHdoaWNoIHdvdWxkIGxlYXZlIHVzIHdpdGggYW4gaW52YWxp
ZCBwb2ludGVyIChhbmQKPiA+ID4gPiA+IHdlCj4gPiA+ID4gPiB3b3VsZAo+ID4gPiA+ID4gc3Rp
bGwgcGFzcyBpdCBpbiAnb2ZfeGxhdGUoKScpLiBBcyBzdWNoLCB3ZSBjYW4gb25seSByZWxlYXNl
Cj4gPiA+ID4gPiB0aGUKPiA+ID4gPiA+IG5vZGUKPiA+ID4gPiA+IGFmdGVyIHdlIGFyZSBkb25l
IHdpdGggaXQuwqAgICAKPiA+ID4gPiAKPiA+ID4gPiBUaGUgcXVlc3Rpb24geW91IHNob3VsZCBh
bnN3ZXIgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGlzIHRoZQo+ID4gPiA+IGZvbGxvd2luZzoKPiA+
ID4gPiAiQ2FuIGFuIE9GIG5vZGUsIGF0dGFjaGVkIHRvIGEgc3RydWN0IGRldmljZSwgYmUgZ29u
ZSBiZWZvcmUgdGhlCj4gPiA+ID4gZGV2aWNlIGl0c2VsZj8iIElmIGl0IHNvLCB0aGVuIHBhdGNo
IGlzIGdvb2QsIG90aGVyd2lzZSB0aGVyZSBpcwo+ID4gPiA+IG5vCj4gPiA+ID4gcG9pbnQgaW4g
dGhpcyBwYXRjaCBpbiB0aGUgZmlyc3QgcGxhY2UuCj4gPiA+ID4gwqAgICAKPiA+ID4gCj4gPiA+
IFllYWgsIEkgbWlnaHQgYmUgd3JvbmcgYnV0IGZyb20gYSBxdWljayBsb29rLi4uIHllcywgSSB0
aGluayB0aGUKPiA+ID4gbm9kZQo+ID4gPiBjYW4gYmUgZ29uZSBiZWZvcmUgdGhlIGRldmljZS4g
VGFrZSBhIGxvb2sgb24gdGhlIHNwaSBvciBpMmMKPiA+ID4gb2Zfbm90aWZ5Cj4gPiA+IGhhbmRs
aW5nIGFuZCB5b3UgY2FuIHNlZSB0aGF0IHRoZSBub2RlcyBhcmUgZ2V0L3B1dCBvbiB0aGUKPiA+
ID4gYWRkL3JlbW92ZQo+ID4gPiBub3RpZmNhdGlvbi4gTWVhbmluZyB0aGF0IHRoZSBub2RlIGxp
ZmVzcGFuIGlzIG5vdCByZWFsbHkgYXR0YWNoZWQKPiA+ID4gdG8KPiA+ID4gdGhlIGRldmljZSBs
aWZlc3Bhbi4gSWYgaXQgd2FzLCBJIHdvdWxkIGV4cGVjdCB0byBzZWUgb2Zfbm9kZV9wdXQoKQo+
ID4gPiBvbgo+ID4gPiB0aGUgZGV2aWNlIHJlbGVhc2UoKSBmdW5jdGlvbi4uLiAgCj4gPiAKPiA+
IEkgaGFkIGEgbG9vayBhdCBzcGlfb2Zfbm90aWZ5KCkgYW5kIGluZGVlZCB2aWEKPiA+IHNwaV91
bnJlZ2lzdGVyX2RldmljZSgpCj4gPiB0aGUgbm9kZSBpcyBwdXQganVzdCBiZWZvcmUgZGV2aWNl
X2RlbCgpIHNvIEkgYWdyZWUgdGhhdCBhdCBmaXJzdAo+ID4gZ2xhbmNlCj4gPiBpdCBzZWVtcyBs
aWtlIHRoZXJlIG1heSBiZSBhIHJhY2UgdGhlcmUgYWdhaW5zdCB0aGUgdXNlYWdlIGhlcmUuCj4g
PiBNYXJrICgrQ0MpIG91dCBvZiBpbnRlcmVzdCB3aHkgYXJlIHRoZSBub2RlIGdldHMgYmVmb3Jl
IHRoZQo+ID4gZGV2aWNlX2FkZCgpCj4gPiBpbiBzcGlfYWRkX2RldmljZSgpIGNhbGxlZCBmcm9t
IG9mX3JlZ2lzdGVyX3NwaV9kZXZpY2UoKSBidXQgdGhlCj4gPiBtYXRjaGluZwo+ID4gbm9kZSBw
dXRzIGJlZm9yZSB0aGUgZGV2aWNlX2RlbCgpIGluIHNwaV91bnJlZ2lzdGVyX2RldmljZSgpPwo+
ID4gU2VlbXMgbGlrZSBpbmNvbnNpc3RlbnQgb3JkZXJpbmcuLi4KPiA+IAo+ID4gV2hpY2ggaXMg
bm90IHRvIHNheSB3ZSBzaG91bGRuJ3QgZml4IHRoZSBJSU8gdXNhZ2UgYXMgdGhpcyBwYXRjaAo+
ID4gZG9lcyEKPiA+ICAgCj4gCj4gSnVzdCB0byBhZGQgc29tZXRoaW5nIHRoYXQgY2FtZSB0byBt
eSBhdHRlbnRpb24uIEluIHRoZSBJSU8gY2FzZSwgaXQKPiBkb2VzIG5vdCBldmVuIG1hdHRlciBp
ZiB0aGUgcGFyZW50IGRldmljZSBoYXMgdGhlIE9GIG5vZGUgbGlmZXRpbWUKPiAibGlua2VkIiB0
byBpdCAoYXMgaXQgYWN0dWFsbHkgaGFwcGVucyBmb3IgcGxhdGZvcm0gZGV2aWNlcykuIFRoZQo+
IHJlYXNvbiBpcyB0aGF0IGlpb19kZXYgb25seSBoYXMgYSB3ZWFrIHJlZmVyZW5jZSB0byBpdCdz
IHBhcmVudCBhbmQgKEkKPiB0aGluaykgdGhlIHBhcmVudCBjYW4gYWN0dWFsbHkgZ28gYXdheSB3
aGlsZSB0aGUgaWlvX2RldiBpcyBzdGlsbAo+IGFyb3VuZCAoZWc6IHNvbWVvbmUgaGFzIGFuIG9w
ZW4gZmQgdG8gdGhlIGlpb19kZXYgY2RldikuCgpJIGNoYXNlZCB0aHJvdWdoIHRoaXMgYXMgd2Vs
bCBhbmQgYWdyZWUuIFRoZSBkZXZpY2VfZGVsKCkKaGlkaW5nIGluIGNkZXZfZGV2aWNlX2RlbCgp
IHdpbGwgZHJvcCB0aGUgcGFyZW50IHJlZmVyZW5jZSBvbiB0aGUgcGFyZW50LgoKSSdtIG5vdCBz
dXJlIGl0IGFjdHVhbGx5IG1hdGVycyBtdWNoIHRob3VnaCBnaXZlbiBhbG1vc3QgYWxsIG9mX25v
ZGUKdXNlYWdlIGlzIG5vdCB0aWVkIHVwIHdpdGggdGhlIGFueXRoaW5nIHRoYXQgbWlnaHQgYmUg
dXNpbmcgdGhlIGlpb19kZXYKYWZ0ZXIgdGhlIGlpb19kZXZpY2VfdW5yZWdpc3RlcigpIGNhbGwu
CgpNYXliZSB0aGVyZSBpcyBhIHJhY2UgY29uZGl0aW9uIHNvbWV3aGVyZS4uLgoKPiAKPiA+ID4g
Cj4gPiA+IEFnYWluLCBJIG1pZ2h0IGJlIHdyb25nIGFuZCBJIGFkbWl0IEkgd2FzIG5vdCBzdXJl
IGFib3V0IGluY2x1ZGluZwo+ID4gPiB0aGlzCj4gPiA+IHBhdGNoIGJlY2F1c2UgaXQncyBhIHZl
cnkgdW5saWtlbHkgc2NlbmFyaW8gZXZlbiB0aG91Z2ggSSB0aGluaywgaW4KPiA+ID4gdGhlb3J5
LCBhIHBvc3NpYmxlIG9uZS4gIAo+ID4gCj4gPiBUaGUgcGF0Y2ggaXMgY3VycmVudGx5IHZhbGlk
IGV2ZW4gaWYgaXQncyBub3QgYSAncmVhbCcgYnVnLgo+ID4gR2l2ZW4gd2UgYXJlIGRvaW5nIGEg
cHV0IG9uIHRoYXQgZGV2aWNlX25vZGUsIGl0IG1ha2VzIHNlbnNlIGZvciB0aGF0Cj4gPiB0byBv
Y2N1ciBhZnRlciB0aGUgbG9jYWwgdXNlIGhhcyBmaW5pc2hlZCAtIHdlIHNob3VsZG4ndCBiZSBy
ZWx5aW5nCj4gPiBvbgo+ID4gd2hhdCBoYXBwZW5zIHRvIGJlIHRoZSBjYXNlIGZvciBsaWZldGlt
ZXMgdG9kYXkuCj4gPiAKPiA+IE5vdywgSSBkaWQgd29uZGVyIGlmIGFueSBkcml2ZXJzIGFjdHVh
bGx5IHVzZSBpdCBpbiB0aGVpciB4bGF0ZQo+ID4gY2FsbGJhY2tzLgo+ID4gT25lIGRvZXMgZm9y
IGFuIGVycm9yIHByaW50LCBzbyB0aGlzIGlzIHBvdGVudGlhbGx5IHJlYWwgKGlmIHZlcnkKPiA+
IHVubGlrZWx5ISkKPiA+IAo+ID4gVGhpcyBpc24ndCBhICdmaXgnIEknZCBleHBlY3QgdG8gcnVz
aCBpbiwgb3IgbmVjZXNzYXJpbHkgYmFja3BvcnQgdG8KPiA+IHN0YWJsZQo+ID4gYnV0IEkgdGhp
bmsgaXQncyBhIHZhbGlkIGZpeC4KPiA+ICAgCj4gCj4gU2hvdWxkIEkgZHJvcCB0aGUgZml4ZXMg
dGFnPwo+IApLZWVwIHRoZSB0YWcuIEl0J3MgYSBmaXgsIGp1c3QgYSBsb3cgcHJpb3JpdHkgb25l
LgoKSm9uYXRoYW4KCj4gLSBOdW5vIFPDoQo+IAo+IAo+IAo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
