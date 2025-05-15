Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBB9AB8BF5
	for <lists+linux-stm32@lfdr.de>; Thu, 15 May 2025 18:10:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1035FC7A829;
	Thu, 15 May 2025 16:10:47 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63F4DC78037
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 16:10:46 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-442ed8a275fso12831945e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 09:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747325446; x=1747930246;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K2RUuqM7j77YiC7O2/E2sWiPYfT3vLPzw6aLspbrJ9A=;
 b=RKKqcAVuaucH8J3fRNYMC/jJuD+r25a8Ymz6hSvAi8GENvnC3r5NXZwk06/M5I4Eml
 bL4b5fo9uGvUbOXBRmft+L7sBZbNjTmAevYR/ONbEM3z4ulMKth2hM/BUYnzMh/f/KEN
 kSE3rvKm4gC69boNO6DpzdFA7z0hWW5fJ0nWNdPWxoj1NK3wPSOszPWYBL468zf8R/pe
 vy1pn253gmmG0HcOAVNn2rlm72s3Us7H1CVk0u4Bb9IfEEHXf/D+tTegqQQ1X6KF3l6J
 mr99Yj2kuBDkIF6AOxNpmkJGAEJ/j3FMFs6TFjzbnSQRILf6MxYimiD1idCx/S+Nq8XK
 5iSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747325446; x=1747930246;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2RUuqM7j77YiC7O2/E2sWiPYfT3vLPzw6aLspbrJ9A=;
 b=MC6YSZdjDMY9fQ/mwg1OnIEL4mcEaqo1e4PRuAe2zk8WTN7UwKajiqonng9eJ2Tv/m
 ThVsSzaS+x2Xjt5v6XAM59ttqXxpJsmeo3Ev4RClCabZkLajQltH9uDotEaHBaRtjNWg
 AGlU/nc03AGQ3Hqit8I1n/eil6zF5vOKK+lJ9BIgytZP5sMPdsCaCafBSbOCU+S+aJfh
 EZHaI8l/FUJg8xBqn6Hsp8OLylgzq+PyM6UwWiNCQdhWaHZ2bnZXuvVHNqQCcQpjqN5D
 aMY7KHOxyf0rOWYvxy2NVzNIydgpp7+SFTUWzhLnEHaL5KpisHkpsDmgwy39Qu/1jb3H
 Qkhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXydSPaN3BcPzZCfI98oC8KxjeYYpRTwSWrt6NKqbyDCxftCQEYH9bCP0mrLt1M9aG5wtvGPL7IC2XmQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyYZkhcgflRPZ9mXV/G68/VJafJTHznYfKN1St2FjiIPRFAPnPe
 Lg7G577R0tPs8v+8dKsoGFj6FAbYoLIbw1TWWQzd7j6tzbL4JyTN+132+u/i8VFvQoZtYGYv8GL
 9SR3QMCEyOe7dvwckwZiM/oi8BAcuu6k=
X-Gm-Gg: ASbGncvh9P4ro7z7vfqoUaFpezlTLsY0Taur7sHwGTU0vU2UzmGZ9T/AeEEzUFtp5x3
 x+FPuuK+HolaNXaDukSYzCDFUFJC3YdxCopieu9lj5XE62EWtETbI/zGg6r4Nw1A9KJM9x2BmeR
 aAOJ3EePco/WEhWfpPfj9y+DPdNPJUnmg=
X-Google-Smtp-Source: AGHT+IFZbUVdPwHyT0Clm2bKqbykU6Hoz0divy6kyYfkhV2fc4IbIeu9yY9VFI6isbO+t3Jgv72E5GlEP9c/n5Vmv4I=
X-Received: by 2002:a05:6000:2dc8:b0:3a0:8325:8090 with SMTP id
 ffacd0b85a97d-3a35c825b99mr373886f8f.18.1747325445358; Thu, 15 May 2025
 09:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <202505151255.rCHp8Bvu-lkp@intel.com>
 <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
In-Reply-To: <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 May 2025 17:10:19 +0100
X-Gm-Features: AX0GCFutHTsXdF6X-UzPCdROzCLoI3M2MdWC6VhMZtfwaAYxbEp32opOSVRegW4
Message-ID: <CA+V-a8vrLyWDprGMcnbPQ5Skt=+zcRA6nJ6APOQ2V0d17pfMog@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/2] clocksource/drivers/renesas-ostm:
 Unconditionally enable reprobe support
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

SGkgR2VlcnQsCgpPbiBUaHUsIE1heSAxNSwgMjAyNSBhdCA2OjU54oCvQU0gR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIDE1IE1heSAy
MDI1IGF0IDA3OjA0LCBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4gd3JvdGU6Cj4g
PiBrZXJuZWwgdGVzdCByb2JvdCBub3RpY2VkIHRoZSBmb2xsb3dpbmcgYnVpbGQgd2FybmluZ3M6
Cj4gPgo+ID4gW2F1dG8gYnVpbGQgdGVzdCBXQVJOSU5HIG9uIHRpcC90aW1lcnMvY29yZV0KPiA+
IFthbHNvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiByb2JoL2Zvci1uZXh0IGxpbnVzL21hc3RlciB2
Ni4xNS1yYzYgbmV4dC0yMDI1MDUxNF0KPiA+IFtjYW5ub3QgYXBwbHkgdG8gZGFuaWVsLWxlemNh
bm8vY2xvY2tldmVudHMvbmV4dF0KPiA+IFtJZiB5b3VyIHBhdGNoIGlzIGFwcGxpZWQgdG8gdGhl
IHdyb25nIGdpdCB0cmVlLCBraW5kbHkgZHJvcCB1cyBhIG5vdGUuCj4gPiBBbmQgd2hlbiBzdWJt
aXR0aW5nIHBhdGNoLCB3ZSBzdWdnZXN0IHRvIHVzZSAnLS1iYXNlJyBhcyBkb2N1bWVudGVkIGlu
Cj4gPiBodHRwczovL2dpdC1zY20uY29tL2RvY3MvZ2l0LWZvcm1hdC1wYXRjaCNfYmFzZV90cmVl
X2luZm9ybWF0aW9uXQo+ID4KPiA+IHVybDogICAgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxh
Yi1sa3AvbGludXgvY29tbWl0cy9QcmFiaGFrYXIvZHQtYmluZGluZ3MtdGltZXItcmVuZXNhcy1v
c3RtLURvY3VtZW50LVJaLVYyTi1SOUEwOUcwNTYtc3VwcG9ydC8yMDI1MDUwNi0yMjM2MzYKPiA+
IGJhc2U6ICAgdGlwL3RpbWVycy9jb3JlCj4gPiBwYXRjaCBsaW5rOiAgICBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjUwNTA2MTAzMTUyLjEwOTUyNS0zLXByYWJoYWthci5tYWhhZGV2LWxh
ZC5yaiU0MGJwLnJlbmVzYXMuY29tCj4gPiBwYXRjaCBzdWJqZWN0OiBbUEFUQ0ggdjMgMi8yXSBj
bG9ja3NvdXJjZS9kcml2ZXJzL3JlbmVzYXMtb3N0bTogVW5jb25kaXRpb25hbGx5IGVuYWJsZSBy
ZXByb2JlIHN1cHBvcnQKPiA+IGNvbmZpZzogaGV4YWdvbi1yYW5kY29uZmlnLTAwMS0yMDI1MDUx
MyAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjUwNTE1LzIwMjUw
NTE1MTI1NS5yQ0hwOEJ2dS1sa3BAaW50ZWwuY29tL2NvbmZpZykKPiA+IGNvbXBpbGVyOiBjbGFu
ZyB2ZXJzaW9uIDIxLjAuMGdpdCAoaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0
IGY4MTlmNDYyODRmMmE3OTc5MDAzOGUxZjY2NDkxNzI3ODk3MzRhZTgpCj4gPiByZXByb2R1Y2Ug
KHRoaXMgaXMgYSBXPTEgYnVpbGQpOiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9h
cmNoaXZlLzIwMjUwNTE1LzIwMjUwNTE1MTI1NS5yQ0hwOEJ2dS1sa3BAaW50ZWwuY29tL3JlcHJv
ZHVjZSkKPiA+Cj4gPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2Nv
bW1pdCAoaS5lLiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9mCj4gPiB0aGUgc2FtZSBwYXRjaC9j
b21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzCj4gPiB8IFJlcG9ydGVkLWJ5OiBrZXJu
ZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+IHwgQ2xvc2VzOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjUwNTE1MTI1NS5yQ0hwOEJ2dS1sa3BAaW50ZWwu
Y29tLwo+ID4KPiA+IEFsbCB3YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOgo+ID4K
PiA+ID4+IGRyaXZlcnMvY2xvY2tzb3VyY2UvcmVuZXNhcy1vc3RtLmM6MjM1OjM0OiB3YXJuaW5n
OiB1bnVzZWQgdmFyaWFibGUgJ29zdG1fb2ZfdGFibGUnIFstV3VudXNlZC1jb25zdC12YXJpYWJs
ZV0KPiA+ICAgICAgMjM1IHwgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb3N0bV9v
Zl90YWJsZVtdID0gewo+ID4gICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBefn5+fn5+fn5+fn5+Cj4gPiAgICAxIHdhcm5pbmcgZ2VuZXJhdGVkLgo+ID4KPiA+Cj4g
PiB2aW0gKy9vc3RtX29mX3RhYmxlICsyMzUgZHJpdmVycy9jbG9ja3NvdXJjZS9yZW5lc2FzLW9z
dG0uYwo+ID4KPiA+IDNhM2U5ZjIzYzJjYWU5IEJpanUgRGFzIDIwMjEtMTEtMTIgIDIzNAo+ID4g
M2EzZTlmMjNjMmNhZTkgQmlqdSBEYXMgMjAyMS0xMS0xMiBAMjM1ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBvc3RtX29mX3RhYmxlW10gPSB7Cj4gPiAzYTNlOWYyM2MyY2FlOSBC
aWp1IERhcyAyMDIxLTExLTEyICAyMzYgICAgICAgICB7IC5jb21wYXRpYmxlID0gInJlbmVzYXMs
b3N0bSIsIH0sCj4gPiAzYTNlOWYyM2MyY2FlOSBCaWp1IERhcyAyMDIxLTExLTEyICAyMzcgICAg
ICAgICB7IC8qIHNlbnRpbmVsICovIH0KPiA+IDNhM2U5ZjIzYzJjYWU5IEJpanUgRGFzIDIwMjEt
MTEtMTIgIDIzOCAgfTsKPiA+IDNhM2U5ZjIzYzJjYWU5IEJpanUgRGFzIDIwMjEtMTEtMTIgIDIz
OQo+Cj4gVGhlIHRhYmxlIGlzIHVudXNlZCBpZiBDT05GSUdfT0Y9biBkdWUgdG8KPgo+ICAgICAg
ICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIob3N0bV9vZl90YWJsZSks
Cj4KVGhhbmtzIGZvciB0aGUgcG9pbnRlciwgSSdsbCBhZGQgYSBfX21heWJlX3VudXNlZCBjb21w
aWxlciBhdHRyaWJ1dGUKYW5kIHNlbmQgYSBuZXcgdmVyc2lvbi4KCkNoZWVycywKUHJhYmhha2Fy
Cgo+IEdye29ldGplLGVldGluZ31zLAo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQK
Pgo+IC0tCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlv
bmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwo+Cj4gSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAo+
IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIg
b3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
