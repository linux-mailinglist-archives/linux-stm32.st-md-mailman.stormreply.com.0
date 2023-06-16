Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A795734E5F
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 10:46:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B2B6C6B45D;
	Mon, 19 Jun 2023 08:46:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8AF7C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 10:05:35 +0000 (UTC)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686909935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQbCjIioSzpbvbd6fIl1lAwDG3upjPsirLpyT1TX/+k=;
 b=FwY8GMlD/bBWxk8342rA6F1IqDZ1jjrj++Nq7MUtdB9mGuU2C72330sqMSEubUgeEIby8G
 /FuksITI31BlpVpofEogiJe3NdE4Z6hwTtxfe3ErdY5NALmv5t5hivLA/jaS8xC1mvMdkd
 e5uSI0AB5xO0bjjobDQqbRV55DjeDv6ZmqFrijmS+caeeq2xP72H2zv8CeFzAlmQgfAPhc
 L1S5kQ8TPNghKGkjm3xR+xQX4NL9Uumb8MGH9pOAS30gyGcKbq0nZBbk+KfGxcd1+6mzkq
 nI8ebkmz5rZgSV/WTqv7Bark6usUQJnoutNBXNcICbmq3FNiSLzngxksao9tEA==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6708420002;
 Fri, 16 Jun 2023 10:05:34 +0000 (UTC)
From: alexis.lothore@bootlin.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Fri, 16 Jun 2023 12:04:05 +0200
Message-ID: <20230616100409.164583-5-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230616100409.164583-1-alexis.lothore@bootlin.com>
References: <20230616100409.164583-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Jun 2023 08:46:47 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
Subject: [Linux-stm32] [PATCH net-next 4/8] net: stmmac: move common defines
	in stmmac_ptp.h
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

RnJvbTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCkV2ZW4g
aWYgdGhlIGFkZHJlc3Mgb2YgcmVnaXN0ZXJzIGNvbnRhaW5pbmcgc3RhdHVzZXMgaXMgbm90IHRo
ZSBzYW1lCmJldHdlZW4gZHdhbWM0IGFuZCBkd21hYyAxMDAwLCB0aGUgb2Zmc2V0cyBvZiBpbnRl
cmVzdCBpbnNpZGUgdGhvc2UKcmVnaXN0ZXIgYXJlIHRoZSBzYW1lIHJlZ2FyZGluZyBhdXhpbGlh
cnkgc25hcHNob3RzLiBBcyBhIGNvbnNlcXVlbmNlLCBtb3ZlCnRob3NlIG9mZnNldCBkZWZpbml0
aW9ucyBpbiBzdG1tYWNfcHRwLmgKClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxl
eGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWM0LmggICAgIHwgNSAtLS0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvc3RtbWFjX3B0cC5oIHwgNCArKystCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYzQuaCBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjNC5oCmluZGV4IDllN2JhNWYyZTUzYS4uMzJhMTVjMDIwYTQzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYzQuaAorKysg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYzQuaApAQCAtMzEzLDEx
ICszMTMsNiBAQCBlbnVtIHBvd2VyX2V2ZW50IHsKICNkZWZpbmUgR01BQ19MNERQMF9TSElGVAkJ
MTYKICNkZWZpbmUgR01BQ19MNFNQMAkJCUdFTk1BU0soMTUsIDApCiAKLS8qIE1BQyBUaW1lc3Rh
bXAgU3RhdHVzICovCi0jZGVmaW5lIEdNQUNfVElNRVNUQU1QX0FVWFRTVFJJRwlCSVQoMikKLSNk
ZWZpbmUgR01BQ19USU1FU1RBTVBfQVRTTlNfTUFTSwlHRU5NQVNLKDI5LCAyNSkKLSNkZWZpbmUg
R01BQ19USU1FU1RBTVBfQVRTTlNfU0hJRlQJMjUKLQogLyogIE1UTCByZWdpc3RlcnMgKi8KICNk
ZWZpbmUgTVRMX09QRVJBVElPTl9NT0RFCQkweDAwMDAwYzAwCiAjZGVmaW5lIE1UTF9GUlBFCQkJ
QklUKDE1KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
c3RtbWFjX3B0cC5oIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFj
X3B0cC5oCmluZGV4IDkyZWQ0MjE3MDJiOS4uMDRiYmYxMmRmZDRiIDEwMDY0NAotLS0gYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcHRwLmgKKysrIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3B0cC5oCkBAIC02NCw2ICs2NCw4
IEBACiAjZGVmaW5lCVBUUF9TU0lSX1NTSU5DX01BWAkJMHhmZgogI2RlZmluZQlHTUFDNF9QVFBf
U1NJUl9TU0lOQ19TSElGVAkxNgogCi0KKy8qIE1BQyBUaW1lc3RhbXAgU3RhdHVzICovCisjZGVm
aW5lIEdNQUNfVElNRVNUQU1QX0FUU05TX01BU0sJR0VOTUFTSygyOSwgMjUpCisjZGVmaW5lIEdN
QUNfVElNRVNUQU1QX0FUU05TX1NISUZUCTI1CiAKICNlbmRpZgkvKiBfX1NUTU1BQ19QVFBfSF9f
ICovCi0tIAoyLjQxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
