Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E0650719A
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Apr 2022 17:24:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41333C6049A;
	Tue, 19 Apr 2022 15:24:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F221C60494
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 15:24:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23JEONku018031;
 Tue, 19 Apr 2022 17:23:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qzAU/akrVk+VIbauudaSr3Ss2mWJ2U69z/3vxKcaHsI=;
 b=CxKWrC7mXZQOheahCMpaaa8gMLyw3oDtarbZ9wLSsxqE6jgifCDPF2PvbxW2HvkF+c2Q
 Clf539QX1ZNnuSnW1lgEf7A70Amcjv4XTgX/A68zwlqJy6SOsUQ1+ZJePcvIjCfCSYsR
 XXb8HytWjJnYibnjnqkQW4Zenmd7pajP/NtAYtTn6uaEy/hO0+vsyMYw9dmYIUVF8/Fx
 OrRThih21HtkbDhYEJhaPnUx8aAn6rXGF3dqp/41piK2RO9A4ExPbvIoEVC9ON4DLOV0
 pGb04DcOyDzEunQPj2z6+VKIpREuVtwNnh6SExk7E2TNOZcH4GdGob5M8Vq/k+P1FZyy 9g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqgq17h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 17:23:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 83FD310002A;
 Tue, 19 Apr 2022 17:23:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7AA32216ECD;
 Tue, 19 Apr 2022 17:23:55 +0200 (CEST)
Received: from [10.48.0.142] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 19 Apr
 2022 17:23:55 +0200
Message-ID: <0238597b-f749-2569-d0e1-167327542c04@foss.st.com>
Date: Tue, 19 Apr 2022 17:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20220325175851.70083-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220325175851.70083-1-marex@denx.de>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_05,2022-04-15_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix PHY post-reset delay
	on Avenger96
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

T24gMy8yNS8yMiAxODo1OCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gUGVyIEtTWjkwMzFSTlggUEhZ
IGRhdGFzaGVldCBGSUdVUkUgNy01OiBQT1dFUi1VUC9QT1dFUi1ET1dOL1JFU0VUIFRJTUlORwo+
IE5vdGUgMjogQWZ0ZXIgdGhlIGRlLWFzc2VydGlvbiBvZiByZXNldCwgd2FpdCBhIG1pbmltdW0g
b2YgMTAwIM68cyBiZWZvcmUKPiBzdGFydGluZyBwcm9ncmFtbWluZyBvbiB0aGUgTUlJTSAoTURD
L01ESU8pIGludGVyZmFjZS4KPiAKPiBBZGQgMW1zIHBvc3QtcmVzZXQgZGVsYXkgdG8gZ3VhcmFu
dGVlIHRoaXMgZmlndXJlLgo+IAo+IEZpeGVzOiAwMTBjYTlmZTUwMGJmICgiQVJNOiBkdHM6IHN0
bTMyOiBBZGQgbWlzc2luZyBldGhlcm5ldCBQSFkgcmVzZXQgb24gQVY5NiIpCj4gU2lnbmVkLW9m
Zi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUg
PGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0
cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+IENjOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNr
LmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCj4gVG86IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IC0tLQo+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb3ItYXZlbmdlcjk2LmR0
c2kgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1hdmVuZ2VyOTYuZHRzaSBi
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29yLWF2ZW5nZXI5Ni5kdHNpCj4gaW5k
ZXggNjFlMTdmNDRjZTgxNS4uNzZjNTRiMDA2ZDg3MSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1hdmVuZ2VyOTYuZHRzaQo+ICsrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29yLWF2ZW5nZXI5Ni5kdHNpCj4gQEAgLTE0MSw2ICsx
NDEsNyBAQCBtZGlvMCB7Cj4gICAJCWNvbXBhdGlibGUgPSAic25wcyxkd21hYy1tZGlvIjsKPiAg
IAkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW96IDIgR1BJT19BQ1RJVkVfTE9XPjsKPiAgIAkJcmVzZXQt
ZGVsYXktdXMgPSA8MTAwMD47Cj4gKwkJcmVzZXQtcG9zdC1kZWxheS11cyA9IDwxMDAwPjsKPiAg
IAo+ICAgCQlwaHkwOiBldGhlcm5ldC1waHlANyB7Cj4gICAJCQlyZWcgPSA8Nz47CkFwcGxpZWQg
b24gc3RtMzItbmV4dC4KClRoYW5rcy4KQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
