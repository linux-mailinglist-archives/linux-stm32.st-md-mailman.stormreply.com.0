Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A26752580
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 16:50:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D60A6C6B452;
	Thu, 13 Jul 2023 14:50:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60DA8C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 14:49:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31AC06153B;
 Thu, 13 Jul 2023 14:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A37C433C8;
 Thu, 13 Jul 2023 14:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689259797;
 bh=oUeQBue4D+P5RKuXyNTqDYmkvCRh4FYVyWtbLqAKhmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XxKgmn1xsOU2pbWpxRsCyKp99xUi09w4uLO1jBoSotyiJJfgPbzmlDjlmVpBsS5Yx
 ncIKrzKTaCItf5d2aokcdPa8m4ykTT8eLxOfOfaM0s0kk5LsbIPsp4OOzWcSmSj2I2
 m2upGxLV5F+Dl4eoKKngsmTR1oinJHxiDWLERc+pK3cC2L/SLbYzEJBh6l+VzgNXy1
 gv2T5CpLDQ/tDZKe3UfKnti5V1QizPVI3MCNRkrb5pmPRMSoOdFjbwbF5nhNvdPrzl
 oOuAQTXH5PDOIdTy7qHbEezRIFzaPM5g7QeOP4kQaOO0fS76lgohHqzxEzRVcl5iWQ
 /HxBJ7XGKXF9Q==
Date: Thu, 13 Jul 2023 15:49:50 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20230713144950.GE10768@google.com>
References: <20230709-stmpe-dt-bindings-v5-1-34a3d6ee1e57@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230709-stmpe-dt-bindings-v5-1-34a3d6ee1e57@linaro.org>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Stefan Agner <stefan@agner.ch>,
 linux-kernel@vger.kernel.org,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5] dt-bindings: MFD: Convert STMPE to
	YAML schema
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

T24gU3VuLCAwOSBKdWwgMjAyMywgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhpcyBjb252ZXJ0
cyB0aGUgU1RNUEUgTUZEIGRldmljZSB0cmVlIGJpbmRpbmdzIHRvIHRoZSBZQU1MCj4gc2NoZW1h
Lgo+IAo+IFJlZmVyZW5jZSB0aGUgZXhpc3Rpbmcgc2NoZW1hIGZvciB0aGUgQURDLCBqdXN0IGRl
ZmluZSB0aGUKPiBvdGhlciBzdWJub2RlIHNjaGVtYXMgZGlyZWN0bHkgaW4gdGhlIE1GRCBzY2hl
bWEuCj4gCj4gQWRkIHR3byBleGFtcGxlcyBzbyB3ZSBoYXZlIGV4YW1wbGVzIGNvdmVyaW5nIGJv
dGggdGhlIHNpbXBsZQo+IEdQSU8gZXhwYW5kZXIgYW5kIHRoZSBtb3JlIGNvbXBsZXggd2l0aCBB
REMgYW5kIHRvdWNoc2NyZWVuLgo+IAo+IFNvbWUgaW4tdHJlZSB1c2VycyBkbyBub3QgZm9sbG93
IHRoZSBuYW1pbmcgY29udmVudGlvbnMgZm9yIG5vZGVzCj4gc28gdGhlc2UgRFRTIGZpbGVzIG5l
ZWQgdG8gYmUgYXVnbWVudGVkIHRvIHVzZSBwcm9wZXIgbm9kZSBuYW1lcwo+IGxpa2UgImFkYyIs
ICJwd20iLCAiZ3BpbyIsICJrZXlib2FyZC1jb250cm9sbGVyIiBldGMgYmVmb3JlIHRoZQo+IGJp
bmRpbmdzIHRha2UgZWZmZWN0IG9uIHRoZW0uCj4gCj4gQWNrZWQtYnk6IERtaXRyeSBUb3Jva2hv
diA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53
YWxsZWlqQGxpbmFyby5vcmc+Cj4gLS0tCj4gVGhpcyBhZGRzIHRoZSBtaXNzaW5nIEdQSU8gYmlu
ZGluZ3MgZm9yIHRoZSBTVE1QRSBwb3J0IGV4cGFuZGVyCj4gYW5kIGNvbnZlcnRzIHRoZSBleGlz
dGluZyBNRkQgYmluZGluZyB0byBZQU1MLgo+IAo+IEkgc3VwcG9zZSBMZWUgY2FuIG1lcmdlIHRo
aXMgd2hlbiBoZSdzIGhhcHB5IHdpdGggaXQuCj4gLS0tCj4gQ2hhbmdlcyBpbiB2NToKPiAtIFJl
YmFzZSBvbiB2Ni41LXJjMSBtZWFuaW5nIEdQSU8gYmluZGluZyBpcyBtZXJnZWQKPiAgIHVwc3Ry
ZWFtIGFuZCBjYW4gYmUgZHJvcHBlZC4KPiAtIExpbmsgdG8gdjQ6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyMzA0MjYtc3RtcGUtZHQtYmluZGluZ3MtdjQtMC0zNmZkZDUzZDk5MTlAbGlu
YXJvLm9yZwo+IAo+IENoYW5nZXMgaW4gdjQ6Cj4gLSBNYWtlIHRoZSBHUElPIGJpbmRpbmdzIGEg
Y29udmVyc2lvbjogdGhlcmUgd2VyZSBzb21lIG9sZAo+ICAgdGV4dCBiaW5kaW5ncyBmb3IgdGhl
IFNUTVBFIEdQSU8sIHdlIG5vdyBkZWxldGUgdGhlbSBhcwo+ICAgcGFydCBvZiB0aGUgcGF0Y2gu
Cj4gLSBJIGV4cGVjdCBMZWUgb3IgdGhlIERUIGJpbmRpbmcgdHJlZSB0byBwaWNrIGJvdGggcGF0
Y2hlcy4KPiAtIExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzA0MjYt
c3RtcGUtZHQtYmluZGluZ3MtdjMtMC1lYWMxZDczNmU0ODhAbGluYXJvLm9yZwo+IAo+IENoYW5n
ZXMgaW4gdjM6Cj4gLSBVcGRhdGUgdG8gcmV2aWV3IGZlZWRiYWNrCj4gLSBDb2xsZWN0ZWQgc29t
ZSBhY2svcmV2aWV3IHRhZ3MKPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyMzA0MjYtc3RtcGUtZHQtYmluZGluZ3MtdjItMC0yZjg1YTFmZmZjZGFAbGluYXJvLm9y
Zwo+IAo+IENoYW5nZXMgaW4gdjI6Cj4gLSBTcGxpdCBvZmYgYSBzZXBhcmF0ZSBHUElPIGJpbmRp
bmcKPiAtIFVwZGF0ZWQgdGhlIE1GRCBiaW5kaW5nIGFjY29yZGluZyB0byBmZWVkYmFjawo+IC0t
LQo+IENoYW5nZUxvZyB2NC0+djU6Cj4gLSBSZWJhc2Ugb24gdjYuNS1yYzEKPiBDaGFuZ2VMb2cg
djMtPnY0Ogo+IC0gTm8gY2hhbmdlcy4KPiBDaGFuZ2VMb2cgdjItPnYzOgo+IC0gRHJvcCB0aGUg
cmVxdWlyZWQgcHdtIHByb3BlcnRpZXMgYWxyZWFkeSByZXF1aXJlZCBieSB0aGUKPiAgIHRlbXBs
YXRlIHB3bSBzY2hlbWEuCj4gLSBBZGQgdGhlIG51bWJlciBvZiBQV00gY2VsbHMgYXMgY29uc3Qu
Cj4gQ2hhbmdlTG9nIHYxLT52MjoKPiAtIFNwbGl0IG9mZiB0aGUgR1BJTyBiaW5kaW5ncyB0byB0
aGVpciBvd24gc2NoZW1hLCBhcyB0aGUgb2xkCj4gICBiaW5kaW5ncyBkaWRuJ3QgZXZlbiBoYXZl
IGFueSBHUElPIGJpbmRpbmdzLiBQdXQgdGhlIEdQSU8KPiAgIHNjaGVtYSBiZWZvcmUgdGhpcyBz
Y2hlbWEgc28gd2UgY2FuIHVzZSBHUElPIGluIHRoZSBleGFtcGxlcy4KPiAtIERyb3Agbm9kZW5h
bWUgYW5kIHBhdHRlcm4gYXMgU1RNUEUgaXMgbm90IGEgZ2VuZXJpYyBuYW1lLgo+IC0gQWRkIG1h
eEl0ZW1zIHRvIHRoZSByZXNldHMuCj4gLSBNYWtlIHdha2V1cC1zb3VyY2UganVzdCA6dHJ1ZSwg
YXMgaXQgaXMgYSBnZW5lcmljIHByb3BlcnR5Lgo+IC0gTW92ZSB1bmV2YWx1YXRlZFByb3BlcnRp
ZXMgZm9yIHN1Ym5vZGVzIHJpZ2h0IGJlZm9yZSBwcm9wZXJ0aWVzCj4gICBhcyByZXF1ZXN0ZWQu
Cj4gLSBOYW1lIGRldmljZXMgInBvcnQtZXhwYW5kZXIiIGluIHRoZSBleGFtcGxlcy4KPiAtIFVz
ZSBsb3dlcmNhc2UgaGV4IGluIGxpbmUgaW5pdC4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaW5wdXQvc3RtcGUta2V5cGFkLnR4dCAgICAgfCAgNDEgLS0tCj4gIC4uLi9iaW5kaW5n
cy9pbnB1dC90b3VjaHNjcmVlbi9zdG1wZS50eHQgICAgICAgICAgIHwgMTA4IC0tLS0tLS0tCj4g
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG1wZS55YW1sICAgICAgICAgIHwgMjk3
ICsrKysrKysrKysrKysrKysrKysrKwo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWZkL3N0bXBlLnR4dCAgICB8ICA0MiAtLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAyOTcgaW5z
ZXJ0aW9ucygrKSwgMTkxIGRlbGV0aW9ucygtKQoKQXBwbGllZCwgdGhhbmtzCgotLSAKTGVlIEpv
bmVzIFvmnY7nkLzmlq9dCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
