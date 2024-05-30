Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC978D4B6F
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 14:22:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E79AC6C859;
	Thu, 30 May 2024 12:22:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB1A0C030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 12:22:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8A89F61D2D;
 Thu, 30 May 2024 12:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB50C2BBFC;
 Thu, 30 May 2024 12:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717071744;
 bh=5KsI/h/faFaeDa4P4/Qoga/3ht/Q01HjKyGBYJoqr8Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aCMZhsiJ5hwnGXOmdsQP+a0pgU7+Pz6Ty8sbiP9B9IIar3TfkoYmte0LvRoUjjZN0
 YI5g3gw8chjqDGG2pVaEibChJNUTnEztWMA/JYYKLBF5P5/hb2Q3dM9405Zajgx+2T
 YH8HhDvogs/NiH5mkh0YpOTlvPU4gHU7vAHKladqEor1ofKT4YbthmfyVBAFvmaMuT
 XZompuDFyM7v2IqFLctHyVSIFskA/VyE+nhNv2xnC3vPwK/g/4IWruTiW8eyVs80Ah
 krxZADYTNPh+pKTehgUPWdOX0NYnx59wDsC5WjBlQVpOohjfPYg9jE2tw1SSbdYATB
 0Zw1WvG0Mml1Q==
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240521105241.62400-2-u.kleine-koenig@pengutronix.de>
References: <20240521105241.62400-2-u.kleine-koenig@pengutronix.de>
Message-Id: <171707174254.885840.10764591194547229906.b4-ty@kernel.org>
Date: Thu, 30 May 2024 13:22:22 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14-dev-2ee9f
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: Don't warn about spurious
	interrupts
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

T24gVHVlLCAyMSBNYXkgMjAyNCAxMjo1Mjo0MiArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gVGhlIGRldl93YXJuIHRvIG5vdGlmeSBhYm91dCBhIHNwdXJpb3VzIGludGVycnVwdCB3
YXMgaW50cm9kdWNlZCB3aXRoCj4gdGhlIHJlYXNvbmluZyB0aGF0IHRoZXNlIGFyZSB1bmV4cGVj
dGVkLiBIb3dldmVyIHNwdXJpb3VzIGludGVycnVwdHMKPiB0ZW5kIHRvIHRyaWdnZXIgY29udGlu
b3VzbHkgYW5kIHRoZSBlcnJvciBtZXNzYWdlIG9uIHRoZSBzZXJpYWwgY29uc29sZQo+IHByZXZl
bnRzIHRoYXQgdGhlIGNvcmUncyBkZXRlY3Rpb24gb2Ygc3B1cmlvdXMgaW50ZXJydXB0cyBraWNr
cyBpbgo+ICh3aGljaCBkaXNhYmxlcyB0aGUgaXJxKSBhbmQganVzdCBmbG9vZHMgdGhlIGNvbnNv
bGUuCj4gCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8KCiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Jyb29uaWUvc3BpLmdpdCBmb3ItbmV4dAoKVGhhbmtz
IQoKWzEvMV0gc3BpOiBzdG0zMjogRG9uJ3Qgd2FybiBhYm91dCBzcHVyaW91cyBpbnRlcnJ1cHRz
CiAgICAgIGNvbW1pdDogOTVkN2M0NTJhMjY1NjRlZjBjNDI3ZjI4MDY3NjFiODU3MTA2ZDhjNAoK
QWxsIGJlaW5nIHdlbGwgdGhpcyBtZWFucyB0aGF0IGl0IHdpbGwgYmUgaW50ZWdyYXRlZCBpbnRv
IHRoZSBsaW51eC1uZXh0CnRyZWUgKHVzdWFsbHkgc29tZXRpbWUgaW4gdGhlIG5leHQgMjQgaG91
cnMpIGFuZCBzZW50IHRvIExpbnVzIGR1cmluZwp0aGUgbmV4dCBtZXJnZSB3aW5kb3cgKG9yIHNv
b25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgpLCBob3dldmVyIGlmCnByb2JsZW1zIGFyZSBkaXNjb3Zl
cmVkIHRoZW4gdGhlIHBhdGNoIG1heSBiZSBkcm9wcGVkIG9yIHJldmVydGVkLgoKWW91IG1heSBn
ZXQgZnVydGhlciBlLW1haWxzIHJlc3VsdGluZyBmcm9tIGF1dG9tYXRlZCBvciBtYW51YWwgdGVz
dGluZwphbmQgcmV2aWV3IG9mIHRoZSB0cmVlLCBwbGVhc2UgZW5nYWdlIHdpdGggcGVvcGxlIHJl
cG9ydGluZyBwcm9ibGVtcyBhbmQKc2VuZCBmb2xsb3d1cCBwYXRjaGVzIGFkZHJlc3NpbmcgYW55
IGlzc3VlcyB0aGF0IGFyZSByZXBvcnRlZCBpZiBuZWVkZWQuCgpJZiBhbnkgdXBkYXRlcyBhcmUg
cmVxdWlyZWQgb3IgeW91IGFyZSBzdWJtaXR0aW5nIGZ1cnRoZXIgY2hhbmdlcyB0aGV5CnNob3Vs
ZCBiZSBzZW50IGFzIGluY3JlbWVudGFsIHVwZGF0ZXMgYWdhaW5zdCBjdXJyZW50IGdpdCwgZXhp
c3RpbmcKcGF0Y2hlcyB3aWxsIG5vdCBiZSByZXBsYWNlZC4KClBsZWFzZSBhZGQgYW55IHJlbGV2
YW50IGxpc3RzIGFuZCBtYWludGFpbmVycyB0byB0aGUgQ0NzIHdoZW4gcmVwbHlpbmcKdG8gdGhp
cyBtYWlsLgoKVGhhbmtzLApNYXJrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
