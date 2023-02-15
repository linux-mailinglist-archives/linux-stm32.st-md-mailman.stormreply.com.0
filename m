Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D93697C50
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 13:52:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20363C6A5F8;
	Wed, 15 Feb 2023 12:52:25 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDC7CC69049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Feb 2023 12:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=WOYSFfQ0jaebxOnsbFhwjuQF7/Ba3lkdLaUdw2j21OU=; b=YW
 9DTzbhY2DetOrcc4Hed33WxxEKGNvz0hK6keVtjE5/ERT0v+4gUFRND5ckuuXGd4aFj2b3hYyd5P1
 wtPRv6SfTLZdggSPlNEcfSE5P+5t+F06Gwa44BPyXT8Xvxuvxs8JvVuHQ8YQas+MpgTTgxD7me6Ok
 lAHiNqbw2ixbsxc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1pSHGO-0053CA-4X; Wed, 15 Feb 2023 13:51:56 +0100
Date: Wed, 15 Feb 2023 13:51:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <Y+zVbPppy7jvWF5r@lunn.ch>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
 <Y+e+N/aiqCctIp6e@lunn.ch>
 <d1769dac-9e80-2f0d-6a5c-386ef70e1547@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1769dac-9e80-2f0d-6a5c-386ef70e1547@collabora.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 08/12] net: stmmac: Add glue layer for
	StarFive JH7100 SoC
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

T24gV2VkLCBGZWIgMTUsIDIwMjMgYXQgMDI6MDg6MDFBTSArMDIwMCwgQ3Jpc3RpYW4gQ2lvY2Fs
dGVhIHdyb3RlOgo+IE9uIDIvMTEvMjMgMTg6MTEsIEFuZHJldyBMdW5uIHdyb3RlOgo+ID4gPiAr
Cj4gPiA+ICsjZGVmaW5lIEpINzEwMF9TWVNNQUlOX1JFR0lTVEVSMjggMHg3MAo+ID4gPiArLyog
VGhlIHZhbHVlIGJlbG93IGlzIG5vdCBhIHR5cG8sIGp1c3QgcmVhbGx5IGJhZCBuYW1pbmcgYnkg
U3RhckZpdmUgwq9cXyjjg4QpXy/CryAqLwo+ID4gPiArI2RlZmluZSBKSDcxMDBfU1lTTUFJTl9S
RUdJU1RFUjQ5IDB4YzgKPiA+IAo+ID4gU2VlbXMgbGlrZSB0aGUgY29tbWVudCBzaG91bGQgYmUg
b25lIGxpbmUgZWFybGllcj8KPiA+IAo+ID4gVGhlcmUgaXMgdmFsdWUgaW4gYmFzaW5nIHRoZSBu
YW1lcyBvbiB0aGUgZGF0YXNoZWV0LCBidXQgeW91IGNvdWxkCj4gPiBhcHBlbmQgc29tZXRoaW5n
IG1lYW5pbmdmdWwgb24gdGhlIGVuZDoKPiA+IAo+ID4gI2RlZmluZSBKSDcxMDBfU1lTTUFJTl9S
RUdJU1RFUjQ5X0RMWUNIQUlOIDB4YzgKPiA+IAo+ID4gPz8/Cj4gCj4gVW5mb3J0dW5hdGVseSB0
aGUgSkg3MTAwIGRhdGFzaGVldCBJIGhhdmUgYWNjZXNzIHRvIGRvZXNuJ3QgcHJvdmlkZSBhbnkK
PiBpbmZvcm1hdGlvbiByZWdhcmRpbmcgdGhlIFNZU0NUUkwtTUFJTlNZUyByZWxhdGVkIHJlZ2lz
dGVycy4gTWF5YmUgRW1pbAo+IGNvdWxkIHByb3ZpZGUgc29tZSBkZXRhaWxzIGhlcmU/CgpJZiB5
b3UgaGF2ZSBubyByZWxpYWJsZSBzb3VyY2Ugb2YgbmFtaW5nLCBqdXN0IG1ha2UgYSBuYW1lIHVw
IGZyb20gaG93CnRoZSByZWdpc3RlciBpcyB1c2VkLiBUaGlzIGlzIHdoeSBpIHN1Z2dlc3RlZCBh
ZGRpbmcgX0RMWUNIQUlOLApiZWNhdXNlIHRoYXQgaXMgd2hhdCBpcyB3cml0dGVuIHRvIGl0LiBZ
b3Ugc2hvdWxkIGJlIGFibGUgdG8gZG8gdGhlCnNhbWUgd2l0aCByZWdpc3RlciAyOC4KCiAgICAg
QW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
