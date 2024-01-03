Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD5C823167
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 17:42:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 061C4C6B476;
	Wed,  3 Jan 2024 16:42:32 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01376C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jan 2024 16:42:30 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-5e6c8b70766so90004467b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jan 2024 08:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704300150; x=1704904950;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kqB6CGz4FhyOFOssBdp4zvBdwCCulsiEvCo2tFN0c8g=;
 b=kmjU/9misPx7lOYftm2oWV2HS13lHzU8roJSj8SbI220qm2T4PN+dQm07kdZ9gKObR
 XUV/z88tCf5ZCFAyFsY3bhDe7UOAj5fBaiDNwMqqX85e3Lcn6v09FIUw71FoCY9TOnqL
 5JAMYTiCAarI6J53C67tP4ufANhY/Tlk/j9xwPlbKJJNbpyFkFVbTjfpLwG1fN/7NaqM
 rx3/Caa/yA1iEQ6gsgUx8q0FCH6GksJqf6BQpI31d2SAR97Yt1gb3rKDK12mepZasPWA
 Si5O5DbGiVlIDo0Md3SKfVUt3FrdrLnohMdh96T0MPW8Lhvpcx2VfTinsgCm3qR8E/qW
 +uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704300150; x=1704904950;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kqB6CGz4FhyOFOssBdp4zvBdwCCulsiEvCo2tFN0c8g=;
 b=IcMRbOb9Oq+u/iKhdrhu4IRFs0IW4QGRIKHDR8note+yp5dMeRCY4Vp5Ll1BiBE5SQ
 xljcDLZsvXbtG1wizoqtsJAcmN+MMFPKO/kgC+bbUUV6JByqgeAr0FL2kNbuvB1NHRj4
 FILod1nE07B34bLK4882rlyCt2roENv4Bta210TDpiNMLv+aKB1F+Rqq5n8m0pvBa+jD
 DFCskeocEUWqyx8GTXhnKSiHr9l+S/s7+K93WR/oeaEdYBj7bNdHZ21PPZX2cSRYhqzV
 3UZF73iIIknmpaMIUNoCgsiN5UIrPJ+3xAav/yyaGbPMjvTnlJNICwEdnZ/HNHeXhjDZ
 phNQ==
X-Gm-Message-State: AOJu0YyASGwFg4Twce8NW9Axr2//xWAkjOFQiAMK3mHNZL923b3llFDR
 SQLRQwoPI+iTWVlQkr895l/EMvi/RoyFjVlyTQb4YdhmA6qpOg==
X-Google-Smtp-Source: AGHT+IHG+3CJMzix7RqUcr1RTs3drNiVmJl0PBwHoasrhFF9x4L1y3cMk/tajLBq5aD9vYZ+fjVlbqGseYGu5CnZocY=
X-Received: by 2002:a05:690c:2848:b0:5ec:91e:9d68 with SMTP id
 ed8-20020a05690c284800b005ec091e9d68mr7280168ywb.18.1704300149634; Wed, 03
 Jan 2024 08:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20240102162718.268271-1-romain.gantois@bootlin.com>
 <20240102162718.268271-2-romain.gantois@bootlin.com>
 <CACRpkdZjOBpD6HoobgMBA27dS+uz5pqb8otL+fGtMvsywYBTPA@mail.gmail.com>
 <d3d73e26-10a9-bd2b-ff44-cbdc72e1f6ee@bootlin.com>
In-Reply-To: <d3d73e26-10a9-bd2b-ff44-cbdc72e1f6ee@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Jan 2024 17:42:18 +0100
Message-ID: <CACRpkdbbPg0f0LSPrAhZ4cEajEx0W-FjkSjfZnJ_Lam-QQ=E2Q@mail.gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Richard Tresidder <rtresidd@electromag.com.au>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: Prevent DSA tags
 from breaking COE on stmmac
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

T24gV2VkLCBKYW4gMywgMjAyNCBhdCAxMDoxMeKAr0FNIFJvbWFpbiBHYW50b2lzCjxyb21haW4u
Z2FudG9pc0Bib290bGluLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCAyIEphbiAyMDI0LCBMaW51cyBX
YWxsZWlqIHdyb3RlOgo+IC4uLgo+ID4gPiArc3RhdGljIGlubGluZSBib29sIHN0bW1hY19oYXNf
aXBfZXRoZXJ0eXBlKHN0cnVjdCBza19idWZmICpza2IpCj4gPiA+ICt7Cj4gPiA+ICsgICAgICAg
X19iZTE2IHByb3RvID0gZXRoX2hlYWRlcl9wYXJzZV9wcm90b2NvbChza2IpOwo+ID4KPiA+IEkg
bWFkZSBhIG5ldyBmdW5jdGlvbiBmb3IgdGhpcyBpbiBteSBwYXRjaAo+ID4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjMxMjIyLW5ldy1nZW1pbmktZXRoZXJuZXQtcmVncmVzc2lv
bi12NC0yLWEzNmU3MWIwZjMyYkBsaW5hcm8ub3JnLwo+ID4KPiA+IEkgd2FzIGNhcmVmdWwgdG8g
YWRkIGlmICghcHNrYl9tYXlfcHVsbChza2IsIEVUSF9ITEVOKSkgYmVjYXVzZSBFcmljCj4gPiB3
YXMgdmVyeSBzcGVjaWZpYyBhYm91dCB0aGlzLCBJIHN1cHBvc2UgeW91IGNvdWxkIGdldCBmcmFn
bWVudCBmcmFtZXMgdGhhdAo+ID4gYXJlIHNtYWxsZXIgdGhhbiBhbiBldGhlcm5ldCBoZWFkZXIu
Cj4KPiBPa2F5IG5pY2UsIHRoZW4gSSdsbCByZXdyaXRlIHRoaXMgc2VyaWVzIHRvIHVzZSB0aGUg
bmV3IGZ1bmN0aW9uIG9uY2UgeW91cgo+IGNoYW5nZXMgbWFrZSBpdCBpbi4KCkkganVzdCByZXdy
b3RlIG15IHBhdGNoIHRvIHVzZSBldGhfaGVhZGVyX3BhcnNlX3Byb3RvY29sKCkgaW5zdGVhZC4K
SSBzaG91bGQgbm90IGludmVudCBhIG5ldyB2ZXJzaW9uIG9mIHNvbWV0aGluZyB0aGF0IGFscmVh
ZHkgZXhpc3QuCgo+ID4gU2hvdWxkIHdlIGFkZCBhbiBpZiAoIXBza2JfbWF5X3B1bGwoc2tiLCBF
VEhfSExFTikpIHRvCj4gPiBldGhfaGVhZGVyX3BhcnNlX3Byb3RvY29sKCk/Cj4KPiBUaGF0IGRv
ZXMgc291bmQgbG9naWNhbCB0byBtZSBidXQgSSBjb3VsZG4ndCB0ZWxsIHlvdSB3aGF0IHRoZSBp
bXBhY3Qgb24gY3VycmVudAo+IGNhbGxlcnMgd291bGQgYmUuIFRoZSBuZXQgbWFpbnRhaW5lcnMg
d2lsbCBwcm9iYWJseSBoYXZlIGEgYmV0dGVyIGlkZWEgb2YgdGhpcy4KCkkgY2FuIHByb3Bvc2Ug
YSBzZXBhcmF0ZSBwYXRjaCBmb3IgdGhpcyB3aXRoIFJGQy4KCllvdXJzLApMaW51cyBXYWxsZWlq
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
