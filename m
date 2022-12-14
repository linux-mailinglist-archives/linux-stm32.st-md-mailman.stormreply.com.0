Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E34AA64CCE0
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Dec 2022 16:10:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F665C65E4F;
	Wed, 14 Dec 2022 15:10:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBD91C6411C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Dec 2022 15:10:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BEB7JkC006574; Wed, 14 Dec 2022 16:09:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SIBWmy60wKzIkLVwzp7ptxbSfFJ4w6J54f2O2l/WalQ=;
 b=fvwq4tGvpIh7y8hr4Wr/1HLhwVNUB5t5ene5wIpGxZgtRboI4ZR3LOglyEvY+Ky/1NSX
 QOCsY4X7HPfG3Gosux0a+Li40jOggIw+Z0SYw37U6zsCFMTc+LsNRR++G1mL4lL9mgLv
 DgsjsVVCENmgn37cwoyCza5mcZU1H4yo4wxK+kwlq6NO8MImy/r4ZYJYQhwlnPRCWvuO
 ujOcMTkaQ5U7+G17Jm0h3dnozrEWWwLhwfbjfNPjjXTqEOxKIFYVVU9nANlbypIRfa7Y
 F5Ivf/MzJNqLWn/TPWQxLm8woJ71nnTVXUBM6Spu0AGOJTXZZ/wr7FCQLao6ewezVGSV +Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mf6v6cegb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Dec 2022 16:09:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3CEA2100038;
 Wed, 14 Dec 2022 16:09:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 360AF22A6F9;
 Wed, 14 Dec 2022 16:09:30 +0100 (CET)
Received: from [10.252.31.140] (10.252.31.140) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 14 Dec
 2022 16:09:29 +0100
Message-ID: <2ab70bb7-dbf1-5f19-8118-6cfd9b5dc278@foss.st.com>
Date: Wed, 14 Dec 2022 16:09:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20221213102707.1096345-1-olivier.moysan@foss.st.com>
 <20221213105128.74skjowy5v7dlaf6@pengutronix.de>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20221213105128.74skjowy5v7dlaf6@pengutronix.de>
X-Originating-IP: [10.252.31.140]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-14_06,2022-12-14_01,2022-06-22_01
Cc: linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 William Breathitt Gray <william.gray@linaro.org>, Lee Jones <lee@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: enforce settings for pwm
	capture
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

SGVsbG8gVXdlLAoKT24gMTIvMTMvMjIgMTE6NTEsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+
IEhlbGxvIE9saXZpZXIsCj4gCj4gW0NjOiArPSBXaWxsaWFtIEJyZWF0aGl0dCBHcmF5LCBsaW51
eC1paW9Adi5rLm9dCj4gCj4gT24gVHVlLCBEZWMgMTMsIDIwMjIgYXQgMTE6Mjc6MDdBTSArMDEw
MCwgT2xpdmllciBNb3lzYW4gd3JvdGU6Cj4+IFRoZSBQV00gY2FwdHVyZSBhc3N1bWVzIHRoYXQg
dGhlIGlucHV0IHNlbGVjdG9yIGlzIHNldCB0byBkZWZhdWx0Cj4+IGlucHV0IGFuZCB0aGF0IHRo
ZSBzbGF2ZSBtb2RlIGlzIGRpc2FibGVkLiBGb3JjZSByZXNldCBzdGF0ZSBmb3IKPj4gVElTRUwg
YW5kIFNNQ1IgcmVnaXN0ZXJzIHRvIG1hdGNoIHRoaXMgcmVxdWlyZW1lbnQuCj4gCj4gV2hlbiBk
b2VzIHRoZSBwcm9ibGVtIG9jY3VyPyBPbmx5IGlmIHRoZSBib290bG9hZGVyIGNoYW5nZWQgdGhh
dAo+IHNldHRpbmc/IFJlZ2FyZGluZyB0aGUgdXJnZW5jeTogV2l0aCB0aGUgY3VycmVudCBrbm93
bGVkZ2UgSSdkIHNheSB0aGlzCj4gcGF0Y2ggaXMgbWF0ZXJpYWwgZm9yIHRoZSBuZXh0IG1lcmdl
IHdpbmRvdy4gRG8geW91IHJlY29tbWVuZAo+IGJhY2twb3J0aW5nIHRvIHN0YWJsZT8KPiAKClll
cywgdGhlIFBXTSBtYXkgbm90IGJlIGluIHRoZSBkZWZhdWx0IGV4cGVjdGVkIHN0YXRlLCBpZiB0
aGUgCmNvbmZpZ3VyYXRpb24gaGFzIGJlZW4gY2hhbmdlZCBpbiB0aGUgYm9vdGxvYWRlci4gVGhp
cyBpcyBub3QgYW4gYWN0dWFsIApjYXNlIHRvZGF5LCBzbyB0aGlzIHBhdGNoIGNhbiB3YWl0IHRo
ZSBuZXh0IG1lcmdlIHdpbmRvdyBhbmQgdGhlcmUgaXMgbm8KdXJnZW5jeSB0byBoYXZlIGl0IGlu
IHN0YWJsZS4KCkJScwpPbGl2aWVyCgo+PiBOb3RlIHRoYXQgc2xhdmUgbW9kZSBkaXNhYmxpbmcg
aXMgbm90IGEgcHJlLXJlcXVpc2l0ZSBieSBpdHNlbGYKPj4gZm9yIGNhcHR1cmUgbW9kZSwgYXMg
aGFyZHdhcmUgc3VwcG9ydHMgaXQgZm9yIFBXTSBjYXB0dXJlLgo+PiBIb3dldmVyLCB0aGUgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZHJpdmVyIGRvZXMgbm90Cj4+IGFsbG93IHNsYXZl
IG1vZGUgZm9yIFBXTSBjYXB0dXJlLiBTZXR0aW5nIHNsYXZlIG1vZGUgZm9yIFBXTQo+PiBjYXB0
dXJlIHJlc3VsdHMgaW4gd3JvbmcgY2FwdHVyZSB2YWx1ZXMuCj4gCj4gV2hhdCBpcyB5b3VyIHVz
ZWNhc2UgZm9yIFBXTSBjYXB0dXJlIHN1cHBvcnQ/IEkgZGlkbid0IGRvdWJsZSBjaGVjaywgYnV0
Cj4gSSB0aGluayB5b3UncmUgdGhlIGZpcnN0IGNvbnRyaWJ1dG9yIHRvIFBXTSBjYXB0dXJlIHNp
bmNlIDIwMTggKGkuZS4gdGhlCj4gY29tbWl0IHlvdSdyZSBmaXhpbmcpLgo+IAo+IERpZCB5b3Ug
Y2hlY2sgaWYgdGhlIGNvdW50ZXIgc3Vic3lzdGVtIHdvdWxkIHNvbHZlIHlvdXIgcHJvYmxlbXM/
IElmIGl0Cj4gZG9lc24ndCBJIGFzc3VtZSBXaWxsaWFtIHdvdWxkIGxpa2UgdG8gaGVhciBhYm91
dCB0aGF0Lgo+IAo+IExvb2tpbmcgYXQgZHJpdmVycy9jb3VudGVyL3N0bTMyLXRpbWVyLWNudC5j
IGl0IGRvZXMgc2VlbSB0byB3b3JrIGluCj4gc2xhdmUgbW9kZSwgVElTRUwgaXNuJ3QgdG91Y2hl
ZCB0aG91Z2guIFNvIG1heWJlIHRoaXMgZHJpdmVyIG5lZWRzIGEKPiBzaW1pbGFyIGZpeD8KPiAK
PiBBcGFydCBmcm9tIHRoYXQgdGhlIGNoYW5nZSBsb29rcyByZWFzb25hYmxlOgo+IAo+IEFja2Vk
LWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+
IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
