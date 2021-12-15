Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E580B47636C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Dec 2021 21:37:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95B79C5F1E6;
	Wed, 15 Dec 2021 20:37:32 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E0EDC5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 20:37:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mxb1g-0006jt-Nh; Wed, 15 Dec 2021 21:37:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1mxb1c-004jAZ-H1; Wed, 15 Dec 2021 21:37:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mxb1a-0001PX-Jn; Wed, 15 Dec 2021 21:37:18 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 15 Dec 2021 21:37:07 +0100
Message-Id: <20211215203709.52916-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/2] ARM: dts: stm32: Add timer interrupts
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

SGVsbG8sCgpjb21wYXJlZCB0byAoaW1wbGljaXQpIHYxLCBJIHNwbGl0IHRoZSBjaGFuZ2VzIGlu
dG8gdHdvIHBhdGNoZXMgbm93IGFuZAppbXByb3ZlZCB0aGUgY29tbWl0IGxvZyBhIGJpdC4KCkl0
J3Mgbm90IGVudGlyZWx5IGNsZWFyIHRvIG1lLCB3aG8gd2lsbCBtZXJnZSB0aGVzZSBwYXRjaGVz
IChhc3N1bWluZwp0aGV5IGFyZSBjb25zaWRlcmVkIG9rKT8hCgpCZXN0IHJlZ2FyZHMKVXdlCgpV
d2UgS2xlaW5lLUvDtm5pZyAoMik6CiAgZHQtYmluZGluZ3M6IG1mZDogc3RtMzItdGltZXJzOiBE
b2N1bWVudCBob3cgdG8gc3BlY2lmeSBpbnRlcnJ1cHRzCiAgQVJNOiBkdHM6IHN0bTMyOiBBZGQg
dGltZXIgaW50ZXJydXB0cwoKIC4uLi9iaW5kaW5ncy9tZmQvc3Qsc3RtMzItdGltZXJzLnlhbWwg
ICAgICAgICB8IDEzICsrKysrKysKIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRzaSAg
ICAgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNDcg
aW5zZXJ0aW9ucygrKQoKCmJhc2UtY29tbWl0OiAwYmFmYjhmM2ViYzg0NTI1ZDBhZTBmY2VhMjJk
MTIxNTFiOTkzMTJmCi0tIAoyLjMzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
