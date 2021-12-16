Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A1B476E1C
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 10:49:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C6A7C5E2C5;
	Thu, 16 Dec 2021 09:49:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 276F0C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Dec 2021 09:49:06 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BG9AAwj021585;
 Thu, 16 Dec 2021 10:48:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=LLN9sSigq+j2eNzjgy1QryZl+qL34fhAv1RfhNaTpPU=;
 b=DD35Vny2lHI/MVlzRibb+MGp58oxZ65yvZNUyrxgpZaf+cnfQTojaRUOMG/vwNE+p4IO
 9SkY9HqRdK2JAgub5OA8Q8Z8DUaOGnYgUz44/E/cK9s4FXGtRlXecerkgvFRagd/8wsq
 2BuA8TElTHyfcMI3mYbRBRu6A4FpSzpmwy0ifE1rm/sHbu/WBJG1b7CcVQMo9cMn/o8p
 oJYv4kDOFko2niCdU7p30OKWqd7md6pnVrZHb+pUilT1PT+HKK7mMu0NDUwIM5lG47X9
 MuhvKJf1zwGdanwNXexhNjCQ/5WIxZNUyE0JfXeSaV4xA0h7RXFuR0eK6Rt0iVB5ALEc Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3d02k9g8ta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 10:48:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB25610002A;
 Thu, 16 Dec 2021 10:48:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C13AD229F8A;
 Thu, 16 Dec 2021 10:48:55 +0100 (CET)
Received: from lmecxl0504.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 16 Dec
 2021 10:48:55 +0100
To: Marek Vasut <marex@denx.de>, <linux-mmc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20211215141727.4901-1-yann.gautier@foss.st.com>
 <20211215141727.4901-4-yann.gautier@foss.st.com>
 <05ab7b52-190e-048f-3803-7bed51e2b09c@denx.de>
From: Yann Gautier <yann.gautier@foss.st.com>
Message-ID: <67c6d0be-078b-0726-698d-096c5e77b4ab@foss.st.com>
Date: Thu, 16 Dec 2021 10:48:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <05ab7b52-190e-048f-3803-7bed51e2b09c@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_03,2021-12-14_01,2021-12-02_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, u.kleine-koenig@pengutronix.de,
 Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [Linux-stm32] [PATCH 3/4] mmc: mmci: stm32: clear DLYB_CR after
 sending tuning command
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

T24gMTIvMTYvMjEgMTA6MTMgQU0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDEyLzE1LzIxIDE1
OjE3LCBZYW5uIEdhdXRpZXIgd3JvdGU6Cj4+IER1cmluZyB0ZXN0IGNhbXBhaWduLCBhbmQgZXNw
ZWNpYWxseSBhZnRlciBzZXZlcmFsIHVuYmluZC9iaW5kIHNlcXVlbmNlcywKPj4gaXQgaGFzIGJl
ZW4gc2VlbiB0aGF0IHRoZSBTRC1jYXJkIG9uIFNETU1DMSB0aHJlYWQgY291bGQgZnJlZXplLgo+
PiBUaGUgZnJlZXplIGFsd2F5cyBhcHBlYXIgb24gYSBDTUQyMyBmb2xsb3dpbmcgYSBDTUQxOS4K
Pj4gQ2hlY2tpbmcgU0RNTUMgaW50ZXJuYWwgcmVnaXN0ZXJzIHNob3dzIHRoYXQgdGhlIHR1bmlu
ZyBjb21tYW5kIChDTUQxOSkKPj4gaGFzIGZhaWxlZC4KPj4gVGhlIGZyZWV6ZSBpcyB0aGVuIGR1
ZSB0byB0aGUgZGVsYXkgYmxvY2sgaW52b2x2ZWQgaW4gdGhlIHR1bmluZyAKPj4gc2VxdWVuY2Uu
Cj4+IFRvIGNvcnJlY3QgdGhpcywgY2xlYXIgdGhlIGRlbGF5IGJsb2NrIHJlZ2lzdGVyIERMWUJf
Q1IgcmVnaXN0ZXIgYWZ0ZXIKPj4gdGhlIHR1bmluZyBjb21tYW5kcy4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IFlhbm4gR2F1dGllciA8eWFubi5nYXV0aWVyQGZvc3Muc3QuY29t
Pgo+PiAtLS0KPj4gwqAgZHJpdmVycy9tbWMvaG9zdC9tbWNpX3N0bTMyX3NkbW1jLmMgfCAyICsr
Cj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbW1jL2hvc3QvbW1jaV9zdG0zMl9zZG1tYy5jIAo+PiBiL2RyaXZlcnMvbW1jL2hv
c3QvbW1jaV9zdG0zMl9zZG1tYy5jCj4+IGluZGV4IGZkYWExMWY5MmZlNi4uYTc1ZDNkZDM0ZDE4
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0L21tY2lfc3RtMzJfc2RtbWMuYwo+PiAr
KysgYi9kcml2ZXJzL21tYy9ob3N0L21tY2lfc3RtMzJfc2RtbWMuYwo+PiBAQCAtNDQxLDYgKzQ0
MSw4IEBAIHN0YXRpYyBpbnQgc2RtbWNfZGx5Yl9waGFzZV90dW5pbmcoc3RydWN0IAo+PiBtbWNp
X2hvc3QgKmhvc3QsIHUzMiBvcGNvZGUpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJ
TlZBTDsKPj4gwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqAgd3JpdGVsX3JlbGF4ZWQoMCwgZGx5Yi0+
YmFzZSArIERMWUJfQ1IpOwo+PiArCj4+IMKgwqDCoMKgwqAgcGhhc2UgPSBlbmRfb2ZfbGVuIC0g
bWF4X2xlbiAvIDI7Cj4+IMKgwqDCoMKgwqAgc2RtbWNfZGx5Yl9zZXRfY2ZncihkbHliLCBkbHli
LT51bml0LCBwaGFzZSwgZmFsc2UpOwo+IAo+IFNob3VsZG4ndCB0aGlzIGhhdmUgYSBGaXhlczog
dGFnIGFuZCBiZSBDQyBzdGFibGUgPwo+IFRoaXMgc2VlbXMgbGlrZSBhIGJ1Z2ZpeCwgbm8gPwoK
SGkgTWFyZWssCgpZb3UncmUgcmlnaHQsIEkgc2hvdWxkIGhhdmUgYWRkZWQ6CkZpeGVzOiAxMTAz
ZjgwN2EzYjkgKCJtbWM6IG1tY2lfc2RtbWM6IEFkZCBleGVjdXRlIHR1bmluZyB3aXRoIGRlbGF5
IGJsb2NrIikKClVsZiwgY291bGQgeW91IG1hbmFnZSB0aGF0LCBvciBzaG91bGQgSSBwdXNoIGEg
bmV3IHZlcnNpb24/CgoKQmVzdCByZWdhcmRzLApZYW5uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
