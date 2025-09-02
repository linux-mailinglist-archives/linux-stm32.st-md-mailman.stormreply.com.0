Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3468B40371
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 15:33:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3AB6C3FACC;
	Tue,  2 Sep 2025 13:33:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5144FC3FACB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 13:33:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4F16160213;
 Tue,  2 Sep 2025 13:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3C5C4CEED;
 Tue,  2 Sep 2025 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756819985;
 bh=sBkfvtV88WJvhk99waVh61fGOEuvu+CGCXjjjDwFWgk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YR8flJhNtGVFxi4yKyTwDq+mLCufp8faONJNipdW7vSjbwjD5FUbZycT4DKFuNyE+
 Bes9NXoM/9CB0B4gA+/dPGb86ZNXZyJtMUL9vZG/ULM1401w7jjHqUP4wlM/JY3IFO
 RCjP091qHL6sOu/acZEFenbKuLb4CpzZNTS/gnAb9KHMuUAxhbNSvvwroNvygTbxr4
 qfUqXfQWh6CUMTvmfio/DVMcVeE03p1HxWJn9OLRJVC5h6lsyUDPJTAFM7tafV06hS
 7WpZoQ0U0EjkOQ8xOa/4fBqRxjPdvYmRvXn75UDFrlHf6Chuw20rSTwwjybHEevXB6
 8AULmPhMRqE/A==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
In-Reply-To: <20250813161517.4746-10-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-10-wsa+renesas@sang-engineering.com>
Message-Id: <175681998119.2360872.14819773585148263316.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 14:33:01 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c81fc
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, imx@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Samuel Holland <samuel@sholland.org>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH 09/21] mfd: remove unneeded
 'fast_io' parameter in regmap_config
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

T24gV2VkLCAxMyBBdWcgMjAyNSAxODoxNDo1NSArMDIwMCwgV29sZnJhbSBTYW5nIHdyb3RlOgo+
IFdoZW4gdXNpbmcgTU1JTyB3aXRoIHJlZ21hcCwgZmFzdF9pbyBpcyBpbXBsaWVkLiBObyBuZWVk
IHRvIHNldCBpdAo+IGFnYWluLgo+IAo+IAoKQXBwbGllZCwgdGhhbmtzIQoKWzA5LzIxXSBtZmQ6
IHJlbW92ZSB1bm5lZWRlZCAnZmFzdF9pbycgcGFyYW1ldGVyIGluIHJlZ21hcF9jb25maWcKICAg
ICAgICBjb21taXQ6IDhhN2Q1NTBjZWVhMjU4MjIwZTMxOTgyOTAzYjhhMDE3MzUxNTI2ZWMKCi0t
CkxlZSBKb25lcyBb5p2O55C85pavXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
