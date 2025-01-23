Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6378BA1A765
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2025 16:57:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1692AC78F86;
	Thu, 23 Jan 2025 15:57:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E23CC78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2025 15:57:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F0A9D5C587B;
 Thu, 23 Jan 2025 15:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0404DC4CEDD;
 Thu, 23 Jan 2025 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737647868;
 bh=HDXxO9qAlUO62itZdH9ffW5f6oieeEZ+qyLExIJ0csA=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=S3kuVMywcjybsUaZb5GdvcQCDNGNFTj8NgmSOjNj2PrcKbU+ru6FEP3VtzSwBvQsS
 8PhobbLGxx03onDIusJ3bSI5ujoimWBPLAvjvHo4DH0D6H37YDFRKA1JC+sEhHRUXg
 71n06VS2YLC94oqcZmI/teGKjpRHZck9qT1X4ildlb8aDhgReeuQ+666Umvj8vKP3w
 smRtG9fxfRxTrqKypY6zFGAFBcXRoKA/3a8TdOTQULF2pYpuIY7fJu8p5jJWB3FCW2
 pU3GN4MQCA5Vo5MtoFi4ZT5ajUbfMA5nXHWoO37jwD5FU39ZltMM20BbFiggocTPp1
 Ke7CW+B4gAb9w==
Date: Thu, 23 Jan 2025 09:57:47 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
In-Reply-To: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
References: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
Message-Id: <173764775141.3793586.6690578690442295161.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH stm32-next v3 0/2] ARM: dts: stm32:
 lxa-fairytux2: add gen{1, 2} boards
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

Ck9uIFR1ZSwgMjEgSmFuIDIwMjUgMTI6MTQ6MDQgKzAxMDAsIE1hcmMgS2xlaW5lLUJ1ZGRlIHdy
b3RlOgo+IEhlbGxvLAo+IAo+IHRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIExpbnV4
IEF1dG9tYXRpb24gR21iSCBGYWlyeVR1eDIKPiBib2FyZHMgZ2VuZXJhdGlvbiAxIGFuZCAyLgo+
IAo+IFRoZSBGYWlyeVR1eDIgaXMgYSBzbWFsbCBMaW51eCBkZXZpY2UgYmFzZWQgb24gYW4gT2N0
YXZvIFN5c3RlbXMKPiBPU0QzMk1QMTUzYyBTaVAsIHRoYXQgb2NjdXBpZXMganVzdCB0d28gc2xv
dHMgb24gYSBESU4gcmFpbC4KPiAKPiByZWdhcmRzLAo+IE1hcmMKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBNYXJjIEtsZWluZS1CdWRkZSA8bWtsQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+IENoYW5nZXMg
aW4gdjM6Cj4gLSAyLzI6IGZpeCB1c2UgZ2VuZXJpYyBub2RlIG5hbWVzIGZvciBleHRlcm5hbCBH
UElPIGFuZCBVU0IgVHlwZS1DIGNvbnRyb2xsZXIgKHRoYW5rcyBLcnp5c3p0b2YpCj4gLSAyLzI6
IExFRHM6IHJlcGxhY2UgbGFiZWwgYnkgY29sb3IgYW5kIGZ1bmN0aW9uIHByb3BlcnR5ICh0aGFu
a3MgS3J6eXN6dG9mKQo+IC0gMi8yOiBnZW4yOiBzb3J0IG5vZGVzIG9mIGkyYzEgYnkgYWRkcmVz
cyAodGhhbmtzIEtyenlzenRvZikKPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vcGF0Y2gubXNnaWQu
bGluay8yMDI1MDEyMC1seGEtZmFpcnl0dXgtdjItMC05NWY0YTBlYWE0NGRAcGVuZ3V0cm9uaXgu
ZGUKPiAKPiBDaGFuZ2VzIGluIHYyOgo+IC0gMS8yOiBBZGRlZCBLcnp5c3p0b2YncyBBY2tlZC1i
eQo+IC0gMi8yOiBmaXggYWxpZ25tZW50IGZvciBncGlvLWxpbmUtbmFtZXMgKHRoYW5rcyBLcnp5
c3p0b2YpCj4gLSAyLzI6IG9ubHkgdXNlIGNvbG9yOmZ1bmN0aW9uIGZvciBMRUQgbGFiZWxzICh0
aGFua3MgS3J6eXN6dG9mKQo+IC0gMi8yOiB1c2UgZ2VuZXJpYyBub2RlIG5hbWVzIGZvciBleHRl
cm5hbCBHUElPIGFuZCBVU0IgVHlwZS1DIGNvbnRyb2xsZXIKPiAtIExpbmsgdG8gdjE6IGh0dHBz
Oi8vcGF0Y2gubXNnaWQubGluay8yMDI0MTIxMC1seGEtZmFpcnl0dXgtdjEtMC05YWVhMDFjZGI4
M2VAcGVuZ3V0cm9uaXguZGUKPiAKPiAtLS0KPiBMZW9uYXJkIEfDtmhycyAoMik6Cj4gICAgICAg
ZHQtYmluZGluZ3M6IGFybTogc3RtMzI6IGFkZCBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIExpbnV4
IEF1dG9tYXRpb24gR21iSCBMWEEgRmFpcnlUdXggMgo+ICAgICAgIEFSTTogZHRzOiBzdG0zMjog
bHhhLWZhaXJ5dHV4MjogYWRkIExpbnV4IEF1dG9tYXRpb24gR21iSCBGYWlyeVR1eCAyCj4gCj4g
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sICAgICAgIHwgICAy
ICsKPiAgYXJjaC9hcm0vYm9vdC9kdHMvc3QvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
fCAgIDIgKwo+ICAuLi4vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1M2MtbHhhLWZhaXJ5dHV4Mi1nZW4x
LmR0cyB8IDEwMyArKysrKysKPiAgLi4uL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTNjLWx4YS1mYWly
eXR1eDItZ2VuMi5kdHMgfCAxNDcgKysrKysrKysKPiAgLi4uL2FybS9ib290L2R0cy9zdC9zdG0z
Mm1wMTUzYy1seGEtZmFpcnl0dXgyLmR0c2kgfCAzOTcgKysrKysrKysrKysrKysrKysrKysrCj4g
IDUgZmlsZXMgY2hhbmdlZCwgNjUxIGluc2VydGlvbnMoKykKPiAtLS0KPiBiYXNlLWNvbW1pdDog
YjdlYmZiODRhMDlkZTZiNDQ0OTI5NzQzMzk2NTRkOGZmYzVhZDllMQo+IGNoYW5nZS1pZDogMjAy
NDEyMTAtbHhhLWZhaXJ5dHV4LWU3MzA5NzlkM2QzZgo+IAo+IEJlc3QgcmVnYXJkcywKPiAtLQo+
IE1hcmMgS2xlaW5lLUJ1ZGRlIDxta2xAcGVuZ3V0cm9uaXguZGU+Cj4gCj4gCj4gCgoKTXkgYm90
IGZvdW5kIG5ldyBEVEIgd2FybmluZ3Mgb24gdGhlIC5kdHMgZmlsZXMgYWRkZWQgb3IgY2hhbmdl
ZCBpbiB0aGlzCnNlcmllcy4KClNvbWUgd2FybmluZ3MgbWF5IGJlIGZyb20gYW4gZXhpc3Rpbmcg
U29DIC5kdHNpLiBPciBwZXJoYXBzIHRoZSB3YXJuaW5ncwphcmUgZml4ZWQgYnkgYW5vdGhlciBz
ZXJpZXMuIFVsdGltYXRlbHksIGl0IGlzIHVwIHRvIHRoZSBwbGF0Zm9ybQptYWludGFpbmVyIHdo
ZXRoZXIgdGhlc2Ugd2FybmluZ3MgYXJlIGFjY2VwdGFibGUgb3Igbm90LiBObyBuZWVkIHRvIHJl
cGx5CnVubGVzcyB0aGUgcGxhdGZvcm0gbWFpbnRhaW5lciBoYXMgY29tbWVudHMuCgpJZiB5b3Ug
YWxyZWFkeSByYW4gRFQgY2hlY2tzIGFuZCBkaWRuJ3Qgc2VlIHRoZXNlIGVycm9yKHMpLCB0aGVu
Cm1ha2Ugc3VyZSBkdC1zY2hlbWEgaXMgdXAgdG8gZGF0ZToKCiAgcGlwMyBpbnN0YWxsIGR0c2No
ZW1hIC0tdXBncmFkZQoKCk5ldyB3YXJuaW5ncyBydW5uaW5nICdtYWtlIENIRUNLX0RUQlM9eSBm
b3IgYXJjaC9hcm0vYm9vdC9kdHMvc3QvJyBmb3IgMjAyNTAxMjEtbHhhLWZhaXJ5dHV4LXYzLTAt
OGQ0MmQ3ZDIzMmZiQHBlbmd1dHJvbml4LmRlOgoKYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RlLWhy
ZWZ2NjBwbHVzLXR2ay5kdGI6IGdwaW9AYTAzZmUwMDA6IGNvbXBhdGlibGU6MDogJ3N0ZXJpY3Nz
b24sZGI4NTAwLWdwaW8nIGlzIG5vdCBvbmUgb2YgWydzdCxub21hZGlrLWdwaW8nLCAnbW9iaWxl
eWUsZXllcTUtZ3BpbyddCglmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL2dwaW8vc3Qsbm9tYWRpay1ncGlvLnlhbWwjCgoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
