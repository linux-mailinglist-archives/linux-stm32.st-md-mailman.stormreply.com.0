Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AE191006B
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 11:32:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E8FCC7128D;
	Thu, 20 Jun 2024 09:32:42 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B30DC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 09:32:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C14E7CE1D15;
 Thu, 20 Jun 2024 09:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B89C2BD10;
 Thu, 20 Jun 2024 09:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718875952;
 bh=O/Et+olhzP5XobD8bdj3w1CIIC0vknNGVO0piDAW26s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EtrvQbvjvB3OlS0NqQVMZ78pc5yjJBlgxYROJaDdmAeUuwpZ8PiDoIYaZiiohLS/m
 dqJQcp+fiJC0KNtb5Fs1T5S3WX79Ftgk5Y8xP62GafReVKgi1HtoSGJo7HXCJb/ihD
 sq4+4RX9VfZBaAld4D2usmp06jkDelxewiIrEbdiY1JcRlhyizfGiKXR1apqEHkWvZ
 Eb8ELdwoKiR/1DVZMqNE6V2lE3zd6kDsrDhZ5kom+uoxBCnIFNlgJSdHNlAeDkpyrM
 yTK1Im4WXdZJSlwXXKMmTJpW2s+/7eteThN+IyFz4jcV0KfbPEy7p33D5fwS80kinE
 NwQ91k8PEhPlw==
Date: Thu, 20 Jun 2024 10:32:27 +0100
From: Lee Jones <lee@kernel.org>
To: William Breathitt Gray <wbg@kernel.org>
Message-ID: <20240620093227.GI3029315@google.com>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
 <126bd153a03f39e42645573eecf44ffab5354fc7.1718791090.git.u.kleine-koenig@baylibre.com>
 <20240620084451.GC3029315@google.com> <ZnPvW6Zx69wVjNRS@ishi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZnPvW6Zx69wVjNRS@ishi>
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Scherer <T.Scherer@eckelmann.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

T24gVGh1LCAyMCBKdW4gMjAyNCwgV2lsbGlhbSBCcmVhdGhpdHQgR3JheSB3cm90ZToKCj4gT24g
VGh1LCBKdW4gMjAsIDIwMjQgYXQgMDk6NDQ6NTFBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3RlOgo+
ID4gT24gV2VkLCAxOSBKdW4gMjAyNCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gPiAKPiA+
ID4gVGhlc2UgdHdvIGRlZmluZXMgaGF2ZSB0aGUgc2FtZSBwdXJwb3NlIGFuZCB0aGlzIGNoYW5n
ZSBkb2Vzbid0Cj4gPiA+IGludHJvZHVjZSBhbnkgZGlmZmVyZW5jZXMgaW4gZHJpdmVycy9jb3Vu
dGVyL3N0bTMyLXRpbWVyLWNudC5vLgo+ID4gPiAKPiA+ID4gVGhlIG9ubHkgZGlmZmVyZW5jZSBi
ZXR3ZWVuIHRoZSB0d28gaXMgdGhhdAo+ID4gPiAKPiA+ID4gCVRJTV9ESUVSX0NDX0lFKDEpID09
IFRJTV9ESUVSX0NDMklFCj4gPiA+IAo+ID4gPiB3aGlsZQo+ID4gPiAKPiA+ID4gCVRJTV9ESUVS
X0NDeElFKDEpID09IFRJTV9ESUVSX0NDMUlFCj4gPiA+IAo+ID4gPiAuIFRoYXQgbWFrZXMgaXQg
bmVjZXNzYXJ5IHRvIGhhdmUgYW4gZXhwbGljaXQgIisgMSIgaW4gdGhlIHVzZXIgY29kZSwKPiA+
ID4gYnV0IElNSE8gdGhpcyBpcyBhIGdvb2QgdGhpbmcgYXMgdGhpcyBpcyB0aGUgY29kZSBsb2Nh
dGF0aW9uIHRoYXQKPiA+ID4gImtub3dzIiB0aGF0IGZvciBzb2Z0d2FyZSBjaGFubmVsIDEgeW91
IGhhdmUgdG8gdXNlIFRJTV9ESUVSX0NDMklFCj4gPiA+IChiZWNhdXNlIHNvZnR3YXJlIGd1eXMg
c3RhcnQgY291bnRpbmcgYXQgMCwgd2hpbGUgdGhlIHJlbGV2YW50IGhhcmR3YXJlCj4gPiA+IGRl
c2lnbmVyIHN0YXJ0ZWQgYXQgMSkuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KPiA+ID4gLS0tCj4gPiA+
ICBkcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMgfCA0ICsrLS0KPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IERpZCB5
b3UgZHJvcCBXaWxsaWFtJ3MgQWNrIG9uIHB1cnBvc2U/Cj4gPiAKPiA+IC0tIAo+ID4gTGVlIEpv
bmVzIFvmnY7nkLzmlq9dCj4gCj4gTm8gcHJvYmxlbSwgaGVyZSBpdCBpcyBhZ2FpbiBmb3IgdGhl
IHNha2Ugb2YgdGhlIExLTUwgc2NyYXBlciB0b29sczoKPiAKPiBBY2tlZC1ieTogV2lsbGlhbSBC
cmVhdGhpdHQgR3JheSA8d2JnQGtlcm5lbC5vcmc+Cj4gCj4gTGVlLCBkbyB5b3UgcHJlZmVyIHRh
a2luZyB0aGlzIHBhdGNoc2V0IHRocm91Z2ggeW91ciB0cmVlPwoKSSB0aGluayB0aGF0IHdvdWxk
IG1ha2UgdGhpbmdzIGVhc2llci4KCkEgcHVsbC1yZXF1ZXN0IGZvciB5b3UgYW5kIHRoZSBQV00g
Zm9sayB3b3VsZCBmb2xsb3cuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
