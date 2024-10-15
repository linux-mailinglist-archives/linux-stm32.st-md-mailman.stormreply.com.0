Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A896E99EFF1
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 16:45:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A02FC78030;
	Tue, 15 Oct 2024 14:45:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A42DDC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 14:45:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 07CDC5C5AB9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 14:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE74C4AF09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729003509;
 bh=HcTOrdcxs92yz13WTmjFYQWdwbrGivh2PfWBFaqAVa8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lv68rJqM4qhNv47qSFj3wauONMjnwRwqE6iTV0SCjLpPJXJ5OpydnGW90KR6qL6iT
 49PRUynad771L54n22W+SXslz1yns5q7GIrnDDBYrZBRSFJTrqOM3KXIQQEHLtZVD9
 kZS9vlUwPQfmhGOD/3GMkQG8y5JuzH4Rwk03l5GK1iJpc+oPLdPviU8InH3Td7miTN
 B9L2B4T1Db8QP4ix1FbH3LgLWmjdny2u97MdNa9dt6bugcgS0G6pDBGyh2HOywe+tq
 kITJEIShAhrQ35uIkpPFd0UDpLq1+K4PQzjVB4A5gQf+bdiTNXEQ0LFrcFDg+Wdwev
 H+PEljKFOEDyQ==
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539e4b7409fso3222908e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 07:45:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXFmzbvh3yWXOhuetEqGI35irgW0sDRM2/5H2upc7dufUKVpxBE54NBv++3mwd1ejj6m1LkFRfnwkMZVA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz1Z0I6CN8ywuOORdHFd1XkuuvTPdYX5hbqgp/tA7APFAxD20d/
 Uxr0lV/9xWdZot/QEVBtEX0t+D+nzzvSyONtvjshAWT8L98p9kDFGTPpFTgH5qJseaLb+chRewf
 FHEJ3G8+3ULCs7uO4SW07NePK+t4=
X-Google-Smtp-Source: AGHT+IEQF2v9j6i4yu+3HsOsvdSTSU8aXXA0XaJrl3VwhE9kbJn/uTGwWFbBRQ/Jd6awHUdpNb9iGRphdoRWBmT1gSQ=
X-Received: by 2002:a05:6512:3b96:b0:539:e453:d90c with SMTP id
 2adb3069b0e04-539e453da3amr4092913e87.2.1729003507421; Tue, 15 Oct 2024
 07:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com>
 <Zw5D2aTkkUVOK89g@J2N7QTR9R3>
 <CACRpkdY79nbBoaHe6ijuyJS9dDduNw_sv1J90pz121YDgCvC3Q@mail.gmail.com>
 <Zw51fhCkmCYrTOeV@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEcLD3PWd-9osjo9AOe5Jg-NMOmJ8afB_x7VeboueLoeQ@mail.gmail.com>
 <Zw59x0LVS-kvs9Jv@J2N7QTR9R3.cambridge.arm.com>
In-Reply-To: <Zw59x0LVS-kvs9Jv@J2N7QTR9R3.cambridge.arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 15 Oct 2024 16:44:56 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEnhHkxywh8TH1i=fmyAR8cXZ8D-rvV43X-N7GpCf2Axw@mail.gmail.com>
Message-ID: <CAMj1kXEnhHkxywh8TH1i=fmyAR8cXZ8D-rvV43X-N7GpCf2Axw@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] Crash on armv7-a using KASAN
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

T24gVHVlLCAxNSBPY3QgMjAyNCBhdCAxNjozNSwgTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRA
YXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIE9jdCAxNSwgMjAyNCBhdCAwNDoyMjoyMFBNICsw
MjAwLCBBcmQgQmllc2hldXZlbCB3cm90ZToKPiA+IE9uIFR1ZSwgMTUgT2N0IDIwMjQgYXQgMTY6
MDAsIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBUdWUsIE9jdCAxNSwgMjAyNCBhdCAwMzo1MTowMlBNICswMjAwLCBMaW51cyBXYWxsZWlq
IHdyb3RlOgo+ID4gPiA+IE9uIFR1ZSwgT2N0IDE1LCAyMDI0IGF0IDEyOjI44oCvUE0gTWFyayBS
dXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiBPbiBNb24sIE9j
dCAxNCwgMjAyNCBhdCAwMzoxOTo0OVBNICswMjAwLCBDbGVtZW50IExFIEdPRkZJQyB3cm90ZToK
PiA+ID4gPgo+ID4gPiA+ID4gSSB0aGluayB3aGF0J3MgaGFwcGVuaW5nIGhlcmUgaXMgdGhhdCB3
aGVuIHN3aXRjaGluZyBmcm9tIHByZXYgdG8gbmV4dAo+ID4gPiA+ID4gaW4gdGhlIHNjaGVkdWxl
ciwgd2Ugc3dpdGNoIHRvIG5leHQncyBtbSBiZWZvcmUgd2UgYWN0dWFsbHkgc3dpdGNoIHRvCj4g
PiA+ID4gPiBuZXh0J3MgcmVnaXN0ZXIgc3RhdGUsIGFuZCB0aGVyZSdzIGEgdHJhbnNpZW50IHdp
bmRvdyB3aGVyZSBwcmV2IGlzCj4gPiA+ID4gPiBleGVjdXRlZCB1c2luZyBuZXh0J3MgbW0uIEFG
QUlDVCB3ZSBkb24ndCBtYXAgcHJldidzIEtBU0FOIHN0YWNrIHNoYWRvdwo+ID4gPiA+ID4gaW50
byBuZXh0J3MgbW0gYW55d2hlcmUsIGFuZCBzbyBpbmxpbmVkIEtBU0FOX1NUQUNLIGNoZWNrcyBy
ZWN1cnNpdmVseQo+ID4gPiA+ID4gZmF1bHQgb24gdGhpcyB1bnRpbCB3ZSBzd2l0Y2ggdG8gdGhl
IG92ZXJmbG93IHN0YWNrLgo+Cj4gWy4uLl0KPgo+ID4gPiA+IFllYWggaXQgbG9va3MgbGlrZSBh
IHNwb3Qtb24gaWRlbnRpZmljYXRpb24gb2YgdGhlIHByb2JsZW0sIEkgY2FuIHRyeSB0bwo+ID4g
PiA+IHRoaW5rIGFib3V0IGhvdyB3ZSBjb3VsZCBmaXggdGhpcyBpZiBJIGNhbiByZXByb2R1Y2Ug
aXQsIEkga2VlcCB0cnlpbmcKPiA+ID4gPiB0byBwcm92b2tlIHRoZSBjcmFzaCA6Lwo+ID4gPgo+
ID4gPiBJdCdzIGEgYml0IGdyb3R0eSAtLSBBRkFJQ1QgeW91J2QgZWl0aGVyIG5lZWQgdG8gcHJl
ZmF1bHQgaW4gdGhlCj4gPiA+IHNwZWNpZmljIHBhcnQgb2YgdGhlIHZtYWxsb2Mgc3BhY2Ugd2hl
biBzd2l0Y2hpbmcgdGFza3MsIG9yIHdlJ2QgbmVlZCB0bwo+ID4gPiBwcmVhbGxvY2F0ZSBhbGwg
dGhlIHNoYXJlZCB2bWFsbG9jIHRhYmxlcyBhdCB0aGUgc3RhcnQgb2YgdGltZSBzbyB0aGF0Cj4g
PiA+IHRoZXkncmUgYWx3YXlzIHVwLXRvLWRhdGUuCj4gPiA+Cj4gPiA+IFdoaWxlIHdlIGNvdWxk
IGRpc2FibGUgS0FTQU5fU1RBQ0ssIHRoYXQncyBvbmx5IGdvaW5nIHRvIG1hc2sgdGhlCj4gPiA+
IHByb2JsZW0gdW50aWwgdGhpcyBoYXBwZW5zIGZvciBhbnkgb3RoZXIgdm1hbGxvYyBzaGFkb3cu
Li4KPiA+Cj4gPiBJcyB0aGUgb3RoZXIgdm1hbGxvYyBzaGFkb3cgbm90IGNvdmVyZWQgYnkgdGhl
IG9yZGluYXJ5IG9uLWRlbWFuZCBmYXVsdGluZz8KPgo+IEl0IGRlcGVuZHMgb24gd2hhdCB0aGUg
dm1hbGxvYyBtZW1vcnkgaXMgdXNlZCBmb3I7IGlmIGl0J3MgYW55dGhpbmcgZWxzZQo+IHVzZWQg
aW4gdGhlIGZhdWx0IGhhbmRsaW5nIHBhdGgsIHRoYXQnbGwgZmF1bHQgcmVjdXJzaXZlbHksIGFu
ZCBpdCdzCj4gcG9zc2libGUgdGhhdCdsbCBoYXBwZW4gaW5kaXJlY3RseSB2aWEgb3RoZXIgaW5z
dHJ1bWVudGF0aW9uLgo+Cj4gPiBXaGVuIEkgaW1wbGVtZW50ZWQgVk1BUF9TVEFDSyBmb3IgQVJN
LCBJIGFkZGVkIGFuIGV4cGxpY2l0IGxvYWQgZnJvbQo+ID4gdGhlIG5ldyBzdGFjayB3aGlsZSBz
dGlsbCBydW5uaW5nIGZyb20gdGhlIG9sZCBvbmUgKGluIF9fc3dpdGNoX3RvKSBzbwo+ID4gdGhh
dCB0aGUgb3JkaW5hcnkgZmF1bHRpbmcgY29kZSBjYW4gZGVhbCB3aXRoIGl0LiBDb3VsZG4ndCB3
ZSBkbyB0aGUKPiA+IHNhbWUgZm9yIHRoZSB2bWFsbG9jIHNoYWRvdyBvZiB0aGUgbmV3IHN0YWNr
Pwo+Cj4gV2UgY291bGQgZG8gc29tZXRoaW5nIHNpbWlsYXIsIGJ1dCBub3RlIHRoYXQgaXQncyBi
YWNrd2FyZHM6IHdlIG5lZWQgdG8KPiBlbnN1cmUgdGhhdCB0aGUgb2xkL2N1cnJlbnQgc3RhY2sg
c2hhZG93IHdpbGwgYmUgbWFwcGVkIGluIHRoZSBuZXcgbW0uCj4KPiBTbyB0aGUgdXN1YWwgZmF1
bHQgaGFuZGxpbmcgY2FuJ3QgaGFuZGxlIHRoYXQgYXMtaXMsIGJlY2F1c2UgeW91IG5lZWQgdG8K
PiBmYXVsdC1pbiBwYWdlcyBmb3IgYW4gbW0gd2hpY2ggaXNuJ3QgeWV0IGluIHVzZS4gVGhhdCBs
b2dpYyBjb3VsZCBiZQo+IGZhY3RvcmVkIG91dCBhbmQgc2hhcmVkLCB0aG91Z2guCj4KCk5vdCBz
dXJlIEkgZm9sbG93IHlvdSBoZXJlLiBUaGUgY3Jhc2ggaXMgaW4gdGhlIGtlcm5lbCwgbm8/CgpT
byB0aGVyZSBpcyBvbmx5IGEgc2luZ2xlIHZtYWxsb2Mgc3BhY2Ugd2hlcmUgYWxsIHRoZSBtYXBw
aW5ncyBzaG91bGQKcmVzaWRlLCBidXQgZWFjaCBwcm9jZXNzIGhhcyBpdHMgb3duIGNvcHkgb2Yg
dGhlIHRvcCBsZXZlbCBwYWdlIHRhYmxlLAp3aGljaCBuZWVkcyB0byBiZSBzeW5jZWQgdXAgd2hl
biBpdCBnb2VzIHN0YWxlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
