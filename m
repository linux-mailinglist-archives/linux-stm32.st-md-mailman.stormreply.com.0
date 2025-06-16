Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FD1ADABC0
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 11:23:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32394C36B2C;
	Mon, 16 Jun 2025 09:23:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13B23C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 09:23:52 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G93VaH021379;
 Mon, 16 Jun 2025 11:23:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 PWhNXOfPjDZW7k+9cbgV4wS145BPewRuTiI1JHa99ho=; b=8Hn71vglaGZGk6T8
 3KJTs4aREHjVYKpSz8YFfnkDPfunAuFkrG07QqAgPxiOJLABtTHY+d2Qyqy+p3Lw
 /FYWBdURdT/6/QfIQzqtkgGuztLxZLqIWgUsjeIEgMonBE/3hjrnErAUsp74Pnc/
 Z8p1DaQMyMq1tERMhePfiB3h6SvqbcOWvEMoqSnXqomQ0sFAXVRCxV9DYgks6RCT
 Ry9zf8fzbI5NbAYepn4X11t6qc+ljSH+DXl8t+xwsem0eeTeQlkIWjijTQs59VrS
 u1W5UjOCW3YsxuLpV/kl3o4U/uQ/RhEnaEYbTnFniQKo6qaE4Y3vfMpx/V9EMou6
 hgJLZw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 478xgmg80x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 11:23:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 39FBE40057;
 Mon, 16 Jun 2025 11:22:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 611AFAA6ECA;
 Mon, 16 Jun 2025 11:21:09 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 11:21:09 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 11:21:04 +0200
MIME-Version: 1.0
Message-ID: <20250616-spi-upstream-v1-3-7e8593f3f75d@foss.st.com>
References: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
In-Reply-To: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Valentin Caron <valentin.caron@foss.st.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Erwan Leray <erwan.leray@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.14.42]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/6] dt-bindings: spi: stm32: update bindings
 with SPI Rx DMA-MDMA chaining
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

QWRkIE1ETUEgY2hhbm5lbCwgYW5kIG5ldyBzcmFtIHByb3BlcnR5IHdoaWNoIGFyZSBtYW5kYXRv
cnkgdG8gZW5hYmxlClNQSSBSeCBETUEtTURNQSBjaGFpbmluZy4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCiAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3Qsc3RtMzItc3BpLnlhbWwgICAgICB8IDQ4ICsrKysr
KysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zcGkvc3Qsc3RtMzItc3BpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc3BpL3N0LHN0bTMyLXNwaS55YW1sCmluZGV4IDc2ZTQzYzBjZTM2Yy4uY2E4ODBhMjI2YWZh
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3N0LHN0
bTMyLXNwaS55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkv
c3Qsc3RtMzItc3BpLnlhbWwKQEAgLTE4LDYgKzE4LDM4IEBAIG1haW50YWluZXJzOgogCiBhbGxP
ZjoKICAgLSAkcmVmOiBzcGktY29udHJvbGxlci55YW1sIworICAtIGlmOgorICAgICAgcHJvcGVy
dGllczoKKyAgICAgICAgY29tcGF0aWJsZToKKyAgICAgICAgICBjb250YWluczoKKyAgICAgICAg
ICAgIGNvbnN0OiBzdCxzdG0zMmY0LXNwaQorCisgICAgdGhlbjoKKyAgICAgIHByb3BlcnRpZXM6
CisgICAgICAgIHN0LHNwaS1taWRpLW5zOiBmYWxzZQorICAgICAgICBzcmFtOiBmYWxzZQorICAg
ICAgICBkbWFzOgorICAgICAgICAgIG1heEl0ZW1zOiAyCisgICAgICAgIGRtYS1uYW1lczoKKyAg
ICAgICAgICBpdGVtczoKKyAgICAgICAgICAgIC0gY29uc3Q6IHJ4CisgICAgICAgICAgICAtIGNv
bnN0OiB0eAorCisgIC0gaWY6CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICBjb21wYXRpYmxl
OgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHN0LHN0bTMybXAyNS1z
cGkKKworICAgIHRoZW46CisgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICBzcmFtOiBmYWxzZQor
ICAgICAgICBkbWFzOgorICAgICAgICAgIG1heEl0ZW1zOiAyCisgICAgICAgIGRtYS1uYW1lczoK
KyAgICAgICAgICBpdGVtczoKKyAgICAgICAgICAgIC0gY29uc3Q6IHJ4CisgICAgICAgICAgICAt
IGNvbnN0OiB0eAogCiBwcm9wZXJ0aWVzOgogICBjb21wYXRpYmxlOgpAQCAtNDEsMTYgKzczLDI4
IEBAIHByb3BlcnRpZXM6CiAKICAgZG1hczoKICAgICBkZXNjcmlwdGlvbjogfAotICAgICAgRE1B
IHNwZWNpZmllcnMgZm9yIHR4IGFuZCByeCBkbWEuIERNQSBmaWZvIG1vZGUgbXVzdCBiZSB1c2Vk
LiBTZWUKLSAgICAgIHRoZSBTVE0zMiBETUEgY29udHJvbGxlcnMgYmluZGluZ3MgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9zdG0zMi8qLnlhbWwuCisgICAgICBETUEgc3Bl
Y2lmaWVycyBmb3IgdHggYW5kIHJ4IGNoYW5uZWxzLiBETUEgZmlmbyBtb2RlIG11c3QgYmUgdXNl
ZC4gU2VlCisgICAgICB0aGUgU1RNMzIgRE1BIGJpbmRpbmdzIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kbWEvc3RtMzIvc3QsKmRtYS55YW1sCisgICAgbWluSXRlbXM6IDIKICAg
ICBpdGVtczoKICAgICAgIC0gZGVzY3JpcHRpb246IHJ4IERNQSBjaGFubmVsCiAgICAgICAtIGRl
c2NyaXB0aW9uOiB0eCBETUEgY2hhbm5lbAorICAgICAgLSBkZXNjcmlwdGlvbjogcnhtMm0gTURN
QSBjaGFubmVsCiAKICAgZG1hLW5hbWVzOgorICAgIG1pbkl0ZW1zOiAyCiAgICAgaXRlbXM6CiAg
ICAgICAtIGNvbnN0OiByeAogICAgICAgLSBjb25zdDogdHgKKyAgICAgIC0gY29uc3Q6IHJ4bTJt
CisKKyAgc3JhbToKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9w
aGFuZGxlCisgICAgZGVzY3JpcHRpb246IHwKKyAgICAgIFBoYW5kbGVzIHRvIGEgcmVzZXJ2ZWQg
U1JBTSByZWdpb24gd2hpY2ggaXMgdXNlZCBhcyB0ZW1wb3JhcnkKKyAgICAgIHN0b3JhZ2UgbWVt
b3J5IGJldHdlZW4gRE1BIGFuZCBNRE1BIGVuZ2luZXMuCisgICAgICBUaGUgcmVnaW9uIHNob3Vs
ZCBiZSBkZWZpbmVkIGFzIGNoaWxkIG5vZGUgb2YgdGhlIEFIQiBTUkFNIG5vZGUKKyAgICAgIGFz
IHBlciB0aGUgZ2VuZXJpYyBiaW5kaW5ncyBpbiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc3JhbS9zcmFtLnlhbWwKIAogICBhY2Nlc3MtY29udHJvbGxlcnM6CiAgICAgbWluSXRl
bXM6IDEKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
