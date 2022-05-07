Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F71251E784
	for <lists+linux-stm32@lfdr.de>; Sat,  7 May 2022 15:50:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5181C5F1F2;
	Sat,  7 May 2022 13:50:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94FEBC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 May 2022 13:50:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4636561216;
 Sat,  7 May 2022 13:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58529C385A5;
 Sat,  7 May 2022 13:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651931419;
 bh=B7GSCKocZC3GBeIhJDtdHMfmZs2C5IMwNTLpWyg91fc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K99WYHydVRKLh7Dg1GnpwwXTn7WiXFCk9LfdVkHbv6I0CX+LQxktTck0pIQybiqEm
 mZUL/n3vQgPwMJEVxzKz3OMApHskwNbQXmNg8RQ+eqF2dPn0UYZYlGG3gnM01dpdqg
 VcRQ8+fQ8MWIRc+kLOMaL33HtFVloDope/dm/pFTQjQ1ee0vjv/4xjjj4Rt/ECh5yP
 opCF+gZ8QS2RMRDXBBNvyzxr1QdHInWiaBM0u4Y3AbsqoHPpRfSyyx9qyep9ikie41
 /w9fcoBg+R4ytMNPAyTeX9DJdr0IyKLX1TScSFeP2kmqyt6bhP9Oj6webp4/rhInZL
 X753MfQXFk1Vg==
Date: Sat, 7 May 2022 14:58:45 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20220507145845.06504c3b@jic23-huawei>
In-Reply-To: <CGHHBR.49W7GPLHSYOE@crapouillou.net>
References: <20220506225617.1774604-1-yannick.brosseau@gmail.com>
 <CGHHBR.49W7GPLHSYOE@crapouillou.net>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: lars@metafoo.de, mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/2] iio: adc: stm32: Fix ADC IRQ handling
	on STM32F4
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

T24gU2F0LCAwNyBNYXkgMjAyMiAwMDowNTowMCArMDEwMApQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gd3JvdGU6Cgo+IEhpIFlhbm5pY2ssCj4gCj4gTGUgdmVuLiwgbWFpIDYg
MjAyMiBhdCAxODo1NjoxNSAtMDQwMCwgWWFubmljayBCcm9zc2VhdSAKPiA8eWFubmljay5icm9z
c2VhdUBnbWFpbC5jb20+IGEgw6ljcml0IDoKPiA+IFJlY2VudCBjaGFuZ2VzIHRvIHRoZSBTVE0z
MiBBREMgaXJxIGhhbmRsaW5nIGJyb2tlIHRoZSBTVE0zMkY0IAo+ID4gcGxhdGZvcm1zCj4gPiBU
aGVzZSB0d28gcGF0Y2hlcyBicmluZyBpdCBiYWNrIHRvIGEgd29ya2luZyBzdGF0ZS4gIAo+IAo+
IElmIHRoZSBTVE0zMiBBREMgd2FzIGJyb2tlbiByZWNlbnRseSwgYW5kIHRoZXNlIHR3byBwYXRj
aGVzIGZpeCBpdCwgCj4gdGhlbiBJJ2QgZXhwZWN0IHRvIHNlZSBhIEZpeGVzOiB0YWcgb24gYm90
aCBjb21taXRzIGFuZCBDYzogCj4gbGludXgtc3RhYmxlLgoKSSBub3JtYWxseSBhZGQgdGhlIENj
OiBmb3Igc3RhYmxlLCBidXQgZG9uJ3QgbWluZCBmb3Igb2J2aW91cyBjYXNlcwppZiBwYXRjaGVz
IGNvbWUgaW4gd2l0aCBpdCBhbHJlYWR5IHRoZXJlLgoKU29tZXRpbWVzIHRoZSBtYXJraW5nIGNh
biBiZSB0aW1pbmcgZGVwZW5kZW50IChubyBwb2ludCBpbiBzZW5kaW5nCnRoaW5ncyB0byBzdGFi
bGUgaWYgdGhleSBhcmUgZ29pbmcgdG8gaGl0IGluIHRoZSBzYW1lIGN5Y2xlIGV0YykKCkFic29s
dXRlbHkgYWdyZWUgb24gZml4ZXMgdGFnIHRob3VnaCEKClRoYW5rcywKCkpvbmF0aGFuCgo+IAo+
IENoZWVycywKPiAtUGF1bAo+IAo+ID4gWWFubmljayBCcm9zc2VhdSAoMik6Cj4gPiAgIGlpbzog
YWRjOiBzdG0zMjogSXRlcmF0ZSB0aHJvdWdoIGFsbCBBRENzIGluIGlycSBoYW5kbGVyCj4gPiAg
IGlpbzogYWRjOiBzdG0zMjogRml4IGNoZWNrIGZvciBzcHVyaW91cyBJUlFzIG9uIFNUTTMyRjQK
PiA+IAo+ID4gIGRyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMtY29yZS5jIHwgNyArKysrKystCj4g
PiAgZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy5jICAgICAgfCA5ICsrKysrKy0tLQo+ID4gIDIg
ZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+IAo+ID4g
LS0KPiA+IDIuMzYuMAo+ID4gICAKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
