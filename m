Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 111AE6B3A5F
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Mar 2023 10:27:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7CECC6A60D;
	Fri, 10 Mar 2023 09:27:11 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24E43C640E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 09:27:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <lgo@pengutronix.de>)
 id 1paZ1j-0003jH-V5; Fri, 10 Mar 2023 10:27:03 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1paZ1h-0038zL-EJ; Fri, 10 Mar 2023 10:27:01 +0100
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1paZ1g-004EBi-ID; Fri, 10 Mar 2023 10:27:00 +0100
From: =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 10 Mar 2023 10:26:50 +0100
Message-Id: <20230310092650.1007662-1-l.goehrs@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: lgo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1] ARM: dts: stm32: Add coprocessor detach
	mbox on stm32mp15xx-osd32 SoM
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

VG8gc3VwcG9ydCB0aGUgZGV0YWNoIGZlYXR1cmUsIGFkZCBhIG5ldyBtYWlsYm94IGNoYW5uZWwg
dG8gaW5mb3JtCnRoZSByZW1vdGUgcHJvY2Vzc29yIG9uIGEgZGV0YWNoLiBUaGlzIHNpZ25hbCBh
bGxvd3MgdGhlIHJlbW90ZSBwcm9jZXNzb3IKZmlybXdhcmUgdG8gc3RvcCBJUEMgY29tbXVuaWNh
dGlvbiBhbmQgdG8gcmVpbml0aWFsaXplIHRoZSByZXNvdXJjZXMgZm9yCmEgcmUtYXR0YWNoLgoK
U2VlIDYyNTdkZmMxYzQxMmRjZGJkNzZjYTVmYTkyYzg0NDQyMjJkYmU1YjAgZm9yIGEgcGF0Y2gg
dGhhdCBkb2VzIHRoZQpzYW1lIGZvciBzdG0zMm1wMTV4LWRreCBib2FyZHMuCgpTaWduZWQtb2Zm
LWJ5OiBMZW9uYXJkIEfDtmhycyA8bC5nb2VocnNAcGVuZ3V0cm9uaXguZGU+Ci0tLQogYXJjaC9h
cm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3NkMzIuZHRzaSB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9ib290L2R0cy9zdG0zMm1wMTV4eC1vc2QzMi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJtcDE1eHgtb3NkMzIuZHRzaQppbmRleCA5MzViNzA4NGI1YTIuLmE0Mzk2NWM4NmZlOCAxMDA2
NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3NkMzIuZHRzaQorKysgYi9h
cmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1vc2QzMi5kdHNpCkBAIC0yMTAsOCArMjEwLDgg
QEAgJmlwY2MgewogJm00X3Jwcm9jIHsKIAltZW1vcnktcmVnaW9uID0gPCZyZXRyYW0+LCA8Jm1j
dXJhbT4sIDwmbWN1cmFtMj4sIDwmdmRldjB2cmluZzA+LAogCQkJPCZ2ZGV2MHZyaW5nMT4sIDwm
dmRldjBidWZmZXI+OwotCW1ib3hlcyA9IDwmaXBjYyAwPiwgPCZpcGNjIDE+LCA8JmlwY2MgMj47
Ci0JbWJveC1uYW1lcyA9ICJ2cTAiLCAidnExIiwgInNodXRkb3duIjsKKwltYm94ZXMgPSA8Jmlw
Y2MgMD4sIDwmaXBjYyAxPiwgPCZpcGNjIDI+LCA8JmlwY2MgMz47CisJbWJveC1uYW1lcyA9ICJ2
cTAiLCAidnExIiwgInNodXRkb3duIiwgImRldGFjaCI7CiAJaW50ZXJydXB0LXBhcmVudCA9IDwm
ZXh0aT47CiAJaW50ZXJydXB0cyA9IDw2OCAxPjsKIAlzdGF0dXMgPSAib2theSI7CgpiYXNlLWNv
bW1pdDogZmUxNWMyNmVlMjZlZmExMTc0MWE3YjYzMmU5ZjIzYjAxYWNhNGNjNgotLSAKMi4zMC4y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
