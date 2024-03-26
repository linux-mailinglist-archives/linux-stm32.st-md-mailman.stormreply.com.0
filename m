Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 656A688C36E
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 14:31:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29B6EC6DD93;
	Tue, 26 Mar 2024 13:31:43 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 148B7C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 13:31:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D690BC000D;
 Tue, 26 Mar 2024 13:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1711459900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5X4Vqf5dMNOvdBRrjTCmAMrnSKF3wTY7sOX12e/v6N8=;
 b=XHGFRCraGoleTe74a8fvapXFBTEXRh3K3ZoBTFdNIdkfhhnASEnrfrHfnK3bszQ+fuHN1f
 +z55lo2LOAlSTmIU8WC4XfwEVaozluB97JWYzXNcd3WPq4FqtQMMog2mJH0Jcd/fVmzphe
 4cxRzNIs95/b3kd4t+UyOb1yIaPh3OqMB/oipDEIuOYbwOFj8rkXgRXpJZ/7gX9Fjnbfvt
 NWrV6eIrMfDCdXTOArq0eHmlOrPRNLx7QmxrwgLqAJ2KuoDxI0JSDGk9LHLSfaOomw7mNE
 u9gk4MiU4+pEoUv3+VlBSnEzJalSUms6zQVuRqZFY+DRL7LXSkFklWXQ4jSaMQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 26 Mar 2024 14:32:11 +0100
MIME-Version: 1.0
Message-Id: <20240326-rxc_bugfix-v6-5-24a74e5c761f@bootlin.com>
References: <20240326-rxc_bugfix-v6-0-24a74e5c761f@bootlin.com>
In-Reply-To: <20240326-rxc_bugfix-v6-0-24a74e5c761f@bootlin.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RESEND net-next v6 5/7] net: stmmac: Signal to
 PHY/PCS drivers to keep RX clock on
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

VGhlcmUgaXMgYSByZW9jdXJyaW5nIGlzc3VlIHdpdGggc3RtbWFjIGNvbnRyb2xsZXJzIHdoZXJl
IHRoZSBNQUMgZmFpbHMgdG8KaW5pdGlhbGl6ZSBpdHMgaGFyZHdhcmUgaWYgYW4gUlggY2xvY2sg
c2lnbmFsIGlzbid0IHByb3ZpZGVkIG9uIHRoZSBNQUMvUEhZCmxpbmsuCgpUaGlzIGNhdXNlcyBp
c3N1ZXMgd2hlbiBQSFkgb3IgUENTIGRldmljZXMgZWl0aGVyIGdvIGludG8gc3VzcGVuZCB3aGls
ZQpjdXR0aW5nIHRoZSBSWCBjbG9jayBvciBkbyBub3QgYnJpbmcgdGhlIGNsb2NrIHNpZ25hbCB1
cCBlYXJseSBlbm91Z2ggZm9yCnRoZSBNQUMgdG8gaW5pdGlhbGl6ZSBzdWNjZXNzZnVsbHkuCgpT
ZXQgdGhlIG1hY19yZXF1aXJlc19yeGMgZmxhZyBpbiB0aGUgc3RtbWFjIHBoeWxpbmsgY29uZmln
IHNvIHRoYXQgUEhZL1BDUwpkcml2ZXJzIGtub3cgdG8ga2VlcCB0aGUgUlggY2xvY2sgdXAgYXQg
YWxsIHRpbWVzLgoKUmVwb3J0ZWQtYnk6IENsYXJrIFdhbmcgPHhpYW9uaW5nLndhbmdAbnhwLmNv
bT4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwMjAyMDgxNTU5LjM1NTM2
MzctMS14aWFvbmluZy53YW5nQG54cC5jb20vClJlcG9ydGVkLWJ5OiBDbMOpbWVudCBMw6lnZXIg
PGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWFybS1rZXJuZWwvMjAyMzAxMTYxMDM5MjYuMjc2ODY5LTQtY2xlbWVudC5sZWdlckBi
b290bGluLmNvbS8KQ28tZGV2ZWxvcGVkLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytr
ZXJuZWxAYXJtbGludXgub3JnLnVrPgpTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNs
ZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgpTaWduZWQtb2ZmLWJ5OiBSb21haW4gR2Fu
dG9pcyA8cm9tYWluLmdhbnRvaXNAYm9vdGxpbi5jb20+ClJldmlld2VkLWJ5OiBBbmRyZXcgTHVu
biA8YW5kcmV3QGx1bm4uY2g+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvc3RtbWFjX21haW4uYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0
bW1hY19tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNf
bWFpbi5jCmluZGV4IDc5ODQ0ZGJlNDI1OC4uMjI5MGY0ODA4ZDdlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCisrKyBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKQEAgLTEyMTgsNiAr
MTIxOCw5IEBAIHN0YXRpYyBpbnQgc3RtbWFjX3BoeV9zZXR1cChzdHJ1Y3Qgc3RtbWFjX3ByaXYg
KnByaXYpCiAJcHJpdi0+cGh5bGlua19jb25maWcudHlwZSA9IFBIWUxJTktfTkVUREVWOwogCXBy
aXYtPnBoeWxpbmtfY29uZmlnLm1hY19tYW5hZ2VkX3BtID0gdHJ1ZTsKIAorCS8qIFN0bW1hYyBh
bHdheXMgcmVxdWlyZXMgYW4gUlggY2xvY2sgZm9yIGhhcmR3YXJlIGluaXRpYWxpemF0aW9uICov
CisJcHJpdi0+cGh5bGlua19jb25maWcubWFjX3JlcXVpcmVzX3J4YyA9IHRydWU7CisKIAltZGlv
X2J1c19kYXRhID0gcHJpdi0+cGxhdC0+bWRpb19idXNfZGF0YTsKIAlpZiAobWRpb19idXNfZGF0
YSkKIAkJcHJpdi0+cGh5bGlua19jb25maWcub3ZyX2FuX2luYmFuZCA9CkBAIC0zNDA4LDYgKzM0
MTEsMTAgQEAgc3RhdGljIGludCBzdG1tYWNfaHdfc2V0dXAoc3RydWN0IG5ldF9kZXZpY2UgKmRl
diwgYm9vbCBwdHBfcmVnaXN0ZXIpCiAJdTMyIGNoYW47CiAJaW50IHJldDsKIAorCS8qIE1ha2Ug
c3VyZSBSWCBjbG9jayBpcyBlbmFibGVkICovCisJaWYgKHByaXYtPmh3LT5waHlsaW5rX3BjcykK
KwkJcGh5bGlua19wY3NfcHJlX2luaXQocHJpdi0+cGh5bGluaywgcHJpdi0+aHctPnBoeWxpbmtf
cGNzKTsKKwogCS8qIERNQSBpbml0aWFsaXphdGlvbiBhbmQgU1cgcmVzZXQgKi8KIAlyZXQgPSBz
dG1tYWNfaW5pdF9kbWFfZW5naW5lKHByaXYpOwogCWlmIChyZXQgPCAwKSB7CgotLSAKMi40NC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
