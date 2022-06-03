Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB66953C960
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jun 2022 13:32:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C324C57B6C;
	Fri,  3 Jun 2022 11:32:43 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBD4AC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jun 2022 09:44:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <lgo@pengutronix.de>)
 id 1nx3r4-0007Re-Og; Fri, 03 Jun 2022 11:44:30 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1nx3r5-006C5J-DQ; Fri, 03 Jun 2022 11:44:30 +0200
Received: from lgo by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <lgo@pengutronix.de>)
 id 1nx3r2-008rdn-CL; Fri, 03 Jun 2022 11:44:28 +0200
From: =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  3 Jun 2022 11:44:21 +0200
Message-Id: <20220603094422.2112746-2-l.goehrs@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220603094422.2112746-1-l.goehrs@pengutronix.de>
References: <20220603094422.2112746-1-l.goehrs@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: lgo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Fri, 03 Jun 2022 11:32:41 +0000
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: correct vcc-supply for
	eeprom on stm32mp15xx-osd32
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

QWNjb3JkaW5nIHRvIHRoZSBPU0QzMk1QMSBQb3dlciBTeXN0ZW0gb3ZlcnZpZXdbMV0gdGhlIEVF
UFJPTSBpcyBjb25uZWN0ZWQgdG8KdGhlIFZERCBsaW5lIGFuZCBub3QgdG8gc29tZSBzaW5nbGUt
cHVycG9zZSBmaXhlZCByZWd1bGF0b3IuClNldCB0aGUgRUVQUk9NIHN1cHBseSBhY2NvcmRpbmcg
dG8gdGhlIGRpYWdyYW0gdG8gZWxpbWluYXRlIHRoaXMgcGFyZW50LWxlc3MKcmVndWxhdG9yLgoK
WzFdOiBodHRwczovL29jdGF2b3N5c3RlbXMuY29tL2FwcF9ub3Rlcy9vc2QzMm1wMS1wb3dlci1z
eXN0ZW0tb3ZlcnZpZXcvI2Nvbm5lY3Rpb25zCgpTaWduZWQtb2ZmLWJ5OiBMZW9uYXJkIEfDtmhy
cyA8bC5nb2VocnNAcGVuZ3V0cm9uaXguZGU+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJt
cDE1eHgtb3NkMzIuZHRzaSB8IDggKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0z
Mm1wMTV4eC1vc2QzMi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3NkMzIu
ZHRzaQppbmRleCBlOTk3YzQ5NTNmZDEuLjkzNWI3MDg0YjVhMiAxMDA2NDQKLS0tIGEvYXJjaC9h
cm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3NkMzIuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0
cy9zdG0zMm1wMTV4eC1vc2QzMi5kdHNpCkBAIC01MCwxMiArNTAsNiBAQCByZXRyYW06IHJldHJh
bUAzODAwMDAwMCB7CiAJCQluby1tYXA7CiAJCX07CiAJfTsKLQotCXJlZ19zaXBfZWVwcm9tOiBy
ZWd1bGF0b3JfZWVwcm9tIHsKLQkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwotCQly
ZWd1bGF0b3ItbmFtZSA9ICJzaXBfZWVwcm9tIjsKLQkJcmVndWxhdG9yLWFsd2F5cy1vbjsKLQl9
OwogfTsKIAogJmkyYzQgewpAQCAtMjA0LDcgKzE5OCw3IEBAIHBtaWNfd2F0Y2hkb2c6IHdhdGNo
ZG9nIHsKIAogCXNpcF9lZXByb206IGVlcHJvbUA1MCB7CiAJCWNvbXBhdGlibGUgPSAiYXRtZWws
MjRjMzIiOwotCQl2Y2Mtc3VwcGx5ID0gPCZyZWdfc2lwX2VlcHJvbT47CisJCXZjYy1zdXBwbHkg
PSA8JnZkZD47CiAJCXJlZyA9IDwweDUwPjsKIAl9OwogfTsKLS0gCjIuMzAuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
