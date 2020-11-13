Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D890F2B21BB
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Nov 2020 18:14:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A1D3C3FAE2;
	Fri, 13 Nov 2020 17:14:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2156EC35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Nov 2020 17:14:37 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E0D921D1A;
 Fri, 13 Nov 2020 17:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605287675;
 bh=d1MfCaQkbPkemGA+CaA7qtnRSnBX6WNb98nJZoAQWoc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=WXbpHx9MhCDT2m6whoPouO0Ocs0yPodciemKR5xi9FjXxndp2IF20rbiZEkMBv88/
 MEqnwu9VsM8spVP+2wlNnZ20oa7L1zL9atZllBGd9J9iiyOo+efHbbPot/MQ7PUPDs
 oi6ipYLEhqQ/xtDF4wnfj8mKz3mElQvAkXPTk9Dc=
Date: Fri, 13 Nov 2020 17:14:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Michał Mirosław <mirq-linux@rere.qmqm.pl>
In-Reply-To: <7ede83e8d78414d8618e1044fd8fd11e8ed7a09f.1604544767.git.mirq-linux@rere.qmqm.pl>
References: <7ede83e8d78414d8618e1044fd8fd11e8ed7a09f.1604544767.git.mirq-linux@rere.qmqm.pl>
Message-Id: <160528765434.56661.8354349820717967137.b4-ty@kernel.org>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, lgirdwood@gmail.com,
 wens@csie.org, Corentin Labbe <clabbe.montjoie@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] regulator: debug early supply resolving
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

T24gVGh1LCAwNSBOb3YgMjAyMCAwMzo1NDowNyArMDEwMCwgTWljaGHFgiBNaXJvc8WCYXcgd3Jv
dGU6Cj4gSGVscCBkZWJ1Z2dpbmcgdGhlIGNhc2Ugd2hlbiBzZXRfbWFjaGluZV9jb25zdHJhaW50
cygpIG5lZWRzIHRvIGJlCj4gcmVwZWF0ZWQuCgpBcHBsaWVkIHRvCgogICBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3JlZ3VsYXRvci5naXQg
Zm9yLW5leHQKClRoYW5rcyEKClsxLzFdIHJlZ3VsYXRvcjogZGVidWcgZWFybHkgc3VwcGx5IHJl
c29sdmluZwogICAgICBjb21taXQ6IDA5MTdjOWRiMjNhY2NiODY5MGQ4ZjE5ODdhZGEzNmViNWIx
YTVhYzkKCkFsbCBiZWluZyB3ZWxsIHRoaXMgbWVhbnMgdGhhdCBpdCB3aWxsIGJlIGludGVncmF0
ZWQgaW50byB0aGUgbGludXgtbmV4dAp0cmVlICh1c3VhbGx5IHNvbWV0aW1lIGluIHRoZSBuZXh0
IDI0IGhvdXJzKSBhbmQgc2VudCB0byBMaW51cyBkdXJpbmcKdGhlIG5leHQgbWVyZ2Ugd2luZG93
IChvciBzb29uZXIgaWYgaXQgaXMgYSBidWcgZml4KSwgaG93ZXZlciBpZgpwcm9ibGVtcyBhcmUg
ZGlzY292ZXJlZCB0aGVuIHRoZSBwYXRjaCBtYXkgYmUgZHJvcHBlZCBvciByZXZlcnRlZC4KCllv
dSBtYXkgZ2V0IGZ1cnRoZXIgZS1tYWlscyByZXN1bHRpbmcgZnJvbSBhdXRvbWF0ZWQgb3IgbWFu
dWFsIHRlc3RpbmcKYW5kIHJldmlldyBvZiB0aGUgdHJlZSwgcGxlYXNlIGVuZ2FnZSB3aXRoIHBl
b3BsZSByZXBvcnRpbmcgcHJvYmxlbXMgYW5kCnNlbmQgZm9sbG93dXAgcGF0Y2hlcyBhZGRyZXNz
aW5nIGFueSBpc3N1ZXMgdGhhdCBhcmUgcmVwb3J0ZWQgaWYgbmVlZGVkLgoKSWYgYW55IHVwZGF0
ZXMgYXJlIHJlcXVpcmVkIG9yIHlvdSBhcmUgc3VibWl0dGluZyBmdXJ0aGVyIGNoYW5nZXMgdGhl
eQpzaG91bGQgYmUgc2VudCBhcyBpbmNyZW1lbnRhbCB1cGRhdGVzIGFnYWluc3QgY3VycmVudCBn
aXQsIGV4aXN0aW5nCnBhdGNoZXMgd2lsbCBub3QgYmUgcmVwbGFjZWQuCgpQbGVhc2UgYWRkIGFu
eSByZWxldmFudCBsaXN0cyBhbmQgbWFpbnRhaW5lcnMgdG8gdGhlIENDcyB3aGVuIHJlcGx5aW5n
CnRvIHRoaXMgbWFpbC4KClRoYW5rcywKTWFyawpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
