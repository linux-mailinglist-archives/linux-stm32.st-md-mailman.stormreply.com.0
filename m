Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF41AD57A5
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Jun 2025 15:54:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F9E5C32E8E;
	Wed, 11 Jun 2025 13:54:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D178C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Jun 2025 13:54:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BCFOAP014824;
 Wed, 11 Jun 2025 15:54:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 SVo3B24OwlGB4MegvwJiCx+gPz1XAKK8W690GqvITAQ=; b=a3CiH6h0cxGgTkgA
 Aqee/5M/6dNuYYLxJdIVA+T0Im2/E65K7ptBXpADH0V+zNyZa3b8Qpv3rxV67eGR
 mCO87tx4+jGIAHUiwJAeThs04F7Rk8GF35De9xoq1+ECrpydeANzzpD4pbY2b0IN
 mjcwVS6eDOPTQTwd/DPfLJjwkRQHtWepwPiX3iEUt+aWUcTdrDO/ePYyEHnHwtwi
 SIGHKSiRI8e2KB+VUWXYJhr67wWD47NYR7Nvd3a++wt9u0odcRes/VkTwpaU09ms
 H+YeJmq+CCRjU53+AKY4FQYwNQYjiCBDMMi4DCSWkNqSa0VLl8dETa6DU7j8Nkqj
 u3NJbA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474ajaa6d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jun 2025 15:54:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CE8EE40048;
 Wed, 11 Jun 2025 15:52:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00A94B12446;
 Wed, 11 Jun 2025 15:51:46 +0200 (CEST)
Received: from [192.168.8.15] (10.252.18.240) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 15:51:44 +0200
Message-ID: <a5e25ab7c595936f93198c9ac0b2e048a83f5b57.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 11 Jun 2025 15:51:42 +0200
In-Reply-To: <20250611104348.192092-10-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-10-jirislaby@kernel.org>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.252.18.240]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Tero Kristo <kristo@kernel.org>, imx@lists.linux.dev,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 tglx@linutronix.de, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] irqchip: Use dev_fwnode()
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

T24gV2VkLCAyMDI1LTA2LTExIGF0IDEyOjQzICswMjAwLCBKaXJpIFNsYWJ5IChTVVNFKSB3cm90
ZToKPiBpcnFfZG9tYWluX2NyZWF0ZV9zaW1wbGUoKSB0YWtlcyBmd25vZGUgYXMgdGhlIGZpcnN0
IGFyZ3VtZW50LiBJdCBjYW4gYmUKPiBleHRyYWN0ZWQgZnJvbSB0aGUgc3RydWN0IGRldmljZSB1
c2luZyBkZXZfZndub2RlKCkgaGVscGVyIGluc3RlYWQgb2YKPiB1c2luZyBvZl9ub2RlIHdpdGgg
b2ZfZndub2RlX2hhbmRsZSgpLgo+IAo+IFNvIHVzZSB0aGUgZGV2X2Z3bm9kZSgpIGhlbHBlci4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKaXJpIFNsYWJ5IChTVVNFKSA8amlyaXNsYWJ5QGtlcm5lbC5v
cmc+Cj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IAo+IC0tLQo+
IENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+Cj4gQ2M6IFNhc2NoYSBIYXVlciA8
cy5oYXVlckBwZW5ndXRyb25peC5kZT4KPiBDYzogUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtl
cm5lbEBwZW5ndXRyb25peC5kZT4KPiBDYzogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwu
Y29tPgo+IENjOiBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+Cj4gQ2M6IEdyZWdvcnkgQ2xl
bWVudCA8Z3JlZ29yeS5jbGVtZW50QGJvb3RsaW4uY29tPgo+IENjOiBTZWJhc3RpYW4gSGVzc2Vs
YmFydGggPHNlYmFzdGlhbi5oZXNzZWxiYXJ0aEBnbWFpbC5jb20+Cj4gQ2M6IE1heGltZSBDb3F1
ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4KPiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8
YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPiBDYzogTmlzaGFudGggTWVub24gPG5tQHRp
LmNvbT4KPiBDYzogVGVybyBLcmlzdG8gPGtyaXN0b0BrZXJuZWwub3JnPgo+IENjOiBTYW50b3No
IFNoaWxpbWthciA8c3NhbnRvc2hAa2VybmVsLm9yZz4KPiBDYzogaW14QGxpc3RzLmxpbnV4LmRl
dgo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IC0tLQo+IMKgZHJpdmVycy9pcnFj
aGlwL2lycS1pbWdwZGMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiArLQo+IMKgZHJp
dmVycy9pcnFjaGlwL2lycS1pbXgtaXJxc3RlZXIuY8KgwqDCoMKgwqDCoMKgIHwgMiArLQo+IMKg
ZHJpdmVycy9pcnFjaGlwL2lycS1rZXlzdG9uZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQg
KystLQo+IMKgZHJpdmVycy9pcnFjaGlwL2lycS1tdmVidS1waWMuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMiArLQo+IMKgZHJpdmVycy9pcnFjaGlwL2lycS1wcnVzcy1pbnRjLmPCoMKgwqDCoMKg
wqDCoMKgwqAgfCAyICstCj4gwqBkcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtaW50Yy1pcnFw
aW4uYyB8IDYgKystLS0tCj4gwqBkcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtaXJxYy5jwqDC
oMKgwqDCoMKgwqAgfCAyICstCj4gwqBkcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnphMS5j
wqDCoMKgwqDCoMKgwqAgfCA1ICsrLS0tCj4gwqBkcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMt
cnpnMmwuY8KgwqDCoMKgwqDCoCB8IDUgKystLS0KPiDCoGRyaXZlcnMvaXJxY2hpcC9pcnEtcmVu
ZXNhcy1yenYyaC5jwqDCoMKgwqDCoMKgIHwgMiArLQo+IMKgZHJpdmVycy9pcnFjaGlwL2lycS1z
dG0zMm1wLWV4dGkuY8KgwqDCoMKgwqDCoMKgIHwgNCArLS0tCgpGb3IgZHJpdmVycy9pcnFjaGlw
L2lycS1zdG0zMm1wLWV4dGkuYwpSZXZpZXdlZC1ieTogQW50b25pbyBCb3JuZW8gPGFudG9uaW8u
Ym9ybmVvQGZvc3Muc3QuY29tPgoKVGhhbmtzCkFudG9uaW8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
