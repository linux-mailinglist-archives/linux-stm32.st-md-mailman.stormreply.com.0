Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B6063D8E0
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Nov 2022 16:10:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44EC1C6507B;
	Wed, 30 Nov 2022 15:10:08 +0000 (UTC)
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 338EAC03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Nov 2022 14:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1669817521; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AnJlLep2xwdKaRzoYQiGsuhHN1kXNKIqJay45/8xGipAA4pU5DmftNsoCWpjfyn3hXiuVFy67s47F/Z0iurPci1OLujtpQdp6rqUIiITopwss7HVUCANJivLbnrUIwhQnY7rwbW3dec0AabIHy6Q3jlIzHL6XvluZqv2X6Z3Otw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1669817521;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=uPoI5XfZ23UUuypvg5x1t4pcYyKf1wgCFVtGI5ZTQ+s=; 
 b=ces143QCWhbMpQJLxcEB+IMeYEZCH3LXMw8zZowY6aRLNUNcYEiRpsICXW7/WtM4mBXTjb+8RKLq7oy0hc/fpaUDl20pDwFyk7QHfUtywb6s5i+vc+6hVBG1/M+2aS+pfPjludfBxAQ8s+WO2FDw8NsLo7beqalGi1UEdMw47jA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669817521; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=uPoI5XfZ23UUuypvg5x1t4pcYyKf1wgCFVtGI5ZTQ+s=;
 b=QZe441J5Q9GQ/nLIdo/FKpZXwwCbv87jUC83xlWpMM+YnuZ8d55JFGTZdlC5ez82
 OAuZXidLlhW5VzcaE49WfQ+FAO5JWpfd1J9AMN305UuYPEUBNS2ZlaKZ/5j6AHJahEP
 Y4M0WSZnV0v8mRrVOvXqs7cca2Mi3VRI2XOdSi3U=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by
 mx.zohomail.com with SMTPS id 16698175186813.6941551506523638;
 Wed, 30 Nov 2022 06:11:58 -0800 (PST)
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
Date: Wed, 30 Nov 2022 17:10:36 +0300
Message-Id: <20221130141040.32447-2-arinc.unal@arinc9.com>
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
Subject: [Linux-stm32] [PATCH 1/5] dt-bindings: net: qca,
	ar71xx: remove label = "cpu" from examples
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
IHRoZSBleGFtcGxlcy4KClNpZ25lZC1vZmYtYnk6IEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxA
YXJpbmM5LmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3Fj
YSxhcjcxeHgueWFtbCB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3FjYSxhcjcxeHgu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcWNhLGFyNzF4eC55
YW1sCmluZGV4IDFlYmY5ZThjOGExZC4uODlmOTRiMzFiNTQ2IDEwMDY0NAotLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3FjYSxhcjcxeHgueWFtbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3FjYSxhcjcxeHgueWFtbApAQCAtMTIz
LDcgKzEyMyw2IEBAIGV4YW1wbGVzOgogCiAgICAgICAgICAgICAgICAgICAgIHN3aXRjaF9wb3J0
MDogcG9ydEAwIHsKICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDA+OwotICAgICAg
ICAgICAgICAgICAgICAgICAgbGFiZWwgPSAiY3B1IjsKICAgICAgICAgICAgICAgICAgICAgICAg
IGV0aGVybmV0ID0gPCZldGgxPjsKIAogICAgICAgICAgICAgICAgICAgICAgICAgcGh5LW1vZGUg
PSAiZ21paSI7Ci0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
