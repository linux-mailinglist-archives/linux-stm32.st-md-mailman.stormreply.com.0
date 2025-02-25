Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A77A43FEA
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 14:01:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5184C78F7D;
	Tue, 25 Feb 2025 13:01:35 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 167FEC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 13:01:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 714B561248;
 Tue, 25 Feb 2025 13:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BECC4CEDD;
 Tue, 25 Feb 2025 13:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740488492;
 bh=Wre+7TIAdIAjgCV/VfB9/8j835OKXCFH6jzeJStgQ90=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UTvKnFrOm+rZzOfDvIL4G00yiS2ehq8If6jU34ZVXeObXVBjpE+lxO86yNLsam5gP
 KqaUa7rdVWWplwTGan7LIcOQIi2CygjvMnsud/JAWDIl0qATrie56UwA7REnmDoPKp
 l5IiLyRA/kw098HOqdMOS0qloSfjKIW0czXpDnELBZp5/Y+QoKh4V6a1fZQ/R217UJ
 pv3M34ryurGa79QdK+UUHShGAjjcxErVc3GllJwdMjsoEWtcPdBy4Nq9KoIXeiBhyi
 qJtALB+/J3OjsjEJ2yKaeGTQbrquItr4JEoScFunKe7AgC7SDhnpNgEJvpR6V0cn8H
 2yH1yUyeKf40g==
Message-ID: <f17eadf3-eb2d-470d-ad77-909f00584d44@kernel.org>
Date: Tue, 25 Feb 2025 14:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-1-9d049c65330a@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250225-hdp-upstream-v1-1-9d049c65330a@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/9] dt-bindings: pinctrl: stm32: Add HDP
 includes for stm32mp platforms
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

T24gMjUvMDIvMjAyNSAwOTo0OCwgQ2zDqW1lbnQgTGUgR29mZmljIHdyb3RlOgo+IEVhY2ggZmls
ZSBpbnRyb2R1Y2VzIGhlbHBlcnMgdG8gY2hvb3NlIHRoZSBzaWduYWwgdG8gbW9uaXRvciB0aHJv
dWdoIHRoZQo+IEhEUCBwaW4uCj4gU2lnbmFscyBhcmUgZGlmZmVyZW50IGZvciBlYWNoIHBsYXRm
b3Jtczogc3RtMzJtcDEzLCBzdG0zMm1wMTUsIHN0bTMybXAyNS4KCkhlYWRlcnMgYXJlIHBhcnQg
b2YgYmluZGluZ3MgY29tbWl0LCBhc3N1bWluZyB0aGlzIHN0YXlzLi4uCgoKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+
Cj4gLS0tCj4gIGluY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9zdG0zMm1wMTMtaGRwLmggfCAx
MzAgKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL3BpbmN0
cmwvc3RtMzJtcDE1LWhkcC5oIHwgMTE2ICsrKysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVk
ZS9kdC1iaW5kaW5ncy9waW5jdHJsL3N0bTMybXAyNS1oZHAuaCB8IDE0NCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzkwIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL3N0bTMybXAxMy1oZHAu
aCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9zdG0zMm1wMTMtaGRwLmgKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uYTM0ODdlNzAwMTQzCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9zdG0zMm1wMTMtaGRw
LmgKPiBAQCAtMCwwICsxLDEzMCBAQAo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMy1DbGF1c2UpICovCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoQykg
U1RNaWNyb2VsZWN0cm9uaWNzIDIwMjUgLSBBbGwgUmlnaHRzIFJlc2VydmVkCj4gKyAqIEF1dGhv
cjogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPiBmb3Ig
U1RNaWNyb2VsZWN0cm9uaWNzLgo+ICsgKi8KPiArCj4gKyNpZm5kZWYgX0RUX0JJTkRJTkdTX1NU
TTMyTVAxM19IRFBfSAo+ICsjZGVmaW5lIF9EVF9CSU5ESU5HU19TVE0zMk1QMTNfSERQX0gKPiAr
Cj4gKy8qIGRlZmluZSBhIG1hY3JvIGZvciBlYWNoIGZ1bmN0aW9uIGEgSERQIHBpbiBjYW4gdHJh
bnNtaXQgKi8KPiArI2RlZmluZSBIRFAwX1BXUl9QV1JXQUtFX1NZUwkJCSAiMCIKCgpXaHkgdGhp
cyBpcyBhIHN0cmluZyBub3QgYSBudW1iZXI/CgpXaGVyZSBpcyBpdCB1c2VkPyBJIGRvbid0IHNl
ZSB1c2FnZSBpbiB0aGUgZHJpdmVyLCBzbyB0aGlzIGRvZXMgbm90IGxvb2sKbGlrZSBiaW5kaW5n
IChhbmQgRFRTIGlzIG5vdCBhIGRyaXZlcikuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
