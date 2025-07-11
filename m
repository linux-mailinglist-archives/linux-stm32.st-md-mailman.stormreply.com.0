Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 837E8B014F0
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 09:44:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C486C3F931;
	Fri, 11 Jul 2025 07:44:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EF66C3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 07:44:02 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B6UUJ6017493;
 Fri, 11 Jul 2025 09:43:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=uuDTz2OBo60kJWuliEHNDZ
 ybBbmEHsHQuc3BlwbYSOw=; b=gB9CGcZe4fDDd61vM8aB8ttFHRSrOh007m2CrJ
 T+qnmotBinFSUCavbNg+7wQwZbr/BAvBNl6cEnQkSHaEyyIN9tLBsR+KFrFylifS
 K5VlL10ZyZ4C0Lb/FQMCF4o1VN5LUiJZFpXz5joJM1xADElvQUW54wNJ18lw1DWd
 39FssGb/NStr32szR4CLBkjpv1/lryKeGjAX4grcsMdU9zLrV5h2sdvtXj3iU31o
 w2yl1rq3sIjtHgk/1XJEneVm38Xz7pegEm1P+BiOmizo/xxCsqVc7JvfGJQEcux1
 NRFHxNyRM574yUFkFlnzsmR+27jtSPuAoOYThkA/uzeFtafQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47qdm6arjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jul 2025 09:43:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7CE2E40051;
 Fri, 11 Jul 2025 09:42:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3983AE9B67;
 Fri, 11 Jul 2025 09:41:36 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 09:41:37 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 09:41:18 +0200
Message-ID: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB/AcGgC/23PzW6DMAzA8Vepcl6qYMeG9LT3qHYI+Rg5tCDCU
 KeKd19aaSqDHW3p93dyFzmMKWRxOtzFGOaUU38tQ/12EK6z188gky+zAAWkALTs/CC/hjyNwV4
 kAwTyttLWRFHIMIaYbs/c+aPMXcpTP34/63P12P6G6G9orqSSxittHBOisu+xz/mYp6PrL+KRm
 uHFCdSGQ+GEkdumpRhds+e45rjhWHjr2dnKGM38z3W95s2G68LrYFq0HhSy33N6ca6216lwjp6
 j8o6gdnvOK757PBeOTU1YAg2azd+XZfkBhJHY++UBAAA=
X-Change-ID: 20250224-hdp-upstream-622e5da14a9f
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.252.16.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_02,2025-07-09_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 0/8] Introduce HDP support for STM32MP
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

VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyB0aGUgSGFyZHdhcmUgRGVidWcgUG9ydCAoSERQ
KSBzdXBwb3J0IGZvcgpTVE0zMk1QIHBsYXRmb3Jtcy4KCkl0IGluY2x1ZGVzIHVwZGF0ZXMgdG8g
dGhlIG1taW8gZ3BpbyBkcml2ZXIsIHRoZSBhZGRpdGlvbiBvZiBkZXZpY2UgdHJlZQpiaW5kaW5n
cywgdGhlIEhEUCBkcml2ZXIsIGFuZCB1cGRhdGVzIHRvIHRoZSBkZXZpY2UgdHJlZSBmaWxlcyBm
b3IKU1RNMzJNUDEzLCBTVE0zMk1QMTUsCmFuZCBTVE0zMk1QMjUgU29Dcy4KVGhlIHNlcmllcyBh
bHNvIHVwZGF0ZXMgdGhlIE1BSU5UQUlORVJTIGZpbGUgdG8gaW5jbHVkZSBteXNlbGYgYXMgdGhl
Cm1haW50YWluZXIgZm9yIHRoZSBTVE0zMiBIRFAgZHJpdmVyIGFuZCBhZGRzIHRoZSBuZWNlc3Nh
cnkKcGlubXV4IGNvbmZpZ3VyYXRpb25zIGZvciBIRFAgcGlucyBvbiBTVE0zMk1QMTU3Qy1ESzIg
YXMgZXhhbXBsZS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5s
ZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjc6Ci0gRHVlIHRvIHJlb3JnYW5p
c2F0aW9uLCBteSBjb250cmFjdCB3aXRoIFNUIGVuZHMgYXQgdGhlIGVuZCBvZiB0aGlzIG1vbnRo
CiAgYW5kIEkgd2lsbCBubyBsb25nZXIgaGF2ZSBhY2Nlc3MgdG8gdGhpcyBtYWlsYm94LgogIFRo
ZXJlZm9yZSwgSSB3aWxsIGJlIGF2YWlsYWJsZSBmb3IgYW55IG1pc3Npb24gcmVsYXRlZCB0byBl
bWJlZGRlZCBhbmQKICBrZXJuZWwgbGludXguCiAgQ2hhbmdlIGVtYWlsIGFkZHJlc3MgaW4gTUFJ
TlRBSU5FUlMgZmlsZSBmb3IgU1RNMzIgSERQIGRyaXZlcgotIExpbmsgdG8gdjY6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyNTA2MjMtaGRwLXVwc3RyZWFtLXY2LTAtMzg3NTM2ZjA4Mzk4
QGZvc3Muc3QuY29tCgpDaGFuZ2VzIGluIHY2OgotIEFkZCBLcnp5c3p0b2YgS296bG93c2tpJ3Mg
J1Jldmlld2QtYnknIHRyYWlsZXIgb24gYmluZGluZ3MuCi0gUmVtb3ZlIGdwaW8gbW1pbyBwYXRj
aCBhcyB0YWtlbiBieSBCYXJ0b3N6IEdvbGFzemV3c2tpOgogIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8xNzUwMzE3MDAyMzUuODE1NC4xMTA0Mjk1NjAwMjEzNzA4MjIyNC5iNC10eUBsaW5h
cm8ub3JnLwotIExpbmsgdG8gdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA2MTMt
aGRwLXVwc3RyZWFtLXY1LTAtNmZkNmYwZGM1MjdjQGZvc3Muc3QuY29tCgpDaGFuZ2VzIGluIHY1
OgotIChCZXR0ZXIpIENoYW5nZSB0aGUgYmluZGluZ3MgZmlsZSBuYW1lOgogICdzL3N0LHN0bTMy
LXBpbmN0cmwtaGRwLnlhbWwvc3Qsc3RtMzItaGRwLnlhbWwvZycKLSBSZW1vdmUgS3J6eXN6dG9m
IEtvemxvd3NraSdzICdSZXZpZXdlZC1ieScgdHJhaWxlciBvbiBiaW5kaW5ncy4KLSBBZGQgTGlu
dXMgV2FsbGVpaidzICdSZXZpZXdlZC1ieScgdHJhaWxlcnMuCi0gUmVmaW5lIFNvQyBkdHNpIHBh
dGNoJ3MgY29tbWl0IG1lc3NhZ2UgdG8gZXhwbGFpbiB0aGUgbmVlZCBvZiBrZWVwaW5nCiAgdGhl
IEhEUCBub2RlIGRpc2FibGVkLgotIExpbmsgdG8gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNTA1MjgtaGRwLXVwc3RyZWFtLXY0LTAtN2U5YjNhZDIwMzZkQGZvc3Muc3QuY29tCgpD
aGFuZ2VzIGluIHY0OgotICdzL0FkZC9hZGQvZycgaW4gTUFJTlRBSU5FUlMgY29tbWl0IG1lc3Nh
Z2UuCi0gRml4IHRoZSAod3JvbmcpIHN0YXR1cyB1cGRhdGUgZm9yIHRoZSB0aGVybWFsIG5vZGUg
aW4gc3RtMzJtcDEzMS5kdHNpCiAgZmlsZS4KLSBEbyBub3QgZW5hYmxlIEhEUCBieSBkZWZhdWx0
IGR1cmluZyBjb21waWxlIHRlc3RpbmcuCi0gQ2hhbmdlIHRoZSBiaW5kaW5ncyBmaWxlIG5hbWU6
CiAgJ3Mvc3Qsc3RtMzItcGluY3RybC1oZHAueWFtbC9zdCxzdG0zMi1oZHAueWFtbC9nJwotIEFk
ZCBLcnp5c3p0b2YgS296bG93c2tpJ3MgJ1Jldmlld2QtYnknIHRyYWlsZXIgb24gYmluZGluZ3Mu
Ci0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDUyMy1oZHAtdXBz
dHJlYW0tdjMtMC1iZDZjYTE5OTQ2NmFAZm9zcy5zdC5jb20KCkNoYW5nZXMgaW4gdjM6Ci0gVXNl
IGBiZ3Bpb19pbml0KClgIGZ1bmN0aW9uOgogICAgLSBBZGQgYWRkIHBhdGNoIHRvIGNyZWF0ZSB0
aGUgYEJHUElPRl9OT19JTlBVVGAgZmxhZyBuZWVkZWQgZm9yIHRoZQogICAgIGBiZ3Bpb19zZXR1
cF9kaXJlY3Rpb24oKWAgdXNlZCBpbiBgYmdwaW9faW5pdCgpYAogICAgLSBSZW1vdmUgYHN0bTMy
X2hkcF9ncGlvX2dldGAgYW5kIGBzdG0zMl9oZHBfZ3Bpb19zZXRgCi0gVXNlIGBzdGF0aWNgIHBt
IG9wcwotIFVwZGF0ZSBiaW5kaW5nczoKICAgIC0gYWRkIHBhdHRlcm4gaW5zdHJ1Y3Rpb24gZm9y
IHBpbiB2YWx1ZXMKICAgIC0gcmVtb3ZlIGZ1bmN0aW9uJ3MgbWF4SXRlbXMgdG8gdXNlIGBmdW5j
dGlvbjogdHJ1ZWAKICAgIC0gZml4IHRoZSBjb21wYXRpYmxlIGluIHRoZSBleGVtcGxlcwotIExp
bmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA1MjAtaGRwLXVwc3RyZWFt
LXYyLTAtNTNmNmI4YjVmZmM4QGZvc3Muc3QuY29tCgpDaGFuZ2VzIGluIHYyOgotIFJlbW92ZSBi
aW5kaW5ncyBoZWFkZXIgZmlsZXMgd2l0aCBmdW5jdGlvbiBuYW1lIGFzICNkZWZpbmUKLSBBZGQg
bWF0Y2hfZGF0YSB3aXRoIGZ1bmN0aW9uIG5hbWUgZm9yIHRocmVlIGNvbXBhdGlibGU6CiAgInN0
LHN0bTMybXAxMzEtaGRwIiwgInN0LHN0bTMybXAxNTEtaGRwIiBhbmQgInN0LHN0bTMybXAyNTEt
aGRwIi4KLSBSZXdvcmsgYSBiaXQgdGhlIGRyaXZlciB0byB1c2UgbWF0Y2hfZGF0YS4KLSBSZW1v
dmUgdGhlIHVzZSBvZiBgZGV2X2Vycl9wcm9iZShgIGluIHRoZSByZXN1bWUgb3BzLgotIFJlbW92
ZSBgTU9EVUxFX0FMSUFTKGAuCi0gUmVtb3ZlIHRoZSB2ZXJ0aWNhbCBiYXIgaW4gYmluZGluZ3Mg
ZGVzY3JpcHRpb24gcGFyYWdyYXBoLgotIEZpeCBhbiBlcnJvciBpbiB0aGUgYHBpbmN0cmwtMGAg
cGFyYW1ldGVyIG9mIHRoZSBiaW5kaW5nIGV4YW1wbGUsIGl0CiAgd2FzIHJlZmVyaW5nIGEgbm9k
ZSB0aGF0IHdhc24ndCBleGlzdGluZy4KLSBVc2UgdXBwZXJjYXNlIHBpbiBuYW1lcy4KLSBMaW5r
IHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMjI1LWhkcC11cHN0cmVhbS12
MS0wLTlkMDQ5YzY1MzMwYUBmb3NzLnN0LmNvbQoKLS0tCkNsw6ltZW50IExlIEdvZmZpYyAoOCk6
CiAgICAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBzdG0zMjogSW50cm9kdWNlIEhEUAogICAgICBw
aW5jdHJsOiBzdG0zMjogSW50cm9kdWNlIEhEUCBkcml2ZXIKICAgICAgTUFJTlRBSU5FUlM6IGFk
ZCBDbMOpbWVudCBMZSBHb2ZmaWMgYXMgU1RNMzIgSERQIG1haW50YWluZXIKICAgICAgQVJNOiBk
dHM6IHN0bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTMKICAg
ICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0z
Mm1wMTUKICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAoSERQ
KSBvbiBzdG0zMm1wMjUKICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgYWx0ZXJuYXRlIHBpbm11
eCBmb3IgSERQIHBpbiBhbmQgYWRkIEhEUCBwaW5jdHJsIG5vZGUKICAgICAgQVJNOiBkdHM6IHN0
bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTU3Yy1kazIgYm9h
cmQKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLWhkcC55YW1sICB8
IDE4NyArKysrKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICA2ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzEuZHRzaSAgICAg
ICAgICAgICAgIHwgICA3ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNS1waW5jdHJs
LmR0c2kgICAgICAgIHwgIDI1ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTEuZHRz
aSAgICAgICAgICAgICAgIHwgICA3ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdj
LWRrMi5kdHMgICAgICAgICAgIHwgICA2ICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJt
cDI1MS5kdHNpICAgICAgICAgICAgIHwgICA3ICsKIGRyaXZlcnMvcGluY3RybC9zdG0zMi9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgIHwgIDE0ICsKIGRyaXZlcnMvcGluY3RybC9zdG0zMi9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvcGluY3RybC9zdG0z
Mi9waW5jdHJsLXN0bTMyLWhkcC5jICAgICAgICAgIHwgNzIwICsrKysrKysrKysrKysrKysrKysr
KwogMTAgZmlsZXMgY2hhbmdlZCwgOTgwIGluc2VydGlvbnMoKykKLS0tCmJhc2UtY29tbWl0OiAz
MWI2ZDI1YTI1YWMzZmU0ZWU2MDkyZjJiZjA0YTgxNmU0YjViNjRhCmNoYW5nZS1pZDogMjAyNTAy
MjQtaGRwLXVwc3RyZWFtLTYyMmU1ZGExNGE5ZgoKQmVzdCByZWdhcmRzLAotLSAgCkNsw6ltZW50
IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
