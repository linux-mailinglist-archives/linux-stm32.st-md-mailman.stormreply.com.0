Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E05409ED4E1
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Dec 2024 19:49:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B1BFC7128A;
	Wed, 11 Dec 2024 18:49:34 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20DBDC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Dec 2024 18:49:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 98E85104858A3; Wed, 11 Dec 2024 19:49:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1733942965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9mka/6c02zAmTI1ZuaE51LtWLUrXwWytHmmGzjhbNio=;
 b=hAQqBamG3pG/60OscjZ3vfrjvNpj8m2HS9Zx7PKHxstCe0cPTn1Kz88hdPZOjjJXnyMXvY
 MyGNptqZYZqEi5F4DE3oHVQcLFeyfti/6HozoSH3JxhY8unkYCNQJ0x6XeVo3BLiGFU0Rl
 hdMdymft3iQw4qqb9Fln6SRL9AFz7dR9BZXchMNErvo6t3j93Gvy50dBFbxSqBIr7NOC0f
 M8B+Xrk2Hav1kYt05ETxgTFfRdvHyz8qfEanldZffnWaXKZPO9/IS5262On9RwKR0KgBHM
 bisr4YXq01XNNtPoi6FvbUjR4WJ+lsCe5OXUrf91kIy0+6ohxZfSXsJfWIzyfg==
Message-ID: <656838f1-40e5-44de-aaba-d8f5ba496af7@denx.de>
Date: Wed, 11 Dec 2024 19:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>,
 linux-watchdog@vger.kernel.org
References: <20240415134903.8084-1-marex@denx.de>
 <49ccec07-4d4c-4582-814b-d4a60adbbfe1@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <49ccec07-4d4c-4582-814b-d4a60adbbfe1@foss.st.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Guenter Roeck <linux@roeck-us.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

T24gMTIvMTEvMjQgMTA6MDIgQU0sIENsZW1lbnQgTEUgR09GRklDIHdyb3RlOgo+IE9uIDQvMTUv
MjQgMTU6NDgsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBUaGUgU1RNMzJNUDE1eHggSVdERyBhZGRz
IHJlZ2lzdGVycyB3aGljaCBwZXJtaXQgdGhpcyBJUCB0byBnZW5lcmF0ZQo+PiBwcmV0aW1lb3V0
IGludGVycnVwdC4gVGhpcyBpbnRlcnJ1cHQgY2FuIGFsc28gYmUgdXNlZCB0byB3YWtlIHRoZSBD
UFUKPj4gZnJvbSBzdXNwZW5kLiBJbXBsZW1lbnQgc3VwcG9ydCBmb3IgZ2VuZXJhdGluZyB0aGlz
IGludGVycnVwdCBhbmQgbGV0Cj4+IHVzZXJzcGFjZSBjb25maWd1cmUgdGhlIHByZXRpbWVvdXQu
IEluIGNhc2UgdGhlIHByZXRpbWVvdXQgaXMgbm90Cj4+IGNvbmZpZ3VyZWQgYnkgdXNlciwgc2V0
IHByZXRpbWVvdXQgdG8gMy80IG9mIHRoZSBXRFQgdGltZW91dCBjeWNsZS4KPj4KPj4gUmV2aWV3
ZWQtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4K
Pj4gVGVzdGVkLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5z
dC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+PiAt
LS0KPj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+
Cj4+IENjOiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4+IENjOiBNYXhpbWUg
Q29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4+IENjOiBXaW0gVmFuIFNlYnJv
ZWNrIDx3aW1AbGludXgtd2F0Y2hkb2cub3JnPgo+PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCj4+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCj4+IENjOiBsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmcKPj4gLS0tCj4+IFYy
OiAtIFN1YnRyYWN0IHRoZSBwcmV0aW1lb3V0IHZhbHVlIGZyb20gdGltZW91dCB2YWx1ZSBiZWZv
cmUgd3JpdGluZyBpdAo+PiDCoMKgwqDCoMKgwqAgaW50byB0aGUgSVdERyBwcmV0aW1lb3V0IHJl
Z2lzdGVyLCBiZWNhdXNlIHRoZSB3YXRjaGRvZyBjb3VudGVyCj4+IMKgwqDCoMKgwqDCoCByZWdp
c3RlciBpcyBjb3VudGluZyBkb3duLCBhbmQgdGhlIHByZXRpbWVvdXQgaW50ZXJydXB0IHRyaWdn
ZXJzCj4+IMKgwqDCoMKgwqDCoCB3aGVuIHdhdGNoZG9nIGNvdW50ZXIgcmVnaXN0ZXIgbWF0Y2hl
cyB0aGUgcHJldGltZW91dCByZWdpc3Rlcgo+PiDCoMKgwqDCoMKgwqAgY29udGVudC4KPj4gwqDC
oMKgwqAgLSBTZXQgZGVmYXVsdCBwcmV0aW1lb3V0IHRvIDMvNCBvZiB0aW1lb3V0IC4KPj4gVjM6
IC0gVXNlIGRldiBpbnN0ZWFkIG9mIHBkZXYtPmRldgo+PiDCoMKgwqDCoCAtIFN3YXAgb3JkZXIg
b2YgcmV0L3JldHVybiAwCj4+IMKgwqDCoMKgIC0gU3BsaXQgdGhpcyBmcm9tIHRoZSBEVCBjaGFu
Z2VzLCB3aGljaCBhcmUgb3J0aG9nb25hbAo+PiDCoMKgwqDCoCAtIFVoLCB0aGlzIHBhdGNoIGdv
dCBzdHVjayBpbiB1cHN0cmVhbWluZyBxdWV1ZSwgc29ycnkKPj4gVjQ6IC0gVXBkYXRlIGNvbW1p
dCBtZXNzYWdlIHRvIG1hdGNoIFYyIGRlZmF1bHQgcHJldGltZW91dCB0byAzLzQKPj4gwqDCoMKg
wqAgLSBBZGQgUkIvVEIgZnJvbSBDbMOpbWVudAo+PiAtLS0KPj4gwqAgZHJpdmVycy93YXRjaGRv
Zy9zdG0zMl9pd2RnLmMgfCA5NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgOTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9zdG0zMl9pd2RnLmMgYi9kcml2ZXJzL3dh
dGNoZG9nLyAKPj4gc3RtMzJfaXdkZy5jCj4+IGluZGV4IDU0MDRlMDM4NzYyMDIuLmQ3MDBlMGQ0
OWJiOTUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5jCj4+ICsr
KyBiL2RyaXZlcnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5jCj4+Cj4+IMKgWy4uLi4uXQo+Pgo+PiAr
Cj4+ICvCoMKgwqAgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPj4gK8KgwqDCoCBp
ZiAoaXJxIDw9IDApCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPiAKPiBIaSBNYXJlaywK
PiAKPiBBZnRlciByZS1ldmFsdWF0aW5nIHRoaXMgcGF0Y2gsIGl0IHNlZW1zIGl0IGxhY2tzIG9m
IGEgZHQtYmluZGluZ3MgCj4gdXBkYXRlIHRoYXQgdGFja2xlcyB0aGUgJ2ludGVycnVwdHMnIHBy
b3BlcnR5IHlvdSBhcmUgYWRkaW5nLgo+IAo+IFRoYXQgc2FpZCwgdGhlIGludGVycnVwdCBsaW5l
IHNob3VsZCBub3QgYmUgbWFuZGF0b3J5IGZvciB0aGUgZHJpdmVyIHRvIAo+IHByb2JlLiBGb3Ig
YmFja3dhcmQgY29tcGF0aWJpbGl0eSB3aXRoIGV4aXN0aW5nIERULCBJIHJlY29tbWVuZCB0byB1
c2UgCj4gdGhlICdwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCknIEFQSSB0byBub3QgZmFpbCBk
dXJpbmcgdGhlIHByb2JlIG9mIAo+IHRoZSBkcml2ZXIuCkkgc2F3IHRoZSBmaXgKW1BBVENIXSB3
YXRjaGRvZzogc3RtMzJfaXdkZzogZml4IERUIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkKVGhhbmsg
eW91IGZvciB0aGF0LiBJJ2xsIHdhaXQgZm9yIFYyIHdpdGggdXBkYXRlZCBjb21taXQgbWVzc2Fn
ZSAuCgpBcyBmYXIgYXMgSSB1bmRlcnN0b29kIHRoZSBwcm9ibGVtLCB0aGUgZ29hbCBpcyB0byBy
ZW1vdmUgZXJyb3IgbWVzc2FnZSAKcHJpbnRlZCBieSB0aGUgcGxhdGZvcm1fZ2V0X2lycSgpIGlu
IGNhc2UgdGhlIERUIGludGVycnVwdCBwcm9wZXJ0eSBpcyAKbWlzc2luZywgYnV0IHRoaXMgaXMg
b25seSBhbiBlc3RoZXRpYyBmaXgsIG5vdCBhIGZ1bmN0aW9uYWwgb25lLCBiZWNhdXNlIAp0aGUg
ZHJpdmVyIHByb2JlcyBldmVuIGlmIHRoZSBpbnRlcnJ1cHRzIERUIHByb3BlcnR5IGlzIG1pc3Np
bmcsIGl0IG9ubHkgCnByaW50cyB0aGUgZXJyb3IgbWVzc2FnZSB3aGlsZSBhdCBpdCwgY29ycmVj
dCA/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
