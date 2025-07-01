Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EFBAF0666
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jul 2025 00:15:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43B5FC3F933;
	Tue,  1 Jul 2025 22:15:46 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF873C3F932
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jul 2025 22:15:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 94ADB41569;
 Tue,  1 Jul 2025 22:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70DCC4CEEB;
 Tue,  1 Jul 2025 22:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751408143;
 bh=om0fQDtjhAjEN0F2R3PcJkGfAKXzLObNEQ/Y+tVNkbA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VxM4hLbdRT2JwAiGwjLVCV96RoYnb5PaCzoxjy3ovonGASbUuhStsrk6lwdlvawq7
 MviA9f6c6l+5Am/yO7UILWod6+YC6guAhjXGZMonuESE7qvJFEb5CGujTTI22368e1
 aL4r4Wnfv1Ar/SseKlHkgWiOr1L+bGSWMQIuYl4wWBpkeIWclaJ+LUuAqCjXSA0dTO
 GyL8dLWYUNi1ATFHTUvTuqSioYVZ8jBxj7wHsBY4VcYeGDwbsxh2KE8uOpsOIbpjL7
 UOMzKzirjVrRelOSnC/k+3nCXAjwk8kBFJ43Gim53RcH+m/BuJ+HrxwRX/qqLkXxve
 XY8XNV03Ttwpg==
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250630-spi-fix-v1-1-2e671c006e15@foss.st.com>
References: <20250630-spi-fix-v1-1-2e671c006e15@foss.st.com>
Message-Id: <175140814155.710092.6699776738839101023.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 23:15:41 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix sram pool free in probe
	error path
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

T24gTW9uLCAzMCBKdW4gMjAyNSAxMDoyMDoxMyArMDIwMCwgQ2zDqW1lbnQgTGUgR29mZmljIHdy
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
