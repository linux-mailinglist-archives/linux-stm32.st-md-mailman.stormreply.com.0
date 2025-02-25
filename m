Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B18DA445EE
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 17:25:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 189D9C78F9C;
	Tue, 25 Feb 2025 16:25:30 +0000 (UTC)
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5082C78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 16:25:28 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id 6204311400FF;
 Tue, 25 Feb 2025 11:25:27 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-11.internal (MEProxy); Tue, 25 Feb 2025 11:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1740500727;
 x=1740587127; bh=NgNWJz4/ej91tUlb/G6+Viw2nzrffwayT6pC5YFAhO8=; b=
 Ts+5z7ME5Q8OC30nbJVhSMKsOdYysD4nm6jTVI4jooMa2+sO/0wBLKqZZ5V5bbdG
 LxgOcxD/iZCSCmj6NPcMvNaToFkyCe7hPLhDw685n4CzTBChKu9j8QYfS1Opp1ZR
 y/kS2NdLPJEFoODJI4bAMhfoeAp3BcvqlgX2wmILD5LO+WW6fa5Rt0wCsPrR2Fkt
 mPtzfb5E4OApxqwkMp8ZlYej3DAxTnDNIzt9uPlhSOzgTxKmw+a5BRcDhcUo+bv9
 ffySlOeAQLneC0mPDWxBJg7ioHDmWCtUx1qEZpwfuArf3+SoLHqWVGH1bwFDV3zu
 yBPKhWjqFBIrh08VnspmoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740500727; x=
 1740587127; bh=NgNWJz4/ej91tUlb/G6+Viw2nzrffwayT6pC5YFAhO8=; b=7
 IMscJv+4prsSX8+62EfnIXjp33+Cap/59Fm7j9L6MPjVCg1h9+D2tV5f+mnsi+Iw
 yrkpybyHb8IL70gX5I5c5bL9xRAduilaZUnyBBYKH4LmrXxFosBzgqCr8eyTqTsq
 MQCYnjBQ5TZ9V1LN3vgGD1do4Pxji+vMWREjvNlr8TYVX6YwrDowUT1zQFOipd3H
 hbXSjuEg0vfrndit2+/op2bgFYQ/1vQh6/rOx9KB7SsUi2a7sGsgx41VmqMRZ7aD
 BbgAwlMKUr/JxtBQRJFxlJZvLmrzYct2trhc4zyUeUcQKYtwUBDhrjcLixQlQ6Xz
 RrKUOPLyhMPcOoaIbFH9g==
X-ME-Sender: <xms:9e69Z07XuZLCb2mg1ZRkabdFDyqSIvS9qkpiGvKb-qNtTP-YVf06Pg>
 <xme:9e69Z17cbtisUffNy5O8_ocMYcYeIGrPXdt-Jl3BL51QGh8OjQVoCzS4WSRnXdsoc
 Dv5akB7NOyD5O3KBQ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
 jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
 druggvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddv
 geejvdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
 vddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnh
 highessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthho
 rhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepughmihhtrhihrdhtohhroh
 hkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhm
 fedvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrgh
 dprhgtphhtthhopeholhhivhgvrhdrghhrrghuthgvsehkohgtohgtohhnnhgvtghtohhr
 rdgtohhmpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkiheslhhinh
 grrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhs
 thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqshhtmhefvd
 esshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhm
X-ME-Proxy: <xmx:9e69ZzegOGN6bUlJD2UGbVzh35QPUiFSoFF3xeY7tCxHjW-lGUaYEg>
 <xmx:9e69Z5INpchUfssxhI6lz-Fnuj6gjsNMslOX57YqjYGZ_w8yg9x_KQ>
 <xmx:9e69Z4K3UxN9cBGMVc8Aq2knw8HXcPrwkI6mnDOYjnS0aPPpW82qOg>
 <xmx:9e69Z6yKQtoTIfgtx_8LGs0EDnXR_l7EzCykHIjUAyOttInnOdpBWA>
 <xmx:9-69Z2yggIQFeBrIjCRTyRbAFT6agWMy-ansv0zzLMebHgySR2eqe0QQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id B96FD2220072; Tue, 25 Feb 2025 11:25:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 17:25:05 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Message-Id: <a6d10d80-79d3-426f-9dc8-0ddab77e89d9@app.fastmail.com>
In-Reply-To: <6xoycaft6wnd4sm74f2o4koc7lvyl2mtxp2kc6lc4dzpjvby53@ejm5ssbfzbph>
References: <20250225145332.1116557-1-arnd@kernel.org>
 <6xoycaft6wnd4sm74f2o4koc7lvyl2mtxp2kc6lc4dzpjvby53@ejm5ssbfzbph>
Cc: Yu Jiaoliang <yujiaoliang@vivo.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] [v2] Input: stmpe-ts - mark OF related
	data as maybe unused
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

T24gVHVlLCBGZWIgMjUsIDIwMjUsIGF0IDE2OjQ3LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToK
PiBPbiBUdWUsIEZlYiAyNSwgMjAyNSBhdCAwMzo1MzoyNlBNICswMTAwLCBBcm5kIEJlcmdtYW5u
IHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9zdG1wZS10
cy5jIGIvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi8KPgo+IFdpdGggCj4KPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9tb2R1bGUuaCBiL2luY2x1ZGUvbGludXgvbW9kdWxlLmgKPiBpbmRl
eCAzMGU1YjE5YmFmYTkuLjAxNGYwMzNlZjFiYSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4
L21vZHVsZS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9tb2R1bGUuaAo+IEBAIC0yNTAsNyArMjUw
LDggQEAgZXh0ZXJuIHZvaWQgY2xlYW51cF9tb2R1bGUodm9pZCk7Cj4gIGV4dGVybiB0eXBlb2Yo
bmFtZSkgX19tb2RfZGV2aWNlX3RhYmxlX18jI3R5cGUjI19fIyNuYW1lCQlcCj4gICAgX19hdHRy
aWJ1dGVfXyAoKHVudXNlZCwgYWxpYXMoX19zdHJpbmdpZnkobmFtZSkpKSkKPiAgI2Vsc2UgIC8q
ICFNT0RVTEUgKi8KPiAtI2RlZmluZSBNT0RVTEVfREVWSUNFX1RBQkxFKHR5cGUsIG5hbWUpCj4g
KyNkZWZpbmUgTU9EVUxFX0RFVklDRV9UQUJMRSh0eXBlLCBuYW1lKQkJCQkJXAo+ICtzdGF0aWMg
Y29uc3QgdHlwZW9mKG5hbWUpICpfX21vZF9kZXZpY2VfdGFibGVfXyMjdHlwZSMjX18jI25hbWUj
I19wdHIgCj4gX19hdHRyaWJ1dGVfXygodW51c2VkKSkgPSAmKG5hbWUpCj4gICNlbmRpZgo+IAo+
ICAvKiBWZXJzaW9uIG9mIGZvcm0gWzxlcG9jaD46XTx2ZXJzaW9uPlstPGV4dHJhLXZlcnNpb24+
XS4KPgo+IHRoZSB3YXJuaW5nIGdvZXMgYXdheSBhbmQgc3RtcGVfdHNfaWRzIGlzbid0IGluY2x1
ZGVkIGluIHRoZSAubyBmaWxlCj4gd2l0aG91dCBoYXZpbmcgdG8gYWRkIF9fbWF5YmVfdW51c2Vk
IHRvIHRoZSBkcml2ZXIuCj4KPiBJIHdvdWxkIGNvbnNpZGVyIHRoYXQgYSBzdXBlcmlvciBhcHBy
b2FjaC4KCk5vdCBzdXJlLCBJIGNhbiBzZWUgaG93IHRoaXMgYXZvaWRzIHNvbWUgd2FybmluZ3Ms
IGJ1dCB0aGlzIGlzCmN1cnJlbnRseSB0aGUgb25seSByZW1haW5pbmcgaW5zdGFuY2Ugb2YgdGhp
cyBwcm9ibGVtIChJIGZpeGVkCmFub3RoZXIgdHdvIHJlY2VudGx5KSwgYW5kIGluIG1vc3QgY2Fz
ZXMgYSBNT0RVTEVfREVWSUNFX1RBQkxFKCkKZW50cnkgdGhhdCBpcyBjb21wbGV0ZWx5IHVudXNl
ZCBlbmRzIHVwIHBvaW50aW5nIHRvIGEgcmVhbCBidWcsCndoZXJlIHRoZXJlIGlzIGEgdGFibGUg
YnV0IGl0J3Mgbm90IGFsc28gcGFydCBvZiB0aGUKZGV2aWNlX2RyaXZlciBkZWZpbml0aW9uLgoK
ICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
