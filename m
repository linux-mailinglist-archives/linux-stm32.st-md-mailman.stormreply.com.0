Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEE95AD689
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Sep 2022 17:29:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3047C55596;
	Mon,  5 Sep 2022 15:29:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29998C0AA15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Sep 2022 14:37:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0337360E9E;
 Mon,  5 Sep 2022 14:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560CDC433C1;
 Mon,  5 Sep 2022 14:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662388651;
 bh=EfVrz7hsdJqROChFgfcYCDytEwOKRltEWiE8QmfhHwU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tywYUqphQhOv05BJumMzuExgaYoPQG/4CejLoVhTcrmNS8ekT98j/E2d4GqEbAJDp
 Oc4+TRNanONALJaIXa9nkNFr1tZelmE3waxmWX/DYzgA7ha/k/qyblsiLWC4Khw7Pf
 t0axjVOeaU4DIYGMdtVGsWbrargAjwfEkbrkESTF0NfQcgAH7ObadRHt3+w4D3Ivze
 Ci8pn5Ndd/v74Mhl85Sv2NK1sFBDmXE7uQWj1coElMOm3V+iXcFJnApLDhMSq1tObY
 uv+/9RkIIqifriNevXFx9QDm/rbH9iicn7p4I8HSDWovXfplDzt0ADT0mWNEmIRGNq
 nSWS9DG2BOaow==
Date: Mon, 5 Sep 2022 15:37:15 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <YxYH+POIURB9RO7T@google.com>
References: <20220823145649.3118479-4-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220823145649.3118479-4-robh@kernel.org>
X-Mailman-Approved-At: Mon, 05 Sep 2022 15:29:17 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chris Zhong <zyw@rock-chips.com>, linux-stm32@st-md-mailman.stormreply.com,
 Renner Berthing <kernel@esmil.dk>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Alistair Francis <alistair@alistair23.me>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tim Harvey <tharvey@gateworks.com>, Zhang Qing <zhangqing@rock-chips.com>,
 Maxime Ripard <mripard@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-arm-kernel@lists.infradead.org, Robert Jones <rjones@gateworks.com>,
 - <patches@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Steve Twiss <stwiss.opensource@diasemi.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: Add missing
 (unevaluated|additional)Properties on child nodes
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

T24gVHVlLCAyMyBBdWcgMjAyMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IEluIG9yZGVyIHRvIGVu
c3VyZSBvbmx5IGRvY3VtZW50ZWQgcHJvcGVydGllcyBhcmUgcHJlc2VudCwgbm9kZSBzY2hlbWFz
Cj4gbXVzdCBoYXZlIHVuZXZhbHVhdGVkUHJvcGVydGllcyBvciBhZGRpdGlvbmFsUHJvcGVydGll
cyBzZXQgdG8gZmFsc2UKPiAodHlwaWNhbGx5KS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+ICAuLi4vbWZkL2FsbHdpbm5lcixzdW42aS1h
MzEtcHJjbS55YW1sICAgICAgICAgfCA0MCArKysrKysrKysrKysrKysrKysrCj4gIC4uLi9tZmQv
YWxsd2lubmVyLHN1bjhpLWEyMy1wcmNtLnlhbWwgICAgICAgICB8IDEwICsrKysrCj4gIC4uLi9i
aW5kaW5ncy9tZmQvY2lycnVzLGxvY2huYWdhci55YW1sICAgICAgICB8ICA1ICsrKwo+ICAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvZGxnLGRhOTA2My55YW1sICAgfCAgNyArKy0tCj4gIC4u
Li9iaW5kaW5ncy9tZmQvZ2F0ZXdvcmtzLWdzYy55YW1sICAgICAgICAgICB8ICA1ICsrLQo+ICAu
Li4vYmluZGluZ3MvbWZkL21heGltLG1heDE0NTc3LnlhbWwgICAgICAgICAgfCAgMSArCj4gIC4u
Li9iaW5kaW5ncy9tZmQvbWF4aW0sbWF4Nzc4NDMueWFtbCAgICAgICAgICB8ICAxICsKPiAgLi4u
L2JpbmRpbmdzL21mZC9yb2NrY2hpcCxyazgxNy55YW1sICAgICAgICAgIHwgIDIgKwo+ICAuLi4v
YmluZGluZ3MvbWZkL3NpbGVyZ3ksc3k3NjM2YS55YW1sICAgICAgICAgfCAgMSArCj4gIC4uLi9i
aW5kaW5ncy9tZmQvc3Qsc3RtMzItbHB0aW1lci55YW1sICAgICAgICB8ICA0ICsrCj4gIC4uLi9i
aW5kaW5ncy9tZmQvc3Qsc3RtMzItdGltZXJzLnlhbWwgICAgICAgICB8ICAzICsrCj4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG1meC55YW1sICAgICB8ICAxICsKPiAgLi4uL2Jp
bmRpbmdzL21mZC9zdGVyaWNzc29uLGFiODUwMC55YW1sICAgICAgIHwgMjIgKysrKysrKysrKwo+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvdGksdHBzNjUwODYueWFtbCAgfCAgMSArCj4g
IC4uLi9iaW5kaW5ncy9tZmQveC1wb3dlcnMsYXhwMTUyLnlhbWwgICAgICAgICB8ICAxICsKPiAg
MTUgZmlsZXMgY2hhbmdlZCwgMTAwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpXaGF0
IGFyZSB5b3VyIHBsYW5zIGZvciB0aGlzIHNldD8KCldhbnQgbWUgdG8gbWVyZ2UgaXQ/CgotLSAK
TGVlIEpvbmVzIFvmnY7nkLzmlq9dCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
