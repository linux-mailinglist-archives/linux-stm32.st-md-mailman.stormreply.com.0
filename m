Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C28A966E3
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2019 18:57:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29A9DC35E01;
	Tue, 20 Aug 2019 16:57:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05407C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 16:57:19 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8800922CE3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566320238;
 bh=XXjiYxQkert7CQKwnQYwS/DJ9k/U3UTDnEKYjjCX/3Q=;
 h=References:In-Reply-To:From:Date:Subject:To:From;
 b=2jX2Ag8APIFwCLyU4kAtKBfXXb5lV2endNabWcuWxLvWLoywws5J1NWZ3jhvOolz1
 21Gyotmv1EcMF9cr0YZwBagfs2iDSHfxsTScMZfVVdQ13/8sSyk2/8nrJPCz54HUIF
 Ggt4fV6axtAZrFH7DH3IG0RL35pbuGbZLHiApFbY=
Received: by mail-qt1-f174.google.com with SMTP id x4so6832981qts.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 09:57:18 -0700 (PDT)
X-Gm-Message-State: APjAAAVpQ8rXxWkykIYkzH679mo/2V4b03riyerVCJ0ZcP5ZkFToBqBx
 oa9K2jPfZUKXznI643883THlizhia3sAXqgUHQ==
X-Google-Smtp-Source: APXvYqyXzp+QqhlPh4ms6hvrPcB1uD6IRBalVujsZrtIEmK/kh6+PbQH7E0GTYlHODGJjOvZfk0fqz3SyXtNfugq1Q4=
X-Received: by 2002:ac8:386f:: with SMTP id r44mr27730593qtb.300.1566320237772; 
 Tue, 20 Aug 2019 09:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190820145343.29108-1-megous@megous.com>
 <20190820145343.29108-3-megous@megous.com>
 <CAL_JsqLHeA6A_+ZgmCzC42Y6yJrEq6+D3vKn8ETh2D7LJ+1_-g@mail.gmail.com>
 <20190820163433.sr4lvjxmmhjtbtcb@core.my.home>
In-Reply-To: <20190820163433.sr4lvjxmmhjtbtcb@core.my.home>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 20 Aug 2019 11:57:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJHNL91KMAP5ya97eiyTypGniCJ+tbP=NchPJK502i5FQ@mail.gmail.com>
Message-ID: <CAL_JsqJHNL91KMAP5ya97eiyTypGniCJ+tbP=NchPJK502i5FQ@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: net: sun8i-a83t-emac:
	Add phy-io-supply property
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

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTE6MzQgQU0gT25kxZllaiBKaXJtYW4gPG1lZ291c0Bt
ZWdvdXMuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDIwLCAyMDE5IGF0IDExOjIwOjIyQU0g
LTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gT24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgOTo1
MyBBTSA8bWVnb3VzQG1lZ291cy5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBGcm9tOiBPbmRyZWog
SmlybWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KPiA+ID4KPiA+ID4gU29tZSBQSFlzIHJlcXVpcmUg
c2VwYXJhdGUgcG93ZXIgc3VwcGx5IGZvciBJL08gcGlucyBpbiBzb21lIG1vZGVzCj4gPiA+IG9m
IG9wZXJhdGlvbi4gQWRkIHBoeS1pby1zdXBwbHkgcHJvcGVydHksIHRvIGFsbG93IGVuYWJsaW5n
IHRoaXMKPiA+ID4gcG93ZXIgc3VwcGx5Lgo+ID4KPiA+IFBlcmhhcHMgc2luY2UgdGhpcyBpcyBu
ZXcsIHN1Y2ggcGh5cyBzaG91bGQgaGF2ZSAqLXN1cHBseSBpbiB0aGVpciBub2Rlcy4KPgo+IFll
cywgSSBqdXN0IGRvbid0IHVuZGVyc3RhbmQsIHNpbmNlIGV4dGVybmFsIGV0aGVybmV0IHBoeXMg
YXJlIHNvIGNvbW1vbiwKPiBhbmQgdGhleSByZXF1aXJlIHBvd2VyLCBob3cgdGhlcmUncyBubyBm
YWlybHkgZ2VuZXJpYyBtZWNoYW5pc20gZm9yIHRoaXMKPiBhbHJlYWR5IGluIHRoZSBQSFkgc3Vi
c3lzdGVtLCBvciBzb21ld2hlcmU/CgpCZWNhdXNlIGdlbmVyaWMgbWVjaGFuaXNtcyBmb3IgdGhp
cyBkb24ndCB3b3JrLiBGb3IgZXhhbXBsZSwgd2hhdApoYXBwZW5zIHdoZW4gdGhlIDIgc3VwcGxp
ZXMgbmVlZCB0byBiZSB0dXJuZWQgb24gaW4gYSBjZXJ0YWluIG9yZGVyCmFuZCB3aXRoIGNlcnRh
aW4gdGltaW5ncz8gQW5kIHRoZW4gYWRkIGluIHJlc2V0IG9yIGNvbnRyb2wgbGluZXMgaW50bwp0
aGUgbWl4Li4uIFlvdSBjYW4gc2VlIGluIHRoZSBiaW5kaW5ncyB3ZSBhbHJlYWR5IGhhdmUgc29t
ZSBvZiB0aGF0LgoKPiBJdCBsb29rcyBsaWtlIG90aGVyIGV0aGVybmV0IG1hYyBkcml2ZXJzIGFs
c28gaW1wbGVtZW50IHN1cHBsaWVzIG9uIHBoeXMKPiBvbiB0aGUgRU1BQyBub2Rlcy4gSnVzdCBn
cmVwIHBoeS1zdXBwbHkgdGhyb3VnaCBkdC1iaW5kaW5ncy9uZXQuCj4KPiBIaXN0b3JpY2FsIHJl
YXNvbnMsIG9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/IEl0IGFsbW9zdCBzZWVtcyBsaWtlIEkg
bXVzdAo+IGJlIG1pc3Npbmcgc29tZXRoaW5nLCBzaW5jZSBwdXR0aW5nIHRoZXNlIHByb3BlcnRp
ZXMgdG8gcGh5IG5vZGVzCj4gc2VlbXMgc28gb2J2aW91cy4KClRoaW5ncyBnZXQgYWRkZWQgb25l
IGJ5IG9uZSBhbmQgb25lIG5ldyBwcm9wZXJ0eSBpc24ndCB0aGF0CmNvbnRyb3ZlcnNpYWwuIFdl
J3ZlIGdlbmVyYWxseSBsZWFybmVkIHRoZSBsZXNzb24gYW5kIGF2b2lkIHRoaXMKcGF0dGVybiBu
b3csIGJ1dCBldGhlcm5ldCBwaHlzIGFyZSBvbmUgb2YgdGhlIG9sZGVyIGJpbmRpbmdzLgoKUm9i
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
