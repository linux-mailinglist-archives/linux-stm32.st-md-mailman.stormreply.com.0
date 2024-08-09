Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C869994D7E8
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2024 22:12:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A1A3C78021;
	Fri,  9 Aug 2024 20:12:31 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73D40C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 20:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=Z5QS2qEeOwVyIpPcCh3cLZBVfiJJzs6EipXGvtlfdxQ=; b=37
 MF4qDC1Pige+qK5wnT6Q0ZZ8VnI0zkzlzR/NagidfQAazneybO4/jJeaee2cjlCjtIiGlEfBMszqV
 xCkBlwe6iKmJYyJJlGOpzOewLZo31j98RuykJb3eI7tQiadGedLv1wGqzZtnnedsW5cU7Ul0YS3Xh
 IJLuhwfoQIY4f1Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1scVy6-004PWk-1c; Fri, 09 Aug 2024 22:12:10 +0200
Date: Fri, 9 Aug 2024 22:12:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <5ff4a297-bafd-4b33-aae1-5a983f49119a@lunn.ch>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-4-jitendra.vegiraju@broadcom.com>
 <c2e2f11a-89d8-42fa-a655-972a4ab372da@lunn.ch>
 <CAMdnO-JBznFpExduwCAm929N73Z_p4S4_nzRaowL9SzseqC6LA@mail.gmail.com>
 <de5b4d42-c81d-4687-b244-073142e2967b@lunn.ch>
 <CAMdnO-+_2Fy=uNgGevtnL8PGPvKyWXPvYaxOJwKcUZj+nnfqYg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMdnO-+_2Fy=uNgGevtnL8PGPvKyWXPvYaxOJwKcUZj+nnfqYg@mail.gmail.com>
Cc: hawk@kernel.org, daniel@iogearbox.net, linux@armlinux.org.uk,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Add PCI
 driver support for BCM8958x
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

T24gVGh1LCBBdWcgMDgsIDIwMjQgYXQgMDY6NTQ6NTFQTSAtMDcwMCwgSml0ZW5kcmEgVmVnaXJh
anUgd3JvdGU6Cj4gT24gVHVlLCBBdWcgNiwgMjAyNCBhdCA0OjE14oCvUE0gQW5kcmV3IEx1bm4g
PGFuZHJld0BsdW5uLmNoPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEF1ZyAwNSwgMjAyNCBhdCAw
NTo1Njo0M1BNIC0wNzAwLCBKaXRlbmRyYSBWZWdpcmFqdSB3cm90ZToKPiA+ID4gT24gRnJpLCBB
dWcgMiwgMjAyNCBhdCA0OjA44oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPiB3cm90
ZToKPiA+ID4gPgo+ID4gPiA+ID4gTWFuYWdlbWVudCBvZiBpbnRlZ3JhdGVkIGV0aGVybmV0IHN3
aXRjaCBvbiB0aGlzIFNvQyBpcyBub3QgaGFuZGxlZCBieQo+ID4gPiA+ID4gdGhlIFBDSWUgaW50
ZXJmYWNlLgo+ID4gPiA+Cj4gPiA+ID4gTURJTz8gU1BJPyBJMkM/Cj4gPiA+ID4KPiA+ID4gVGhl
IGRldmljZSB1c2VzIFNQSSBpbnRlcmZhY2UuIFRoZSBzd2l0Y2ggaGFzIGludGVybmFsIEFSTSBN
NyBmb3IKPiA+ID4gY29udHJvbGxlciBmaXJtd2FyZS4KPiA+Cj4gPiBXaWxsIHRoZXJlIGJlIGEg
RFNBIGRyaXZlciBzb21ldGltZSBzb29uIHRhbGtpbmcgb3ZlciBTUEkgdG8gdGhlCj4gPiBmaXJt
d2FyZT8KPiA+Cj4gSGkgQW5kcmV3LAoKU28gdGhlIHN3aXRjaCB3aWxsIGJlIGxlZnQgaW4gZHVt
YiBzd2l0Y2ggZXZlcnl0aGluZyB0byBldmVyeSBwb3J0Cm1vZGU/IE9yIGl0IHdpbGwgYmUgdG90
YWxseSBhdXRvbm9tb3VzIHVzaW5nIHRoZSBpbiBidWlsZCBmaXJtd2FyZT8KCldoYXQgeW91IGNh
bm5vdCBleHBlY3QgaXMgd2UgYWxsb3cgeW91IHRvIG1hbmFnZSB0aGUgc3dpdGNoIGZyb20gTGlu
dXgKdXNpbmcgc29tZXRoaW5nIG90aGVyIHRoYW4gYW4gaW4ga2VybmVsIGRyaXZlciwgcHJvYmFi
bHkgRFNBIG9yIHB1cmUKc3dpdGNoZGV2LgoKCUFuZHJldwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
