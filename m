Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A613AEDDD7
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 15:01:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6566C32E92;
	Mon, 30 Jun 2025 13:01:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3A8FC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 13:01:10 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAhJQk015201;
 Mon, 30 Jun 2025 15:00:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=fUjxTU75ZD40DdIr6Z8X8u
 fn/8WVlq3YFcObITGk6Pg=; b=ktFywgu01LSZVISgRlLmmzgVOepR5cNYEzOpn2
 zVWxXroIb6x+nogDQQJYqkMi69rDnI3XcnNo8tUAGKw35i4a2EjUO6yfrQKnL++J
 g9mBsNr6bkw3odTJZNAU8gViEKDpJ22NjwPRT5JlnAU6CPn7MTtaa9o3MBlRsCTh
 DaPn57w+QSCmN+fDiu9rRXTHb5vgvGiBa8v0eX+JHAYSvaj3JadwozxtUoj0ytef
 jLpyt0/I9nZ/9n4AR0VT43psrBcpO3lpL2ya97fANVEJHKtCg+4Kpz3zq9pbwbfv
 WIwtQlIWXagJSIHExqRLuVIHxZhyi45rnCdf3hTnU3AELskw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jsy4na14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jun 2025 15:00:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F1FCF40045;
 Mon, 30 Jun 2025 14:59:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 40FBAB46C86;
 Mon, 30 Jun 2025 14:59:27 +0200 (CEST)
Received: from localhost (10.252.20.7) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 14:59:26 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 30 Jun 2025 14:59:23 +0200
MIME-Version: 1.0
Message-ID: <20250630-spi-fix-v2-1-4680939e2a3e@foss.st.com>
X-B4-Tracking: v=1; b=H4sIACqKYmgC/2WMQQ6CMBAAv0L2bMm2yqqc/IfhIGUre5CSLmk0h
 L9buXqcyWRWUE7CCm21QuIsKnEq4A4V+PExPdnIUBgcugbpiEZnMUHe5kJ4stSH/koDlHpOXPR
 +uneFR9Elps8+zvZn/x/ZGmsc09l6RGLb3EJUrXWpfXxBt23bF1B6QmCgAAAA
X-Change-ID: 20250630-spi-fix-860416bfb96d
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.20.7]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [Linux-stm32] [PATCH v2] spi: stm32: fix sram pool free in probe
	error path
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

QWRkIGEgdGVzdCB0byBjaGVjayB3aGV0aGVyIHRoZSBzcmFtX3Bvb2wgaXMgTlVMTCBiZWZvcmUg
ZnJlZWluZyBpdC4KCkZpeGVzOiBkMTdkZDJmMWQ4YTEgKCJzcGk6IHN0bTMyOiB1c2UgU1RNMzIg
RE1BIHdpdGggU1RNMzIgTURNQSB0byBlbmhhbmNlIEREUiB1c2UiKQpSZXBvcnRlZC1ieTogRGFu
IENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPgpBY2tlZC1ieTogQWxhaW4gVm9s
bWF0IDxhbGFpbi52b2xtYXRAZm9zcy5zdC5jb20+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExl
IEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6
Ci0gQWRkIEFsYWluIFZvbG1hdCdzIEFja2VkLWJ5LgotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNTA2MzAtc3BpLWZpeC12MS0xLTJlNjcxYzAwNmUxNUBmb3NzLnN0
LmNvbQotLS0KIGRyaXZlcnMvc3BpL3NwaS1zdG0zMi5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9z
cGkvc3BpLXN0bTMyLmMgYi9kcml2ZXJzL3NwaS9zcGktc3RtMzIuYwppbmRleCAzZDIwZjA5ZjFh
ZTcuLjg1ODQ3MGEyY2FiNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMKKysr
IGIvZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMKQEAgLTI0ODYsNyArMjQ4Niw5IEBAIHN0YXRpYyBp
bnQgc3RtMzJfc3BpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKHNw
aS0+bWRtYV9yeCkKIAkJZG1hX3JlbGVhc2VfY2hhbm5lbChzcGktPm1kbWFfcngpOwogZXJyX3Bv
b2xfZnJlZToKLQlnZW5fcG9vbF9mcmVlKHNwaS0+c3JhbV9wb29sLCAodW5zaWduZWQgbG9uZylz
cGktPnNyYW1fcnhfYnVmLCBzcGktPnNyYW1fcnhfYnVmX3NpemUpOworCWlmIChzcGktPnNyYW1f
cG9vbCkKKwkJZ2VuX3Bvb2xfZnJlZShzcGktPnNyYW1fcG9vbCwgKHVuc2lnbmVkIGxvbmcpc3Bp
LT5zcmFtX3J4X2J1ZiwKKwkJCSAgICAgIHNwaS0+c3JhbV9yeF9idWZfc2l6ZSk7CiBlcnJfZG1h
X3JlbGVhc2U6CiAJaWYgKHNwaS0+ZG1hX3R4KQogCQlkbWFfcmVsZWFzZV9jaGFubmVsKHNwaS0+
ZG1hX3R4KTsKCi0tLQpiYXNlLWNvbW1pdDogMDQ1NzE5YjFkMGFhYjk4ZTZhYmRkNzcxNWU4NTg3
Yjk5N2QxY2VmYQpjaGFuZ2UtaWQ6IDIwMjUwNjMwLXNwaS1maXgtODYwNDE2YmZiOTZkCgpCZXN0
IHJlZ2FyZHMsCi0tIApDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5z
dC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
