Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6CF68F366
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Feb 2023 17:40:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 411F0C6A5E8;
	Wed,  8 Feb 2023 16:40:19 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89743C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Feb 2023 16:40:17 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3F2E61BF203;
 Wed,  8 Feb 2023 16:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675874417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5IY2oVgOi4BwHuNcg4KU4s9e+YaMLKjv+djWjs2zE1w=;
 b=YHiMew4DDTZtKpK+kkFnUpmCk7lw8g0jZdCSDsSaqdQQq41UeOHj64XUJU2xIzLcRCqk5j
 ryzVtL4vpTCRqV3n2+qLfHTGZjD0m/jWjwkw3FJonsPB/4yOPW0igeoUc22KYAMTqjZAWN
 y9odpyZZD91wXeqcpp1YzOWp2KlTXlaAlgDL96uMKAeN9dESGXYi07M78eMb+lP7lJ7ILK
 48xEeUMt8Hs2pYz8mEvdJqPc+/LWJREwJrEA7L/NwacSCeA4Ak25IIYXcZZQos0Q4o52fA
 zzxCB8Giv06zfY5pokELEaoquFEDxYHpbBPqXfFmHRAKjAFrjtCNqlW8ZQROOw==
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>
Date: Wed,  8 Feb 2023 17:41:57 +0100
Message-Id: <20230208164203.378153-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-renesas-soc@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>, Jimmy Lalande <jimmy.lalande@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/6] net: stmmac: add renesas,
	rzn1-gmac support
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

VGhlIHJ6bjEtZ21hYyBpbnN0YW5jZSBpcyBjb25uZWN0ZWQgdG8gYSBQQ1MgKE1JSUMpLiBJbiBv
cmRlciB0byB1c2UKdGhpcyBwY3MsIGFkZCBzdXBwb3J0IGluIHRoZSBzdHRtYWMgZHJpdmVyIHRv
IHNldCBhIGdlbmVyaWMgcGh5bGluayBwY3MKZGV2aWNlIGluc3RlYWQgb2YgdGhlIHhwY3Mgb25s
eS4gTW9yZW92ZXIsIGl0IGFkZHMgc3VwcG9ydCB0byBwcm92aWRlCmEgcGh5bGluayBwY3MgZGV2
aWNlIGZyb20gdGhlIHN0bW1hYyBwbGF0Zm9ybSBkYXRhIGFuZCB1c2UgaXQgd2l0aCB0aGUKZHJp
dmVyLiBJdCBhbHNvIGFkZHMgdGhlIGJpbmRpbmdzIGFuZCB0aGUgbmV3IHJ6bjEtZ21hYyBkcml2
ZXIgdGhhdApyZXRyaWV2ZSB0aGlzIHBjcyBmcm9tIHRoZSBkZXZpY2UtdHJlZS4KCi0tLQpWMjoK
IC0gUmVtb3ZlIHBhdGNoIHRoYXQgbW92ZXMgcGh5bGlua19zdGFydCgpIGVhcmxpZXIgaW4gaW5p
dAogLSBBZGQgbWlpY19lYXJseV9xc2V0dXAoKSAgd2hpY2ggYWxsb3dzIGluaXRpYWxpemluZyBz
b21lIG1paWMgcG9ydAogICBlYXJsaWVyIHRvIHByb3ZpZGUgYSBSWCBjbG9jayB0byBzdG1tYWMg
SVAKIC0gQ2FsbCBtaWljX2Vhcmx5X3NldHVwKCkgaW4gcnpuMSBzdG1tYWMgZHJpdmVyCiAtIEZp
eCBiaW5kaW5ncwoKQ2zDqW1lbnQgTMOpZ2VyICg2KToKICBuZXQ6IHBjczogcnpuMS1taWljOiBh
ZGQgcGNzX2Vhcmx5X3NldHVwKCkgZnVuY3Rpb24KICBuZXQ6IHN0bW1hYzogYWRkIHN1cHBvcnQg
dG8gdXNlIGEgZ2VuZXJpYyBwaHlsaW5rX3BjcyBhcyBQQ1MKICBuZXQ6IHN0bW1hYzogYWRkIHN1
cHBvcnQgdG8gcHJvdmlkZSBwY3MgZnJvbSBwbGF0Zm9ybSBkYXRhCiAgZHQtYmluZGluZ3M6IG5l
dDogcmVuZXNhcyxyem4xLWdtYWM6IERvY3VtZW50IFJaL04xIEdNQUMgc3VwcG9ydAogIG5ldDog
c3RtbWFjOiBhZGQgc3VwcG9ydCBmb3IgUlovTjEgR01BQwogIEFSTTogZHRzOiByOWEwNmcwMzI6
IGRlc2NyaWJlIEdNQUMxCgogLi4uL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1s
ICAgICAgIHwgIDY3ICsrKysrKysrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL3I5YTA2ZzAzMi5kdHNp
ICAgICAgICAgICAgICB8ICAxOCArKysKIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL0tjb25maWcgICB8ICAxMSArKwogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvTWFrZWZpbGUgIHwgICAxICsKIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L2NvbW1vbi5oICB8ICAgMiArCiAuLi4vbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFj
LXJ6bjEuYyAgfCAxMjAgKysrKysrKysrKysrKysrKysrCiAuLi4vbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL3N0bW1hY19tYWluLmMgfCAgIDggKy0KIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvc3RtbWFjX21kaW8uYyB8ICAgMSArCiBkcml2ZXJzL25ldC9wY3MvcGNzLXJ6bjEt
bWlpYy5jICAgICAgICAgICAgICAgfCAgMTIgKysKIGluY2x1ZGUvbGludXgvcGNzLXJ6bjEtbWlp
Yy5oICAgICAgICAgICAgICAgICB8ICAgMyArCiBpbmNsdWRlL2xpbnV4L3N0bW1hYy5oICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDEgKwogMTEgZmlsZXMgY2hhbmdlZCwgMjQwIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcnpuMS5j
CgotLSAKMi4zOS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
