Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3641A71EAD
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Mar 2025 19:53:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6839C78F67;
	Wed, 26 Mar 2025 18:53:04 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C317CFAC4A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 18:53:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C149644138
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 18:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009F7C4CEEF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 18:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743015182;
 bh=7tnbCUTKMpPo8aoqQiYW410Hhe5LPNkwVR28/52KUGY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=snLlwT1ByOOZ8VDdLTGeiVAiEWrHtg3EvWVkctlzQIGFZzDT7XBzN2DIIFpHVRuA4
 QWSXjBNoMYxPNGrYI7EhmcSj0AeKKRNkXc7ncCYbP0fslp4P4+jMIkZIAktw92xzl9
 f/6pVTEXC4NSXGu4xof5rtvBej+C0GDqtW1wkGhV6Wi2YRwu2jpb0Lyghf8UlzytoG
 WwQ6DMNodUQHQk2VpoXa2/y89pLaPCLpwF+ISbR4hp6cRaabZWfTVWMtcr/ZSfSmh8
 jwKqvjyFp2FKpKOIs73vDRG4Rw8NplM2rXgHf/zkk7H07J9bPh8EYwSA5OcJVoLYAh
 Co5wZxznPQ7aQ==
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-ac297cbe017so235211766b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 11:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUlBlq4vOM2qOYKFJMlGba80WE50k5jvzAoe6R35feXeOxmFBsVsCV3wyeZ6DC2BWnhECdYyN1ZkvKcKA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzan6/IeqQEg9gGxCqK3GdPnRwSyRXU+4KU7KgP/IOmWgE8nV/g
 lfcU2at60O1D1iSiQD20bdKJ8Ggm1RMJg+AlpPEZJGedouux8/jUTXlDAb2ZJXhUbZu3rEs4EUQ
 1ZofXqqXeLh3CKH4L8cx/43MDAA==
X-Google-Smtp-Source: AGHT+IEi/FLkb6+pDXS2OgDct0wDDLVjgAusO19cQUp3SH7xeV/KwpO2rct7/toV7PxXM7MD6oHfl5OWID6sUvuLyTI=
X-Received: by 2002:a17:907:7295:b0:ac2:26a6:febf with SMTP id
 a640c23a62f3a-ac6e0d3384emr557164766b.20.1743015180452; Wed, 26 Mar 2025
 11:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org>
 <20250317232426.952188-3-robh@kernel.org>
 <CAGb2v65djD5DLQnjQrp9kSHTQYVd9p_vP9WySj2Cx81rHmh5Mw@mail.gmail.com>
In-Reply-To: <CAGb2v65djD5DLQnjQrp9kSHTQYVd9p_vP9WySj2Cx81rHmh5Mw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Mar 2025 13:52:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLoJAwPeWjXyQYK1rvVzn6Meapz3iS9gW+QqYpYKuJkBQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jqmc05lmNw-rFmLFhT71JwYvVm4xio8OJGuHie4RorDqomqBJbJolJsSNo
Message-ID: <CAL_JsqLoJAwPeWjXyQYK1rvVzn6Meapz3iS9gW+QqYpYKuJkBQ@mail.gmail.com>
To: wens@kernel.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgMTo0NOKAr0FNIENoZW4tWXUgVHNhaSA8d2Vuc0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gVHVlLCBNYXIgMTgsIDIwMjUgYXQgNzoyOeKA
r0FNIFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFNp
bXBsaWZ5IG9mX2RtYV9zZXRfcmVzdHJpY3RlZF9idWZmZXIoKSBieSB1c2luZyBvZl9wcm9wZXJ0
eV9wcmVzZW50KCkKPiA+IGFuZCBvZl9mb3JfZWFjaF9waGFuZGxlKCkgaXRlcmF0b3IuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvb2YvZGV2aWNlLmMgfCAzNCArKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIxIGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL29mL2RldmljZS5jIGIvZHJp
dmVycy9vZi9kZXZpY2UuYwo+ID4gaW5kZXggZWRmM2JlMTk3MjY1Li5iYjRhNDdkNTgyNDkgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL29mL2RldmljZS5jCj4gPiArKysgYi9kcml2ZXJzL29mL2Rl
dmljZS5jCj4gPiBAQCAtMzUsNDQgKzM1LDM2IEBAIEVYUE9SVF9TWU1CT0wob2ZfbWF0Y2hfZGV2
aWNlKTsKPiA+ICBzdGF0aWMgdm9pZAo+ID4gIG9mX2RtYV9zZXRfcmVzdHJpY3RlZF9idWZmZXIo
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+ID4gIHsKPiA+IC0g
ICAgICAgc3RydWN0IGRldmljZV9ub2RlICpub2RlLCAqb2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsK
PiA+IC0gICAgICAgaW50IGNvdW50LCBpOwo+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUg
Km9mX25vZGUgPSBkZXYtPm9mX25vZGU7Cj4gPiArICAgICAgIHN0cnVjdCBvZl9waGFuZGxlX2l0
ZXJhdG9yIGl0Owo+ID4gKyAgICAgICBpbnQgcmMsIGkgPSAwOwo+ID4KPiA+ICAgICAgICAgaWYg
KCFJU19FTkFCTEVEKENPTkZJR19ETUFfUkVTVFJJQ1RFRF9QT09MKSkKPiA+ICAgICAgICAgICAg
ICAgICByZXR1cm47Cj4gPgo+ID4gLSAgICAgICBjb3VudCA9IG9mX3Byb3BlcnR5X2NvdW50X2Vs
ZW1zX29mX3NpemUob2Zfbm9kZSwgIm1lbW9yeS1yZWdpb24iLAo+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHUzMikpOwo+ID4gICAgICAg
ICAvKgo+ID4gICAgICAgICAgKiBJZiBkZXYtPm9mX25vZGUgZG9lc24ndCBleGlzdCBvciBkb2Vz
bid0IGNvbnRhaW4gbWVtb3J5LXJlZ2lvbiwgdHJ5Cj4gPiAgICAgICAgICAqIHRoZSBPRiBub2Rl
IGhhdmluZyBETUEgY29uZmlndXJhdGlvbi4KPiA+ICAgICAgICAgICovCj4gPiAtICAgICAgIGlm
IChjb3VudCA8PSAwKSB7Cj4gPiArICAgICAgIGlmICghb2ZfcHJvcGVydHlfcHJlc2VudChvZl9u
b2RlLCAibWVtb3J5LXJlZ2lvbiIpKQo+ID4gICAgICAgICAgICAgICAgIG9mX25vZGUgPSBucDsK
PiA+IC0gICAgICAgICAgICAgICBjb3VudCA9IG9mX3Byb3BlcnR5X2NvdW50X2VsZW1zX29mX3Np
emUoCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBvZl9ub2RlLCAibWVtb3J5LXJlZ2lvbiIs
IHNpemVvZih1MzIpKTsKPiA+IC0gICAgICAgfQo+ID4KPiA+IC0gICAgICAgZm9yIChpID0gMDsg
aSA8IGNvdW50OyBpKyspIHsKPiA+IC0gICAgICAgICAgICAgICBub2RlID0gb2ZfcGFyc2VfcGhh
bmRsZShvZl9ub2RlLCAibWVtb3J5LXJlZ2lvbiIsIGkpOwo+ID4gKyAgICAgICBvZl9mb3JfZWFj
aF9waGFuZGxlKCZpdCwgcmMsIG9mX25vZGUsICJtZW1vcnktcmVnaW9uIiwgTlVMTCwgMCkgewo+
ID4gICAgICAgICAgICAgICAgIC8qCj4gPiAgICAgICAgICAgICAgICAgICogVGhlcmUgbWlnaHQg
YmUgbXVsdGlwbGUgbWVtb3J5IHJlZ2lvbnMsIGJ1dCBvbmx5IG9uZQo+ID4gICAgICAgICAgICAg
ICAgICAqIHJlc3RyaWN0ZWQtZG1hLXBvb2wgcmVnaW9uIGlzIGFsbG93ZWQuCj4gPiAgICAgICAg
ICAgICAgICAgICovCj4gPiAtICAgICAgICAgICAgICAgaWYgKG9mX2RldmljZV9pc19jb21wYXRp
YmxlKG5vZGUsICJyZXN0cmljdGVkLWRtYS1wb29sIikgJiYKPiA+IC0gICAgICAgICAgICAgICAg
ICAgb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShub2RlKSkgewo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgb2Zfbm9kZV9wdXQobm9kZSk7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsKPiA+ICsgICAgICAgICAgICAgICBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoaXQubm9k
ZSwgInJlc3RyaWN0ZWQtZG1hLXBvb2wiKSAmJgo+ID4gKyAgICAgICAgICAgICAgICAgICBvZl9k
ZXZpY2VfaXNfYXZhaWxhYmxlKGl0Lm5vZGUpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoIW9mX3Jlc2VydmVkX21lbV9kZXZpY2VfaW5pdF9ieV9pZHgoZGV2LCBvZl9ub2RlLCBp
KSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChpdC5u
b2RlKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICAgIH0KPiA+IC0gICAgICAg
ICAgICAgICBvZl9ub2RlX3B1dChub2RlKTsKPiA+ICsgICAgICAgICAgICAgICBpKys7Cj4gPiAg
ICAgICAgIH0KPiA+Cj4gPiAtICAgICAgIC8qCj4gPiAtICAgICAgICAqIEF0dGVtcHQgdG8gaW5p
dGlhbGl6ZSBhIHJlc3RyaWN0ZWQtZG1hLXBvb2wgcmVnaW9uIGlmIG9uZSB3YXMgZm91bmQuCj4g
PiAtICAgICAgICAqIE5vdGUgdGhhdCBjb3VudCBjYW4gaG9sZCBhIG5lZ2F0aXZlIGVycm9yIGNv
ZGUuCj4gPiAtICAgICAgICAqLwo+ID4gLSAgICAgICBpZiAoaSA8IGNvdW50ICYmIG9mX3Jlc2Vy
dmVkX21lbV9kZXZpY2VfaW5pdF9ieV9pZHgoZGV2LCBvZl9ub2RlLCBpKSkKPiA+IC0gICAgICAg
ICAgICAgICBkZXZfd2FybihkZXYsICJmYWlsZWQgdG8gaW5pdGlhbGlzZSBcInJlc3RyaWN0ZWQt
ZG1hLXBvb2xcIiBtZW1vcnkgbm9kZVxuIik7Cj4gPiArICAgICAgIGRldl93YXJuKGRldiwgImZh
aWxlZCB0byBpbml0aWFsaXNlIFwicmVzdHJpY3RlZC1kbWEtcG9vbFwiIG1lbW9yeSBub2RlXG4i
KTsKPgo+IFRoaXMgY2hhbmdlcyB0aGUgYmVoYXZpb3IuIEJlZm9yZSB0aGlzIHBhdGNoLCBpdCB3
YXM6Cj4KPiAgICAgaWYgYSByZXN0cmljdGVkIGRtYSBwb29sIHdhcyBmb3VuZCwgYnV0IGluaXRp
YWxpemluZyBpdCBmYWlsZWQsIHByaW50Cj4gICAgIGEgd2FybmluZy4KPgo+IFdoZXJlYXMgbm93
IGl0IGhhcyBiZWNvbWU6Cj4KPiAgICAgIHByaW50IGEgd2FybmluZyB1bmxlc3MgYSByZXN0cmlj
dGVkIGRtYSBwb29sIHdhcyBmb3VuZCBhbmQgc3VjY2Vzc2Z1bGx5Cj4gICAgICBpbml0aWFsaXpl
ZC4KPgo+IFRoaXMgY2hhbmdlIGNhdXNlcyB0aGUga2VybmVsIHRvIHByaW50IG91dCB0aGUgd2Fy
bmluZyBmb3IgZGV2aWNlcyB0aGF0Cj4gZG9uJ3QgZXZlbiBkbyBETUE6CgpUaGFua3MuIEkgZml4
ZWQgaXQgdXAgdG8gb25seSB3YXJuIGlmIGkgaXMgbm9uLXplcm8uCgpSb2IKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
