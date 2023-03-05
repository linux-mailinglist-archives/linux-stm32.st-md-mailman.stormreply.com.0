Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 579216AB225
	for <lists+linux-stm32@lfdr.de>; Sun,  5 Mar 2023 21:51:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2DB3C6904A;
	Sun,  5 Mar 2023 20:51:21 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43AFBC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Mar 2023 20:51:20 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 16AA585A1F;
 Sun,  5 Mar 2023 21:51:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1678049479;
 bh=1IIZ5cXT9MjyR4m8kfZh5MLkgJE2lkLpDwB+TkI3y0Y=;
 h=From:To:Cc:Subject:Date:From;
 b=YkLzueQasv7qLjavzVqEITMfHl1saqCyf3udKNeSCggAACg+jtf0czHeCUV+zg8Fm
 JjRVE1dAdGR2ZOIjOjyHOb5dYMw/UC4PejWZdMnc/DCuOSG0xc7EV0Z3VEyVANr6Rr
 Q/rdykJl6so42S7bZsB9pQa3TivCtHlGPhMM/hCLYCdkyDmAoFuAkWrP57FCke3mEt
 e6mcwOCTs8kq6YCsdEmn3+mkQdPsxoSVScPsz8hNHaT6IZSdJ8HditB/r2NzOvOqwg
 5VytB3U2pLL7Sd5LD2SGnuu8TG1jApGERkRFf+ic7RHJWvQJlZPVAh51Dk+dpdEyUl
 zssuffYUD9pqA==
From: Marek Vasut <marex@denx.de>
To: linux-media@vger.kernel.org
Date: Sun,  5 Mar 2023 21:51:07 +0100
Message-Id: <20230305205107.772931-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] media: stm32-dcmi: Enable incoherent buffer
	allocation
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

U2V0IGFsbG93X2NhY2hlX2hpbnRzIHRvIDEgZm9yIHRoZSB2YjJfcXVldWUgY2FwdHVyZSBxdWV1
ZSBpbiB0aGUKU1RNMzJNUDE1eHggRENNSSBWNEwyIGRyaXZlci4gVGhpcyBhbGxvd3MgdXMgdG8g
YWxsb2NhdGUgYnVmZmVycwp3aXRoIHRoZSBWNEwyX01FTU9SWV9GTEFHX05PTl9DT0hFUkVOVCBz
ZXQuIE9uIFNUTTMyTVAxNXh4IFNvQ3MsCnRoaXMgZW5hYmxlcyBjYWNoaW5nIGZvciB0aGlzIG1l
bW9yeSwgd2hpY2ggaW1wcm92ZXMgcGVyZm9ybWFuY2UKd2hlbiBiZWluZyByZWFkIGZyb20gQ1BV
LgoKVGhpcyBjaGFuZ2Ugc2hvdWxkIGJlIHNhZmUgZnJvbSByYWNlIGNvbmRpdGlvbnMgc2luY2Ug
dmlkZW9idWYyCmFscmVhZHkgaW52YWxpZGF0ZXMgb3IgZmx1c2hlcyB0aGUgYXBwcm9wcmlhdGUg
Y2FjaGUgbGluZXMgaW4KaXRzIHByZXBhcmUoKSBhbmQgZmluaXNoKCkgbWV0aG9kcy4KClRlc3Rl
ZCBvbiBhIFNUTTMyTVAxNTdGIFNvQy4gUmVzdWx0ZWQgaW4gNHggYnVmZmVyIGFjY2VzcyBzcGVl
ZHVwLgoKU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Ci0tLQpDYzog
IkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBBbGV4YW5k
cmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgpDYzogSHVndWVzIEZydWNo
ZXQgPGh1Z3Vlcy5mcnVjaGV0QGZvc3Muc3QuY29tPgpDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFi
IDxtY2hlaGFiQGtlcm5lbC5vcmc+CkNjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0z
MkBnbWFpbC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpD
YzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpD
YzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KLS0tCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0L3N0bTMyL3N0bTMyLWRjbWkuYyB8IDEg
KwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9zdC9zdG0zMi9zdG0zMi1kY21pLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL3N0L3N0bTMyL3N0bTMyLWRjbWkuYwppbmRleCBhZDhlOTc0MmUxYWU3Li4yYWM1MDhkYTVi
YTM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0L3N0bTMyL3N0bTMyLWRj
bWkuYworKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0L3N0bTMyL3N0bTMyLWRjbWkuYwpA
QCAtMjA4NCw2ICsyMDg0LDcgQEAgc3RhdGljIGludCBkY21pX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJcS0+bWVtX29wcyA9ICZ2YjJfZG1hX2NvbnRpZ19tZW1vcHM7CiAJ
cS0+dGltZXN0YW1wX2ZsYWdzID0gVjRMMl9CVUZfRkxBR19USU1FU1RBTVBfTU9OT1RPTklDOwog
CXEtPm1pbl9idWZmZXJzX25lZWRlZCA9IDI7CisJcS0+YWxsb3dfY2FjaGVfaGludHMgPSAxOwog
CXEtPmRldiA9ICZwZGV2LT5kZXY7CiAKIAlyZXQgPSB2YjJfcXVldWVfaW5pdChxKTsKLS0gCjIu
MzkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
