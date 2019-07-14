Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0587168076
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jul 2019 19:23:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C996C991BE
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jul 2019 17:23:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7728C991BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 14 Jul 2019 17:23:17 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 763CF2063F;
 Sun, 14 Jul 2019 17:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563124996;
 bh=GsHSvqL6z/sCzYKnP0NDpupg8hBjmVrWg62QPwDln0c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fWtta0StSeOZebigeRXdyHpnP9KgOGqhcNbtnzlbuWqGkRfVA4q6+XtVo9KKz5TUA
 FH9gXNEbilo9DzXlg3SHw5lAL9ZQTlQW02V6ZaFzv1tq5Zr2mMpoSS0rn+yr1BuoMd
 MLP+pa/sBEHbo/YGn5B4Z8qPKCO2fNDILAV0luw0=
Date: Sun, 14 Jul 2019 18:23:07 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Message-ID: <20190714182307.71df9b00@archlinux>
In-Reply-To: <08b3f84e-cee4-4fbe-031d-721aa9dc53d4@st.com>
References: <20190507091224.17781-1-benjamin.gaignard@st.com>
 <20190711115059.GA7778@icarus>
 <CA+M3ks42Whd=QVQ-4==n5bRJKEwYpQtRHs=gBGEZ_Hr=_8YU1g@mail.gmail.com>
 <20190711121620.GA11661@icarus> <20190714110901.752643ae@archlinux>
 <08b3f84e-cee4-4fbe-031d-721aa9dc53d4@st.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Hartmut Knaack <knaack.h@gmx.de>, Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] IIO: stm32: Remove quadrature related
 functions from trigger driver
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

T24gU3VuLCAxNCBKdWwgMjAxOSAxNTozMjozMyArMDAwMApCZW5qYW1pbiBHQUlHTkFSRCA8YmVu
amFtaW4uZ2FpZ25hcmRAc3QuY29tPiB3cm90ZToKCj4gT24gNy8xNC8xOSAxMjowOSBQTSwgSm9u
YXRoYW4gQ2FtZXJvbiB3cm90ZToKPiA+IE9uIFRodSwgMTEgSnVsIDIwMTkgMjE6MTY6MjAgKzA5
MDAKPiA+IFdpbGxpYW0gQnJlYXRoaXR0IEdyYXkgPHZpbGhlbG0uZ3JheUBnbWFpbC5jb20+IHdy
b3RlOgo+ID4gIAo+ID4+IE9uIFRodSwgSnVsIDExLCAyMDE5IGF0IDAyOjEyOjI3UE0gKzAyMDAs
IEJlbmphbWluIEdhaWduYXJkIHdyb3RlOiAgCj4gPj4+IExlIGpldS4gMTEganVpbC4gMjAxOSDD
oCAxMzo1MSwgV2lsbGlhbSBCcmVhdGhpdHQgR3JheQo+ID4+PiA8dmlsaGVsbS5ncmF5QGdtYWls
LmNvbT4gYSDDqWNyaXQgOiAgCj4gPj4+PiBPbiBUdWUsIE1heSAwNywgMjAxOSBhdCAxMToxMjoy
NEFNICswMjAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZTogIAo+ID4+Pj4+IFF1YWRyYXR1cmUg
ZmVhdHVyZSBpcyBub3cgaG9zdGVkIG9uIGl0IG93biBmcmFtZXdvcmsuCj4gPj4+Pj4gUmVtb3Zl
IHF1YWRyYXR1cmUgcmVsYXRlZCBjb2RlIGZyb20gc3RtMzItdHJpZ2dlciBkcml2ZXIgdG8gYXZv
aWQKPiA+Pj4+PiBjb2RlIGR1cGxpY2F0aW9uIGFuZCBzaW1wbGlmeSB0aGUgQUJJLgo+ID4+Pj4+
Cj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWdu
YXJkQHN0LmNvbT4gIAo+ID4+Pj4gV2hhdCBpcyB0aGUgc3RhdHVzIG9mIHRoaXMgcGF0Y2g/IEFy
ZSB0aGVyZSBhbnkgb2JqZWN0aW9ucyBjdXJyZW50bHkgZm9yCj4gPj4+PiBpdHMgaW5jbHVzaW9u
PyAgCj4gPj4+IFlvdSB3ZXJlIHRoZSBvbmx5IG9uZSBhc2tpbmcgZm9yIG1vcmUgZGV0YWlscyBh
Ym91dCBpdCA6LSkKPiA+Pj4gSWYgeW91IGFncmVlIEkgdGhpbmsgdGhhdCBKb25hdGhhbiBjYW4g
bWVyZ2UgaXQuCj4gPj4+Cj4gPj4+IEJlbmphbWluICAKPiA+Pj4+IFdpbGxpYW0gQnJlYXRoaXR0
IEdyYXkKPiA+Pj4+Cj4gPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+ID4+Pj4gbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKPiA+Pj4+IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4+Pj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsICAKPiA+PiBZZXMs
IEpvbmF0aGFuIHBsZWFzZSBtZXJnZSB0aGlzIGlmIHlvdSBoYXZlIG5vIG9iamVjdGlvbnMsIEkg
aGFkbid0Cj4gPj4gcmVhbGl6ZWQgSSB3YXMgZGVsYXlpbmcgaXQuCj4gPj4KPiA+PiBUaGFuayB5
b3UsCj4gPj4KPiA+PiBXaWxsaWFtIEJyZWF0aGl0dCBHcmF5ICAKPiA+IE9uZSBsYXN0IHRoaW5n
Li4uICBUaGlzIHNlZW1zIHRvIGJlIGEgdXNlcnNwYWNlIEFCSSBjaGFuZ2UuICBXaGF0Cj4gPiBh
cmUgb3VyIHBvdGVudGlhbCBpc3N1ZXMgd2l0aCB1c2VycyBvZiB0aGlzIEFCST8KPiA+Cj4gPiBJ
dCdzIG5vdCB0aGF0IGNvc3RseSB0byBrZWVwIHRoZSBjb2RlLCB0aG91Z2ggZHJvcHBpbmcgdGhl
IGRvY3Mgb3IKPiA+IHB1dHRpbmcgYSBkZXByZWNpYXRlZCBub3RlIGluIHRoZW0gaXMgcHJvYmFi
bHkgYSBnb29kIGlkZWEuICBIZW5jZQo+ID4gSSdtIG5vdCB0b3RhbGx5IGNvbnZpbmNlZCB0aGUg
cmlzayBvZiBhIHJlZ3Jlc3Npb24gaXMgd29ydGggaXQuICAKPiAKPiBBcyBmYXIgSSBrbm93IG5v
Ym9keSB1c2UgdGhpcyBpbnRlcmZhY2UgeWV0IGZvciBtZSB0aGVyZSBpcyBubyByaXNrIHRvIAo+
IHJlbW92ZSB0aGlzIGNvZGUuCj4gCj4gQmVuamFtaW4KSG9wZSB5b3UgYXJlIHJpZ2h0IDopCgpB
cHBsaWVkIHRvIHRoZSB0b2dyZWcgYnJhbmNoIG9mIGlpby5naXQgYW5kIHB1c2hlZCBvdXQgYXMg
dGVzdGluZyBmb3IKdGhlIGF1dG9idWlsZGVycyB0byBwbGF5IHdpdGggaXQuCgpUaGFua3MsCgpK
b25hdGhhbgoKPiAKPiA+Cj4gPiBJZiB3ZSB0aGluayBpdCdzIHRoZSBzb3J0IG9mIGNoYW5nZSBu
byBvbmUgd2lsbCBub3RpY2UsIHRoZW4KPiA+IGZhaXIgZW5vdWdoIHdlJ2xsIGdpdmUgaXQgYSBn
byBhbmQgY3Jvc3Mgb3VyIGZpbmdlcnMuCj4gPgo+ID4gVGhhbmtzLAo+ID4KPiA+IEpvbmF0aGFu
Cj4gPgo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
