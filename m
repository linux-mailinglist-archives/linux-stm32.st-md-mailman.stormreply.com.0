Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5178DA17CBB
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2025 12:14:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E44B9C78F74;
	Tue, 21 Jan 2025 11:14:29 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5891DC78F74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2025 11:14:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>) id 1taCD7-0000YZ-R1
 for linux-stm32@st-md-mailman.stormreply.com; Tue, 21 Jan 2025 12:14:21 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1taCD7-00169d-1o
 for linux-stm32@st-md-mailman.stormreply.com;
 Tue, 21 Jan 2025 12:14:21 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
 by bjornoya.blackshift.org (Postfix) with SMTP id 3BB213AD9C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2025 11:14:21 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by bjornoya.blackshift.org (Postfix) with ESMTPS id 6B8193AD9A6;
 Tue, 21 Jan 2025 11:14:18 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
 by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 21fefb3e;
 Tue, 21 Jan 2025 11:14:17 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 21 Jan 2025 12:14:04 +0100
Message-Id: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH2Bj2cC/23NTQ6CMBAF4KuQrq3pH0FceQ/jotIBJtFC2tKUE
 O5ubeJGXb7Mm+9txIND8ORcbcRBRI+TzUEeKtKN2g5A0eRMBBOKC87oI2naa3RrWBKFRrK2aY0
 0sif5ZXbQYyrclfjwlIJaSIHc8m1EHya3lqXIS+M/GjlltNWgGe/M/SThMoMdluAmi+looGhRf
 ISacfEtiLdQ90oz0Fop8yPs+/4Cfsy2Q/sAAAA=
X-Change-ID: 20241210-lxa-fairytux-e730979d3d3f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=gLAGzHCTBArIbQ78yvJWJOpUrAVjiYKWUXHS22nGDvI=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnj4F/deGvqvVVtXYvv0rwry5wbUPLKielpr2KH
 dvQPMDOmSyJATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZ4+BfwAKCRAoOKI+ei28
 b2NsB/4zlM2Qsoh2apcCOK537lddCEmvs86JylIVLspPQ71D+YNReCP9s5Mtz0kke/zhv/m37uo
 IkT/2YA2tlPgp/C0MHrMeCPoQdhzHnN3pZeYhZakMN556wLcviDsIdHsorjfyf2+jOoiT9zKqPj
 YalcIGcf4ARs6H7MmMV+6neee1CZCg4Y85tno7p5KQbM6siAS2JdbgvUPh9zrdOSh+HwbtfwdAY
 cNZPelfUtXFaRiA5NeOWpEqCQ4wxPNO9sVFdwTUpHggQfy09hDXnVU7znw94sp9m3uqXy+jhaxK
 ucwJOME+2T7ptVUIDCwsRQ0GWWVpABUHPrWuyDphsYkTRmHW
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de,
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH stm32-next v3 0/2] ARM: dts: stm32:
 lxa-fairytux2: add gen{1, 2} boards
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

SGVsbG8sCgp0aGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBMaW51eCBBdXRvbWF0aW9u
IEdtYkggRmFpcnlUdXgyCmJvYXJkcyBnZW5lcmF0aW9uIDEgYW5kIDIuCgpUaGUgRmFpcnlUdXgy
IGlzIGEgc21hbGwgTGludXggZGV2aWNlIGJhc2VkIG9uIGFuIE9jdGF2byBTeXN0ZW1zCk9TRDMy
TVAxNTNjIFNpUCwgdGhhdCBvY2N1cGllcyBqdXN0IHR3byBzbG90cyBvbiBhIERJTiByYWlsLgoK
cmVnYXJkcywKTWFyYwoKU2lnbmVkLW9mZi1ieTogTWFyYyBLbGVpbmUtQnVkZGUgPG1rbEBwZW5n
dXRyb25peC5kZT4KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gMi8yOiBmaXggdXNlIGdlbmVyaWMgbm9k
ZSBuYW1lcyBmb3IgZXh0ZXJuYWwgR1BJTyBhbmQgVVNCIFR5cGUtQyBjb250cm9sbGVyICh0aGFu
a3MgS3J6eXN6dG9mKQotIDIvMjogTEVEczogcmVwbGFjZSBsYWJlbCBieSBjb2xvciBhbmQgZnVu
Y3Rpb24gcHJvcGVydHkgKHRoYW5rcyBLcnp5c3p0b2YpCi0gMi8yOiBnZW4yOiBzb3J0IG5vZGVz
IG9mIGkyYzEgYnkgYWRkcmVzcyAodGhhbmtzIEtyenlzenRvZikKLSBMaW5rIHRvIHYyOiBodHRw
czovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNTAxMjAtbHhhLWZhaXJ5dHV4LXYyLTAtOTVmNGEwZWFh
NDRkQHBlbmd1dHJvbml4LmRlCgpDaGFuZ2VzIGluIHYyOgotIDEvMjogQWRkZWQgS3J6eXN6dG9m
J3MgQWNrZWQtYnkKLSAyLzI6IGZpeCBhbGlnbm1lbnQgZm9yIGdwaW8tbGluZS1uYW1lcyAodGhh
bmtzIEtyenlzenRvZikKLSAyLzI6IG9ubHkgdXNlIGNvbG9yOmZ1bmN0aW9uIGZvciBMRUQgbGFi
ZWxzICh0aGFua3MgS3J6eXN6dG9mKQotIDIvMjogdXNlIGdlbmVyaWMgbm9kZSBuYW1lcyBmb3Ig
ZXh0ZXJuYWwgR1BJTyBhbmQgVVNCIFR5cGUtQyBjb250cm9sbGVyCi0gTGluayB0byB2MTogaHR0
cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjQxMjEwLWx4YS1mYWlyeXR1eC12MS0wLTlhZWEwMWNk
YjgzZUBwZW5ndXRyb25peC5kZQoKLS0tCkxlb25hcmQgR8O2aHJzICgyKToKICAgICAgZHQtYmlu
ZGluZ3M6IGFybTogc3RtMzI6IGFkZCBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIExpbnV4IEF1dG9t
YXRpb24gR21iSCBMWEEgRmFpcnlUdXggMgogICAgICBBUk06IGR0czogc3RtMzI6IGx4YS1mYWly
eXR1eDI6IGFkZCBMaW51eCBBdXRvbWF0aW9uIEdtYkggRmFpcnlUdXggMgoKIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sICAgICAgIHwgICAyICsKIGFyY2gvYXJt
L2Jvb3QvZHRzL3N0L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKIC4uLi9i
b290L2R0cy9zdC9zdG0zMm1wMTUzYy1seGEtZmFpcnl0dXgyLWdlbjEuZHRzIHwgMTAzICsrKysr
KwogLi4uL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTNjLWx4YS1mYWlyeXR1eDItZ2VuMi5kdHMgfCAx
NDcgKysrKysrKysKIC4uLi9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1M2MtbHhhLWZhaXJ5dHV4
Mi5kdHNpIHwgMzk3ICsrKysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA2NTEg
aW5zZXJ0aW9ucygrKQotLS0KYmFzZS1jb21taXQ6IGI3ZWJmYjg0YTA5ZGU2YjQ0NDkyOTc0MzM5
NjU0ZDhmZmM1YWQ5ZTEKY2hhbmdlLWlkOiAyMDI0MTIxMC1seGEtZmFpcnl0dXgtZTczMDk3OWQz
ZDNmCgpCZXN0IHJlZ2FyZHMsCi0tIApNYXJjIEtsZWluZS1CdWRkZSA8bWtsQHBlbmd1dHJvbml4
LmRlPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
