Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B49BD53C95F
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jun 2022 13:32:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47CB7C03FD5;
	Fri,  3 Jun 2022 11:32:43 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56250C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jun 2022 09:44:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <lgo@pengutronix.de>)
 id 1nx3r4-0007Rd-Ob; Fri, 03 Jun 2022 11:44:30 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1nx3r2-006C5F-Uf; Fri, 03 Jun 2022 11:44:27 +0200
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1nx3r0-008rdX-TF; Fri, 03 Jun 2022 11:44:26 +0200
From: =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  3 Jun 2022 11:44:20 +0200
Message-Id: <20220603094422.2112746-1-l.goehrs@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: lgo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Fri, 03 Jun 2022 11:32:41 +0000
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: fix missing internally
	connected voltage regulator for OSD32MP1
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

QWNjb3JkaW5nIHRvIHRoZSBPU0QzMk1QMSBQb3dlciBTeXN0ZW0gb3ZlcnZpZXdbMV0gbGRvMydz
IGlucHV0IGlzIGFsd2F5cwppbnRlcm5hbGx5IGNvbm5lY3RlZCB0byB2ZGRfZGRyLgoKWzFdOiBo
dHRwczovL29jdGF2b3N5c3RlbXMuY29tL2FwcF9ub3Rlcy9vc2QzMm1wMS1wb3dlci1zeXN0ZW0t
b3ZlcnZpZXcvI2Nvbm5lY3Rpb25zCgpTaWduZWQtb2ZmLWJ5OiBMZW9uYXJkIEfDtmhycyA8bC5n
b2VocnNAcGVuZ3V0cm9uaXguZGU+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgt
b3NkMzIuZHRzaSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3NkMzIuZHRzaSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNXh4LW9zZDMyLmR0c2kKaW5kZXggNjcwNmQ4MzExYTY2Li5lOTk3
YzQ5NTNmZDEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LW9zZDMy
LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3NkMzIuZHRzaQpAQCAt
NzgsNiArNzgsNyBAQCByZWd1bGF0b3JzIHsKIAkJCWNvbXBhdGlibGUgPSAic3Qsc3RwbWljMS1y
ZWd1bGF0b3JzIjsKIAogCQkJbGRvMS1zdXBwbHkgPSA8JnYzdjM+OworCQkJbGRvMy1zdXBwbHkg
PSA8JnZkZF9kZHI+OwogCQkJbGRvNi1zdXBwbHkgPSA8JnYzdjM+OwogCQkJcHdyX3N3MS1zdXBw
bHkgPSA8JmJzdF9vdXQ+OwogCi0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
