Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB0A9C071A
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Nov 2024 14:19:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11CE4C6C855;
	Thu,  7 Nov 2024 13:19:25 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9A46C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 13:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=1o0PT+VvYeF2Yc1hTEqEhN6nNmR8jwyG9x4O7dGE/Wk=; b=qo
 PZCD8fmKsuqe8MM0+5HAxgA1V6sLxp1dxWT6dgRzFLKJ+Uj612/2my5BcrbEkzNKu2cGnhqk12oGB
 /a4BAt4NCaZn7xVX092i/qM2JCfjxaohRr5xqBfTcg7hjl+yJ2+6TiiQ3PRLlum+gfT49bcro6kXI
 u2un0pipZbINs5Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1t92PO-00CSlH-Qe; Thu, 07 Nov 2024 14:18:46 +0100
Date: Thu, 7 Nov 2024 14:18:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Message-ID: <9455e2f6-b41d-476e-bda9-fc01958e48d5@lunn.ch>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <f3c6b67f-5c15-43e2-832e-28392fbe52ec@lunn.ch>
 <21a00f02-7f2f-46da-a67f-be3e64019303@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21a00f02-7f2f-46da-a67f-be3e64019303@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 ychuang3@nuvoton.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
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

T24gVGh1LCBOb3YgMDcsIDIwMjQgYXQgMDY6MzE6MjZQTSArMDgwMCwgSm9leSBMdSB3cm90ZToK
PiBEZWFyIEFuZHJldywKPiAKPiBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCj4gCj4gQW5kcmV3
IEx1bm4g5pa8IDExLzcvMjAyNCAyOjEzIEFNIOWvq+mBkzoKPiA+ID4gKyAgcGh5LW1vZGU6Cj4g
PiA+ICsgICAgZW51bToKPiA+ID4gKyAgICAgIC0gcm1paQo+ID4gPiArICAgICAgLSByZ21paS1p
ZAo+ID4gVGhlIHBoeS1tb2RlIGRlZXBlbmVkIG9uIHRoZSBib2FyZCBkZXNpZ24uIEFsbCBmb3Vy
IHJnbWlpIHZhbHVlcyBhcmUKPiA+IHZhbGlkLgo+IEkgd2lsbCBhZGQgdGhlbS4KPiA+ID4gKwo+
ID4gPiArICB0eF9kZWxheToKPiA+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gPiArICAgIGRlc2Ny
aXB0aW9uOgo+ID4gPiArICAgICAgQ29udHJvbCB0cmFuc21pdCBjbG9jayBwYXRoIGRlbGF5IGlu
IG5hbm9zZWNvbmRzLgo+ID4gPiArCj4gPiA+ICsgIHJ4X2RlbGF5Ogo+ID4gPiArICAgIG1heEl0
ZW1zOiAxCj4gPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiA+ICsgICAgICBDb250cm9sIHJlY2Vp
dmUgY2xvY2sgcGF0aCBkZWxheSBpbiBuYW5vc2Vjb25kcy4KPiA+IElmIHlvdSBhYnNvbHV0ZWx5
IHJlYWxseSBuZWVkIHRoZXNlLCBrZWVwIHRoZW0sIGJ1dCBpIHN1Z2dlc3QgeW91IGRyb3AKPiA+
IHRoZW0uIFRoZXkganVzdCBjYXVzZSBjb25mdXNpb24sIHdoZW4gaWRlYWxseSB3ZSB3YW50IHRo
ZSBQSFkgdG8gYmUKPiA+IGFkZGluZyBSR01JSSBkZWxheXMsIG5vdCB0aGUgTUFDLgo+ID4gCj4g
PiBJZiB5b3UgZG8gbmVlZCB0aGVtLCB0aGVuIHRoZXkgc2hvdWxkIGJlIGluIHBTLgo+IAo+IEkg
d2lsbCBmaXggaXQuCj4gCj4gV2UgaGF2ZSBjdXN0b21lcnMgd2hvIHVzZSBhIGZpeGVkIGxpbmsg
aW5zdGVhZCBvZiBhIFBIWSwgc28gdGhlc2UgcHJvcGVydGllcwo+IG1heSBiZSBuZWNlc3Nhcnku
CgpUaGF0IGlzIGEgbGVnaXRpbWF0ZSB1c2UgY2FzZSB3aGljaCBjYW4gcmVxdWlyZSB0aGUgTUFD
IHRvIGFkZCBkZWxheXMsCmJ1dCBpIGdlbmVyYWxseSB0cnkgdG8gZ2V0IHRoZSBzd2l0Y2ggb24g
dGhlIG90aGVyIGVuZCB0byBhZGQgdGhlCmRlbGF5cywganVzdCB0byBrZWVwIHdpdGggdGhlIHVu
aWZvcm0gc2V0dXAuCgpBbHNvLCBwbGVhc2UgdGFrZSBhIGxvb2sgYXQgZXRoZXJuZXQtY29udHJv
bGxlci55YW1sLCB0aGVzZSBzaG91bGQgYmUKY2FsbGVkIHJ4LWludGVybmFsLWRlbGF5LXBzICYg
dHgtaW50ZXJuYWwtZGVsYXktcHMuCgoJQW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
