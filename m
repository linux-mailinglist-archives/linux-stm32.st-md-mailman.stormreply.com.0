Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DC1AE0372
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jun 2025 13:26:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B55BFC349C0;
	Thu, 19 Jun 2025 11:26:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 570D8C36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jun 2025 11:26:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0817C4A511;
 Thu, 19 Jun 2025 11:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D299C4CEEA;
 Thu, 19 Jun 2025 11:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750332408;
 bh=YiyRb7pucNT3+6sXw2ZPl1qiFdH+sijuowL1VDYl3BM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rGWRVZe1Jq0LFnj/uHkCyf65/ZmMVek9uGDJO2sdON4Q5sqap09KnZe1E5WMa8trC
 k82LUXqM6AW0D7jyid1Pj1mhBwxPayfKs0KUwZA1kgwG+A6sm+Izqwx93NCVxbLk/j
 2CNCZSS7sosAEuiJITueiPzgUzDd6q8vjVK8WOS4znY9tDxUxORGhI/ETCA7WZHsDX
 7J1Nqn2QjHJ6hoKktlYSdsI37cqteX2vBZAVGW6+E5QPIwdbisB9bM7Wy3Gij7noOI
 3LKvlSiARObPkAy/oqu8x+jYUpjA73q/oNJ3AhuuSq6ahvATRjfTSGggqFiEbfuXjD
 Tu5aei6AOKlIw==
From: Lee Jones <lee@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-iio@vger.kernel.org, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Antonio Borneo <antonio.borneo@foss.st.com>
In-Reply-To: <20250610124855.269158-6-antonio.borneo@foss.st.com>
References: <20250610124855.269158-6-antonio.borneo@foss.st.com>
Message-Id: <175033240599.700502.13443689743832586360.b4-ty@kernel.org>
Date: Thu, 19 Jun 2025 12:26:45 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c81fc
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] (subset) [PATCH 5/5] mfd: stm32-timers: Fix build
 warnings about export.h
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

T24gVHVlLCAxMCBKdW4gMjAyNSAxNDo0ODo1NSArMDIwMCwgQW50b25pbyBCb3JuZW8gd3JvdGU6
Cj4gQWZ0ZXIgY29tbWl0IGE5MzRhNTdhNDJmNiAoInNjcmlwdHMvbWlzYy1jaGVjazogY2hlY2sg
bWlzc2luZyAjaW5jbHVkZQo+IDxsaW51eC9leHBvcnQuaD4gd2hlbiBXPTEiKSBhbmQgY29tbWl0
IDdkOTU2ODBkNjRhYyAoInNjcmlwdHMvbWlzYy1jaGVjazoKPiBjaGVjayB1bm5lY2Vzc2FyeSAj
aW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+IHdoZW4gVz0xIikgd2UgZ2V0IHRoZSBidWlsZAo+IHdh
cm5pbmcgd2l0aCBXPTE6Cj4gCj4gZHJpdmVycy9tZmQvc3RtMzItdGltZXJzLmM6IHdhcm5pbmc6
IEVYUE9SVF9TWU1CT0woKSBpcyB1c2VkLCBidXQgI2luY2x1ZGUgPGxpbnV4L2V4cG9ydC5oPiBp
cyBtaXNzaW5nCj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKCls1LzVdIG1mZDogc3RtMzIt
dGltZXJzOiBGaXggYnVpbGQgd2FybmluZ3MgYWJvdXQgZXhwb3J0LmgKICAgICAgY29tbWl0OiBj
ZjVkMmYyZGVhZWU1ZGJmY2FjMmRiODc1OGMzZTZlMDg2NGEwYzg2CgotLQpMZWUgSm9uZXMgW+ad
jueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
