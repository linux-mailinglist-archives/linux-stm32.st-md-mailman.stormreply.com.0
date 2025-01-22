Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17821A18D2A
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Jan 2025 08:55:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0842C78F75;
	Wed, 22 Jan 2025 07:55:05 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F9CEC78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2025 07:54:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A2B99A41BCC;
 Wed, 22 Jan 2025 07:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEB8C4CED6;
 Wed, 22 Jan 2025 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737532497;
 bh=DS6LctAEbb86wdU+xIObFSbsxNIQXD0zFVuUopbBhSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PulrbTE6g2iDQO3tZkVzV6r9hofz+rdLvtPZoXz/HqrSx8WreicvBiya25B2KD2XV
 8QjKtbeqVyF8EuKFyjQzlqP3OflmIEuBWBi1a2zXerqtfstshGa63g5XsGxlKpI5bA
 4JX3y6Zc5vTD6tGYRchqvSCMRMa3KwbFSdoEQwIBSgb1CG00rWRAL0LmZbfTzLqL5Z
 gTnwg4R5Iya1CoOYWCz5pvBxsA0T4OzdlMw0L7kkHekJS+wsJIjN0hIxyGak2PZ7Tu
 wQ783czlWRQ7c+CG614lqSxuX4uP8X9+DLeGG7tl/lxeO+XTEcP+GXbCVwu2dcbgc7
 cS8OB41qVUQYQ==
Date: Wed, 22 Jan 2025 08:54:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <20250122-thoughtful-starfish-of-grandeur-ee7919@krzk-bin>
References: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
 <20250121-lxa-fairytux-v3-2-8d42d7d232fb@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250121-lxa-fairytux-v3-2-8d42d7d232fb@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH stm32-next v3 2/2] ARM: dts: stm32:
 lxa-fairytux2: add Linux Automation GmbH FairyTux 2
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

T24gVHVlLCBKYW4gMjEsIDIwMjUgYXQgMTI6MTQ6MDZQTSArMDEwMCwgTWFyYyBLbGVpbmUtQnVk
ZGUgd3JvdGU6Cj4gRnJvbTogTGVvbmFyZCBHw7ZocnMgPGwuZ29laHJzQHBlbmd1dHJvbml4LmRl
Pgo+IAo+IFRoZSBMaW51eCBBdXRvbWF0aW9uIEdtYkggRmFpcnlUdXgyIGlzIGEgc21hbGwgTGlu
dXggZGV2aWNlIGJhc2VkIG9uCj4gYW4gT2N0YXZvIFN5c3RlbXMgT1NEMzJNUDE1M2MgU2lQLCB0
aGF0IG9jY3VwaWVzIGp1c3QgdHdvIHNsb3RzIG9uIGEKPiBESU4gcmFpbC4KPiAKPiBUaGUgZGV2
aWNlIGNvbnRhaW5zIGFuIGVNTUMgZm9yIHN0b3JhZ2UsIGEgZ2lnYWJpdCBFdGhlcm5ldAo+IGNv
bm5lY3Rpb24sIGEgQ0FOIGJ1cyBhbmQgYSBSUzQ4NSB0cmFuc2NlaXZlci4KPiAKPiBBZGQgc3Vw
cG9ydCBmb3IgdGhlIGx4YS1mYWlyeXR1eDIgZ2VuZXJhdGlvbiAxIGFuZCAyIGJvYXJkcyBiYXNl
ZCBvbgo+IHRoZSBTVE0zMk1QMTUzYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMZW9uYXJkIEfDtmhy
cyA8bC5nb2VocnNAcGVuZ3V0cm9uaXguZGU+Cj4gU2lnbmVkLW9mZi1ieTogTWFyYyBLbGVpbmUt
QnVkZGUgPG1rbEBwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qv
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwo+ICAuLi4vYm9vdC9kdHMvc3Qv
c3RtMzJtcDE1M2MtbHhhLWZhaXJ5dHV4Mi1nZW4xLmR0cyB8IDEwMyArKysrKysKPiAgLi4uL2Jv
b3QvZHRzL3N0L3N0bTMybXAxNTNjLWx4YS1mYWlyeXR1eDItZ2VuMi5kdHMgfCAxNDcgKysrKysr
KysKPiAgLi4uL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUzYy1seGEtZmFpcnl0dXgyLmR0c2kg
fCAzOTcgKysrKysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgNjQ5IGluc2Vy
dGlvbnMoKykKClJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmc+CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
