Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD4E459F43
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Nov 2021 10:30:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1655AC5C82A;
	Tue, 23 Nov 2021 09:30:14 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27EE6C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Nov 2021 09:30:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mpS7f-0004zK-Ra; Tue, 23 Nov 2021 10:29:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1mpS7b-000acE-Qa; Tue, 23 Nov 2021 10:29:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mpS7a-0004Y4-RI; Tue, 23 Nov 2021 10:29:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>
Date: Tue, 23 Nov 2021 10:29:34 +0100
Message-Id: <20211123092939.82705-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Sean Anderson <sean.anderson@seco.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Naidu Tellapati <naidu.tellapati@imgtec.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, kernel@pengutronix.de,
 linux-tegra@vger.kernel.org, Ed Blake <ed.blake@sondrel.com>,
 linux-sunxi@lists.linux.dev, Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: [Linux-stm32] [PATCH 0/5] pwm: Cleanup of variable names used for
	driver data
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

RnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHV3ZUBrbGVpbmUta29lbmlnLm9yZz4KCkhlbGxvLAoK
U2VhbiBBbmRlcnNvbiByaWdodGx5IHBvaW50ZWQgb3V0IHRoYXQgdmFyaWFibGVzIGhvbGRpbmcg
ZHJpdmVyIHByaXZhdGUKZGF0YSBhcmUgbmFtZWQgYmFkbHkgKGluIHJlcGx5IHRvIG15IHJlcXVl
c3QgdG8gcGljayBhIGJldHRlciBuYW1lIHRoYW4KInB3bSIgaW4gYSBuZXcgZHJpdmVyKS4gQSBk
ZWVwZXIgbG9vayBpbnRvIHRoZSBmZXcgdGhhdCB1c2VkICJwd20iIHNob3dzCnRoYXQgdGhpcyBu
YW1lIGlzbid0IGV2ZW4gdXNlZCBjb25zaXN0ZW50bHkuCgpUaGlzIHNlcmllcyB1cGRhdGVzIHRo
ZXNlIGZvdXIgZHJpdmVycyB0byB1c2UgYSBiZXR0ZXIgbmFtZSBhbmQgdXNlIHRoYXQKb25lIGNv
bnNpc3RlbnRseS4KClV3ZSBLbGVpbmUtS8O2bmlnICg1KToKICBwd206IGltZzogUmVuYW1lIHZh
cmlhYmxlIHBvaW50aW5nIHRvIGRyaXZlciBwcml2YXRlIGRhdGEKICBwd206IHRlZ3JhOiBSZW5h
bWUgdmFyaWFibGUgcG9pbnRpbmcgdG8gZHJpdmVyIHByaXZhdGUgZGF0YQogIHB3bTogc3VuNGk6
IFJlbmFtZSB2YXJpYWJsZSBwb2ludGluZyB0byBkcml2ZXIgcHJpdmF0ZSBkYXRhCiAgcHdtOiBz
dG1wZTogRHJvcCB1bnVzZWQgc2V0dGluZyBvZiBkcml2ZXIgZGF0YQogIHB3bTogc3RtcGU6IFJl
bmFtZSB2YXJpYWJsZSBwb2ludGluZyB0byBkcml2ZXIgcHJpdmF0ZSBkYXRhCgogZHJpdmVycy9w
d20vcHdtLWltZy5jICAgfCAxNDEgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLQogZHJpdmVycy9wd20vcHdtLXN0bXBlLmMgfCAgMTggKysrLS0KIGRyaXZlcnMvcHdtL3B3
bS1zdW40aS5jIHwgIDcwICsrKysrKysrKystLS0tLS0tLS0tCiBkcml2ZXJzL3B3bS9wd20tdGVn
cmEuYyB8ICA1OCArKysrKysrKy0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAxNDIgaW5zZXJ0
aW9ucygrKSwgMTQ1IGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiAxMzYwNTcyNTY2ODZkZTM5
Y2MzYTA3YzJlMzllZjZiYzQzMDAzZmY2Ci0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
