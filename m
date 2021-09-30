Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 335B341D7A3
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Sep 2021 12:26:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D46A1C5A4F8;
	Thu, 30 Sep 2021 10:26:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91C2CC597BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Sep 2021 10:26:14 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9AD92801B2;
 Thu, 30 Sep 2021 12:26:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1632997573;
 bh=t0ZAB0+QCDlyECVZAwB2kSA+pHaEK0PNa4Y+jmVbIzk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=W6elItkTo4yl2NY99JNjb0LKjmj3yeTZi8CbYf8Z6Aqse7JMoNoC575rQfTsi8xhI
 LSRQljKpZWHWpX40cGR4wGXx2qRkivRqt7AIObQJdoqY+ylc/F+V6Oqm1vmOSSkfF2
 tvlwD67NiNMP25tpyqGRUiE33FswVye54B4f9sOnDZe5MiI8xvTY0MuTmlzE5/07Y1
 steTKiwAHgI51il/9AotmfBQ+iWGFr1iZRX5624Mga0jQGPdv+uIBSnpYZFCpTCvjq
 RlWcPd9Nb+azD3yExHigWeAoaisILpJAFwog4NZNZzck2mCqci2JKRMxBQE0XtW478
 wYpJxt7+1q5+A==
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20210927114553.21843-1-olivier.moysan@foss.st.com>
 <beb6e7c8-f3c8-fc4e-6017-fea5690b9f33@denx.de>
 <e8d40be8-045c-096a-f079-d9f6364254e9@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <cfbb8475-ad1e-9075-cd82-92a8b315efc9@denx.de>
Date: Thu, 30 Sep 2021 12:26:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e8d40be8-045c-096a-f079-d9f6364254e9@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: fix AV96 board SAI2B
 pin muxing on stm32mp15
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

T24gOS8zMC8yMSAxMDo0NyBBTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiBIaSBNYXJlawo+
IAo+IE9uIDkvMjkvMjEgMToxOCBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDkvMjcvMjEg
MTo0NSBQTSwgT2xpdmllciBNb3lzYW4gd3JvdGU6Cj4+PiBGaXggU0FJMkIgcGluIG11eGluZyBm
b3IgQVY5NiBib2FyZCBvbiBTVE0zMk1QMTUuCj4+PiBUaGUgbGFiZWwgInNhaTJhLTQiIGlzIGRl
ZmluZWQgdHdpY2UuIENoYW5nZSByZWR1bmRhbnQgbGFiZWwgdG8gCj4+PiAic2FpMmItNCIuCj4+
Pgo+Pj4gRml4ZXM6IGRjZjE4NWNhODE3NSAoIkFSTTogZHRzOiBzdG0zMjogQWRkIGFsdGVybmF0
ZSBwaW5tdXggZm9yIFNBSTIgCj4+PiBwaW5zIG9uIHN0bTMybXAxNSIpCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogT2xpdmllciBNb3lzYW4gPG9saXZpZXIubW95c2FuQGZvc3Muc3QuY29tPgo+Pj4g
LS0tCj4+PiDCoCBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUtcGluY3RybC5kdHNpIHwgMiAr
LQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNS1waW5jdHJsLmR0
c2kgCj4+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNS1waW5jdHJsLmR0c2kKPj4+IGlu
ZGV4IDViNjBlY2JkNzE4Zi4uYjljYzllMGRkNGZjIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJtcDE1LXBpbmN0cmwuZHRzaQo+Pj4gKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJtcDE1LXBpbmN0cmwuZHRzaQo+Pj4gQEAgLTEyMzUsNyArMTIzNSw3IEBACj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+IMKgwqDCoMKgwqAgfTsKPj4+IC3CoMKgwqAgc2FpMmJf
cGluc19jOiBzYWkyYS00IHsKPj4+ICvCoMKgwqAgc2FpMmJfcGluc19jOiBzYWkyYi00IHsKPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5zMSB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdGJywgMTEsIEFGMTApPjsgLyogU0FJMl9TRF9CICov
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaWFzLWRpc2FibGU7Cj4+Cj4+IFRoaXMg
bXAxIHBpbm11eGluZyBpcyBhIHRvdGFsIG1lc3MsIHNpZ2guCj4gCj4gV2hhdCBpcyB0aGUgaXNz
dWUgaGVyZSA/CgpUaGUgc2FtZS1vbGQgZGlzY3Vzc2lvbiBhYm91dCB3aGVyZSB0byBwbGFjZSB0
aGUgcGlubXV4IG5vZGVzLCB3aGV0aGVyIAp3ZSBzaG91bGQgaGF2ZSB0aGVzZSBjbHVzdGVycyBv
ZiBwcmUtZGVmaW5lZCBvcHRpb25zIGluIC4uLnBpbmN0cmwuZHRzaSwgCm9yIHdoZXRoZXIgd2Ug
c2hvdWxkIGRvIG1vcmUgbnhwLWxpa2UgcGVyLWJvYXJkIGNvbmZpZ3VyYXRpb24uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
