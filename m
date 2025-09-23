Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 120C9B95275
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Sep 2025 11:09:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2635BC3F92F;
	Tue, 23 Sep 2025 09:09:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83C62C3F92E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Sep 2025 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LNfWHKHbRyM/GBX0pKVevF1bo7N98M4gqN+Cm7IF6fk=; b=UXfEpc5VubhTvRh2RDuRRIh8YM
 wHrPPSm8C2tHgvqzoDIfqk5TMwb2k4m1mgnmfhb57jFA+ehquSFq7dsoduoRpaanDbZDZLrYuRqLI
 +9U6n+BiDgOP1U3DoVWYzWXrAFhuu2uP/VZa9LaZ9rF73VrsQStK5HypqZGevNgJoY0zGqTKn9kH3
 u3wB7yiR64cNSEjnmx+d++TN++QcI+NaYMZ2cIZdogktMk4wtW4rHUP9r2n6Sx+YlW30DufLLJZgi
 hkOYu+egUknb6FZx53Z59xf8bRp3IQVV6jXtvVtZLivTnVsknAh2L8lahjY8QxwTG3SfaGNGPBgd2
 rT6EeylA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33712)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v0z1P-000000006rv-3pdk;
 Tue, 23 Sep 2025 10:09:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v0z1G-0000000060w-2BgJ; Tue, 23 Sep 2025 10:09:06 +0100
Date: Tue, 23 Sep 2025 10:09:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?6Z+m5bCa5aif?= <weishangjuan@eswincomputing.com>
Message-ID: <aNJjshm4Z8H2Z8_V@shell.armlinux.org.uk>
References: <20250918085612.3176-1-weishangjuan@eswincomputing.com>
 <20250918090026.3280-1-weishangjuan@eswincomputing.com>
 <aMw-dgNiXgPeqeSz@shell.armlinux.org.uk>
 <30080c70.16e1.199748921d3.Coremail.weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30080c70.16e1.199748921d3.Coremail.weishangjuan@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, edumazet@google.com, anthony.l.nguyen@intel.com,
 jszhang@kernel.org, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, 0x1207@gmail.com, lizhi2@eswincomputing.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, jan.petrous@oss.nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 mcoquelin.stm32@gmail.com, inochiama@gmail.com, krzk+dt@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v7 2/2] ethernet: eswin: Add eic7700
	ethernet driver
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

T24gVHVlLCBTZXAgMjMsIDIwMjUgYXQgMTE6MDY6MDhBTSArMDgwMCwg6Z+m5bCa5aifIHdyb3Rl
Ogo+IEluIHRoZSBjdXJyZW50IGVpYzc3MDBfZHdtYWMgZ2x1ZSBkcml2ZXIsIHRoZSByZWdtYXBf
cmVhZCgpL3dyaXRlKCkKPiBvcGVyYXRpb25zKGZvciBwaHlfY3RybDEsIGF4aV9scF9jdHJsMSwg
YW5kIHRoZSBSWC9UWCBkZWxheSByZWdpc3RlcnMpKWFyZcKgCj4gcGVyZm9ybWVkIGRpcmVjdGx5
IGluIHRoZSBwcm9iZSgpIGZ1bmN0aW9uLiBXb3VsZCBpdCBiZSBjbGVhbmVyIHRvIG1vdmUgdGhl
c2UKPiByZWdpc3RlciBjb25maWd1cmF0aW9ucyBpbnRvIHRoZSBpbml0KCkgY2FsbGJhY2sgaW5z
dGVhZCwgc28gdGhhdCB0aGV5IGFyZQo+IGFsc28gcmVhcHBsaWVkIGR1cmluZyByZXN1bWUoKT8K
ClRoaXMgaXMgYSBxdWVzdGlvbiBJIGNhbid0IGFuc3dlciBkZWZpbml0aXZlbHkgYXMgSSBkb24n
dCBrbm93IHdoYXQKaGFwcGVucyBkdXJpbmcgYSBzdXNwZW5kIG9uIHlvdXIgaGFyZHdhcmUsIGFu
ZCB0aHVzIHdoaWNoIHJlZ2lzdGVycwphcmUgbG9zdCAvIHJlc2V0IGJ5IHRoZSB0aW1lIHRoZSBz
eXN0ZW0gcmVzdW1lcy4gU28gSSBjYW4gb25seSBnaXZlCnRoZSBvYnZpb3VzIGd1aWRhbmNlLgoK
SWYgdGhlIHNldHRpbmdzIGluIHRoZSBkZWxheSByZWdpc3RlcnMgYXJlIGxvc3Qgb3ZlciBhIHN1
c3BlbmQvcmVzdW1lCnRoZW4gdGhleSBuZWVkIHRvIGJlIHJlLWluaXRpYWxpc2VkIGFmdGVyIHJl
c3VtZS4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51
ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAu
IERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
