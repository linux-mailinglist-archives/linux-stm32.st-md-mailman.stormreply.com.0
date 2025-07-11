Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BEAB01F83
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 16:51:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E04EAC3F933;
	Fri, 11 Jul 2025 14:51:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAAFFC3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 14:51:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BEbO5E001763;
 Fri, 11 Jul 2025 16:51:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=M6wCzfhmKz24hutGEjvI4y
 acgICEWTN17S8CLU7EPbY=; b=j3IebeREKy5UR1jjaOSFEx+MnsAPRiMr4hW2wc
 QY3tXcWf2eOfC6Eg/jfA/6vENZaErpJksMENN5r+kqb4d3PFoZTBVwipPJfMGA+a
 cVTdzoNMQC6fBxkLBYq5K59oo6oGYqfhlNT3WyBnTAX+Kq9uziVP35iyWysL+Bgg
 2CPsaO7WS3GuzTyijV3FjBUW+xQp59i0GDU/QB4pjEc2JO+7PiyCigaNcuKHEVML
 AaeAPmDoU7BfhrI5ZBZQYFSyQzIUfdMqtLbSwSN+PoQtS5EXIK+HHACXakEA71KQ
 cNTdQEkfiGkMMSSCYjV9/acjLN/IieuWvHvVwgTaWdJ1mtcQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47ps6ay386-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jul 2025 16:51:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C699C40053;
 Fri, 11 Jul 2025 16:49:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2368BB4A8CF;
 Fri, 11 Jul 2025 16:49:12 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 16:49:11 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 16:48:52 +0200
Message-ID: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFQkcWgC/22NwQ7CIBBEf6XZszQUA6gn/8P0gGWxHCjNbiWap
 v8u1qtze5PMmxUYKSLDpVmBsESOeaqgDg0Mo5seKKKvDEoqLbUywnuakUISz5kXQpfEPUgbtLV
 Wewd1NxOG+Nqdt77yGHnJ9N4vSvdtfzajjn9spRNSWB9qOnOSZ3kNmbnlpR1ygn7btg9IElCst
 AAAAA==
X-Change-ID: 20250526-ddrperfm-upstream-bf07f57775da
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
Subject: [Linux-stm32] [PATCH v2 00/16] Introduce STM32 DDR PMU for STM32MP
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
Q2hhbmdlcyBpbiB2MjoKLSBNQUlOVEFJTkVSUzoKICAgIER1ZSB0byByZW9yZ2FuaXNhdGlvbiwg
bXkgY29udHJhY3Qgd2l0aCBTVCBlbmRzIGF0IHRoZSBlbmQgb2YgdGhpcyBtb250aAogICAgYW5k
IEkgd2lsbCBubyBsb25nZXIgaGF2ZSBhY2Nlc3MgdG8gdGhpcyBtYWlsYm94LgogICAgVGhlcmVm
b3JlLCBJIHdpbGwgYmUgYXZhaWxhYmxlIGZvciBhbnkgbWlzc2lvbiByZWxhdGVkIHRvIGVtYmVk
ZGVkIGFuZAogICAga2VybmVsIGxpbnV4LgogICAgQ2hhbmdlIGVtYWlsIGFkZHJlc3MgaW4gTUFJ
TlRBSU5FUlMgZmlsZSBmb3IgU1RNMzIgRERSIFBNVSBkcml2ZXIuCi0gZGV2aWNldHJlZXM6CiAg
LXN0bTMybXAyNTdmLWRrOiBhZGQgTFBERFI0IGNoYW5uZWwKICAtc3RtMzJtcDI1N2YtZXYxOiBh
ZGQgRERSNCBjaGFubmVsCi0gZHQtYmluZGluZ3M6CiAgLSBwZXJmOgogICAgLSBDaGFuZ2UgTWFp
bnRhaW5lciBlbWFpbCBhZGRyZXNzCiAgICAtIERyb3Agb2J2aW91cyBkZXNjcmlwdGlvbnMgKGNs
b2NrcyBhbmQgcmVzZXQgcHJvcGVydHkpCiAgICAtIERyb3AgcmVkdW5kYW50ICJiaW5kaW5ncyIg
aW4gY29tbWl0IG1lc3NhZ2UKICAgIC0gRHJvcCB1bm5lZWRkZWQgInN0bTMybXAxNTEtZGRyLXBt
dSIgY29tcGF0aWJsZQogICAgLSBzL3N0LGRyYW0tdHlwZS9tZW1vcnktY2hhbm5lbC8sIG1lbW9y
eS1jaGFubmVsIHByb3BlcnR5IGlzIG5vdCBpbgogICAgICBkdHNjaGVtYSBsaWJyYXJ5IHNvIGl0
IHdpbGwgcHJvZHVjZSBhbiBlcnJvciBpbiB0aGUgdjIuCiAgLSByY2M6CiAgICAtIEFkZCByZXF1
aXJlZCAiYWNjZXNzLWNvbnRyb2xsZXItY2VsbHMiIHByb3BlcnR5IGluIGV4YW1wbGUKICAtIGRk
ci1jaGFubmVsOgogICAgLSBBZGQgYmluZGluZ3MgYXMgcGVyIGplZGVjLGxwZGRyWC1jaGFubmVs
IGJpbmRpbmdzCi0gZHJpdmVyOgogIC0gU3Vic3RpdHV0ZSB0aGUgcGFyc2luZyBvZiB0aGUgJ3N0
LGRyYW0tdHlwZScgdmVuZG9yIGRldmljZXRyZWUKICAgIHByb3BlcnR5IHZhbHVlIHdpdGggdGhl
IHBhcnNpbmcgb2YgdGhlIFtscF1kZHIgY2hhbm5lbCBjb21wYXRpYmxlCiAgLSBSZW1vdmUgdW5u
ZWVkZWQgInN0bTMybXAxNTEtZGRyLXBtdSIgY29tcGF0aWJsZQogIC0gVXNlIGRldl9lcnJfcHJv
YmUgd2hlbiBwb3NzaWJsZQogIC0gQXNzZXJ0IGFuZCBkZWFzc2VydCByZXNldCBsaW5lIHVuY29u
ZGl0aW9ubmFseQogIC0gVXNlIGBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX2V4Y2x1
c2l2ZWAgaW5zdGVhZCBvZgogICAgYG9mX3Byb3BlcnR5X3ByZXNlbnRgIHRoZW4gYGRldm1fcmVz
ZXRfY29udHJvbF9nZXRgCiAgLSBVc2UgYGRldm1fY2xrX2dldF9vcHRpb25hbF9wcmVwYXJlZGAg
aW5zdGVhZCBvZiBgb2ZfcHJvcGVydHlfcHJlc2VudGAKICAgIHRoZW4gYGRldm1fY2xrX2dldF9w
cmVwYXJlZGAKICAtIERpc2FibGUgYW5kIHVucHJlcGFyZSB0aGUgY2xvY2sgYXQgZW5kIG9mIHBy
b2JlCiAgLSBBZGQgaW8uaCBpbmNsdWRlIGFzIHBlciBMS1AgdGVzdCByZXBvcnQKICAtIFJlbW92
ZWQgYG9mX21hdGNoX3B0cmAgcmVmZXJlbmNlIGluIGBwbGF0Zm9ybV9kcml2ZXJgIHN0cnVjdAog
IC0gQWRkIGBwbV9zbGVlcF9wdHJgIG1hY3JvIGZvciBgcGxhdGZvcm1fZHJpdmVyYCBzdHJ1Y3Qn
cyBgcG1gIGZpZWxkCiAgLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIw
MjUwNjIzLWRkcnBlcmZtLXVwc3RyZWFtLXYxLTAtN2RmZmZmMTY4MDkwQGZvc3Muc3QuY29tCgot
LS0KQ2zDqW1lbnQgTGUgR29mZmljICgxNik6CiAgICAgIGJ1czogZmlyZXdhbGw6IG1vdmUgc3Rt
MzJfZmlyZXdhbGwgaGVhZGVyIGZpbGUgaW4gaW5jbHVkZSBmb2xkZXIKICAgICAgZHQtYmluZGlu
Z3M6IHN0bTMyOiBzdG0zMm1wMjU6IGFkZCBgYWNjZXNzLWNvbnRyb2xsZXItY2VsbGAgcHJvcGVy
dHkKICAgICAgY2xrOiBzdG0zMm1wMjU6IGFkZCBmaXJld2FsbCBncmFudF9hY2Nlc3Mgb3BzCiAg
ICAgIGFybTY0OiBkdHM6IHN0OiBzZXQgcmNjIGFzIGFuIGFjY2Vzcy1jb250cm9sbGVyCiAgICAg
IGR0LWJpbmRpbmdzOiBtZW1vcnk6IGFkZCBqZWRlYyxkZHJbMy00XS1jaGFubmVsIGJpbmRpbmcK
ICAgICAgYXJtNjQ6IGR0czogc3Q6IGFkZCBMUEREUiBjaGFubmVsIHRvIHN0bTMybXAyNTdmLWRr
IGJvYXJkCiAgICAgIGFybTY0OiBkdHM6IHN0OiBhZGQgRERSIGNoYW5uZWwgdG8gc3RtMzJtcDI1
N2YtZXYxIGJvYXJkCiAgICAgIGR0LWJpbmRpbmdzOiBwZXJmOiBzdG0zMjogaW50cm9kdWNlIERE
UlBFUkZNIGR0LWJpbmRpbmdzCiAgICAgIHBlcmY6IHN0bTMyOiBpbnRyb2R1Y2UgRERSUEVSRk0g
ZHJpdmVyCiAgICAgIERvY3VtZW50YXRpb246IHBlcmY6IHN0bTMyOiBhZGQgZGRycGVyZm0gc3Vw
cG9ydAogICAgICBNQUlOVEFJTkVSUzogYWRkIG15c2VsZiBhcyBTVE0zMiBERFIgUE1VIG1haW50
YWluZXIKICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgZGRycGVyZm0gb24gc3RtMzJtcDEzMQog
ICAgICBBUk06IGR0czogc3RtMzI6IGFkZCBkZHJwZXJmbSBvbiBzdG0zMm1wMTUxCiAgICAgIGFy
bTY0OiBkdHM6IHN0OiBhZGQgZGRycGVyZm0gb24gc3RtMzJtcDI1MQogICAgICBhcm02NDogZHRz
OiBzdDogc3VwcG9ydCBkZHJwZXJmbSBvbiBzdG0zMm1wMjU3Zi1kawogICAgICBhcm02NDogZHRz
OiBzdDogc3VwcG9ydCBkZHJwZXJmbSBvbiBzdG0zMm1wMjU3Zi1ldjEKCiBEb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL3BlcmYvaW5kZXgucnN0ICAgICAgICAgICB8ICAgMSArCiBEb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL3BlcmYvc3RtMzItZGRyLXBtdS5yc3QgICB8ICA4NiArKwogLi4uL2Jp
bmRpbmdzL2Nsb2NrL3N0LHN0bTMybXAyNS1yY2MueWFtbCAgICAgICAgICAgfCAgIDcgKwogLi4u
L21lbW9yeS1jb250cm9sbGVycy9kZHIvamVkZWMsZGRyLWNoYW5uZWwueWFtbCAgfCAgNTMgKysK
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvc3Qsc3RtMzItZGRyLXBtdS55YW1sIHwgIDg3
ICsrCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgNyArCiBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kgICAgICAgICAgICAg
ICB8ICAgNyArCiBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUxLmR0c2kgICAgICAgICAg
ICAgICB8ICAgNyArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSAgICAg
ICAgICAgICB8ICAgOCArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWRrLmR0
cyAgICAgICAgICB8ICAxMiArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTdmLWV2
MS5kdHMgICAgICAgICB8ICAxMCArCiBkcml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMyArLQogZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuYyAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvYnVzL3N0bTMyX3JpZnNjLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICstCiBkcml2ZXJzL2Nsay9zdG0zMi9jbGst
c3RtMzJtcDI1LmMgICAgICAgICAgICAgICAgICB8ICA0MCArLQogZHJpdmVycy9wZXJmL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTEgKwogZHJpdmVycy9wZXJmL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9wZXJm
L3N0bTMyX2Rkcl9wbXUuYyAgICAgICAgICAgICAgICAgICAgICAgfCA5MTAgKysrKysrKysrKysr
KysrKysrKysrCiB7ZHJpdmVycyA9PiBpbmNsdWRlL2xpbnV4fS9idXMvc3RtMzJfZmlyZXdhbGwu
aCAgICB8ICAgMAogMTkgZmlsZXMgY2hhbmdlZCwgMTI0OSBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IGQ3YjhmOGUyMDgxM2YwMTc5ZDhlZjUxOTU0MWEzNTI3
ZTc2NjFkM2EKY2hhbmdlLWlkOiAyMDI1MDUyNi1kZHJwZXJmbS11cHN0cmVhbS1iZjA3ZjU3Nzc1
ZGEKCkJlc3QgcmVnYXJkcywKLS0gIApDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2Zm
aWNAZm9zcy5zdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
