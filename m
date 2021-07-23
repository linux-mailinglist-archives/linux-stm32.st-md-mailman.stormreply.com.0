Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCDC3D3EEE
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jul 2021 19:40:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E7ACC57B6B;
	Fri, 23 Jul 2021 17:40:07 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27A4EC57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 17:40:04 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6FFE380FBE;
 Fri, 23 Jul 2021 19:40:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1627062003;
 bh=XieTqSv9E0R58U3bPanweEbVvUAYfp0nka/ulSaZF6c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Vjprs3MNRMpsgtkmLiOSDZhUZmHl+Dnmr8hi4PwLuGESxc7SY7XrMywYeGwsKzDj1
 dS3tULt6BRgsDRcNQfUkwRP5TJOhUnGR7CSe8cT2zpOCStLcrYeKID8Jj7K18TsWbH
 Gwv0IqgTJXBRIczaEQaS24SmhbiiXxcspX7/7UmOEURIoRTbsJAyXLBgqkwK5/A9uW
 JdSEUpQRIy2e8FpxWL1L6x6c5Mu6TJhwCcEZVX1nJqvOJx/4iLqqcNf3Mi3G4gYSLw
 mvH0d2My6Bk8v8ZC7EWYBRaEj+x12T2AMf2lQVBCMwl3osTq2YgqKcjX1ZKRPSyoMk
 YKBVnAfrGvAeA==
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20210721181253.126823-1-marex@denx.de>
 <c680dada-7484-0a71-9496-f7f2ed6cb00f@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <b97b5ede-3621-6fdf-25c0-81c0332a9297@denx.de>
Date: Fri, 23 Jul 2021 19:40:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c680dada-7484-0a71-9496-f7f2ed6cb00f@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: cniedermaier@dh-electronics.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Disable LAN8710 EDPD on
	DHCOM
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

T24gNy8yMy8yMSA1OjE3IFBNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IEhpIE1hcmVrCj4g
Cj4gT24gNy8yMS8yMSA4OjEyIFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4gVGhlIExBTjg3MTAg
RW5lcmd5IERldGVjdCBQb3dlciBEb3duIChFRFBEKSBmdW5jdGlvbmFsaXR5IG1pZ2h0IGNhdXNl
Cj4+IHVucmVsaWFibGUgY2FibGUgZGV0ZWN0aW9uLiBUaGVyZSBhcmUgbXVsdGlwbGUgYWNjb3Vu
dHMgb2YgdGhpcyBpbiB0aGUKPj4gU01TQyBQSFkgZHJpdmVyIHBhdGNoZXMgd2hpY2ggYXR0ZW1w
dGVkIHRvIG1ha2UgRURQRCByZWxpYWJsZSwgaG93ZXZlcgo+PiBpdCBzZWVtcyB0aGVyZSBpcyBh
bHdheXMgc29tZSBzb3J0IG9mIGNvcm5lciBjYXNlIGxlZnQuIFVuZm9ydHVuYXRlbGx5LAo+PiB0
aGVyZSBpcyBubyBlcnJhdGEgZG9jdW1lbnRlZCB3aGljaCB3b3VsZCBjb25maXJtIHRoaXMgdG8g
YmUgYSBzaWxpY29uCj4+IGJ1ZyBvbiB0aGUgTEFOODd4eCBzZXJpZXMgb2YgUEhZcyAoTEFOODcw
MCwgTEFOODcxMCwgTEFOODcyMCBhdCBsZWFzdCkuCj4+Cj4+IERpc2FibGUgRURQRCBvbiB0aGUg
REhDT00gU29NLCBqdXN0IGxpa2UgbXVsdGlwbGUgb3RoZXIgYm9hcmRzIGFscmVhZHkKPj4gZG8g
YXMgd2VsbCwgdG8gbWFrZSB0aGUgY2FibGUgZGV0ZWN0aW9uIHJlbGlhYmxlLgo+Pgo+PiBGaXhl
czogMzRlMGM3ODQ3ZGNmICgiQVJNOiBkdHM6IHN0bTMyOiBBZGQgREggRWxlY3Ryb25pY3MgREhD
T00gCj4+IFNUTTMyTVAxIFNvTSBhbmQgUERLMiBib2FyZCIpCj4+IFNpZ25lZC1vZmYtYnk6IE1h
cmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+PiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFu
ZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5j
aG90YXJkQGZvc3Muc3QuY29tPgo+PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxh
dW5heUBmb3NzLnN0LmNvbT4KPj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KPj4gVG86IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiAt
LS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20tc29tLmR0c2kgfCAx
ICsKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvbS1zb20uZHRzaSAKPj4gYi9hcmNo
L2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvbS1zb20uZHRzaQo+PiBpbmRleCA4MzQ5Yzkw
OTllMzAxLi44YzQxZjgxOWY3NzY5IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9z
dG0zMm1wMTV4eC1kaGNvbS1zb20uZHRzaQo+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0z
Mm1wMTV4eC1kaGNvbS1zb20uZHRzaQo+PiBAQCAtMTQwLDYgKzE0MCw3IEBAIHBoeTA6IGV0aGVy
bmV0LXBoeUAxIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzZXQtZ3Bpb3MgPSA8
JmdwaW9oIDMgR1BJT19BQ1RJVkVfTE9XPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmVzZXQtYXNzZXJ0LXVzID0gPDUwMD47Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
c2V0LWRlYXNzZXJ0LXVzID0gPDUwMD47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNtc2Ms
ZGlzYWJsZS1lbmVyZ3ktZGV0ZWN0Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRl
cnJ1cHQtcGFyZW50ID0gPCZncGlvaT47Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlu
dGVycnVwdHMgPSA8MTEgSVJRX1RZUEVfTEVWRUxfTE9XPjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IH07Cj4+Cj4gCj4gQXBwbGllZCBvbiBzdG0zMi1uZXh0LiBOb3RlIGl0J2xsIGJlIHNlbmQgdGhy
b3VnaCBhIGZpeGVzIGJyYW5jaCBmb3IgdjUuMTQuCgpOaWNlLCB0aGFuayB5b3UKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
