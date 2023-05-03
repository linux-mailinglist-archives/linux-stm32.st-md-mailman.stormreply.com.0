Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 745636F56D1
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 13:02:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22D37C6A60C;
	Wed,  3 May 2023 11:02:37 +0000 (UTC)
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A931C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 11:02:36 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 6C7392B0671E;
 Wed,  3 May 2023 07:02:32 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Wed, 03 May 2023 07:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1683111752; x=1683118952; bh=MMamfdw2Idw7oZk+/E3mvL+dBo0TUHD8cWv
 2z+u/0pc=; b=WBctjyvS2xYVsNx/PXLCezyBfk6d0fNGJLAbjyR93iv+JntYfRw
 1FknZqmA6tsFPUoOxwPIzC92Rp5Y6yMCdnzeprisuAEmk/2FwjwhujnyjmXpkimB
 SppIL5oaBfr59F6AzPecb7p3PngCPKwbucj2v1SwZaiAn0b8V6yRvxWIATOoB1yT
 kTJFFdKrKoLxDca9M6vO2wD00yP0v9E+Y6cH9ws5eKi/SUd2UHkyPleSrFe3oyLX
 8GenDC9VkDzpl0DM3D3MJqCCidmbvb4oXCVvEsbwuVU7zsrm1wOjex4kRkPwyRT1
 Y3o5kMbVVaclWgwF5PhZKyT7r7Y+YHslZ1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683111752; x=1683118952; bh=MMamfdw2Idw7oZk+/E3mvL+dBo0TUHD8cWv
 2z+u/0pc=; b=AH+K36zaN4zYugn+q+n765d7RqYhBnYAkyeBKpd/jUwnO4cc17N
 sOtk4fgnjqgBRejjoUPfmgWTaKFP4N6l86PC9yWkTl7qSHDYKt8zUNrMJm7hgsac
 MAKOY5kQ55a0V+cd6KgpG+xKpJy4SWbnKyPbmZiW4Z0r+3tL/pAww5DKoBXtHvDI
 i273D40wtniWtgLX4sC5ApVUdClgCvIzPssLKxyAw/v9JuPv2gH8vOUO3lADSDBb
 NaXuK10560hVSSAb2s815TRFlAaY6HIsVEB4nLwDJq5pD3D+mqkoaNJij4p9s68c
 FZWuHfNk6rEKY5SsKc3Dqj2x0oLyHX/paVw==
X-ME-Sender: <xms:Rj9SZKlTTnbDiHX55Z0zVK4RRHqTtD34Ic0kr9gu8LXRZUd5vW1sNQ>
 <xme:Rj9SZB2RRbTSlfnvoyCiq-CjuDURcGdNgs5GoDJl4qCHFJ5-ZHoIvp9bWKCYjpXN-
 ODT0WgrXyw40LeC0sc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvkedgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
 gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Rj9SZIovGybcnhaYiLbWAMPNr2wtxMzL-NEtbKfgejz2jVx79Q3BOw>
 <xmx:Rj9SZOmlZGrdb2-rGVi2XdPxahue8H13hkdPES4NDGwCeY-jXgd-ew>
 <xmx:Rj9SZI2--fY13skOLwZ1x9wt_VRgsao0yXJv8XyToKLEhPijWfOSBw>
 <xmx:SD9SZMJstDJSwk6E9VhGeSPmli8W6KuMDF8H4lCfg1AWmdfP8FfC5WnUfw0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B77FBB6008D; Wed,  3 May 2023 07:02:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <99b49e6b-e963-415a-a2c9-72505087833c@app.fastmail.com>
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
Date: Wed, 03 May 2023 13:02:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh+dt@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

T24gVHVlLCBNYXkgMiwgMjAyMywgYXQgMjE6NDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFR1
ZSwgTWF5IDIsIDIwMjMgYXQgMzoxNeKAr0FNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
IHdyb3RlOgoKPiB2ZW5kb3JfbWFwID0gewo+ICAgICAnYWxwaGFzY2FsZScgOiAnYWxwaGFzY2Fs
ZScsCj4gICAgICdhbHBpbmUnIDogJ2FscGluZScsCgpJIHdvdWxkIG1ha2UgdGhpcyBvbmUgJ2Ft
YXpvbicgaWYgd2UgZ28gd2l0aCBjdXJyZW50IG1hbnVmYWN0dXJlcnMuCgo+ICAgICAnbnNwaXJl
JyA6ICduc3BpcmUnLAoKbnNwaXJlIGlzIHRoZSBuYW1lIG9mIHRoZSBlbmQtdXNlciBwcm9kdWN0
LCBzbyB0aGF0IGRvZXNuJ3QgcXVpdGUKZml0LiBUaGUgU29DIHdhcyBhcHBhcmVudGx5IGFuIExT
SSBsb2dpYyBaZXZpbywgd2hpY2ggaXMgbm93IG93bmVkCmJ5IEJyb2FkY29tLgoKPiAgICAgJ212
ZWJ1JyA6ICdtYXJ2ZWxsJywKPiAgICAgJ21tcCcgOiAnbWFydmVsbCcsCj4gICAgICdiZXJsaW4n
IDogJ2JlcmxpbicsCgpXaGlsZSBiZXJsaW4gaXMgcmVsYXRlZCB0byBweGEvbW1wLCB0aGlzIG9u
ZSBpcyBub3cgb3duZWQKYnkgU3luYXB0aWNzLCBhbmQgdGhlIDY0LWJpdCB2ZXJzaW9ucyBhcmUg
YWxyZWFkeSBpbiB0aGUKc3luYXB0aWNzIHN1YmRpciwgc28gSSdkIGdvIHdpdGggdGVoIHNhbWUg
aGVyZS4KCj4gICAgICdvcGVuYm1jJyA6ICdhc3BlZWQnLAo+ICAgICAnZW43JyA6ICdhaXJvaGEn
LAoKYWlyb2hhIGlzIGEgc2VwYXJhdGUgY29tcGFueSBub3csIGJ1dCB0aGUgaGFyZHdhcmUgaXMg
c3RpbGwKc2hhcmVkIHdpdGggbWVkaWF0ZWssIHNvIHdlIGNvdWxkIGNvbnNpZGVyIGx1bXBpbmcg
aXQgaW50bwp0aGF0IHN1YmRpciwgYnV0IGEgc2VwYXJhdGUgb25lIG1heSBiZSBiZXR0ZXIgbG9u
Zy10ZXJtLgoKPiAgICAgJ2dlbWluaScgOiAnZ2VtaW5pJywKClRoaXMgb25lIGlzIGFsc28gYSBw
cm9kdWN0IG5hbWUsIG5vdCBhIGNvbXBhbnkuIEFwcGFyZW50bHksCmdlbWluaSB3YXMgb3JpZ2lu
YWxseSBtYWRlIGJ5IFN0b3JtIFNlbWljb25kdWN0b3IsIGFuZCB0aGVuCmJ5IENvcnRpbmEsIHdo
aWNoIHdhcyBzdWJzZXF1ZW50bHkgYWNxdWlyZWQgYnkgSW5waGksIGFuZCB0aGF0IGVuZGVkCnVw
IGluIE1hcnZlbGwgYWZ0ZXIgdGhlIHByb2R1Y3Qgd2FzIGFscmVhZHkgZGlzY29udGludWVkLgoK
T3V0IG9mIHRoZSBmb3VyLCBJJ2QgcHJvYmFibHkgZ28gd2l0aCAnY29ydGluYScgYXMgdGhlCmRp
cmVjdG9yeSBuYW1lLgoKPiAgICAgJ21lc29uJyA6ICdtZXNvbicsCgotPiBhbWxvZ2ljCgo+ICAg
ICAnbW94YScgOiAnbW94YScsCj4gICAgICdtc3RhcicgOiAnbXN0YXInLAoKLT4gc2lnbWFzdGFy
Cgo+ICAgICAnbnV2bycgOiAnbnV2b3RvbicsCj4gICAgICdscGMnIDogJ2xwYycsCgotPiBueHAK
Cj4gICAgICdsYW45NicgOiAnbWljcm9jaGlwJywKPiAgICAgJ293bCcgOiAnYWN0aW9ucycsCj4g
ICAgICdveDgnIDogJ294c2VtaScsCj4gICAgICdyZGEnIDogJ3JkYScsCgotPiB1bmlzb2MKCj4g
ICAgICdydGQnIDogJ3JlYWx0ZWsnLAo+ICAgICAncjcnIDogJ3JlbmVzYXMnLAo+ICAgICAncjgn
IDogJ3JlbmVzYXMnLAo+ICAgICAncjknIDogJ3JlbmVzYXMnLAo+ICAgICAnZW1ldjInIDogJ3Jl
bmVzYXMnLAo+ICAgICAnc2g3M2EnIDogJ3JlbmVzYXMnLAo+ICAgICAnZ3ItJyA6ICdyZW5lc2Fz
JywKPiAgICAgJ2l3ZycgOiAncmVuZXNhcycsCj4gICAgICdyaycgOiAncm9ja2NoaXAnLAo+ICAg
ICAncnYxMScgOiAncm9ja2NoaXAnLAo+ICAgICAncm9ja2NoaXAnIDogJ3JvY2tjaGlwJywKPiAg
ICAgJ3NvY2ZwZ2EnIDogJ3NvY2ZwZ2EnLAoKLT4gaW50ZWwKCj4gICAgICdzdG0nIDogJ3N0bTMy
JywKPiAgICAgJ3N0aScgOiAnc3RpJywKPiAgICAgJ3N0LXBpbicgOiAnc3RpJywKPiAgICAgJ3N0
ZScgOiAnc3QtZXJpY3Nzb24nLAo+ICAgICAnc3BlYXInIDogJ3NwZWFyJywKCkkgd291bGQgcHV0
IGFsbCBmaXZlIG9mIHRoZXNlIGludG8gJ3N0Jy4gVGhlIHV4NTAwIHdhcyBkZXZlbG9wZWQKaW4g
c3QtZXJpY3Nzb24sIGJ1dCBsYXN0IHNvbGQgYnkgc3QsIGFuZCB0aGUgb3RoZXIgb25lcyBhcmUg
YWxsCm9yaWdpbmFsIHN0IHByb2R1Y3RzLgoKICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
