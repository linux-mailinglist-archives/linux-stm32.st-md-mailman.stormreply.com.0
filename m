Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0CA966223
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 14:58:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC196C6DD9A;
	Fri, 30 Aug 2024 12:58:12 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D469C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 12:58:06 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 212C388BCF;
 Fri, 30 Aug 2024 14:58:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1725022685;
 bh=ldaBCijM7jpy64WBglfsb4+/lYq4Vb5VPPiRz9MS/oQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mC6N3ul7JXrXa3gns4aCIK7e11WQQJkuw2ODtGZ/yAGHDLUeGUwJg4C2wgJerzvSs
 91Ab/kn4YMPxoXJywAKv2Ij+alplvKGnBBN8hP6ENiFK7AMqnMM639kGLLSj3Iqk7S
 09M+iYp4nER0SVm0IZOoDnDeDhyeQDP2jY2J8NauPEFYKQCm/VHp+PFMON37wLH/jR
 8nYOak+AsGLqky92sxIZwOtKkO4m1feV0H+jBOABwtefvtExv7A2onkqaGP+AsETgL
 8fC9XyTE9ALRffCgXpnMYI+OwSRtIRezxsnhWu9DJBcUfZ2/FWompMvgXvQy7mqheb
 qWCQGwXSN5b5g==
Message-ID: <b2bb5061-01e0-4f47-877b-edccedcf1aef@denx.de>
Date: Fri, 30 Aug 2024 14:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240705215402.257070-1-marex@denx.de>
 <e38b8da5-349d-4ee2-97d4-9c46c116120c@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <e38b8da5-349d-4ee2-97d4-9c46c116120c@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Describe PHY LEDs in DH
 STM32MP13xx DHCOR DHSBC board DT
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gOC8zMC8yNCAyOjQ3IFBNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IEhpIE1hcmVrCgpI
aSwKCj4gSSBoYXZlIGEgeWFtbCB2YWxpZGF0aW9uIGlzc3VlIGFwcGx5aW5nIHRoaXMgcGF0Y2gu
Cj4gCj4gIMKgIERUQ19DSEsgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzNWYtZGhjb3It
ZGhzYmMuZHRiCj4gL2xvY2FsL2hvbWUvZnJxMDg2NzgvU1RMSU5VWC9rZXJuZWwvbXkta2VybmVs
L3N0bTMyL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRoY29yLWRoc2JjLmR0Yjog
ZXRoZXJuZXQtcGh5QDE6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgn
aW50ZXJydXB0LXBhcmVudCcsICdpbnRlcnJ1cHRzJywgJ3JlZycsICdyZXNldC1hc3NlcnQtdXMn
LCAncmVzZXQtZGVhc3NlcnQtdXMnLCAncmVzZXQtZ3Bpb3MnIHdlcmUgdW5leHBlY3RlZCkKPiAg
wqDCoMKgwqBmcm9tIHNjaGVtYSAkaWQ6IAo+IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFz
L25ldC9yZWFsdGVrLHJ0bDgyeHgueWFtbCMKPiAvbG9jYWwvaG9tZS9mcnEwODY3OC9TVExJTlVY
L2tlcm5lbC9teS1rZXJuZWwvc3RtMzIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzNWYt
ZGhjb3ItZGhzYmMuZHRiOiBldGhlcm5ldC1waHlAMTogbGVkczpsZWRAMDpsaW51eCxkZWZhdWx0
LXRyaWdnZXI6ICdvbmVPZicgY29uZGl0aW9uYWwgZmFpbGVkLCBvbmUgbXVzdCBiZSBmaXhlZDoK
PiAgwqDCoMKgwqAnbmV0ZGV2JyBpcyBub3Qgb25lIG9mIFsnYmFja2xpZ2h0JywgJ2RlZmF1bHQt
b24nLCAnaGVhcnRiZWF0JywgCj4gJ2Rpc2stYWN0aXZpdHknLCAnZGlzay1yZWFkJywgJ2Rpc2st
d3JpdGUnLCAndGltZXInLCAncGF0dGVybicsIAo+ICdhdWRpby1taWNtdXRlJywgJ2F1ZGlvLW11
dGUnLCAnYmx1ZXRvb3RoLXBvd2VyJywgJ2ZsYXNoJywgCj4gJ2tiZC1jYXBzbG9jaycsICdtdGQn
LCAnbmFuZC1kaXNrJywgJ25vbmUnLCAndG9yY2gnLCAndXNiLWdhZGdldCcsIAo+ICd1c2ItaG9z
dCcsICd1c2Jwb3J0J10KPiAgwqDCoMKgwqAnbmV0ZGV2JyBkb2VzIG5vdCBtYXRjaCAnXmNwdVsw
LTldKiQnCj4gIMKgwqDCoMKgJ25ldGRldicgZG9lcyBub3QgbWF0Y2ggJ15oY2lbMC05XSstcAo+
IAo+IENhbiB5b3UgaGF2ZSBhIGxvb2sgcGxlYXNlID8KClNlZSB0aGlzIGNvbW1pdCBpbiBsaW51
eC1uZXh0LCB3aXRoIHRoYXQgdGhlIHZhbGlkYXRpb24gc2hvdWxkIHBhc3M6Cgo2MTZkYmVkNjU0
ODUgKCJkdC1iaW5kaW5nczogbGVkczogRG9jdW1lbnQgIm5ldGRldiIgdHJpZ2dlciIpCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
