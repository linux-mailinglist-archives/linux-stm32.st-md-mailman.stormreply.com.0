Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DA72A4E1A
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Nov 2020 19:15:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48D10C36B35;
	Tue,  3 Nov 2020 18:15:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12027C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Nov 2020 18:15:31 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08F9D20757;
 Tue,  3 Nov 2020 18:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604427329;
 bh=WMLXp9KIkBHzNGqnf6fHcME4bOrKDFHPetl8GufpkeE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=roF0sP2GTn4uAunxflNvNMhrLQIRRUEko4JyDIj1j/3R5C8BYXuf3PiJJAsTxhUVx
 H8pFhyZLMYF6bhTSASjjaFIRBEQ+cNeL5Aa98C90wxiaBvEQ2jbZXYUYbue11BdkzZ
 pr6/tJ6sDEHmAayIlToBKVSq9gFISRxr6Sm/tr9o=
Date: Tue, 03 Nov 2020 18:15:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Michał Mirosław <mirq-linux@rere.qmqm.pl>, Ondřej Jirman <megous@megous.com>, Liam Girdwood <lgirdwood@gmail.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <a9041d68b4d35e4a2dd71629c8a6422662acb5ee.1604351936.git.mirq-linux@rere.qmqm.pl>
References: <a9041d68b4d35e4a2dd71629c8a6422662acb5ee.1604351936.git.mirq-linux@rere.qmqm.pl>
Message-Id: <160442731508.14990.9941307658721881690.b4-ty@kernel.org>
MIME-Version: 1.0
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v1] regulator: defer probe when trying to
	get voltage from unresolved supply
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

T24gTW9uLCAwMiBOb3YgMjAyMCAyMjoyNzoyNyArMDEwMCwgTWljaGHFgiBNaXJvc8WCYXcgd3Jv
dGU6Cj4gcmVndWxhdG9yX2dldF92b2x0YWdlX3JkZXYoKSBpcyBjYWxsZWQgaW4gcmVndWxhdG9y
IHByb2JlKCkgd2hlbgo+IGFwcGx5aW5nIG1hY2hpbmUgY29uc3RyYWludHMuICBUaGUgImZpeGVk
IiBjb21taXQgZXhwb3NlZCB0aGUgcHJvYmxlbQo+IHRoYXQgbm9uLWJ5cGFzc2VkIHJlZ3VsYXRv
cnMgY2FuIGZvcndhcmQgdGhlIHJlcXVlc3QgdG8gaXRzIHBhcmVudAo+IChsaWtlIGJ5cGFzc2Vk
IG9uZXMpIHN1cHBseS4gUmV0dXJuIC1FUFJPQkVfREVGRVIgd2hlbiB0aGUgc3VwcGx5Cj4gaXMg
ZXhwZWN0ZWQgYnV0IG5vdCByZXNvbHZlZCB5ZXQuCgpBcHBsaWVkIHRvCgogICBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3JlZ3VsYXRvci5n
aXQgZm9yLW5leHQKClRoYW5rcyEKClsxLzFdIHJlZ3VsYXRvcjogZGVmZXIgcHJvYmUgd2hlbiB0
cnlpbmcgdG8gZ2V0IHZvbHRhZ2UgZnJvbSB1bnJlc29sdmVkIHN1cHBseQogICAgICBjb21taXQ6
IGNmMWFkNTU5YTIwZDE5MzBhYTdiNDdhNTJmNTRlMWY4NzE4ZGUzMDEKCkFsbCBiZWluZyB3ZWxs
IHRoaXMgbWVhbnMgdGhhdCBpdCB3aWxsIGJlIGludGVncmF0ZWQgaW50byB0aGUgbGludXgtbmV4
dAp0cmVlICh1c3VhbGx5IHNvbWV0aW1lIGluIHRoZSBuZXh0IDI0IGhvdXJzKSBhbmQgc2VudCB0
byBMaW51cyBkdXJpbmcKdGhlIG5leHQgbWVyZ2Ugd2luZG93IChvciBzb29uZXIgaWYgaXQgaXMg
YSBidWcgZml4KSwgaG93ZXZlciBpZgpwcm9ibGVtcyBhcmUgZGlzY292ZXJlZCB0aGVuIHRoZSBw
YXRjaCBtYXkgYmUgZHJvcHBlZCBvciByZXZlcnRlZC4KCllvdSBtYXkgZ2V0IGZ1cnRoZXIgZS1t
YWlscyByZXN1bHRpbmcgZnJvbSBhdXRvbWF0ZWQgb3IgbWFudWFsIHRlc3RpbmcKYW5kIHJldmll
dyBvZiB0aGUgdHJlZSwgcGxlYXNlIGVuZ2FnZSB3aXRoIHBlb3BsZSByZXBvcnRpbmcgcHJvYmxl
bXMgYW5kCnNlbmQgZm9sbG93dXAgcGF0Y2hlcyBhZGRyZXNzaW5nIGFueSBpc3N1ZXMgdGhhdCBh
cmUgcmVwb3J0ZWQgaWYgbmVlZGVkLgoKSWYgYW55IHVwZGF0ZXMgYXJlIHJlcXVpcmVkIG9yIHlv
dSBhcmUgc3VibWl0dGluZyBmdXJ0aGVyIGNoYW5nZXMgdGhleQpzaG91bGQgYmUgc2VudCBhcyBp
bmNyZW1lbnRhbCB1cGRhdGVzIGFnYWluc3QgY3VycmVudCBnaXQsIGV4aXN0aW5nCnBhdGNoZXMg
d2lsbCBub3QgYmUgcmVwbGFjZWQuCgpQbGVhc2UgYWRkIGFueSByZWxldmFudCBsaXN0cyBhbmQg
bWFpbnRhaW5lcnMgdG8gdGhlIENDcyB3aGVuIHJlcGx5aW5nCnRvIHRoaXMgbWFpbC4KClRoYW5r
cywKTWFyawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
