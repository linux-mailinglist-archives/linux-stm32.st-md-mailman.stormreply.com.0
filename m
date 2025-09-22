Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C4B926AC
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 19:27:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E40A4C3089E;
	Mon, 22 Sep 2025 17:27:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD449C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 17:27:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A3332409F1;
 Mon, 22 Sep 2025 17:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E57EC113D0;
 Mon, 22 Sep 2025 17:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758562073;
 bh=5lJB8tk6gm0Z5L41/sm06dw0UVyCuVO3QM5zofxo82Y=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=tMz2p8UHjG++4yoSSDmd8BLseobavRr/kuYv1CdkCrzwNw2hGkZUbIk9VvAiT4vwM
 bKDVbnaZyblQDAhZd/CCFRNpi9zXH+9mzv+Yw7sTRa+sQz9qvDLSMLqwwL00fZw26s
 PFENvo/IrpZ0B0lZmC3p9m/pzJAfjAbocdtu6xeDEGhvIqIDLT/nfrGRYxOG5r1XFc
 8teifN/vSdEC+ElO9DDwRCvY/G9a8FHcV3TnAhB8c5Q+I6Ko1DW5cQ2IXyBUSc571x
 q7iVqu7jafE2GqqiLp/9BW1OlB+BCtwKalm5oSUiOCA7r3FNE1KnESXSia7SlOPQmZ
 fGYz/HmfDX5Pg==
Date: Mon, 22 Sep 2025 12:27:50 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
References: <20250922-b4-rcc-upstream-v7-0-2dfc4e018f40@gmail.com>
Message-Id: <175856184058.499994.8575309202132748563.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 0/3] Register the STM32MP25 RCC driver
 as an access controller.
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

Ck9uIE1vbiwgMjIgU2VwIDIwMjUgMTA6MTI6MTcgKzAyMDAsIENsw6ltZW50IExlIEdvZmZpYyB3
cm90ZToKPiBUaGUgU1RNMzJNUDI1IFJDQyBwZXJpcGhlcmFsIGFzIGFuIGFjY2VzcyBjb250cm9s
bGVyIGlzIGFsbG93ZWQgdG8ga25vdwo+IHdoZXRoZXIgdGhlIGNsb2NrcyBhcmUgc2VjdXJlZCBv
ciBub3QuCj4gVGhlIFNUTTMyTVAyNSBSQ0MgcGVyaXBoZXJhbCBrbm93cyBhYm91dCB0aGUgY2xv
Y2sgc2VjdXJlIGNvbmZpZ3VyYXRpb24KPiBvZiBhbGwgbm9uIFJJRi1hd2FyZSBwZXJpcGhlcmFs
Lgo+IEluIHBhcmFsbGVsIGFsbCB0aGUgUklGLWF3YXJlIHBlcmlwaGVyYWwgY29uZmlndXJhdGlv
biBpbmZvcm1hdGlvbgo+IGFyZSBrbm93biBieSB0aGUgUklGU0MgcGVyaXBoZXJhbCB3aGljaCBp
cyBhbHJlYWR5IGFuIGFjY2Vzcwo+IGNvbnRyb2xsZXIuCj4gCj4gVGhpcyB2NyBpcyBhIHN1YnNl
dCBvZiB0aGUgdjYgYW5kIG90aGVyIHByaW9yIHZlcnNpb25zLCBzcGxpdCB0byBzaW1wbGlmeQo+
IHRoZSByZXZpZXcgYW5kIG1lcmdpbmcgcHJvY2Vzcy4KPiAKPiBDaGFuZ2VzIGluIHY3Ogo+IC0g
Tm9uZQo+IC0gTGluayB0byB2NjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwOTA5
LWI0LWRkcnBlcmZtLXVwc3RyZWFtLXY2LTItY2UwODJjYzgwMWI1QGdtYWlsLmNvbS8KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRAZ21haWwu
Y29tPgo+IC0tLQo+IENsw6ltZW50IExlIEdvZmZpYyAoMyk6Cj4gICAgICAgZHQtYmluZGluZ3M6
IHN0bTMyOiBzdG0zMm1wMjU6IGFkZCBgI2FjY2Vzcy1jb250cm9sbGVyLWNlbGxzYCBwcm9wZXJ0
eQo+ICAgICAgIGNsazogc3RtMzJtcDI1OiBhZGQgZmlyZXdhbGwgZ3JhbnRfYWNjZXNzIG9wcwo+
ICAgICAgIGFybTY0OiBkdHM6IHN0OiBzZXQgcmNjIGFzIGFuIGFjY2Vzcy1jb250cm9sbGVyCj4g
Cj4gIC4uLi9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjUtcmNjLnlhbWwgICAgICAgICAgIHwg
IDcgKysrKwo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSAgICAgICAg
ICAgICB8ICAxICsKPiAgZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMybXAyNS5jICAgICAgICAg
ICAgICAgICAgfCA0MCArKysrKysrKysrKysrKysrKysrKystCj4gIDMgZmlsZXMgY2hhbmdlZCwg
NDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IC0tLQo+IGJhc2UtY29tbWl0OiAwN2Uy
N2FkMTYzOTlhZmNkNjkzYmUyMDIxMWIwZGZhZTYzZTA2MTVmCj4gY2hhbmdlLWlkOiAyMDI1MDkx
Ni1iNC1yY2MtdXBzdHJlYW0tOGE4ZWEzYWY2YTBkCj4gcHJlcmVxdWlzaXRlLWNoYW5nZS1pZDog
MjAyNTA5MTYtYjQtZmlyZXdhbGwtdXBzdHJlYW0tZGZlODU4OGEyMWY4OnY3Cj4gcHJlcmVxdWlz
aXRlLXBhdGNoLWlkOiAxZWFkOTYwZjQwNWM3YTJkY2M5MTExYWNkMGJiNGM5NWVkMzM5NTRmCj4g
Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gQ2zDqW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVt
ZW50QGdtYWlsLmNvbT4KPiAKPiAKPiAKCgpNeSBib3QgZm91bmQgbmV3IERUQiB3YXJuaW5ncyBv
biB0aGUgLmR0cyBmaWxlcyBhZGRlZCBvciBjaGFuZ2VkIGluIHRoaXMKc2VyaWVzLgoKU29tZSB3
YXJuaW5ncyBtYXkgYmUgZnJvbSBhbiBleGlzdGluZyBTb0MgLmR0c2kuIE9yIHBlcmhhcHMgdGhl
IHdhcm5pbmdzCmFyZSBmaXhlZCBieSBhbm90aGVyIHNlcmllcy4gVWx0aW1hdGVseSwgaXQgaXMg
dXAgdG8gdGhlIHBsYXRmb3JtCm1haW50YWluZXIgd2hldGhlciB0aGVzZSB3YXJuaW5ncyBhcmUg
YWNjZXB0YWJsZSBvciBub3QuIE5vIG5lZWQgdG8gcmVwbHkKdW5sZXNzIHRoZSBwbGF0Zm9ybSBt
YWludGFpbmVyIGhhcyBjb21tZW50cy4KCklmIHlvdSBhbHJlYWR5IHJhbiBEVCBjaGVja3MgYW5k
IGRpZG4ndCBzZWUgdGhlc2UgZXJyb3IocyksIHRoZW4KbWFrZSBzdXJlIGR0LXNjaGVtYSBpcyB1
cCB0byBkYXRlOgoKICBwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlCgoKVGhpcyBwYXRj
aCBzZXJpZXMgd2FzIGFwcGxpZWQgKHVzaW5nIGI0KSB0byBiYXNlOgogQmFzZTogdXNpbmcgc3Bl
Y2lmaWVkIGJhc2UtY29tbWl0IDA3ZTI3YWQxNjM5OWFmY2Q2OTNiZTIwMjExYjBkZmFlNjNlMDYx
NWYKIERlcHM6IGxvb2tpbmcgZm9yIGRlcGVuZGVuY2llcyBtYXRjaGluZyAxIHBhdGNoLWlkcwog
RGVwczogQXBwbHlpbmcgcHJlcmVxdWlzaXRlIHBhdGNoOiBbUEFUQ0ggdjddIGJ1czogZmlyZXdh
bGw6IG1vdmUgc3RtMzJfZmlyZXdhbGwgaGVhZGVyIGZpbGUgaW4gaW5jbHVkZSBmb2xkZXIKCklm
IHRoaXMgaXMgbm90IHRoZSBjb3JyZWN0IGJhc2UsIHBsZWFzZSBhZGQgJ2Jhc2UtY29tbWl0JyB0
YWcKKG9yIHVzZSBiNCB3aGljaCBkb2VzIHRoaXMgYXV0b21hdGljYWxseSkKCk5ldyB3YXJuaW5n
cyBydW5uaW5nICdtYWtlIENIRUNLX0RUQlM9eSBmb3IgYXJjaC9hcm02NC9ib290L2R0cy9zdC8n
IGZvciAyMDI1MDkyMi1iNC1yY2MtdXBzdHJlYW0tdjctMC0yZGZjNGUwMThmNDBAZ21haWwuY29t
OgoKYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjM1Zi1kay5kdGI6IGNsb2NrLWNvbnRy
b2xsZXJANDQyMDAwMDAgKHN0LHN0bTMybXAyNS1yY2MpOiAnI2FjY2Vzcy1jb250cm9sbGVyLWNl
bGxzJyBpcyBhIHJlcXVpcmVkIHByb3BlcnR5Cglmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL2Nsb2NrL3N0LHN0bTMybXAyNS1yY2MueWFtbCMKCgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
