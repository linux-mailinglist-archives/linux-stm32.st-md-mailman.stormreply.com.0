Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB1D481D62
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Dec 2021 16:03:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E24FC5F1EF;
	Thu, 30 Dec 2021 15:03:31 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ADACC5F1EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Dec 2021 15:03:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2wxQ-0000cK-69; Thu, 30 Dec 2021 16:03:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2wxL-007VKV-F7; Thu, 30 Dec 2021 16:03:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n2wxK-0007fw-3q; Thu, 30 Dec 2021 16:03:02 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 30 Dec 2021 16:02:37 +0100
Message-Id: <20211230150300.72196-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2532; h=from:subject;
 bh=AOu1ipuy51ViJtY8+UrNDZQ8jBgMAGOEi7FVF4Yd7rI=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBhzcn5BHBaiDQ8cEt776wfv9nWuKqQqGj/puI+WcPv
 PA8RpYSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYc3J+QAKCRDB/BR4rcrsCUcSCA
 CfKRDdmC0XRJCNVa+WlilBBS1clYGRm99fyrJzTeKcvzB+TkcfWtSl4Mt3rxrI8MprDol2cltD3Ixg
 2othS8Ec3bbw2oJUAMPXjA0bkSczWGlPshbUUmgbCl8f3GUhO24I5JUqXJFDaVzjkOGMxCAnu/440k
 XYcWqGeV7lJeGaBx+DpV5e/abV1DJY9KvJqNh1ZLdHvCTDZtTTPIkABJTS7+MwCrpgNHsrgO+UGSkF
 AOm4dgHzzKEwYu4cq6hH64t9qm3XrR/7819gHuYSybV+vf3oomYh+eMFXpVDsI4cVmqBQWBIHoNsxb
 5ssNycrLJCAUZLiIYykybN0h3bPHk1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 David Lechner <david@lechnology.com>, Raymond Tan <raymond.tan@intel.com>,
 linux-iio@vger.kernel.org, Patrick Havelange <patrick.havelange@essensium.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, kernel@pengutronix.de,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 "Felipe Balbi \(Intel\)" <balbi@kernel.org>
Subject: [Linux-stm32] [PATCH v4 00/23] counter: cleanups and device
	lifetime fixes
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

SGVsbG8sCgpPbiBUaHUsIERlYyAzMCwgMjAyMSBhdCAwMjoxOToyNVBNICswMTAwLCBHcmVnIEty
b2FoLUhhcnRtYW4gd3JvdGU6Cj4gUGxlYXNlIHJlYmFzZSBhbmQgcmVzZW5kIHRoZSBzZXJpZXMg
YWdhaW5zdCBteSBjaGFyLW1pc2MtbmV4dCBicmFuY2guCgp0aGlzIHNlcmllcyBpcyBqdXN0IHYz
IHRha2VuIHZpYSBiNCB0byBjb2xsZWN0IHRoZSBsYXRlc3QgYWNrcyBpbnRvCmFjY291bnQgYW5k
IHRoZW4gcmViYXNlZCB0byBHcmVnJ3MgY2hhci1taXNjLW5leHQuCgpVd2UgS2xlaW5lLUvDtm5p
ZyAoMjMpOgogIGNvdW50ZXI6IFVzZSBjb250YWluZXJfb2YgaW5zdGVhZCBvZiBkcnZkYXRhIHRv
IHRyYWNrIGNvdW50ZXJfZGV2aWNlCiAgY291bnRlcjogZnRtLXF1YWRkZWM6IERyb3AgdW51c2Vk
IHBsYXRmb3JtX3NldF9kcnZkYXRhKCkKICBjb3VudGVyOiBtaWNyb2NoaXAtdGNiLWNhcHR1cmU6
IERyb3AgdW51c2VkIHBsYXRmb3JtX3NldF9kcnZkYXRhKCkKICBjb3VudGVyOiBQcm92aWRlIGEg
d3JhcHBlciB0byBhY2Nlc3MgZGV2aWNlIHByaXZhdGUgZGF0YQogIGNvdW50ZXI6IDEwNC1xdWFk
LTg6IENvbnZlcnQgdG8gY291bnRlcl9wcml2KCkgd3JhcHBlcgogIGNvdW50ZXI6IGludGVycnVw
dC1jbnQ6IENvbnZlcnQgdG8gY291bnRlcl9wcml2KCkgd3JhcHBlcgogIGNvdW50ZXI6IG1pY3Jv
Y2hpcC10Y2ItY2FwdHVyZTogQ29udmVydCB0byBjb3VudGVyX3ByaXYoKSB3cmFwcGVyCiAgY291
bnRlcjogaW50ZWwtcWVwOiBDb252ZXJ0IHRvIGNvdW50ZXJfcHJpdigpIHdyYXBwZXIKICBjb3Vu
dGVyOiBmdG0tcXVhZGRlYzogQ29udmVydCB0byBjb3VudGVyX3ByaXYoKSB3cmFwcGVyCiAgY291
bnRlcjogdGktZXFlcDogQ29udmVydCB0byBjb3VudGVyX3ByaXYoKSB3cmFwcGVyCiAgY291bnRl
cjogc3RtMzItbHB0aW1lci1jbnQ6IENvbnZlcnQgdG8gY291bnRlcl9wcml2KCkgd3JhcHBlcgog
IGNvdW50ZXI6IHN0bTMyLXRpbWVyLWNudDogQ29udmVydCB0byBjb3VudGVyX3ByaXYoKSB3cmFw
cGVyCiAgY291bnRlcjogUHJvdmlkZSBhbHRlcm5hdGl2ZSBjb3VudGVyIHJlZ2lzdHJhdGlvbiBm
dW5jdGlvbnMKICBjb3VudGVyOiBVcGRhdGUgZG9jdW1lbnRhdGlvbiBmb3IgbmV3IGNvdW50ZXIg
cmVnaXN0cmF0aW9uIGZ1bmN0aW9ucwogIGNvdW50ZXI6IDEwNC1xdWFkLTg6IENvbnZlcnQgdG8g
bmV3IGNvdW50ZXIgcmVnaXN0cmF0aW9uCiAgY291bnRlcjogaW50ZXJydXB0LWNudDogQ29udmVy
dCB0byBuZXcgY291bnRlciByZWdpc3RyYXRpb24KICBjb3VudGVyOiBpbnRlbC1xZXA6IENvbnZl
cnQgdG8gbmV3IGNvdW50ZXIgcmVnaXN0cmF0aW9uCiAgY291bnRlcjogZnRtLXF1YWRkZWM6IENv
bnZlcnQgdG8gbmV3IGNvdW50ZXIgcmVnaXN0cmF0aW9uCiAgY291bnRlcjogbWljcm9jaGlwLXRj
Yi1jYXB0dXJlOiBDb252ZXJ0IHRvIG5ldyBjb3VudGVyIHJlZ2lzdHJhdGlvbgogIGNvdW50ZXI6
IHN0bTMyLXRpbWVyLWNudDogQ29udmVydCB0byBuZXcgY291bnRlciByZWdpc3RyYXRpb24KICBj
b3VudGVyOiBzdG0zMi1scHRpbWVyLWNudDogQ29udmVydCB0byBuZXcgY291bnRlciByZWdpc3Ry
YXRpb24KICBjb3VudGVyOiB0aS1lcWVwOiBDb252ZXJ0IHRvIG5ldyBjb3VudGVyIHJlZ2lzdHJh
dGlvbgogIGNvdW50ZXI6IHJlbW92ZSBvbGQgYW5kIG5vdyB1bnVzZWQgcmVnaXN0cmF0aW9uIEFQ
SQoKIERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9nZW5lcmljLWNvdW50ZXIucnN0IHwgIDEwICst
CiBkcml2ZXJzL2NvdW50ZXIvMTA0LXF1YWQtOC5jICAgICAgICAgICAgICAgICB8ICA5MSArKysr
LS0tLS0KIGRyaXZlcnMvY291bnRlci9jb3VudGVyLWNvcmUuYyAgICAgICAgICAgICAgIHwgMTg2
ICsrKysrKysrKysrKysrLS0tLS0KIGRyaXZlcnMvY291bnRlci9mdG0tcXVhZGRlYy5jICAgICAg
ICAgICAgICAgIHwgIDM2ICsrLS0KIGRyaXZlcnMvY291bnRlci9pbnRlbC1xZXAuYyAgICAgICAg
ICAgICAgICAgIHwgIDQ2ICsrLS0tCiBkcml2ZXJzL2NvdW50ZXIvaW50ZXJydXB0LWNudC5jICAg
ICAgICAgICAgICB8ICAzOCArKy0tCiBkcml2ZXJzL2NvdW50ZXIvbWljcm9jaGlwLXRjYi1jYXB0
dXJlLmMgICAgICB8ICA0NCArKy0tLQogZHJpdmVycy9jb3VudGVyL3N0bTMyLWxwdGltZXItY250
LmMgICAgICAgICAgfCAgNTEgKystLS0KIGRyaXZlcnMvY291bnRlci9zdG0zMi10aW1lci1jbnQu
YyAgICAgICAgICAgIHwgIDQ4ICsrLS0tCiBkcml2ZXJzL2NvdW50ZXIvdGktZXFlcC5jICAgICAg
ICAgICAgICAgICAgICB8ICAzMSArKy0tCiBpbmNsdWRlL2xpbnV4L2NvdW50ZXIuaCAgICAgICAg
ICAgICAgICAgICAgICB8ICAxNSArLQogMTEgZmlsZXMgY2hhbmdlZCwgMzU1IGluc2VydGlvbnMo
KyksIDI0MSBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDogZTc1YTU4ZGI0MWRmNjdlNjI4MjEw
NGFhYWUwNzNiYzhiNDNiOGRjOAotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
