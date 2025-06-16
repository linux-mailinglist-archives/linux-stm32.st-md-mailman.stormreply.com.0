Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C674EADABC8
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 11:24:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D9C3C36B3E;
	Mon, 16 Jun 2025 09:24:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E940C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 09:23:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8tIwf030344;
 Mon, 16 Jun 2025 11:23:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 GwJR4L4C5BNi8BSL4VDf9yl7ztEEHcvn8VOyGlQkwDc=; b=bSznlfWzf8JS1yut
 xodDKNY6JZ0mK216iHwfRMnfrTXP+RL6V9Qsn6T2dY1wQEIrptU2ngmaUFoEpzkW
 xs12kvgu3T9d64fmqoOWbzluYzFb3IM7p44C3ZniALjxhLOHThYlVo1JBBa1w4RJ
 L+8XQbTIiwEghZ6GyRfe6G2dRTWwXmz9V9HW0uRtMkxPjUOOGJS6IghQj/BARp7x
 zVTTwN1xjZa608Jtmhyq5Wsxmg+CGwdEQCheSXt87mwl4mgbN//g0bPF+6sXGMwn
 cdaDRMx5PXgmSMS+Sm1aMcmHo0y64JFVFzF9thJtFcv/Vw3/uNMRfwvSugZZMd2I
 ffX3uA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4790e1ywha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 11:23:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0DB8440047;
 Mon, 16 Jun 2025 11:22:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83E60A7D80E;
 Mon, 16 Jun 2025 11:21:07 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 11:21:07 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 11:21:02 +0200
MIME-Version: 1.0
Message-ID: <20250616-spi-upstream-v1-1-7e8593f3f75d@foss.st.com>
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
Subject: [Linux-stm32] [PATCH 1/6] spi: stm32: Add SPI_READY mode to spi
	controller
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

VGhlIHNwaSByZWFkeSBmdW5jdGlvbmFsaXR5IGlzIHN1cHBvcnRlZCBieSBvdXIgcGVyaXBoZXJh
bCBpbiBob3N0IGFuZAp0YXJnZXQgbW9kZXMgb24gU1RNMzJNUDJ4IFNvQ3MuClVwZGF0ZSBvdXIg
c3BpIGNvbnRyb2xsZXIgZHJpdmVyIHRvIGFsbG93IGRldmljZXMgdG8gdXNlIHRoaXMKZnVuY3Rp
b25hbGl0eS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdv
ZmZpY0Bmb3NzLnN0LmNvbT4KLS0tCiBkcml2ZXJzL3NwaS9zcGktc3RtMzIuYyB8IDI4ICsrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jIGIv
ZHJpdmVycy9zcGkvc3BpLXN0bTMyLmMKaW5kZXggZGEzNTE3ZDcxMDJkLi4yYmNkNGE0MzY3NmQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jCisrKyBiL2RyaXZlcnMvc3BpL3Nw
aS1zdG0zMi5jCkBAIC0xNTQsNiArMTU0LDkgQEAKIC8qIFNUTTMySDdfU1BJX0kyU0NGR1IgYml0
IGZpZWxkcyAqLwogI2RlZmluZSBTVE0zMkg3X1NQSV9JMlNDRkdSX0kyU01PRAlCSVQoMCkKIAor
LyogU1RNMzJNUDI1X1NQSUNGRzIgYml0IGZpZWxkcyAqLworI2RlZmluZSBTVE0zMk1QMjVfU1BJ
X0NGRzJfUkRJT00JQklUKDEzKQorCiAvKiBTVE0zMk1QMjUgU1BJIHJlZ2lzdGVycyBiaXQgZmll
bGRzICovCiAjZGVmaW5lIFNUTTMyTVAyNV9TUElfSFdDRkdSMQkJCTB4M0YwCiAKQEAgLTIyMiw2
ICsyMjUsNyBAQCBzdHJ1Y3Qgc3RtMzJfc3BpX3JlZyB7CiAgKiBAcng6IFNQSSBSWCBkYXRhIHJl
Z2lzdGVyCiAgKiBAdHg6IFNQSSBUWCBkYXRhIHJlZ2lzdGVyCiAgKiBAZnVsbGNmZzogU1BJIGZ1
bGwgb3IgbGltaXRlZCBmZWF0dXJlIHNldCByZWdpc3RlcgorICogQHJkeV9lbjogU1BJIHJlYWR5
IGZlYXR1cmUgcmVnaXN0ZXIKICAqLwogc3RydWN0IHN0bTMyX3NwaV9yZWdzcGVjIHsKIAljb25z
dCBzdHJ1Y3Qgc3RtMzJfc3BpX3JlZyBlbjsKQEAgLTIzNSw2ICsyMzksNyBAQCBzdHJ1Y3Qgc3Rt
MzJfc3BpX3JlZ3NwZWMgewogCWNvbnN0IHN0cnVjdCBzdG0zMl9zcGlfcmVnIHJ4OwogCWNvbnN0
IHN0cnVjdCBzdG0zMl9zcGlfcmVnIHR4OwogCWNvbnN0IHN0cnVjdCBzdG0zMl9zcGlfcmVnIGZ1
bGxjZmc7CisJY29uc3Qgc3RydWN0IHN0bTMyX3NwaV9yZWcgcmR5X2VuOwogfTsKIAogc3RydWN0
IHN0bTMyX3NwaTsKQEAgLTQxNSw2ICs0MjAsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN0bTMy
X3NwaV9yZWdzcGVjIHN0bTMybXAyNV9zcGlfcmVnc3BlYyA9IHsKIAkudHggPSB7IFNUTTMySDdf
U1BJX1RYRFIgfSwKIAogCS5mdWxsY2ZnID0geyBTVE0zMk1QMjVfU1BJX0hXQ0ZHUjEsIFNUTTMy
TVAyNV9TUElfSFdDRkdSMV9GVUxMQ0ZHIH0sCisKKwkucmR5X2VuID0geyBTVE0zMkg3X1NQSV9D
RkcyLCBTVE0zMk1QMjVfU1BJX0NGRzJfUkRJT00gfSwKIH07CiAKIHN0YXRpYyBpbmxpbmUgdm9p
ZCBzdG0zMl9zcGlfc2V0X2JpdHMoc3RydWN0IHN0bTMyX3NwaSAqc3BpLApAQCAtMTE3MiwxNSAr
MTE3OSwyMSBAQCBzdGF0aWMgaW50IHN0bTMyX3NwaV9wcmVwYXJlX21zZyhzdHJ1Y3Qgc3BpX2Nv
bnRyb2xsZXIgKmN0cmwsCiAJZWxzZQogCQljbHJiIHw9IHNwaS0+Y2ZnLT5yZWdzLT5jc19oaWdo
Lm1hc2s7CiAKLQlkZXZfZGJnKHNwaS0+ZGV2LCAiY3BvbD0lZCBjcGhhPSVkIGxzYl9maXJzdD0l
ZCBjc19oaWdoPSVkXG4iLAorCWlmIChzcGlfZGV2LT5tb2RlICYgU1BJX1JFQURZKQorCQlzZXRi
IHw9IHNwaS0+Y2ZnLT5yZWdzLT5yZHlfZW4ubWFzazsKKwllbHNlCisJCWNscmIgfD0gc3BpLT5j
ZmctPnJlZ3MtPnJkeV9lbi5tYXNrOworCisJZGV2X2RiZyhzcGktPmRldiwgImNwb2w9JWQgY3Bo
YT0lZCBsc2JfZmlyc3Q9JWQgY3NfaGlnaD0lZCByZHk9JWRcbiIsCiAJCSEhKHNwaV9kZXYtPm1v
ZGUgJiBTUElfQ1BPTCksCiAJCSEhKHNwaV9kZXYtPm1vZGUgJiBTUElfQ1BIQSksCiAJCSEhKHNw
aV9kZXYtPm1vZGUgJiBTUElfTFNCX0ZJUlNUKSwKLQkJISEoc3BpX2Rldi0+bW9kZSAmIFNQSV9D
U19ISUdIKSk7CisJCSEhKHNwaV9kZXYtPm1vZGUgJiBTUElfQ1NfSElHSCksCisJCSEhKHNwaV9k
ZXYtPm1vZGUgJiBTUElfUkVBRFkpKTsKIAogCXNwaW5fbG9ja19pcnFzYXZlKCZzcGktPmxvY2ss
IGZsYWdzKTsKIAotCS8qIENQT0wsIENQSEEgYW5kIExTQiBGSVJTVCBiaXRzIGhhdmUgY29tbW9u
IHJlZ2lzdGVyICovCisJLyogQ1BPTCwgQ1BIQSwgTFNCIEZJUlNULCBDU19ISUdIIGFuZCBSRFlf
RU4gYml0cyBoYXZlIGNvbW1vbiByZWdpc3RlciAqLwogCWlmIChjbHJiIHx8IHNldGIpCiAJCXdy
aXRlbF9yZWxheGVkKAogCQkJKHJlYWRsX3JlbGF4ZWQoc3BpLT5iYXNlICsgc3BpLT5jZmctPnJl
Z3MtPmNwb2wucmVnKSAmCkBAIC0xNzY4LDYgKzE3ODEsMTMgQEAgc3RhdGljIGludCBzdG0zMl9z
cGlfdHJhbnNmZXJfb25lX3NldHVwKHN0cnVjdCBzdG0zMl9zcGkgKnNwaSwKIAlzcGktPmN1cl9i
cHcgPSB0cmFuc2Zlci0+Yml0c19wZXJfd29yZDsKIAlzcGktPmNmZy0+c2V0X2JwdyhzcGkpOwog
CisJaWYgKHNwaV9kZXYtPm1vZGUgJiBTUElfUkVBRFkgJiYgc3BpLT5jdXJfYnB3IDwgOCkgewor
CQl3cml0ZWxfcmVsYXhlZChyZWFkbF9yZWxheGVkKHNwaS0+YmFzZSArIHNwaS0+Y2ZnLT5yZWdz
LT5yZHlfZW4ucmVnKSAmCisJCQkJfnNwaS0+Y2ZnLT5yZWdzLT5yZHlfZW4ubWFzaywKKwkJCQkJ
c3BpLT5iYXNlICsgc3BpLT5jZmctPnJlZ3MtPnJkeV9lbi5yZWcpOworCQlkZXZfZGJnKHNwaS0+
ZGV2LCAiUkRZIGxvZ2ljIGRpc2FibGVkIGFzIGJpdHMgcGVyIHdvcmQgPCA4XG4iKTsKKwl9CisK
IAkvKiBVcGRhdGUgc3BpLT5jdXJfc3BlZWQgd2l0aCByZWFsIGNsb2NrIHNwZWVkICovCiAJaWYg
KFNUTTMyX1NQSV9IT1NUX01PREUoc3BpKSkgewogCQltYnIgPSBzdG0zMl9zcGlfcHJlcGFyZV9t
YnIoc3BpLCB0cmFuc2Zlci0+c3BlZWRfaHosCkBAIC0yMTc5LDcgKzIxOTksNyBAQCBzdGF0aWMg
aW50IHN0bTMyX3NwaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWN0cmwt
PmF1dG9fcnVudGltZV9wbSA9IHRydWU7CiAJY3RybC0+YnVzX251bSA9IHBkZXYtPmlkOwogCWN0
cmwtPm1vZGVfYml0cyA9IFNQSV9DUEhBIHwgU1BJX0NQT0wgfCBTUElfQ1NfSElHSCB8IFNQSV9M
U0JfRklSU1QgfAotCQkJICBTUElfM1dJUkU7CisJCQkgIFNQSV8zV0lSRSB8IFNQSV9SRUFEWTsK
IAljdHJsLT5iaXRzX3Blcl93b3JkX21hc2sgPSBzcGktPmNmZy0+Z2V0X2Jwd19tYXNrKHNwaSk7
CiAJY3RybC0+bWF4X3NwZWVkX2h6ID0gc3BpLT5jbGtfcmF0ZSAvIHNwaS0+Y2ZnLT5iYXVkX3Jh
dGVfZGl2X21pbjsKIAljdHJsLT5taW5fc3BlZWRfaHogPSBzcGktPmNsa19yYXRlIC8gc3BpLT5j
ZmctPmJhdWRfcmF0ZV9kaXZfbWF4OwoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
