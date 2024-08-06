Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ECC949C36
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Aug 2024 01:15:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21456C7129D;
	Tue,  6 Aug 2024 23:15:31 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 903D2C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 23:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=XpAy4J2ekuQ40+as300oEbx8urXUUAPYXbeLgo0VO58=; b=G6
 owhoGGliOZBpH/YlnX8eMYRTb67QWtCndkBodQsVuEsiSy0PF5/dy17yNzM2rPrsFB2yCKmG6UR1L
 HQCPwZZ3AzsfQZrPQ1vn84Vbo8gQl0yiJL+V8WOi2Num8vtWb1lNYorf82L3c3j4rkb8hLspZ8UgK
 BONlk4QZ9SKvHBg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sbTOb-0049fR-QC; Wed, 07 Aug 2024 01:15:13 +0200
Date: Wed, 7 Aug 2024 01:15:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <de5b4d42-c81d-4687-b244-073142e2967b@lunn.ch>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-4-jitendra.vegiraju@broadcom.com>
 <c2e2f11a-89d8-42fa-a655-972a4ab372da@lunn.ch>
 <CAMdnO-JBznFpExduwCAm929N73Z_p4S4_nzRaowL9SzseqC6LA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMdnO-JBznFpExduwCAm929N73Z_p4S4_nzRaowL9SzseqC6LA@mail.gmail.com>
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

T24gTW9uLCBBdWcgMDUsIDIwMjQgYXQgMDU6NTY6NDNQTSAtMDcwMCwgSml0ZW5kcmEgVmVnaXJh
anUgd3JvdGU6Cj4gT24gRnJpLCBBdWcgMiwgMjAyNCBhdCA0OjA44oCvUE0gQW5kcmV3IEx1bm4g
PGFuZHJld0BsdW5uLmNoPiB3cm90ZToKPiA+Cj4gPiA+IE1hbmFnZW1lbnQgb2YgaW50ZWdyYXRl
ZCBldGhlcm5ldCBzd2l0Y2ggb24gdGhpcyBTb0MgaXMgbm90IGhhbmRsZWQgYnkKPiA+ID4gdGhl
IFBDSWUgaW50ZXJmYWNlLgo+ID4KPiA+IE1ESU8/IFNQST8gSTJDPwo+ID4KPiBUaGUgZGV2aWNl
IHVzZXMgU1BJIGludGVyZmFjZS4gVGhlIHN3aXRjaCBoYXMgaW50ZXJuYWwgQVJNIE03IGZvcgo+
IGNvbnRyb2xsZXIgZmlybXdhcmUuCgpXaWxsIHRoZXJlIGJlIGEgRFNBIGRyaXZlciBzb21ldGlt
ZSBzb29uIHRhbGtpbmcgb3ZlciBTUEkgdG8gdGhlCmZpcm13YXJlPwoKCUFuZHJldwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
