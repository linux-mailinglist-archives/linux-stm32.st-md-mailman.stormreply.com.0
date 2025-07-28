Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 930DDB13E90
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 17:35:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5025BC36B2E;
	Mon, 28 Jul 2025 15:35:16 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F186CC36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 15:35:15 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SDr2Gx027841;
 Mon, 28 Jul 2025 17:35:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 W7lja2ibWXfiVo4eDJLx4tgeIggbs4JL9GjrFt29DoI=; b=gG0Y2yOT1jDlR+cK
 EGtjFyZ3sRVlssE1wceff2KDnwFejXfgN1RJU7hTml/0QXMePRBp/Gj/KJwU2Gzg
 9wFRVM6ZZSvyJuc04hjGkb7/CLvrxCjCjm96kXzIqcDKhpzz9qaYqNgcugz6lI7g
 wtTKydRYJNH85eSTJ8kcRCqvmH/dvaAPeUqkrTCqrGv5jmFJ1dSLhx0XBD5k1l0L
 9VO6JVnC6edA8+RBB2+ew1riYBW7zsWQwppeqxEJN+iHIYmxhHEKKur7RrfOFbO/
 4ncAU4YmrBX8ZbpeXlUnKR7uRiNQL14ZHT4QCWJErwF6+klO3KGRQ1B4Hkhm4Chu
 iNdcVA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4859yndytr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jul 2025 17:35:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 18CAA4004B;
 Mon, 28 Jul 2025 17:33:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1187D78C90A;
 Mon, 28 Jul 2025 17:30:04 +0200 (CEST)
Received: from localhost (10.252.23.100) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 17:30:03 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 28 Jul 2025 17:29:45 +0200
MIME-Version: 1.0
Message-ID: <20250728-ddrperfm-upstream-v5-14-03f1be8ad396@foss.st.com>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
In-Reply-To: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez
 <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk@kernel.org>, Le
 Goffic <legoffic.clement@gmail.com>, Julius Werner <jwerner@chromium.org>
X-Mailer: b4 0.15-dev-8018a
X-Originating-IP: [10.252.23.100]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 14/20] Documentation: perf: stm32: add
	ddrperfm support
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

VGhlIEREUlBFUkZNIGlzIHRoZSBERFIgUGVyZm9ybWFuY2UgTW9uaXRvciBlbWJlZGRlZCBpbiBT
VE0zMk1QVSBTb0MuCgpUaGlzIGRvY3VtZW50YXRpb24gaW50cm9kdWNlcyB0aGUgRERSUEVSRk0s
IHRoZSBzdG0zMi1kZHItcG11IGRyaXZlcgpzdXBwb3J0aW5nIGl0IGFuZCBob3cgdG8gdXNlIGl0
IHdpdGggdGhlIHBlcmYgdG9vbC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8
Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1
aWRlL3BlcmYvaW5kZXgucnN0ICAgICAgICAgfCAgMSArCiBEb2N1bWVudGF0aW9uL2FkbWluLWd1
aWRlL3BlcmYvc3RtMzItZGRyLXBtdS5yc3QgfCA4NiArKysrKysrKysrKysrKysrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgODcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vYWRtaW4tZ3VpZGUvcGVyZi9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1
aWRlL3BlcmYvaW5kZXgucnN0CmluZGV4IDA3MmI1MTAzODVjNC4uMzNhZWRjNGVlNWMzIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3BlcmYvaW5kZXgucnN0CisrKyBiL0Rv
Y3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvcGVyZi9pbmRleC5yc3QKQEAgLTI5LDMgKzI5LDQgQEAg
UGVyZm9ybWFuY2UgbW9uaXRvciBzdXBwb3J0CiAgICBjeGwKICAgIGFtcGVyZV9jc3BtdQogICAg
bXJ2bC1wZW0tcG11CisgICBzdG0zMi1kZHItcG11CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL3BlcmYvc3RtMzItZGRyLXBtdS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL3BlcmYvc3RtMzItZGRyLXBtdS5yc3QKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMDAwLi41YjAyYmY0NGRkN2EKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL3BlcmYvc3RtMzItZGRyLXBtdS5yc3QKQEAgLTAsMCArMSw4NiBAQAor
Li4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKworPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQorU1RNMzIgRERSIFBlcmZvcm1hbmNlIE1vbml0b3IgKERE
UlBFUkZNKQorPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorCitUaGUg
RERSUEVSRk0gaXMgdGhlIEREUiBQZXJmb3JtYW5jZSBNb25pdG9yIGVtYmVkZGVkIGluIFNUTTMy
TVBVIFNvQy4KK1RoZSBERFIgY29udHJvbGxlciBwcm92aWRlcyBldmVudHMgdG8gRERSUEVSRk0s
IG9uY2Ugc2VsZWN0ZWQgdGhleSBhcmUgY291bnRlZCBpbiB0aGUgRERSUEVSRk0KK3BlcmlwaGVy
YWwuCisKK0luIE1QMSBmYW1pbHksIHRoZSBERFJQRVJGTSBpcyBhYmxlIHRvIGNvdW50IDQgZGlm
ZmVyZW50IGV2ZW50cyBhdCB0aGUgc2FtZSB0aW1lLgorSG93ZXZlciwgdGhlIDQgZXZlbnRzIG11
c3QgYmVsb25nIHRvIHRoZSBzYW1lIHNldC4KK09uZSBoYXJkd2FyZSBjb3VudGVyIGlzIGRlZGlj
YXRlZCB0byB0aGUgdGltZSBjb3VudGVyLCBgdGltZV9jbnRgLgorCitJbiBNUDIgZmFtaWx5LCB0
aGUgRERSUEVSRk0gaXMgYWJsZSB0byBzZWxlY3QgYmV0d2VlbiA0NCBkaWZmZXJlbnQgRERSIGV2
ZW50cy4KK0FzIGZvciBNUDEsIHRoZXJlIGlzIGEgZGVkaWNhdGVkIGhhcmR3YXJlIGNvdW50ZXIg
Zm9yIHRoZSB0aW1lLgorSXQgaXMgaW5jcmVtZW50ZWQgZXZlcnkgNCBERFIgY2xvY2sgY3ljbGVz
LgorQWxsIHRoZSBvdGhlciBjb3VudGVycyBjYW4gYmUgZnJlZWx5IGFsbG9jYXRlZCB0byBjb3Vu
dCBhbnkgb3RoZXIgRERSIGV2ZW50LgorCitUaGUgc3RtMzItZGRyLXBtdSBkcml2ZXIgcmVsaWVz
IG9uIHRoZSBwZXJmIFBNVSBmcmFtZXdvcmsgdG8gZXhwb3NlIHRoZSBjb3VudGVycyB2aWEgc3lz
ZnM6CisKK09uIE1QMToKKworICAgIC4uIGNvZGUtYmxvY2s6OiBiYXNoCisKKyAgICAgICAgJCBs
cyAvc3lzL2J1cy9ldmVudF9zb3VyY2UvZGV2aWNlcy9zdG0zMl9kZHJfcG11L2V2ZW50cy8KKyAg
ICAgICAgY2FjdGl2ZV9kZHJjICAgICAgICAgICAgICAgICBwZXJmX2xwcl9yZXFfd2l0aF9ub19j
cmVkaXQgIHBlcmZfb3BfaXNfd3IKKyAgICAgICAgY3RsX2lkbGUgICAgICAgICAgICAgICAgICAg
ICBwZXJmX2xwcl94YWN0X3doZW5fY3JpdGljYWwgIHBlcmZfc2VsZnJlc2hfbW9kZQorICAgICAg
ICBkZmlfbHBfcmVxICAgICAgICAgICAgICAgICAgIHBlcmZfb3BfaXNfYWN0aXZhdGUgICAgICAg
ICAgcGVyZl93cl94YWN0X3doZW5fY3JpdGljYWwKKyAgICAgICAgZGZpX2xwX3JlcV9jcHkgICAg
ICAgICAgICAgICBwZXJmX29wX2lzX2VudGVyX3Bvd2VyZG93biAgIHRpbWVfY250CisgICAgICAg
IHBlcmZfaHByX3JlcV93aXRoX25vX2NyZWRpdCAgcGVyZl9vcF9pc19yZAorICAgICAgICBwZXJm
X2hwcl94YWN0X3doZW5fY3JpdGljYWwgIHBlcmZfb3BfaXNfcmVmcmVzaAorCitPbiBNUDI6CisK
KyAgICAuLiBjb2RlLWJsb2NrOjogYmFzaAorCisgICAgICAgICQgbHMgL3N5cy9idXMvZXZlbnRf
c291cmNlL2RldmljZXMvc3RtMzJfZGRyX3BtdS9ldmVudHMvCisgICAgICAgIGRmaV9pc19hY3Qg
ICAgICAgcGVyZl9ocHJfcmVxX3dpdGhfbm9jcmVkaXQgICBwZXJmX29wX2lzX3NwZWNfcmVmCisg
ICAgICAgIGRmaV9pc19tcGMgICAgICAgcGVyZl9ocHJfeGFjdF93aGVuX2NyaXRpY2FsICBwZXJm
X29wX2lzX3dyCisgICAgICAgIGRmaV9pc19tcnIgICAgICAgcGVyZl9scHJfcmVxX3dpdGhfbm9j
cmVkaXQgICBwZXJmX29wX2lzX3pxY2FsCisgICAgICAgIGRmaV9pc19tcncgICAgICAgcGVyZl9s
cHJfeGFjdF93aGVuX2NyaXRpY2FsICBwZXJmX3JhbmsKKyAgICAgICAgZGZpX2lzX213ciAgICAg
ICBwZXJmX29wX2lzX2FjdCAgICAgICAgICAgICAgIHBlcmZfcmF3X2hhemFyZAorICAgICAgICBk
ZmlfaXNfbXdyYSAgICAgIHBlcmZfb3BfaXNfY3JpdF9yZWYgICAgICAgICAgcGVyZl9yZHdyX3Ry
YW5zaXRpb25zCisgICAgICAgIGRmaV9pc19wcmVhYiAgICAgcGVyZl9vcF9pc19lbnRlcl9wb3dk
biAgICAgICBwZXJmX3JlYWRfYnlwYXNzCisgICAgICAgIGRmaV9pc19wcmVwYiAgICAgcGVyZl9v
cF9pc19lbnRlcl9zZWxmcmVmICAgICBwZXJmX3dhcl9oYXphcmQKKyAgICAgICAgZGZpX2lzX3Jk
ICAgICAgICBwZXJmX29wX2lzX213ciAgICAgICAgICAgICAgIHBlcmZfd2F3X2hhemFyZAorICAg
ICAgICBkZmlfaXNfcmRhICAgICAgIHBlcmZfb3BfaXNfcHJlICAgICAgICAgICAgICAgcGVyZl93
aW5kb3dfbGltaXRfcmVhY2hlZF9yZAorICAgICAgICBkZmlfaXNfcmVmYWIgICAgIHBlcmZfb3Bf
aXNfcHJlX2Zvcl9vdGhlcnMgICAgcGVyZl93aW5kb3dfbGltaXRfcmVhY2hlZF93cgorICAgICAg
ICBkZmlfaXNfcmVmcGIgICAgIHBlcmZfb3BfaXNfcHJlX2Zvcl9yZHdyICAgICAgcGVyZl93cl94
YWN0X3doZW5fY3JpdGljYWwKKyAgICAgICAgZGZpX2lzX3dyICAgICAgICBwZXJmX29wX2lzX3Jk
ICAgICAgICAgICAgICAgIHRpbWVfY250CisgICAgICAgIGRmaV9pc193cmEgICAgICAgcGVyZl9v
cF9pc19yZF9hY3RpdmF0ZQorICAgICAgICBwZXJmX2FjdF9ieXBhc3MgIHBlcmZfb3BfaXNfcmVm
CisKKworVGhlIHBlcmYgUE1VIGZyYW1ld29yayBpcyB1c3VhbGx5IGludm9rZWQgdmlhIHRoZSAn
cGVyZiBzdGF0JyB0b29sLgorCisKK0V4YW1wbGU6CisKKyAgICAuLiBjb2RlLWJsb2NrOjogYmFz
aAorCisgICAgICAgICQgcGVyZiBzdGF0IC0tdGltZW91dCA2MDAwMCAtZSBzdG0zMl9kZHJfcG11
L2RmaV9pc19hY3QvLFwKKyAgICAgICAgPiBzdG0zMl9kZHJfcG11L2RmaV9pc19yZC8sXAorICAg
ICAgICA+IHN0bTMyX2Rkcl9wbXUvZGZpX2lzX3dyLyxcCisgICAgICAgID4gc3RtMzJfZGRyX3Bt
dS9kZmlfaXNfcmVmYWIvLFwKKyAgICAgICAgPiBzdG0zMl9kZHJfcG11L2RmaV9pc19tcncvLFwK
KyAgICAgICAgPiBzdG0zMl9kZHJfcG11L2RmaV9pc19yZGEvLFwKKyAgICAgICAgPiBzdG0zMl9k
ZHJfcG11L2RmaV9pc193cmEvLFwKKyAgICAgICAgPiBzdG0zMl9kZHJfcG11L2RmaV9pc19tcnIv
LFwKKyAgICAgICAgPiBzdG0zMl9kZHJfcG11L3RpbWVfY250LyBcCisgICAgICAgID4gLWEgc2xl
ZXAgNQorCisgICAgICAgICBQZXJmb3JtYW5jZSBjb3VudGVyIHN0YXRzIGZvciAnc3lzdGVtIHdp
ZGUnOgorCisgICAgICAgICAgICAgICAgICAgIDQ4MTAyNSAgICAgIHN0bTMyX2Rkcl9wbXUvZGZp
X2lzX2FjdC8KKyAgICAgICAgICAgICAgICAgICAgNzMyMTY2ICAgICAgc3RtMzJfZGRyX3BtdS9k
ZmlfaXNfcmQvCisgICAgICAgICAgICAgICAgICAgIDE0NDkyNiAgICAgIHN0bTMyX2Rkcl9wbXUv
ZGZpX2lzX3dyLworICAgICAgICAgICAgICAgICAgICA2NDQxNTQgICAgICBzdG0zMl9kZHJfcG11
L2RmaV9pc19yZWZhYi8KKyAgICAgICAgICAgICAgICAgICAgICAgICAwICAgICAgc3RtMzJfZGRy
X3BtdS9kZmlfaXNfbXJ3LworICAgICAgICAgICAgICAgICAgICAgICAgIDAgICAgICBzdG0zMl9k
ZHJfcG11L2RmaV9pc19yZGEvCisgICAgICAgICAgICAgICAgICAgICAgICAgMCAgICAgIHN0bTMy
X2Rkcl9wbXUvZGZpX2lzX3dyYS8KKyAgICAgICAgICAgICAgICAgICAgICAgICAwICAgICAgc3Rt
MzJfZGRyX3BtdS9kZmlfaXNfbXJyLworICAgICAgICAgICAgICAgICA3NTIzNDc2ODYgICAgICBz
dG0zMl9kZHJfcG11L3RpbWVfY250LworCisgICAgICAgICAgICAgICA1LjAxNDkxMDc1MCBzZWNv
bmRzIHRpbWUgZWxhcHNlZAoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
