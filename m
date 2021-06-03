Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE139A4E3
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jun 2021 17:41:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58E02C57B69;
	Thu,  3 Jun 2021 15:41:05 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16641C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jun 2021 15:41:03 +0000 (UTC)
Received: from [192.168.192.146] (port=48290 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1lopSj-00063B-Pd; Thu, 03 Jun 2021 17:40:49 +0200
Date: Thu, 3 Jun 2021 17:40:48 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Message-ID: <YLj4AMTCi84yO9GO@nx64de-df6d00>
Mail-Followup-To: Grzegorz Szymaszek <gszymaszek@short.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
MIME-Version: 1.0
Content-Disposition: inline
Cc: devicetree@vger.kernel.org, Grzegorz Szymaszek <gszymaszek@short.pl>,
 linux-kernel@vger.kernel.org, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: fix the Odyssey SoM eMMC
	VQMMC supply
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

VGhlIFNlZWVkIFNvTS1TVE0zMk1QMTU3QyBkZXZpY2UgdHJlZSBoYWQgdGhlIGVNTUPigJlzIChT
RE1NQzIpIFZRTU1DCnN1cHBseSBzZXQgdG8gdjN2MyAoYnVjazQpLCB0aGUgc2FtZSBhcyB0aGUg
Vk1NQyBzdXBwbHkuIFRoYXQgd2FzCmluY29ycmVjdCwgYXMgb24gdGhlIFNvTSwgdGhlIFZRTU1D
IHN1cHBseSBpcyBwcm92aWRlZCBmcm9tIHZkZCAoYnVjazMpCmluc3RlYWQuCgpTaWduZWQtb2Zm
LWJ5OiBHcnplZ29yeiBTenltYXN6ZWsgPGdzenltYXN6ZWtAc2hvcnQucGw+Ci0tLQogYXJjaC9h
cm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Mtb2R5c3NleS1zb20uZHRzaSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLW9keXNzZXktc29tLmR0c2kgYi9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTU3Yy1vZHlzc2V5LXNvbS5kdHNpCmluZGV4IDZjZjQ5YTBhOWU2OS4uYjU2
MDFkMjcwYzhmIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1vZHlz
c2V5LXNvbS5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLW9keXNzZXkt
c29tLmR0c2kKQEAgLTI2OSw3ICsyNjksNyBAQCAmc2RtbWMyIHsKIAlzdCxuZWctZWRnZTsKIAli
dXMtd2lkdGggPSA8OD47CiAJdm1tYy1zdXBwbHkgPSA8JnYzdjM+OwotCXZxbW1jLXN1cHBseSA9
IDwmdjN2Mz47CisJdnFtbWMtc3VwcGx5ID0gPCZ2ZGQ+OwogCW1tYy1kZHItM18zdjsKIAlzdGF0
dXMgPSAib2theSI7CiB9OwotLSAKMi4zMC4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
