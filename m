Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AEAA7118C
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Mar 2025 08:41:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8AB9C78F7F;
	Wed, 26 Mar 2025 07:41:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FE48C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 07:41:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4E6A66112F;
 Wed, 26 Mar 2025 07:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B77C4CEE2;
 Wed, 26 Mar 2025 07:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742974916;
 bh=rKOd4j1t74rlaXbctW4uta67o0YN3LITaSJsnrWbc38=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TIxxlW39PQQqRFZ4v6Bj1eF/al7IN+zt+cDy8kyspl19eOj5XLtOWj7htTrZvJi7N
 aE/lZxGA5EszkpdfxtD7k11lkvQr0g1/+J5jyoSLYKE0SxCLAOgIqXCMc7PrGMHnyB
 yt8cwzZlBn5XrPmDoDGZCsZyNlEMWIc4778LGMVRPvPvxSe0jFUTZbqNgor+n4RRMB
 fSnHnc767b/nUtVW34ZGg6ZuXCh51oo0Zh/154dZ4KqAcKearMCt2mngjjhBSDBT/q
 1wnNxzRgObQErJrhcEo9fAXP7ViDzhvuBamqptBTFLN1m9/eaXt1Ncmd1td6FUaKmC
 r48TymtjCPb8A==
Date: Wed, 26 Mar 2025 08:41:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Message-ID: <20250326-lumpy-spry-alpaca-ce087c@krzk-bin>
References: <20250325110409.2323611-1-goran.radni@gmail.com>
 <20250325110409.2323611-4-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250325110409.2323611-4-goran.radni@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <gradenovic@ultratronik.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?utf-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] ARM: dts: stm32: add initial
 support for stm32mp157-ultra-fly-sbc board
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

T24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgMTI6MDQ6MDdQTSArMDEwMCwgR29yYW4gUmHEkWVub3Zp
xIcgd3JvdGU6Cj4gRnJvbTogR29yYW4gUmHEkWVub3ZpxIcgPGdyYWRlbm92aWNAdWx0cmF0cm9u
aWsuZGU+Cj4gCj4gQWRkIHN1cHBvcnQgZm9yIFVsdHJhdHJvbmlrJ3Mgc3RtMzJtcDE1N2MgZmx5
IGJvYXJkLiBUaGlzIGJvYXJkIGVtYmVkcwo+IGEgU1RNMzJNUDE1N2MgU09DIGFuZCAxR0Igb2Yg
RERSMy4gU2V2ZXJhbCBjb25uZWN0aW9ucyBhcmUgYXZhaWxhYmxlIG9uCj4gdGhpcyBib2FyZHM6
IDIqVVNCMi4wLCAxKlVTQjIuMCBNaW5pVVNCLCBEZWJ1ZyBVQVJULCAxKlVBUlQsIDEqVVNBUlQs
Cj4gU0RjYXJkLCBSSjQ1LCAuLi4KPiAKPiBUaGlzIHBhdGNoIGVuYWJsZXMgYmFzaWMgc3VwcG9y
dCBmb3IgYSBrZXJuZWwgYm9vdCAtIFNELWNhcmQgb3IgZU1NQy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBHb3JhbiBSYcSRZW5vdmnEhyA8Z29yYW4ucmFkbmlAZ21haWwuY29tPgoKQWxsIHBhdGNoZXMg
c2VlbSB0byBoYXZlIHNhbWUgaXNzdWUuLi4uCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
