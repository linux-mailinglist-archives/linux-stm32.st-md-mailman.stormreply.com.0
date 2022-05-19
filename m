Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D53652DA32
	for <lists+linux-stm32@lfdr.de>; Thu, 19 May 2022 18:28:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F101C03FE2;
	Thu, 19 May 2022 16:28:54 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C0EDC03FC2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 May 2022 16:28:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nrj13-0003N4-Cf; Thu, 19 May 2022 18:28:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nrj12-003Jhj-UD; Thu, 19 May 2022 18:28:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nrj10-00AnKT-Sg; Thu, 19 May 2022 18:28:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Thu, 19 May 2022 18:28:37 +0200
Message-Id: <20220519162838.695404-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265; h=from:subject;
 bh=ncCq/TA6V9++RyI13hNtZmFRXl6sYaVPYUg+GsnWc4c=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBihnAvGhr9nOa0pWJvT9RF6KrW8un7+4LqzYSTdrrq
 7XxKJoKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYoZwLwAKCRDB/BR4rcrsCdhcB/
 0aGmpznMXf+zDA6YDJLSLaxSjny+WbP0F3Cc3Pn7dsB9ht0CHucxsktO89aPqv2hKiSU+5eX9dVJ1G
 8IQsdD+qU9YmG4+cQU7FS6Uh1bCnEkEsZgD+rVXrBs8GSlNVU7/gpLjFzqmrfQhKmgJu4JNkHQo0lE
 oQ8CCYPb+aMlJmBgb4PWaU9DcL/eFZL5JhQ359mQyv/7/3Jwt5bqvW0nlKiR2kVNF5FDSRcB1ljWSx
 yfRs2btxvYs+aY7LwIn/lGzXTzZFj9iSR6ERq2bdo3hIgnUS1XjH9hiLrHkaOFwSAopukk+wSWOTB5
 wqIU+rFg025Z3c4VxTAfD22qNVePAA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/2] dt-bindings: mfd: stm32-timers:
	Document how to specify interrupts
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

VGhlIHRpbWVyIHVuaXRzIGluIHRoZSBzdG0zMm1wMSBDUFVzIGhhdmUgaW50ZXJydXB0cywgZGVw
ZW5kaW5nIG9uIHRoZQp0aW1lciBmbGF2b3VyIGVpdGhlciBvbmUgImdsb2JhbCIgb3IgZm91ciBk
ZWRpY2F0ZWQgb25lcy4gRG9jdW1lbnQgaG93CnRvIGZvcm1hbGl6ZSB0aGVzZSBpbiBhIGRldmlj
ZSB0cmVlLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4KLS0tCkNoYW5nZXMgc2luY2UgdjM6CiAgLSBEbyB0aGUgdGhpbmdz
IFJvYiBzdWdnZXN0ZWQgaW4gcmVxbHkgdG8gdjEgd2hpY2ggSSBkaWRuJ3Qgbm90aWNlCiAgICB1
bnRpbCBGYWJyaWNlIHRvbGQgbWUgaW4gcmVwbHkgdG8gdjMuCgogLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWZkL3N0LHN0bTMyLXRpbWVycy55YW1sICB8IDE1ICsrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bTMyLXRpbWVycy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG0zMi10aW1lcnMueWFtbAppbmRleCAx
MGIzMzBkNDI5MDEuLjViMDViMmVjMTcyOCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG0zMi10aW1lcnMueWFtbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bTMyLXRpbWVycy55YW1sCkBAIC00Niw2
ICs0NiwyMSBAQCBwcm9wZXJ0aWVzOgogICAgIG1pbkl0ZW1zOiAxCiAgICAgbWF4SXRlbXM6IDcK
IAorICBpbnRlcnJ1cHRzOgorICAgIG9uZU9mOgorICAgICAgLSBtYXhJdGVtczogMQorICAgICAg
LSBtYXhJdGVtczogNAorCisgIGludGVycnVwdC1uYW1lczoKKyAgICBvbmVPZjoKKyAgICAgIC0g
aXRlbXM6CisgICAgICAgICAgLSBjb25zdDogZ2xvYmFsCisgICAgICAtIGl0ZW1zOgorICAgICAg
ICAgIC0gY29uc3Q6IGJyaworICAgICAgICAgIC0gY29uc3Q6IHVwCisgICAgICAgICAgLSBjb25z
dDogdHJnLWNvbQorICAgICAgICAgIC0gY29uc3Q6IGNjCisKICAgIiNhZGRyZXNzLWNlbGxzIjoK
ICAgICBjb25zdDogMQogCgpiYXNlLWNvbW1pdDogMzEyMzEwOTI4NDE3NmIxNTMyODc0NTkxZjdj
ODFmMzgzN2JiZGMxNwotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
