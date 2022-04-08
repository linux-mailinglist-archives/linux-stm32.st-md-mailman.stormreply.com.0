Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBB74F8EE8
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Apr 2022 08:35:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6EFFC62D31;
	Fri,  8 Apr 2022 06:35:17 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33257C628AE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Apr 2022 06:35:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nciD8-0002FR-Ep; Fri, 08 Apr 2022 08:35:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nciD6-001kex-8Y; Fri, 08 Apr 2022 08:35:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nciD4-001ukW-0I; Fri, 08 Apr 2022 08:35:06 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Fri,  8 Apr 2022 08:35:00 +0200
Message-Id: <20220408063502.136403-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=694; h=from:subject;
 bh=os+sB465SUAoV3Y8OsU7DaePMiyec5Wvr70CxiCJCyI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiT9eM0iRXjV1Ht7pazClNVlbL//HKP30hOBKaXeix
 YorcU8mJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYk/XjAAKCRDB/BR4rcrsCS/tB/
 4ghq9F68lfO3lSrTRFIMPZvE3nQIK39+WFcbK63JGXiTSri5vOLbNaqVrdsl/ZZMynJ+CIiS7kdOyp
 Qb7E3f6S9r7Gg0KWVuF3zEH1jgfC3WwbxMW5TbXcqF0mcyf7aD+AaWgI36WxZrxWQCg5oPDAIV0cNx
 66ep8SQPIrrwtuLTyZPDqQzVykLn/vGQGur3f048jguHkUmEB5FS6fCNK0k7qflIGEV1dcYGwCqz98
 clAx1q3sXx4WQ23OLPM5KHUJHulMgbeasL9ICMhqST6NPDAZFsRUZNF5JXTscKDDJx5NyqtWw+U6u4
 FVAd0Rq1l9M/PvukTcA1uWZmAOWXuc
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
Subject: [Linux-stm32] [PATCH v3 0/2] ARM: dts: stm32: Add timer interrupts
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

SGVsbG8sCgpjb21wYXJlZCB0byB2MgooaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJt
LWtlcm5lbC8yMDIxMTIxNTIwMzcwOS41MjkxNi0xLXUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25p
eC5kZSkKSSBtZW50aW9uZW5kIHRoZSBTb0MgdmFyaWFudCBpbiB0aGUgc3ViamVjdCBsaW5lIGFu
ZCBhZGRlZCBSb2IgdG8gVG86IHRvCmdldCBhbiBhbGwgY2xlYXIgZm9yIHRoZSBTVE0gcGVvcGxl
IHRvIGFwcGx5IGl0LiAoQm90aCBpbmRpY2F0ZWQgYnkKQWxleGFuZHJlIHZpYSBQTS4pCgpCZXN0
IHJlZ2FyZHMKVXdlCgpVd2UgS2xlaW5lLUvDtm5pZyAoMik6CiAgZHQtYmluZGluZ3M6IG1mZDog
c3RtMzItdGltZXJzOiBEb2N1bWVudCBob3cgdG8gc3BlY2lmeSBpbnRlcnJ1cHRzCiAgQVJNOiBk
dHM6IHN0bTMybXAxNXg6IEFkZCB0aW1lciBpbnRlcnJ1cHRzCgogLi4uL2JpbmRpbmdzL21mZC9z
dCxzdG0zMi10aW1lcnMueWFtbCAgICAgICAgIHwgMTMgKysrKysrKwogYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJtcDE1MS5kdHNpICAgICAgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspCgoKYmFzZS1jb21taXQ6IDMxMjMxMDky
ODQxNzZiMTUzMjg3NDU5MWY3YzgxZjM4MzdiYmRjMTcKLS0gCjIuMzUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
