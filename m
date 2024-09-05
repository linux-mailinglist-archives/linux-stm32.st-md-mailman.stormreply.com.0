Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E88E596DA8C
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 15:41:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98636C7801A;
	Thu,  5 Sep 2024 13:41:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9B02C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 13:41:31 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 938C988BF2;
 Thu,  5 Sep 2024 15:41:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1725543691;
 bh=pswdXcqPStl0HoZQrt/FxfgDt4teRCM2NhpZPLEY5rc=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=ZAQCHdNnEwIQcjtofN1rEt3GQEmMSXTSz2pdfO5r/STfUzh56l1xIoEAfEwkxM2Yi
 Hgkslb9S8R71lh/sLVxVtD4nFJTql2/6ku56g5OTA7pHB7YUDrIwUU5a7CnW8neJ9l
 pyYyCaUmEIfB0NS1RieX0WmcBpBZWkj4tLV3XRu2/obnezsQW/toSoaRlLll8+zVqC
 VV6OGKBtThxuK3U8mfgXn1agy/iu37fKtAoq9P5pFu0Nd6wCj04hce2FGs6J6pc3p8
 7m9bT8WK5bqKj+JdYtVQtQdlrNAdASDYaOEimGkwNkYbMNQpZYWoy+Xeqs2cw8k9e3
 0KgzZJOq6FMjA==
Message-ID: <4386a9c2-bf9e-4612-a928-dddb1adb9571@denx.de>
Date: Thu, 5 Sep 2024 15:12:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
To: linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20240415134903.8084-1-marex@denx.de>
 <f93b5a80-33fb-4708-ab86-6b28f626a186@denx.de>
Content-Language: en-US
In-Reply-To: <f93b5a80-33fb-4708-ab86-6b28f626a186@denx.de>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4] watchdog: stm32_iwdg: Add pretimeout
	support
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

T24gNi8yMy8yNCA4OjE4IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA0LzE1LzI0IDM6NDgg
UE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBUaGUgU1RNMzJNUDE1eHggSVdERyBhZGRzIHJlZ2lz
dGVycyB3aGljaCBwZXJtaXQgdGhpcyBJUCB0byBnZW5lcmF0ZQo+PiBwcmV0aW1lb3V0IGludGVy
cnVwdC4gVGhpcyBpbnRlcnJ1cHQgY2FuIGFsc28gYmUgdXNlZCB0byB3YWtlIHRoZSBDUFUKPj4g
ZnJvbSBzdXNwZW5kLiBJbXBsZW1lbnQgc3VwcG9ydCBmb3IgZ2VuZXJhdGluZyB0aGlzIGludGVy
cnVwdCBhbmQgbGV0Cj4+IHVzZXJzcGFjZSBjb25maWd1cmUgdGhlIHByZXRpbWVvdXQuIEluIGNh
c2UgdGhlIHByZXRpbWVvdXQgaXMgbm90Cj4+IGNvbmZpZ3VyZWQgYnkgdXNlciwgc2V0IHByZXRp
bWVvdXQgdG8gMy80IG9mIHRoZSBXRFQgdGltZW91dCBjeWNsZS4KPj4KPj4gUmV2aWV3ZWQtYnk6
IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPj4gVGVz
dGVkLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+PiAtLS0KPj4g
Q2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4+IENj
OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4+IENjOiBNYXhpbWUgQ29xdWVs
aW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4+IENjOiBXaW0gVmFuIFNlYnJvZWNrIDx3
aW1AbGludXgtd2F0Y2hkb2cub3JnPgo+PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCj4+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cj4+IENjOiBsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmcKPj4gLS0tCj4+IFYyOiAtIFN1
YnRyYWN0IHRoZSBwcmV0aW1lb3V0IHZhbHVlIGZyb20gdGltZW91dCB2YWx1ZSBiZWZvcmUgd3Jp
dGluZyBpdAo+PiDCoMKgwqDCoMKgwqAgaW50byB0aGUgSVdERyBwcmV0aW1lb3V0IHJlZ2lzdGVy
LCBiZWNhdXNlIHRoZSB3YXRjaGRvZyBjb3VudGVyCj4+IMKgwqDCoMKgwqDCoCByZWdpc3RlciBp
cyBjb3VudGluZyBkb3duLCBhbmQgdGhlIHByZXRpbWVvdXQgaW50ZXJydXB0IHRyaWdnZXJzCj4+
IMKgwqDCoMKgwqDCoCB3aGVuIHdhdGNoZG9nIGNvdW50ZXIgcmVnaXN0ZXIgbWF0Y2hlcyB0aGUg
cHJldGltZW91dCByZWdpc3Rlcgo+PiDCoMKgwqDCoMKgwqAgY29udGVudC4KPj4gwqDCoMKgwqAg
LSBTZXQgZGVmYXVsdCBwcmV0aW1lb3V0IHRvIDMvNCBvZiB0aW1lb3V0IC4KPj4gVjM6IC0gVXNl
IGRldiBpbnN0ZWFkIG9mIHBkZXYtPmRldgo+PiDCoMKgwqDCoCAtIFN3YXAgb3JkZXIgb2YgcmV0
L3JldHVybiAwCj4+IMKgwqDCoMKgIC0gU3BsaXQgdGhpcyBmcm9tIHRoZSBEVCBjaGFuZ2VzLCB3
aGljaCBhcmUgb3J0aG9nb25hbAo+PiDCoMKgwqDCoCAtIFVoLCB0aGlzIHBhdGNoIGdvdCBzdHVj
ayBpbiB1cHN0cmVhbWluZyBxdWV1ZSwgc29ycnkKPj4gVjQ6IC0gVXBkYXRlIGNvbW1pdCBtZXNz
YWdlIHRvIG1hdGNoIFYyIGRlZmF1bHQgcHJldGltZW91dCB0byAzLzQKPj4gwqDCoMKgwqAgLSBB
ZGQgUkIvVEIgZnJvbSBDbMOpbWVudAo+IAo+IEhpLAo+IAo+IEFyZSB0aGVyZSBzdGlsbCBhbnkg
b3BlbiB0b3BpY3Mgd2l0aCB0aGlzIHBhdGNoID8KCkFueXRoaW5nID8KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
