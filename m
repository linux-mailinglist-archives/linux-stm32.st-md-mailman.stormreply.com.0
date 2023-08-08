Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CD3773AA4
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 16:09:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 213CAC6B469;
	Tue,  8 Aug 2023 14:09:26 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0177FC6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 14:09:23 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6bd0afbd616so305236a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Aug 2023 07:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691503762; x=1692108562;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vgs4Fm92pOwgiTtgi3t0TURwZ645hXw810Qm9YB3fW0=;
 b=hwIb5nvS0yISq2BqoUmJOA+ebPst2oDjwxG38aggcpcpuagfzY6CQ9dn72UJhbKVmB
 jpMGLKNMqR/lLXqnS9oyxv1X/Qt64+syMSzUMAm7jL010x1Ls9zztICnsv/oLmMQh3b1
 iYoU2U2A+GmAdFaKk/3gp2+3I5iSypVbfKsWz0hijnvoRYmgp++cUnVLOlhWzxN+pVAj
 zzC/Kd064WphuGwt8URntXH5znePWhsu0fwxZ7jMFb+XBhQP4knPE0E5omqVJOorSp6y
 ZnlsqQKcKzrkh5NDXmLS4PmrCDTEv8K///TM9JJUIMD8vaWwJIBVgoIy4K1Ko/Cm9HlP
 BGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691503762; x=1692108562;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vgs4Fm92pOwgiTtgi3t0TURwZ645hXw810Qm9YB3fW0=;
 b=lqV+EeL3jj5nfnvM18LoDH553Tyvfh3UVfZMWEtlhu7lEiAzqAEuvLzPEZBQ7KgCka
 lDjLEoJ/bmBv11JRz3jnksA3ev7Cvz1cTzdINBTXAFDxDZ1kPt0wbxnx/ku2ilSaD0kn
 7puBsrmkLM6zm7ZiU09+R8Hh0I+XGSQ8uKMzzM34emxWEWDJxL3S/bD33AfdVuwY++pr
 tJs9aDnSjxUzsO1JRR/rAzNa8utdN596nYPFIFEB2xSGtLvvL11qZ75ZErvx8mDwVbpe
 F0sG87I4UmSZE57/1CKNsc0CKuKn/dzZYoP+7S7MRkSGMuQXH/T06MoDQ347PMFBFKJO
 PHqw==
X-Gm-Message-State: AOJu0YwGFLBDJY04WXIeabaHOLbI65jCjwFzmW1kJKDo2Lje9QlMJ5qg
 Zul0xP0HJ2hRC7nnhAcBTN9xLkonxwE81u5rkodYjg==
X-Google-Smtp-Source: AGHT+IEUOZn+oWGOzEe6eb18PD1LJbJH+AEz15hO43+Evd9T1seVx+elc0H04Xz8tIq6S3q/dujX/7mkZrhXRTgW+JU=
X-Received: by 2002:a05:6358:c19:b0:139:e3a4:7095 with SMTP id
 f25-20020a0563580c1900b00139e3a47095mr14782675rwj.7.1691503762572; Tue, 08
 Aug 2023 07:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230807193102.6374-1-brgl@bgdev.pl>
 <54421791-75fa-4ed3-8432-e21184556cde@lunn.ch>
 <CAMRc=Mc6COaxM6GExHF2M+=v2TBpz87RciAv=9kHr41HkjQhCg@mail.gmail.com>
 <ZNJChfKPkAuhzDCO@shell.armlinux.org.uk>
In-Reply-To: <ZNJChfKPkAuhzDCO@shell.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Aug 2023 16:09:11 +0200
Message-ID: <CAMRc=MczKgBFvuEanKu=mERYX-6qf7oUO2S4B53sPc+hrkYqxg@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alex Elder <elder@linaro.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH 0/2] net: stmmac: allow sharing MDIO lines
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

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCAzOjI24oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCjxs
aW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgMDgsIDIwMjMgYXQg
MTA6MTM6MDlBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+IE9rIHNvIHVw
b24gc29tZSBmdXJ0aGVyIGludmVzdGlnYXRpb24sIHRoZSBhY3R1YWwgY3VscHJpdCBpcyBpbiBz
dG1tYWMKPiA+IHBsYXRmb3JtIGNvZGUgLSBpdCBhbHdheXMgdHJpZXMgdG8gcmVnaXN0ZXIgYW4g
TURJTyBidXMgLSBpbmRlcGVuZGVudAo+ID4gb2Ygd2hldGhlciB0aGVyZSBpcyBhbiBhY3R1YWwg
bWRpbyBjaGlsZCBub2RlIC0gdW5sZXNzIHRoZSBNQUMgaXMKPiA+IG1hcmtlZCBleHBsaWNpdGx5
IGFzIGhhdmluZyBhIGZpeGVkLWxpbmsuCj4gPgo+ID4gV2hlbiBJIGZpeGVkIHRoYXQsIE1BQzEn
cyBwcm9iZSBpcyBjb3JyZWN0bHkgZGVmZXJyZWQgdW50aWwgTUFDMCBoYXMKPiA+IGNyZWF0ZWQg
dGhlIE1ESU8gYnVzLgo+ID4KPiA+IEV2ZW4gc28sIGlzbid0IGl0IHVzZWZ1bCB0byBhY3R1YWxs
eSByZWZlcmVuY2UgdGhlIHNoYXJlZCBNRElPIGJ1cyBpbiBzb21lIHdheT8KPiA+Cj4gPiBJZiB0
aGUgc2NoZW1hdGljcyBsb29rIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4gPgo+ID4gLS0tLS0tLS0g
ICAgICAgICAgIC0tLS0tLS0KPiA+IHwgTUFDMCB8LS1NRElPLS0tLS18IFBIWSB8Cj4gPiAtLS0t
LS0tLSB8ICAgICB8ICAgLS0tLS0tLQo+ID4gICAgICAgICAgfCAgICAgfAo+ID4gLS0tLS0tLS0g
fCAgICAgfCAgIC0tLS0tLS0KPiA+IHwgTUFDMSB8LS0gICAgIC0tLS18IFBIWSB8Cj4gPiAtLS0t
LS0tLSAgICAgICAgICAgLS0tLS0tLQo+ID4KPiA+IFRoZW4gaXQgd291bGQgbWFrZSBzZW5zZSB0
byBtb2RlbCBpdCBvbiB0aGUgZGV2aWNlIHRyZWU/Cj4KPiBTbyBJIHRoaW5rIHdoYXQgeW91J3Jl
IHNheWluZyBpcyB0aGF0IE1BQzAgYW5kIE1BQzEncyBoYXZlIE1ESU8gYnVzCj4gbWFzdGVycywg
YW5kIHRoZSBoYXJkd2FyZSBkZXNpZ25lciBkZWNpZGVkIHRvIHRpZSBib3RoIHRvZ2V0aGVyIHRv
Cj4gYSBzaW5nbGUgc2V0IG9mIGNsb2NrIGFuZCBkYXRhIGxpbmVzLCB3aGljaCB0aGVuIGdvIHRv
IHR3byBQSFlzLgoKVGhlIHNjaGVtYXRpY3MgSSBoYXZlIGFyZSBub3QgdmVyeSBjbGVhciBvbiB0
aGF0LCBidXQgbm93IHRoYXQgeW91Cm1lbnRpb24gdGhpcywgaXQncyBtb3N0IGxpa2VseSB0aGUg
Y2FzZS4KCj4KPiBJbiB0aGF0IGNhc2UsIEkgd291bGQgc3Ryb25nbHkgYWR2aXNlIG9ubHkgcmVn
aXN0ZXJpbmcgb25lIE1ESU8gYnVzLAo+IGFuZCBhdm9pZCByZWdpc3RlcmluZyB0aGUgc2Vjb25k
IG9uZSAtIHRoZXJlYnkgcHJldmVudGluZyBhbnkgaXNzdWVzCj4gY2F1c2VkIGJ5IGJvdGggTURJ
TyBidXMgbWFzdGVycyB0cnlpbmcgdG8gdGFsayBhdCB0aGUgc2FtZSB0aW1lLgo+CgpJIHNlbnQg
YSBwYXRjaCBmb3IgdGhhdCBlYXJsaWVyIHRvZGF5LgoKPiBUaGUgUEhZcyBzaG91bGQgYmUgcG9w
dWxhdGVkIGluIGZpcm13YXJlIG9uIGp1c3Qgb25lIG9mIHRoZSBidXNlcy4KPgo+IFlvdSB3aWxs
IGFsc28gbmVlZCB0byBlbnN1cmUgdGhhdCB3aGF0ZXZlciByZWdpc3RlcnMgdGhlIGJ1cyBkb2Vz
Cj4gbWFrZSBzdXJlIHRoYXQgdGhlIGNsb2NrcyBuZWNlc3NhcnkgZm9yIGNvbW11bmljYXRpbmcg
b24gdGhlIGJ1cwo+IGFyZSB1bmRlciBjb250cm9sIG9mIHRoZSBNRElPIGJ1cyBjb2RlIGFuZCBu
b3QgdGhlIGV0aGVybmV0IE1BQwo+IGNvZGUuIFdlJ3ZlIHJ1biBpbnRvIHByb2JsZW1zIGluIHRo
ZSBwYXN0IHdoZXJlIHRoaXMgaGFzIG5vdCBiZWVuCj4gdGhlIGNhc2UsIGFuZCBpdCBtZWFucyAt
IHRha2luZyB5b3VyIGV4YW1wbGUgYWJvdmUgLSB0aGF0IHdoZW4gTUFDMQo+IHdhbnRzIHRvIHRh
bGsgdG8gaXRzIFBIWSwgaWYgTUFDMCBpc24ndCBhbGl2ZSBpdCBjYW4ndC4KCkdvb2QgcG9pbnQs
IGJ1dCBpdCdzIHdvcnNlIHRoYW4gdGhhdDogd2hlbiBNQUMwIGlzIHVuYm91bmQsIGl0IHdpbGwK
dW5yZWdpc3RlciB0aGUgTURJTyBidXMgYW5kIGRlc3Ryb3kgYWxsIFBIWSBkZXZpY2VzLiBUaGVz
ZSBhcmUgbm90CnJlZmNvdW50ZWQgc28gdGhleSB3aWxsIGxpdGVyYWxseSBnbyBmcm9tIHVuZGVy
IE1BQzEuIE5vdCBzdXJlIGhvdwp0aGlzIGNhbiBiZSBkZWFsdCB3aXRoPwoKPgo+IFNvIGp1c3Qg
YmUgYXdhcmUgb2YgdGhlIGNsb2NraW5nIHNpdHVhdGlvbiBhbmQgbWFrZSBzdXJlIHRoYXQgeW91
cgo+IE1ESU8gYnVzIGNvZGUgaXMgbWFuYWdpbmcgdGhlIGNsb2NrcyBuZWNlc3NhcnkgZm9yIHRo
ZSBNRElPIGJ1cwo+IG1hc3RlciB0byB3b3JrLgoKRG9lc24ndCBzZWVtIGxpa2Ugc3RtbWFjIGlz
IHJlYWR5IGZvciBpdCBhcyBpdCBpcyBub3cgc28gdGhpcyBpcyBnb2luZwp0byBiZSBmdW4uLi4K
CkJhcnRvc3oKCj4KPiBJbiByZWdhcmQgdG8gc2hhcmluZyBvZiB0aGUgTURJTyBidXMgc2lnbmFs
cyBiZXR3ZWVuIHR3byBidXMKPiBtYXN0ZXJzLCBJIGRvIG5vdCBiZWxpZXZlIHRoYXQgaXMgcGVy
bWlzc2libGUgLSB0aGVyZSdzIG5vCj4gY29sbGlzaW9uIGRldGVjdGlvbiBpbiBoYXJkd2FyZSBs
aWtlIHRoZXJlIGlzIG9uIEnmto4uIFNvCj4gaGF2aW5nIHR3byBNRElPIGJ1cyBtYXN0ZXJzIHRh
bGtpbmcgYXQgdGhlIHNhbWUgdGltZSB3b3VsZAo+IGVuZCB1cCBjb3JydXB0aW5nIHRoZSBNREMg
KGNsb2NrKSBhbmQgTURJTyAoZGF0YSkgc2lnbmFscyBpZgo+IGJvdGggd2VyZSBhY3RpdmUgYXQg
dGhlIHNhbWUgdGltZS4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
