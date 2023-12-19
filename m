Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82176818C36
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Dec 2023 17:29:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AE03C6B461;
	Tue, 19 Dec 2023 16:29:39 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E72DCC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 16:29:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2335FF80E;
 Tue, 19 Dec 2023 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1703003377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mydg9L5el80VY7v9/6lf4HQRiOoVruSebSkvtjIIK5k=;
 b=RCHicHBzkk3ecasHwejetnetySEUJUky9lvEoJtH/vUPUx6Yn9tNxp/18WFnh09muHFpYi
 SQTiKFzzBN7pXkJFKD1bgvWojqGdmEP1rLtncaH6q5pZL9Z6gBz4jIQB07QVIL7gmwWCiP
 cJFtcT8KfMkZr+pKueN9wHOeUEFleE9XHkV9zezXFOJ6meDmK01+ajJ7HIZrRuOXr5LOdn
 0QHM8U6yKMRvmoOoXCnGHEOo9v0aH80DkeRjvbg7WL/PaR6+br7nzCuAeq3Xb80BuRPcXt
 9l07cd2tSKDMseQ+TXsT01bpXVEKNUwWqCMimiD+VinTn5Ls8MljFBiBscv7BQ==
Date: Tue, 19 Dec 2023 17:29:32 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20231219172932.13f4b0c3@device-28.home>
In-Reply-To: <CACRpkdaxy9u=1-rQ+f+1tb8xyV-GYOuq52xhb4_SRPk9-LpnUA@mail.gmail.com>
References: <20231218162326.173127-1-romain.gantois@bootlin.com>
 <20231218162326.173127-2-romain.gantois@bootlin.com>
 <20231219122034.pg2djgrosa4irubh@skbuf>
 <20231219140754.7a7a8dbd@device-28.home>
 <CACRpkdaxy9u=1-rQ+f+1tb8xyV-GYOuq52xhb4_SRPk9-LpnUA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Paolo Abeni <pabeni@redhat.com>, Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Prevent DSA tags
	from breaking COE
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

SGkgTGludXMsCgpPbiBUdWUsIDE5IERlYyAyMDIzIDE1OjE5OjQ1ICswMTAwCkxpbnVzIFdhbGxl
aWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIFR1ZSwgRGVjIDE5LCAy
MDIzIGF0IDI6MDfigK9QTSBNYXhpbWUgQ2hldmFsbGllcgo+IDxtYXhpbWUuY2hldmFsbGllckBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBTbyBpdCBsb29rcyBsaWtlIGFuIGFjY2VwdGFibGUg
c29sdXRpb24gd291bGQgYmUgc29tZXRoaW5nIGFsb25nIHRoZQo+ID4gbGluZXMgb2Ygd2hhdCBM
aW51cyBpcyBzdWdnZXN0aW5nIGhlcmUgOgo+ID4KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L25ldGRldi8yMDIzMTIxNi1uZXctZ2VtaW5pLWV0aGVybmV0LXJlZ3Jlc3Npb24tdjItMi02NGMy
Njk0MTNkZmFAbGluYXJvLm9yZy8KPiA+Cj4gPiBJZiBzbywgbWF5YmUgaXQncyB3b3J0aCBhZGRp
bmcgYSBuZXcgaGVscGVyIGZvciB0aGF0IGNoZWNrID8gIAo+IAo+IFllYWggaXQncyBhIGJpdCBh
bm5veWluZyB3aGVuIHNrYi0+cHJvdG9jb2wgaXMgbm90ID09IGV0aGVydHlwZSBvZiBidWZmZXIu
Cj4gCj4gSSBjYW4gY2VydGFpbmx5IGFkZCBhIGhlbHBlciBzdWNoIGFzIHNrYl9ldGhfcmF3X2V0
aGVydHlwZSgpCj4gdG8gPGxpbnV4L2lmX2V0aGVyLmg+IHRoYXQgd2lsbCBpbnNwZWN0IHRoZSBh
Y3R1YWwgZXRoZXJ0eXBlIGluCj4gc2tiLT5kYXRhLgo+IAo+IEl0J3MgdGhlIG1vc3Qgc3RyYWln
aHQtZm9yd2FyZCBhcHByb2FjaC4KCkFncmVlZCA6KQoKPiBXZSBjb3VsZCBhbHNvIGFkZCBzb21l
dGhpbmcgbGlrZSBib29sIGN1c3RvbV9ldGhlcnR5cGU7IHRvCj4gc3RydWN0IHNrX2J1ZmYgYW5k
IHNldCB0aGF0IHRvIHRydWUgaWYgdGhlIHRhZ2dlciBhZGRzIGEgY3VzdG9tCj4gZXRoZXJ0eXBl
LiBCdXQgSSBkb24ndCBrbm93IGhvdyB0aGUgbmV0d29yayBkZXZlbG9wZXJzIGZlZWwgYWJvdXQK
PiB0aGF0LgoKSSBkb24ndCB0aGluayB0aGlzIHdvdWxkIGJlIE9LLCBmaXJzdCBiZWNhdXNlIHNr
X2J1ZmYgaXMgcHJldHR5CnNlbnNpdGl2ZSB3aGVuIGl0IGNvbWVzIHRvIGNhY2hlIGFsaWdubWVu
dCwgYWRkaW5nIHRoaW5ncyBmb3IgdGhpcyBraW5kCm9mIHVzZS1jYXNlcyBpc24ndCBuZWNlc3Nh
cmlseSBhIGdvb2QgaWRlYS4gTW9yZW92ZXIsIHBvcHVsYXRpbmcgdGhpcwpmbGFnIGlzbid0IGdv
aW5nIHRvIGJlIHN0cmFpZ2h0Zm9yd2FyZCBhcyB3ZWxsLiBJIGd1ZXNzIHNvbWUgZXRoZXJ0eXBl
CndvdWxkIGJlIGNvbXBhdGlibGUgd2l0aCBjaGVja3N1bSBlbmdpbmVzLCB3aGlsZSBvdGhlciB3
b3VsZG4ndCwgc28KcHJvYmFibHkgd2hhdCAnY3VzdG9tX2V0aGVydHlwZScgbWVhbnMgd2lsbCBk
ZXBlbmQgb24gdGhlIE1BQyBkcml2ZXIuCgpGcm9tIG15IHBvaW50IG9mIHZpZXcgdGhlIGZpcnN0
IGFwcHJvYWNoIHdvdWxkIGluZGVlZCBiZSBiZXR0ZXIuCgpUaGFua3MsCgpNYXhpbWUKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
