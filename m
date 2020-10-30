Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 253D52A068E
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Oct 2020 14:36:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF40BC3FADA;
	Fri, 30 Oct 2020 13:36:32 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9D71C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 13:36:31 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B132B200006;
 Fri, 30 Oct 2020 13:36:28 +0000 (UTC)
Date: Fri, 30 Oct 2020 14:36:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20201030143627.1a910cbc@xps13>
In-Reply-To: <1604064819-26861-1-git-send-email-christophe.kerello@st.com>
References: <1604064819-26861-1-git-send-email-christophe.kerello@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: richard@nod.at, linux-stm32@st-md-mailman.stormreply.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] mtd: rawnand: stm32_fmc2: fix broken
	ECC
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

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gRnJpLCAzMCBPY3QKMjAyMCAxNDozMzozOSArMDEwMDoKCj4gU2luY2Ug
Y29tbWl0IGQ3MTU3ZmY0OWE1YiAoIm10ZDogcmF3bmFuZDogVXNlIHRoZSBFQ0MgZnJhbWV3b3Jr
IHVzZXIKPiBpbnB1dCBwYXJzaW5nIGJpdHMiKSwgRUNDIGFyZSBicm9rZW4gaW4gRk1DMiBkcml2
ZXIgaW4gY2FzZSBvZgo+IG5hbmQtZWNjLXN0ZXAtc2l6ZSBhbmQgbmFuZC1lY2Mtc3RyZW5ndGgg
YXJlIG5vdCBzZXQgaW4gdGhlIGRldmljZSB0cmVlLgo+IFRvIGF2b2lkIHRoaXMgaXNzdWUsIHRo
ZSBkZWZhdWx0IHNldHRpbmdzIGFyZSBub3cgc2V0IGluCj4gc3RtMzJfZm1jMl9uZmNfYXR0YWNo
X2NoaXAgZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxj
aHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPgo+IEZpeGVzOiBkNzE1N2ZmNDlhNWIgKCJtdGQ6IHJh
d25hbmQ6IFVzZSB0aGUgRUNDIGZyYW1ld29yayB1c2VyIGlucHV0IHBhcnNpbmcgYml0cyIpCj4g
LS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAgLSBtb3ZlIGRlZmF1bHQgRUNDIHNldHRpbmdzIGluIHN0
bTMyX2ZtYzJfbmZjX2F0dGFjaF9jaGlwIGZ1bmN0aW9uLgo+IAo+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9zdG0zMl9mbWMyX25hbmQuYyB8IDE1ICsrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gaW5kZXggYjMxYTU4MS4uNTUwYmRhNCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+ICsrKyBiL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gQEAgLTE3MDgsNiArMTcwOCwxMyBA
QCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfbmZjX2F0dGFjaF9jaGlwKHN0cnVjdCBuYW5kX2NoaXAg
KmNoaXApCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAl9Cj4gIAo+ICsJLyogRGVmYXVsdCBFQ0Mg
c2V0dGluZ3MgaW4gY2FzZSB0aGV5IGFyZSBub3Qgc2V0IGluIHRoZSBkZXZpY2UgdHJlZSAqLwo+
ICsJaWYgKCFjaGlwLT5lY2Muc2l6ZSkKPiArCQljaGlwLT5lY2Muc2l6ZSA9IEZNQzJfRUNDX1NU
RVBfU0laRTsKPiArCj4gKwlpZiAoIWNoaXAtPmVjYy5zdHJlbmd0aCkKPiArCQljaGlwLT5lY2Mu
c3RyZW5ndGggPSBGTUMyX0VDQ19CQ0g4Owo+ICsKPiAgCXJldCA9IG5hbmRfZWNjX2Nob29zZV9j
b25mKGNoaXAsICZzdG0zMl9mbWMyX25mY19lY2NfY2FwcywKPiAgCQkJCSAgIG10ZC0+b29ic2l6
ZSAtIEZNQzJfQkJNX0xFTik7Cj4gIAlpZiAocmV0KSB7Cj4gQEAgLTE3MjcsOCArMTczNCw3IEBA
IHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9uZmNfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCkKPiAgCj4gIAltdGRfc2V0X29vYmxheW91dChtdGQsICZzdG0zMl9mbWMyX25mY19vb2Js
YXlvdXRfb3BzKTsKPiAgCj4gLQlpZiAoY2hpcC0+b3B0aW9ucyAmIE5BTkRfQlVTV0lEVEhfMTYp
Cj4gLQkJc3RtMzJfZm1jMl9uZmNfc2V0X2J1c3dpZHRoXzE2KG5mYywgdHJ1ZSk7Cj4gKwlzdG0z
Ml9mbWMyX25mY19zZXR1cChjaGlwKTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+IEBAIC0xOTUy
LDExICsxOTU4LDYgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX25mY19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJY2hpcC0+b3B0aW9ucyB8PSBOQU5EX0JVU1dJRFRIX0FV
VE8gfCBOQU5EX05PX1NVQlBBR0VfV1JJVEUgfAo+ICAJCQkgTkFORF9VU0VTX0RNQTsKPiAgCj4g
LQkvKiBEZWZhdWx0IEVDQyBzZXR0aW5ncyAqLwo+IC0JY2hpcC0+ZWNjLmVuZ2luZV90eXBlID0g
TkFORF9FQ0NfRU5HSU5FX1RZUEVfT05fSE9TVDsKPiAtCWNoaXAtPmVjYy5zaXplID0gRk1DMl9F
Q0NfU1RFUF9TSVpFOwo+IC0JY2hpcC0+ZWNjLnN0cmVuZ3RoID0gRk1DMl9FQ0NfQkNIODsKPiAt
Cj4gIAkvKiBTY2FuIHRvIGZpbmQgZXhpc3RlbmNlIG9mIHRoZSBkZXZpY2UgKi8KPiAgCXJldCA9
IG5hbmRfc2NhbihjaGlwLCBuYW5kLT5uY3MpOwo+ICAJaWYgKHJldCkKClRoaXMgb3ZlcmFsbCBs
b29rcyB2ZXJ5IGdvb2QgdG8gbWUsIHRoYW5rcyBmb3IgdGhpcyB1cGRhdGUhCgpDaGVlcnMsCk1p
cXXDqGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
