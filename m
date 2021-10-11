Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A408428DEF
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Oct 2021 15:28:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6093CC5C82E;
	Mon, 11 Oct 2021 13:28:37 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07F14C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 13:28:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mZvLZ-0006fi-Rm; Mon, 11 Oct 2021 15:28:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mZvLV-0003nd-8g; Mon, 11 Oct 2021 15:28:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mZvLV-0000Re-6O; Mon, 11 Oct 2021 15:28:01 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Jiri Slaby <jirislaby@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Peter Huewe <peterhuewe@gmx.de>, Thierry Reding <thierry.reding@gmail.com>,
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Date: Mon, 11 Oct 2021 15:27:41 +0200
Message-Id: <20211011132754.2479853-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-hwmon@vger.kernel.org, linux-serial@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 "Jason Gunthorpe linux-integrity @ vger . kernel . org" <jgg@ziepe.ca>,
 Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org,
 kernel@pengutronix.de, linux-input@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 00/13] Make some spi device drivers return
	zero in .remove()
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

SGVsbG8sCgp0aGlzIHNlcmllcyBpcyBwYXJ0IG9mIG15IG5ldyBxdWVzdCB0byBtYWtlIHNwaSBy
ZW1vdmUgY2FsbGJhY2tzIHJldHVybgp2b2lkLiBUb2RheSB0aGV5IHJldHVybiBhbiBpbnQsIGJ1
dCB0aGUgb25seSByZXN1bHQgb2YgcmV0dXJuaW5nIGEKbm9uLXplcm8gdmFsdWUgaXMgYSB3YXJu
aW5nIG1lc3NhZ2UuIFNvIGl0J3MgYSBiYWQgaWRlYSB0byByZXR1cm4gYW4KZXJyb3IgY29kZSBp
biB0aGUgZXhwZWN0YXRpb24gdGhhdCBub3QgZnJlZWluZyBzb21lIHJlc291cmNlcyBpcyBvawp0
aGVuLiBUaGUgc2FtZSBob2xkcyB0cnVlIGZvciBpMmMgYW5kIHBsYXRmb3JtIGRldmljZXMgd2hp
Y2ggYmVuZWZpdCBlbgpwYXNzYW50IGZvciBhIGZldyBkcml2ZXJzLgoKVGhlIHBhdGNoZXMgaW4g
dGhpcyBzZXJpZXMgYWRkcmVzcyBzb21lIG9mIHRoZSBzcGkgZHJpdmVycyB0aGF0IG1pZ2h0CnJl
dHVybiBub24temVybyBhbmQgYWRhcHQgdGhlbSBhY2NvcmRpbmdseSB0byByZXR1cm4gemVybyBp
bnN0ZWFkLiBGb3IKbW9zdCBkcml2ZXJzIGl0J3MganVzdCBhYm91dCBub3QgaGlkaW5nIHRoZSBm
YWN0IHRoYXQgdGhleSBhbHJlYWR5CnJldHVybiB6ZXJvLgoKR2l2ZW4gdGhhdCB0aGVyZSBhcmUg
cXVpdGUgc29tZSBtb3JlIHBhdGNoZXMgb2YgdGhpcyB0eXBlIHRvIGNyZWF0ZQpiZWZvcmUgSSBj
YW4gY2hhbmdlIHRoZSBzcGkgcmVtb3ZlIGNhbGxiYWNrLCBJIHN1Z2dlc3QgdGhlIHJlc3BlY2l2
ZQpzdWJzeXN0ZW0gbWFpbnRhaW5lcnMgcGljayB1cCB0aGVzZSBwYXRjaGVzLiBUaGVyZSBhcmUg
bm8KaW50ZXJkZXBlbmRlbmNpZXMgaW4gdGhpcyBzZXJpZXMuCgpVd2UgS2xlaW5lLUvDtm5pZyAo
MTMpOgogIGRybS9wYW5lbDogczZlNjNtMDogTWFrZSBzNmU2M20wX3JlbW92ZSgpIHJldHVybiB2
b2lkCiAgaHdtb246IGFkdDd4MTA6IE1ha2UgYWR0N3gxMF9yZW1vdmUoKSByZXR1cm4gdm9pZAog
IGh3bW9uOiBtYXgzMTcyMjogV2FybiBhYm91dCBmYWlsdXJlIHRvIHB1dCBkZXZpY2UgaW4gc3Rh
bmQtYnkgaW4KICAgIC5yZW1vdmUoKQogIGlucHV0OiBhZHhsMzR4eDogTWFrZSBhZHhsMzR4X3Jl
bW92ZSgpIHJldHVybiB2b2lkCiAgaW5wdXQ6IHRvdWNoc2NyZWVuOiB0c2MyMDB4OiBNYWtlIHRz
YzIwMHhfcmVtb3ZlKCkgcmV0dXJuIHZvaWQKICBtZWRpYTogY3hkMjg4MDogRWxpbWluYXRlIGRl
YWQgY29kZQogIG1mZDogbWMxM3h4eDogTWFrZSBtYzEzeHh4X2NvbW1vbl9leGl0KCkgcmV0dXJu
IHZvaWQKICBtZmQ6IHN0bXBlOiBNYWtlIHN0bXBlX3JlbW92ZSgpIHJldHVybiB2b2lkCiAgbWZk
OiB0cHM2NTkxMjogTWFrZSB0cHM2NTkxMl9kZXZpY2VfZXhpdCgpIHJldHVybiB2b2lkCiAgc2Vy
aWFsOiBtYXgzMTB4OiBNYWtlIG1heDMxMHhfcmVtb3ZlKCkgcmV0dXJuIHZvaWQKICBzZXJpYWw6
IHNjMTZpczd4eDogTWFrZSBzYzE2aXM3eHhfcmVtb3ZlKCkgcmV0dXJuIHZvaWQKICBzdGFnaW5n
OiBmYnRmdDogTWFrZSBmYnRmdF9yZW1vdmVfY29tbW9uKCkgcmV0dXJuIHZvaWQKICB0cG06IHN0
MzN6cDI0OiBNYWtlIHN0MzN6cDI0X3JlbW92ZSgpIHJldHVybiB2b2lkCgogZHJpdmVycy9jaGFy
L3RwbS9zdDMzenAyNC9pMmMuYyAgICAgICAgICAgICAgICAgICB8ICA1ICstLS0tCiBkcml2ZXJz
L2NoYXIvdHBtL3N0MzN6cDI0L3NwaS5jICAgICAgICAgICAgICAgICAgIHwgIDUgKy0tLS0KIGRy
aXZlcnMvY2hhci90cG0vc3QzM3pwMjQvc3QzM3pwMjQuYyAgICAgICAgICAgICAgfCAgMyArLS0K
IGRyaXZlcnMvY2hhci90cG0vc3QzM3pwMjQvc3QzM3pwMjQuaCAgICAgICAgICAgICAgfCAgMiAr
LQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC1kc2kuYyB8ICAz
ICsrLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC1zcGkuYyB8
ICAzICsrLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC5jICAg
ICB8ICA0ICstLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAu
aCAgICAgfCAgMiArLQogZHJpdmVycy9od21vbi9hZHQ3MzEwLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAzICsrLQogZHJpdmVycy9od21vbi9hZHQ3NDEwLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAzICsrLQogZHJpdmVycy9od21vbi9hZHQ3eDEwLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAzICstLQogZHJpdmVycy9od21vbi9hZHQ3eDEwLmggICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2h3bW9uL21heDMxNzIyLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDggKysrKysrKy0KIGRyaXZlcnMvaW5wdXQvbWlzYy9hZHhs
MzR4LWkyYy5jICAgICAgICAgICAgICAgICAgfCAgNCArKystCiBkcml2ZXJzL2lucHV0L21pc2Mv
YWR4bDM0eC1zcGkuYyAgICAgICAgICAgICAgICAgIHwgIDQgKysrLQogZHJpdmVycy9pbnB1dC9t
aXNjL2FkeGwzNHguYyAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KIGRyaXZlcnMvaW5w
dXQvbWlzYy9hZHhsMzR4LmggICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9p
bnB1dC90b3VjaHNjcmVlbi90c2MyMDA0LmMgICAgICAgICAgICAgICB8ICA0ICsrKy0KIGRyaXZl
cnMvaW5wdXQvdG91Y2hzY3JlZW4vdHNjMjAwNS5jICAgICAgICAgICAgICAgfCAgNCArKystCiBk
cml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL3RzYzIwMHgtY29yZS5jICAgICAgICAgIHwgIDQgKy0t
LQogZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi90c2MyMDB4LWNvcmUuaCAgICAgICAgICB8ICAy
ICstCiBkcml2ZXJzL21lZGlhL3NwaS9jeGQyODgwLXNwaS5jICAgICAgICAgICAgICAgICAgIHwg
MTMgKy0tLS0tLS0tLS0tLQogZHJpdmVycy9tZmQvbWMxM3h4eC1jb3JlLmMgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA0ICstLS0KIGRyaXZlcnMvbWZkL21jMTN4eHgtaTJjLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMyArKy0KIGRyaXZlcnMvbWZkL21jMTN4eHgtc3BpLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMyArKy0KIGRyaXZlcnMvbWZkL21jMTN4eHguaCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9tZmQvc3RtcGUtaTJjLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrKy0KIGRyaXZlcnMvbWZkL3N0bXBlLXNwaS5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKystCiBkcml2ZXJzL21mZC9zdG1wZS5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQogZHJpdmVycy9tZmQvc3Rt
cGUuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL21mZC90
cHM2NTkxMi1jb3JlLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tLQogZHJpdmVycy9t
ZmQvdHBzNjU5MTItaTJjLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrKy0KIGRyaXZl
cnMvbWZkL3RwczY1OTEyLXNwaS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKystCiBk
cml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jICAgICAgICAgICAgICAgIHwgIDggKy0t
LS0tLS0KIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC5oICAgICAgICAgICAgICAgICAgICAg
fCAgNiArKysrLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9tYXgzMTB4LmMgICAgICAgICAgICAgICAg
ICAgICAgfCAgNyArKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvc2MxNmlzN3h4LmMgICAgICAg
ICAgICAgICAgICAgIHwgMTAgKysrKysrKy0tLQogaW5jbHVkZS9saW51eC9tZmQvdHBzNjU5MTIu
aCAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAzOCBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNl
cnRpb25zKCspLCA4MSBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDogOWUxZmYzMDdjNzc5Y2Ux
ZjBmODEwYzdlY2NlM2Q5NWJiYWU0MDg5NgotLSAKMi4zMC4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
