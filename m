Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6791AE3A35
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 11:30:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 971FAC32EB0;
	Mon, 23 Jun 2025 09:30:00 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E136C36B2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 09:29:58 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8xDEl024011;
 Mon, 23 Jun 2025 11:29:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 c84xGmzk0WDtYO8pxiXJLl1Oz2OVFtl3JU/pJXFAfdc=; b=jQPh+kQxUnHvfPcA
 KzZiHgX4bkjM2hZCal54YdDqFf43W50G03KtAZI5j13pwnlAvpLfG8wzk2v7YTMo
 qTvTCQ5+1jFUFZg+QoCHMDYIyHSuPdhBkn2SHRxhzrMeeE4REROEEJkzhI+wE39a
 XwpMgzIVRj61Hv+L3c8zG+HB+iER+oOhmnxGWvTOiHebTwmZ4YUKHYPPd4L40hDf
 RJc9YiqrhlzMyLlKFHMJutM4nOlFB8UnBiB992VlnDOzKEHkzSjUFCYnp6+uFMTo
 Ll07eqSBHeoGY70vfO2yYYF792cjQA2NntkXBmZyrO/jzYepKm+mP6zl1lesfclz
 N/clqA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47e7pp4932-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jun 2025 11:29:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 261FC4004A;
 Mon, 23 Jun 2025 11:28:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A9B15C2DFF;
 Mon, 23 Jun 2025 11:27:23 +0200 (CEST)
Received: from localhost (10.252.18.29) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 11:27:23 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 23 Jun 2025 11:27:08 +0200
MIME-Version: 1.0
Message-ID: <20250623-ddrperfm-upstream-v1-3-7dffff168090@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
In-Reply-To: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.18.29]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 03/13] clk: stm32mp25: add firewall
	grant_access ops
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

T24gU1RNMzJNUDI1LCB0aGUgUkNDIHBlcmlwaGVyYWwgbWFuYWdlcyB0aGUgc2VjdXJlIGxldmVs
IG9mIHJlc291cmNlcwp0aGF0IGFyZSB1c2VkIGJ5IG90aGVyIGRldmljZXMgc3VjaCBhcyBjbG9j
a3MuCkRlY2xhcmUgdGhpcyBwZXJpcGhlcmFsIGFzIGEgZmlyZXdhbGwgY29udHJvbGxlci4KClNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0
LmNvbT4KLS0tCiBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDI1LmMgfCA0MCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc3RtMzIv
Y2xrLXN0bTMybXAyNS5jIGIvZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMybXAyNS5jCmluZGV4
IDUyZjBlOGExMjkyNi4uYWY0YmMwNmQ3MDNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9zdG0z
Mi9jbGstc3RtMzJtcDI1LmMKKysrIGIvZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMybXAyNS5j
CkBAIC00LDggKzQsMTAgQEAKICAqIEF1dGhvcjogR2FicmllbCBGZXJuYW5kZXogPGdhYnJpZWwu
ZmVybmFuZGV6QGZvc3Muc3QuY29tPiBmb3IgU1RNaWNyb2VsZWN0cm9uaWNzLgogICovCiAKKyNp
bmNsdWRlIDxsaW51eC9idXMvc3RtMzJfZmlyZXdhbGwuaD4KICNpbmNsdWRlIDxsaW51eC9idXMv
c3RtMzJfZmlyZXdhbGxfZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+
CisjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvaW8uaD4KICNpbmNs
dWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KIApAQCAtMTYwMiw2ICsxNjA0LDExIEBAIHN0
YXRpYyBpbnQgc3RtMzJfcmNjX2dldF9hY2Nlc3Modm9pZCBfX2lvbWVtICpiYXNlLCB1MzIgaW5k
ZXgpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgc3RtMzJtcDI1X3JjY19ncmFudF9hY2Nl
c3Moc3RydWN0IHN0bTMyX2ZpcmV3YWxsX2NvbnRyb2xsZXIgKmN0cmwsIHUzMiBmaXJld2FsbF9p
ZCkKK3sKKwlyZXR1cm4gc3RtMzJfcmNjX2dldF9hY2Nlc3MoY3RybC0+bW1pbywgZmlyZXdhbGxf
aWQpOworfQorCiBzdGF0aWMgaW50IHN0bTMybXAyNV9jaGVja19zZWN1cml0eShzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wLCB2b2lkIF9faW9tZW0gKmJhc2UsCiAJCQkJICAgIGNvbnN0IHN0cnVjdCBj
bG9ja19jb25maWcgKmNmZykKIHsKQEAgLTE5NzAsNiArMTk3Nyw3IEBAIE1PRFVMRV9ERVZJQ0Vf
VEFCTEUob2YsIHN0bTMybXAyNV9tYXRjaF9kYXRhKTsKIAogc3RhdGljIGludCBzdG0zMm1wMjVf
cmNjX2Nsb2Nrc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogeworCXN0cnVj
dCBzdG0zMl9maXJld2FsbF9jb250cm9sbGVyICpyY2NfY29udHJvbGxlcjsKIAlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCXZvaWQgX19pb21lbSAqYmFzZTsKIAlpbnQgcmV0OwpA
QCAtMTk4Miw3ICsxOTkwLDM2IEBAIHN0YXRpYyBpbnQgc3RtMzJtcDI1X3JjY19jbG9ja3NfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0
OwogCi0JcmV0dXJuIHN0bTMyX3JjY19pbml0KGRldiwgc3RtMzJtcDI1X21hdGNoX2RhdGEsIGJh
c2UpOworCXJldCA9IHN0bTMyX3JjY19pbml0KGRldiwgc3RtMzJtcDI1X21hdGNoX2RhdGEsIGJh
c2UpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlyY2NfY29udHJvbGxlciA9IGRldm1f
a3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnJjY19jb250cm9sbGVyKSwgR0ZQX0tFUk5FTCk7
CisJaWYgKCFyY2NfY29udHJvbGxlcikKKwkJcmV0dXJuIC1FTk9NRU07CisKKwlyY2NfY29udHJv
bGxlci0+ZGV2ID0gZGV2OworCXJjY19jb250cm9sbGVyLT5tbWlvID0gYmFzZTsKKwlyY2NfY29u
dHJvbGxlci0+bmFtZSA9IGRldl9kcml2ZXJfc3RyaW5nKGRldik7CisJcmNjX2NvbnRyb2xsZXIt
PnR5cGUgPSBTVE0zMl9QRVJJUEhFUkFMX0ZJUkVXQUxMOworCXJjY19jb250cm9sbGVyLT5ncmFu
dF9hY2Nlc3MgPSBzdG0zMm1wMjVfcmNjX2dyYW50X2FjY2VzczsKKworCXBsYXRmb3JtX3NldF9k
cnZkYXRhKHBkZXYsIHJjY19jb250cm9sbGVyKTsKKworCXJldCA9IHN0bTMyX2ZpcmV3YWxsX2Nv
bnRyb2xsZXJfcmVnaXN0ZXIocmNjX2NvbnRyb2xsZXIpOworCWlmIChyZXQpIHsKKwkJZGV2X2Vy
cihkZXYsICJDb3VsZG4ndCByZWdpc3RlciBhcyBhIGZpcmV3YWxsIGNvbnRyb2xsZXI6ICVkXG4i
LCByZXQpOworCQlyZXR1cm4gcmV0OworCX0KKworCXJldHVybiAwOworfQorCitzdGF0aWMgdm9p
ZCBzdG0zMm1wMjVfcmNjX2Nsb2Nrc19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKK3sKKwlzdHJ1Y3Qgc3RtMzJfZmlyZXdhbGxfY29udHJvbGxlciAqcmNjX2NvbnRyb2xsZXIg
PSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKKworCXN0bTMyX2ZpcmV3YWxsX2NvbnRyb2xs
ZXJfdW5yZWdpc3RlcihyY2NfY29udHJvbGxlcik7CiB9CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZv
cm1fZHJpdmVyIHN0bTMybXAyNV9yY2NfY2xvY2tzX2RyaXZlciA9IHsKQEAgLTE5OTEsNiArMjAy
OCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMybXAyNV9yY2NfY2xvY2tz
X2RyaXZlciA9IHsKIAkJLm9mX21hdGNoX3RhYmxlID0gc3RtMzJtcDI1X21hdGNoX2RhdGEsCiAJ
fSwKIAkucHJvYmUgPSBzdG0zMm1wMjVfcmNjX2Nsb2Nrc19wcm9iZSwKKwkucmVtb3ZlID0gc3Rt
MzJtcDI1X3JjY19jbG9ja3NfcmVtb3ZlLAogfTsKIAogc3RhdGljIGludCBfX2luaXQgc3RtMzJt
cDI1X2Nsb2Nrc19pbml0KHZvaWQpCgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
