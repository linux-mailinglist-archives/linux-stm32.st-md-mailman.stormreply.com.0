Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F046300CB
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Nov 2022 23:48:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CCD2C6507B;
	Fri, 18 Nov 2022 22:48:29 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3EBDC65067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Nov 2022 22:48:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA9j-0005LY-CE; Fri, 18 Nov 2022 23:48:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA9g-0058sY-Gr; Fri, 18 Nov 2022 23:48:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1owA9g-0000Uq-Fk; Fri, 18 Nov 2022 23:48:16 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Corey Minyard <cminyard@mvista.com>,
 Colin Ian King <colin.i.king@gmail.com>
Date: Fri, 18 Nov 2022 23:45:18 +0100
Message-Id: <20221118224540.619276-585-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 584/606] usb: typec: ucsi: stm32g0: Convert to
	i2c's .probe_new()
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

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
ClRoZSBwcm9iZSBmdW5jdGlvbiBkb2Vzbid0IG1ha2UgdXNlIG9mIHRoZSBpMmNfZGV2aWNlX2lk
ICogcGFyYW1ldGVyIHNvIGl0CmNhbiBiZSB0cml2aWFsbHkgY29udmVydGVkLgoKU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
LS0tCiBkcml2ZXJzL3VzYi90eXBlYy91Y3NpL3Vjc2lfc3RtMzJnMC5jIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL3R5cGVjL3Vjc2kvdWNzaV9zdG0zMmcwLmMgYi9kcml2ZXJzL3VzYi90eXBl
Yy91Y3NpL3Vjc2lfc3RtMzJnMC5jCmluZGV4IDdiOTJmMGM4ZGU3MC4uOTNmZWFkMDA5NmI3IDEw
MDY0NAotLS0gYS9kcml2ZXJzL3VzYi90eXBlYy91Y3NpL3Vjc2lfc3RtMzJnMC5jCisrKyBiL2Ry
aXZlcnMvdXNiL3R5cGVjL3Vjc2kvdWNzaV9zdG0zMmcwLmMKQEAgLTYyNiw3ICs2MjYsNyBAQCBz
dGF0aWMgaW50IHVjc2lfc3RtMzJnMF9wcm9iZV9ib290bG9hZGVyKHN0cnVjdCB1Y3NpICp1Y3Np
KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IHVjc2lfc3RtMzJnMF9wcm9iZShzdHJ1Y3Qg
aTJjX2NsaWVudCAqY2xpZW50LCBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCAqaWQpCitzdGF0
aWMgaW50IHVjc2lfc3RtMzJnMF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogewog
CXN0cnVjdCBkZXZpY2UgKmRldiA9ICZjbGllbnQtPmRldjsKIAlzdHJ1Y3QgdWNzaV9zdG0zMmcw
ICpnMDsKQEAgLTc2Myw3ICs3NjMsNyBAQCBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgdWNzaV9z
dG0zMmcwX2kyY19kcml2ZXIgPSB7CiAJCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cih1
Y3NpX3N0bTMyZzBfdHlwZWNfb2ZfbWF0Y2gpLAogCQkucG0gPSBwbV9zbGVlcF9wdHIoJnVjc2lf
c3RtMzJnMF9wbV9vcHMpLAogCX0sCi0JLnByb2JlID0gdWNzaV9zdG0zMmcwX3Byb2JlLAorCS5w
cm9iZV9uZXcgPSB1Y3NpX3N0bTMyZzBfcHJvYmUsCiAJLnJlbW92ZSA9IHVjc2lfc3RtMzJnMF9y
ZW1vdmUsCiAJLmlkX3RhYmxlID0gdWNzaV9zdG0zMmcwX3R5cGVjX2kyY19kZXZpZAogfTsKLS0g
CjIuMzguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
