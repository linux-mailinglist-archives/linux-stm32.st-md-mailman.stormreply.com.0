Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9CDB01F86
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 16:51:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAF2CC3F931;
	Fri, 11 Jul 2025 14:51:36 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC05DC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 14:51:34 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BEncdU022508;
 Fri, 11 Jul 2025 16:51:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 1S+/fxjBGM9OThOsnlJiBdnI+RCOnybmlz6yPJOrPUQ=; b=zEfrgD58iQjnGk67
 auh5vjzFlbLNa57MXCDGAFyM7/PNPv/3Csz7zEAB8Gsl/Ptj+d5ojbTylESZCvOg
 lP3Oq0EJt9H+0P22p7pQDbiPDpkMWJKhqiQJLu8V8vZ2BOPRQtO2ZAw/qmhlHKn1
 wK4A0DDZYA+H9YuHYj8ZKjLWWCIl+SM17Z5cyZ1rTMbSHaSotmpsnLDKi3ILkfFH
 0r9vdOZDwqXD58xDKKISIXGVSk6kFjDjLk1FiNrKP0MPd3IaHWekwSppS7BgSCu0
 Y6hv1RIDAr5UxQFUQIQB78dhijr+2si7MtgoMhQ6d9NgCWu89oU2B+NRgm7GTuFD
 U8IjPQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47qf0q4duu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jul 2025 16:51:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C3E4C40052;
 Fri, 11 Jul 2025 16:49:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18C93B4A8CD;
 Fri, 11 Jul 2025 16:49:13 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 16:49:12 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 16:48:53 +0200
MIME-Version: 1.0
Message-ID: <20250711-ddrperfm-upstream-v2-1-cdece720348f@foss.st.com>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
In-Reply-To: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Le
 Goffic <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.252.16.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 01/16] bus: firewall: move stm32_firewall
 header file in include folder
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

T3RoZXIgZHJpdmVyIHRoYW4gcmlmc2MgYW5kIGV0enBjIGNhbiBpbXBsZW1lbnQgZmlyZXdhbGwg
b3BzLCBzdWNoIGFzCnJjYy4KSW4gb3JkZXIgZm9yIHRoZW0gdG8gaGF2ZSBhY2Nlc3MgdG8gdGhl
IG9wcyBhbmQgdHlwZSBvZiB0aGlzIGZyYW1ld29yaywKd2UgbmVlZCB0byBnZXQgdGhlIGBzdG0z
Ml9maXJld2FsbC5oYCBmaWxlIGluIHRoZSBpbmNsdWRlLyBmb2xkZXIuCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Ci0tLQog
ZHJpdmVycy9idXMvc3RtMzJfZXR6cGMuYyAgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQog
ZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuYyAgICAgICAgICAgICAgICAgICAgfCAzICstLQog
ZHJpdmVycy9idXMvc3RtMzJfcmlmc2MuYyAgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQog
e2RyaXZlcnMgPT4gaW5jbHVkZS9saW51eH0vYnVzL3N0bTMyX2ZpcmV3YWxsLmggfCAwCiA0IGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jIGIvZHJpdmVycy9idXMvc3RtMzJfZXR6cGMuYwpp
bmRleCA3ZmMwZjE2OTYwYmUuLjQ5MThhMTRlNTA3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9idXMv
c3RtMzJfZXR6cGMuYworKysgYi9kcml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jCkBAIC01LDYgKzUs
NyBAQAogCiAjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KICNpbmNsdWRlIDxsaW51eC9iaXRz
Lmg+CisjaW5jbHVkZSA8bGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsLmg+CiAjaW5jbHVkZSA8bGlu
dXgvZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+CiAjaW5jbHVkZSA8bGludXgvaW5p
dC5oPgpAQCAtMTYsOCArMTcsNiBAQAogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5o
PgogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAKLSNpbmNsdWRlICJzdG0zMl9maXJld2FsbC5o
IgotCiAvKgogICogRVRaUEMgcmVnaXN0ZXJzCiAgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVz
L3N0bTMyX2ZpcmV3YWxsLmMgYi9kcml2ZXJzL2J1cy9zdG0zMl9maXJld2FsbC5jCmluZGV4IDJm
Yzk3NjFkYWRlYy4uZWY0OTg4MDU0YjQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2J1cy9zdG0zMl9m
aXJld2FsbC5jCisrKyBiL2RyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmMKQEAgLTUsNiArNSw3
IEBACiAKICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgogI2luY2x1ZGUgPGxpbnV4L2JpdHMu
aD4KKyNpbmNsdWRlIDxsaW51eC9idXMvc3RtMzJfZmlyZXdhbGwuaD4KICNpbmNsdWRlIDxsaW51
eC9idXMvc3RtMzJfZmlyZXdhbGxfZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+
CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+CkBAIC0xOCw4ICsxOSw2IEBACiAjaW5jbHVkZSA8bGlu
dXgvdHlwZXMuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAKLSNpbmNsdWRlICJzdG0zMl9m
aXJld2FsbC5oIgotCiAvKiBDb3JyZXNwb25kcyB0byBTVE0zMl9GSVJFV0FMTF9NQVhfRVhUUkFf
QVJHUyArIGZpcmV3YWxsIElEICovCiAjZGVmaW5lIFNUTTMyX0ZJUkVXQUxMX01BWF9BUkdTCQko
U1RNMzJfRklSRVdBTExfTUFYX0VYVFJBX0FSR1MgKyAxKQogCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2J1cy9zdG0zMl9yaWZzYy5jIGIvZHJpdmVycy9idXMvc3RtMzJfcmlmc2MuYwppbmRleCA0Y2Yx
YjYwMDE0YjcuLjY0M2RkZDBhNWY1NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9idXMvc3RtMzJfcmlm
c2MuYworKysgYi9kcml2ZXJzL2J1cy9zdG0zMl9yaWZzYy5jCkBAIC01LDYgKzUsNyBAQAogCiAj
aW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KICNpbmNsdWRlIDxsaW51eC9iaXRzLmg+CisjaW5j
bHVkZSA8bGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsLmg+CiAjaW5jbHVkZSA8bGludXgvZGV2aWNl
Lmg+CiAjaW5jbHVkZSA8bGludXgvZXJyLmg+CiAjaW5jbHVkZSA8bGludXgvaW5pdC5oPgpAQCAt
MTYsOCArMTcsNiBAQAogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1
ZGUgPGxpbnV4L3R5cGVzLmg+CiAKLSNpbmNsdWRlICJzdG0zMl9maXJld2FsbC5oIgotCiAvKgog
ICogUklGU0Mgb2Zmc2V0IHJlZ2lzdGVyCiAgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL3N0
bTMyX2ZpcmV3YWxsLmggYi9pbmNsdWRlL2xpbnV4L2J1cy9zdG0zMl9maXJld2FsbC5oCnNpbWls
YXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBkcml2ZXJzL2J1cy9zdG0zMl9maXJld2FsbC5o
CnJlbmFtZSB0byBpbmNsdWRlL2xpbnV4L2J1cy9zdG0zMl9maXJld2FsbC5oCgotLSAKMi40My4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
