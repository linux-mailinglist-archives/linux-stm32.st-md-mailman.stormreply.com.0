Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 379BDAC22BF
	for <lists+linux-stm32@lfdr.de>; Fri, 23 May 2025 14:40:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2028C7A82F;
	Fri, 23 May 2025 12:40:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA846C7A82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 12:40:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBKc2I029978;
 Fri, 23 May 2025 14:40:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=2YyhQzykqr2IukkjXY4a8d
 iTP0eWbO99O5z3m7RWB6U=; b=1LipR1xBEOhYzBdlcKyKjqBAaALvXVHak154yN
 a3rM8dGt+hVaaSYYundcEOORPxBDe1v5dGHpyQgG8kk5NF9mmGmBUd0HAhyhh/Sh
 s62yDWkrkQOENh4sme4SvcxhKQvked7n7fwOhqO4PMvC/mAVW1EJHHiOThvTo1il
 6suVWNjUG4y0WJHXhf6z/8SuJD+1j9/JI4jssRGyI+GfuCTxWVMfwlQw7B4w7sED
 w2mTF4rn4hf6CH2LOxHHEl7eYrkELMMckQHFyLPvX85u7h+IkV2rQlcZ+di8FAI3
 Cjwz3mPAAQ/BSnly9knWdIbBkIR6Gcg4okzYJ0fAOi/F9h1A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwfcdxje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 14:40:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E53224002D;
 Fri, 23 May 2025 14:39:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBFDDA0D901;
 Fri, 23 May 2025 14:38:23 +0200 (CEST)
Received: from localhost (10.48.81.67) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 14:38:23 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 23 May 2025 14:38:12 +0200
Message-ID: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADRsMGgC/13MSw6CMBSF4a2Yji0pt1wCjtyHcVD6kA6gpBcbD
 WHvFhJjcHhO8n8LIxu9JXY5LSza5MmHMQ95PjHdq/FhuTd5MxCAAqDivZn4c6I5WjXwGsCiUWW
 lWsdyMkXr/Gvnbve8e09ziO9dT+X2fiE8QqnkgrdGVK2uUUqhri4QFTQXOgxsoxL8cgTxl0POU
 bq6azp0TjfHfF3XD3UnYD3pAAAA
X-Change-ID: 20250224-hdp-upstream-622e5da14a9f
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
X-Mailer: b4 0.15-dev-6f78e
X-Originating-IP: [10.48.81.67]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/9] Introduce HDP support for STM32MP
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
ZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gVXNlIGBiZ3Bpb19pbml0
KClgIGZ1bmN0aW9uOgogICAgLSBBZGQgYWRkIHBhdGNoIHRvIGNyZWF0ZSB0aGUgYEJHUElPRl9O
T19JTlBVVGAgZmxhZyBuZWVkZWQgZm9yIHRoZQogICAgIGBiZ3Bpb19zZXR1cF9kaXJlY3Rpb24o
KWAgdXNlZCBpbiBgYmdwaW9faW5pdCgpYAogICAgLSBSZW1vdmUgYHN0bTMyX2hkcF9ncGlvX2dl
dGAgYW5kIGBzdG0zMl9oZHBfZ3Bpb19zZXRgCi0gVXNlIGBzdGF0aWNgIHBtIG9wcwotIFVwZGF0
ZSBiaW5kaW5nczoKICAgIC0gYWRkIHBhdHRlcm4gaW5zdHJ1Y3Rpb24gZm9yIHBpbiB2YWx1ZXMK
ICAgIC0gcmVtb3ZlIGZ1bmN0aW9uJ3MgbWF4SXRlbXMgdG8gdXNlIGBmdW5jdGlvbjogdHJ1ZWAK
ICAgIC0gZml4IHRoZSBjb21wYXRpYmxlIGluIHRoZSBleGVtcGxlcwotIExpbmsgdG8gdjI6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA1MjAtaGRwLXVwc3RyZWFtLXYyLTAtNTNmNmI4
YjVmZmM4QGZvc3Muc3QuY29tCgpDaGFuZ2VzIGluIHYyOgotIFJlbW92ZSBiaW5kaW5ncyBoZWFk
ZXIgZmlsZXMgd2l0aCBmdW5jdGlvbiBuYW1lIGFzICNkZWZpbmUKLSBBZGQgbWF0Y2hfZGF0YSB3
aXRoIGZ1bmN0aW9uIG5hbWUgZm9yIHRocmVlIGNvbXBhdGlibGU6CiAgInN0LHN0bTMybXAxMzEt
aGRwIiwgInN0LHN0bTMybXAxNTEtaGRwIiBhbmQgInN0LHN0bTMybXAyNTEtaGRwIi4KLSBSZXdv
cmsgYSBiaXQgdGhlIGRyaXZlciB0byB1c2UgbWF0Y2hfZGF0YS4KLSBSZW1vdmUgdGhlIHVzZSBv
ZiBgZGV2X2Vycl9wcm9iZShgIGluIHRoZSByZXN1bWUgb3BzLgotIFJlbW92ZSBgTU9EVUxFX0FM
SUFTKGAuCi0gUmVtb3ZlIHRoZSB2ZXJ0aWNhbCBiYXIgaW4gYmluZGluZ3MgZGVzY3JpcHRpb24g
cGFyYWdyYXBoLgotIEZpeCBhbiBlcnJvciBpbiB0aGUgYHBpbmN0cmwtMGAgcGFyYW1ldGVyIG9m
IHRoZSBiaW5kaW5nIGV4YW1wbGUsIGl0CiAgd2FzIHJlZmVyaW5nIGEgbm9kZSB0aGF0IHdhc24n
dCBleGlzdGluZy4KLSBVc2UgdXBwZXJjYXNlIHBpbiBuYW1lcy4KLSBMaW5rIHRvIHYxOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMjI1LWhkcC11cHN0cmVhbS12MS0wLTlkMDQ5YzY1
MzMwYUBmb3NzLnN0LmNvbQoKLS0tCkNsw6ltZW50IExlIEdvZmZpYyAoOSk6CiAgICAgIGdwaW86
IG1taW86IGFkZCBCR1BJT0ZfTk9fSU5QVVQgZmxhZyBmb3IgR1BPIGdwaW9jaGlwCiAgICAgIGR0
LWJpbmRpbmdzOiBwaW5jdHJsOiBzdG0zMjogSW50cm9kdWNlIEhEUAogICAgICBwaW5jdHJsOiBz
dG0zMjogSW50cm9kdWNlIEhEUCBkcml2ZXIKICAgICAgTUFJTlRBSU5FUlM6IEFkZCBDbMOpbWVu
dCBMZSBHb2ZmaWMgYXMgU1RNMzIgSERQIG1haW50YWluZXIKICAgICAgQVJNOiBkdHM6IHN0bTMy
OiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTMKICAgICAgQVJNOiBk
dHM6IHN0bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTUKICAg
ICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0z
Mm1wMjUKICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3IgSERQ
IHBpbiBhbmQgYWRkIEhEUCBwaW5jdHJsIG5vZGUKICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQg
SGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMTU3Yy1kazIgYm9hcmQKCiAuLi4v
YmluZGluZ3MvcGluY3RybC9zdCxzdG0zMi1waW5jdHJsLWhkcC55YW1sICAgICB8IDE4NyArKysr
KysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICA2ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzEuZHRzaSAgICAgICAgICAgICAg
IHwgICA2ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNS1waW5jdHJsLmR0c2kgICAg
ICAgIHwgIDI1ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTEuZHRzaSAgICAgICAg
ICAgICAgIHwgICA3ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWRrMi5kdHMg
ICAgICAgICAgIHwgICA2ICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNp
ICAgICAgICAgICAgIHwgICA3ICsKIGRyaXZlcnMvZ3Bpby9ncGlvLW1taW8uYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDExICstCiBkcml2ZXJzL3BpbmN0cmwvc3RtMzIvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgICB8ICAxNCArCiBkcml2ZXJzL3BpbmN0cmwvc3RtMzIvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGlu
Y3RybC1zdG0zMi1oZHAuYyAgICAgICAgICB8IDcyMCArKysrKysrKysrKysrKysrKysrKysKIGlu
Y2x1ZGUvbGludXgvZ3Bpby9kcml2ZXIuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsK
IDEyIGZpbGVzIGNoYW5nZWQsIDk5MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCi0tLQpi
YXNlLWNvbW1pdDogYTA4YjJiMzQyMzllNjNiZDgzOTA3OGRlOTg5MTFkMzY1M2NkYWI4MwpjaGFu
Z2UtaWQ6IDIwMjUwMjI0LWhkcC11cHN0cmVhbS02MjJlNWRhMTRhOWYKCkJlc3QgcmVnYXJkcywK
LS0gCkNsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
