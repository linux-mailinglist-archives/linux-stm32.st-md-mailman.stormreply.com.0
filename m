Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6AD47FB73
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Dec 2021 10:45:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AD31C5F1F1;
	Mon, 27 Dec 2021 09:45:57 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE9D2C5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Dec 2021 09:45:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZY-0006Y9-6Y; Mon, 27 Dec 2021 10:45:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZR-006u8i-S2; Mon, 27 Dec 2021 10:45:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZQ-0005TD-NW; Mon, 27 Dec 2021 10:45:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Date: Mon, 27 Dec 2021 10:45:03 +0100
Message-Id: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=SxVgmXbyxjhEaCeg8YYh/d1GfTLHDyxY3rU5Ni7M7q8=;
 m=lDJ9oimaumvVMf6LuLDghZ8q49IJcoSs+Sh0dJ8yevo=;
 p=DgO0boJVbutOmTZZAuLM5idPKK18eYUUS1wpOK5FECg=;
 g=8c2a373fe70a4d470ffff53a680efaa861272d9e
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHJiuoACgkQwfwUeK3K7AkFWAgAldZ
 dB/+zZX+l5ITGgWnHQcAJrg+Grz44RoG8IrgeiOl36wHN2Ggc6V0LU5o7FWX607kCD4Z6U1BpQao7
 80ARSmTSk+R0F1nsoxm8J/81ZeVWeJ3sEHsPwjhm3UCCM5moEBL9AO4X/2rxcR8C0VT8UY2gmtEi4
 kB/abt0l0zRSLUN9uSY0B97/7anGy+0vmk1JNlJ8sZKNPdJnKFpPg8P6XioDzbmihCO8JpaXNf39p
 BsOT7hNrtguXrRMVYtduBTJ48YDZVjnVH++VPhBz4SCHFpZfJ80KuQ+SJg2cMXZ8pq6djb+gXA2Ah
 sO8b/MWdPTzYBFwr7u/U+cxc/vEXnYQ==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Raymond Tan <raymond.tan@intel.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Patrick Havelange <patrick.havelange@essensium.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Corbet <corbet@lwn.net>,
 David Lechner <david@lechnology.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 "Felipe Balbi \(Intel\)" <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Oleksij Rempel <linux@rempel-privat.de>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Syed Nayyar Waris <syednwaris@gmail.com>
Subject: [Linux-stm32] [PATCH v2 00/23] counter: cleanups and device
	lifetime fixes
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

SGVsbG8sCgp0aGlzIGlzIHYyIG9mIHRoaXMgc2VyaWVzLCBpdCdzIGdvYWwgaXMgdG8gZml4IHN0
cnVjdCBkZXZpY2UgbGlmZXRpbWUgaXNzdWVzIGFzCnBvaW50ZWQgb3V0IGluIHBhdGNoICMxMy4g
VGhlIHBhdGNoZXMgdXAgdG8gcGF0Y2ggIzEyIGFyZSBvbmx5IHByZXBhdG9yeSBhbmQKY2xlYW51
cCBwYXRjaGVzLiBQYXRjaCAjMTMgcHJvdmlkZXMgdGhlIG5lZWRlZCBmdW5jdGlvbnMgdG8gZml4
IHRoZSBpc3N1ZXMgaW4KYWxsIGRyaXZlcnMgKHBhdGNoZXMgIzE1IHRvICMyMikuIFRoZSBsYXN0
IHBhdGNoIHJlbW92ZXMgdGhlIHRoZW4gdW51c2VkIEFQSQpjYWxscy4KClRoZSBjaGFuZ2VzIGNv
bXBhcmVkIHRvIHYxIGlzIG9ubHkgYnVpbGQgZml4ZXMgdGhhdCBJIG1pc3NlZCB0byBpbmNsdWRl
IGluIHYxLAp0aGV5IHdlcmUgb25seSBpbiBteSB3b3JraW5nIGNvcHkuIEFkZGl0aW9uYWxseSBJ
IGNoYW5nZWQ6CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jb3VudGVyL2NvdW50ZXItY29yZS5jIGIv
ZHJpdmVycy9jb3VudGVyL2NvdW50ZXItY29yZS5jCmluZGV4IGNkYzYwMDRhN2U3Ny4uM2Y3ZGM1
NzE4NDIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2NvdW50ZXIvY291bnRlci1jb3JlLmMKKysrIGIv
ZHJpdmVycy9jb3VudGVyL2NvdW50ZXItY29yZS5jCkBAIC0yNyw3ICsyNyw3IEBAIHN0YXRpYyBE
RUZJTkVfSURBKGNvdW50ZXJfaWRhKTsKIAogc3RydWN0IGNvdW50ZXJfZGV2aWNlX2FsbG9jaGVs
cGVyIHsKIAlzdHJ1Y3QgY291bnRlcl9kZXZpY2UgY291bnRlcjsKLQl1bnNpZ25lZCBsb25nIHBy
aXZkYXRhWzBdOworCXVuc2lnbmVkIGxvbmcgcHJpdmRhdGFbXTsKIH07CiAKIHN0YXRpYyB2b2lk
IGNvdW50ZXJfZGV2aWNlX3JlbGVhc2Uoc3RydWN0IGRldmljZSAqZGV2KQoKVGhlIHN0bTMyLXRp
bWVyLWNudCBkcml2ZXIgd2FzIHVzZWQgdG8gdGVzdAp0aGlzIHNlcmllcywgdGhlIG90aGVyIGRy
aXZlcnMgYXJlIG9ubHkgY29tcGlsZSB0ZXN0ZWQuCgoKVG8gY29tcGxldGUgdGhlIGluZm9ybWF0
aW9uIGZyb20gdGhlIHYxIHRocmVhZDogVGhlcmUgYXJlIGEgZmV3IG1vcmUKaXNzdWVzIEkgZm91
bmQgd2hpbGUgd29ya2luZyBvbiB0aGlzIHBhdGNoIHNldDoKCiAtIDEwNF9RVUFEXzggZGVwZW5k
cyBvbiBYODYsIGJ1dCBjb21waWxlcyBmaW5lIG9uIEFSQ0g9YXJtLiBNYXliZQogICBhZGRpbmcg
c3VwcG9ydCBmb3IgQ09NUElMRV9URVNUIHdvdWxkIGJlIGEgZ29vZCBpZGVhLgoKIC0gMTA0LXF1
YWQtOC5jIHVzZXMgZGV2bV9yZXF1ZXN0X2lycSgpIGFuZCAobm93KSBkZXZtX2NvdW50ZXJfYWRk
KCkuIE9uCiAgIHVuYmluZCBhbiBpcnEgbWlnaHQgYmUgcGVuZGluZyB3aGljaCByZXN1bHRzIGlu
IHF1YWQ4X2lycV9oYW5kbGVyKCkKICAgY2FsbGluZyBjb3VudGVyX3B1c2hfZXZlbnQoKSBmb3Ig
YSBjb3VudGVyIHRoYXQgaXMgYWxyZWFkeQogICB1bnJlZ2lzdGVyZWQuIChUaGUgaXNzdWUgZXhp
c3RzIGFsc28gd2l0aG91dCBteSBjaGFuZ2VzLikKCiAtIEkgdGhpbmsgaW50ZWwtcWVwLmMgbWFr
ZXMgdGhlIGNvdW50ZXIgdW5mdW5jdGlvbmFsIGluCiAgIGludGVsX3FlcF9yZW1vdmUgYmVmb3Jl
IHRoZSBjb3VudGVyIGlzIHVucmVnaXN0ZXJlZC4KCiAtIEkgd29uZGVyIHdoeSBjb3VudGVyIGlz
IGEgYnVzIGFuZCBub3QgYSBjbGFzcyBkZXZpY2UgdHlwZS4gVGhlcmUgaXMKICAgbm8gZHJpdmVy
IHRoYXQgd291bGQgZXZlciBiaW5kIGEgY291bnRlciBkZXZpY2UsIGlzIHRoZXJlPyBTbwogICAv
c3lzL2J1cy9jb3VudGVyL2RyaXZlciBpcyBhbHdheXMgZW1wdHkuCgpEbyB3aGF0ZXZlciB5b3Ug
d2FudCB3aXRoIHRoaXMgbGlzdCwgSSB3b24ndCBhZGRyZXNzIHRoZXNlIGluIHRoZSBuZWFyCmZ1
dHVyZS4KClV3ZSBLbGVpbmUtS8O2bmlnICgyMyk6CiAgY291bnRlcjogVXNlIGNvbnRhaW5lcl9v
ZiBpbnN0ZWFkIG9mIGRydmRhdGEgdG8gdHJhY2sgY291bnRlcl9kZXZpY2UKICBjb3VudGVyOiBm
dG0tcXVhZGRlYzogRHJvcCB1bnVzZWQgcGxhdGZvcm1fc2V0X2RydmRhdGEoKQogIGNvdW50ZXI6
IG1pY3JvY2hpcC10Y2ItY2FwdHVyZTogRHJvcCB1bnVzZWQgcGxhdGZvcm1fc2V0X2RydmRhdGEo
KQogIGNvdW50ZXI6IFByb3ZpZGUgYSB3cmFwcGVyIHRvIGFjY2VzcyBkZXZpY2UgcHJpdmF0ZSBk
YXRhCiAgY291bnRlcjogMTA0LXF1YWQtODogQ29udmVydCB0byBjb3VudGVyX3ByaXYoKSB3cmFw
cGVyCiAgY291bnRlcjogaW50ZXJydXB0LWNudDogQ29udmVydCB0byBjb3VudGVyX3ByaXYoKSB3
cmFwcGVyCiAgY291bnRlcjogbWljcm9jaGlwLXRjYi1jYXB0dXJlOiBDb252ZXJ0IHRvIGNvdW50
ZXJfcHJpdigpIHdyYXBwZXIKICBjb3VudGVyOiBpbnRlbC1xZXA6IENvbnZlcnQgdG8gY291bnRl
cl9wcml2KCkgd3JhcHBlcgogIGNvdW50ZXI6IGZ0bS1xdWFkZGVjOiBDb252ZXJ0IHRvIGNvdW50
ZXJfcHJpdigpIHdyYXBwZXIKICBjb3VudGVyOiB0aS1lcWVwOiBDb252ZXJ0IHRvIGNvdW50ZXJf
cHJpdigpIHdyYXBwZXIKICBjb3VudGVyOiBzdG0zMi1scHRpbWVyLWNudDogQ29udmVydCB0byBj
b3VudGVyX3ByaXYoKSB3cmFwcGVyCiAgY291bnRlcjogc3RtMzItdGltZXItY250OiBDb252ZXJ0
IHRvIGNvdW50ZXJfcHJpdigpIHdyYXBwZXIKICBjb3VudGVyOiBQcm92aWRlIGFsdGVybmF0aXZl
IGNvdW50ZXIgcmVnaXN0cmF0aW9uIGZ1bmN0aW9ucwogIGNvdW50ZXI6IFVwZGF0ZSBkb2N1bWVu
dGF0aW9uIGZvciBuZXcgY291bnRlciByZWdpc3RyYXRpb24gZnVuY3Rpb25zCiAgY291bnRlcjog
MTA0LXF1YWQtODogQ29udmVydCB0byBuZXcgY291bnRlciByZWdpc3RyYXRpb24KICBjb3VudGVy
OiBpbnRlcnJ1cHQtY250OiBDb252ZXJ0IHRvIG5ldyBjb3VudGVyIHJlZ2lzdHJhdGlvbgogIGNv
dW50ZXI6IGludGVsLXFlcDogQ29udmVydCB0byBuZXcgY291bnRlciByZWdpc3RyYXRpb24KICBj
b3VudGVyOiBmdG0tcXVhZGRlYzogQ29udmVydCB0byBuZXcgY291bnRlciByZWdpc3RyYXRpb24K
ICBjb3VudGVyOiBtaWNyb2NoaXAtdGNiLWNhcHR1cmU6IENvbnZlcnQgdG8gbmV3IGNvdW50ZXIg
cmVnaXN0cmF0aW9uCiAgY291bnRlcjogc3RtMzItdGltZXItY250OiBDb252ZXJ0IHRvIG5ldyBj
b3VudGVyIHJlZ2lzdHJhdGlvbgogIGNvdW50ZXI6IHN0bTMyLWxwdGltZXItY250OiBDb252ZXJ0
IHRvIG5ldyBjb3VudGVyIHJlZ2lzdHJhdGlvbgogIGNvdW50ZXI6IHRpLWVxZXA6IENvbnZlcnQg
dG8gbmV3IGNvdW50ZXIgcmVnaXN0cmF0aW9uCiAgY291bnRlcjogcmVtb3ZlIG9sZCBhbmQgbm93
IHVudXNlZCByZWdpc3RyYXRpb24gQVBJCgogRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2dlbmVy
aWMtY291bnRlci5yc3QgfCAgMTAgKy0KIGRyaXZlcnMvY291bnRlci8xMDQtcXVhZC04LmMgICAg
ICAgICAgICAgICAgIHwgIDkzICsrKysrLS0tLS0KIGRyaXZlcnMvY291bnRlci9jb3VudGVyLWNv
cmUuYyAgICAgICAgICAgICAgIHwgMTY4ICsrKysrKysrKysrKystLS0tLS0KIGRyaXZlcnMvY291
bnRlci9mdG0tcXVhZGRlYy5jICAgICAgICAgICAgICAgIHwgIDM3ICsrLS0KIGRyaXZlcnMvY291
bnRlci9pbnRlbC1xZXAuYyAgICAgICAgICAgICAgICAgIHwgIDQ2ICsrLS0tCiBkcml2ZXJzL2Nv
dW50ZXIvaW50ZXJydXB0LWNudC5jICAgICAgICAgICAgICB8ICAzOCArKystLQogZHJpdmVycy9j
b3VudGVyL21pY3JvY2hpcC10Y2ItY2FwdHVyZS5jICAgICAgfCAgNDQgKystLS0KIGRyaXZlcnMv
Y291bnRlci9zdG0zMi1scHRpbWVyLWNudC5jICAgICAgICAgIHwgIDUxICsrKy0tLQogZHJpdmVy
cy9jb3VudGVyL3N0bTMyLXRpbWVyLWNudC5jICAgICAgICAgICAgfCAgNDggKysrLS0tCiBkcml2
ZXJzL2NvdW50ZXIvdGktZXFlcC5jICAgICAgICAgICAgICAgICAgICB8ICA0NyArKystLS0KIGlu
Y2x1ZGUvbGludXgvY291bnRlci5oICAgICAgICAgICAgICAgICAgICAgIHwgIDE1ICstCiAxMSBm
aWxlcyBjaGFuZ2VkLCAzNDggaW5zZXJ0aW9ucygrKSwgMjQ5IGRlbGV0aW9ucygtKQoKCmJhc2Ut
Y29tbWl0OiBhNzkwNGE1Mzg5MzNjNTI1MDk2Y2EyY2NkZTFlNjBkMGVlNjJjMDhlCi0tIAoyLjMz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
