Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF318AE83C
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 15:32:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 473CEC7128A;
	Tue, 23 Apr 2024 13:32:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84E1DC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 13:32:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5BB9261489
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 13:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9769DC4AF10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713879148;
 bh=AP67NgULme2krqQcPsRIs+2ZN6mA5krVB1+iZidsmpQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RXJB8wspxP8pk4Ow4/JgUdQxDYSuMWXtvwZcHMcygIfsV8CZfR5piUq+ffZvqfEf8
 QaaKf3bHJBXR8vawtx32iwMO76Si+wymzaiCe6XIsb0qQN4qg6yOpwkVFwPNV5XJzz
 w3QwhPpK1HIqxgI4nzYSjmrhJExmGY8HDD9LPiymmpo+Rc9iIGYzaXP46hW/p9JnmC
 F7ENkaz77czs+clx3X06vxLdZusskiyvM8EZsWZiLYrN/BfDsp0h0KshKepGB/wZhq
 i7VE5ACvBL2q/FXyyXhWltW+bwyXFIMkKY/KXY0At5eUGls3my/FvtWLlPMvg2Rzcf
 dHMzq6OZow9ww==
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-61b68644ab4so18421697b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 06:32:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXcO28swdeqB0hPWdIwYB5IAVaFaYreZwVyrClMNEu9ajtaY3qNQE5L5RDmNEKmbvUFGudPlWfQgDjmSg9AaIbMHP4Cm+Eqw2U/yTAzAH7a6S6L6ZWCfUxe
X-Gm-Message-State: AOJu0YyIGSetlw2/FdhwyLPP1EcxTiVHeSWk3ekv7j39w+GvaGf0yLXD
 krXJURJgs7YctALjGlz5Ew2XD5vbZCy+o/mQXdfUGT9/ivMaIVP5j8jq+ovMisdt+/vhD7deHLn
 kLOk8JlsVk9QXpiGP9U8wUscR4cVbRceU4MpTBQ==
X-Google-Smtp-Source: AGHT+IFshLz5spQ5CQ8dKF+BBgEo+ryWs5tFujTBrjKdLYE1dJu8PqqxFbvK93HDcogCUI2Ar0hY5OF8o/XSbAfFJgs=
X-Received: by 2002:a25:6c0b:0:b0:de3:e1ea:d23 with SMTP id
 h11-20020a256c0b000000b00de3e1ea0d23mr2464770ybc.51.1713879146752; Tue, 23
 Apr 2024 06:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240322104732.2327060-1-sean@geanix.com>
 <lkrxoqhcitmvjvzslhx6mrdjaa6lpxtpmdjt7wwollm6z4h65q@jk5esjje6ppy>
In-Reply-To: <lkrxoqhcitmvjvzslhx6mrdjaa6lpxtpmdjt7wwollm6z4h65q@jk5esjje6ppy>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 23 Apr 2024 15:32:15 +0200
X-Gmail-Original-Message-ID: <CAN6tsi40-gGgG3Bw-rS4TZBO+=JthWkPh-XqErGvkHdvhqx6tA@mail.gmail.com>
Message-ID: <CAN6tsi40-gGgG3Bw-rS4TZBO+=JthWkPh-XqErGvkHdvhqx6tA@mail.gmail.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: dsi: relax mode_valid clock
	tolerance
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

T24gTW9uLCBBcHIgMjIsIDIwMjQgYXQgNDowNuKAr1BNIFNlYW4gTnlla2phZXIgPHNlYW5AZ2Vh
bml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE1hciAyMiwgMjAyNCBhdCAxMTo0NzozMUFNICsw
MTAwLCBTZWFuIE55ZWtqYWVyIHdyb3RlOgo+ID4gV2hlbiB1c2luZyB0aGUgRFNJIGludGVyZmFj
ZSB2aWEgRFNJMkxWRFMgYnJpZGdlLCBpdCBzZWVtcyBhIGJpdCBoYXJzaAo+ID4gdG8gcmVndWly
ZSB0aGUgcmVxdWVzdGVkIGFuZCB0aGUgYWN0dWFsIHB4IGNsb2NrIHRvIGJlIHdpdGhpbgo+ID4g
NTBIei4gQSB0eXBpY2FsIExWRFMgZGlzcGxheSByZXF1aXJlcyB0aGUgcHggY2xvY2sgdG8gYmUg
d2l0aGluICstMTAlLgo+ID4KPiA+IEluIGNhc2UgZm9yIEhETUkgLjUlIHRvbGVyYW5jZSBpcyBy
ZXF1aXJlZC4KPiA+Cj4gPiBGaXhlczogZTAxMzU2ZDE4MjczICgiZHJtL3N0bTogZHNpOiBwcm92
aWRlIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBtb2RlX3ZhbGlkKCkiKQo+ID4gU2lnbmVkLW9mZi1i
eTogU2VhbiBOeWVramFlciA8c2VhbkBnZWFuaXguY29tPgo+ID4gLS0tCj4gQW55IGZlZWRiYWNr
IG9uIHRoaXM/Cj4KPiA+ICBkcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jIHwg
NyArKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2Rz
aS1zdG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMKPiA+IGluZGV4
IGQ1ZjhjOTIzZDdiYy4uOTc5MzZiMGVmNzAyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9k
d19taXBpX2RzaS1zdG0uYwo+ID4gQEAgLTMyMiw4ICszMjIsNiBAQCBkd19taXBpX2RzaV9waHlf
Z2V0X3RpbWluZyh2b2lkICpwcml2X2RhdGEsIHVuc2lnbmVkIGludCBsYW5lX21icHMsCj4gPiAg
ICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPgo+ID4gLSNkZWZpbmUgQ0xLX1RPTEVSQU5DRV9IWiA1
MAo+ID4gLQo+ID4gIHN0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cwo+ID4gIGR3X21pcGlfZHNp
X3N0bV9tb2RlX3ZhbGlkKHZvaWQgKnByaXZfZGF0YSwKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKPiA+IEBAIC0zNzUsOSAr
MzczLDEwIEBAIGR3X21pcGlfZHNpX3N0bV9tb2RlX3ZhbGlkKHZvaWQgKnByaXZfZGF0YSwKPiA+
ICAgICAgICAgICAgICAgLyoKPiA+ICAgICAgICAgICAgICAgICogRmlsdGVyIG1vZGVzIGFjY29y
ZGluZyB0byB0aGUgY2xvY2sgdmFsdWUsIHBhcnRpY3VsYXJseSB1c2VmdWwgZm9yCj4gPiAgICAg
ICAgICAgICAgICAqIGhkbWkgbW9kZXMgdGhhdCByZXF1aXJlIHByZWNpc2UgcGl4ZWwgY2xvY2tz
Lgo+ID4gKyAgICAgICAgICAgICAgKiBDaGVjayB0aGF0IHB4X2Nsb2NrIGlzIHdpdGhpbiAuNSUg
dG9sZXJhbmNlLgo+ID4gICAgICAgICAgICAgICAgKi8KPiA+IC0gICAgICAgICAgICAgaWYgKHB4
X2Nsb2NrX2h6IDwgdGFyZ2V0X3B4X2Nsb2NrX2h6IC0gQ0xLX1RPTEVSQU5DRV9IWiB8fAo+ID4g
LSAgICAgICAgICAgICAgICAgcHhfY2xvY2tfaHogPiB0YXJnZXRfcHhfY2xvY2tfaHogKyBDTEtf
VE9MRVJBTkNFX0haKQo+ID4gKyAgICAgICAgICAgICBpZiAocHhfY2xvY2tfaHogPCBtdWx0X2Zy
YWModGFyZ2V0X3B4X2Nsb2NrX2h6LCA5OTUsIDEwMDApIHx8Cj4gPiArICAgICAgICAgICAgICAg
ICBweF9jbG9ja19oeiA+IG11bHRfZnJhYyh0YXJnZXRfcHhfY2xvY2tfaHosIDEwMDUsIDEwMDAp
KQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBNT0RFX0NMT0NLX1JBTkdFOwo+ID4K
PiA+ICAgICAgICAgICAgICAgLyogc3luYyBwYWNrZXRzIGFyZSBjb2RlcyBhcyBEU0kgc2hvcnQg
cGFja2V0cyAoNCBieXRlcykgKi8KPiA+IC0tCj4gPiAyLjQ0LjAKPiA+Cj4KClJldmlld2VkLWJ5
OiBSb2JlcnQgRm9zcyA8cmZvc3NAa2VybmVsLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
