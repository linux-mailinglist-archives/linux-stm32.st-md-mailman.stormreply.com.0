Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EAA700E03
	for <lists+linux-stm32@lfdr.de>; Fri, 12 May 2023 19:38:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5017BC6907C;
	Fri, 12 May 2023 17:38:52 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA4A9C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 May 2023 17:38:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pxWil-0004jz-32; Fri, 12 May 2023 19:38:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pxWig-0031HJ-Qu; Fri, 12 May 2023 19:38:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pxWif-003nru-TC; Fri, 12 May 2023 19:38:17 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Genoud <richard.genoud@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexander Shiyan <shc_work@mail.ru>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Peter Korsgaard <jacmet@sunsite.dk>, Michal Simek <michal.simek@amd.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 YueHaibing <yuehaibing@huawei.com>
Date: Fri, 12 May 2023 19:38:08 +0200
Message-Id: <20230512173810.131447-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Vax8qKrHs4Gg+inxaybO9VSOevVZbn78AXGxPoOWfRs=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkXnl7GQba5f5/U9cBAKa1hjmTkzHwcbmipUsOS
 R9QOs4EtJaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZF55ewAKCRCPgPtYfRL+
 TkTLB/0TZE6vdhOclWvy8SNtqKjv+Rn0YSIBBG4CWqadlJ+ZNF98QzZYOK9mq+DMx9Nlh0SliR3
 9IEkl9LfM1AwaHuutbbVFHSmIPmFAVDlglYyrXfPGkNqAmGz5HguCTdhhYA8ttnwFsiqRaKS7eI
 2U3Y3SZoNHKLbdL9raPKYgE+kPZdENXdZ00Mfi/X+pEd7YoDPQsLR0n56HmA7djs6vgCygf0vQ7
 2qkqKcQWzGq6cLNkrfEnHU6FOSbZ8g+Ok2fZM5CbG3fOBMrvpi5D7G3pRbIBLjmjUbdxJ+jw1N+
 wCxIzQKFofDjbhJWFzrnx6pFew81qeYnzzF4mdbuJfeeSwXQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>,
 linux-serial@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] serial: Make uart_remove_one_port()
	return void
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

SGVsbG8sCgp0aGlzIGlzIHBhcnQgb2YgYSBxdWVzdCB0byBtYWtlIHN0cnVjdCBwbGF0Zm9ybV9k
cml2ZXI6OnJlbW92ZSByZXR1cm4Kdm9pZC4gQnV0IHRoaXMgc2VyaWVzIGNhbiBiZSBjb25zaWRl
cmVkIGEgY2xlYW51cCBvbiBpdHMgb3duLgoKVGhlIG1vdGl2YXRpb24gdG8gbWFrZSB0aGUgcmVt
b3ZlIGNhbGxiYWNrIG9mIHBsYXRmb3JtIGRyaXZlcnMgcmV0dXJuCnZvaWQgaXMgdGhhdCByZXR1
cm5pbmcgYW4gaW50IG1ha2UgZHJpdmVyIGF1dGhvcnMgKHdyb25nbHkpIGFzc3VtZSB0aGVyZQpp
cyBzb21lIGtpbmQgb2YgZXJyb3IgaGFuZGxpbmcgaW4gdGhlIGNvcmUgYW5kIGl0J3MgYSBnb29k
IGlkZWEgdG8KcmV0dXJuIGFuIGVycm9yIGNvZGUuIEluIHJlYWxpdHkgYSByZXR1cm5lZCBlcnJv
ciBjb2RlIGlzIGlnbm9yZWQgd2hpY2gKeWllbGRzIHRvIGxlYWtlZCByZXNvdXJjZXMgYW5kIGlu
IHNvbWUgY2FzZXMgYWxzbyB1c2UtYWZ0ZXItZnJlZQpzaXR1YXRpb25zIGJlY2F1c2UgZm9yIGV4
YW1wbGUgdGhlIGRldmljZSBpc24ndCBkaXNhYmxlZCBhbmQgc28gbGF0ZXIgYW4KaXJxIG1pZ2h0
IHRyaWdnZXIgd2hpbGUgdGhlIHJlZ2lzdGVyIG1hcHBpbmcgaXMgYWxyZWFkeSBnb25lLgoKQmVz
dCByZWdhcmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDIpOgogIHNlcmlhbDogc3RtMzI6IEln
bm9yZSByZXR1cm4gdmFsdWUgb2YgdWFydF9yZW1vdmVfb25lX3BvcnQoKSBpbgogICAgLnJlbW92
ZSgpCiAgc2VyaWFsOiBNYWtlIHVhcnRfcmVtb3ZlX29uZV9wb3J0KCkgcmV0dXJuIHZvaWQKCiBk
cml2ZXJzL3R0eS9zZXJpYWwvYXRtZWxfc2VyaWFsLmMgICAgICAgICAgIHwgIDUgKystLS0KIGRy
aXZlcnMvdHR5L3NlcmlhbC9jbHBzNzExeC5jICAgICAgICAgICAgICAgfCAgNCArKystCiBkcml2
ZXJzL3R0eS9zZXJpYWwvY3BtX3VhcnQvY3BtX3VhcnRfY29yZS5jIHwgIDUgKysrKy0KIGRyaXZl
cnMvdHR5L3NlcmlhbC9pbXguYyAgICAgICAgICAgICAgICAgICAgfCAgNCArKystCiBkcml2ZXJz
L3R0eS9zZXJpYWwvbGFudGlxLmMgICAgICAgICAgICAgICAgIHwgIDQgKysrLQogZHJpdmVycy90
dHkvc2VyaWFsL3NlcmlhbF9jb3JlLmMgICAgICAgICAgICB8ICA2ICstLS0tLQogZHJpdmVycy90
dHkvc2VyaWFsL3N0LWFzYy5jICAgICAgICAgICAgICAgICB8ICA0ICsrKy0KIGRyaXZlcnMvdHR5
L3NlcmlhbC9zdG0zMi11c2FydC5jICAgICAgICAgICAgfCAgNSArLS0tLQogZHJpdmVycy90dHkv
c2VyaWFsL3VhcnRsaXRlLmMgICAgICAgICAgICAgICB8IDEyICsrKystLS0tLS0tLQogZHJpdmVy
cy90dHkvc2VyaWFsL3hpbGlueF91YXJ0cHMuYyAgICAgICAgICB8ICA1ICsrLS0tCiBpbmNsdWRl
L2xpbnV4L3NlcmlhbF9jb3JlLmggICAgICAgICAgICAgICAgIHwgIDIgKy0KIDExIGZpbGVzIGNo
YW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiBh
YzlhNzg2ODFiOTIxODc3NTE4NzYzYmEwZTg5MjAyMjU0MzQ5ZDFiCi0tIAoyLjM5LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
