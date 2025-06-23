Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 324A0AE3C77
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 12:32:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE41FC3F95A;
	Mon, 23 Jun 2025 10:32:27 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 680CFC3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 10:32:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7474360EDF;
 Mon, 23 Jun 2025 10:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07916C4CEEA;
 Mon, 23 Jun 2025 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750674745;
 bh=EGeyXFdsfxr7KZpT6G79mftHlRMgrE71/+ChmGLxj2A=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=b/otWl7mH6gUD6120u91A4shQyhwDjQK/XF57IoyHx/pvO+4w3pCfYB8NNfroQzxv
 dgcukgYvgsY1ds1YaeKUOrC6Zs3ly4TcxwiX8n9eQkHBm5V+FgnS4ZuiznXEj7nI84
 xrnua+iSQPdPAXWvw1ZS0nftkw+8zQAPS99gLXvovcJbHkNCwTEVEJxVPO9dMb8x88
 iJJDxLAKEeyTncO6PqV7f/0L6y8VJUOE5+QpnSW9piE/HSs6r3fu1GI+3SQGwRJjfW
 TjvlC21dh2u1zGaPPj8habmBy8SXpKSa703cbJQ2FmClzEXYaTtY0TcyfSVo5Zahqv
 Bp6w9Auijcd2g==
Date: Mon, 23 Jun 2025 05:32:24 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250623-ddrperfm-upstream-v1-2-7dffff168090@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
 <20250623-ddrperfm-upstream-v1-2-7dffff168090@foss.st.com>
Message-Id: <175067474413.2253758.6430293849129423927.robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-doc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/13] dt-bindings: stm32: stm32mp25: add
 `access-controller-cell` property
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

Ck9uIE1vbiwgMjMgSnVuIDIwMjUgMTE6Mjc6MDcgKzAyMDAsIENsw6ltZW50IExlIEdvZmZpYyB3
cm90ZToKPiBSQ0MgaXMgYWJsZSB0byBjaGVjayB0aGUgYXZhaWxhYmlsaXR5IG9mIGEgY2xvY2su
Cj4gQWxsb3cgdG8gcXVlcnkgdGhlIFJDQyB3aXRoIGEgZmlyZXdhbGwgSUQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29t
Pgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc3Qsc3Rt
MzJtcDI1LXJjYy55YW1sIHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQo+IAoKTXkgYm90IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hl
Y2snIG9uIHlvdXIgcGF0Y2g6Cgp5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6CgpkdHNjaGVtYS9k
dGMgd2FybmluZ3MvZXJyb3JzOgovYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjUtcmNj
LmV4YW1wbGUuZHRiOiBjbG9jay1jb250cm9sbGVyQDQ0MjAwMDAwIChzdCxzdG0zMm1wMjUtcmNj
KTogJyNhY2Nlc3MtY29udHJvbGxlci1jZWxscycgaXMgYSByZXF1aXJlZCBwcm9wZXJ0eQoJZnJv
bSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9jbG9jay9zdCxzdG0z
Mm1wMjUtcmNjLnlhbWwjCgpkb2MgcmVmZXJlbmNlIGVycm9ycyAobWFrZSByZWZjaGVja2RvY3Mp
OgoKU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZpY2V0cmVlLWJp
bmRpbmdzL3BhdGNoLzIwMjUwNjIzLWRkcnBlcmZtLXVwc3RyZWFtLXYxLTItN2RmZmZmMTY4MDkw
QGZvc3Muc3QuY29tCgpUaGUgYmFzZSBmb3IgdGhlIHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIGxh
dGVzdCByYzEuIEEgZGlmZmVyZW50IGRlcGVuZGVuY3kKc2hvdWxkIGJlIG5vdGVkIGluICp0aGlz
KiBwYXRjaC4KCklmIHlvdSBhbHJlYWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQg
ZGlkbid0IHNlZSB0aGUgYWJvdmUKZXJyb3IocyksIHRoZW4gbWFrZSBzdXJlICd5YW1sbGludCcg
aXMgaW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMgdXAgdG8KZGF0ZToKCnBpcDMgaW5zdGFsbCBk
dHNjaGVtYSAtLXVwZ3JhZGUKClBsZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0IGFmdGVyIHJ1bm5p
bmcgdGhlIGFib3ZlIGNvbW1hbmQgeW91cnNlbGYuIE5vdGUKdGhhdCBEVF9TQ0hFTUFfRklMRVMg
Y2FuIGJlIHNldCB0byB5b3VyIHNjaGVtYSBmaWxlIHRvIHNwZWVkIHVwIGNoZWNraW5nCnlvdXIg
c2NoZW1hLiBIb3dldmVyLCBpdCBtdXN0IGJlIHVuc2V0IHRvIHRlc3QgYWxsIGV4YW1wbGVzIHdp
dGggeW91ciBzY2hlbWEuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
