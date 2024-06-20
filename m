Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1959090FF2C
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 10:45:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2899C6B47A;
	Thu, 20 Jun 2024 08:45:07 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20048C5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 08:45:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 46042CE2050;
 Thu, 20 Jun 2024 08:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309ECC2BD10;
 Thu, 20 Jun 2024 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718873096;
 bh=g9sCHOwPXjh8FEzTD/8HrE3pyN+mCBZy4wtJBPu7b7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KF1lig/HOJVi8YdqwyKDsPovl8wMVEneFLEOEmECkeLiFt9vTvQwyKINK8+IfIuwI
 yGw5HXHSFkwivUMmwgTH4XQxfhlV1cdKKarV+k6DR/k2dKZIJtJ3BPyrwp9u63HAbH
 kTxSOnSrHfVeUG6OGkfSgbMFgYfRohuiGDLDQaBiokltB7oPRkL3wNyTql7xAQDp2y
 JPa8cj9BrXw02ZnqMr2Me4pe9pQ1eLPOIxThDyoHDwNSuatEq9CvITiHHbrkZwmUaz
 PZsfw6HqGgt0A933CT5c5fljlAASg9+LsVUiHaeDM++b/gXiUAvfAIg4oB0pguevpc
 9jQu4eF9f3JBA==
Date: Thu, 20 Jun 2024 09:44:51 +0100
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <20240620084451.GC3029315@google.com>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
 <126bd153a03f39e42645573eecf44ffab5354fc7.1718791090.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <126bd153a03f39e42645573eecf44ffab5354fc7.1718791090.git.u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Scherer <T.Scherer@eckelmann.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 William Breathitt Gray <wbg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/5] counter: stm32-timer-cnt: Use
 TIM_DIER_CCxIE(x) instead of TIM_DIER_CCxIE(x)
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

T24gV2VkLCAxOSBKdW4gMjAyNCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IFRoZXNlIHR3
byBkZWZpbmVzIGhhdmUgdGhlIHNhbWUgcHVycG9zZSBhbmQgdGhpcyBjaGFuZ2UgZG9lc24ndAo+
IGludHJvZHVjZSBhbnkgZGlmZmVyZW5jZXMgaW4gZHJpdmVycy9jb3VudGVyL3N0bTMyLXRpbWVy
LWNudC5vLgo+IAo+IFRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgdHdvIGlzIHRoYXQK
PiAKPiAJVElNX0RJRVJfQ0NfSUUoMSkgPT0gVElNX0RJRVJfQ0MySUUKPiAKPiB3aGlsZQo+IAo+
IAlUSU1fRElFUl9DQ3hJRSgxKSA9PSBUSU1fRElFUl9DQzFJRQo+IAo+IC4gVGhhdCBtYWtlcyBp
dCBuZWNlc3NhcnkgdG8gaGF2ZSBhbiBleHBsaWNpdCAiKyAxIiBpbiB0aGUgdXNlciBjb2RlLAo+
IGJ1dCBJTUhPIHRoaXMgaXMgYSBnb29kIHRoaW5nIGFzIHRoaXMgaXMgdGhlIGNvZGUgbG9jYXRh
dGlvbiB0aGF0Cj4gImtub3dzIiB0aGF0IGZvciBzb2Z0d2FyZSBjaGFubmVsIDEgeW91IGhhdmUg
dG8gdXNlIFRJTV9ESUVSX0NDMklFCj4gKGJlY2F1c2Ugc29mdHdhcmUgZ3V5cyBzdGFydCBjb3Vu
dGluZyBhdCAwLCB3aGlsZSB0aGUgcmVsZXZhbnQgaGFyZHdhcmUKPiBkZXNpZ25lciBzdGFydGVk
IGF0IDEpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXIt
Y250LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCkRpZCB5b3UgZHJvcCBXaWxsaWFtJ3MgQWNrIG9uIHB1cnBvc2U/CgotLSAKTGVl
IEpvbmVzIFvmnY7nkLzmlq9dCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
