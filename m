Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F4AA72979
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Mar 2025 05:32:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35743C78034;
	Thu, 27 Mar 2025 04:32:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4E51C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Mar 2025 04:32:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3B3D25C667F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Mar 2025 04:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF92C4CEEB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Mar 2025 04:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743049959;
 bh=vkEar+Bp4mb9U1ErBYXk0ufSXnmYuVhKsrxGSFbrQIw=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=unNIypE6iqy+ubI9Ya0D9eLbo1mZTw8lYFUzFDiY6evS7og0p4YWv4/xQF6JIcNKV
 YZB63Um3ZTLhNx+F/QjCA/RcFQUdswqcOgW4MI0XYIFtTW/acH28hsIN+3vaKBRn/N
 UkuhOEEMuWvKiv4GKpFyISlTuC0LGi5hrfsnNPx9Ipgc34LTgE8JtDHA4/zDm8xTbX
 JCwg8erYxa5hyVRgWVyKGKFpQ7kVMdFr3OVnqCzlqPQocJKkRmfm5qanKxYhrUJ5u+
 IEfNN9iS/upvnkhwdE79CPUUdSbrnJ4bY5DF0cnkr4EUIIubwzdayLNmo325buQEYb
 OvNcKRN0DdlcA==
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30c0517142bso6240751fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 21:32:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUZakpx1FFhdFgN010b+qkiGZggTnSv7/TJUTDqCUXlu08y4YoFAaLVjwDUKdQLeXtvM+p+Kb+UoLHtTg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzBdcq/MEmHwMOAs39c8PsAs5kaHB3O0ewhY/HNJx5PSKqh4XQG
 ECN0WtAyq6gorCVth2gmOA48GG1My8iLoMeT8dcCdUdjkY0zcV35LVL0omZ0DwWQPuVRS/UQTYM
 rEsYF6MOTBR1yvuRbGYyn1Hu3684=
X-Google-Smtp-Source: AGHT+IF6fAB138KxHWy/pT7d/+7sa0DqbsRN8WZ3PB5VKFSTgeIGYi9SJIdz25/4ZRPKiUb58v/Gi3ZiI0Z3sR4FiZc=
X-Received: by 2002:a05:651c:1a0b:b0:30b:b7c3:ea71 with SMTP id
 38308e7fff4ca-30dc5e31b95mr9042391fa.15.1743049957271; Wed, 26 Mar 2025
 21:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org>
 <20250317232426.952188-3-robh@kernel.org>
 <CAGb2v65djD5DLQnjQrp9kSHTQYVd9p_vP9WySj2Cx81rHmh5Mw@mail.gmail.com>
 <CAL_JsqLoJAwPeWjXyQYK1rvVzn6Meapz3iS9gW+QqYpYKuJkBQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLoJAwPeWjXyQYK1rvVzn6Meapz3iS9gW+QqYpYKuJkBQ@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 27 Mar 2025 12:32:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v65nG82vDvTHMW0GQFHed5L4pQFMDggtTpuLqfm=woKm=w@mail.gmail.com>
X-Gm-Features: AQ5f1JqdFE0VpmnOb9GgVtgJfb7ntGDb2tyu8gNbju_XzgxeziYqnhZQK0zKPKw
Message-ID: <CAGb2v65nG82vDvTHMW0GQFHed5L4pQFMDggtTpuLqfm=woKm=w@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, imx@lists.linux.dev,
 Saravana Kannan <saravanak@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/3] of: Simplify
	of_dma_set_restricted_buffer() to use of_for_each_phandle()
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCBNYXIgMjcsIDIwMjUgYXQgMjo1M+KAr0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgMTo0NOKAr0FNIENoZW4t
WXUgVHNhaSA8d2Vuc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSwKPiA+Cj4gPiBPbiBU
dWUsIE1hciAxOCwgMjAyNSBhdCA3OjI54oCvQU0gUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFNpbXBsaWZ5IG9mX2RtYV9zZXRfcmVzdHJpY3Rl
ZF9idWZmZXIoKSBieSB1c2luZyBvZl9wcm9wZXJ0eV9wcmVzZW50KCkKPiA+ID4gYW5kIG9mX2Zv
cl9lYWNoX3BoYW5kbGUoKSBpdGVyYXRvci4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9i
IEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJz
L29mL2RldmljZS5jIHwgMzQgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+ID4g
Pgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9kZXZpY2UuYyBiL2RyaXZlcnMvb2YvZGV2
aWNlLmMKPiA+ID4gaW5kZXggZWRmM2JlMTk3MjY1Li5iYjRhNDdkNTgyNDkgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2RyaXZlcnMvb2YvZGV2aWNlLmMKPiA+ID4gKysrIGIvZHJpdmVycy9vZi9kZXZpY2Uu
Ywo+ID4gPiBAQCAtMzUsNDQgKzM1LDM2IEBAIEVYUE9SVF9TWU1CT0wob2ZfbWF0Y2hfZGV2aWNl
KTsKPiA+ID4gIHN0YXRpYyB2b2lkCj4gPiA+ICBvZl9kbWFfc2V0X3Jlc3RyaWN0ZWRfYnVmZmVy
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpucCkKPiA+ID4gIHsKPiA+
ID4gLSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsICpvZl9ub2RlID0gZGV2LT5vZl9u
b2RlOwo+ID4gPiAtICAgICAgIGludCBjb3VudCwgaTsKPiA+ID4gKyAgICAgICBzdHJ1Y3QgZGV2
aWNlX25vZGUgKm9mX25vZGUgPSBkZXYtPm9mX25vZGU7Cj4gPiA+ICsgICAgICAgc3RydWN0IG9m
X3BoYW5kbGVfaXRlcmF0b3IgaXQ7Cj4gPiA+ICsgICAgICAgaW50IHJjLCBpID0gMDsKPiA+ID4K
PiA+ID4gICAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0RNQV9SRVNUUklDVEVEX1BPT0wp
KQo+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gPgo+ID4gPiAtICAgICAgIGNvdW50
ID0gb2ZfcHJvcGVydHlfY291bnRfZWxlbXNfb2Zfc2l6ZShvZl9ub2RlLCAibWVtb3J5LXJlZ2lv
biIsCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHNpemVvZih1MzIpKTsKPiA+ID4gICAgICAgICAvKgo+ID4gPiAgICAgICAgICAqIElmIGRldi0+
b2Zfbm9kZSBkb2Vzbid0IGV4aXN0IG9yIGRvZXNuJ3QgY29udGFpbiBtZW1vcnktcmVnaW9uLCB0
cnkKPiA+ID4gICAgICAgICAgKiB0aGUgT0Ygbm9kZSBoYXZpbmcgRE1BIGNvbmZpZ3VyYXRpb24u
Cj4gPiA+ICAgICAgICAgICovCj4gPiA+IC0gICAgICAgaWYgKGNvdW50IDw9IDApIHsKPiA+ID4g
KyAgICAgICBpZiAoIW9mX3Byb3BlcnR5X3ByZXNlbnQob2Zfbm9kZSwgIm1lbW9yeS1yZWdpb24i
KSkKPiA+ID4gICAgICAgICAgICAgICAgIG9mX25vZGUgPSBucDsKPiA+ID4gLSAgICAgICAgICAg
ICAgIGNvdW50ID0gb2ZfcHJvcGVydHlfY291bnRfZWxlbXNfb2Zfc2l6ZSgKPiA+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgb2Zfbm9kZSwgIm1lbW9yeS1yZWdpb24iLCBzaXplb2YodTMyKSk7
Cj4gPiA+IC0gICAgICAgfQo+ID4gPgo+ID4gPiAtICAgICAgIGZvciAoaSA9IDA7IGkgPCBjb3Vu
dDsgaSsrKSB7Cj4gPiA+IC0gICAgICAgICAgICAgICBub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShv
Zl9ub2RlLCAibWVtb3J5LXJlZ2lvbiIsIGkpOwo+ID4gPiArICAgICAgIG9mX2Zvcl9lYWNoX3Bo
YW5kbGUoJml0LCByYywgb2Zfbm9kZSwgIm1lbW9yeS1yZWdpb24iLCBOVUxMLCAwKSB7Cj4gPiA+
ICAgICAgICAgICAgICAgICAvKgo+ID4gPiAgICAgICAgICAgICAgICAgICogVGhlcmUgbWlnaHQg
YmUgbXVsdGlwbGUgbWVtb3J5IHJlZ2lvbnMsIGJ1dCBvbmx5IG9uZQo+ID4gPiAgICAgICAgICAg
ICAgICAgICogcmVzdHJpY3RlZC1kbWEtcG9vbCByZWdpb24gaXMgYWxsb3dlZC4KPiA+ID4gICAg
ICAgICAgICAgICAgICAqLwo+ID4gPiAtICAgICAgICAgICAgICAgaWYgKG9mX2RldmljZV9pc19j
b21wYXRpYmxlKG5vZGUsICJyZXN0cmljdGVkLWRtYS1wb29sIikgJiYKPiA+ID4gLSAgICAgICAg
ICAgICAgICAgICBvZl9kZXZpY2VfaXNfYXZhaWxhYmxlKG5vZGUpKSB7Cj4gPiA+IC0gICAgICAg
ICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KG5vZGUpOwo+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsKPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChvZl9kZXZpY2VfaXNfY29t
cGF0aWJsZShpdC5ub2RlLCAicmVzdHJpY3RlZC1kbWEtcG9vbCIpICYmCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShpdC5ub2RlKSkgewo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoIW9mX3Jlc2VydmVkX21lbV9kZXZpY2VfaW5pdF9ieV9p
ZHgoZGV2LCBvZl9ub2RlLCBpKSkgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG9mX25vZGVfcHV0KGl0Lm5vZGUpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gPiAgICAg
ICAgICAgICAgICAgfQo+ID4gPiAtICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQobm9kZSk7Cj4g
PiA+ICsgICAgICAgICAgICAgICBpKys7Cj4gPiA+ICAgICAgICAgfQo+ID4gPgo+ID4gPiAtICAg
ICAgIC8qCj4gPiA+IC0gICAgICAgICogQXR0ZW1wdCB0byBpbml0aWFsaXplIGEgcmVzdHJpY3Rl
ZC1kbWEtcG9vbCByZWdpb24gaWYgb25lIHdhcyBmb3VuZC4KPiA+ID4gLSAgICAgICAgKiBOb3Rl
IHRoYXQgY291bnQgY2FuIGhvbGQgYSBuZWdhdGl2ZSBlcnJvciBjb2RlLgo+ID4gPiAtICAgICAg
ICAqLwo+ID4gPiAtICAgICAgIGlmIChpIDwgY291bnQgJiYgb2ZfcmVzZXJ2ZWRfbWVtX2Rldmlj
ZV9pbml0X2J5X2lkeChkZXYsIG9mX25vZGUsIGkpKQo+ID4gPiAtICAgICAgICAgICAgICAgZGV2
X3dhcm4oZGV2LCAiZmFpbGVkIHRvIGluaXRpYWxpc2UgXCJyZXN0cmljdGVkLWRtYS1wb29sXCIg
bWVtb3J5IG5vZGVcbiIpOwo+ID4gPiArICAgICAgIGRldl93YXJuKGRldiwgImZhaWxlZCB0byBp
bml0aWFsaXNlIFwicmVzdHJpY3RlZC1kbWEtcG9vbFwiIG1lbW9yeSBub2RlXG4iKTsKPiA+Cj4g
PiBUaGlzIGNoYW5nZXMgdGhlIGJlaGF2aW9yLiBCZWZvcmUgdGhpcyBwYXRjaCwgaXQgd2FzOgo+
ID4KPiA+ICAgICBpZiBhIHJlc3RyaWN0ZWQgZG1hIHBvb2wgd2FzIGZvdW5kLCBidXQgaW5pdGlh
bGl6aW5nIGl0IGZhaWxlZCwgcHJpbnQKPiA+ICAgICBhIHdhcm5pbmcuCj4gPgo+ID4gV2hlcmVh
cyBub3cgaXQgaGFzIGJlY29tZToKPiA+Cj4gPiAgICAgIHByaW50IGEgd2FybmluZyB1bmxlc3Mg
YSByZXN0cmljdGVkIGRtYSBwb29sIHdhcyBmb3VuZCBhbmQgc3VjY2Vzc2Z1bGx5Cj4gPiAgICAg
IGluaXRpYWxpemVkLgo+ID4KPiA+IFRoaXMgY2hhbmdlIGNhdXNlcyB0aGUga2VybmVsIHRvIHBy
aW50IG91dCB0aGUgd2FybmluZyBmb3IgZGV2aWNlcyB0aGF0Cj4gPiBkb24ndCBldmVuIGRvIERN
QToKPgo+IFRoYW5rcy4gSSBmaXhlZCBpdCB1cCB0byBvbmx5IHdhcm4gaWYgaSBpcyBub24temVy
by4KCk5vdCBzdXJlIGlmIHRoYXQgbWF0Y2hlcyB0aGUgb2xkIGJlaGF2aW9yIHRob3VnaD8gQSBu
b2RlIGNvdWxkIGhhdmUKbWVtb3J5LXJlZ2lvbnMgZm9yIHNoYXJlZCBkbWEgcG9vbHMgYnV0IG5v
dCByZXN0cmljdGVkIGRtYSBwb29scywKYW5kIGkgd291bGQgYmUgbm9uLXplcm8uCgpJTU8gdGhl
IHdhcm5pbmcgc2hvdWxkIGJlIGluIHRoZSAiZWxzZSIgYnJhbmNoIG9mCgogICAgaWYgKCFvZl9y
ZXNlcnZlZF9tZW1fZGV2aWNlX2luaXRfYnlfaWR4KGRldiwgb2Zfbm9kZSwgaSkpCgoKQ2hlbll1
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
