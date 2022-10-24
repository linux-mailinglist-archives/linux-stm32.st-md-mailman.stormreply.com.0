Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EAB60AD95
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Oct 2022 16:27:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83C95C03FC6;
	Mon, 24 Oct 2022 14:27:59 +0000 (UTC)
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 183E7C035A5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Oct 2022 14:27:58 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 382C32B066F1;
 Mon, 24 Oct 2022 10:27:54 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Mon, 24 Oct 2022 10:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1666621673; x=
 1666628873; bh=j5Xmm1hIOnDXfjVvOH1nBH2jD1dezyQFcZOvqExQy/Q=; b=R
 FOCrFIiTxT4VVyc9mEDQdkEn+wGl6bgl85vYTnOHs9SmkuBXihbN449jNzacB8jI
 rTTZjSbMHEkOE6lva8OK7H+tWMs7X8EpOfrjmtb6/oVOGDu9QbZ0yoFBmwCcqV/f
 OY2S9hiS5k+xnEniFrSzWv69cVnlbB0lhSbJ9CqHWVp9ya8AIfEqbYesbuFRq9Qd
 PSVVASHWixWTm4BTrueGRqrr2qoyHEcyvUm2O9mtgTacw1X/e4TGUOI7spwRF4k8
 NrLH6dKrsa3XnjqeccrXYuGDRxoUwvp7+h9Ls1LReoWuxJMTQSMuUwY2jFO3D+Jm
 dHiTM/iSZCKnRNoHbTlJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666621673; x=
 1666628873; bh=j5Xmm1hIOnDXfjVvOH1nBH2jD1dezyQFcZOvqExQy/Q=; b=j
 bQ9YG0M5QUfhAMC5KcxlBfNv3OPZ3dcPqvAHDAkHJFJBtkG/oKiHEgB/CGkfd5D4
 4WXIXCvh3vM6V7jLlWzrMUTV4Fpaa7SNUDAMOjP9/s26EtfpqJpXHuJvjncEf/Hb
 l2A1rrOSEilHAzFog8P4c885b26rzqZmcbf/q5PoNykrPcDsbeuOwk+rlSf/XLVe
 pO9o+yifsE2IWF0Wd9xtiS41jAXVVz31C3ZyF1314cL/e+AOiNL9MtukAPZEZ2j8
 gZbNNP84mt+QmazljsROIuA11JsXMnAQOzsIvfqse5ElLjsQWYAznhJvSftlDiy8
 UDnTIRgLvHwK0iMEY12aQ==
X-ME-Sender: <xms:6KBWY_gwmdA9MhV8F7kI-IAT6RjoV8UyoY8vJd_im8nzMhPr-w5SEg>
 <xme:6KBWY8DFzu_H1NXJNLoNcdftX0Fccg83xmP1gZ_Oo0PjdmKShBDqthVvsAPur-jjx
 nKKucVvJWn2dHOfBYM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpefgkeeuleegieeghfduudeltdekfeffjeeuleehleefudettddtgfevueef
 feeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:6KBWY_EKFaUSxfmbFq4u45xHq3kzkmlHX7APZxOrmpX4NKAPPIVhLw>
 <xmx:6KBWY8Sa2YoRcKoTYZV4cAVrgo3XWvtPHJE_rauldYzUHnGUJcpV8g>
 <xmx:6KBWY8zBpoCDaeX7eS6StOnrb6kSgFjb8QNDCQkjBv4w_fjHvPPK9g>
 <xmx:6aBWY7iVKZZZeLJhXB65ARrCr06Q6ReuiHPabu10swOp_0SKXFR2BwSFrZk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F38B1B60086; Mon, 24 Oct 2022 10:27:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <8d6ddb0d-98be-4c4d-9523-f024c339c8d0@app.fastmail.com>
In-Reply-To: <2204103.iZASKD2KPV@diego>
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-1-arnd@kernel.org> <2204103.iZASKD2KPV@diego>
Date: Mon, 24 Oct 2022 16:27:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-arm-kernel@lists.infradead.org,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-doc@vger.kernel.org,
 Guillaume GOURAT <guillaume.gourat@nexvision.tv>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Christer Weinigel <christer@weinigel.se>,
 linux-stm32@st-md-mailman.stormreply.com,
 Arnaud Patard <arnaud.patard@rtp-net.org>, linux-samsung-soc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-clk@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org,
 soc@kernel.org, openmoko-kernel@lists.openmoko.org,
 Ben Dooks <ben-linux@fluff.org>, Simtec Linux Team <linux@simtec.co.uk>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>
Subject: Re: [Linux-stm32] [PATCH 01/21] ARM: s3c: remove all s3c24xx support
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

T24gU2F0LCBPY3QgMjIsIDIwMjIsIGF0IDIyOjU2LCBIZWlrbyBTdMO8Ym5lciB3cm90ZToKPiBB
bSBGcmVpdGFnLCAyMS4gT2t0b2JlciAyMDIyLCAyMjoyNzozNCBDRVNUIHNjaHJpZWIgQXJuZCBC
ZXJnbWFubjoKPj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4gCj4+IFRo
ZSBwbGF0Zm9ybSB3YXMgZGVwcmVjYXRlZCBpbiBjb21taXQgNmE1ZTY5YzdkZGVhICgiQVJNOiBz
M2M6IG1hcmsKPj4gYXMgZGVwcmVjYXRlZCBhbmQgc2NoZWR1bGUgcmVtb3ZhbCIpIGFuZCBjYW4g
YmUgcmVtb3ZlZC4gVGhpcyBpbmNsdWRlcwo+PiBhbGwgZmlsZXMgdGhhdCBhcmUgZXhjbHVzaXZl
bHkgZm9yIHMzYzI0eHggYW5kIG5vdCBzaGFyZWQgd2l0aCBzM2M2NHh4LAo+PiBhcyB3ZWxsIGFz
IHRoZSBnbHVlIGxvZ2ljIGluIEtjb25maWcgYW5kIHRoZSBtYWludGFpbmVyIGZpbGUgZW50cmll
cy4KPj4gCj4+IENjOiBBcm5hdWQgUGF0YXJkIDxhcm5hdWQucGF0YXJkQHJ0cC1uZXQub3JnPgo+
PiBDYzogQmVuIERvb2tzIDxiZW4tbGludXhAZmx1ZmYub3JnPgo+PiBDYzogQ2hyaXN0ZXIgV2Vp
bmlnZWwgPGNocmlzdGVyQHdlaW5pZ2VsLnNlPgo+PiBDYzogR3VpbGxhdW1lIEdPVVJBVCA8Z3Vp
bGxhdW1lLmdvdXJhdEBuZXh2aXNpb24udHY+Cj4+IENjOiBIZWlrbyBTdHVlYm5lciA8aGVpa29A
c250ZWNoLmRlPgo+PiBDYzogU2ltdGVjIExpbnV4IFRlYW0gPGxpbnV4QHNpbXRlYy5jby51az4K
Pj4gQ2M6IG9wZW5tb2tvLWtlcm5lbEBsaXN0cy5vcGVubW9rby5vcmcKPj4gU2lnbmVkLW9mZi1i
eTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPgo+IFNvIG1hbnkgbWVtb3JpZXMgb2Yg
bWUgc3RhcnRpbmcgb3V0IGluIHRoZSBrZXJuZWwgb24gczNjMjR4eC4KPiBCdXQgaXQncyBubyB1
c2UgdHJ5aW5nIHRvIGtlZXAgc3R1ZmYgYXJvdW5kIHRoYXQgbm9ib2R5IHdpbGwgbGlrZWx5Cj4g
ZXZlciB1c2UgYWdhaW4uIFNvIHdpdGggYSBzYWQgZmFjZQo+Cj4gQWNrZWQtYnk6IEhlaWtvIFN0
dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4KPgo+IHRob3VnaCB5b3UgbWlnaHQgd2FudCB0byBh
bHNvIGluY2x1ZGUKPiAJZHJpdmVycy9kbWEvczNjMjR4eC1kbWEuYwoKVGhpcyB3YXMgaW4gYSBz
ZXBhcmF0ZSBwYXRjaCB0aGF0IHJlbW92ZXMgdGhlIGRyaXZlcjoKCmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMjEwMjEyMDMzMjkuNDE0MzM5Ny0xNC1hcm5kQGtl
cm5lbC5vcmcvCgpJbiB0aGUgZmlyc3QgcGF0Y2gsIEkgb25seSBpbmNsdWRlIHJlZmVyZW5jZXMg
dG8gcmVtb3ZlZApLY29uZmlnIHN5bWJvbHMgdGhhdCB3b3VsZCBub3QgbWFrZSBzZW5zZSB0byBz
cGxpdCBvdXQgaW50bwpzZXBhcmF0ZSBwYXRjaGVzLgoKICAgIEFybmQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
