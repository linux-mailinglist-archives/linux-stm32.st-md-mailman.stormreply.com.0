Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1A97E7D6A
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Nov 2023 16:30:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CE5FC6B47D;
	Fri, 10 Nov 2023 15:30:58 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00A71C6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 15:30:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r1TT7-0006Rr-QF; Fri, 10 Nov 2023 16:30:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r1TT6-0083LK-Eb; Fri, 10 Nov 2023 16:30:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r1TT6-00Gnxb-5M; Fri, 10 Nov 2023 16:30:48 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Date: Fri, 10 Nov 2023 16:30:10 +0100
Message-ID: <20231110152927.70601-43-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
References: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2024;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=5htvZTKQYsaQF/DhEIeCVy7UN5DiM9l2sCrWpRoYQfo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlTkyNMkrnreXIYPFUpcK6dCTty/YRFuIxEyLYi
 KKt+9Qo0t2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZU5MjQAKCRCPgPtYfRL+
 TpaDB/9ajzFZLbevKXFXkJVl2aBAi7ma/J5M61N6kPTnnjds1EZOFM0osLkMkktGOGh0nYacCP1
 HP44UUb+CuK1ZHgLS3tyy4f8MSzrPaNpVSuxpAMibuTkz4ZPKmNS9gJtN0KyBsIw/ktBmFHF/W+
 emSub0jHwpXehVdX2jWMyPvrYywaiOYHgc8HcB/dFGyWCBc13FZytIQKhTH9AYrjdhBKaLNgWtZ
 IJ1OM3902k4t9wvCJ9b+1O9qrpasOui/fuxcPhg6yoDylMiYtvLUWJ4XzovFLGqHcTZxtI2gQRr
 tvSxL2WiHZsVLuBV3H0B+lLsT8xfFdoGqPMyNF2kC9CbqxiT
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-serial@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 42/52] serial: stm32: Convert to platform
	remove callback returning void
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
CgpUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuCnZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwoucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVy
bnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwphcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgpUcml2aWFsbHkgY29udmVy
dCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCmNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5
L3NlcmlhbC9zdG0zMi11c2FydC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMK
aW5kZXggMzA0ODYyMDMxNWQ2Li45NzgxYzE0M2RlZjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdHR5
L3NlcmlhbC9zdG0zMi11c2FydC5jCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2Fy
dC5jCkBAIC0xODIyLDcgKzE4MjIsNyBAQCBzdGF0aWMgaW50IHN0bTMyX3VzYXJ0X3NlcmlhbF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0
YXRpYyBpbnQgc3RtMzJfdXNhcnRfc2VyaWFsX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQorc3RhdGljIHZvaWQgc3RtMzJfdXNhcnRfc2VyaWFsX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQgPSBwbGF0Zm9y
bV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3Qgc3RtMzJfcG9ydCAqc3RtMzJfcG9ydCA9IHRv
X3N0bTMyX3BvcnQocG9ydCk7CkBAIC0xODYxLDggKzE4NjEsNiBAQCBzdGF0aWMgaW50IHN0bTMy
X3VzYXJ0X3NlcmlhbF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAl9CiAK
IAlzdG0zMl91c2FydF9kZWluaXRfcG9ydChzdG0zMl9wb3J0KTsKLQotCXJldHVybiAwOwogfQog
CiBzdGF0aWMgdm9pZCBfX21heWJlX3VudXNlZCBzdG0zMl91c2FydF9jb25zb2xlX3B1dGNoYXIo
c3RydWN0IHVhcnRfcG9ydCAqcG9ydCwgdW5zaWduZWQgY2hhciBjaCkKQEAgLTIxNDYsNyArMjE0
NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBzdG0zMl9zZXJpYWxfcG1fb3Bz
ID0gewogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9zZXJpYWxfZHJpdmVy
ID0gewogCS5wcm9iZQkJPSBzdG0zMl91c2FydF9zZXJpYWxfcHJvYmUsCi0JLnJlbW92ZQkJPSBz
dG0zMl91c2FydF9zZXJpYWxfcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gc3RtMzJfdXNhcnRfc2Vy
aWFsX3JlbW92ZSwKIAkuZHJpdmVyCT0gewogCQkubmFtZQk9IERSSVZFUl9OQU1FLAogCQkucG0J
PSAmc3RtMzJfc2VyaWFsX3BtX29wcywKLS0gCjIuNDIuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
