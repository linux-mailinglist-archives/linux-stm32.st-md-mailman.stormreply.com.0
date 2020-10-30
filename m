Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 416DE2A07EA
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Oct 2020 15:32:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 052F6C3FADF;
	Fri, 30 Oct 2020 14:32:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB05EC3FADA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 14:32:36 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13B61206D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 14:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604068355;
 bh=H73aTFe9brejPhv93HXkvU3N5qlIm5iZsJBrgXyq5lE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lN74zVv+y0LBSHf4rqFdraGgS8IsYFsifgokwyPkvmhZM55UCiMlrIHfZCg1QVVgU
 o9cBQDDIypBFmI+kl3cU8EVY1agALeA8QRQln0r1KkgLuzHVsIyXbLhhl0zaPte5L3
 xp79GoUiFbPxrvKlG0Qw73+iTpB9MyUMSFvjLnCw=
Received: by mail-ot1-f43.google.com with SMTP id f37so5684954otf.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 07:32:35 -0700 (PDT)
X-Gm-Message-State: AOAM533imYdXRDmUzkBr4R/4eI+yQcGRP/jMjMGmpL4YisE0XxSkiseX
 PnvvgYJdLn0H0ksw4MzgP1HqlYNJiYmwgyM5Zg==
X-Google-Smtp-Source: ABdhPJw0/hZSGq4gZvXd4rAw3DV98IaGIIMxB5UmNkdeNZ6nvaElNZ6SNe1QYlhyoHVF6qp+lB3fHjsIxLDfBIhsRlU=
X-Received: by 2002:a9d:62d1:: with SMTP id z17mr1974117otk.192.1604068354225; 
 Fri, 30 Oct 2020 07:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201029095806.10648-1-amelie.delaunay@st.com>
 <20201029095806.10648-2-amelie.delaunay@st.com>
 <20201029154016.GA1917373@bogus>
 <860d5620-4fdf-6e01-9a04-3967d6fcfd6b@st.com>
 <CAKgpwJVGUR9aSfoMkQ=ZXysgqn+H6n0uJbk5W9SeGiB7VXptwQ@mail.gmail.com>
In-Reply-To: <CAKgpwJVGUR9aSfoMkQ=ZXysgqn+H6n0uJbk5W9SeGiB7VXptwQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 30 Oct 2020 09:32:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLbuNTnonH2SqcmF5YF_EB4gTQdS6L3yFKF9pJmaypdKg@mail.gmail.com>
Message-ID: <CAL_JsqLbuNTnonH2SqcmF5YF_EB4gTQdS6L3yFKF9pJmaypdKg@mail.gmail.com>
To: Jun Li <lijun.kernel@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, lkml <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [RESEND PATCH v3 1/4] dt-bindings: connector: add
 power-opmode optional property to usb-connector
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

T24gVGh1LCBPY3QgMjksIDIwMjAgYXQgODo1NSBQTSBKdW4gTGkgPGxpanVuLmtlcm5lbEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gQW1lbGllIERFTEFVTkFZIDxhbWVsaWUuZGVsYXVuYXlAc3QuY29t
PiDkuo4yMDIw5bm0MTDmnIgzMOaXpeWRqOS6lCDkuIrljYgxMjo1MuWGmemBk++8mgo+ID4KPiA+
Cj4gPgo+ID4gT24gMTAvMjkvMjAgNDo0MCBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+IE9u
IFRodSwgT2N0IDI5LCAyMDIwIGF0IDEwOjU4OjAzQU0gKzAxMDAsIEFtZWxpZSBEZWxhdW5heSB3
cm90ZToKPiA+ID4+IFBvd2VyIG9wZXJhdGlvbiBtb2RlIG1heSBkZXBlbmRzIG9uIGhhcmR3YXJl
IGRlc2lnbiwgc28sIGFkZCB0aGUgb3B0aW9uYWwKPiA+ID4+IHByb3BlcnR5IHBvd2VyLW9wbW9k
ZSBmb3IgdXNiLWMgY29ubmVjdG9yIHRvIHNlbGVjdCB0aGUgcG93ZXIgb3BlcmF0aW9uCj4gPiA+
PiBtb2RlIGNhcGFiaWxpdHkuCj4gPiA+Pgo+ID4gPj4gU2lnbmVkLW9mZi1ieTogQW1lbGllIERl
bGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlAc3QuY29tPgo+ID4gPj4gLS0tCj4gPiA+PiAgIC4uLi9i
aW5kaW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sICAgICAgfCAxOCArKysrKysrKysr
KysrKysrKysKPiA+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKPiA+ID4+
Cj4gPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nv
bm5lY3Rvci91c2ItY29ubmVjdG9yLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbAo+ID4gPj4gaW5kZXggNzI4ZjgyZGIw
NzNkLi4yMDBkMTljNjBmZDUgMTAwNjQ0Cj4gPiA+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbAo+ID4gPj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nvbm5lY3Rvci91c2ItY29ubmVjdG9y
LnlhbWwKPiA+ID4+IEBAIC05Myw2ICs5MywyNCBAQCBwcm9wZXJ0aWVzOgo+ID4gPj4gICAgICAg
ICAtIGRldmljZQo+ID4gPj4gICAgICAgICAtIGR1YWwKPiA+ID4+Cj4gPiA+PiArICBwb3dlci1v
cG1vZGU6Cj4gPiA+Cj4gPiA+IEkndmUgYWNrZWQgdGhpcyB2ZXJzaW9uOgo+ID4gPgo+ID4gPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjAxMDIwMDkzNjI3LjI1Njg4NS0yLWJhZGhyaUBn
b29nbGUuY29tCj4KPiBUaGF0IGlzIGEgZGlmZmVyZW50IHByb3BlcnR5IG9ubHkgZm9yIEZSUy4K
Pgo+ID4gPgo+ID4KPiA+IGZycyBpcyB1c2VkIGZvciBGYXN0IFJvbGUgU3dhcCBkZWZpbmVkIGlu
IFVTQiBQRCBzcGVjLgo+ID4gSSB1bmRlcnN0YW5kIGl0IGFsbG93cyB0byBnZXQgdGhlIHNhbWUg
aW5mb3JtYXRpb24gYnV0IEknbSB3b25kZXJpbmcgd2h5Cj4gPiB0aGUgcHJvcGVydHkgbmFtZSBp
cyBsaW1pdGVkIHRvIC1mcnMtIGluIHRoaXMgY2FzZS4gV2hhdCBhYm91dCBhCj4gPiBub24tcG93
ZXIgZGVsaXZlcnkgVVNCLUMgY29ubmVjdG9yID8KPgo+IEl0J3Mgb25seSBmb3IgRlJTLCBGUlMg
aXMgaW4gdGhlIHNjb3BlIG9mIHBvd2VyIGRlbGl2ZXJ5Lgo+Cj4gPgo+ID4gTW9yZW92ZXIsIHBv
d2VyLW9wbW9kZSBwcm9wZXJ0eSBzdXBwb3J0IGlzIGFscmVhZHkgbWVyZ2VkIGluIHR5cGVjIGNs
YXNzOgo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC9kcml2ZXJzL3VzYi90eXBlYy9jbGFzcy5jP2g9djUu
MTAtcmMxJmlkPTEyZjM0NjdiMGQyODM2OWQzYWRkN2EwZGViNjVmZGFjOWI1MDNjOTAKPiA+IGFu
ZCBzdHVzYjE2MHggZHJpdmVyIHVzZXMgaXQgOigKPiA+Cj4gPiBTbywgZG8gSSBuZWVkIHRvIG1v
ZGlmeSBzdHVzYjE2MHggZHJpdmVyIChhbmQgYmluZGluZ3MpIHRvIHRha2UgaW50bwo+ID4gYWNj
b3VudCB0aGlzIFVTQiBQRCBzcGVjaWZpYyBwcm9wZXJ0eT8KPgo+IE9ubHkgVHlwZS1DIHcvbyBQ
RCBuZWVkIHRoaXMgInBvd2VyLW9wbW9kZSIgcHJvcGVydHksIHNvIHRoaXMKPiBwcm9wZXJ0eSBp
cyBzdGlsbCByZXF1aXJlZC4KCllldCB3ZSBoYXZlIHRoZSBzYW1lIHNldCBvZiB2YWx1ZXMuIFNv
IHRoZXJlJ3Mgc29tZXRoaW5nIGNvbW1vbi4uLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
