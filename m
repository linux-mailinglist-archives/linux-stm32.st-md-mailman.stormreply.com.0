Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3E6B5100B
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 09:57:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93D22C3FACE;
	Wed, 10 Sep 2025 07:57:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B37CAC35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 07:57:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 75AC5419A1;
 Wed, 10 Sep 2025 07:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F7AC4CEF0;
 Wed, 10 Sep 2025 07:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757491027;
 bh=9fjD2fNRSaM8UgWVZRkBtaZv1nqX5uwHyIlpPz0EWXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kaLZpnsmrHrGGLP+0KguzRFCRfaUyvd8cTnmNsdxhg0gWm2UTWQ6Uo+799KsWNSym
 CrhsRXZgc8VeqUDQ3XRRqKG6KXv3iR6Wf5CeDAZyZRbqRB5k/o5xfwXknqNEN9neoA
 VgLtVqNSaQmLc9iKjxB30OcWaDJKHvc2TCk64/46ZwBNAJOlwtrWPI7Fr2/arNJxwM
 ZCKIt0zrgNySUkCx5ycX5hyuNwSEF1PWfMyln4YO+5Vxg3qO5YVxDOe+z24g8ksHOz
 iT354QBmykiQdgu59sVJGEwJFmmv+oImcIKDNKRvr67QwsclSwr4QjHX8wyL6yDlQ0
 l4Rr09eDm7cZA==
Date: Wed, 10 Sep 2025 09:57:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <legoffic.clement@gmail.com>
Message-ID: <20250910-adamant-hospitable-firefly-ae30c5@kuoka>
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
aXRlIGV2ZW50cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1l
bnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29m
ZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvcGVyZi9zdCxzdG0zMi1kZHItcG11LnlhbWwgfCA5NCArKysrKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5NCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wZXJmL3N0LHN0bTMyLWRkci1w
bXUueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wZXJmL3N0LHN0bTMy
LWRkci1wbXUueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAw
Li4xZDk3ODYxZTNkNDQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sCj4gQEAgLTAsMCArMSw5
NCBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0y
LUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK21haW50YWluZXJz
Ogo+ICsgIC0gQ2zDqW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4K
PiArCj4gK3RpdGxlOiBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgRERSIFBlcmZvcm1hbmNlIE1v
bml0b3IgKEREUlBFUkZNKQo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsg
ICAgb25lT2Y6Cj4gKyAgICAgIC0gaXRlbXM6Cj4gKyAgICAgICAgICAtIGNvbnN0OiBzdCxzdG0z
Mm1wMTMxLWRkci1wbXUKPiArICAgICAgLSBpdGVtczoKPiArICAgICAgICAgIC0gZW51bToKPiAr
ICAgICAgICAgICAgICAtIHN0LHN0bTMybXAxNTEtZGRyLXBtdQo+ICsgICAgICAgICAgLSBjb25z
dDogc3Qsc3RtMzJtcDEzMS1kZHItcG11Cj4gKyAgICAgIC0gaXRlbXM6Cj4gKyAgICAgICAgICAt
IGNvbnN0OiBzdCxzdG0zMm1wMjUxLWRkci1wbXUKCllvdSBkaWQgbm90IGltcGxlbWVudCBSb2In
cyBjb21tZW50LgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
