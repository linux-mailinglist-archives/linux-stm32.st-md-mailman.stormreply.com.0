Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CC9AC5B29
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 22:02:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADF2AC36B19;
	Tue, 27 May 2025 20:02:03 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E0FDC36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 20:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=G67EhjQhCo6cu8Kcg5RL64M1kKXW79lnaj18VFl/IXk=; b=qI
 pw6vAwpdkVXq5357XLKpGLZl9skBIztPQAM/kmaCnqh49jHwfLSizkZyZ1lEy4q4Mogd5x9oubtOt
 DN0haeRWyI0l3POGdVls78aniiNBgadsB7gE4RpxO8LfKmE9C9yvpkudf4amM5l8OmDcjRnyOynNT
 ETwUMYgF6UBShq8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uK0Ue-00E6bZ-Kq; Tue, 27 May 2025 22:01:48 +0200
Date: Tue, 27 May 2025 22:01:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
Cc: Furong Xu <0x1207@gmail.com>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] net: stmmac: allow drivers to
 explicitly select PHY device
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMDE6MjE6MjFQTSAtMDYwMCwgSmFtZXMgSGlsbGlhcmQg
d3JvdGU6Cj4gT24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMToxNOKAr1BNIEFuZHJldyBMdW5uIDxh
bmRyZXdAbHVubi5jaD4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMTE6
NTU6NTRBTSAtMDYwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gPiA+IFNvbWUgZGV2aWNlcyBs
aWtlIHRoZSBBbGx3aW5uZXIgSDYxNiBuZWVkIHRoZSBhYmlsaXR5IHRvIHNlbGVjdCBhIHBoeQo+
ID4gPiBpbiBjYXNlcyB3aGVyZSBtdWx0aXBsZSBQSFkncyBtYXkgYmUgcHJlc2VudCBpbiBhIGRl
dmljZSB0cmVlIGR1ZSB0bwo+ID4gPiBuZWVkaW5nIHRoZSBhYmlsaXR5IHRvIHN1cHBvcnQgbXVs
dGlwbGUgU29DIHZhcmlhbnRzIHdpdGggcnVudGltZQo+ID4gPiBQSFkgc2VsZWN0aW9uLgo+ID4K
PiA+IEknbSBub3QgY29udmluY2VkIGFib3V0IHRoaXMgeWV0LiBBcyBmYXIgYXMgaSBzZWUsIGl0
IGlzIGRpZmZlcmVudAo+ID4gdmFyaWFudHMgb2YgdGhlIEg2MTYuIFRoZXkgc2hvdWxkIGhhdmUg
ZGlmZmVyZW50IGNvbXBhdGlibGVzLCBzaW5jZQo+ID4gdGhleSBhcmUgbm90IGFjdHVhbGx5IGNv
bXBhdGlibGUsIGFuZCB5b3Ugc2hvdWxkIGhhdmUgZGlmZmVyZW50IERUCj4gPiBkZXNjcmlwdGlv
bnMuIFNvIHlvdSBkb24ndCBuZWVkIHJ1bnRpbWUgUEhZIHNlbGVjdGlvbi4KPiAKPiBEaWZmZXJl
bnQgY29tcGF0aWJsZXMgZm9yIHdoYXQgc3BlY2lmaWNhbGx5PyBJIG1lYW4gdGhlIFBIWSBjb21w
YXRpYmxlcwo+IGFyZSBqdXN0IHRoZSBnZW5lcmljICJldGhlcm5ldC1waHktaWVlZTgwMi4zLWMy
MiIgY29tcGF0aWJsZXMuCgpZb3UgYXQgbGVhc3QgaGF2ZSBhIGRpZmZlcmVudCBNVEQgZGV2aWNl
cywgZXhwb3J0aW5nIGRpZmZlcmVudApjbG9ja3MvUFdNL1Jlc2V0IGNvbnRyb2xsZXJzLiBUaGF0
IHNob3VsZCBoYXZlIGRpZmZlcmVudCBjb21wYXRpYmxlcywKc2luY2UgdGhleSBhcmUgbm90IGNv
bXBhdGlibGUuIFlvdSB0aGVuIG5lZWQgcGhhbmRsZXMgdG8gdGhlc2UKZGlmZmVyZW50IGNsb2Nr
cy9QV00vUmVzZXQgY29udHJvbGxlcnMsIGFuZCBmb3Igb25lIG9mIHRoZSBQSFlzIHlvdQpuZWVk
IGEgcGhhbmRsZSB0byB0aGUgSTJDIGJ1cywgc28gdGhlIFBIWSBkcml2ZXIgY2FuIGRvIHRoZQpp
bml0aWFsaXNhdGlvbi4gU28gaSB0aGluayBpbiB0aGUgZW5kIHlvdSBrbm93IHdoYXQgUEhZIHlv
dSBoYXZlIG9uCnRoZSBib2FyZCwgc28gdGhlcmUgaXMgbm8gbmVlZCB0byBkbyBydW50aW1lIGRl
dGVjdGlvbi4KCldoYXQgeW91IG1pZ2h0IHdhbnQgaG93ZXZlciBpcyB0byB2YWxpZGF0ZSB0aGUg
TVREIGRldmljZSBjb21wYXRpYmxlCmFnYWluc3QgdGhlIGZ1c2UgYW5kIHJldHVybiAtRU5PREVW
IGlmIHRoZSBjb21wYXRpYmxlIGlzIHdyb25nIGZvciB0aGUKZnVzZS4KCglBbmRyZXcKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
