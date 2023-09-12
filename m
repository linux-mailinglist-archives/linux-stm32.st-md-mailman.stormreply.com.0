Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9123179CBCE
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 11:30:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48FF9C6B46E;
	Tue, 12 Sep 2023 09:30:45 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26E71C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 09:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=66b1dQizWW+fC+qmJ4SM+GQt1e88uQ9iq/5zT3+gwsg=; 
 t=1694511044; x=1695720644; b=KGYvOt/PkUCdES4fpEpjsXuDJPygNXVgpgwXN3ijU59eUq6
 RHV37tVtvZV1B7diCYlOPC+3KBzOUr9PzkIG5hzM6Qy2y7bbe1q8uHo9fUUSb0NnoqhJjI9dPqkoR
 D4c5MHlNcBWh9Z7rgaMyQVuhn6Q6Ke2mQEQqZ13SVh0HROnJ30uy6eom5OE3WTeDEY9lEH3s4E1JO
 G835BzVhNPLkoxSWG/+Wi/xWAlIX7PaH1iytfttOLSkNwdbXFKmcUARVjpIedH/+3rOEeKg0CxATO
 /3BE0BmHdTbkzrvKWuiFXbvH6XyoEv13sFYTtXiiMibZZhcI7MZ0gatRjRyZXilg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
 id 1qfzit-00CWw1-1f; Tue, 12 Sep 2023 11:30:19 +0200
Message-ID: <2fcc9fb0e40ceff8ea4ae55cca3ce0aff75a20ca.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
 Lucas Stach <l.stach@pengutronix.de>, Jisheng Zhang <jszhang@kernel.org>
Date: Tue, 12 Sep 2023 11:30:14 +0200
In-Reply-To: <20230912092411.pprnpvrbxwz77x6a@pengutronix.de>
References: <20230717160630.1892-1-jszhang@kernel.org>
 <20230717160630.1892-3-jszhang@kernel.org>
 <20230911171102.cwieugrpthm7ywbm@pengutronix.de> <ZQAa3277GC4c9W1D@xhacker>
 <99695befef06b025de2c457ea5f861aa81a0883c.camel@pengutronix.de>
 <20230912092411.pprnpvrbxwz77x6a@pengutronix.de>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Cc: Paolo Abeni <pabeni@redhat.com>, kernel@pengutronix.de,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [REGRESSION] [PATCH net-next v5 2/2] net: stmmac:
 use per-queue 64 bit statistics where necessary
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

T24gVHVlLCAyMDIzLTA5LTEyIGF0IDExOjI0ICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToKPiA+IAo+ID4gVGhlIG5ld2x5IGFkZGVkICJzdHJ1Y3QgdTY0X3N0YXRzX3N5bmMgc3luY3Ai
IHVzZXMgYSBzZXFsb2NrCj4gPiBpbnRlcm5hbGx5LCB3aGljaCBpcyBicm9rZW4gaW50byBtdWx0
aXBsZSB3b3JkcyBvbiAzMmJpdCBtYWNoaW5lcywgYW5kCj4gPiBuZWVkcyB0byBiZSBpbml0aWFs
aXplZCBwcm9wZXJseS4gWW91IG5lZWQgdG8gY2FsbCB1NjRfc3RhdHNfaW5pdCBvbgo+ID4gc3lu
Y3AgYmVmb3JlIGZpcnN0IHVzYWdlLgo+IAo+IFRoaXMgaXMgZG9uZS4gVGhlIHByb2JsZW1hdGlj
IHRoaW5nIGlzIHRoYXQgaW4gc3RtbWFjX29wZW4oKSAtPgo+IF9fc3RtbWFjX29wZW4oKSB0aGUg
c3luY3AgaW5pdGlhbGl6ZWQgYmVmb3JlIGlzIG92ZXJ3cml0dGVuIGJ5Cj4gCj4gCW1lbWNweSgm
cHJpdi0+ZG1hX2NvbmYsIGRtYV9jb25mLCBzaXplb2YoKmRtYV9jb25mKSk7Cj4gCj4gRG8gSSBu
ZWVkIHRvIHBvaW50IG91dCB0aGF0IHRoaXMgaXMgdWdseT8KCkkgdGhpbmsgaXQgYWxzbyBsZWFr
cyB0aGUgKGxvY2tkZXApIHN0YXRlIHNpbmNlIGl0IHJlaW5pdHMgdGhlIHN5bmNwCihhbmQgYSBs
b3Qgb2Ygb3RoZXIgc3RhdGUpIGRvaW5nIHRoaXMuIFRoaXMgaXMgYWxzbyBjYWxsZWQgd2hlbiB0
aGUgTVRVCmNoYW5nZXMuCgpBbHNvLCBJIGNvdWxkbid0IGNvbnZpbmNlIG15c2VsZiB0aGF0IGl0
J3MgZXZlbiByYWNlLWZyZWU/IEV2ZW4gaWYgaXQKaXMsIGl0J3Mgbm90IHJlYWxseSBvYnZpb3Vz
LCBJTUhPLgoKU28gaXQgc2VlbXMgdG8gbWUgdGhhdCByZWFsbHkgdGhpcyBuZWVkcyB0byBiZSBz
cGxpdCBpbnRvIGRhdGEgdGhhdAphY3R1YWxseSBzaG91bGQgYmUgcmVpbml0aWFsaXplZCwgYW5k
IGRhdGEgdGhhdCBzaG91bGRuJ3QsIG9yIGp1c3Qgbm90CnVzZSBtZW1jcHkoKSBoZXJlIGJ1dCBj
b3B5IG9ubHkgdGhlIHJlbGV2YW50IHN0YXRlPwoKQnV0IGFueXdheSwgSSBoYXZlIG5vIHNraW4g
aW4gdGhpcyBnYW1lIC0ganVzdCByZXZpZXdpbmcgdGhpcyBiZWNhdXNlIEkKd2FzIHRyeWluZyB0
byBoZWxwIG91dCBVd2UuCgpqb2hhbm5lcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
