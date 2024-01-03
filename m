Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 040B6822F6D
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 15:28:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A90B8C6B476;
	Wed,  3 Jan 2024 14:28:18 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6046C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jan 2024 14:28:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9118B6000B;
 Wed,  3 Jan 2024 14:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1704292097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hvLf6X7arkWKrAg0bOzGbRODnsEc8AoO5SrOQLUmCf4=;
 b=iH1S52snSfEZ8ml8P1b6j/7LdhT8pQ4yFVgPdBFGFWBQ2CEfqVxVcI9qX82CN7wdJbWys+
 9fextKtPZWIJ9eRET2/uL5T47EZuVCfHwP4smCagk/uHkIJVSorlVMc9r4LKGY3TH2tfMB
 oagykw1YUdSiWi4HCl8/KVPuPe/m2X7eRR72ZBDxhwP02t5buiI+m9iO/LxBUvBV5GXC/L
 ysfNfo2lMHw1sawjjJd6adu0rBVs1o8SFC5Fmu65LmEp4cm4zdBEIVnWAe4OBOCOANDtdM
 C6cnLSWLMyZoxzqZA4upZm6u4MATGnawmjHMpLbqnTnMmu9G3/zZuQcBocJ1Sw==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Date: Wed,  3 Jan 2024 15:28:20 +0100
Message-ID: <20240103142827.168321-1-romain.gantois@bootlin.com>
X-Mailer: git-send-email 2.43.0
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
Subject: [Linux-stm32] [PATCH net 0/5] Fix missing PHY-to-MAC RX clock
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

SGVsbG8gZXZlcnlvbmUsCgpUaGVyZSBpcyBhbiBpc3N1ZSB3aXRoIHNvbWUgc3RtbWFjL1BIWSBj
b21iaW5hdGlvbnMgdGhhdCBoYXMgYmVlbiByZXBvcnRlZApzb21lIHRpbWUgYWdvIGluIGEgY291
cGxlIG9mIGRpZmZlcmVudCBzZXJpZXM6CgpDbGFyayBXYW5nJ3MgcmVwb3J0OiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyMzAyMDIwODE1NTkuMzU1MzYzNy0xLXhpYW9uaW5nLndhbmdA
bnhwLmNvbS8KQ2zDqW1lbnQgTMOpZ2VyJ3MgcmVwb3J0OiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1hcm0ta2VybmVsLzIwMjMwMTE2MTAzOTI2LjI3Njg2OS00LWNsZW1lbnQubGVnZXJA
Ym9vdGxpbi5jb20vCgpTdG1tYWMgY29udHJvbGxlcnMgcmVxdWlyZSBhbiBSWCBjbG9jayBzaWdu
YWwgZnJvbSB0aGUgTUlJIGJ1cyB0byBwZXJmb3JtCnRoZWlyIGhhcmR3YXJlIGluaXRpYWxpemF0
aW9uIHN1Y2Nlc3NmdWxseS4gVGhpcyBjYXVzZXMgaXNzdWVzIHdpdGggc29tZQpQSFkvUENTIGRl
dmljZXMuIElmIHRoZXNlIGRldmljZXMgZG8gbm90IGJyaW5nIHRoZSBjbG9jayBzaWduYWwgdXAg
YmVmb3JlCnRoZSBNQUMgZHJpdmVyIGluaXRpYWxpemVzIGl0cyBoYXJkd2FyZSwgdGhlbiBzYWlk
IGluaXRpYWxpemF0aW9uIHdpbGwKZmFpbC4gVGhpcyBjYW4gaGFwcGVuIGF0IHByb2JlIHRpbWUg
b3Igd2hlbiB0aGUgc3lzdGVtIHdha2VzIHVwIGZyb20gYQpzdXNwZW5kZWQgc3RhdGUuCgpUaGlz
IHNlcmllcyBpbnRyb2R1Y2VzIG5ldyBmbGFncyBmb3IgcGh5X2RldmljZSBhbmQgcGh5bGlua19w
Y3MuIFRoZXNlCmZsYWdzIGFsbG93IE1BQyBkcml2ZXJzIHRvIHNpZ25hbCB0byBQSFkvUENTIGRy
aXZlcnMgdGhhdCB0aGUgUlggY2xvY2sKc2lnbmFsIHNob3VsZCBiZSBlbmFibGVkIGFzIHNvb24g
YXMgcG9zc2libGUsIGFuZCB0aGF0IGl0IHNob3VsZCBhbHdheXMKc3RheSBlbmFibGVkLgoKSSBo
YXZlIGluY2x1ZGVkIHNwZWNpZmljIHVzZXMgb2YgdGhlc2UgZmxhZ3MgdGhhdCBmaXggdGhlIFJa
TjEgR01BQzEgc3RtbWFjCmRyaXZlciB0aGF0IEkgYW0gY3VycmVudGx5IHdvcmtpbmcgb24gYW5k
IHRoYXQgaXMgbm90IHlldCB1cHN0cmVhbS4gSSBoYXZlCmFsc28gaW5jbHVkZWQgY2hhbmdlcyB0
byB0aGUgYXQ4MDN4IFBIWSBkcml2ZXIgdGhhdCBzaG91bGQgZml4IHRoZSBpc3N1ZQp0aGF0IENs
YXJrIFdhbmcgd2FzIGhhdmluZy4KCkNsYXJrLCBjb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gdGhh
dCB0aGlzIHNlcmllcyBmaXhlcyB5b3VyIGlzc3VlIHdpdGggdGhlCmF0ODAzeCBQSFk/CgpCZXN0
IFJlZ2FyZHMsCgpSb21haW4KClJvbWFpbiBHYW50b2lzICgyKToKICBuZXQ6IHBoeTogYWRkIHJ4
Y19hbHdheXNfb24gZmxhZyB0byBwaHlsaW5rX3BjcwogIG5ldDogcGNzOiByem4xLW1paWM6IElu
aXQgUlggY2xvY2sgZWFybHkgaWYgTUFDIHJlcXVpcmVzIGl0CgpSdXNzZWxsIEtpbmcgKDMpOgog
IG5ldDogcGh5OiBhZGQgUEhZX0ZfUlhDX0FMV0FZU19PTiB0byBQSFkgZGV2IGZsYWdzCiAgbmV0
OiBzdG1tYWM6IFNpZ25hbCB0byBQSFkvUENTIGRyaXZlcnMgdG8ga2VlcCBSWCBjbG9jayBvbgog
IG5ldDogcGh5OiBhdDgwM3g6IEF2b2lkIGhpYmVybmF0aW5nIGlmIE1BQyByZXF1aXJlcyBSWCBj
bG9jawoKIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyAgfCAg
NSArKysrKwogZHJpdmVycy9uZXQvcGNzL3Bjcy1yem4xLW1paWMuYyAgICAgICAgICAgICAgICB8
IDE4ICsrKysrKysrKysrKystLS0tLQogZHJpdmVycy9uZXQvcGh5L2F0ODAzeC5jICAgICAgICAg
ICAgICAgICAgICAgICB8ICAzICsrLQogZHJpdmVycy9uZXQvcGh5L3BoeWxpbmsuYyAgICAgICAg
ICAgICAgICAgICAgICB8IDEzICsrKysrKysrKysrKy0KIGluY2x1ZGUvbGludXgvcGh5LmggICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBpbmNsdWRlL2xpbnV4L3BoeWxpbmsuaCAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDkgKysrKysrKysrCiA2IGZpbGVzIGNoYW5nZWQsIDQy
IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgotLSAKMi40My4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
