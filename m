Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5FB77E077
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 13:33:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25589C6B45F;
	Wed, 16 Aug 2023 11:33:30 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25675C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 11:33:29 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d0c:f209:12a7:4ce5])
 by xavier.telenet-ops.be with bizsmtp
 id aBZT2A00445ualL01BZTFl; Wed, 16 Aug 2023 13:33:28 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qWEm8-000p1Y-GO;
 Wed, 16 Aug 2023 13:33:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qWEmE-006A0c-RE;
 Wed, 16 Aug 2023 13:33:26 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Arnd Bergmann <arnd@arndb.de>, Valentin Caron <valentin.caron@foss.st.com>
Date: Wed, 16 Aug 2023 13:33:26 +0200
Message-Id: <20230816113326.1468435-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-rtc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] rtc: stm32: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
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

SWYgQ09ORklHX1BNX1NMRUVQPW4gKGUuZy4gbTY4ay9hbGxtb2Rjb25maWcpOgoKICAgIGRyaXZl
cnMvcnRjL3J0Yy1zdG0zMi5jOjkwNDoxMjogZXJyb3I6IOKAmHN0bTMyX3J0Y19yZXN1bWXigJkg
ZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWZ1bmN0aW9uXQogICAgICA5MDQg
fCBzdGF0aWMgaW50IHN0bTMyX3J0Y19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQoJICB8ICAg
ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgogICAgZHJpdmVycy9ydGMvcnRjLXN0bTMyLmM6ODk0
OjEyOiBlcnJvcjog4oCYc3RtMzJfcnRjX3N1c3BlbmTigJkgZGVmaW5lZCBidXQgbm90IHVzZWQg
Wy1XZXJyb3I9dW51c2VkLWZ1bmN0aW9uXQogICAgICA4OTQgfCBzdGF0aWMgaW50IHN0bTMyX3J0
Y19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKCSAgfCAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+CgpJbmRlZWQsIHRoZSBwcmV2aW91cyBjaGFuZ2UgbWl4ZWQgdXAgdGhlIHNlbWFudGlj
cyBiZXR3ZWVuClNFVF9OT0lSUV9TWVNURU1fU0xFRVBfUE1fT1BTKCkgYW5kIE5PSVJRX1NZU1RF
TV9TTEVFUF9QTV9PUFMoKS4KRml4IHRoaXMgYnkgdXNpbmcgdGhlIG1vZGVybiBOT0lSUV9TWVNU
RU1fU0xFRVBfUE1fT1BTKCkgaW5zdGVhZC4KClJlcG9ydGVkLWJ5OiBub3JlcGx5QGVsbGVybWFu
LmlkLmF1CkZpeGVzOiBhNjljNjEwZTEzZTJiMmRlICgicnRjOiBzdG0zMjogcmVtb3ZlIGluY29y
cmVjdCAjaWZkZWYgY2hlY2siKQpTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPgotLS0KIGRyaXZlcnMvcnRjL3J0Yy1zdG0zMi5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ydGMvcnRjLXN0bTMyLmMgYi9kcml2ZXJzL3J0Yy9ydGMtc3RtMzIuYwppbmRl
eCAzY2U0YjNkMDgxNTViNDhkLi43Njc1M2M3MWQ5MmVlZjNlIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3J0Yy9ydGMtc3RtMzIuYworKysgYi9kcml2ZXJzL3J0Yy9ydGMtc3RtMzIuYwpAQCAtOTIzLDcg
KzkyMyw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcnRjX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYp
CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBzdG0zMl9ydGNfcG1fb3BzID0g
ewotCVNFVF9OT0lSUV9TWVNURU1fU0xFRVBfUE1fT1BTKHN0bTMyX3J0Y19zdXNwZW5kLCBzdG0z
Ml9ydGNfcmVzdW1lKQorCU5PSVJRX1NZU1RFTV9TTEVFUF9QTV9PUFMoc3RtMzJfcnRjX3N1c3Bl
bmQsIHN0bTMyX3J0Y19yZXN1bWUpCiB9OwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZl
ciBzdG0zMl9ydGNfZHJpdmVyID0gewotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
