Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED87D869D0B
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 18:03:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7C44C6C841;
	Tue, 27 Feb 2024 17:03:09 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 429E0C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 17:03:08 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1709053387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5l/z5niNWmPcrTzUn5sccV50+EwR7ocb+Kg+fSadhTg=;
 b=08SNpyQvlIQU2jDRMfIsTN3MWypAwK0VUGYT42tEBQgFLalrgvtfjw6UYXQVej2Ynh4ktb
 5Fk4PQ1exCmD8hEkfA4vrrKFpZNWQ1AO3HA3SOinAlt+rWo2xwFY3/wZ4SgDpWCFL1WpVQ
 3Ui4gjSwZIE6e4msvl5V/U6twYA1bl7qqqwSy4rvbFeY2tm46uoYWMhDEYq394TrR6uYZl
 vyY759M+v3TaLN6BSUKcNv5ijbkpmhowBrO7U9XpbEd6b6qCRHNIBjq4sBKqSlm/CRti8t
 +xDkOUF+Kz4koFfCmAS4TKjW+HgSAGy+/eSlmUdGDeyzosfVbk/gwAEqza17pA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1709053387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5l/z5niNWmPcrTzUn5sccV50+EwR7ocb+Kg+fSadhTg=;
 b=schyaOoT6pP96CHkQtz1KlTYOnuJapoTYgyTGeAbfVUt5j0qYE5viIyMTjwapWp7ij9Uiz
 Tq5mM+uFan0hgUAA==
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <knhwqxhouaiehmnnz5oxaxibhq7usokefztae4pplqypwuzgye@mke2irokres4>
References: <cover.1703284359.git.u.kleine-koenig@pengutronix.de>
 <knhwqxhouaiehmnnz5oxaxibhq7usokefztae4pplqypwuzgye@mke2irokres4>
Date: Tue, 27 Feb 2024 18:03:07 +0100
Message-ID: <874jdtalh0.ffs@tglx>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>, patches@opensource.cirrus.com,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 00/13] irqchip: Convert to platform remove
 callback returning void
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

T24gVGh1LCBGZWIgMTUgMjAyNCBhdCAyMjowMywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4g
T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTE6NTA6MzFQTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4+IHRoaXMgc2VyaWVzIGNvbnZlcnRzIGFsbCBkcml2ZXJzIGJlbG93IGRyaXZl
cnMvaXJxY2hpcCB0byB1c2UKPj4gLnJlbW92ZV9uZXcoKS4gU2VlIGNvbW1pdCA1YzVhNzY4MGU2
N2IgKCJwbGF0Zm9ybTogUHJvdmlkZSBhIHJlbW92ZQo+PiBjYWxsYmFjayB0aGF0IHJldHVybnMg
bm8gdmFsdWUiKSBmb3IgYW4gZXh0ZW5kZWQgZXhwbGFuYXRpb24gYW5kIHRoZQo+PiBldmVudHVh
bCBnb2FsLiBUaGUgVEw7RFI7IGlzIHRvIG1ha2UgaXQgaGFyZGVyIGZvciBkcml2ZXIgYXV0aG9y
cyB0bwo+PiBsZWFrIHJlc291cmNlcy4KPj4gCj4+IFRoZSBkcml2ZXJzIHRvdWNoZWQgaGVyZSBh
cmUgYWxsIGZpbmUgdGhvdWdoIGFuZCBkb24ndCByZXR1cm4gZWFybHkgaW4KPj4gLnJlbW92ZSgp
LiBTbyBhbGwgY29udmVyc2lvbnMgaW4gdGhpcyBzZXJpZXMgYXJlIHRyaXZpYWwuCj4KPiBJJ20g
c3RpbGwgd2FpdGluZyBmb3IgdGhpcyBzZXJpZXMgdG8gZ28gaW4gKG9yIGdldCByZXZpZXcgZmVl
ZGJhY2spLiBJcwo+IHRoaXMgc3RpbGwgb24geW91ciByYWRhcj8gWW91J3JlIHRoZSByaWdodCBt
YWludGFpbmVyIHRvIHRha2UgdGhpcwo+IHNlcmllcywgYXJlbid0IHlvdT8KCkkgYW0gYW5kIGl0
IGZlbGwgdGhyb3VnaCBteSBjaHJpc3RtYXMgY3JhY2suIEkgZG9uJ3QgZXZlbiB0cnkgdG8gY2F0
Y2gKdXAgd2l0aCBlbWFpbCBhZnRlciBiZWluZyBhbG1vc3QgMyB3ZWVrcyBBRksuIEZvciB0d28g
ZGVjYWRlcyBJIHJlbHkgb24Kc3VibWl0dGVycyB0byBwaW5nIG1lIGFmdGVyIGEgY291cGxlIG9m
IHdlZWtzIG9yIG1vbnRoIGluIHRoaXMgY2FzZSA6KQoKVGhhbmtzLAoKICAgICAgICB0Z2x4Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
