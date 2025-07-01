Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C069CAF0668
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jul 2025 00:15:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B5ACC3F933;
	Tue,  1 Jul 2025 22:15:50 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB3C5C3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jul 2025 22:15:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D12FBA52F63;
 Tue,  1 Jul 2025 22:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002AEC4CEEB;
 Tue,  1 Jul 2025 22:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751408147;
 bh=1V9bluvj6qQ90+PrLqZ0V8vdxa8GaJjq9j4rh/X5piw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cq4PLqhBNXHPRoseG61W93iWlprbyQW36RTApzIjVnz5kYav6/kgFrWTTZvIsG5nm
 dalNoS4X9NsbzXZX5ylxeER34FL6ZwzgcxAhw6cpai9ZNmEhFLc2TDbvQMseEoKCyl
 lhkStm9uRunHaQXLtsWAjItmhmcwmsnh8UAXNUB+4vpXSv72Tta1D5TrWWeDSdqEWY
 nGkq5IntSVX0Jf5CXcdFR+c97TDOwbswm0F42+9fap/0a6iZFtpwZbaDdzZf9JD4SE
 ncjhdj3vypRpxv6Gvz4hYKdlApTqBhFUdC+ghUYHeKKqh0akkrrSL2+4CDf/Flwjh0
 3+FBqBlRlJiow==
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250630-spi-fix-v2-1-4680939e2a3e@foss.st.com>
References: <20250630-spi-fix-v2-1-4680939e2a3e@foss.st.com>
Message-Id: <175140814573.710092.14100565010751985098.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 23:15:45 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32: fix sram pool free in
	probe error path
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

T24gTW9uLCAzMCBKdW4gMjAyNSAxNDo1OToyMyArMDIwMCwgQ2zDqW1lbnQgTGUgR29mZmljIHdy
b3RlOgo+IEFkZCBhIHRlc3QgdG8gY2hlY2sgd2hldGhlciB0aGUgc3JhbV9wb29sIGlzIE5VTEwg
YmVmb3JlIGZyZWVpbmcgaXQuCj4gCj4gCgpBcHBsaWVkIHRvCgogICBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icm9vbmllL3NwaS5naXQgZm9yLW5leHQK
ClRoYW5rcyEKClsxLzFdIHNwaTogc3RtMzI6IGZpeCBzcmFtIHBvb2wgZnJlZSBpbiBwcm9iZSBl
cnJvciBwYXRoCiAgICAgIGNvbW1pdDogZjRkODQzOGU2YTQwMmFkNDBjZjRjY2I2ZTJkMjQxN2Q5
ZWQ0NzgyMQoKQWxsIGJlaW5nIHdlbGwgdGhpcyBtZWFucyB0aGF0IGl0IHdpbGwgYmUgaW50ZWdy
YXRlZCBpbnRvIHRoZSBsaW51eC1uZXh0CnRyZWUgKHVzdWFsbHkgc29tZXRpbWUgaW4gdGhlIG5l
eHQgMjQgaG91cnMpIGFuZCBzZW50IHRvIExpbnVzIGR1cmluZwp0aGUgbmV4dCBtZXJnZSB3aW5k
b3cgKG9yIHNvb25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgpLCBob3dldmVyIGlmCnByb2JsZW1zIGFy
ZSBkaXNjb3ZlcmVkIHRoZW4gdGhlIHBhdGNoIG1heSBiZSBkcm9wcGVkIG9yIHJldmVydGVkLgoK
WW91IG1heSBnZXQgZnVydGhlciBlLW1haWxzIHJlc3VsdGluZyBmcm9tIGF1dG9tYXRlZCBvciBt
YW51YWwgdGVzdGluZwphbmQgcmV2aWV3IG9mIHRoZSB0cmVlLCBwbGVhc2UgZW5nYWdlIHdpdGgg
cGVvcGxlIHJlcG9ydGluZyBwcm9ibGVtcyBhbmQKc2VuZCBmb2xsb3d1cCBwYXRjaGVzIGFkZHJl
c3NpbmcgYW55IGlzc3VlcyB0aGF0IGFyZSByZXBvcnRlZCBpZiBuZWVkZWQuCgpJZiBhbnkgdXBk
YXRlcyBhcmUgcmVxdWlyZWQgb3IgeW91IGFyZSBzdWJtaXR0aW5nIGZ1cnRoZXIgY2hhbmdlcyB0
aGV5CnNob3VsZCBiZSBzZW50IGFzIGluY3JlbWVudGFsIHVwZGF0ZXMgYWdhaW5zdCBjdXJyZW50
IGdpdCwgZXhpc3RpbmcKcGF0Y2hlcyB3aWxsIG5vdCBiZSByZXBsYWNlZC4KClBsZWFzZSBhZGQg
YW55IHJlbGV2YW50IGxpc3RzIGFuZCBtYWludGFpbmVycyB0byB0aGUgQ0NzIHdoZW4gcmVwbHlp
bmcKdG8gdGhpcyBtYWlsLgoKVGhhbmtzLApNYXJrCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
