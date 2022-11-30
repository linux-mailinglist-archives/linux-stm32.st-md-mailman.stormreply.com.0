Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2858463D8E4
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Nov 2022 16:10:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE214C65E6E;
	Wed, 30 Nov 2022 15:10:08 +0000 (UTC)
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A756FC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Nov 2022 14:13:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1669817569; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JSacKIfuxVnGPNdOvTNL3VXsKQM4qKYAcNyM62uN0wuH9uI7u4LEUiHbLOklN7MsfxHvazieG2u/0J81Px89NKXRwBPqu4Pw6jInhCXzE3rdWRXhdfZaNTzHLSO9lJPkKtwpitvMR3jgZVj/fr12LzFmvrFen8xyh/DxxgNJ+14=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1669817569;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=rw2F9BBmZz7hCr2YZL7OfKiCcti+Y/szmYlgYlkB1sE=; 
 b=Qz//DYinXkVfGaASn1n1TLCXq2S9vL1Nmzeni4L4pbkQxUX6o2mfkIOQEpBudE90saz+FnsTnRKRDmS+fdI2X0cjmxoXlNAtqnUhiMpOl52qMuR2sraP/JJbtqDyyJvA3zg+R3KPiIff8pxLZ0GD4b8+VoOj+usjoXQ7TcBh7Zo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669817569; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=rw2F9BBmZz7hCr2YZL7OfKiCcti+Y/szmYlgYlkB1sE=;
 b=Y3UfQeV6t5e6v1+lcSZhghTS0CZxtNhA9fhWhX01/PX+V0q+eUWYHvSIyUBh2gw0
 hVkCpwAY6EqKEk+cLkhndVHFFnyrRhER+VrpqH9ZxtSVnoH+Ecw3yVjk12T2WlQlAT3
 hGUf4H0F/Rx7+ehrD/hI7pNaE5FDByojV/CtfC+c=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by
 mx.zohomail.com with SMTPS id 1669817565868514.798752313474;
 Wed, 30 Nov 2022 06:12:45 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, soc@kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>,
 Heiko Stuebner <heiko@sntech.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Tim Harvey <tharvey@gateworks.com>, Peng Fan <peng.fan@nxp.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Frank Wunderlich <frank-w@public-files.de>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Oleksij Rempel <linux@rempel-privat.de>
Date: Wed, 30 Nov 2022 17:10:39 +0300
Message-Id: <20221130141040.32447-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130141040.32447-1-arinc.unal@arinc9.com>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Approved-At: Wed, 30 Nov 2022 15:10:07 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/5] mips: dts: remove label = "cpu" from DSA
	dt-binding
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

VGhpcyBpcyBub3QgdXNlZCBieSB0aGUgRFNBIGR0LWJpbmRpbmcsIHNvIHJlbW92ZSBpdCBmcm9t
IGFsbCBkZXZpY2V0cmVlcy4KClNpZ25lZC1vZmYtYnk6IEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVu
YWxAYXJpbmM5LmNvbT4KLS0tCiBhcmNoL21pcHMvYm9vdC9kdHMvcWNhL2FyOTMzMS5kdHNpICAg
IHwgMSAtCiBhcmNoL21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS5kdHNpIHwgMSAtCiAyIGZp
bGVzIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2Jvb3Qv
ZHRzL3FjYS9hcjkzMzEuZHRzaSBiL2FyY2gvbWlwcy9ib290L2R0cy9xY2EvYXI5MzMxLmR0c2kK
aW5kZXggYzQxMDJiMjgwYjQ3Li43NjhhYzBmODY5YjEgMTAwNjQ0Ci0tLSBhL2FyY2gvbWlwcy9i
b290L2R0cy9xY2EvYXI5MzMxLmR0c2kKKysrIGIvYXJjaC9taXBzL2Jvb3QvZHRzL3FjYS9hcjkz
MzEuZHRzaQpAQCAtMTc2LDcgKzE3Niw2IEBAIHBvcnRzIHsKIAogCQkJCQkJc3dpdGNoX3BvcnQw
OiBwb3J0QDAgewogCQkJCQkJCXJlZyA9IDwweDA+OwotCQkJCQkJCWxhYmVsID0gImNwdSI7CiAJ
CQkJCQkJZXRoZXJuZXQgPSA8JmV0aDE+OwogCiAJCQkJCQkJcGh5LW1vZGUgPSAiZ21paSI7CmRp
ZmYgLS1naXQgYS9hcmNoL21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS5kdHNpIGIvYXJjaC9t
aXBzL2Jvb3QvZHRzL3JhbGluay9tdDc2MjEuZHRzaQppbmRleCBmM2Y0YzFmMjZlMDEuLjQ0NTgx
N2NiZjM3NiAxMDA2NDQKLS0tIGEvYXJjaC9taXBzL2Jvb3QvZHRzL3JhbGluay9tdDc2MjEuZHRz
aQorKysgYi9hcmNoL21pcHMvYm9vdC9kdHMvcmFsaW5rL210NzYyMS5kdHNpCkBAIC0zODYsNyAr
Mzg2LDYgQEAgcG9ydEA0IHsKIAogCQkJCQlwb3J0QDYgewogCQkJCQkJcmVnID0gPDY+OwotCQkJ
CQkJbGFiZWwgPSAiY3B1IjsKIAkJCQkJCWV0aGVybmV0ID0gPCZnbWFjMD47CiAJCQkJCQlwaHkt
bW9kZSA9ICJ0cmdtaWkiOwogCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
