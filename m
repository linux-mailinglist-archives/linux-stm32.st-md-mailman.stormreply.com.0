Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D672A725DD5
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 13:58:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AD28C6905A;
	Wed,  7 Jun 2023 11:58:09 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07C0DC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 11:58:08 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <lgo@pengutronix.de>)
 id 1q6rne-0000Tp-JL; Wed, 07 Jun 2023 13:58:02 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1q6rnd-005jGM-Ty; Wed, 07 Jun 2023 13:58:01 +0200
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1q6rnd-00CTiq-55; Wed, 07 Jun 2023 13:58:01 +0200
From: =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed,  7 Jun 2023 13:55:06 +0200
Message-Id: <20230607115508.2964574-7-l.goehrs@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607115508.2964574-1-l.goehrs@pengutronix.de>
References: <20230607115508.2964574-1-l.goehrs@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: lgo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v1 7/8] dt-bindings: arm: stm32: Add
	compatible string for Linux Automation LXA TAC
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

QWRkIERUIGNvbXBhdGlibGUgc3RyaW5nIGZvciBMaW51eCBBdXRvbWF0aW9uIEdtYkggVGVzdCBB
dXRvbWF0aW9uCkNvbnRyb2xsZXJzIChMWEEgVEFDKS4KTFhBIFRBQ3MgYXJlIGEgZGV2ZWxvcG1l
bnQgdG9vbCBmb3IgZW1iZWRkZWQgZGV2aWNlcyB3aXRoIGEgZm9jdXMgb24KZW1iZWRkZWQgTGlu
dXggZGV2aWNlcy4KCkFzIG9mIG5vdyB0aGVyZSBhcmUgdHdvIFNUTTMyTVAxNTcgYmFzZWQgaGFy
ZHdhcmUgZ2VuZXJhdGlvbnMgKEdlbiAxIGFuZApHZW4gMikgdGhhdCBoYXZlIG1vc3Qgb2YgdGhl
aXIgaGFyZHdhcmUgY29uZmlnIGluIGNvbW1vbi4KSW4gdGhlIGZ1dHVyZSB0aGVyZSB3aWxsIGFs
c28gYmUgYSBTVE0zMk1QMTUzIGJhc2VkIGhhcmR3YXJlIGdlbmVyYXRpb24uCgpTaWduZWQtb2Zm
LWJ5OiBMZW9uYXJkIEfDtmhycyA8bC5nb2VocnNAcGVuZ3V0cm9uaXguZGU+Ci0tLQogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sIHwgNCArKyst
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55
YW1sCmluZGV4IDEzZTM0MjQxMTQ1YjQuLjExZjg3MDYxMDFlY2EgMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIvc3RtMzIueWFtbAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwKQEAg
LTE0Myw3ICsxNDMsOSBAQCBwcm9wZXJ0aWVzOgogICAgICAgLSBkZXNjcmlwdGlvbjogT2N0YXZv
IE9TRDMyTVAxNXggU3lzdGVtLWluLVBhY2thZ2UgYmFzZWQgYm9hcmRzCiAgICAgICAgIGl0ZW1z
OgogICAgICAgICAgIC0gZW51bToKLSAgICAgICAgICAgICAgLSBseGEsc3RtMzJtcDE1N2MtbWMx
ICMgTGludXggQXV0b21hdGlvbiBNQy0xCisgICAgICAgICAgICAgIC0gbHhhLHN0bTMybXAxNTdj
LW1jMSAgICAgICMgTGludXggQXV0b21hdGlvbiBNQy0xCisgICAgICAgICAgICAgIC0gbHhhLHN0
bTMybXAxNTdjLXRhYy1nZW4xICMgTGludXggQXV0b21hdGlvbiBUQUMgKEdlbmVyYXRpb24gMSkK
KyAgICAgICAgICAgICAgLSBseGEsc3RtMzJtcDE1N2MtdGFjLWdlbjIgIyBMaW51eCBBdXRvbWF0
aW9uIFRBQyAoR2VuZXJhdGlvbiAyKQogICAgICAgICAgIC0gY29uc3Q6IG9jdCxzdG0zMm1wMTV4
eC1vc2QzMgogICAgICAgICAgIC0gZW51bToKICAgICAgICAgICAgICAgLSBzdCxzdG0zMm1wMTU3
Ci0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
