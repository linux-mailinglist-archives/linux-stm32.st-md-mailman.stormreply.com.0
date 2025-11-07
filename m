Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21680C3F2C6
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 10:34:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFCD4C5F1F4;
	Fri,  7 Nov 2025 09:34:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4212CC1A977
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 09:34:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E65DC4047A;
 Fri,  7 Nov 2025 09:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B2EC4CEF8;
 Fri,  7 Nov 2025 09:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762508060;
 bh=b8R1CDSDpojhuYBWHDM+d1NPiz/Bo7/dWl4kOM7jZfc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mxDD8XJ5tfK0QAmAnM+hfakfmYb7I5LqEWpL22jUZZXhSravEg9Apis4S7hrrX1MM
 Ry9nH+dI2jK+iU56vZU6U0P4+UuKh2CfxrKxLJEIGeW9Rr06yScfN+ro/w9ikNUWEo
 KQJy3mEjBaJnGBJolu3ufIW1926nnrp2cU886rGBwx00Py44L6jua20TL0VsOX8XfO
 ZH2/qTTFgqopxmADiYFVxtRPNkaJ4TYFXzDDhNlT6viDr0nSEzcYQ61QZvKcv/3UN7
 mZmcRVa+CJezDNOjrLjKU3GfeVDsg/QJWCh1iNKPz3QXdRCL6VI5ekYsICe07OyjB+
 yRdQPUpTHSlHA==
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
In-Reply-To: <20251106-restricted-pointers-stm-v1-1-7d03eb5020ba@linutronix.de>
References: <20251106-restricted-pointers-stm-v1-1-7d03eb5020ba@linutronix.de>
Message-Id: <176250805658.2488867.15310894982146426101.b4-ty@kernel.org>
Date: Fri, 07 Nov 2025 09:34:16 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-a6db3
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: dfsdm: don't use %pK through
	printk
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

T24gVGh1LCAwNiBOb3YgMjAyNSAxNTo0MTo1NyArMDEwMCwgVGhvbWFzIFdlacOfc2NodWggd3Jv
dGU6Cj4gSW4gdGhlIHBhc3QgJXBLIHdhcyBwcmVmZXJhYmxlIHRvICVwIGFzIGl0IHdvdWxkIG5v
dCBsZWFrIHJhdyBwb2ludGVyCj4gdmFsdWVzIGludG8gdGhlIGtlcm5lbCBsb2cuCj4gU2luY2Ug
Y29tbWl0IGFkNjdiNzRkMjQ2OSAoInByaW50azogaGFzaCBhZGRyZXNzZXMgcHJpbnRlZCB3aXRo
ICVwIikKPiB0aGUgcmVndWxhciAlcCBoYXMgYmVlbiBpbXByb3ZlZCB0byBhdm9pZCB0aGlzIGlz
c3VlLgo+IEZ1cnRoZXJtb3JlLCByZXN0cmljdGVkIHBvaW50ZXJzICgiJXBLIikgd2VyZSBuZXZl
ciBtZWFudCB0byBiZSB1c2VkCj4gdGhyb3VnaCBwcmludGsoKS4gVGhleSBjYW4gc3RpbGwgdW5p
bnRlbnRpb25hbGx5IGxlYWsgcmF3IHBvaW50ZXJzIG9yCj4gYWNxdWlyZSBzbGVlcGluZyBsb2Nr
cyBpbiBhdG9taWMgY29udGV4dHMuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8KCiAgIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Jyb29uaWUvc291bmQuZ2l0
IGZvci1uZXh0CgpUaGFua3MhCgpbMS8xXSBBU29DOiBzdG0zMjogZGZzZG06IGRvbid0IHVzZSAl
cEsgdGhyb3VnaCBwcmludGsKICAgICAgY29tbWl0OiA0ZGI0Y2UxNTcwNmQ2NDIzY2M0Y2FjNGIw
NTExNGIwNDY5NTA3YmFkCgpBbGwgYmVpbmcgd2VsbCB0aGlzIG1lYW5zIHRoYXQgaXQgd2lsbCBi
ZSBpbnRlZ3JhdGVkIGludG8gdGhlIGxpbnV4LW5leHQKdHJlZSAodXN1YWxseSBzb21ldGltZSBp
biB0aGUgbmV4dCAyNCBob3VycykgYW5kIHNlbnQgdG8gTGludXMgZHVyaW5nCnRoZSBuZXh0IG1l
cmdlIHdpbmRvdyAob3Igc29vbmVyIGlmIGl0IGlzIGEgYnVnIGZpeCksIGhvd2V2ZXIgaWYKcHJv
YmxlbXMgYXJlIGRpc2NvdmVyZWQgdGhlbiB0aGUgcGF0Y2ggbWF5IGJlIGRyb3BwZWQgb3IgcmV2
ZXJ0ZWQuCgpZb3UgbWF5IGdldCBmdXJ0aGVyIGUtbWFpbHMgcmVzdWx0aW5nIGZyb20gYXV0b21h
dGVkIG9yIG1hbnVhbCB0ZXN0aW5nCmFuZCByZXZpZXcgb2YgdGhlIHRyZWUsIHBsZWFzZSBlbmdh
Z2Ugd2l0aCBwZW9wbGUgcmVwb3J0aW5nIHByb2JsZW1zIGFuZApzZW5kIGZvbGxvd3VwIHBhdGNo
ZXMgYWRkcmVzc2luZyBhbnkgaXNzdWVzIHRoYXQgYXJlIHJlcG9ydGVkIGlmIG5lZWRlZC4KCklm
IGFueSB1cGRhdGVzIGFyZSByZXF1aXJlZCBvciB5b3UgYXJlIHN1Ym1pdHRpbmcgZnVydGhlciBj
aGFuZ2VzIHRoZXkKc2hvdWxkIGJlIHNlbnQgYXMgaW5jcmVtZW50YWwgdXBkYXRlcyBhZ2FpbnN0
IGN1cnJlbnQgZ2l0LCBleGlzdGluZwpwYXRjaGVzIHdpbGwgbm90IGJlIHJlcGxhY2VkLgoKUGxl
YXNlIGFkZCBhbnkgcmVsZXZhbnQgbGlzdHMgYW5kIG1haW50YWluZXJzIHRvIHRoZSBDQ3Mgd2hl
biByZXBseWluZwp0byB0aGlzIG1haWwuCgpUaGFua3MsCk1hcmsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
