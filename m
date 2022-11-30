Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D575C63D8E1
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Nov 2022 16:10:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FFE3C65E5D;
	Wed, 30 Nov 2022 15:10:08 +0000 (UTC)
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3310CC03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Nov 2022 14:13:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1669817506; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MBcgFbrxBMjCUsYG5JPRrKKOle/H+6CLvHLsKhUx7pGZLSo7InNJY1XoZh2orec8LiN/fuMmkzcItQOuWc/Oggq4K+ooy2GsQTgCZopz0ITgJ7F4AJjYcXkOgFtZGIDyF/Tn6FBiWEp7A4+dyD+Hdg3v0fIBLNLvbvcpb9fPBq8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1669817506;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=QF5pLbXUIUVP28HpDZnKqlToc38teR4R32c+jesH+QM=; 
 b=TUNQ8cHrgqns0eHBc3DfXD+rwLkdzqPFztq0Ens1q4Zt1GNyinG8t3QVugkQj7nYzeGT5iZRg3ZGY9NBCMcqf6mfCOBhZ5qZhBxo3uw9/X9o3OXvbuXEXBncGS8d0munLxduoEP5BKia9DYBqh3wBR+nZ9st98uToRtnBgFSTSY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669817506; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=QF5pLbXUIUVP28HpDZnKqlToc38teR4R32c+jesH+QM=;
 b=HfKAf4+Fel3coxytPwxCdcvr10bO6It6KMz9XQGSx8zBhVPLMBNwvphkDbv4PRBH
 46P1LoZCIUxZawUHkV429aO6CGMJEcZ9QLB02hIwx4g/Dp5bRfd5jX7+E5Rxcd0iWFW
 XVs2bsC3ntk6QlmzoL111TFrzu1K8SiYvYhUQudo=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by
 mx.zohomail.com with SMTPS id 1669817503309623.081549759161;
 Wed, 30 Nov 2022 06:11:43 -0800 (PST)
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
Date: Wed, 30 Nov 2022 17:10:35 +0300
Message-Id: <20221130141040.32447-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Approved-At: Wed, 30 Nov 2022 15:10:07 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/5] remove label = "cpu" from DSA dt-binding
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

SGVsbG8gZm9sa3MsCgpXaXRoIHRoaXMgcGF0Y2ggc2VyaWVzLCB3ZSdyZSBjb21wbGV0ZWx5IGdl
dHRpbmcgcmlkIG9mICdsYWJlbCA9ICJjcHUiOycKd2hpY2ggaXMgbm90IHVzZWQgYnkgdGhlIERT
QSBkdC1iaW5kaW5nIGF0IGFsbC4KCkluZm9ybWF0aW9uIGZvciB0YWtpbmcgdGhlIHBhdGNoZXMg
Zm9yIG1haW50YWluZXJzOgpQYXRjaCAxOiBuZXRkZXYgbWFpbnRhaW5lcnMgKGJhc2VkIG9mZiBu
ZXRkZXYvbmV0LW5leHQuZ2l0IG1haW4pClBhdGNoIDItMzogU29DIG1haW50YWluZXJzIChiYXNl
ZCBvZmYgc29jL3NvYy5naXQgc29jL2R0KQpQYXRjaCA0OiBNSVBTIG1haW50YWluZXJzIChiYXNl
ZCBvZmYgbWlwcy9saW51eC5naXQgbWlwcy1uZXh0KQpQYXRjaCA1OiBQb3dlclBDIG1haW50YWlu
ZXJzIChiYXNlZCBvZmYgcG93ZXJwYy9saW51eC5naXQgbmV4dC10ZXN0KQoKSSd2ZSBiZWVuIG1l
YW5pbmcgdG8gc3VibWl0IHRoaXMgZm9yIGEgZmV3IG1vbnRocy4gRmluZCB0aGUgcmVsZXZhbnQK
Y29udmVyc2F0aW9uIGhlcmU6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL25ldGRldi8yMDIyMDkx
MzE1NTQwOC5HQTM4MDI5OTgtcm9iaEBrZXJuZWwub3JnLwoKSGVyZSdzIGhvdyBJIGRpZCBpdCwg
Zm9yIHRoZSBpbnRlcmVzdGVkIChvciBzdWdnZXN0aW9ucyk6CgpGaW5kIHRoZSBwbGF0Zm9ybXMg
d2hpY2ggaGF2ZSBnb3QgJ2xhYmVsID0gImNwdSI7JyBkZWZpbmVkLgpncmVwIC1ybncgLiAtZSAn
bGFiZWwgPSAiY3B1IjsnCgpSZW1vdmUgdGhlIGxpbmUgd2hlcmUgJ2xhYmVsID0gImNwdSI7JyBp
cyBpbmNsdWRlZC4Kc2VkIC1pIC8nbGFiZWwgPSAiY3B1IjsnLywrZCBhcmNoL2FybS9ib290L2R0
cy8qCnNlZCAtaSAvJ2xhYmVsID0gImNwdSI7Jy8sK2QgYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvKgpzZWQgLWkgLydsYWJlbCA9ICJjcHUiOycvLCtkIGFyY2gvYXJtNjQvYm9vdC9kdHMv
bWFydmVsbC8qCnNlZCAtaSAvJ2xhYmVsID0gImNwdSI7Jy8sK2QgYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay8qCnNlZCAtaSAvJ2xhYmVsID0gImNwdSI7Jy8sK2QgYXJjaC9hcm02NC9ib290
L2R0cy9yb2NrY2hpcC8qCnNlZCAtaSAvJ2xhYmVsID0gImNwdSI7Jy8sK2QgYXJjaC9taXBzL2Jv
b3QvZHRzL3FjYS8qCnNlZCAtaSAvJ2xhYmVsID0gImNwdSI7Jy8sK2QgYXJjaC9taXBzL2Jvb3Qv
ZHRzL3JhbGluay8qCnNlZCAtaSAvJ2xhYmVsID0gImNwdSI7Jy8sK2QgYXJjaC9wb3dlcnBjL2Jv
b3QvZHRzL3R1cnJpczF4LmR0cwpzZWQgLWkgLydsYWJlbCA9ICJjcHUiOycvLCtkIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcWNhLGFyNzF4eC55YW1sCgpSZXN0b3JlIHRo
ZSBzeW1saW5rIGZpbGVzIHdoaWNoIHR5cGVjaGFuZ2UgYWZ0ZXIgcnVubmluZyBzZWQuCgpBcsSx
bsOnIMOcTkFMICg1KToKICBkdC1iaW5kaW5nczogbmV0OiBxY2EsYXI3MXh4OiByZW1vdmUgbGFi
ZWwgPSAiY3B1IiBmcm9tIGV4YW1wbGVzCiAgYXJtOiBkdHM6IHJlbW92ZSBsYWJlbCA9ICJjcHUi
IGZyb20gRFNBIGR0LWJpbmRpbmcKICBhcm02NDogZHRzOiByZW1vdmUgbGFiZWwgPSAiY3B1IiBm
cm9tIERTQSBkdC1iaW5kaW5nCiAgbWlwczogZHRzOiByZW1vdmUgbGFiZWwgPSAiY3B1IiBmcm9t
IERTQSBkdC1iaW5kaW5nCiAgcG93ZXJwYzogZHRzOiByZW1vdmUgbGFiZWwgPSAiY3B1IiBmcm9t
IERTQSBkdC1iaW5kaW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
