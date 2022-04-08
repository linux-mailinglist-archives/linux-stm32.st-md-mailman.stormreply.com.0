Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB444F8EE6
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Apr 2022 08:35:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEC4EC628C4;
	Fri,  8 Apr 2022 06:35:17 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB1A1C628AE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Apr 2022 06:35:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nciD8-0002FQ-Ep; Fri, 08 Apr 2022 08:35:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nciD6-001keu-5n; Fri, 08 Apr 2022 08:35:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nciD4-001ukZ-4E; Fri, 08 Apr 2022 08:35:06 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Fri,  8 Apr 2022 08:35:01 +0200
Message-Id: <20220408063502.136403-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408063502.136403-1-u.kleine-koenig@pengutronix.de>
References: <20220408063502.136403-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035; h=from:subject;
 bh=tBPZE8MZQkUvzLqkbv8EsZiY1Xv+3A1LHPDki3h4neA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiT9eQbRUnT+VKiMWUyd/90oK4OxYrzWMl2lZzsFtV
 NKTjewiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYk/XkAAKCRDB/BR4rcrsCe+0B/
 4wH97qsebsoQ4WN3v6oL2VGB/xne47QYZYB5DyI6lIXKb6PYAoT8KpOn6ez18bk5m6nqDHYDDvQWcO
 QfKB13Lyjmm/LWaZRLd4ytCOKd5Ar5pvWYNucpUd19iOXoczCvTaVjSJAI32U6pwK6ib+3PmQfh7Jm
 /u9Fo0GjZByWLwGPejS/Vv1jKiYUpcbyKHpdOoJEtEvl0/NFFerVXOKQZlXXfHckJbFD6hdc+kSNeB
 xHKDFCiB5S0enqmeI9UZegXhM2dUZTgss6LsNFxnaIbimE1a+jFcgYT6Xm6dk2HxWXKPcH7IYSiXNK
 mCKBJgGnbV8amUuTR9ir+T4i5haX6E
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
Subject: [Linux-stm32] [PATCH v3 1/2] dt-bindings: mfd: stm32-timers:
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
Z0BwZW5ndXRyb25peC5kZT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3Rt
MzItdGltZXJzLnlhbWwgICAgfCAxMyArKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZmQvc3Qsc3RtMzItdGltZXJzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWZkL3N0LHN0bTMyLXRpbWVycy55YW1sCmluZGV4IDEwYjMzMGQ0MjkwMS4uNWU0
MjE0ZDE2MTNiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWZkL3N0LHN0bTMyLXRpbWVycy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZmQvc3Qsc3RtMzItdGltZXJzLnlhbWwKQEAgLTQ2LDYgKzQ2LDE5IEBAIHByb3Bl
cnRpZXM6CiAgICAgbWluSXRlbXM6IDEKICAgICBtYXhJdGVtczogNwogCisgIGludGVycnVwdHM6
CisgICAgbWF4SXRlbXM6IDQKKworICBpbnRlcnJ1cHQtbmFtZXM6CisgICAgYW55T2Y6CisgICAg
ICAtIGl0ZW1zOgorICAgICAgICAgIC0gY29uc3Q6IGdsb2JhbAorICAgICAgLSBpdGVtczoKKyAg
ICAgICAgICAtIGNvbnN0OiBicmsKKyAgICAgICAgICAtIGNvbnN0OiB1cAorICAgICAgICAgIC0g
Y29uc3Q6IHRyZy1jb20KKyAgICAgICAgICAtIGNvbnN0OiBjYworCiAgICIjYWRkcmVzcy1jZWxs
cyI6CiAgICAgY29uc3Q6IDEKIAotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
