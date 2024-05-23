Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1508CD7DC
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2024 17:56:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2858DC6C838;
	Thu, 23 May 2024 15:56:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 307D4C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2024 15:56:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E44B562E20;
 Thu, 23 May 2024 15:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BC2C32782;
 Thu, 23 May 2024 15:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716479774;
 bh=XvmEDDUHlsY6mU7seNbHovJY2X6+z5HZts8QvBbsPp8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RrUdS0vOunXE6i1fR1kAkBcgYN2SGkZ2X3fEdJrN3IOwGwqExrVimGrBzdg8iSD2W
 KKmglq1XNECQy5By63cCLixmCT4MLgEk0cx/gDuahg/g0fHDLGuRfaez3o3645Uqkc
 XlhZiBclHH8e/e1uFX0zUQoUmcxtjQwr1sNGCHPvelYUnSzN5mWz6NZANNoJOftrYk
 kdoEW+vRkybNTBTv9HmkSqmUgutTvFB5G1rn1Q/aCPG3dNSCupAtxqBDsz34BQGhgT
 PT0SSS/1j8HTWWkwfU15uS82AOZDDX0/7kxCDi5FMEEPYaluojmnz2L2jaD5Fq1vI6
 8LLYpZM8BJpIw==
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Ben Wolsieffer <ben.wolsieffer@hefring.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240523103326.792907-2-u.kleine-koenig@pengutronix.de>
References: <20240523103326.792907-2-u.kleine-koenig@pengutronix.de>
Message-Id: <171647977254.55224.3637394907544576771.b4-ty@kernel.org>
Date: Thu, 23 May 2024 16:56:12 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14-dev-621fa
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-spi@vger.kernel.org,
 kernel@pengutronix.de,
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: Revert change that enabled
 controller before asserting CS
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

T24gVGh1LCAyMyBNYXkgMjAyNCAxMjozMzoyNSArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gT24gc3RtMzJtcDE1NyBlbmFibGluZyB0aGUgY29udHJvbGxlciBiZWZvcmUgYXNzZXJ0
aW5nIENTIG1ha2VzIHRoZQo+IGhhcmR3YXJlIHRyaWdnZXIgc3B1cmlvdXMgaW50ZXJydXB0cyBp
biBhIHRpZ2h0IGxvb3AgYW5kIHRoZSB0cmFuc2ZlcnMKPiBmYWlsLiBSZXZlcnQgdGhlIGNvbW1p
dCB0aGF0IHN3YXBwZWQgdGhlIG9yZGVyIG9mIGVuYWJsZSBhbmQgQ1MuIFRoaXMKPiByZWludHJv
ZHVjZXMgdGhlIHByb2JsZW0gdGhhdCBzd2FwcGluZyB3YXMgc3VwcG9zZWQgdG8gZml4LCB3aGlj
aAo+IGhvd2V2ZXIgaXMgbGVzcyBncmF2ZS4KPiAKPiAKPiBbLi4uXQoKQXBwbGllZCB0bwoKICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9z
cGkuZ2l0IGZvci1uZXh0CgpUaGFua3MhCgpbMS8xXSBzcGk6IHN0bTMyOiBSZXZlcnQgY2hhbmdl
IHRoYXQgZW5hYmxlZCBjb250cm9sbGVyIGJlZm9yZSBhc3NlcnRpbmcgQ1MKICAgICAgY29tbWl0
OiBhODI3YWQ5YjNjMmZjMjQzZTA1ODU5NTUzM2Y5MWNlNDFhMzEyNTI3CgpBbGwgYmVpbmcgd2Vs
bCB0aGlzIG1lYW5zIHRoYXQgaXQgd2lsbCBiZSBpbnRlZ3JhdGVkIGludG8gdGhlIGxpbnV4LW5l
eHQKdHJlZSAodXN1YWxseSBzb21ldGltZSBpbiB0aGUgbmV4dCAyNCBob3VycykgYW5kIHNlbnQg
dG8gTGludXMgZHVyaW5nCnRoZSBuZXh0IG1lcmdlIHdpbmRvdyAob3Igc29vbmVyIGlmIGl0IGlz
IGEgYnVnIGZpeCksIGhvd2V2ZXIgaWYKcHJvYmxlbXMgYXJlIGRpc2NvdmVyZWQgdGhlbiB0aGUg
cGF0Y2ggbWF5IGJlIGRyb3BwZWQgb3IgcmV2ZXJ0ZWQuCgpZb3UgbWF5IGdldCBmdXJ0aGVyIGUt
bWFpbHMgcmVzdWx0aW5nIGZyb20gYXV0b21hdGVkIG9yIG1hbnVhbCB0ZXN0aW5nCmFuZCByZXZp
ZXcgb2YgdGhlIHRyZWUsIHBsZWFzZSBlbmdhZ2Ugd2l0aCBwZW9wbGUgcmVwb3J0aW5nIHByb2Js
ZW1zIGFuZApzZW5kIGZvbGxvd3VwIHBhdGNoZXMgYWRkcmVzc2luZyBhbnkgaXNzdWVzIHRoYXQg
YXJlIHJlcG9ydGVkIGlmIG5lZWRlZC4KCklmIGFueSB1cGRhdGVzIGFyZSByZXF1aXJlZCBvciB5
b3UgYXJlIHN1Ym1pdHRpbmcgZnVydGhlciBjaGFuZ2VzIHRoZXkKc2hvdWxkIGJlIHNlbnQgYXMg
aW5jcmVtZW50YWwgdXBkYXRlcyBhZ2FpbnN0IGN1cnJlbnQgZ2l0LCBleGlzdGluZwpwYXRjaGVz
IHdpbGwgbm90IGJlIHJlcGxhY2VkLgoKUGxlYXNlIGFkZCBhbnkgcmVsZXZhbnQgbGlzdHMgYW5k
IG1haW50YWluZXJzIHRvIHRoZSBDQ3Mgd2hlbiByZXBseWluZwp0byB0aGlzIG1haWwuCgpUaGFu
a3MsCk1hcmsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
