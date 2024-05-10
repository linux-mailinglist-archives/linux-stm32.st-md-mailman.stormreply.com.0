Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 055F08C1F0D
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2024 09:37:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6271C62EFE;
	Fri, 10 May 2024 07:37:39 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDF71C030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2024 07:37:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA74A240003;
 Fri, 10 May 2024 07:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715326651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h2r7Nv7nCfZb/d+nWyCikbcMpA1yPgiBcyKQtN4s7+U=;
 b=HVqaqDuUKY4tv6ElBmXqh4YOznvxtKcIqGfKVkA3B3N6aCUawihmHcyczf+0EttQiGtfaJ
 KswtiN2jvbT5kR3lt/ou4ENGYtwCF1H9gh34Bid0pZliuyk1Ya9DB0i/c9FhF5tnAUmQwM
 h64L+DNcCHUDEdUXth2Jq5Nixi9xVMsSr+Gowh56hk71FQx8f0Vx5EfdV7dMWwUO83n2C3
 7trZcmYZAOnA9scwLOvM4ccxV0FuAk7W+DrODqREiRHzdsB7OCr9FL8W4wfhANrJfBc6mE
 /l/VqtHrVwKAo1jcZLuu0LBoWT646tqOUryZ617YMu1L65UEpXKwxAsGqfRjnQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 10 May 2024 09:38:07 +0200
Message-Id: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN/OPWYC/23NwW7DIBAE0F+JOJcK1osNPfU/qh7wekmQGqiwZ
 aWN/O9FPhm5x9HozTzFzCXyLN4uT1F4jXPMqYb+5SLo5tOVZZxqFqAAFSqQ5Tdpeb170rK3hoI
 dXDcpFhV8Fw7xsY99iMSLTPxYxGdtbnFecvnZX1a99/8NrloqaUaGEazDydL7mPPyFdMr5fs+t
 MIRuwZDxYMjjyZAoMGdcXfA2jS4q9iPGgIQotLTGeMBAzYYK7YGfD0mVqTO2BxwpxpsKu4h9MZ
 bDKhti7dt+wOrUsIjpAEAAA==
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
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Serge Semin <fancer.lancer@gmail.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: devicetree@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 0/7] net: stmmac: Add support for
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

SGVsbG8gZXZlcnlvbmUsCgpUaGlzIGlzIHZlcnNpb24gc2l4IG9mIG15IHNlcmllcyB0aGF0IGFk
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
ZHMsCgpSb21haW4gR2FudG9pcwoKLS0tCkNoYW5nZXMgaW4gdjY6Ci0gQ2hhbmdlZCBzdG1tYWNf
cGNzX2NsZWFuKCkgcHJvdG90eXBlIHRvIG1hdGNoIHN0bW1hY19wY3Nfc2V0dXAoKQotIExpbmsg
dG8gdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA0MzAtcnpuMS1nbWFjMS12NS0w
LTYyZjY1YTg0ZjQxOEBib290bGluLmNvbQoKQ2hhbmdlcyBpbiB2NToKLSBSZWZhY3RvcmVkIHRo
ZSBzdG1tYWNfeHBjc19zZXR1cCgpIGZ1bmN0aW9uIHRvIGdyb3VwIHRvZ2V0aGVyIFhQQ1MgYW5k
IFBDUwogIHNldHVwIGxvZ2ljLgotIEFkZGVkIGEgc3RtbWFjX3Bjc19jbGVhbigpIGZ1bmN0aW9u
IGFzIGEgY291bnRlcnBhcnQgdG8gc3RtbWFjX3Bjc19zZXR1cCgpCi0gTGluayB0byB2NDogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDQyNC1yem4xLWdtYWMxLXY0LTAtODUyYTVmMmNl
MGMwQGJvb3RsaW4uY29tCgpDaGFuZ2VzIGluIHY0OgotIFJlbW92ZWQgdGhlIHNlY29uZCBwYXJh
bWV0ZXJzIG9mIHRoZSBuZXcgcGNzX2luaXQvZXhpdCgpIGNhbGxiYWNrcwotIFJlbW92ZWQgdW5u
ZWNlc3NhcnkgaW50ZXJydXB0LXBhcmVudCByZWZlcmVuY2UgaW4gZ21hYzEgZGV2aWNlIG5vZGUK
LSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNDE1LXJ6bjEtZ21h
YzEtdjMtMC1hYjEyZjJjNDQwMWRAYm9vdGxpbi5jb20KCkNoYW5nZXMgaW4gdjM6Ci0gRml4ZWQg
YSB0eXBvIGluIHRoZSBzb2NmcGdhIHBhdGNoCi0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI0MDQwOS1yem4xLWdtYWMxLXYyLTAtNzljYTQ1ZjJmYzc5QGJvb3RsaW4u
Y29tCgpDaGFuZ2VzIGluIHYyOgotIEFkZCBwY3NfaW5pdC9leGl0IGNhbGxiYWNrcyBpbiBzdG1t
YWMgdG8gc29sdmUgcmFjZSBjb25kaXRpb24KLSBVc2UgcGNzX2luaXQvZXhpdCBjYWxsYmFja3Mg
aW4gZHdtYWNfc29jZnBnYSBnbHVlIGxheWVyCi0gTWlzY2VsbGFuZW91cyBkZXZpY2UgdHJlZSBi
aW5kaW5nIGNvcnJlY3Rpb25zCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8yMDI0MDQwMi1yem4xLWdtYWMxLXYxLTAtNWJlMmIyODk0ZDhjQGJvb3RsaW4uY29tCgotLS0K
Q2zDqW1lbnQgTMOpZ2VyICgzKToKICAgICAgZHQtYmluZGluZ3M6IG5ldDogcmVuZXNhcyxyem4x
LWdtYWM6IERvY3VtZW50IFJaL04xIEdNQUMgc3VwcG9ydAogICAgICBuZXQ6IHN0bW1hYzogYWRk
IHN1cHBvcnQgZm9yIFJaL04xIEdNQUMKICAgICAgQVJNOiBkdHM6IHI5YTA2ZzAzMjogZGVzY3Jp
YmUgR01BQzEKClJ1c3NlbGwgS2luZyAoT3JhY2xlKSAoMik6CiAgICAgIG5ldDogc3RtbWFjOiBp
bnRyb2R1Y2UgcGNzX2luaXQvcGNzX2V4aXQgc3RtbWFjIG9wZXJhdGlvbnMKICAgICAgbmV0OiBz
dG1tYWM6IGR3bWFjLXNvY2ZwZ2E6IHVzZSBwY3NfaW5pdC9wY3NfZXhpdAoKU2VyZ2UgU2VtaW4g
KDIpOgogICAgICBuZXQ6IHN0bW1hYzogQWRkIGRlZGljYXRlZCBYUENTIGNsZWFudXAgbWV0aG9k
CiAgICAgIG5ldDogc3RtbWFjOiBNYWtlIHN0bW1hY194cGNzX3NldHVwKCkgZ2VuZXJpYyB0byBh
bGwgUENTIGRldmljZXMKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxyem4x
LWdtYWMueWFtbCB8ICA2NiArKysrKysrKysrKysrCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArKwogYXJjaC9hcm0vYm9vdC9kdHMvcmVu
ZXNhcy9yOWEwNmcwMzIuZHRzaSAgICAgICAgICAgfCAgMTggKysrKwogZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZpZyAgICAgICAgfCAgMTIgKysrCiBkcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9NYWtlZmlsZSAgICAgICB8ICAgMSArCiBkcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yem4xLmMgICB8ICA4NiArKysrKysr
KysrKysrKysrKwogLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zb2NmcGdh
LmMgICAgfCAxMDcgKysrKysrKysrKy0tLS0tLS0tLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWMuaCAgICAgICB8ICAgMyArLQogZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyAgfCAgMTQgKy0tCiBkcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWRpby5jICB8ICA1MCArKysrKysrLS0tCiBp
bmNsdWRlL2xpbnV4L3N0bW1hYy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiAr
CiAxMSBmaWxlcyBjaGFuZ2VkLCAyODkgaW5zZXJ0aW9ucygrKSwgNzYgZGVsZXRpb25zKC0pCi0t
LQpiYXNlLWNvbW1pdDogMzgzZWVkMmRlNTI5Mjg3MzM3ZDkxNTNhNTA4NGQ0MjkxYTdjNjlmMgpj
aGFuZ2UtaWQ6IDIwMjQwNDAyLXJ6bjEtZ21hYzEtNjg1Y2Y4NzkzZDBlCgpCZXN0IHJlZ2FyZHMs
Ci0tIApSb21haW4gR2FudG9pcyA8cm9tYWluLmdhbnRvaXNAYm9vdGxpbi5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
