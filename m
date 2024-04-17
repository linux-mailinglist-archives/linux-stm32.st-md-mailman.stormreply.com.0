Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 220818A7F10
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 11:04:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE987C6DD67;
	Wed, 17 Apr 2024 09:04:35 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A5BEC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 09:04:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rx1DD-0004ol-PA; Wed, 17 Apr 2024 11:04:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rx1DB-00ClGE-Q8; Wed, 17 Apr 2024 11:04:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rx1DB-002hLw-2J;
 Wed, 17 Apr 2024 11:04:13 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 17 Apr 2024 11:03:26 +0200
Message-ID: <cover.1713344161.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=710;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=Vy9RxpGJFkyUUn1WJcrbkWAi2j1VMThp4FrzwrvO4aY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmH5BfsTno6WspytFGVGdPtgzDOQ57SnStMVreu
 xnM2THkVyGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZh+QXwAKCRCPgPtYfRL+
 ThT0B/44IBFxXJkLjJrE/ZG1oW5gVoGKgsjniS6CKQaN3sKpXtV58WnkjbVzW/iQNtUyNH0oVKj
 CU5w+Uf2f1Ht2+HFLei+OBZKtRczvYGbg03N34JytZkuIw1OOTwcSm180aqgAnRE5tDtX8+Y34t
 0OcAyitQ9FFpZWu/mUTFdkg9bzAmq3AckFCC1TH5cChVcTfAjCKybeMY8zO4mcau9DLGik+y/25
 uOSzEFI95gj+Z18uL3fend9iOdVqaiXwfs2AxeeZTx8o+dlVjttT/2SYFBWYl4UFxDFg0aQJ7il
 DA66aUf0nvLSJGXlsz5mywjXv95Hq3AfrGhJ+Mp9ZR2jzwBA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Peter Hurley <peter@hurleysoftware.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, linux-serial@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: [Linux-stm32] [PATCH 0/2] serial: stm32: Two fixes
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

SGVsbG8sCgp0aGlzIHNlcmllcyBjb250YWlucyB0byBmaXhlcyB0aGF0IHRhcmdldCB2Ni45IGFu
ZCBJTUhPIHNob3VsZCBhbHNvIGdldApiYWNrcG9ydGVkIHRvIHN0YWJsZS4gRm9yIHRoYXQgcmVh
c29uIEkgYWRkZWQgYSBDYzogc3RhYmxlIGxpbmUgdG8gYm90aApwYXRjaGVzLgoKVGhlIGZpcnN0
IHBhdGNoIGlzbid0IHZlcnkgY3JpdGljYWwsIGl0IG9ubHkgaW1wcm92ZXMgdGhlIGRyaXZlcidz
CmJlaGF2aW91ciBpZiBhbm90aGVyIHByb2JsZW0gcG9wcyB1cCBpbiB0aGUgZnV0dXJlIHRoYXQg
cmVzdWx0cyBpbiBhbgp1bmhhbmRsZWQgaXJxLiBUaGUgc2Vjb25kIGZpeGVzIGEgcmVhbCBwcm9i
bGVtIGZvciBtZS4KCkJlc3QgcmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnICgyKToKICBz
ZXJpYWw6IHN0bTMyOiBSZXR1cm4gSVJRX05PTkUgaW4gdGhlIElTUiBpZiBubyBoYW5kbGluZyBo
YXBwZW5kCiAgc2VyaWFsOiBzdG0zMjogUmVzZXQgLnRocm90dGxlZCBzdGF0ZSBpbiAuc3RhcnR1
cCgpCgogZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMgfCAxMyArKysrKysrKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmJhc2Ut
Y29tbWl0OiA0ZWFiMzU4OTMwNzExYmJlYjg1YmY1ZWUyNjdkMGQ0MmQzMzk0YzJjCi0tIAoyLjQz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
