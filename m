Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8A029FAEF
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Oct 2020 02:55:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D3C6C3FAD5;
	Fri, 30 Oct 2020 01:55:08 +0000 (UTC)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4841CC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 01:55:06 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id g10so1879764vsi.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 18:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O2Bfrh7e0SfwIe9SuDWvIR9uYNcLv1ssbiRxQwdN9iY=;
 b=Gc3dAipqASgtOIRGmBamjdZdmFXFKNzCfui1qkk4ipAQzwCWNx85nsFPYD/G+iTl67
 ZRiIqzmIlCmRwCTxaJWss7/xvNNqnAwcUaUY78ApKMH0/zCjpXP3v59ZGkSvbtXAqw1T
 tN1uU+raZBm9jk4OJJgTih0SCDjZG2dPft1DFtPgdQYzeI3rBmk0YbrCadCWMeX4xJy7
 R1/qKDqGy+fCMNmbOBsNd5uN3FCVu/epI/GXhjHzgb7hDdeTJ3nO7dGmyJBpv3mIQLXl
 4tbFCRTXf9lNMapnrJW5EDGxRVhM+fT+6NNgaZJ6bYxmN+ZNdiwp3XGbZbivshcUQg54
 4iWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O2Bfrh7e0SfwIe9SuDWvIR9uYNcLv1ssbiRxQwdN9iY=;
 b=WJ6nSNHeCS1zeML7PTJe134/YS+fTP44LdJa7yUG3EZGTnBvecWiJogYCGaagabBIt
 SL6JTYQNrBwEsLUMMzq1se/wThmJKGDQ71LOSJiJM76DEokMURpVZQwCVr6bAL50/3lX
 MV4E2E15dPLFTiV+2s++Cky0hdDf0te/sEKMvBrEzXsdVhn3gDjs3uG85J5ujlajrTSN
 lkCslmNZB8PnMj63LMKdrGTyimTUSSX/KgGZR/+3szwzGx/dAu4hy/N0CzmYP0eqFdmo
 XZL2E38xTOM7BXIy1Kjxps5ztQMRG219XMrefZmb61MzlZRyyTmv3kmfjGZbcWyJAGkw
 9FEA==
X-Gm-Message-State: AOAM5335zpxS4gOr9emqqbgPibKlepCWnwFYhyP8RGX4ZHVh6i9Xh4or
 3DGwqaShXQ0wt+p9uq/EEbZ09d81RA1i/NRJRiQ=
X-Google-Smtp-Source: ABdhPJxsQ56AGU/3+xrQVJ8jrJpxHBC0lKnDYdah7PmyLCy34Sy+c/46LUL7dNf6w9JFX+plUXdhpk2L/oikjHAxHJQ=
X-Received: by 2002:a67:b647:: with SMTP id e7mr6030927vsm.26.1604022905164;
 Thu, 29 Oct 2020 18:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201029095806.10648-1-amelie.delaunay@st.com>
 <20201029095806.10648-2-amelie.delaunay@st.com>
 <20201029154016.GA1917373@bogus>
 <860d5620-4fdf-6e01-9a04-3967d6fcfd6b@st.com>
In-Reply-To: <860d5620-4fdf-6e01-9a04-3967d6fcfd6b@st.com>
From: Jun Li <lijun.kernel@gmail.com>
Date: Fri, 30 Oct 2020 09:54:54 +0800
Message-ID: <CAKgpwJVGUR9aSfoMkQ=ZXysgqn+H6n0uJbk5W9SeGiB7VXptwQ@mail.gmail.com>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Cc: Rob Herring <robh@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, lkml <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

QW1lbGllIERFTEFVTkFZIDxhbWVsaWUuZGVsYXVuYXlAc3QuY29tPiDkuo4yMDIw5bm0MTDmnIgz
MOaXpeWRqOS6lCDkuIrljYgxMjo1MuWGmemBk++8mgo+Cj4KPgo+IE9uIDEwLzI5LzIwIDQ6NDAg
UE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gT24gVGh1LCBPY3QgMjksIDIwMjAgYXQgMTA6NTg6
MDNBTSArMDEwMCwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgo+ID4+IFBvd2VyIG9wZXJhdGlvbiBt
b2RlIG1heSBkZXBlbmRzIG9uIGhhcmR3YXJlIGRlc2lnbiwgc28sIGFkZCB0aGUgb3B0aW9uYWwK
PiA+PiBwcm9wZXJ0eSBwb3dlci1vcG1vZGUgZm9yIHVzYi1jIGNvbm5lY3RvciB0byBzZWxlY3Qg
dGhlIHBvd2VyIG9wZXJhdGlvbgo+ID4+IG1vZGUgY2FwYWJpbGl0eS4KPiA+Pgo+ID4+IFNpZ25l
ZC1vZmYtYnk6IEFtZWxpZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1bmF5QHN0LmNvbT4KPiA+PiAt
LS0KPiA+PiAgIC4uLi9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sICAgICAg
fCAxOCArKysrKysrKysrKysrKysrKysKPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Nvbm5lY3Rvci91c2ItY29ubmVjdG9yLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbAo+ID4+IGluZGV4IDcy
OGY4MmRiMDczZC4uMjAwZDE5YzYwZmQ1IDEwMDY0NAo+ID4+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sCj4gPj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nvbm5lY3Rvci91c2ItY29ubmVj
dG9yLnlhbWwKPiA+PiBAQCAtOTMsNiArOTMsMjQgQEAgcHJvcGVydGllczoKPiA+PiAgICAgICAg
IC0gZGV2aWNlCj4gPj4gICAgICAgICAtIGR1YWwKPiA+Pgo+ID4+ICsgIHBvd2VyLW9wbW9kZToK
PiA+Cj4gPiBJJ3ZlIGFja2VkIHRoaXMgdmVyc2lvbjoKPiA+Cj4gPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjAxMDIwMDkzNjI3LjI1Njg4NS0yLWJhZGhyaUBnb29nbGUuY29tCgpUaGF0
IGlzIGEgZGlmZmVyZW50IHByb3BlcnR5IG9ubHkgZm9yIEZSUy4KCj4gPgo+Cj4gZnJzIGlzIHVz
ZWQgZm9yIEZhc3QgUm9sZSBTd2FwIGRlZmluZWQgaW4gVVNCIFBEIHNwZWMuCj4gSSB1bmRlcnN0
YW5kIGl0IGFsbG93cyB0byBnZXQgdGhlIHNhbWUgaW5mb3JtYXRpb24gYnV0IEknbSB3b25kZXJp
bmcgd2h5Cj4gdGhlIHByb3BlcnR5IG5hbWUgaXMgbGltaXRlZCB0byAtZnJzLSBpbiB0aGlzIGNh
c2UuIFdoYXQgYWJvdXQgYQo+IG5vbi1wb3dlciBkZWxpdmVyeSBVU0ItQyBjb25uZWN0b3IgPwoK
SXQncyBvbmx5IGZvciBGUlMsIEZSUyBpcyBpbiB0aGUgc2NvcGUgb2YgcG93ZXIgZGVsaXZlcnku
Cgo+Cj4gTW9yZW92ZXIsIHBvd2VyLW9wbW9kZSBwcm9wZXJ0eSBzdXBwb3J0IGlzIGFscmVhZHkg
bWVyZ2VkIGluIHR5cGVjIGNsYXNzOgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvZHJpdmVycy91c2IvdHlw
ZWMvY2xhc3MuYz9oPXY1LjEwLXJjMSZpZD0xMmYzNDY3YjBkMjgzNjlkM2FkZDdhMGRlYjY1ZmRh
YzliNTAzYzkwCj4gYW5kIHN0dXNiMTYweCBkcml2ZXIgdXNlcyBpdCA6KAo+Cj4gU28sIGRvIEkg
bmVlZCB0byBtb2RpZnkgc3R1c2IxNjB4IGRyaXZlciAoYW5kIGJpbmRpbmdzKSB0byB0YWtlIGlu
dG8KPiBhY2NvdW50IHRoaXMgVVNCIFBEIHNwZWNpZmljIHByb3BlcnR5PwoKT25seSBUeXBlLUMg
dy9vIFBEIG5lZWQgdGhpcyAicG93ZXItb3Btb2RlIiBwcm9wZXJ0eSwgc28gdGhpcwpwcm9wZXJ0
eSBpcyBzdGlsbCByZXF1aXJlZC4KCkxpIEp1bgoKPgo+IFJlZ2FyZHMsCj4gQW1lbGllCj4KPiA+
IFBsZWFzZSBhY2sgaXQgaWYgeW91IGFyZSBva2F5IHdpdGggaXQuCj4gPgo+ID4gUm9iCj4gPgo+
ID4KPiA+PiArICAgIGRlc2NyaXB0aW9uOiBEZXRlcm1pbmVzIHRoZSBwb3dlciBvcGVyYXRpb24g
bW9kZSB0aGF0IHRoZSBUeXBlIEMgY29ubmVjdG9yCj4gPj4gKyAgICAgIHdpbGwgc3VwcG9ydCBh
bmQgd2lsbCBhZHZlcnRpc2UgdGhyb3VnaCBDQyBwaW5zIHdoZW4gaXQgaGFzIG5vIHBvd2VyCj4g
Pj4gKyAgICAgIGRlbGl2ZXJ5IHN1cHBvcnQuCj4gPj4gKyAgICAgIC0gImRlZmF1bHQiIGNvcnJl
c3BvbmRzIHRvIGRlZmF1bHQgVVNCIHZvbHRhZ2UgYW5kIGN1cnJlbnQgZGVmaW5lZCBieSB0aGUK
PiA+PiArICAgICAgICBVU0IgMi4wIGFuZCBVU0IgMy4yIHNwZWNpZmljYXRpb25zLCA1ViA1MDBt
QSBmb3IgVVNCIDIuMCBwb3J0cyBhbmQKPiA+PiArICAgICAgICA1ViA5MDBtQSBvciAxNTAwbUEg
Zm9yIFVTQiAzLjIgcG9ydHMgaW4gc2luZ2xlLWxhbmUgb3IgZHVhbC1sYW5lCj4gPj4gKyAgICAg
ICAgb3BlcmF0aW9uIHJlc3BlY3RpdmVseS4KPiA+PiArICAgICAgLSAiMS41QSIgYW5kICIzLjBB
IiwgNVYgMS41QSBhbmQgNVYgMy4wQSByZXNwZWN0aXZlbHksIGFzIGRlZmluZWQgaW4gVVNCCj4g
Pj4gKyAgICAgICAgVHlwZS1DIENhYmxlIGFuZCBDb25uZWN0b3Igc3BlY2lmaWNhdGlvbiwgd2hl
biBQb3dlciBEZWxpdmVyeSBpcyBub3QKPiA+PiArICAgICAgICBzdXBwb3J0ZWQuCj4gPj4gKyAg
ICBhbGxPZjoKPiA+PiArICAgICAgLSAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sI2RlZmluaXRp
b25zL3N0cmluZwo+ID4+ICsgICAgZW51bToKPiA+PiArICAgICAgLSBkZWZhdWx0Cj4gPj4gKyAg
ICAgIC0gMS41QQo+ID4+ICsgICAgICAtIDMuMEEKPiA+PiArCj4gPj4gICAgICMgVGhlIGZvbGxv
d2luZyBhcmUgb3B0aW9uYWwgcHJvcGVydGllcyBmb3IgInVzYi1jLWNvbm5lY3RvciIgd2l0aCBw
b3dlcgo+ID4+ICAgICAjIGRlbGl2ZXJ5IHN1cHBvcnQuCj4gPj4gICAgIHNvdXJjZS1wZG9zOgo+
ID4+IC0tCj4gPj4gMi4xNy4xCj4gPj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
