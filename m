Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A45ABDA9D
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 15:59:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0017AC78F9C;
	Tue, 20 May 2025 13:59:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15E77C78F99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 13:59:12 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDMYcr016869;
 Tue, 20 May 2025 15:58:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 DptsIhmH3OyfRoJnZOG3jvZZODFkToOPq0CogRo1m2I=; b=hVZYxZQOidEFsBG6
 jRT1erh8mm2vwBgbMCsnw3uabEaV0pgnRZEhw6XGXXUN9UDt6iNiQT+CO7LOuFmI
 +w/hh2B7k77xfQj6eQLFLwld+l+jQ9/Nw48di9mnJLdOsHN+J1w2k4t1eeiQLgtX
 M5YqZudcOrjA5qKBbEJDZbKNi16t7QF/XpnK7sSaDnZoCk+t0gEjTcptYXJF3mES
 NMVvspuXXhsFoJdgayQwHxhP1rX5EgN9EffFhLRlKEVrv4BGgGhyBrKhuwYdtfUg
 NPrP00mTkWDvWCKLGsOTEFhdLjNK+B1jrOtaPWIQvlbwDZvoQkM2zqhzG7CSBYlu
 tsQKtQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfvke0ea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 May 2025 15:58:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B91E140048;
 Tue, 20 May 2025 15:56:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FFC3B1082D;
 Tue, 20 May 2025 15:55:25 +0200 (CEST)
Received: from [10.48.87.146] (10.48.87.146) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 15:55:24 +0200
Message-ID: <dcea023e-9dac-4921-b405-4fd16477902a@foss.st.com>
Date: Tue, 20 May 2025 15:55:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20250519142057.260549-1-gabriel.fernandez@foss.st.com>
 <20250519142057.260549-2-gabriel.fernandez@foss.st.com>
 <83ce3ca8-c014-4814-8c51-9f7fd5151a41@oracle.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <83ce3ca8-c014-4814-8c51-9f7fd5151a41@oracle.com>
X-Originating-IP: [10.48.87.146]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: stm32: add STM32MP21
 clocks and reset bindings
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Ck9uIDUvMTkvMjUgMTY6NDIsIEFMT0sgVElXQVJJIHdyb3RlOgo+Cj4+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjEtcmNjLnlhbWwKPj4g
QEAgLTAsMCArMSwyMDAgQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDogCj4+
IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9jbG9jay9zdCxzdG0zMm1wMjEtcmNjLnlhbWwqX187SXchIUFDV1Y1TjlNMlJWOTloUSFOcWZj
ajB5dmwtY2I0TXU2WEZiTHo3RlZTSGtRZnBkUUdSYlZ0TTFFcUFOcTluX2NkWlpOQmctWUdTcWIt
TmttMTZMRE9RN1RzUkFJaTJpRHVnNkRJTzh1UFUwa3EzRSQKPj4gKyRzY2hlbWE6IAo+PiBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwqX187SXchIUFDV1Y1TjlNMlJWOTloUSFOcWZjajB5dmwtY2I0TXU2WEZiTHo3
RlZTSGtRZnBkUUdSYlZ0TTFFcUFOcTluX2NkWlpOQmctWUdTcWItTmttMTZMRE9RN1RzUkFJaTJp
RHVnNkRJTzh1TE5GT1NnZyQKPj4gKwo+PiArdGl0bGU6IFNUTTMyTVAyMSBSZXNldCBDbG9jayBD
b250cm9sbGVyCj4+ICsKPj4gK21haW50YWluZXJzOgo+PiArwqAgLSBHYWJyaWVsIEZlcm5hbmRl
eiA8Z2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5jb20+Cj4+ICsKPj4gK2Rlc2NyaXB0aW9uOiB8
Cj4+ICvCoCBUaGUgUkNDIGhhcmR3YXJlIGJsb2NrIGlzIGJvdGggYSByZXNldCBhbmQgYSBjbG9j
ayBjb250cm9sbGVyLgo+PiArwqAgUkNDIG1ha2VzIGFsc28gcG93ZXIgbWFuYWdlbWVudCAocmVz
dW1lL3N1cGVuZCkuCj4KPiB0eXBvIHN1cGVuZAo+CkhpIEFsb2ssCgpUaGFua3MgZm9yIHlvdSBy
ZXZpZXcKCmRvbmUKCgo+PiArCj4+ICvCoCBTZWUgYWxzbzo6Cj4+ICvCoMKgwqAgaW5jbHVkZS9k
dC1iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjEtcmNjLmgKPj4gK8KgwqDCoCBpbmNsdWRlL2R0
LWJpbmRpbmdzL3Jlc2V0L3N0LHN0bTMybXAyMS1yY2MuaAo+PiArCj4gW2NsaXBdCj4+ICvCoMKg
wqDCoMKgIC0gZGVzY3JpcHRpb246IENLX1NDTUlfSUNOX0FQQjIgUGVyaXBoZXJhbCBicmlkZ2Ug
Mgo+PiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBDS19TQ01JX0lDTl9BUEIzIFBlcmlwaGVy
YWwgYnJpZGdlIDMKPj4gK8KgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogQ0tfU0NNSV9JQ05fQVBC
NCBQZXJpcGhlcmFsIGJyaWRnZSA0Cj4+ICvCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IENLX1ND
TUlfSUNOX0FQQjUgUGVyaXBoZXJhbCBicmlkZ2UgNQo+PiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0
aW9uOiBDS19TQ01JX0lDTl9BUEJEQkcgUGVyaXBoZXJhbCBicmlkZ2UgZm9yIGRlZ3ViCj4KPiB0
eXBvIGRlZ3ViCgpkb25lCgpCZXN0IHJlZ2FyZHMsCgpHYWJyaWVsCgo+Cj4+ICvCoMKgwqDCoMKg
IC0gZGVzY3JpcHRpb246IENLX1NDTUlfVElNRzEgUGVyaXBoZXJhbCBicmlkZ2UgZm9yIHRpbWVy
MQo+PiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBDS19TQ01JX1RJTUcyIFBlcmlwaGVyYWwg
YnJpZGdlIGZvciB0aW1lcjIKPgo+IFRoYW5rcywKPiBBbG9rCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
