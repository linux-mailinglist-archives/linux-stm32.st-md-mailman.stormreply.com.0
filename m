Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF6A47BE5F
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Dec 2021 11:47:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCB29C5E2D4;
	Tue, 21 Dec 2021 10:47:05 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25D6FC5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Dec 2021 10:47:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mzcel-0005B7-VS; Tue, 21 Dec 2021 11:46:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1mzceh-005nfr-LC; Tue, 21 Dec 2021 11:46:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mzceg-0004BP-Dm; Tue, 21 Dec 2021 11:46:02 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 David Lechner <david@lechnology.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>
Date: Tue, 21 Dec 2021 11:45:38 +0100
Message-Id: <20211221104546.214066-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/8] counter: Remove struct
	counter_device::priv
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

SGVsbG8sCgpzaW1pbGFyIHRvIHBhdGNoCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvNGJkZTdj
YmQ5ZTQzYTU5MDkyMDgxMDIwOTQ0NDQyMTlkMzE1NDQ2Ni4xNjQwMDcyODkxLmdpdC52aWxoZWxt
LmdyYXlAZ21haWwuY29tCnRoZSB1c2FnZSBvZiBzdHJ1Y3QgY291bnRlcl9kZXZpY2U6OnByaXYg
Y2FuIGJlIHJlcGxhY2VkIGJ5CmNvbnRhaW5lcl9vZiB3aGljaCBpbXByb3ZlcyB0eXBlIHNhZmV0
eSBhbmQgY29kZSBzaXplLgoKVGhpcyBzZXJpZXMgZGVwZW5kcyBvbiBhYm92ZSBwYXRjaCwgY29u
dmVydHMgdGhlIHJlbWFpbmluZyBkcml2ZXJzIGFuZApmaW5hbGx5IGRyb3BzIHN0cnVjdCBjb3Vu
dGVyX2RldmljZTo6cHJpdi4KClRoaXMgc2VyaWVzIHdhcyBjb21waWxlIHRlc3RlZCB1c2luZyBB
UkNIPWFybSBhbGxtb2Rjb25maWcgd2l0aCB0aGUKZm9sbG93aW5nIGNoYW5nZToKCiBjb25maWcg
MTA0X1FVQURfOAogICAgICAgIHRyaXN0YXRlICJBQ0NFUyAxMDQtUVVBRC04IGRyaXZlciIKLSAg
ICAgICBkZXBlbmRzIG9uIFBDMTA0ICYmIFg4NgorICAgICAgIGRlcGVuZHMgb24gUEMxMDQgJiYg
WDg2IHx8IENPTVBJTEVfVEVTVAogICAgICAgIHNlbGVjdCBJU0FfQlVTX0FQSQoKaW4gZHJpdmVy
cy9jb3VudGVyL0tjb25maWcuCgpCZXN0IHJlZ2FyZHMKVXdlCgpVd2UgS2xlaW5lLUvDtm5pZyAo
OCk6CiAgY291bnRlcjogMTA0LXF1YWQtODogVXNlIGNvbnRhaW5lcl9vZiBpbnN0ZWFkIG9mIHN0
cnVjdAogICAgY291bnRlcl9kZXZpY2U6OnByaXYKICBjb3VudGVyOiBmdG0tcXVhZGRlYzogVXNl
IGNvbnRhaW5lcl9vZiBpbnN0ZWFkIG9mIHN0cnVjdAogICAgY291bnRlcl9kZXZpY2U6OnByaXYK
ICBjb3VudGVyOiBpbnRlbC1xZWI6IFVzZSBjb250YWluZXJfb2YgaW5zdGVhZCBvZiBzdHJ1Y3QK
ICAgIGNvdW50ZXJfZGV2aWNlOjpwcml2CiAgY291bnRlcjogaW50ZXJydXB0LWNudDogVXNlIGNv
bnRhaW5lcl9vZiBpbnN0ZWFkIG9mIHN0cnVjdAogICAgY291bnRlcl9kZXZpY2U6OnByaXYKICBj
b3VudGVyOiBtaWNyb2NoaXAtdGNwLWNhcHR1cmU6IFVzZSBjb250YWluZXJfb2YgaW5zdGVhZCBv
ZiBzdHJ1Y3QKICAgIGNvdW50ZXJfZGV2aWNlOjpwcml2CiAgY291bnRlcjogc3RtMzItbHB0aW1l
ci1jbnQ6IFVzZSBjb250YWluZXJfb2YgaW5zdGVhZCBvZiBzdHJ1Y3QKICAgIGNvdW50ZXJfZGV2
aWNlOjpwcml2CiAgY291bnRlcjogc3RtMzItdGltZXItY250OiBVc2UgY29udGFpbmVyX29mIGlu
c3RlYWQgb2Ygc3RydWN0CiAgICBjb3VudGVyX2RldmljZTo6cHJpdgogIGNvdW50ZXI6IFJlbW92
ZSB1bnVzZWQgbWVtYmVyIGZyb20gc3RydWN0IGNvdW50ZXJfZGV2aWNlCgogZHJpdmVycy9jb3Vu
dGVyLzEwNC1xdWFkLTguYyAgICAgICAgICAgIHwgNjQgKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LQogZHJpdmVycy9jb3VudGVyL2Z0bS1xdWFkZGVjLmMgICAgICAgICAgIHwgMTQgKysrKy0tCiBk
cml2ZXJzL2NvdW50ZXIvaW50ZWwtcWVwLmMgICAgICAgICAgICAgfCAyNCArKysrKystLS0tCiBk
cml2ZXJzL2NvdW50ZXIvaW50ZXJydXB0LWNudC5jICAgICAgICAgfCAxNiArKysrLS0tCiBkcml2
ZXJzL2NvdW50ZXIvbWljcm9jaGlwLXRjYi1jYXB0dXJlLmMgfCAxOCArKysrLS0tCiBkcml2ZXJz
L2NvdW50ZXIvc3RtMzItbHB0aW1lci1jbnQuYyAgICAgfCAyNCArKysrKystLS0tCiBkcml2ZXJz
L2NvdW50ZXIvc3RtMzItdGltZXItY250LmMgICAgICAgfCAyNCArKysrKystLS0tCiBkcml2ZXJz
L2NvdW50ZXIvdGktZXFlcC5jICAgICAgICAgICAgICAgfCAgMSAtCiBpbmNsdWRlL2xpbnV4L2Nv
dW50ZXIuaCAgICAgICAgICAgICAgICAgfCAgMyAtLQogOSBmaWxlcyBjaGFuZ2VkLCAxMDYgaW5z
ZXJ0aW9ucygrKSwgODIgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IGZhNTViN2RjZGM0M2Mx
YWExYmExMmJjYTlkMmRkNDMxOGMyYTBkYmYKcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiA5NDU5YWQ4
YmM3ODE5MDU1OGRmOTEyM2Y4YmViZTI4Y2ExYzM5NmVhCi0tIAoyLjMzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
