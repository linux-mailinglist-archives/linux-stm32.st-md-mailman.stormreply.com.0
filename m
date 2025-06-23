Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A95AE3A33
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 11:29:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6653BC32E8E;
	Mon, 23 Jun 2025 09:29:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABE79C36B2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 09:29:57 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8swqj011088;
 Mon, 23 Jun 2025 11:29:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=pfOir4ecl8ee1I6IoTA4SW
 3MSW1FhLPJ2AAoMv1lBVo=; b=bNwUveSWYjtHQBMM1/hOzqx9Bp3NwBCqXHAS17
 u2MrUumsYbWgSla4q2Tr4pGCMTEgkVYf0RGA7w5gRYirFmSJPVDAA2+BhN+LnIB7
 A/8hxo/dpj0CWns3PcmKSI+nmua27t8nSThbmPScY/mSgmUA60s/uocEu0XAnM30
 aQdmyQs5HQnxzvKEJD2RTdHmfpgbLf2uzC4nmXHamdn+Eh8BKuPVXZEnm+x9r0GN
 Co6WwTrVngV20SkVlI3WqjpYhQkBNhods3Sv6G7BngPq0RfMsa5xVK2+J37dLDmQ
 3gXRBC4rndYYEM2vbEd33SCdg9PizR/HG/NzPuW+jw9rJ88w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47e6a6cjpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jun 2025 11:29:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 25F6640049;
 Mon, 23 Jun 2025 11:28:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C65DE562948;
 Mon, 23 Jun 2025 11:27:20 +0200 (CEST)
Received: from localhost (10.252.18.29) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 11:27:20 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 23 Jun 2025 11:27:05 +0200
Message-ID: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOkdWWgC/x3MQQqAIBBA0avErBNMMKGrRAvLsWahyVgRiHdPW
 r7F/wUyMmGGqSvA+FCmMzYMfQfbYeOOglwzKKm01GoUznFC9kHcKV+MNojVS+O1MUY7C61LjJ7
 e/zkvtX6z1g3LYwAAAA==
X-Change-ID: 20250526-ddrperfm-upstream-bf07f57775da
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
Subject: [Linux-stm32] [PATCH 00/13] Introduce STM32 DDR PMU for STM32MP
	platforms
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

VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyB0aGUgRERSIFBlcmZvcm1hbmNlIE1vbml0b3Ig
KEREUlBFUkZNKSBzdXBwb3J0IGZvcgpTVE0zMk1QIHBsYXRmb3Jtcy4KClRoZSBzZXJpZXMgZmly
c3RseSBpbXByb3ZlcyB0aGUgU1RNMzJNUDI1IFJDQyBkcml2ZXIgdG8gbWFrZSBpdCB1c2FibGUK
YXMgYW4gYWNjZXNzIGNvbnRyb2xsZXIsIG5lZWRlZCBmb3IgZHJpdmVyIHByb2JlLgoKSXQgYWxz
byBpbmNsdWRlcyB0aGUgYWRkaXRpb24gb2YgZGV2aWNlIHRyZWUgYmluZGluZ3MsIHRoZSBIRFAg
ZHJpdmVyLApkb2N1bWVudGF0aW9uIGFuZCB1cGRhdGVzIHRvIHRoZSBkZXZpY2UgdHJlZSBmaWxl
cyBmb3IKU1RNMzJNUDEzLCBTVE0zMk1QMTUgYW5kIFNUTTMyTVAyNSBTb0NzLgpUaGUgc2VyaWVz
IGFsc28gdXBkYXRlcyB0aGUgTUFJTlRBSU5FUlMgZmlsZSB0byBpbmNsdWRlIG15c2VsZiBhcyB0
aGUKbWFpbnRhaW5lciBmb3IgdGhlIFNUTTMyIEREUiBQTVUgZHJpdmVyLgoKU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgotLS0K
Q2zDqW1lbnQgTGUgR29mZmljICgxMyk6CiAgICAgIGJ1czogZmlyZXdhbGw6IG1vdmUgc3RtMzJf
ZmlyZXdhbGwgaGVhZGVyIGZpbGUgaW4gaW5jbHVkZSBmb2xkZXIKICAgICAgZHQtYmluZGluZ3M6
IHN0bTMyOiBzdG0zMm1wMjU6IGFkZCBgYWNjZXNzLWNvbnRyb2xsZXItY2VsbGAgcHJvcGVydHkK
ICAgICAgY2xrOiBzdG0zMm1wMjU6IGFkZCBmaXJld2FsbCBncmFudF9hY2Nlc3Mgb3BzCiAgICAg
IGFybTY0OiBkdHM6IHN0OiBzZXQgcmNjIGFzIGFuIGFjY2Vzcy1jb250cm9sbGVyCiAgICAgIGR0
LWJpbmRpbmdzOiBwZXJmOiBzdG0zMjogaW50cm9kdWNlIEREUlBFUkZNIGR0LWJpbmRpbmdzCiAg
ICAgIHBlcmY6IHN0bTMyOiBpbnRyb2R1Y2UgRERSUEVSRk0gZHJpdmVyCiAgICAgIERvY3VtZW50
YXRpb246IHBlcmY6IHN0bTMyOiBhZGQgZGRycGVyZm0gc3VwcG9ydAogICAgICBNQUlOVEFJTkVS
UzogYWRkIG15c2VsZiBhcyBTVE0zMiBERFIgUE1VIG1haW50YWluZXIKICAgICAgQVJNOiBkdHM6
IHN0bTMyOiBhZGQgZGRycGVyZm0gb24gc3RtMzJtcDEzMQogICAgICBBUk06IGR0czogc3RtMzI6
IGFkZCBkZHJwZXJmbSBvbiBzdG0zMm1wMTUxCiAgICAgIGFybTY0OiBkdHM6IHN0OiBhZGQgZGRy
cGVyZm0gb24gc3RtMzJtcDI1MQogICAgICBhcm02NDogZHRzOiBzdDogc3VwcG9ydCBkZHJwZXJm
bSBvbiBzdG0zMm1wMjU3Zi1kawogICAgICBhcm02NDogZHRzOiBzdDogc3VwcG9ydCBkZHJwZXJm
bSBvbiBzdG0zMm1wMjU3Zi1ldjEKCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3BlcmYvaW5k
ZXgucnN0ICAgICAgICAgICB8ICAgMSArCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3BlcmYv
c3RtMzItZGRyLXBtdS5yc3QgICB8ICA4NiArKwogLi4uL2JpbmRpbmdzL2Nsb2NrL3N0LHN0bTMy
bXAyNS1yY2MueWFtbCAgICAgICAgICAgfCAgIDYgKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGVyZi9zdCxzdG0zMi1kZHItcG11LnlhbWwgfCAgOTMgKysrCiBNQUlOVEFJTkVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArCiBhcmNoL2FybS9ib290L2R0
cy9zdC9zdG0zMm1wMTMxLmR0c2kgICAgICAgICAgICAgICB8ICAgNyArCiBhcmNoL2FybS9ib290
L2R0cy9zdC9zdG0zMm1wMTUxLmR0c2kgICAgICAgICAgICAgICB8ICAgNyArCiBhcmNoL2FybTY0
L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSAgICAgICAgICAgICB8ICAgOCArCiBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWRrLmR0cyAgICAgICAgICB8ICAgNSArCiBhcmNo
L2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWV2MS5kdHMgICAgICAgICB8ICAgNSArCiBk
cml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyAr
LQogZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuYyAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDMgKy0KIGRyaXZlcnMvYnVzL3N0bTMyX3JpZnNjLmMgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAzICstCiBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDI1LmMgICAgICAgICAgICAg
ICAgICB8ICA0MCArLQogZHJpdmVycy9wZXJmL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMTEgKwogZHJpdmVycy9wZXJmL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9wZXJmL3N0bTMyX2Rkcl9wbXUuYyAgICAgICAg
ICAgICAgICAgICAgICAgfCA4OTMgKysrKysrKysrKysrKysrKysrKysrCiB7ZHJpdmVycyA9PiBp
bmNsdWRlL2xpbnV4fS9idXMvc3RtMzJfZmlyZXdhbGwuaCAgICB8ICAgMAogMTggZmlsZXMgY2hh
bmdlZCwgMTE3MiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6
IDg2NzMxYTJhNjUxZTU4OTUzZmM5NDk1NzM4OTVmMmZhNmQ0NTY4NDEKY2hhbmdlLWlkOiAyMDI1
MDUyNi1kZHJwZXJmbS11cHN0cmVhbS1iZjA3ZjU3Nzc1ZGEKCkJlc3QgcmVnYXJkcywKLS0gCkNs
w6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
