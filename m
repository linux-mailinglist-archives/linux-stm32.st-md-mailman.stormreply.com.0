Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3279C7021
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2024 14:03:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE4F5C78F8B;
	Wed, 13 Nov 2024 13:03:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DFFDC78F89
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2024 13:03:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B0CD95C57B0;
 Wed, 13 Nov 2024 13:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEDBC4CECF;
 Wed, 13 Nov 2024 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731503009;
 bh=3hSrEerVz63flbUMSNM5kNo4q1EzHTQJwl/k9YXWWXY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Oyn6Qk3cbXGXHOTIyYwF0JjkjWmA2gO5vSv5pD6Zb6sCBbFTXdht9wS6vqmEJy0kc
 jovqjilanwp3ERL6LQn94WKNRoEGHOKcOTnI4cvj74SMlN7DYgYX7NfjTmsm36WCEA
 Z0IWayIQ9JoIqhp1vuA+7YCM4JisPjeZfIF0B0iWLo+S1kxz2cW6m5gdz7ewSMVOVm
 Dblbsl0nOklNcmy9hM9q81niWsP8RM6ghv9qAsIZDhE0sbwBJqhQFUv3c78XVmegtq
 eOHvcnscCdq8gDnsjiF2gAhUQM7gqChgzemaBJEIErs742H0KCAXiS+xD5R+anCy/J
 6vSileRfaUrmA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
In-Reply-To: <ab85510f83fa901e44d5d563fe6e768054229bfe.1731398433.git.u.kleine-koenig@baylibre.com>
References: <ab85510f83fa901e44d5d563fe6e768054229bfe.1731398433.git.u.kleine-koenig@baylibre.com>
Message-Id: <173150300581.429927.11116814842133511799.b4-ty@kernel.org>
Date: Wed, 13 Nov 2024 13:03:25 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-355e8
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] regulator: Switch back to struct
 platform_driver::remove()
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

T24gVHVlLCAxMiBOb3YgMjAyNCAwOTozNToyMSArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gQWZ0ZXIgY29tbWl0IDBlZGI1NTVhNjVkMSAoInBsYXRmb3JtOiBNYWtlIHBsYXRmb3Jt
X2RyaXZlcjo6cmVtb3ZlKCkKPiByZXR1cm4gdm9pZCIpIC5yZW1vdmUoKSBpcyAoYWdhaW4pIHRo
ZSByaWdodCBjYWxsYmFjayB0byBpbXBsZW1lbnQgZm9yCj4gcGxhdGZvcm0gZHJpdmVycy4KPiAK
PiBDb252ZXJ0IGFsbCBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93IGRyaXZlcnMvcmVndWxhdG9yIHRv
IHVzZSAucmVtb3ZlKCksCj4gd2l0aCB0aGUgZXZlbnR1YWwgZ29hbCB0byBkcm9wIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXI6OnJlbW92ZV9uZXcoKS4gQXMKPiAucmVtb3ZlKCkgYW5kIC5yZW1vdmVf
bmV3KCkgaGF2ZSB0aGUgc2FtZSBwcm90b3R5cGVzLCBjb252ZXJzaW9uIGlzIGRvbmUKPiBieSBq
dXN0IGNoYW5naW5nIHRoZSBzdHJ1Y3R1cmUgbWVtYmVyIG5hbWUgaW4gdGhlIGRyaXZlciBpbml0
aWFsaXplci4KPiAKPiBbLi4uXQoKQXBwbGllZCB0bwoKICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9yZWd1bGF0b3IuZ2l0IGZvci1uZXh0
CgpUaGFua3MhCgpbMS8xXSByZWd1bGF0b3I6IFN3aXRjaCBiYWNrIHRvIHN0cnVjdCBwbGF0Zm9y
bV9kcml2ZXI6OnJlbW92ZSgpCiAgICAgIGNvbW1pdDogMWI1NTM1NDc0NWUyNzZkYjM4MjY4ZjIz
ODY1ZWIyYzRlYmE1ZjU5YgoKQWxsIGJlaW5nIHdlbGwgdGhpcyBtZWFucyB0aGF0IGl0IHdpbGwg
YmUgaW50ZWdyYXRlZCBpbnRvIHRoZSBsaW51eC1uZXh0CnRyZWUgKHVzdWFsbHkgc29tZXRpbWUg
aW4gdGhlIG5leHQgMjQgaG91cnMpIGFuZCBzZW50IHRvIExpbnVzIGR1cmluZwp0aGUgbmV4dCBt
ZXJnZSB3aW5kb3cgKG9yIHNvb25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgpLCBob3dldmVyIGlmCnBy
b2JsZW1zIGFyZSBkaXNjb3ZlcmVkIHRoZW4gdGhlIHBhdGNoIG1heSBiZSBkcm9wcGVkIG9yIHJl
dmVydGVkLgoKWW91IG1heSBnZXQgZnVydGhlciBlLW1haWxzIHJlc3VsdGluZyBmcm9tIGF1dG9t
YXRlZCBvciBtYW51YWwgdGVzdGluZwphbmQgcmV2aWV3IG9mIHRoZSB0cmVlLCBwbGVhc2UgZW5n
YWdlIHdpdGggcGVvcGxlIHJlcG9ydGluZyBwcm9ibGVtcyBhbmQKc2VuZCBmb2xsb3d1cCBwYXRj
aGVzIGFkZHJlc3NpbmcgYW55IGlzc3VlcyB0aGF0IGFyZSByZXBvcnRlZCBpZiBuZWVkZWQuCgpJ
ZiBhbnkgdXBkYXRlcyBhcmUgcmVxdWlyZWQgb3IgeW91IGFyZSBzdWJtaXR0aW5nIGZ1cnRoZXIg
Y2hhbmdlcyB0aGV5CnNob3VsZCBiZSBzZW50IGFzIGluY3JlbWVudGFsIHVwZGF0ZXMgYWdhaW5z
dCBjdXJyZW50IGdpdCwgZXhpc3RpbmcKcGF0Y2hlcyB3aWxsIG5vdCBiZSByZXBsYWNlZC4KClBs
ZWFzZSBhZGQgYW55IHJlbGV2YW50IGxpc3RzIGFuZCBtYWludGFpbmVycyB0byB0aGUgQ0NzIHdo
ZW4gcmVwbHlpbmcKdG8gdGhpcyBtYWlsLgoKVGhhbmtzLApNYXJrCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
