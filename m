Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E8689D549
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 11:21:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4DB6C7128A;
	Tue,  9 Apr 2024 09:21:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 626E2C6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 09:21:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 806581BF208;
 Tue,  9 Apr 2024 09:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712654471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WpIo0b1UVsh1fxNr1ZZUxhvbWy3Yo7lP2Ma4USOQd64=;
 b=CJaUxvWuQ9VDKqKT3pQ+nyvMW7jY+Uu5yxmuLr+CmqaAdjPnS1vynele/n4HfYG2L1nUq0
 SNMzzr1sFIrEBUXddWM9bvDZrURAMxb7lSVEiUdvE8JsUS/gNyW1Ds5HRccPvITxREPBXv
 0QHdUCsgFVLUSIAc5IPKjkDezC2+0mqNprgvUZXaCz8VMudfSnrcVjZ4OVEMbvYHnfYq5E
 nl2UklAtQNLQbtY3TZvn1/4v0PMO8Mz6abSN/F1OULIJsibGLzeI/lBx1oVsgQ/StaUlUG
 iYhTlB2I4XhBhX7X3FmNV17L0nsHm/VOl+jm0LxDVQgpqW1/SjZGsGd7MpJF2g==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 09 Apr 2024 11:21:43 +0200
Message-Id: <20240409-rzn1-gmac1-v2-0-79ca45f2fc79@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKgIFWYC/22NQQ6CMBBFr0Jm7Zi2ghZX3sOwgHaASaQ1bUNQw
 t1tunb58vLf3yFSYIpwr3YItHJk7zKoUwVm7t1EyDYzKKFqUQuF4eskTktvJF51Y0Z9ay9WEOT
 BO9DIW4k9wVFCR1uCLpuZY/LhU15WWfy/4CpRYDOQGpRua6vNY/A+vdidjV+gO47jB8GCFH+wA
 AAA
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: devicetree@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/5] net: stmmac: Add support for
 RZN1 GMAC devices
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

SGVsbG8gZXZlcnlvbmUsCgpUaGlzIGlzIHZlcnNpb24gdHdvIG9mIG15IHNlcmllcyB0aGF0IGFk
ZHMgc3VwcG9ydCBmb3IgYSBHaWdhYml0IEV0aGVybmV0CmNvbnRyb2xsZXIgZmVhdHVyZWQgaW4g
dGhlIFJlbmVzYXMgcjlhMDZnMDMyIFNvQywgb2YgdGhlIFJaL04xIGZhbWlseS4gVGhpcwpHTUFD
IGRldmljZSBpcyBiYXNlZCBvbiBhIFN5bm9wc3lzIElQIGFuZCBpcyBjb21wYXRpYmxlIHdpdGgg
dGhlIHN0bW1hYyBkcml2ZXIuCgpNeSBmb3JtZXIgY29sbGVhZ3VlIENsw6ltZW50IEzDqWdlciBv
cmlnaW5hbGx5IHNlbnQgYSBzZXJpZXMgZm9yIHRoaXMgZHJpdmVyLApidXQgYW4gaXNzdWUgaW4g
YnJpbmdpbmcgdXAgdGhlIFBDUyBjbG9jayBoYWQgYmxvY2tlZCB0aGUgdXBzdHJlYW1pbmcKcHJv
Y2Vzcy4gVGhpcyBpc3N1ZSBoYXMgc2luY2UgYmVlbiByZXNvbHZlZCBieSB0aGUgZm9sbG93aW5n
IHNlcmllczoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDMyNi1yeGNfYnVnZml4
LXY2LTAtMjRhNzRlNWM3NjFmQGJvb3RsaW4uY29tLwoKVGhpcyBzZXJpZXMgY29uc2lzdHMgb2Yg
YSBkZXZpY2V0cmVlIGJpbmRpbmcgZGVzY3JpYmluZyB0aGUgUlpOMSBHTUFDCmNvbnRyb2xsZXIg
SVAsIGEgbm9kZSBmb3IgdGhlIEdNQUMxIGRldmljZSBpbiB0aGUgcjlhMDZnMDMyIFNvQyBkZXZp
Y2UKdHJlZSwgYW5kIHRoZSBHTUFDIGRyaXZlciBpdHNlbGYgd2hpY2ggaXMgYSBnbHVlIGxheWVy
IGluIHN0bW1hYy4KClRoZXJlIGFyZSBhbHNvIHR3byBwYXRjaGVzIGJ5IFJ1c3NlbGwgdGhhdCBp
bXByb3ZlIHBjcyBpbml0aWFsaXphdGlvbiBoYW5kbGluZwppbiBzdG1tYWMuCgpCZXN0IFJlZ2Fy
ZHMsCgpSb21haW4gR2FudG9pcwoKLS0tCkNoYW5nZXMgaW4gdjI6Ci0gQWRkIHBjc19pbml0L2V4
aXQgY2FsbGJhY2tzIGluIHN0bW1hYyB0byBzb2x2ZSByYWNlIGNvbmRpdGlvbgotIFVzZSBwY3Nf
aW5pdC9leGl0IGNhbGxiYWNrcyBpbiBkd21hY19zb2NmcGdhIGdsdWUgbGF5ZXIKLSBNaXNjZWxs
YW5lb3VzIGRldmljZSB0cmVlIGJpbmRpbmcgY29ycmVjdGlvbnMKLSBMaW5rIHRvIHYxOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNDAyLXJ6bjEtZ21hYzEtdjEtMC01YmUyYjI4OTRk
OGNAYm9vdGxpbi5jb20KCi0tLQpDbMOpbWVudCBMw6lnZXIgKDMpOgogICAgICBkdC1iaW5kaW5n
czogbmV0OiByZW5lc2FzLHJ6bjEtZ21hYzogRG9jdW1lbnQgUlovTjEgR01BQyBzdXBwb3J0CiAg
ICAgIG5ldDogc3RtbWFjOiBhZGQgc3VwcG9ydCBmb3IgUlovTjEgR01BQwogICAgICBBUk06IGR0
czogcjlhMDZnMDMyOiBkZXNjcmliZSBHTUFDMQoKUnVzc2VsbCBLaW5nIChPcmFjbGUpICgyKToK
ICAgICAgbmV0OiBzdG1tYWM6IGludHJvZHVjZSBwY3NfaW5pdC9wY3NfZXhpdCBzdG1tYWMgb3Bl
cmF0aW9ucwogICAgICBuZXQ6IHN0bW1hYzogZHdtYWMtc29jZnBnYTogdXNlIHBjc19pbml0L3Bj
c19leGl0CgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlh
bWwgfCAgNjYgKysrKysrKysrKysrKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDYgKysKIGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjlh
MDZnMDMyLmR0c2kgICAgICAgICAgIHwgIDE5ICsrKysKIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL0tjb25maWcgICAgICAgIHwgIDEyICsrKwogZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvTWFrZWZpbGUgICAgICAgfCAgIDEgKwogZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcnpuMS5jICAgfCAgODggKysrKysrKysrKysrKysr
KysKIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jICAgIHwg
MTA5ICsrKysrKysrKysrLS0tLS0tLS0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX21haW4uYyAgfCAgMTQgKysrCiBpbmNsdWRlL2xpbnV4L3N0bW1hYy5oICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCiA5IGZpbGVzIGNoYW5nZWQsIDI2MyBp
bnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiA4N2MzMzMxNWFm
MzgwY2ExMmEyZTU5YWM5NGVkYWQ0ZmUwNDgxYjRjCmNoYW5nZS1pZDogMjAyNDA0MDItcnpuMS1n
bWFjMS02ODVjZjg3OTNkMGUKCkJlc3QgcmVnYXJkcywKLS0gClJvbWFpbiBHYW50b2lzIDxyb21h
aW4uZ2FudG9pc0Bib290bGluLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
