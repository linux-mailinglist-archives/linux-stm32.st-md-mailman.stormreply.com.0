Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D10B51003
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 09:54:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64AE3C3FACF;
	Wed, 10 Sep 2025 07:54:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3B3DC3FACE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 07:54:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 606EC44470;
 Wed, 10 Sep 2025 07:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFF3C4CEF5;
 Wed, 10 Sep 2025 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757490891;
 bh=/Cvlcl3lSVxIswV9jynJ/e4AYCtz89efpAEudugYMIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ByAqknhQxTz5AuwNFMa3NeXS+psWNlXu858IH8RhV5WRDRT6/Er16498NMAI/6bBD
 SsC6di1+qrYZKG0/JLFvcqTvMr778/sGlSuvjhc3v7KNFW/kHbl2CwMpRFR4Bu051l
 ErX7CASZW0ejiZAsqXt0gFlI0gWrH7YNL4Xmy/DMDRBbPry/DVhl/4pP5qqFKV8f2x
 h8yd10TqVJiygJy32AMSB5ilvaj42MMp/VVLc9xh6do1MDxS1tIxU07JPOTLpA805e
 e8Cp5j4A/PLS0IIY/yEHZyxPqkY8mah+LGTBZfNzP7ncfQCPQbt5Z5LJlbCiidHE0R
 kPE8/SWr9/cPQ==
Date: Wed, 10 Sep 2025 09:54:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <legoffic.clement@gmail.com>
Message-ID: <20250910-flat-raptor-of-temperance-5e8c7c@kuoka>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-5-ce082cc801b5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-5-ce082cc801b5@gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v6 05/20] dt-bindings: memory: factorise
 LPDDR props into SDRAM props
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

T24gVHVlLCBTZXAgMDksIDIwMjUgYXQgMTI6MTI6MTJQTSArMDIwMCwgQ2zDqW1lbnQgTGUgR29m
ZmljIHdyb3RlOgo+IEZyb206IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bm
b3NzLnN0LmNvbT4KPiAKPiBMUEREUiBhbmQgRERSIGJpbmRpbmdzIGFyZSBTRFJBTSB0eXBlcyBh
bmQgYXJlIGxpa2VseSB0byBzaGFyZSB0aGUgc2FtZQo+IHByb3BlcnRpZXMgKGF0IGxlYXN0IGZv
ciBkZW5zaXR5LCBpby13aWR0aCBhbmQgcmVnKS4KPiBUbyBhdm9pZCBiaW5kaW5ncyBkdXBsaWNh
dGlvbiwgZmFjdG9yaXNlIHRoZSBwcm9wZXJ0aWVzLgo+IAo+IFRoZSBjb21wYXRpYmxlIGRlc2Ny
aXB0aW9uIGhhcyBiZWVuIHVwZGF0ZWQgYmVjYXVzZSB0aGUgTVIgKE1vZGUKPiByZWdpc3RlcnMp
IHVzZWQgdG8gZ2V0IG1hbnVmYWN0dXJlciBJRCBhbmQgcmV2aXNpb24gSUQgYXJlIG5vdCBwcmVz
ZW50Cj4gaW4gY2FzZSBvZiBERFIuCj4gVGhvc2UgaW5mb3JtYXRpb24gc2hvdWxkIGJlIGluIGEg
U1BEIChTZXJpYWwgUHJlc2VuY2UgRGV0ZWN0KSBFRVBST00gaW4KPiBjYXNlIG9mIERJTU0gbW9k
dWxlIG9yIGFyZSBrbm93biBpbiBjYXNlIG9mIHNvbGRlcmVkIG1lbW9yeSBjaGlwcyBhcwo+IHRo
ZXkgYXJlIGluIHRoZSBkYXRhc2hlZXQgb2YgdGhlIG1lbW9yeSBjaGlwcy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+
CgpJcyB0aGlzIGVtYWlsIGRlZnVuY3Qgbm93LCB0aGF0IHlvdSBhZGQgc2Vjb25kIFNvQj8KCj4g
U2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWls
LmNvbT4KCkkgc3RpbGwgc2VlIGluIHRoaXMgcGF0Y2hzZXQgYXJvdW5kIDUgZGlmZmVyZW50IHN1
YnN5c3RlbXMuIE5vdGhpbmcgaW4KdGhlIGNvdmVyIGxldHRlciBleHBsYWlucyB0aGUgZGVwZW5k
ZW5jaWVzLCBzbyBncm91cGluZyBsb29rcyBsaWtlCmNvaW5jaWRlbmNlIGFuZCB5b3UganVzdCBt
YWtlIGl0IGRpZmZpY3VsdCBmb3IgbWFpbnRhaW5lcnMgZm9yIG5vCnJlYXNvbi4KClBsZWFzZSBv
cmdhbml6ZSB5b3VyIHBhdGNoc2V0cyBwZXIgc3Vic3lzdGVtcywgc2VlIHN1Ym1pdHRpbmcgcGF0
Y2hlcwpkb2MgZm9yIG1vcmUgZGV0YWlscy4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
