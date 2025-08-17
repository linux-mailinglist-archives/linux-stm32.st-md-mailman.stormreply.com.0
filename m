Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD70B291F9
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Aug 2025 09:19:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16F9AC32E92;
	Sun, 17 Aug 2025 07:19:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7B76C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Aug 2025 07:19:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 609795C05E4;
 Sun, 17 Aug 2025 07:19:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CD7C4CEEB;
 Sun, 17 Aug 2025 07:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755415151;
 bh=JFDiGM0BVBryvFA/mMw/si31ekZeLVsvinEiadWqIdM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WIzZcZhrGmrVNBZxq2Gcv1VEeQrnro/YDTiryCPMd6mt1e64BabAxeKsbS0uHeo22
 Ny5/52BqNnV3tDlTDzpYQfOfc6YSXBJ2m4dxny6LtkDM4BgUo7zFPkSjAQM2ncRVQO
 W/p6VvaqCd+euTgxH7EQHRrvbST1sIfzqGfigtVABMstAI/Xok1w6kzPkQep4yWvPx
 mqpK7uToLeuiWm+OmFl8f7rR1rDUukrOlxFp/kUL+lvqCHmCcwl/2aHxBzkWDVDUx+
 Mq6IIMJFyRL6YM606LS+MtHiYWjlEarzzfrm4Mu3xBE5o206ysYn3ZpmmqO30aCh65
 gXqlZzu27L3Fg==
Message-ID: <fb5083ff-4bee-4a0f-8774-54b492cd9a6d@kernel.org>
Date: Sun, 17 Aug 2025 09:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
 <20250730211151.GA1749004-robh@kernel.org>
 <da8578ae-3f79-4082-b0fb-760553004c93@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <da8578ae-3f79-4082-b0fb-760553004c93@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-doc@vger.kernel.org, linux-clk@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-perf-users@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 06/20] dt-bindings: memory: introduce
	DDR4
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

T24gMTQvMDgvMjAyNSAxNjo0MiwgQ2zDqW1lbnQgTGUgR29mZmljIHdyb3RlOgo+IEhpIFJvYiwK
PiAKPiBPbiAzMC8wNy8yMDI1IDIzOjExLCBSb2IgSGVycmluZyB3cm90ZToKPj4gT24gTW9uLCBK
dWwgMjgsIDIwMjUgYXQgMDU6Mjk6MzdQTSArMDIwMCwgQ2zDqW1lbnQgTGUgR29mZmljIHdyb3Rl
Ogo+Pj4gSW50cm9kdWNlIEpFREVDIGNvbXBsaWFudCBERFIgYmluZGluZ3MsIHRoYXQgdXNlIG5l
dyBtZW1vcnktcHJvcHMgYmluZGluZy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBM
ZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4+PiAtLS0KPj4+ICAgLi4u
L21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsZGRyNC55YW1sICAgICAgICAgfCAzNCArKysr
KysrKysrKysrKysrKysrKysrCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCsp
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGRkcjQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvZGRyL2plZGVjLGRkcjQueWFtbAo+
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjQ1NzA2NmEy
ZjhiCj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL2Rkci9qZWRlYyxkZHI0LnlhbWwKPj4+IEBAIC0w
LDAgKzEsMzQgQEAKPj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZSkKPj4+ICslWUFNTCAxLjIKPj4+ICstLS0KPj4+ICskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsZGRy
NC55YW1sIwo+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMv
Y29yZS55YW1sIwo+Pj4gKwo+Pj4gK3RpdGxlOiBERFIzIFNEUkFNIGNvbXBsaWFudCB0byBKRURF
QyBKRVNENzktNEQKPj4+ICsKPj4+ICttYWludGFpbmVyczoKPj4+ICsgIC0gS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+Pj4gKwo+Pj4gK2FsbE9mOgo+Pj4gKyAgLSAkcmVm
OiBqZWRlYyxzZHJhbS1wcm9wcy55YW1sIwo+Pj4gKwo+Pj4gK3Byb3BlcnRpZXM6Cj4+PiArICBj
b21wYXRpYmxlOgo+Pj4gKyAgICBpdGVtczoKPj4+ICsgICAgICAtIHBhdHRlcm46ICJeZGRyNC1b
MC05YS1mXXsyfSxbMC05YS1mXXsxfSQiCj4+Cj4+IFNob3VsZG4ndCB0aGlzIGJlICdqZWRlYyxk
ZHI0LS4uLicKPiAKPiBUaGF0J3Mgbm90IHRoZSBjYXNlIGZvciBscGRkciBiaW5kaW5ncywgSSB3
YW50ZWQgYm90aCBscGRkciBhbmQgZGRyIAo+IGJpbmRpbmdzIHRvIGJlIHNpbWlsYXIgYnV0IHRo
aXMgY2FuIGNoYW5nZS4KCkZvciBMUEREUiBKdWxpdXMgaW50cm9kdWNlZCBpbiBjb21taXQgNjg2
ZmU2M2IyMjgwICgiZHQtYmluZGluZ3M6Cm1lbW9yeTogQWRkIG51bWVyaWMgTFBERFIgY29tcGF0
aWJsZSBzdHJpbmcgdmFyaWFudCIpIGRkcjQtVkVORE9SSUQKcGF0dGVybiB0byBkaXN0aW5ndWlz
aCBpbmRpdmlkdWFsIG1hbnVmYWN0dXJlcnMuCgpKZWRlYyBpcyBub3QgcmVhbGx5IHRoZSB2ZW5k
b3IgaGVyZS4KCklzIGl0IHRoZSBzYW1lIGNhc2UgaW4gRERSPyBZb3UgaGF2ZSBhIGRlZmluZWQg
bGlzdCBvZiB2ZW5kb3IgSURzIChhbHNvCjEgYnl0ZSk/Cgo+IAo+Pgo+Pj4gKyAgICAgIC0gY29u
c3Q6IGplZGVjLGRkcjQKCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
