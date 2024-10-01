Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F7C992867
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:42:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFD5DC78F64;
	Mon,  7 Oct 2024 09:42:41 +0000 (UTC)
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4E09C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2024 19:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
 t=1727810275; bh=lIo8OG6VbAv8H4Grlk0j3HIMUEAfAXQn/RIndj4B8Ks=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V5KHtRtluKV4bT47DZaJlF55V5xhVeZmXX6jcYZ/JYw8ZZaxHDxWuZcIKoQ9Ks2eL
 UyamxX49KFg88aHW8tN3tQJIogVe86HduVL0o+obpsNAMjMEguj4rSGjzo+DH8vkCB
 /MX83AsrzmHmRftI+uPi4TLA1n1At6XfN89LD+43t514kDDr+k8Iwy1H/BL/WcTXcg
 3g7Px/V+tpaj3N/+xWv4083ssVFF4fpwvSzElCEkZs01tPRDvDEhAWioJCkZuk+BiX
 DBjU8qyZHd66Vyj3grrNq+F4IwJek/vFuTOvsiMcSoQJYCL5WsC+3WLC/rkmp8Z8oL
 ox3O3qCnLBFVvYieZKHR0DsclEza7oVa8ID+F0O70EduF3Dx0Qef06kFHQ85zAO3n3
 jR86hHBZe4ECpUuHBVlYWNzBeZtPyWtS9ZZur8kAuV2XZNoQz8Sh0Kp6yEsIYzZXCm
 Q9KNpHCbp1zhewv3PntGSsTX52XNuiCgs3FCLeLCVDOZ4QUpqgRaJStic8ejLD4KNY
 5XACRFn0q49EQBsjzWtaUN5lveVESPL75cf+ZZEHPpWrKTCz0JETd8GQidef6hRmtT
 rn+bY0iFSZ9Vj2rgTwwlOX0zuxk2YB6X+8aDeGxpL+JKMhtoa/O5ISBXMoLjkGbsvW
 LCntESKGfVa1VfYZSJmRv2cc=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl
 [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
 by bout3.ijzerbout.nl (Postfix) with ESMTPSA id ECA461842FC;
 Tue,  1 Oct 2024 21:17:51 +0200 (CEST)
Message-ID: <b0199625-9dbb-414b-8948-26ad86fd2740@ijzerbout.nl>
Date: Tue, 1 Oct 2024 21:17:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-pwm@vger.kernel.org
References: <cover.1726819463.git.u.kleine-koenig@baylibre.com>
 <332d4f736d8360038d03f109c013441c655eea23.1726819463.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <332d4f736d8360038d03f109c013441c655eea23.1726819463.git.u.kleine-koenig@baylibre.com>
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:42:34 +0000
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Kent Gibson <warthog618@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 6/8] pwm: stm32: Implementation of the
 waveform callbacks
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T3AgMjAtMDktMjAyNCBvbSAxMDo1OCBzY2hyZWVmIFV3ZSBLbGVpbmUtS8O2bmlnOgo+IENvbnZl
cnQgdGhlIHN0bTMyIHB3bSBkcml2ZXIgdG8gdXNlIHRoZSBuZXcgY2FsbGJhY2tzIGZvciBoYXJk
d2FyZQo+IHByb2dyYW1taW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcg
PHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+ClsuLi5dCj4gK3N0YXRpYyBpbnQgc3RtMzJf
cHdtX3dyaXRlX3dhdmVmb3JtKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwKPiArCQkJCSAgICAgIHN0
cnVjdCBwd21fZGV2aWNlICpwd20sCj4gKwkJCQkgICAgICBjb25zdCB2b2lkICpfd2ZodykKPiAr
ewo+ICsJY29uc3Qgc3RydWN0IHN0bTMyX3B3bV93YXZlZm9ybSAqd2ZodyA9IF93Zmh3Owo+ICsJ
c3RydWN0IHN0bTMyX3B3bSAqcHJpdiA9IHRvX3N0bTMyX3B3bV9kZXYoY2hpcCk7Cj4gKwl1bnNp
Z25lZCBpbnQgY2ggPSBwd20tPmh3cHdtOwo+ICsJaW50IHJldDsKPiArCj4gKwlyZXQgPSBjbGtf
ZW5hYmxlKHByaXYtPmNsayk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJ
aWYgKHdmaHctPmNjZXIgJiBUSU1fQ0NFUl9DQ3hFKGNoICsgMSkpIHsKPiArCQl1MzIgY2Nlciwg
bWFzazsKPiArCQl1bnNpZ25lZCBpbnQgc2hpZnQ7Cj4gKwkJdTMyIGNjbXI7Cj4gKwo+ICsJCXJl
dCA9IHJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwgVElNX0NDRVIsICZjY2VyKTsKPiArCQlpZiAo
cmV0KQo+ICsJCQlnb3RvIG91dDsKPiArCj4gKwkJLyogSWYgdGhlcmUgYXJlIG90aGVyIGNoYW5u
ZWxzIGVuYWJsZWQsIGRvbid0IHVwZGF0ZSBQU0MgYW5kIEFSUiAqLwo+ICsJCWlmIChjY2VyICYg
flRJTV9DQ0VSX0NDeEUoY2ggKyAxKSAmIFRJTV9DQ0VSX0NDWEUpIHsKPiArCQkJdTMyIHBzYywg
YXJyOwo+ICsKPiArCQkJcmV0ID0gcmVnbWFwX3JlYWQocHJpdi0+cmVnbWFwLCBUSU1fUFNDLCAm
cHNjKTsKPiArCQkJaWYgKHJldCkKPiArCQkJCWdvdG8gb3V0Owo+ICsKPiArCQkJaWYgKHBzYyAh
PSB3Zmh3LT5wc2MpIHsKPiArCQkJCXJldCA9IC1FQlVTWTsKPiArCQkJCWdvdG8gb3V0Owo+ICsJ
CQl9Cj4gKwo+ICsJCQlyZWdtYXBfcmVhZChwcml2LT5yZWdtYXAsIFRJTV9BUlIsICZhcnIpOwpE
aWQgeW91IGZvcmdldCB0byBhc3NpZ24gdG8gcmV0Pwo+ICsJCQlpZiAocmV0KQo+ICsJCQkJZ290
byBvdXQ7Cj4gKwo+IFsuLi5dCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
