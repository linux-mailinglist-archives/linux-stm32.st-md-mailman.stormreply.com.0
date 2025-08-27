Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5418AB37BD4
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 09:35:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A3E3C3F958;
	Wed, 27 Aug 2025 07:35:10 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EFACC3F957
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 07:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=2E2t5XJ0oBHE/MDQjcbZItd2IrlEm9kNRRgPclvPx2Y=; b=q+dEkXRNy3JfEbTDNXEe/S/Q0S
 Lzw01WTWTAPxZ0eF1o36zaQhaBOKLAMxG7r/pgMIvbRAAAs1FvocPigGldPnwWmIjkVRFQQp3SoP+
 B0TRDhzc0ZpGNvZBCPRCp01Fr5cu7nos/o8IIpBrM7voobaAWUhtgpBGTcxChnkaaYzoiHCKjNjcx
 DX5yLcYwUr+yT2mONOZMl4kZJIbm0Ia0+tFlKMoA2t/ASxSDWPh5U2RqQY9HQyKj0hI0LR8oqVHAn
 iNu+Hg8d5nSM87e28dKJ8XEIbGJAwTuLvwVcl82p8CMiqxhL6axkl4rH0x9WfV64Kl21R0NePmiKI
 8Iy4r5HQ==;
Received: from [213.244.170.152] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1urAg9-00062s-SC; Wed, 27 Aug 2025 09:34:45 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 27 Aug 2025 09:34:44 +0200
Message-ID: <5249188.NgBsaNRSFp@phil>
In-Reply-To: <20250825-byeword-update-v3-12-947b841cdb29@collabora.com>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
 <20250825-byeword-update-v3-12-947b841cdb29@collabora.com>
MIME-Version: 1.0
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] Re: [PATCH v3 12/20] phy: rockchip-usb: switch to
	FIELD_PREP_WM16 macro
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

QW0gTW9udGFnLCAyNS4gQXVndXN0IDIwMjUsIDEwOjI4OjMyIE1pdHRlbGV1cm9ww6Rpc2NoZSBT
b21tZXJ6ZWl0IHNjaHJpZWIgTmljb2xhcyBGcmF0dGFyb2xpOgo+IFRoZSBlcmEgb2YgaGFuZC1y
b2xsZWQgSElXT1JEX1VQREFURSBtYWNyb3MgaXMgb3ZlciwgYXQgbGVhc3QgZm9yIHRob3NlCj4g
ZHJpdmVycyB0aGF0IHVzZSBjb25zdGFudCBtYXNrcy4KPiAKPiBSZW1vdmUgdGhpcyBkcml2ZXIn
cyBISVdPUkRfVVBEQVRFIG1hY3JvLCBhbmQgcmVwbGFjZSBhbGwgaW5zdGFuY2VzIG9mCj4gaXQg
d2l0aCAoaG9wZWZ1bGx5KSBlcXVpdmFsZW50IEZJRUxEX1BSRVBfV00xNiBpbnN0YW5jZXMuIFRv
IGRvIHRoaXMsIGEKPiBmZXcgb2YgdGhlIGRlZmluZXMgYXJlIGJlaW5nIGFkanVzdGVkLCBhcyBG
SUVMRF9QUkVQX1dNMTYgc2hpZnRzIHVwIHRoZQo+IHZhbHVlIGZvciB1cy4gVGhpcyBnZXRzIHJp
ZCBvZiB0aGUgaWNreSB1cGRhdGUobWFzaywgbWFzaykgc2hlbmFuaWdhbnMuCj4gCj4gVGhlIGJl
bmVmaXQgb2YgdXNpbmcgRklFTERfUFJFUF9XTTE2IGlzIHRoYXQgaXQgZG9lcyBtb3JlIGNoZWNr
aW5nIG9mCj4gdGhlIGlucHV0LCBob3BlZnVsbHkgY2F0Y2hpbmcgZXJyb3JzLiBJbiBwcmFjdGlj
ZSwgYSBzaGFyZWQgZGVmaW5pdGlvbgo+IG1ha2VzIGNvZGUgbW9yZSByZWFkYWJsZSB0aGFuIHNl
dmVyYWwgZGlmZmVyZW50IGZsYXZvdXJzIG9mIHRoZSBzYW1lCj4gbWFjcm8sIGFuZCB0aGUgc2hp
ZnRlZCB2YWx1ZSBoZWxwcyBhcyB3ZWxsLgo+IAo+IEkgZG8gbm90IGhhdmUgdGhlIGhhcmR3YXJl
IHRoYXQgdXNlcyB0aGlzIHBhcnRpY3VsYXIgZHJpdmVyLCBzbyBpdCdzCj4gY29tcGlsZS10ZXN0
ZWQgb25seSBhcyBmYXIgYXMgbXkgb3duIHRlc3RpbmcgZ29lcy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBOaWNvbGFzIEZyYXR0YXJvbGkgPG5pY29sYXMuZnJhdHRhcm9saUBjb2xsYWJvcmEuY29tPgoK
UmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
