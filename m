Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C9B822F71
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 15:28:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D146CC6C83B;
	Wed,  3 Jan 2024 14:28:25 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18B8CC6C83B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jan 2024 14:28:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D156B6000C;
 Wed,  3 Jan 2024 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1704292104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wp8DYMknUb7GCV6xvdPdeHPJMzkPaB2xD+HrP3VM8GM=;
 b=oB/z7ORENEshnW+G77deGCmY+G/XJmhFAHxDZVQxBKRiwPDd6b0sVihw/tZuLR1iR5hWVz
 r2xRI0DVcDyB/23d4rCbk3s1w6ZzfQMNyZXUHPXS+JyMEhaW21lBTxgSkqWvzXK+GswyYn
 tNyjC6NHEq4Hs0asFaZMkUYuKcam4NxRb9uhHB/UCk04pk3moUDgdBvvGuV+ciBAPd7brb
 EbEIPNpJI1YCw9jqMJhsw7HaoRkD/nP1E1ECTV+5guiN/Ygfgviabqi5gHKa8SHGlie8ek
 R8IAxuHRQAZciwGtGnm43swudWzoz8mxFVrWS/xqEdDwTmfFD4W2vhPLDEyfzw==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Date: Wed,  3 Jan 2024 15:28:23 +0100
Message-ID: <20240103142827.168321-4-romain.gantois@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103142827.168321-1-romain.gantois@bootlin.com>
References: <20240103142827.168321-1-romain.gantois@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Marek Vasut <marex@denx.de>, Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 3/5] net: stmmac: Signal to PHY/PCS
	drivers to keep RX clock on
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

RnJvbTogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+CgpUaGVyZSBpcyBhIHJl
b2N1cnJpbmcgaXNzdWUgd2l0aCBzdG1tYWMgY29udHJvbGxlcnMgd2hlcmUgdGhlIE1BQyBmYWls
cyB0bwppbml0aWFsaXplIGl0cyBoYXJkd2FyZSBpZiBhbiBSWCBjbG9jayBzaWduYWwgaXNuJ3Qg
cHJvdmlkZWQgb24gdGhlIE1BQy9QSFkKbGluay4KClRoaXMgY2F1c2VzIGlzc3VlcyB3aGVuIFBI
WSBvciBQQ1MgZGV2aWNlcyBlaXRoZXIgZ28gaW50byBzdXNwZW5kIHdoaWxlCmN1dHRpbmcgdGhl
IFJYIGNsb2NrIG9yIGRvIG5vdCBicmluZyB0aGUgY2xvY2sgc2lnbmFsIHVwIGVhcmx5IGVub3Vn
aCBmb3IKdGhlIE1BQyB0byBpbml0aWFsaXplIHN1Y2Nlc3NmdWxseS4KClNldCB0aGUgbWFjX3Jl
cXVpcmVzX3J4YyBmbGFnIGluIHRoZSBzdG1tYWMgcGh5bGluayBjb25maWcgc28gdGhhdCBQSFkv
UENTCmRyaXZlcnMga25vdyB0byBrZWVwIHRoZSBSWCBjbG9jayB1cCBhdCBhbGwgdGltZXMuCgpS
ZXBvcnRlZC1ieTogQ2xhcmsgV2FuZyA8eGlhb25pbmcud2FuZ0BueHAuY29tPgpMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzAyMDIwODE1NTkuMzU1MzYzNy0xLXhpYW9uaW5n
LndhbmdAbnhwLmNvbS8KUmVwb3J0ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdl
ckBib290bGluLmNvbT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtl
cm5lbC8yMDIzMDExNjEwMzkyNi4yNzY4NjktNC1jbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tLwpT
aWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4KW3JnYW50
b2lzOiBjb21taXQgbG9nXQpTaWduZWQtb2ZmLWJ5OiBSb21haW4gR2FudG9pcyA8cm9tYWluLmdh
bnRvaXNAYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvc3RtbWFjX21haW4uYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1t
YWNfbWFpbi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21h
aW4uYwppbmRleCAzN2U2NDI4M2Y5MTAuLmZmZWNjMjhkZTIzNCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYworKysgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCkBAIC0xMjIxLDYgKzEy
MjEsMTEgQEAgc3RhdGljIGludCBzdG1tYWNfcGh5X3NldHVwKHN0cnVjdCBzdG1tYWNfcHJpdiAq
cHJpdikKIAlwcml2LT5waHlsaW5rX2NvbmZpZy50eXBlID0gUEhZTElOS19ORVRERVY7CiAJcHJp
di0+cGh5bGlua19jb25maWcubWFjX21hbmFnZWRfcG0gPSB0cnVlOwogCisJLyogc3RtbWFjIGFs
d2F5cyByZXF1aXJlcyBhIHJlY2VpdmUgY2xvY2sgaW4gb3JkZXIgZm9yIHRoaW5ncyBsaWtlCisJ
ICogaGFyZHdhcmUgcmVzZXQgdG8gd29yay4KKwkgKi8KKwlwcml2LT5waHlsaW5rX2NvbmZpZy5t
YWNfcmVxdWlyZXNfcnhjID0gdHJ1ZTsKKwogCW1kaW9fYnVzX2RhdGEgPSBwcml2LT5wbGF0LT5t
ZGlvX2J1c19kYXRhOwogCWlmIChtZGlvX2J1c19kYXRhKQogCQlwcml2LT5waHlsaW5rX2NvbmZp
Zy5vdnJfYW5faW5iYW5kID0KLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
