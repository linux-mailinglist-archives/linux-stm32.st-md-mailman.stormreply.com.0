Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A69648A8A
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Dec 2022 23:06:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0009EC65E52;
	Fri,  9 Dec 2022 22:06:36 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECA98C65E4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Dec 2022 22:06:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3lVS-0004Cr-71; Fri, 09 Dec 2022 23:06:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3lVN-003Rl1-6k; Fri, 09 Dec 2022 23:06:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p3lVN-003s4M-7n; Fri, 09 Dec 2022 23:06:05 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tomi Valkeinen <tomba@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  9 Dec 2022 23:05:54 +0100
Message-Id: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3841;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=g7U++VBYjsw72zS1Mwx3VnFa6URcPWkN6VrvjEwwg+s=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjk7E/6dUH2l3E5Z1fbm4ZVcX+8Ul6vtdDy7DiDQTE
 jebjo+eJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5OxPwAKCRDB/BR4rcrsCW5TB/
 4lA5OoB41UM9P/8u1JBYMhLilxGrFM1Y54iJlvJgc/oXkK1jJMZ5g4Z0wDyUJk+jaOjTZ+ucgbEcvZ
 TbVwY98MfzHS/YBINUJgmf9I0iZW5TSZn1stSHaFUF1zPa0lChc2eEU2HvshYM9y98rdcRGjv03q8B
 +OFu/jfxW55oiq0x5Vwh7XU2YiX5+sKJDYmG2t1+M4OzzM09d6G/MA2VHlE5q3WtuQbUDjo9vEJPXj
 HuNDm6s+dzgZGQOSO6tzbv0/N6YOdsPnVDdCz3sSglOH8OQtFPkInp7Cf/ceRjnNANv442zRzK6Gmb
 qIjlDkziphIEaaVCEa2nIGiqLEm0Bp
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] drm: Drop ARCH_MULTIPLATFORM from dependencies
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

U29tZSBvZiB0aGVzZSBkZXBlbmRlbmNpZXMgdXNlZCB0byBiZSBzZW5zaWJsZSB3aGVuIG9ubHkg
YSBzbWFsbCBwYXJ0IG9mCnRoZSBwbGF0Zm9ybXMgc3VwcG9ydGVkIGJ5IEFSQ0g9YXJtIGNvdWxk
IGJlIGNvbXBpbGVkIHRvZ2V0aGVyIGluIGEKc2luZ2xlIGtlcm5lbCBpbWFnZS4gTm93YWRheXMg
QVJDSF9NVUxUSVBMQVRGT1JNIGlzIG9ubHkgdXNlZCBhcyBhIGd1YXJkCmZvciBrZXJuZWwgb3B0
aW9ucyBpbmNvbXBhdGlibGUgd2l0aCBhIG11bHRpcGxhdGZvcm0gaW1hZ2UuIFNlZSBjb21taXQK
ODRmYzg2MzYwNjIzICgiQVJNOiBtYWtlIEFSQ0hfTVVMVElQTEFURk9STSB1c2VyLXZpc2libGUi
KSBmb3Igc29tZSBtb3JlCmRldGFpbHMuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5p
ZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9l
eHlub3MvS2NvbmZpZyAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vaW14L0tjb25maWcgICAgIHwg
MiArLQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vS2NvbmZpZyB8IDIgKy0KIGRyaXZlcnMvZ3B1
L2RybS9zdGkvS2NvbmZpZyAgICAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vc3RtL0tjb25maWcg
ICAgIHwgMiArLQogZHJpdmVycy9ncHUvaXB1LXYzL0tjb25maWcgICAgICB8IDIgKy0KIDYgZmls
ZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
S2NvbmZpZwppbmRleCAzZDJmMDI1ZDRmZDQuLjQwNDlmYTQyNzNhYiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9LY29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
S2NvbmZpZwpAQCAtMiw3ICsyLDcgQEAKIGNvbmZpZyBEUk1fRVhZTk9TCiAJdHJpc3RhdGUgIkRS
TSBTdXBwb3J0IGZvciBTYW1zdW5nIFNvQyBFeHlub3MgU2VyaWVzIgogCWRlcGVuZHMgb24gT0Yg
JiYgRFJNICYmIENPTU1PTl9DTEsKLQlkZXBlbmRzIG9uIEFSQ0hfUzNDNjRYWCB8fCBBUkNIX1M1
UFYyMTAgfHwgQVJDSF9FWFlOT1MgfHwgQVJDSF9NVUxUSVBMQVRGT1JNIHx8IENPTVBJTEVfVEVT
VAorCWRlcGVuZHMgb24gQVJDSF9TM0M2NFhYIHx8IEFSQ0hfUzVQVjIxMCB8fCBBUkNIX0VYWU5P
UyB8fCBDT01QSUxFX1RFU1QKIAlkZXBlbmRzIG9uIE1NVQogCXNlbGVjdCBEUk1fRElTUExBWV9I
RUxQRVIgaWYgRFJNX0VYWU5PU19EUAogCXNlbGVjdCBEUk1fS01TX0hFTFBFUgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2lteC9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2lteC9LY29u
ZmlnCmluZGV4IGZkNWIyNDcxZmRmMC4uNzczODg4ODM5NDk3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaW14L0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL2lteC9LY29uZmlnCkBA
IC00LDcgKzQsNyBAQCBjb25maWcgRFJNX0lNWAogCXNlbGVjdCBEUk1fS01TX0hFTFBFUgogCXNl
bGVjdCBWSURFT01PREVfSEVMUEVSUwogCXNlbGVjdCBEUk1fR0VNX0RNQV9IRUxQRVIKLQlkZXBl
bmRzIG9uIERSTSAmJiAoQVJDSF9NWEMgfHwgQVJDSF9NVUxUSVBMQVRGT1JNIHx8IENPTVBJTEVf
VEVTVCkKKwlkZXBlbmRzIG9uIERSTSAmJiAoQVJDSF9NWEMgfHwgQ09NUElMRV9URVNUKQogCWRl
cGVuZHMgb24gSU1YX0lQVVYzX0NPUkUKIAloZWxwCiAJICBlbmFibGUgaS5NWCBncmFwaGljcyBz
dXBwb3J0CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9LY29uZmlnIGIvZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vS2NvbmZpZwppbmRleCA0NTVlMWE5MWYwZTUuLjc2ZGVkMTU2
OGJkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vS2NvbmZpZworKysgYi9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9LY29uZmlnCkBAIC0yLDcgKzIsNyBAQAogY29uZmlnIERS
TV9PTUFQCiAJdHJpc3RhdGUgIk9NQVAgRFJNIgogCWRlcGVuZHMgb24gRFJNICYmIE9GCi0JZGVw
ZW5kcyBvbiBBUkNIX09NQVAyUExVUyB8fCBBUkNIX01VTFRJUExBVEZPUk0KKwlkZXBlbmRzIG9u
IEFSQ0hfT01BUDJQTFVTCiAJc2VsZWN0IERSTV9LTVNfSEVMUEVSCiAJc2VsZWN0IFZJREVPTU9E
RV9IRUxQRVJTCiAJc2VsZWN0IEhETUkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdGkv
S2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvS2NvbmZpZwppbmRleCBmMmE4ODBjNDg0ODUu
LjNjN2E1ZmVmZjhkZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0aS9LY29uZmlnCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvS2NvbmZpZwpAQCAtMSw3ICsxLDcgQEAKICMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogY29uZmlnIERSTV9TVEkKIAl0cmlzdGF0
ZSAiRFJNIFN1cHBvcnQgZm9yIFNUTWljcm9lbGVjdHJvbmljcyBTb0Mgc3RpSDR4eCBTZXJpZXMi
Ci0JZGVwZW5kcyBvbiBPRiAmJiBEUk0gJiYgKEFSQ0hfU1RJIHx8IEFSQ0hfTVVMVElQTEFURk9S
TSkKKwlkZXBlbmRzIG9uIE9GICYmIERSTSAmJiBBUkNIX1NUSQogCXNlbGVjdCBSRVNFVF9DT05U
Uk9MTEVSCiAJc2VsZWN0IERSTV9LTVNfSEVMUEVSCiAJc2VsZWN0IERSTV9HRU1fRE1BX0hFTFBF
UgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9LY29uZmlnIGIvZHJpdmVycy9ncHUv
ZHJtL3N0bS9LY29uZmlnCmluZGV4IGRlZDcyZjg3OTQ4Mi4uZmE0OWNkZTQzYmIyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0
bS9LY29uZmlnCkBAIC0xLDcgKzEsNyBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5CiBjb25maWcgRFJNX1NUTQogCXRyaXN0YXRlICJEUk0gU3VwcG9ydCBmb3IgU1RN
aWNyb2VsZWN0cm9uaWNzIFNvQyBTZXJpZXMiCi0JZGVwZW5kcyBvbiBEUk0gJiYgKEFSQ0hfU1RN
MzIgfHwgQVJDSF9NVUxUSVBMQVRGT1JNKQorCWRlcGVuZHMgb24gRFJNICYmIEFSQ0hfU1RNMzIK
IAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKIAlzZWxlY3QgRFJNX0dFTV9ETUFfSEVMUEVSCiAJc2Vs
ZWN0IERSTV9QQU5FTF9CUklER0UKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2lwdS12My9LY29u
ZmlnIGIvZHJpdmVycy9ncHUvaXB1LXYzL0tjb25maWcKaW5kZXggMDYxZmI5OTBjMTIwLi43ZGVj
ZTJhNTNjNWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2lwdS12My9LY29uZmlnCisrKyBiL2Ry
aXZlcnMvZ3B1L2lwdS12My9LY29uZmlnCkBAIC0xLDcgKzEsNyBAQAogIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiBjb25maWcgSU1YX0lQVVYzX0NPUkUKIAl0cmlzdGF0
ZSAiSVBVdjMgY29yZSBzdXBwb3J0IgotCWRlcGVuZHMgb24gU09DX0lNWDUgfHwgU09DX0lNWDZR
IHx8IEFSQ0hfTVVMVElQTEFURk9STSB8fCBDT01QSUxFX1RFU1QKKwlkZXBlbmRzIG9uIFNPQ19J
TVg1IHx8IFNPQ19JTVg2USB8fCBDT01QSUxFX1RFU1QKIAlkZXBlbmRzIG9uIERSTSB8fCAhRFJN
ICMgaWYgRFJNPW0sIHRoaXMgY2FuJ3QgYmUgJ3knCiAJc2VsZWN0IEJJVFJFVkVSU0UKIAlzZWxl
Y3QgR0VORVJJQ19BTExPQ0FUT1IgaWYgRFJNCgpiYXNlLWNvbW1pdDogMGQxNDA5ZTRmZjA4YWE0
YTlhMjU0ZDNmNzIzNDEwZGIzMmFhNzU1MgotLSAKMi4zOC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
