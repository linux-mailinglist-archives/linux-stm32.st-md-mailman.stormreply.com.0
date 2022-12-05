Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C68642A04
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 15:01:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39CD2C65E6C;
	Mon,  5 Dec 2022 14:01:14 +0000 (UTC)
Received: from predatorhelios.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr [90.63.244.31])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 494FDC65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 13:43:56 +0000 (UTC)
Received: by predatorhelios.localdomain (Postfix, from userid 1001)
 id 064F53E0590; Mon,  5 Dec 2022 14:43:55 +0100 (CET)
From: Fabien Parent <fparent@baylibre.com>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, krzysztof.kozlowski@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 khilman@baylibre.com, linux-gpio@vger.kernel.org
Date: Mon,  5 Dec 2022 14:43:53 +0100
Message-Id: <20221205134354.1772429-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205134354.1772429-1-fparent@baylibre.com>
References: <20221205134354.1772429-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Dec 2022 14:01:12 +0000
Subject: [Linux-stm32] [PATCH v4 2/3] ARM: dts: mediatek: Remove
	pins-are-numbered property
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

RnJvbTogQmVybmhhcmQgUm9zZW5rcsOkbnplciA8YmVyb0BiYXlsaWJyZS5jb20+CgpSZW1vdmUg
dGhlIHVubmVjZXNzYXJ5IHBpbnMtYXJlLW51bWJlcmVkIHByb3BlcnR5IGZyb20KTWVkaWF0ZWsg
QVJNIERldmljZVRyZWVzCgpTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIDxi
ZXJvQGJheWxpYnJlLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25v
IDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CkFja2VkLWJ5OiBLZXZp
biBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL210
MjcwMS5kdHNpIHwgMSAtCiBhcmNoL2FybS9ib290L2R0cy9tdDc2MjMuZHRzaSB8IDEgLQogYXJj
aC9hcm0vYm9vdC9kdHMvbXQ4MTM1LmR0c2kgfCAxIC0KIDMgZmlsZXMgY2hhbmdlZCwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaSBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpCmluZGV4IGI4ZWJhM2JhMTUzYzIuLjBhMGZlOGM1
YTQwNTkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpCisrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpCkBAIC0xNzgsNyArMTc4LDYgQEAgcGlvOiBwaW5j
dHJsQDEwMDBiMDAwIHsKIAkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtcGluY3RybCI7
CiAJCXJlZyA9IDwwIDB4MTAwMGIwMDAgMCAweDEwMDA+OwogCQltZWRpYXRlayxwY3RsLXJlZ21h
cCA9IDwmc3lzY2ZnX3BjdGxfYT47Ci0JCXBpbnMtYXJlLW51bWJlcmVkOwogCQlncGlvLWNvbnRy
b2xsZXI7CiAJCSNncGlvLWNlbGxzID0gPDI+OwogCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL210NzYyMy5kdHNpIGIvYXJjaC9hcm0vYm9vdC9k
dHMvbXQ3NjIzLmR0c2kKaW5kZXggMjVkMzFlNDBhNTUzNS4uMTEzNzljM2U2YjRjYSAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvbXQ3NjIzLmR0c2kKQEAgLTI1Myw3ICsyNTMsNiBAQCBwaW86IHBpbmN0cmxAMTAwMDUwMDAg
ewogCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NzYyMy1waW5jdHJsIjsKIAkJcmVnID0gPDAg
MHgxMDAwYjAwMCAwIDB4MTAwMD47CiAJCW1lZGlhdGVrLHBjdGwtcmVnbWFwID0gPCZzeXNjZmdf
cGN0bF9hPjsKLQkJcGlucy1hcmUtbnVtYmVyZWQ7CiAJCWdwaW8tY29udHJvbGxlcjsKIAkJI2dw
aW8tY2VsbHMgPSA8Mj47CiAJCWludGVycnVwdC1jb250cm9sbGVyOwpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvbXQ4MTM1LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9tdDgxMzUuZHRz
aQppbmRleCBhMDMxYjM2MzYzMTg3Li4wZjI5MWFkMjJkM2FmIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9tdDgxMzUuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9tdDgxMzUuZHRz
aQpAQCAtMTUyLDcgKzE1Miw2IEBAIHBpbzogcGluY3RybEAxMDAwNTAwMCB7CiAJCQljb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODEzNS1waW5jdHJsIjsKIAkJCXJlZyA9IDwwIDB4MTAwMGIwMDAg
MCAweDEwMDA+OwogCQkJbWVkaWF0ZWsscGN0bC1yZWdtYXAgPSA8JnN5c2NmZ19wY3RsX2EgJnN5
c2NmZ19wY3RsX2I+OwotCQkJcGlucy1hcmUtbnVtYmVyZWQ7CiAJCQlncGlvLWNvbnRyb2xsZXI7
CiAJCQkjZ3Bpby1jZWxscyA9IDwyPjsKIAkJCWludGVycnVwdC1jb250cm9sbGVyOwotLSAKMi4z
OC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
