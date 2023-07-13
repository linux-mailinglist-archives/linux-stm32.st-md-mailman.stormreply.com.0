Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC47527B5
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 17:51:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB8C8C6B452;
	Thu, 13 Jul 2023 15:51:53 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FEB9C6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 15:51:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJybd-0004ij-9i; Thu, 13 Jul 2023 17:51:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJybb-00E9K5-Nf; Thu, 13 Jul 2023 17:51:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJyba-004abb-R2; Thu, 13 Jul 2023 17:51:46 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 13 Jul 2023 17:51:40 +0200
Message-Id: <20230713155142.2454010-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=468;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=//lOGqdNdXNCdEeL8d8m/BvDxCXBlJuLn/WpNm1m1/k=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBksB2Lt1WziiSIi+81Xpx9JCYCfHe3gdspXzrYC
 DWnPfcd3O6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZLAdiwAKCRCPgPtYfRL+
 TqqaB/0fRuKIFfsar/dMe4rsZk4UX+K/D47KCukO7yjzAtpiAX2EM4ji7eLGM3PM5ufJfY/Be9o
 PbDwdJ6fBnJqYY/wdI/cXUS6b2omSti7pTTg9vtqVRlHih72jmXEDK9D4xkR29NOU0BQsGWlnAs
 d3204t079pt0TTwb4VJRVct3mte+Ae9x9GkpzB798mcEmedTKef7V2t8vVwk+FxLIg71eJ/gZB3
 5Qh7AjY3qFVGHnWcadm1wWNJiNY6qiIVR27SBh/x7QbUKPl0zjJuksJLl+MKa0nBsXJLBKO7T6O
 i9UOpDlYX80/OtXjQzAw4Ukcf8Vq4CrOO/OKcgQxga6khjNL
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] pwm: stm32: A (small) fix and a cleanup
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

SGVsbG8sCgpJIHdhcyBzdXJwcmlzZWQgd2hlbiBJIHNwb3R0ZWQgdGhlIHN0bTMyIGNhbGxpbmcg
cHdtX2Rpc2FibGUoKSBpbiB0aGUKcmVtb3ZlIGNhbGxiYWNrLiBJIHRob3VnaHQgSSBmaXhlZCBh
bGwgZHJpdmVycyBpbiB0aGlzIHJlZ2FyZC4KCkJlc3QgcmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUt
S8O2bmlnICgyKToKICBwd206IHN0bTMyOiBEb24ndCBtb2RpZnkgSFcgc3RhdGUgaW4gLnJlbW92
ZSgpIGNhbGxiYWNrCiAgcHdtOiBzdG0zMjogU2ltcGxpZnkgdXNpbmcgZGV2bV9wd21jaGlwX2Fk
ZCgpCgogZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgfCAxNCArLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMyBkZWxldGlvbnMoLSkKCmJhc2UtY29tbWl0OiAw
NmMyYWZiODYyZjlkYThkYzVlZmE0YjYwNzZhMGU0OGMzZmJhYWE1Ci0tIAoyLjM5LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
