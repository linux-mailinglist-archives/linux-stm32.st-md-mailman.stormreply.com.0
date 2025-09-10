Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9D5B51013
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 09:57:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFC55C3FACE;
	Wed, 10 Sep 2025 07:57:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24314C35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 07:57:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 05FC54078A;
 Wed, 10 Sep 2025 07:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41744C4CEF0;
 Wed, 10 Sep 2025 07:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757491074;
 bh=6uVpYxLKgfz2XvbYZoJ8wzUbrjvZJR0Y4MBIqOJj0J0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eQ+7M+e8mrS/qUabUDxQGA+IrOlNrJ/W1e/kVNdL2rEOx9xwy5R0VZYrC5aKWmoN0
 CFlRAkOhoJl0/qGhK75yDnQ1nmMpzrHL05fQvr8Ex6EA1HFx2t3MRamt8EcGv0wzbE
 zsB8nSvKD+dQ7hyH6b2v/bs3POgOGyWqDgOlmRFbinttriUvWAUYF5hwLoVS5kUtI+
 c6/hrqv5mVWzzmHUaTwalsO5jeGyG9DS4AFuJQHLVYQK1D+gCZ3bZYqIdEXA5hj/Dk
 mJxUw5rUzCSLkV4Ayzz4Mi+U+N6J8JDprluIx8uja7fPPNfuE/9FvgKzGiPW1/OzV1
 6wGhQ70VBn9xw==
Date: Wed, 10 Sep 2025 09:57:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <legoffic.clement@gmail.com>
Message-ID: <20250910-encouraging-masterful-dodo-3d1f60@kuoka>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-12-ce082cc801b5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-12-ce082cc801b5@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-clk@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Julius Werner <jwerner@chromium.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v6 12/20] dt-bindings: perf: stm32:
 introduce DDRPERFM dt-bindings
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

T24gVHVlLCBTZXAgMDksIDIwMjUgYXQgMTI6MTI6MTlQTSArMDIwMCwgQ2zDqW1lbnQgTGUgR29m
ZmljIHdyb3RlOgo+IEZyb206IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bm
b3NzLnN0LmNvbT4KPiAKPiBERFJQRVJGTSBpcyB0aGUgRERSIFBlcmZvcm1hbmNlIE1vbml0b3Ig
ZW1iZWRkZWQgaW4gU1RNMzJNUFUgU29DLgo+IEl0IGFsbG93cyB0byBtb25pdG9yIEREUiBldmVu
dHMgdGhhdCBjb21lIGZyb20gdGhlIEREUiBDb250cm9sbGVyCj4gc3VjaCBhcyByZWFkIG9yIHdy
aXRlIGV2ZW50cy4KCkFsc286CgpBIG5pdCwgc3ViamVjdDogZHJvcCBzZWNvbmQvbGFzdCwgcmVk
dW5kYW50ICJkdC1iaW5kaW5ncyIuIFRoZQoiZHQtYmluZGluZ3MiIHByZWZpeCBpcyBhbHJlYWR5
IHN0YXRpbmcgdGhhdCB0aGVzZSBhcmUgYmluZGluZ3MuClNlZSBhbHNvOgpodHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC92Ni4xNy1yYzMvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0I0wxOAoKQmVzdCByZWdhcmRzLApL
cnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
