Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD79BE2E8
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2024 10:43:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F7FBC78015;
	Wed,  6 Nov 2024 09:43:09 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23577C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2024 09:43:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1179AA42B70;
 Wed,  6 Nov 2024 09:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB9DC4CECD;
 Wed,  6 Nov 2024 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730886181;
 bh=ejHS7C/7ZbSIztex4f4UJCgT1blclG9gOy/DpK24OVs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eQP/8p1wgZwWzJ45BgjroCbaVs+5YbOb5IzDHn03FJpvbP6n01CO8AbbhcdXmaGLO
 hY0rL3z96Qi1B5gDGU0Rj190REZTEne/+z6Ki5PlzH6Ye95VbcX/8lrrWpLolzmYtK
 DV1624pYY6hvD2OI9IYbAsCkpcHJO96r4owwoInUrTIFj6fHkKeZbKlUBHcL6hD5ri
 pXEn3TdXFHsaNiIxhHHEOt8fmJyqg8ATnGGDP3IZ1D5L+G2S8Yw1xyO+K33XJE00XV
 76EVGPoaNre7RohP+kFi1TfX0kqOnBIc3WydIOuW7q49TvnmgAfflRkSNmu2zLPkfR
 EUTjWvqKJh0NA==
Date: Wed, 6 Nov 2024 09:42:56 +0000
From: Simon Horman <horms@kernel.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Message-ID: <20241106094256.GI4507@kernel.org>
References: <20241101-stmmac-unbalanced-wake-single-fix-v1-1-5952524c97f0@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241101-stmmac-unbalanced-wake-single-fix-v1-1-5952524c97f0@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Qiang Ma <maqianga@uniontech.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix unbalanced IRQ wake
 disable warning on single irq case
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

T24gRnJpLCBOb3YgMDEsIDIwMjQgYXQgMDU6MTc6MjlQTSAtMDQwMCwgTsOtY29sYXMgRi4gUi4g
QS4gUHJhZG8gd3JvdGU6Cj4gQ29tbWl0IGEyM2FhMDQwNDIxOCAoIm5ldDogc3RtbWFjOiBldGh0
b29sOiBGaXhlZCBjYWxsdHJhY2UgY2F1c2VkIGJ5Cj4gdW5iYWxhbmNlZCBkaXNhYmxlX2lycV93
YWtlIGNhbGxzIikgaW50cm9kdWNlZCBjaGVja3MgdG8gcHJldmVudAo+IHVuYmFsYW5jZWQgZW5h
YmxlIGFuZCBkaXNhYmxlIElSUSB3YWtlIGNhbGxzLiBIb3dldmVyIGl0IG9ubHkKPiBpbml0aWFs
aXplZCB0aGUgYXV4aWxpYXJ5IHZhcmlhYmxlIG9uIG9uZSBvZiB0aGUgcGF0aHMsCj4gc3RtbWFj
X3JlcXVlc3RfaXJxX211bHRpX21zaSgpLCBtaXNzaW5nIHRoZSBvdGhlciwKPiBzdG1tYWNfcmVx
dWVzdF9pcnFfc2luZ2xlKCkuCj4gCj4gQWRkIHRoZSBzYW1lIGluaXRpYWxpemF0aW9uIG9uIHN0
bW1hY19yZXF1ZXN0X2lycV9zaW5nbGUoKSB0byBwcmV2ZW50Cj4gIlVuYmFsYW5jZWQgSVJRIDx4
PiB3YWtlIGRpc2FibGUiIHdhcm5pbmdzIGZyb20gYmVpbmcgcHJpbnRlZCB0aGUgZmlyc3QKPiB0
aW1lIGRpc2FibGVfaXJxX3dha2UoKSBpcyBjYWxsZWQgb24gcGxhdGZvcm1zIHRoYXQgcnVuIG9u
IHRoYXQgY29kZQo+IHBhdGguCj4gCj4gRml4ZXM6IGEyM2FhMDQwNDIxOCAoIm5ldDogc3RtbWFj
OiBldGh0b29sOiBGaXhlZCBjYWxsdHJhY2UgY2F1c2VkIGJ5IHVuYmFsYW5jZWQgZGlzYWJsZV9p
cnFfd2FrZSBjYWxscyIpCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8g
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgoKUmV2aWV3ZWQtYnk6IFNpbW9uIEhvcm1hbiA8aG9y
bXNAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
