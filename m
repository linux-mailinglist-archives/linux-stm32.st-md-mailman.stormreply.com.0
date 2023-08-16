Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B346277E429
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 16:53:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6589FC6B45F;
	Wed, 16 Aug 2023 14:53:44 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 923D7C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 14:53:43 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <lgo@pengutronix.de>)
 id 1qWHtm-0001Ft-4f; Wed, 16 Aug 2023 16:53:26 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1qWHtj-00140M-QO; Wed, 16 Aug 2023 16:53:23 +0200
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1qWHti-00DG1Q-Ph; Wed, 16 Aug 2023 16:53:22 +0200
From: =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
To: valentin.caron@foss.st.com, Alain Volmat <alain.volmat@foss.st.com>,
 Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 16 Aug 2023 16:52:37 +0200
Message-Id: <20230816145237.3159817-1-l.goehrs@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: lgo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: stm32: fix accidential revert to
	byte-sized transfer splitting
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

Q29tbWl0IDZmNDg2NTU2YWJlMzUgKCJzcGk6IHN0bTMyOiByZW5hbWluZyBvZiBzcGlfbWFzdGVy
IGludG8Kc3BpX2NvbnRyb2xsZXIiKSBpbmNsdWRlZCBhbiBhY2NpZGVudGlhbCByZXZlcnRlZCBv
ZiBhIGNoYW5nZSBhZGRlZCBpbgpjb21taXQgMWU0OTI5MTEyNTA3ZiAoInNwaTogc3RtMzI6IHNw
bGl0IGxhcmdlIHRyYW5zZmVycyBiYXNlZCBvbiB3b3JkCnNpemUgaW5zdGVhZCBvZiBieXRlcyIp
LgoKVGhpcyBicmVha3MgbGFyZ2UgU1BJIHRyYW5zZmVycyB3aXRoIHdvcmQgc2l6ZXMgPiA4IGJp
dHMsIHdoaWNoIGFyZQplLmcuIGNvbW1vbiB3aGVuIGRyaXZpbmcgTUlQSSBEQkkgZGlzcGxheXMu
CgpGaXggdGhpcyBieSB1c2luZyBgc3BpX3NwbGl0X3RyYW5zZmVyc19tYXh3b3JkcygpYCBpbnN0
ZWFkIG9mCmBzcGlfc3BsaXRfdHJhbnNmZXJzX21heHNpemUoKWAuCgpGaXhlczogNmY0ODY1NTZh
YmUzNSAoInNwaTogc3RtMzI6IHJlbmFtaW5nIG9mIHNwaV9tYXN0ZXIgaW50byBzcGlfY29udHJv
bGxlciIpClNpZ25lZC1vZmYtYnk6IExlb25hcmQgR8O2aHJzIDxsLmdvZWhyc0BwZW5ndXRyb25p
eC5kZT4KLS0tCiBkcml2ZXJzL3NwaS9zcGktc3RtMzIuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvc3BpL3NwaS1zdG0zMi5jIGIvZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMKaW5kZXggNmQxMGZh
NGFiNzgzOS4uN2RkZjlkYjc3NmIwNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3BpLXN0bTMy
LmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMKQEAgLTEwMDEsOSArMTAwMSw5IEBAIHN0
YXRpYyBpbnQgc3RtMzJfc3BpX3ByZXBhcmVfbXNnKHN0cnVjdCBzcGlfY29udHJvbGxlciAqY3Ry
bCwKIAlpZiAoc3BpLT5jZmctPnNldF9udW1iZXJfb2ZfZGF0YSkgewogCQlpbnQgcmV0OwogCi0J
CXJldCA9IHNwaV9zcGxpdF90cmFuc2ZlcnNfbWF4c2l6ZShjdHJsLCBtc2csCi0JCQkJCQkgIFNU
TTMySDdfU1BJX1RTSVpFX01BWCwKLQkJCQkJCSAgR0ZQX0tFUk5FTCB8IEdGUF9ETUEpOworCQly
ZXQgPSBzcGlfc3BsaXRfdHJhbnNmZXJzX21heHdvcmRzKGN0cmwsIG1zZywKKwkJCQkJCSAgIFNU
TTMySDdfU1BJX1RTSVpFX01BWCwKKwkJCQkJCSAgIEdGUF9LRVJORUwgfCBHRlBfRE1BKTsKIAkJ
aWYgKHJldCkKIAkJCXJldHVybiByZXQ7CiAJfQoKYmFzZS1jb21taXQ6IDJjY2RkMWIxM2M1OTFk
MzA2ZjA0MDFkOThkZWRjNGJkY2QwMmI0MjEKLS0gCjIuMzkuMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
