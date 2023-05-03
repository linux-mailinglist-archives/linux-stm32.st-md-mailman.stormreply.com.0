Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8AA6F5651
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 12:39:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BEBCC6A60C;
	Wed,  3 May 2023 10:39:22 +0000 (UTC)
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41078C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 10:39:21 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 0B6772B069AF;
 Wed,  3 May 2023 06:39:16 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Wed, 03 May 2023 06:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1683110356; x=1683117556; bh=KFS31okKAQr6a5v2aX2V60/5Oir48XmaFQI
 kt18Yq3s=; b=cCNN8RO8bpidd+UJ0C9CSxmE2ngQi1eKpYDtrZ9AfJAY6TIaz13
 EmGcasdJ7/bdeHe+4ZxWAfgDRZDcpl205W4uAsyflcMpm7RzKXD8rCGxrAmhXpm+
 PCeZ1wagXERCNPHrZBrne1hUi7JO+8vnwjo7kiOl5T9Xq5BEWuxCCsr+8dcbmVLj
 q+XJrDl1Pu5hmzTa09GWU8P6qcra38bOTHxoMmdQ/lKD3IANqed6cQjJAG1J8RYr
 egEn8IJVZXe1OgZjTU2Nk3G5qVKeYylawACz+HYvM8hn4EmX0uUuRV1u3Tq/0zFx
 ie02zZD4EWP/DkbAuskHq1k33K2j/7XQCMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683110356; x=1683117556; bh=KFS31okKAQr6a5v2aX2V60/5Oir48XmaFQI
 kt18Yq3s=; b=D5Zk9chIXEUE5emL/CiVs88rJWLLH60Bm0GXkiiaFvA8qgE19WR
 GzE8bCNj6o+6QctI7/9IPXBW37tE3DC4iP+QipUVHJj9l7d1P+Wy7ee74WKE22k6
 hNikSyF3CVUiHKorJLPFqTJ9qThhfiBr8nGcxcfbRMRHfuZoxq92DIwckGxvV+Og
 WUmuFOSlIQUKMhPiiyR2dZvW+Aaz9529A7PeI9YNC3vgUs/lSx23D6iGwCd/L8Sy
 hbDrgfc79i85YURrk415I3trHkE7rYEK0B+dqSXMTG67z/MdANnofW0F9Ju7c9gw
 wqeI4aNRnMMtaRII6LULrT6GTsS/HftIeLw==
X-ME-Sender: <xms:1DlSZB7HiFiKBkbDk9Fv7gPm0PBlQwsViA2U0jrJ-zAvaGGXygjRfw>
 <xme:1DlSZO7Xv3BGjOkExLnmK9KmCr--oWstES3EN49SY5iNy2GzZvlcZGCBKUJPghkrI
 QHcpC3F6G8-6XDxIKM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvkedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
 gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:1DlSZIccd8i4Vx2LA8c2HM7NFtzw7mZtVBcV3SKmH2AQM6JbCF_CHQ>
 <xmx:1DlSZKLbrwHphpHQEODq666D9lh730jAC6AHGXPodgu0ZEkePvTEhA>
 <xmx:1DlSZFLUz-hUAS40dmSCJktAgcIF6Zhaiq8T6Xf-Uy8e1qyU5yr_Tg>
 <xmx:1DlSZAIqlEfAPQg-BumeZvu2_KmGcwHX44l_oJiCgrykutWtz2oOTfYnqQo>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E9F69B60086; Wed,  3 May 2023 06:39:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <5e318b02-8f33-4e2d-a956-5660e1c60619@app.fastmail.com>
In-Reply-To: <CAL_JsqJXd_EpOQwwNEAn25mzFfkhEvqzur6ui5Ca+dbt2kA8-Q@mail.gmail.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <bce93654-fc36-3d12-282d-76fafb8f51ce@linaro.org>
 <CAL_JsqJXd_EpOQwwNEAn25mzFfkhEvqzur6ui5Ca+dbt2kA8-Q@mail.gmail.com>
Date: Wed, 03 May 2023 12:38:55 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh+dt@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

T24gV2VkLCBNYXkgMywgMjAyMywgYXQgMDM6MTcsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFR1
ZSwgTWF5IDIsIDIwMjMgYXQgNTo1MuKAr1BNIERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5
c2hrb3ZAbGluYXJvLm9yZz4gd3JvdGU6Cj4+IE9uIDAyLzA1LzIwMjMgMjI6NDAsIFJvYiBIZXJy
aW5nIHdyb3RlOgo+PiA+ICAgICAgJ2JlcmxpbicgOiAnYmVybGluJywKPj4gPiAgICAgICdweGEy
JyA6ICdweGEnLAo+PiA+ICAgICAgJ3B4YTMnIDogJ3B4YScsCj4+ID4gICAgICAncHhhJyA6ICdt
YXJ2ZWxsJywKPj4KPj4gSSdkIHF1ZXN0aW9uIGlmIGl0IG1ha2VzIHNlbnNlIHRvIHNwbGl0IHRo
ZSBweGEgbGluZS4gWWVzLCBpdCB3YXMgc29sZAo+PiBieSBJbnRlbCB0byBNYXJ2ZWxsLCBidXQg
SUlSQyB0aGUgZGV2aWNlcyBzdGlsbCBoYWQgc29tZSBpbmhlcml0YW5jZS4KPj4gU28sIGlmIHdl
IGhhdmUgdGhlICdweGEnIHN1YmRpciwgSSdkIG1vdmUgTWFydmVsbCBQWEFzIHRvIHRoYXQgZGly
IHRvby4KPgo+IEkgdGhpbmsgSSBwcm9iYWJseSBzcGxpdCBpdCBiZWNhdXNlIGl0IHdhcyBkaWZm
ZXJlbnQgbWFpbnRhaW5lcnMuCj4gVGhvdWdoIGl0IGRvZXNuJ3QgbG9vayBsaWtlIHB4YTE2OCBv
ciBweGE5MTAgaGF2ZSBhbnkgbWFpbnRhaW5lci4gVGhleQo+IGFyZSBhIG1peHR1cmUgb2YgcHhh
IGFuZCBtbXAgSSB0aGluay4KCkkgdGhpbmsgdGhlIG9yaWdpbmFsIHNwbGl0IGhlcmUgaXMgcHJv
YmFibHkgdGhlIGJlc3Qgd2UgY2FuIGRvLApidXQgdGhlcmUgaXMgbm8gZ29vZCB3YXkgdG8gZG8g
aXQgYmVjYXVzZSBvZiB0aGUgY29uZnVzaW5nIG5hbWluZwphbmQgdGhlIHByb2JsZW0gdGhhdCB0
aGVyZSBpcyBubyBjbGVhciBsaW5lIGJldHdlZW4gcHhhIGFuZCBtbXAuCkFzIGZhciBhcyBJIGNh
biB0ZWxsLCB0aGUgcmVsZWFzZSB0aW1lbGluZSB3YXM6CgpJbnRlbCBweGEyeHggKG1hY2gtcHhh
LCB4c2NhbGUsIHN0aWxsIGV4aXN0cykKSW50ZWwgcHhhM3h4IChtYWNoLXB4YSwgeHNjYWxlLCBz
dGlsbCBleGlzdHMpCkludGVsIHB4YTkweCAobmV2ZXIgbWVyZ2VkKQpNYXJ2ZWxsIHB4YTkzeCAo
bWFjaC1weGEsIHhzY2FsZSwgcmVtb3ZlZCBpbiBMaW51eC02LjMsIG5vIERUKQpNYXJ2ZWxsIHB4
YTkyeCAobmV2ZXIgbWVyZ2VkKQpNYXJ2ZWxsIHB4YTkxeCAobWFjaC1tbXAsIHBqMSwgc3RpbGwg
ZXhpc3RzKQpNYXJ2ZWxsIHB4YTE2OCAobWFjaC1tbXAsIHBqMSwgc3RpbGwgZXhpc3RzKQpNYXJ2
ZWxsIHB4YTk1eCAobWFjaC1weGEsIHBqNCwgbG9uZyBnb25lKQpNYXJ2ZWxsIHB4YTY4OCAobWFj
aC1tbXAsIHBqNCwga25vd24gYXMgbW1wMikKClNvIHdpdGggcHhhOTN4IG91dCBvZiB0aGUgcGlj
dHVyZSwgd2UgY2FuIHNpbXBsaWZ5IGl0IGFzIHVzaW5nCidweGEnIGFzIHRoZSBuYW1lIGZvciBh
bGwgdGhlIGFib3ZlIGNoaXBzIHdpdGggYW4gSW50ZWwgWFNjYWxlCmNvcmUsIGFuZCAnbWFydmVs
bCcgZm9yIGFsbCB0aGUgb3RoZXIgb25lcyB0aGF0IGhhdmUgYSBNYXJ2ZWxsCmNvcmUgYW5kIGV4
aXN0IGluIG1hY2gtbW1wLgoKICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
