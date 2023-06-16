Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A13C734E60
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 10:46:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 388CBC6B460;
	Mon, 19 Jun 2023 08:46:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 149ABC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 10:05:37 +0000 (UTC)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686909936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TuLT0Dx8INmVuQ+Tjg5nObFk3ZPU55oE6gxmpAOjP2k=;
 b=lzUlV6Vl1+7PGIIxMRVfnCBB6Dz/NpkZawq1V/uJWhuAkOFIuN+draPM1L5Gg566KO4kvF
 z8zjlfLDt8oXatl77D3OHSqS/P5KebT1YLOHsBw2aGvtvFrYeZsNMFFYazPh/h80l8mpzu
 PjKiDGTM7rvRB7E9n7NNjVRH/0TnjV+/oNTag4KyZ4mLPJGNMpdliEy5NXYRM9kHDAAqC1
 NqCggXkU2o8fSr+1asolZiUSSvxvvj1VmoZOTRnkNtWvMgaGMZthqLCU+yZqKtSF6riVM0
 SpxF5DQJi9JFcreWJcbOgVttfiHi08F8TPdlEpG1VL1p168dIPEAdqu27IChVw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADD9920007;
 Fri, 16 Jun 2023 10:05:35 +0000 (UTC)
From: alexis.lothore@bootlin.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Fri, 16 Jun 2023 12:04:06 +0200
Message-ID: <20230616100409.164583-6-alexis.lothore@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next 5/8] net: stmmac: set number of
	snapshot external triggers for GMAC3
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

RnJvbTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCldoaWxl
IEdNQUM0IGV4cG9zZXMgbnVtYmVyIG9mIGF2YWlsYWJsZSBhdXhpbGlhcnkgc25hcHNob3RzIGlu
cHV0cyBpbgpNQUNfSFdfRkVBVFVSRTIgcmVnaXN0ZXIsIEdNQUMzIChEV01BQzEwMDApIGRvZXMg
bm90IGV4cG9zZSB0aGlzCmluZm9ybWF0aW9uIGluIGl0cyBvbmx5IGhhcmR3YXJlIGZlYXR1cmUg
cmVnaXN0ZXIuCldoZW4gcnVubmluZyBvbiBHTUFDMywgaGFyZGNvZGUgdGhlIHZhbHVlIHRvIDEg
dG8gYWxsb3cgZXh0ZXJuYWwgdHJpZ2dlcgp1c2FnZQoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExv
dGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcHRwLmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3B0cC5jIGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3B0cC5jCmluZGV4IDE2N2JmYmY2ODkxMS4uMDkw
YTlkODAzNDQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9zdG1tYWNfcHRwLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
c3RtbWFjX3B0cC5jCkBAIC0yODAsNyArMjgwLDEwIEBAIHZvaWQgc3RtbWFjX3B0cF9yZWdpc3Rl
cihzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYpCiAJCXByaXYtPnBsYXQtPmNkY19lcnJvcl9hZGog
PSAoMiAqIE5TRUNfUEVSX1NFQykgLyBwcml2LT5wbGF0LT5jbGtfcHRwX3JhdGU7CiAKIAlzdG1t
YWNfcHRwX2Nsb2NrX29wcy5uX3Blcl9vdXQgPSBwcml2LT5kbWFfY2FwLnBwc19vdXRfbnVtOwot
CXN0bW1hY19wdHBfY2xvY2tfb3BzLm5fZXh0X3RzID0gcHJpdi0+ZG1hX2NhcC5hdXhfc25hcHNo
b3RfbjsKKwkvKiBOdW1iZXIgb2YgYXZhaWxhYmxlIGV4dGVybmFsIHRyaWdnZXJzIGlzIG5vdCBw
cm92aWRlZCB0aHJvdWdoIGEKKwkgKiBoYXJkd2FyZSBjYXBhYmlsaXRpZXMgcmVnaXN0ZXIgZm9y
IEdNQUMzCisJICovCisJc3RtbWFjX3B0cF9jbG9ja19vcHMubl9leHRfdHMgPSBwcml2LT5wbGF0
LT5oYXNfZ21hYyA/IDEgOiBwcml2LT5kbWFfY2FwLmF1eF9zbmFwc2hvdF9uOwogCiAJcndsb2Nr
X2luaXQoJnByaXYtPnB0cF9sb2NrKTsKIAltdXRleF9pbml0KCZwcml2LT5hdXhfdHNfbG9jayk7
Ci0tIAoyLjQxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
