Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B1191BEFC
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 14:47:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1BF5C71289;
	Fri, 28 Jun 2024 12:47:00 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 939D1C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 12:46:53 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S958Kt022997;
 Fri, 28 Jun 2024 14:46:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ZAPW0T4mk6+g9RGuq3Ms922nET7aswPOyugOIngcHKU=; b=2Pd9qWSsIfkL0qEw
 +CjoWW7KavAWCHIpnaFU6LkIKt6De71CvzkU3m7Y28k4TqSs5FR7/LWHRL+EWTRq
 lrD88aB4Sc7RByWtbwnzKGBDPPmhUbhN8EkIe5YHhlnuZAmGVXzH43NcGHkfACEW
 GeoE/b1aLOVnXtL7/XYnexWBUwGWf9EQcziidRafZKmBwBwdaG1ECHCgjLXXQXOK
 LV/0WWmsxAO1JHOLKTXcmYRpKhdyC0uEeYuXjboOV8s+BT3pYeY+UA3anR09+awV
 pC/r4CAoVMHooouVSg0xrYiIqT2XoiIEtWwr1LmVmTTGcNxkW7PJWSrOoGwzi3Bn
 PVbEfQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx9jjqgfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 14:46:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9E1C740048;
 Fri, 28 Jun 2024 14:46:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA7A02258A2;
 Fri, 28 Jun 2024 14:45:45 +0200 (CEST)
Received: from [10.48.86.145] (10.48.86.145) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 28 Jun
 2024 14:45:45 +0200
Message-ID: <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
Date: Fri, 28 Jun 2024 14:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
X-Originating-IP: [10.48.86.145]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_08,2024-06-28_01,2024-05-17_01
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RESEND v3 0/3] Update STM DSI PHY driver
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

CgpPbiAxLzI5LzI0IDExOjQxLCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+IAo+IFRoaXMg
cGF0Y2ggc2VyaWVzIGFpbXMgdG8gYWRkIHNldmVyYWwgZmVhdHVyZXMgb2YgdGhlIGR3LW1pcGkt
ZHNpIHBoeQo+IGRyaXZlciB0aGF0IGFyZSBtaXNzaW5nIG9yIG5lZWQgdG8gYmUgdXBkYXRlZC4K
PiAKPiBGaXJzdCBwYXRjaCB1cGRhdGUgYSBQTSBtYWNyby4KPiAKPiBTZWNvbmQgcGF0Y2ggYWRk
cyBydW50aW1lIFBNIGZ1bmN0aW9uYWxpdHkgdG8gdGhlIGRyaXZlci4KPiAKPiBUaGlyZCBwYXRj
aCBhZGRzIGEgY2xvY2sgcHJvdmlkZXIgZ2VuZXJhdGVkIGJ5IHRoZSBQSFkgaXRzZWxmLiAgQXMK
PiBleHBsYWluZWQgaW4gdGhlIGNvbW1pdCBsb2cgb2YgdGhlIHNlY29uZCBwYXRjaCwgYSBjbG9j
ayBkZWNsYXJhdGlvbiBpcwo+IG1pc3NpbmcuICBTaW5jZSB0aGlzIGNsb2NrIGlzIHBhcmVudCBv
ZiAnZHNpX2snLCBpdCBsZWFkcyB0byBhbiBvcnBoYW4KPiBjbG9jay4gIE1vc3QgaW1wb3J0YW50
bHkgdGhpcyBwYXRjaCBpcyBhbiBhbnRpY2lwYXRpb24gZm9yIGZ1dHVyZQo+IHZlcnNpb25zIG9m
IHRoZSBEU0kgUEhZLCBhbmQgaXRzIGluY2x1c2lvbiB3aXRoaW4gdGhlIGRpc3BsYXkgc3Vic3lz
dGVtCj4gYW5kIHRoZSBEUk0gZnJhbWV3b3JrLgo+IAo+IExhc3QgcGF0Y2ggZml4ZXMgYSBjb3Ju
ZXIgZWZmZWN0IGludHJvZHVjZWQgcHJldmlvdXNseS4gIFNpbmNlICdkc2knIGFuZAo+ICdkc2lf
aycgYXJlIGdhdGVkIGJ5IHRoZSBzYW1lIGJpdCBvbiB0aGUgc2FtZSByZWdpc3RlciwgYm90aCBy
ZWZlcmVuY2UKPiB3b3JrIGFzIHBlcmlwaGVyYWwgY2xvY2sgaW4gdGhlIGRldmljZS10cmVlLgo+
IAo+IC0tLQo+IENoYW5nZXMgaW4gdjMtcmVzZW5kOgo+IAktIFJlbW92ZWQgbGFzdCBwYXRjaCBh
cyBpdCBoYXMgYmVlbiBtZXJnZWQKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL2JmNDlm
NGM5LTllODEtNGM5MS05NzJkLTEzNzgyZDk5NmFhYUBmb3NzLnN0LmNvbS8KPiAKPiBDaGFuZ2Vz
IGluIHYzOgo+IAktIEZpeCBzbWF0Y2ggd2FybmluZyAoZGlzYWJsZSBkc2ktPnBjbGsgd2hlbiBj
bGtfcmVnaXN0ZXIgZmFpbHMpCj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAJLSBBZGRlZCBwYXRjaCAx
LzQgdG8gdXNlIFNZU1RFTV9TTEVFUF9QTV9PUFMgaW5zdGVhZCBvZiBvbGQgbWFjcm8KPiAJICBh
bmQgcmVtb3ZlZCBfX21heWJlX3VzZWQgZm9yIGFjY29yZGluZ2x5Cj4gCS0gQ2hhbmdlZCBTRVRf
UlVOVElNRV9QTV9PUFMgdG8gUlVOVElNRV9QTV9PUFMKPiAKPiBSYXBoYWVsIEdhbGxhaXMtUG91
ICgzKToKPiAgICBkcm0vc3RtOiBkc2k6IHVzZSBuZXcgU1lTVEVNX1NMRUVQX1BNX09QUygpIG1h
Y3JvCj4gICAgZHJtL3N0bTogZHNpOiBleHBvc2UgRFNJIFBIWSBpbnRlcm5hbCBjbG9jawo+IAo+
IFlhbm5pY2sgRmVydHJlICgxKToKPiAgICBkcm0vc3RtOiBkc2k6IGFkZCBwbSBydW50aW1lIG9w
cwo+IAo+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYyB8IDI3OSArKysr
KysrKysrKysrKysrKysrKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIzOCBpbnNlcnRpb25z
KCspLCA0MSBkZWxldGlvbnMoLSkKPiAKCkhpIFJhcGhhw6tsICYgWWFubmljaywKQXBwbGllZCBv
biBkcm0tbWlzYy1uZXh0LgpNYW55IHRoYW5rcywKUGhpbGlwcGUgOi0pCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
