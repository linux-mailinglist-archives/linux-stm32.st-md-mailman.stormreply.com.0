Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB59B05499
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 10:19:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 809B6C3F933;
	Tue, 15 Jul 2025 08:19:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64D11C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 08:19:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 06F0A5C5BB0;
 Tue, 15 Jul 2025 08:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24862C4CEE3;
 Tue, 15 Jul 2025 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752567593;
 bh=BM4P1drWzjMjfg/pk0Xn1FWtYJygertGpkbq/ASGuqg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A0m7zk3C0jSevJgK6jHj+8KsagqEKqsohNFNjyxuUufAK0FsT7yJNCNpaFOU4qIx9
 u5U9AJpnkIbaI8iC8Dg4oZAecD5oub8zKKyVtM16y5Qs2D5okcKbPp5PQ8IKt9Mnrd
 FUFZCnQ4p6IvkvCBWBTUgxF3w+A3Ri2VqbA0DuzPsHnsN6kywA88NMDdZGek85OLA1
 yygBzAIe+X6glhbwR0mkYgosi0w9Rzx8T88TxgNpPWzn8IdAhtJxkJopO2XixHkdwu
 tMo8uetR18UQcRZ8q52L5tdNT1W3eE/qPrDItMRTCW13sGPEVEo0ID28KDRWTsRwqn
 ayjlkQsVSjg4g==
Date: Tue, 15 Jul 2025 10:19:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <20250715-belligerent-savvy-marten-fbd1a5@krzk-bin>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-2-cdece720348f@foss.st.com>
 <20250715031717.GA4144523-robh@kernel.org>
 <765eccdc-7d51-42c6-bcba-07813077fc1d@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <765eccdc-7d51-42c6-bcba-07813077fc1d@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, linux-doc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-perf-users@vger.kernel.org, Le Goffic <legoffic.clement@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/16] dt-bindings: stm32: stm32mp25:
 add `access-controller-cell` property
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

T24gVHVlLCBKdWwgMTUsIDIwMjUgYXQgMDk6Mzc6MDBBTSArMDIwMCwgR2F0aWVuIENIRVZBTExJ
RVIgd3JvdGU6Cj4gSGVsbG8gUm9iLAo+IAo+IE9uIDcvMTUvMjUgMDU6MTcsIFJvYiBIZXJyaW5n
IHdyb3RlOgo+ID4gT24gRnJpLCBKdWwgMTEsIDIwMjUgYXQgMDQ6NDg6NTRQTSArMDIwMCwgQ2zD
qW1lbnQgTGUgR29mZmljIHdyb3RlOgo+ID4gPiBSQ0MgaXMgYWJsZSB0byBjaGVjayB0aGUgYXZh
aWxhYmlsaXR5IG9mIGEgY2xvY2suCj4gPiA+IEFsbG93IHRvIHF1ZXJ5IHRoZSBSQ0Mgd2l0aCBh
IGZpcmV3YWxsIElELgo+ID4gCj4gPiBJZiBpdCBpcyB0aWVkIHRvIGEgY2xvY2ssIGRvIHdlIG5l
ZWQgYW5vdGhlciBwcm92aWRlcj8gV2UgaGF2ZSB0aGUKPiA+ICJwcm90ZWN0ZWQgY2xvY2tzIiB0
aGluZywgYnV0IHRoYXQgbWlnaHQgYmUgYSBiaXQgZGlmZmVyZW50Lgo+ID4gCj4gCj4gSSBjb3Vs
ZG4ndCBmaW5kIGFueSByZWZlcmVuY2UgdG8gInByb3RlY3RlZC1jbG9ja3MiIG91dHNpZGUgb2Yg
cWNvbQo+IHJlbGF0ZWQgY29kZSwgaXMgdGhlcmUgYSBkb2N1bWVudGF0aW9uPyAoQ291bGRuJ3Qg
ZmluZCBpdCBpbgo+IGNsb2Nrcy55YW1sKS4KCkh1aD8gcHJvdGVjdGVkLWNsb2NrcyBpcyBpbiBj
bG9ja3MueWFtbC4uLiBJdCBpcyB0aGVyZSB3aXRoIGFuIGV4cGxhbmF0aW9uLgoKQmVzdCByZWdh
cmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
