Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA5B82AC5E
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 11:45:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13DE9C6DD66;
	Thu, 11 Jan 2024 10:45:38 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D306CC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 10:45:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E219CCE174F;
 Thu, 11 Jan 2024 10:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A142C43390;
 Thu, 11 Jan 2024 10:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704969933;
 bh=1zlWT5FLY0Fih5H5xoaVcmBtvGj8QW2FkGsabbTm2LY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=udT+Qc9BRX4yCSJRvEFLb9REPtzq7Vdr4/YrTD97vO4oGx9xPBN0il0CPPc7VheiY
 kx4YHTNSL3Kio0PMiJ+K6a5SV3O+Dn6JtFbxae/mFaiGqnZv2DjCOv+6XILtmuCXZ4
 CyOtaDy4tXa6zjMeLsxsh5iNKz5WQ8WQXEM9xqdC9sp5VMSvurLFYNAFP2FXsQGQP3
 8gbqeANHNclNu2iU+eADO3ceQFb5UB1mGDX397VidJLj7hM7BFY+x3ypij/hCqWWkl
 8dV9XOSNvXQllz5yxc+yQvUrMW8FwCwhEZDLirIVf0u1lrPCIZvy6SlVOoC0XUWyZ3
 zQHVqgrbpgjCQ==
Date: Thu, 11 Jan 2024 10:45:28 +0000
From: Lee Jones <lee@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240111104528.GC1665043@google.com>
References: <20240101161601.2232247-1-dario.binacchi@amarulasolutions.com>
 <20240101161601.2232247-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240101161601.2232247-2-dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/8] dt-bindings: mfd: stm32f7: Add
 binding definition for DSI
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

T24gTW9uLCAwMSBKYW4gMjAyNCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cgo+IEFkZCBiaW5kaW5n
IGRlZmluaXRpb24gZm9yIE1JUEkgRFNJIEhvc3QgY29udHJvbGxlci4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+
Cj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4g
Cj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIEFkZCBBY2tlZC1ieSB0YWcgb2YgQ29ub3Ig
RG9vbGV5Cj4gCj4gIGluY2x1ZGUvZHQtYmluZGluZ3MvbWZkL3N0bTMyZjctcmNjLmggfCAxICsK
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpZb3UgaGF2ZW4ndCBzZW5kIG1lIHRo
ZSByZXN0IG9mIHRoZSBzZXQsIHNvIEkgaGF2ZSBubyBpZGVhIHdoYXQncyBnb2luZwpvbiB3aXRo
IHJlc3BlY3QgdG8gZXhwZWN0ZWQgbWVyZ2Ugc3RyYXRlZ3kuICBJbiBmdXR1cmUgcGxlYXNlIHNl
bmQgdGhlCndob2xlIHBhdGNoIHRvIGFsbCBvZiB0aGUgcmVsZXZhbnQgbWFpbnRhaW5lcnMuCgo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL21mZC9zdG0zMmY3LXJjYy5oIGIvaW5j
bHVkZS9kdC1iaW5kaW5ncy9tZmQvc3RtMzJmNy1yY2MuaAo+IGluZGV4IDhkNzNhOWM1MWUyYi4u
YTRlNGY5MjcxMzk1IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvbWZkL3N0bTMy
ZjctcmNjLmgKPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL21mZC9zdG0zMmY3LXJjYy5oCj4g
QEAgLTEwOCw2ICsxMDgsNyBAQAo+ICAjZGVmaW5lIFNUTTMyRjdfUkNDX0FQQjJfU0FJMQkJMjIK
PiAgI2RlZmluZSBTVE0zMkY3X1JDQ19BUEIyX1NBSTIJCTIzCj4gICNkZWZpbmUgU1RNMzJGN19S
Q0NfQVBCMl9MVERDCQkyNgo+ICsjZGVmaW5lIFNUTTMyRjdfUkNDX0FQQjJfRFNJCQkyNwo+ICAK
PiAgI2RlZmluZSBTVE0zMkY3X0FQQjJfUkVTRVQoYml0KQkoU1RNMzJGN19SQ0NfQVBCMl8jI2Jp
dCArICgweDI0ICogOCkpCj4gICNkZWZpbmUgU1RNMzJGN19BUEIyX0NMT0NLKGJpdCkJKFNUTTMy
RjdfUkNDX0FQQjJfIyNiaXQgKyAweEEwKQo+IC0tIAo+IDIuNDMuMAo+IAoKLS0gCkxlZSBKb25l
cyBb5p2O55C85pavXQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
