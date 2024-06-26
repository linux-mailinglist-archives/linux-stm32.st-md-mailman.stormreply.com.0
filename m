Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 686FE918579
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 17:13:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22B12C71282;
	Wed, 26 Jun 2024 15:13:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DACA1C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 15:13:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BD04561A55;
 Wed, 26 Jun 2024 15:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B2DC116B1;
 Wed, 26 Jun 2024 15:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719414828;
 bh=nyFfYXcb8BHeCVoCZIVl/CHDqWGfVZeZvhuIHlrHsVA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E5BGYU+IwcgJQ6wzQoc8q3zuJLZ9s2znsJkN2Qr3X9/Cb0eNV3SpZM/USpdlJTQGu
 8EqcZZWEuuEJc2FsvqCE1RgDsYSM+cwsgs/uZfnEI1gW/KGo8jFhnrE7uvEi1anaWN
 DOgC9lo1TVq9C0LFW9qDF7ojk8D976NnIwkvCIkNRae6M+r2L9tsbjJAVbfOaw1fzf
 +BWWGHS4tBiAfL1AZHAXAfcMBVYNtK5d/XPhdUhU4geWcsA77NyEYIDdIFzGbl9wLH
 AM55/hnVqLmm5rODA8gHNA5zBwsQMwEgzEnkCxG7rWyJMj9oTkJi229m1e50GwOahp
 qvo9Bl3kHrBOw==
Date: Wed, 26 Jun 2024 16:13:43 +0100
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <20240626151343.GA2504017@google.com>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Scherer <T.Scherer@eckelmann.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 William Breathitt Gray <wbg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/5] mfd: stm32-timers: Make register
 definition more flexible
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

T24gV2VkLCAxOSBKdW4gMjAyNCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IEhlbGxvLAo+
IAo+IChpbXBsaWNpdCkgdjEgaXMgYXZhaWxhYmxlIGF0Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC9jb3Zlci4xNzE4MzUyMDIyLmdpdC51LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29t
Cj4gLgo+IAo+IENoYW5nZXMgaW50cm9kdWNlZCBoZXJlOgo+IAo+ICAtIFNwbGl0IHRoZSBwYXRj
aCByZW1vdmluZyBUSU1fRElFUl9DQ19JRSgpIGFuZCB1c2UgYXBwcm9wcmlhdGUgc3ViamVjdAo+
ICAgIHByZWZpeGVzLiBMZWUgYW5kIFdpbGxpYW0gZGlkbid0IGxpa2UgdGhlIHBhdGNoIHRvdWNo
aW5nIGJvdGgKPiAgICBpbmNsdWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaCBhbmQKPiAgICBk
cml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMgbm90IGhhdmluZyBhIGhpbnQgdG8gdGhl
IGNvdW50ZXIKPiAgICBzdWJzeXN0ZW0gKGF0IGxlYXN0IHRoYXQncyBteSBpbnRlcnByZXRhdGlv
biBvZiB0aGVpciBmZWVkYmFjaykuCj4gICAgTm90IG1lbnRpb25pbmcgbWZkIGRpZG4ndCBzZWVt
IHRvIGJlIGNvbnNpZGVyYWJseSBiZXR0ZXIgaW4gbXkgZXllcywKPiAgICBzbyBJIHNwbGl0IHRo
aXMgcGF0Y2guCj4gIC0gRml4IHR5cG8gbm90aWNlZCBieSBUaG9yc3Rlbi4KPiAgLSBVcGRhdGUg
c3ViamVjdCBwcmVmaXggb2YgdGhlIGxhc3QgcGF0Y2ggdG8gbWF0Y2ggd2hhdCBpcyB1c3VhbGx5
IGRvbmUKPiAgICBmb3IgcHdtLgo+IAo+IEkgaGF2ZSBzb21lIGZ1cnRoZXIgdXBkYXRlcyB0byB0
aGUgcHdtLXN0bTMyIGRyaXZlciB0aGF0IHdpbGwgcHJvYmFibHkKPiBnbyBpbiBiZWZvcmUgdjYu
MTAtcmMxLiBUaGV5IHNob3VsZG4ndCBjb25mbGljdCwgc3RpbGwgSSdkIHByZWZlciB0byBsZXQK
PiB0aGUgcHdtIHBhdGNoIGdvIGluIHZpYSBteSB0cmVlIGFzIEkgbWlnaHQgaGF2ZSBzb21lIGZ1
cnRoZXIgY2hhbmdlcyBmb3IKPiB0aGF0IGRyaXZlci4gU28gaWYgdGhpcyBpcyBtZXJnZWQgdXNp
bmcgdGhlIG1mZCBvciBjb3VudGVyIHRyZWUsIHBsZWFzZQo+IHNraXAgdGhlIHB3bSBwYXRjaC4g
QSBzdGFibGUgYnJhbmNoIHdvdWxkIGJlIHdlbGNvbWUgaW4gdGhpcyBjYXNlLgo+IAo+IEJlc3Qg
cmVnYXJkcwo+IFV3ZQo+IAo+IAo+IFV3ZSBLbGVpbmUtS8O2bmlnICg1KToKPiAgIG1mZDogc3Rt
MzItdGltZXJzOiBVbmlmeSBhbGlnbm1lbnQgb2YgcmVnaXN0ZXIgZGVmaW5pdGlvbgo+ICAgbWZk
OiBzdG0zMi10aW1lcnM6IEFkZCBzb21lIHJlZ2lzdGVyIGRlZmluaXRpb25zIHdpdGggYSBwYXJh
bWV0ZXIKPiAgIGNvdW50ZXI6IHN0bTMyLXRpbWVyLWNudDogVXNlIFRJTV9ESUVSX0NDeElFKHgp
IGluc3RlYWQgb2YKPiAgICAgVElNX0RJRVJfQ0N4SUUoeCkKPiAgIG1mZDogc3RtMzItdGltZXJz
OiBEcm9wIHVudXNlZCBUSU1fRElFUl9DQ19JRQo+ICAgcHdtOiBzdG0zMjogTWFrZSB1c2Ugb2Yg
cGFyYW1ldHJpc2VkIHJlZ2lzdGVyIGRlZmluaXRpb25zCj4gCj4gIGRyaXZlcnMvY291bnRlci9z
dG0zMi10aW1lci1jbnQuYyB8ICAgNCArLQo+ICBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyAgICAg
ICAgICAgfCAgMjIgKystLQo+ICBpbmNsdWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaCAgfCAx
NzkgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTA3
IGluc2VydGlvbnMoKyksIDk4IGRlbGV0aW9ucygtKQo+IAo+IGJhc2UtY29tbWl0OiAxNjEzZTYw
NGRmMGNkMzU5Y2YyYTdmYmQ5YmU3YTBiY2ZhY2ZhYmQwCgpBcHBsaWVkIHBhdGNoZXMgMS00IGFu
ZCBzdWJtaXR0ZWQgZm9yIGJ1aWxkIHRlc3RpbmcuCgpJZiBhbGwgaXMgZ29vZCwgSSdsbCBzZW50
IG91dCBhIFBSIGZvciBXaWxsaWFtLgoKTm90ZSB0byBzZWxmOiBpYi1tZmQtY291bnRlci01LjEx
CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
