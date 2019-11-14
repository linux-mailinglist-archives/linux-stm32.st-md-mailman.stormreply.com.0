Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC804FC93B
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2019 15:50:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A87ABC36B0B;
	Thu, 14 Nov 2019 14:50:01 +0000 (UTC)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E113C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 14:49:59 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id 190so4015480vss.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 06:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O7wapv4EE4G+0Gc1i2jjis8KTbTPULbvSuyjxNMdOtM=;
 b=AVxDQJqsoylkSQmx08lzQrUBZCxelJXskce1tNwhtJqrv1m/adiDXhfzeb/LLtfBmP
 9J1MdAGXQYOU9lve3TdlhlSPCWYIik4z3gbcbniH/2ZP/ZXc2kJetKj4I6hyBbDXALnt
 iKgDNTMw7gO1UcDjUwYeFQTYgymS3hwkbr6BYeprE9le1g2rtD7363gMpJaobyJD2GCh
 gPfFepXZyZOTSZe8PbbwFXolc3mrqQPUCjmh109X07tuR9ew5b1b8Jf0XUoKppFBALdL
 lykqOOtEIukCrxxKeAwPCpErBEAHgDQIf7n8jAKX4QF8oNgh1YmEKac+5Hot/3WZQEHA
 V5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O7wapv4EE4G+0Gc1i2jjis8KTbTPULbvSuyjxNMdOtM=;
 b=W5SCyjOhn/+/yRMgAsIMlUpf1q5yzC3qPgrFBJnrt2rkMXFTyIzrEDS0ZZcBjUwulK
 JyhNG4R14sAcQZ28Z91EWubN1fpEHUZY71CU/0/Ju69OQLDikH4/9GdAriV065j8pTs7
 h4RD33yJCming1uUGaVeDNeff0aCMD8wOSkf0fYS1Sx3l6m7D+D0Fww6iozNq85ju/Tg
 J+reqn2iwesdYl7LLM1Gc+C/GtRACqo9XR08mKpHHA1xzWP/T+xaw2wpKv9jSoRoaYNI
 UCtAgBTPny9SzOO80gPqVWlT4eR1BzfNyyrbmzot/sJQg1emY2MUJp9MvkK2Hd4owlop
 GdSA==
X-Gm-Message-State: APjAAAXVru2kBzG2KrmqNJXBMKyCOjQmT7Hn/DmVnclk6YcvegpaFJMz
 R0zEU7Sh775KB6D+QcZAZxvuALXqd3yaUEteif3hpQ==
X-Google-Smtp-Source: APXvYqzcyR0y7F+ha4XEbI+5EzDrdrJyK1AZpIJppA2pHa1tvpOnu8Gvhe0K17/wE+Byt8XJXfmdlVGMNecJ5wVu/x0=
X-Received: by 2002:a05:6102:36d:: with SMTP id
 f13mr6134394vsa.34.1573742998082; 
 Thu, 14 Nov 2019 06:49:58 -0800 (PST)
MIME-Version: 1.0
References: <20191011131502.29579-1-ludovic.Barre@st.com>
 <20191011131502.29579-2-ludovic.Barre@st.com>
 <CAPDyKFqE09nqdev_qewwNzjjUuhm0UUC03tgvY=ZukYY4az7wg@mail.gmail.com>
 <d8d82f39-319b-c8f8-255a-a02a81980671@st.com>
In-Reply-To: <d8d82f39-319b-c8f8-255a-a02a81980671@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 14 Nov 2019 15:49:21 +0100
Message-ID: <CAPDyKFpvOdwnwNa94ppF_Gum26ML52oeXDSeR1qKtSaH_wQU+g@mail.gmail.com>
To: Ludovic BARRE <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] mmc: add unstuck function if host is
	in deadlock state
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

T24gV2VkLCAxMyBOb3YgMjAxOSBhdCAxNzo1NCwgTHVkb3ZpYyBCQVJSRSA8bHVkb3ZpYy5iYXJy
ZUBzdC5jb20+IHdyb3RlOgo+Cj4KPgo+IExlIDEwLzIxLzE5IMOgIDM6MzUgUE0sIFVsZiBIYW5z
c29uIGEgw6ljcml0IDoKPiA+IE9uIEZyaSwgMTEgT2N0IDIwMTkgYXQgMTU6MTUsIEx1ZG92aWMg
QmFycmUgPGx1ZG92aWMuQmFycmVAc3QuY29tPiB3cm90ZToKPiA+Pgo+ID4+IEZyb206IEx1ZG92
aWMgQmFycmUgPGx1ZG92aWMuYmFycmVAc3QuY29tPgo+ID4+Cj4gPj4gQWZ0ZXIgYSByZXF1ZXN0
IGEgaG9zdCBtYXkgYmUgaW4gZGVhZGxvY2sgc3RhdGUsIGFuZCB3YWl0Cj4gPj4gYSBzcGVjaWZp
YyBhY3Rpb24gdG8gdW5zdHVjayB0aGUgaGFyZHdhcmUgYmxvY2sgYmVmb3JlCj4gPj4gcmUtc2Vu
ZGluZyBhIG5ldyBjb21tYW5kLgo+ID4KPiA+IFJhdGhlciB0aGFuIHRhbGtpbmcgYWJvdXQgInVu
c3R1Y2siIGFuZCAiZGVhZGxvY2siLCBob3cgYWJvdXQgaW5zdGVhZAo+ID4gZGVzY3JpYmluZyB0
aGF0IGFuIE1NQyBjb250cm9sbGVyLCBtYXkgZW5kIHVwIGluIGFuIG5vbi1mdW5jdGlvbmFsCj4g
PiBzdGF0ZSBoYW5naW5nIG9uIHNvbWV0aGluZy4gVGhlbiB0byBhbGxvdyBpdCB0byBzZXJ2ZSBu
ZXcgcmVxdWVzdHMgaXQKPiA+IG5lZWRzIHRvIGJlIHJlc2V0Lgo+ID4KPgo+IE9rLCBkZWFkbG9j
ayBuYW1pbmcgaXMgcGVyaGFwcyB0b28gc3Ryb25naHQgYW5kIHNjYXJ5Lgo+Cj4gPj4KPiA+PiBU
aGlzIHBhdGNoIGFkZHMgYW4gb3B0aW9uYWwgY2FsbGJhY2sgbW1jX2h3X3Vuc3R1Y2sgd2hpY2gK
PiA+PiBhbGxvd3MgdGhlIGhvc3QgdG8gdW5zdHVjayB0aGUgY29udHJvbGxlci4gSW4gb3JkZXIg
dG8gYXZvaWQKPiA+PiBhIGNyaXRpY2FsIGNvbnRleHQsIHRoaXMgY2FsbGJhY2sgbXVzdCBiZSBj
YWxsZWQgd2hlbiB0aGUKPiA+PiByZXF1ZXN0IGlzIGNvbXBsZXRlZC4gRGVwZW5kaW5nIHRoZSBt
bWMgcmVxdWVzdCwgdGhlIGNvbXBsZXRpb24KPiA+PiBmdW5jdGlvbiBpcyBkZWZpbmVkIGJ5IG1y
cS0+ZG9uZSBhbmQgY291bGQgYmUgaW4gYmxvY2suYyBvciBjb3JlLmMuCj4gPgo+ID4gSSB0aGlu
ayBpdCdzIGltcG9ydGFudCB0byBzdGF0ZSBleGFjdGx5IHdoYXQgaXMgZXhwZWN0ZWQgZnJvbSB0
aGUgY29yZQo+ID4gcGVyc3BlY3RpdmUsIGJ5IHRoZSBtbWMgaG9zdCBkcml2ZXIgd2hlbiBpdCBj
YWxscyB0aGlzIG5ldyBob3N0IG9wcy4KPiA+IFdlIG5lZWQgdG8gY2xhcmlmeSB0aGF0Lgo+ID4K
PiA+Pgo+ID4+IG1tY19od191bnN0dWNrIGlzIGNhbGxlZCBpZiB0aGUgaG9zdCByZXR1cm5zIGFu
IGNtZC9zYmMvc3RvcC9kYXRhCj4gPj4gREVBRExLIGVycm9yLgo+ID4KPiA+IFRvIG1lLCB0aGlz
IGFwcHJvYWNoIHNlZW1zIGEgYml0IHVwc2lkZS1kb3duLiBBbHRob3VnaCwgSSBoYXZlIHRvCj4g
PiBhZG1pdCB0aGF0IEkgaGF2ZW4ndCB0aG91Z2h0IHRocm91Z2ggdGhpcyBjb21wbGV0ZWx5IHll
dC4KPiA+Cj4gPiBUaGUgdGhpbmcgaXMsIHRvIG1ha2UgdGhpcyB1c2VmdWwgZm9yIGhvc3QgZHJp
dmVycyBpbiBnZW5lcmFsLCBJCj4gPiBpbnN0ZWFkIHRoaW5rIHdlIG5lZWQgdG8gYWRkIHRpbWVv
dXQgdG8gZWFjaCByZXF1ZXN0IHRoYXQgdGhlIGNvcmUKPiA+IHNlbmRzIHRvIHRoZSBob3N0IGRy
aXZlci4gSW4gb3RoZXIgd29yZHMsIHJhdGhlciB0aGFuIHdhaXRpbmcgZm9yZXZlcgo+ID4gaW4g
dGhlIGNvcmUgZm9yIHRoZSBjb21wbGV0aW9uIHZhcmlhYmxlIHRvIGJlIHNldCwgdmlhIGNhbGxp
bmcKPiA+IHdhaXRfZm9yX2NvbXBsZXRpb24oKSB3ZSBjb3VsZCBjYWxsIHdhaXRfZm9yX2NvbXBs
ZXRpb25fdGltZW91dCgpLiBUaGUKPiA+IHRyaWNreSBwYXJ0IGlzIHRvIGZpZ3VyZSBvdXQgd2hh
dCB0aW1lb3V0IHRvIHVzZSBmb3IgZWFjaCByZXF1ZXN0Lgo+ID4gUGVyaGFwcyB0aGF0IGlzIGV2
ZW4gd2h5IHlvdSBwaWNrZWQgdGhlIGFwcHJvYWNoIGFzIGltcGxlbWVudGVkIGluCj4gPiBAc3Vi
amVjdCBwYXRjaCBpbnN0ZWFkPwo+Cj4gT24gU1RNMzIgU0RNTUMgdmFyaWFudCwgSWYgZGF0YXRp
bWVvdXQgb2NjdXJzIG9uIFIxQiByZXF1ZXN0IHRoZSBEYXRhCj4gUGF0aCBTdGF0ZSBNYWNoaW5l
IHN0YXlzIGluIGJ1c3kgYW5kIG9ubHkgdGhlIERQU00gaXMgbm9uLWZ1bmN0aW9uYWwuCj4gVGhl
IGhhcmR3YXJlIGJsb2NrIHdhaXRzIGEgc29mdHdhcmUgYWN0aW9uIHRvIGFib3J0IHRoZSBEUFNN
Lgo+Cj4gTGlrZSB0aGUgQ1BTTSBzdGF5IGFsaXZlLCB0aGUgZnJhbWV3b3JrIGNhbiBzZW50IHNv
bWUgcmVxdWVzdHMKPiAod2l0aG91dCBkYXRhLCBleGFtcGxlIGNtZDEzOnN0YXR1cykgYmVmb3Jl
IHRvIGhhZCB0aGlzCj4gdGltZW91dCBpc3N1ZS4KPgo+IFBPViBmcmFtZXdvcmsgSSB1bmRlcnN0
YW5kIHRoZSBwb3NzaWJpbGl0eSB0byBoYXZlIGEgY29tcGxldGlvbl90aW1lb3V0LAo+IGZvciBt
b3JlIHNhZmV0eS4gQnV0IGZvciB0aGlzIHNwZWNpZmljIHNkbW1jIGNhc2UsIEknbSBub3QgZmFu
LCBiZWNhdXNlCj4gdGhlIGNvbXBsZXRpb24gdGltZW91dCBlcnJvciB3aWxsIG9jY3VyIHNldmVy
YWwgcmVxdWVzdHMgYWZ0ZXIgdGhlIHJlYWwKPiBpc3N1ZSAod2hpY2ggcHV0IHRoZSBEUFNNIG5v
bi1mdW5jdGlvbmFsKS4gd2hlbiB0aGUgY29tcGxldGlvbiB0aW1lb3V0Cj4gb2NjdXJzIHdlIGNh
bid0IGtub3cgaWYgaXQncyBkdWUgdG8gUjFCIHRpbWVvdXQgb3IgYW4gb3RoZXIgaXNzdWUuCgpS
aWdodCwgSSBzZWUgd2hhdCB5b3UgYXJlIHNheWluZy4gU28gbGV0J3MgZHJvcCB0aGUgYXBwcm9h
Y2ggc3VnZ2VzdGVkCmluICRzdWJqZWN0IHNlcmllcy4KCj4KPiBUbyByZXNvbHZlIHRoZSBTRE1N
QydzIHNwZWNpZmljaXR5LCBJIGNhbiBwcm9wb3NlZCB5b3UgdG8gYWRkIGEgdGhyZWFkZWQKPiBp
cnEgaW4gbW1jaSBkcml2ZXJzIHRvIGFib3J0IHRoZSBEUFNNIGFuZCB0ZXJtaW5hdGUgdGhlIHJl
cXVlc3QuCgpPa2F5LCBzbyB0aGUgdGhyZWFkZWQgSVJRIGhhbmRsZXIgaXMgbmVlZGVkLCBiZWNh
dXNlIHRoZSByZXNldApvcGVyYXRpb24gbWF5IHNsZWVwIChjYW4ndCBiZSBleGVjdXRlZCBpbiBh
dG9taWMgY29udGV4dCkuIFJpZ2h0PwoKVGhhdCBzaG91bGQgd29yaywgYnV0Li4uIGxldCdzIG1v
dmUgdGhlIGRpc2N1c3Npb24gdG8gdGhhdCBwYXRjaCBpbnN0ZWFkLgoKPgo+ID4KPiA+IEFueXdh
eSwgdGhlIHR5cGljYWwgc2NlbmFyaW8gSSBzZWUsIGlzIHRoYXQgdGhlIGhvc3QgZHJpdmVyIGlz
Cj4gPiBoYW5naW5nLCBsaWtlbHkgd2FpdGluZyBmb3IgYW4gSVJRIHRoYXQgbmV2ZXIgZ2V0IHJh
aXNlZC4gU28sIHVubGVzcwo+ID4gaXQgaW1wbGVtZW50cyBpdCBvd24gdmFyaWFudCBvZiBhICJy
ZXF1ZXN0IHRpbWVvdXQiIG1lY2hhbmlzbSwgaXQKPiA+IHNpbXBsZSBpc24ndCBhYmxlIHRvIGNh
bGwgbW1jX3JlcXVlc3RfZG9uZSgpIHRvIGluZm9ybSB0aGUgY29yZSBhYm91dAo+ID4gdGhhdCB0
aGUgcmVxdWVzdCBoYXMgZmFpbGVkLgo+ID4KPiA+IEZvciBjb21tZW50cyB0byB0aGUgY29kZSwg
SSBkZWZlciB0aGF0IHRvIHRoZSBuZXh0IHN0ZXAsIHdoZW4gd2UgaGF2ZQo+ID4gYWdyZWVkIG9u
IHRoZSB3YXkgZm9yd2FyZC4KPiA+Cj4gPiBLaW5kIHJlZ2FyZHMKPiA+IFVmZmUKPiA+CgpLaW5k
IHJlZ2FyZHMKVWZmZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
