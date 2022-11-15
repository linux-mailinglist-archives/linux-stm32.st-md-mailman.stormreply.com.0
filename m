Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E4F6296EB
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Nov 2022 12:14:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A832C65065;
	Tue, 15 Nov 2022 11:14:07 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F16AC64104
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Nov 2022 11:14:06 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1outt9-0006Wj-F7; Tue, 15 Nov 2022 12:13:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1outt7-004Qge-4y; Tue, 15 Nov 2022 12:13:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1outt6-00GmRW-H9; Tue, 15 Nov 2022 12:13:56 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 15 Nov 2022 12:13:42 +0100
Message-Id: <20221115111347.3705732-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=7rPBwJevdQ+2sW+V16c3FLA/Bg4E6IZ1UGHCHMSd8vk=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjc3RT5epQS2wkIfzkgW6NZTxt/iRFvT/kHvQ+BUT0
 qWOyS0eJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY3N0UwAKCRDB/BR4rcrsCa65CA
 CgrZ341oBSYn6LOJzwyKiXyXvArhKMIm/mlz7IaIU05IabORapJOCR03zOruo/r/izutuSr5PB7jx3
 jw7tox8UHFTtUKuR1Tf2MrWr6OtuD1rhLLv/Dn14BljnPaiTqyb+sfl3VfpW3UA9li6ZAh/9pnJPVp
 gV5uvHpBpy4mXYCYMVPhBAhvCZ6FqZYRtOYjB1KHpicInqdqY3z9W8Stv2fDcoTeO5AlxEFH9pdCbW
 7hTleO/4vXUBY+MwaKdR54jGMpSdaOO2wenaWCxybhnFh8QxqhJM7yx10Cyi/PVpomL/W9cZdkxoAt
 uLbd2AsEG2dBZVo2727pna5u6RbCXS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH 0/5] pwm: Use regmap_clear_bits and
	regmap_set_bits where applicable
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

SGVsbG8sCgpJIHJlY2VudGx5IGxlYXJuZWQgYSBiaXQgb2YgY29jY2luZWxsZSBhbmQgdHJpZ2dl
cmVkIGJ5IFBhdWwgQ2VyY3VlaWwncwpwYXRjaCB0aGF0IHJlcGxhY2VzIHJlZ21hcF91cGRhdGVf
Yml0cygpIGJ5IHJlZ21hcF9zZXRfYml0cygpIGFuZApyZWdtYXBfY2xlYXJfYml0cygpIHdoZXJl
IGFwcGxpY2FibGUgaW4gdGhlIGp6NDc0MCBwd20gZHJpdmVyWzFdIEkKY3JlYXRlZCBhIGNvY2Np
IHBhdGNoIGZvciBzdWNoIGNhbGxzLgoKVGhpcyBzZXJpZXMgYWRhcHRzIHRoZSBvdGhlciBkcml2
ZXJzIGJlbG93IGRyaXZlcnMvcHdtIGFjY29yZGluZ2x5LgoKQmVzdCByZWdhcmRzClV3ZQoKWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXB3bS8yMDIyMTAyNDIwNTIxMy4zMjcwMDEt
Ni1wYXVsQGNyYXBvdWlsbG91Lm5ldAoKVXdlIEtsZWluZS1Lw7ZuaWcgKDUpOgogIHB3bTogZnNs
LWZ0bTogVXNlIHJlZ21hcF9jbGVhcl9iaXRzIGFuZCByZWdtYXBfc2V0X2JpdHMgd2hlcmUKICAg
IGFwcGxpY2FibGUKICBwd206IGltZzogVXNlIHJlZ21hcF9jbGVhcl9iaXRzIGFuZCByZWdtYXBf
c2V0X2JpdHMgd2hlcmUgYXBwbGljYWJsZQogIHB3bTogaXFzNjIwYTogVXNlIHJlZ21hcF9jbGVh
cl9iaXRzIGFuZCByZWdtYXBfc2V0X2JpdHMgd2hlcmUKICAgIGFwcGxpY2FibGUKICBwd206IHN0
bTMyLWxwOiBVc2UgcmVnbWFwX2NsZWFyX2JpdHMgYW5kIHJlZ21hcF9zZXRfYml0cyB3aGVyZQog
ICAgYXBwbGljYWJsZQogIHB3bTogc3RtMzI6IFVzZSByZWdtYXBfY2xlYXJfYml0cyBhbmQgcmVn
bWFwX3NldF9iaXRzIHdoZXJlIGFwcGxpY2FibGUKCiBkcml2ZXJzL3B3bS9wd20tZnNsLWZ0bS5j
ICB8IDE4ICsrKysrKystLS0tLS0tLS0tLQogZHJpdmVycy9wd20vcHdtLWltZy5jICAgICAgfCAx
NSArKysrKysrLS0tLS0tLS0KIGRyaXZlcnMvcHdtL3B3bS1pcXM2MjBhLmMgIHwgIDQgKystLQog
ZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMgfCAgNSArKy0tLQogZHJpdmVycy9wd20vcHdtLXN0
bTMyLmMgICAgfCAzNCArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiA1IGZpbGVz
IGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0
OiAwOTQyMjZhZDk0ZjQ3MWE5ZjE5ZThmOGU3MTQwYTA5YzI2MjVhYmFhCi0tIAoyLjM4LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
