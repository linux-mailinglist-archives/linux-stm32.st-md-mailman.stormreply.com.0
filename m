Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6A121047D
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Jul 2020 09:09:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15911C36B25;
	Wed,  1 Jul 2020 07:09:13 +0000 (UTC)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 742A6C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2020 09:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id EB070607400F;
 Tue, 30 Jun 2020 11:39:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id qd6xqziz9yTM; Tue, 30 Jun 2020 11:39:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 786BA6074029;
 Tue, 30 Jun 2020 11:39:37 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UNVw8191GTR5; Tue, 30 Jun 2020 11:39:37 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 423E0607400F;
 Tue, 30 Jun 2020 11:39:37 +0200 (CEST)
Date: Tue, 30 Jun 2020 11:39:37 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <1839269888.74591.1593509977137.JavaMail.zimbra@nod.at>
In-Reply-To: <e30abadc-83c0-f010-be36-fe8d14c4aea9@st.com>
References: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
 <1591975362-22009-5-git-send-email-christophe.kerello@st.com>
 <CAFLxGvzfh1Qa_gM9bZAxaoCbO6xCoNdaPN=Ea20Up_zPVgjugw@mail.gmail.com>
 <e30abadc-83c0-f010-be36-fe8d14c4aea9@st.com>
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: memory: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driver
Thread-Index: IyChESkmAt61iUEj3iffmldxiXkByg==
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:09:11 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree <devicetree@vger.kernel.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, arnd@linaro.org
Subject: Re: [Linux-stm32] [PATCH v5 4/6] memory: stm32-fmc2-ebi: add STM32
 FMC2 EBI controller driver
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNocmlzdG9waGUgS2VyZWxs
byIgPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+Cj4gQW46ICJSaWNoYXJkIFdlaW5iZXJnZXIi
IDxyaWNoYXJkLndlaW5iZXJnZXJAZ21haWwuY29tPgo+IENDOiAiTWlxdWVsIFJheW5hbCIgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgIlZp
Z25lc2ggUmFnaGF2ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LAo+ICJSb2IgSGVycmluZyIgPHJv
YmgrZHRAa2VybmVsLm9yZz4sICJNYXJrIFJ1dGxhbmQiIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4s
IGFybmRAbGluYXJvLm9yZywgIkFsZXhhbmRyZSBUb3JndWUiCj4gPGFsZXhhbmRyZS50b3JndWVA
c3QuY29tPiwgIk1hcmVrIFZhc3V0IiA8bWFyZXhAZGVueC5kZT4sICJkZXZpY2V0cmVlIiA8ZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+LCAibGludXgta2VybmVsIgo+IDxsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnPiwgImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQu
b3JnPiwgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IEdlc2VuZGV0
OiBEaWVuc3RhZywgMzAuIEp1bmkgMjAyMCAxMTozNTozOAo+IEJldHJlZmY6IFJlOiBbUEFUQ0gg
djUgNC82XSBtZW1vcnk6IHN0bTMyLWZtYzItZWJpOiBhZGQgU1RNMzIgRk1DMiBFQkkgY29udHJv
bGxlciBkcml2ZXIKCj4gSGkgUmljaGFyZCwKPiAKPiBPbiA2LzMwLzIwIDExOjEzIEFNLCBSaWNo
YXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4+IE9uIEZyaSwgSnVuIDEyLCAyMDIwIGF0IDU6MjQgUE0g
Q2hyaXN0b3BoZSBLZXJlbGxvCj4+IDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPiB3cm90ZToK
Pj4+Cj4+PiBUaGUgZHJpdmVyIGFkZHMgdGhlIHN1cHBvcnQgZm9yIHRoZSBTVE1pY3JvZWxlY3Ry
b25pY3MgRk1DMiBFQkkgY29udHJvbGxlcgo+Pj4gZm91bmQgb24gU1RNMzJNUCBTT0NzLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxv
QHN0LmNvbT4KPj4+IC0tLQo+Pj4gKyAgICAgICBpZiAoIUlTX0VSUihyc3RjKSkgewo+Pj4gKyAg
ICAgICAgICAgICAgIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KHJzdGMpOwo+Pj4gKyAgICAgICAgICAg
ICAgIHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocnN0Yyk7Cj4+IAo+PiBTaG91bGRuJ3QgdGhlcmUg
YmUgYSBzbWFsbCBkZWxheSBiZXR3ZWVuIGFzc2VydCBhbmQgZGVhc3NlcnQ/Cj4+IE90aGVyIHRo
YW4gdGhhdCB0aGUgY29kZSBsb29rcyBnb29kIHRvIG1lLgo+PiAKPiAKPiBFdmVuIGlmIEkgaGF2
ZSBjdXJyZW50bHkgbm90IG1ldCBhbnkgaXNzdWUsIEkgd2lsbCBhZGQgYSB1ZGVsYXkoMikgdG8g
YmUKPiBzYWZlLiBJdCB3aWxsIGJlIHBhcnQgb2YgdjYuCgpXZWxsLCBpZiBpdCB3b3JrcyBhbmQg
eW91IGFyZSBzdXJlLCBwbGVhc2UgZ28gZm9yIGl0LiBMaWtlIEkgc2FpZCwgSSdtIG5vIGV4cGVy
dCBpbgp0aGlzLgpJIGp1c3Qgbm90aWNlZCB0aGF0IG90aGVyIHVzZXJzIGFkZCBhIGRlbGF5IGFu
ZCB3b25kZXJlZC4KClRoYW5rcywKLy9yaWNoYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
