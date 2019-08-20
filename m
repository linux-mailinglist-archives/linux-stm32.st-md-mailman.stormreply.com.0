Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D9696C71
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2019 00:36:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D482C35E01;
	Tue, 20 Aug 2019 22:36:50 +0000 (UTC)
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 969A8C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 22:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1566340607; bh=uO4kjYw8eB31sD3ScgjYOEeWdoCbwJKmQbVJ8Gl4dXA=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=IftA8aves13TnC73lV44LsdRpB+WM1z5DbPR9sKEE0wpwYniJBHO24p0/pqcqfo25
 hEm6tnj57PULGtClE7RjsDcPw0UkOMVpUuA5zVdFG/o+XPEPHNtI/pd6/OTrMAQ1Om
 B7Zx6T5OvA32ApNOziJ88cyVi19SfdFutjpj/p7I=
Date: Wed, 21 Aug 2019 00:36:47 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Rob Herring <robh+dt@kernel.org>
Message-ID: <20190820223647.n3a2mtdzigkbpc6x@core.my.home>
Mail-Followup-To: Rob Herring <robh+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
References: <20190820145343.29108-1-megous@megous.com>
 <20190820145343.29108-3-megous@megous.com>
 <CAL_JsqLHeA6A_+ZgmCzC42Y6yJrEq6+D3vKn8ETh2D7LJ+1_-g@mail.gmail.com>
 <20190820163433.sr4lvjxmmhjtbtcb@core.my.home>
 <CAL_JsqJHNL91KMAP5ya97eiyTypGniCJ+tbP=NchPJK502i5FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJHNL91KMAP5ya97eiyTypGniCJ+tbP=NchPJK502i5FQ@mail.gmail.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 netdev <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: net: sun8i-a83t-emac:
 Add phy-io-supply property
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

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTE6NTc6MDZBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMTE6MzQgQU0gT25kxZllaiBKaXJtYW4gPG1l
Z291c0BtZWdvdXMuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCAx
MToyMDoyMkFNIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+ID4gT24gVHVlLCBBdWcgMjAs
IDIwMTkgYXQgOTo1MyBBTSA8bWVnb3VzQG1lZ291cy5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+
ID4gRnJvbTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+Cj4gPiA+ID4KPiA+ID4g
PiBTb21lIFBIWXMgcmVxdWlyZSBzZXBhcmF0ZSBwb3dlciBzdXBwbHkgZm9yIEkvTyBwaW5zIGlu
IHNvbWUgbW9kZXMKPiA+ID4gPiBvZiBvcGVyYXRpb24uIEFkZCBwaHktaW8tc3VwcGx5IHByb3Bl
cnR5LCB0byBhbGxvdyBlbmFibGluZyB0aGlzCj4gPiA+ID4gcG93ZXIgc3VwcGx5Lgo+ID4gPgo+
ID4gPiBQZXJoYXBzIHNpbmNlIHRoaXMgaXMgbmV3LCBzdWNoIHBoeXMgc2hvdWxkIGhhdmUgKi1z
dXBwbHkgaW4gdGhlaXIgbm9kZXMuCj4gPgo+ID4gWWVzLCBJIGp1c3QgZG9uJ3QgdW5kZXJzdGFu
ZCwgc2luY2UgZXh0ZXJuYWwgZXRoZXJuZXQgcGh5cyBhcmUgc28gY29tbW9uLAo+ID4gYW5kIHRo
ZXkgcmVxdWlyZSBwb3dlciwgaG93IHRoZXJlJ3Mgbm8gZmFpcmx5IGdlbmVyaWMgbWVjaGFuaXNt
IGZvciB0aGlzCj4gPiBhbHJlYWR5IGluIHRoZSBQSFkgc3Vic3lzdGVtLCBvciBzb21ld2hlcmU/
Cj4gCj4gQmVjYXVzZSBnZW5lcmljIG1lY2hhbmlzbXMgZm9yIHRoaXMgZG9uJ3Qgd29yay4gRm9y
IGV4YW1wbGUsIHdoYXQKPiBoYXBwZW5zIHdoZW4gdGhlIDIgc3VwcGxpZXMgbmVlZCB0byBiZSB0
dXJuZWQgb24gaW4gYSBjZXJ0YWluIG9yZGVyCj4gYW5kIHdpdGggY2VydGFpbiB0aW1pbmdzPyBB
bmQgdGhlbiBhZGQgaW4gcmVzZXQgb3IgY29udHJvbCBsaW5lcyBpbnRvCj4gdGhlIG1peC4uLiBZ
b3UgY2FuIHNlZSBpbiB0aGUgYmluZGluZ3Mgd2UgYWxyZWFkeSBoYXZlIHNvbWUgb2YgdGhhdC4K
CkkndmUgbG9va2VkIGF0IHRoZSBlbWFjIGJpbmRpbmdzIHRoYXQgaGF2ZSBwaHktc3VwcGx5LCBh
bmQgZG9uJ3Qgc2VlIHJlYXNvbgp3aHkgdGhpcyBjYW4ndCBiZSBnZW5lcmljIGZvciB0aGUgcGh5
LiBKdXN0IGxpa2UgdGhlcmUncyBnZW5lcmljIHJlc2V0CnByb3BlcnRpZXMgZm9yIHBoeXMsIG5v
dy4gU29tZSBiaW5kaW5ncywgbGlrZSBmc2wtZmVjLnR4dCBldmVuIGxpc3QKY3VzdG9tIHJlc2V0
IHByb3BlcnRpZXMgZm9yIHBoeSBhcyBkZXByZWNhdGVkLCBhbmQgcmVjb21tZW5kIHVzaW5nCmdl
bmVyaWMgb25lcy4KCkZyb20gdGhlIHBvaW50IG9mIHRoZSB2aWV3IG9mIHRoZSBlbWFjIGRyaXZl
ciwgaXQganVzdCB3YW50cyB0byBwb3dlciBvbi9wb3dlcgpvZmYgdGhlIHBoeSwgYW5kIHdhaXQg
dW50aWwgaXQncyByZWFkeSB0byBiZSBjb21tdW5pY2F0ZWQgd2l0aC4KCkl0J3MgcHJvYmFibHkg
YmV0dGVyIHRvIGhhdmUgcG93ZXIgc3VwcGxpZXMgb2YgdGhlIHBoeSBjb3ZlcmVkIGJ5IGdlbmVy
aWMKcGh5IGNvZGUsIGJlY2F1c2UgdGhlbiB5b3UgZG9uJ3QgaGF2ZSB0byBkdXBsaWNhdGUgYWxs
IHRoaXMgc3BlY2lhbCBwb3dlcgp1cCBsb2dpYyBpbiBldmVyeSBlbWFjIGRyaXZlciwgd2hlbmV2
ZXIgYSBIVyBkZXNpZ25lciBkZWNpZGVzIHRvIGNvbWJpbmUKc3VjaCBlbWFjIHdpdGggZXh0ZXJu
YWwgcGh5IHRoYXQgcmVxdWlyZXMgc29tZSBzcGVjaWFsIGhhZG5saW5nIG9uIHBvd2VydXAuCgpB
dCB0aGUgbW9tZW50LCB0aGlzIGxhY2sgb2YgZmxleGliaWxpdHkgaXMgaGFja2VkIGFyb3VuZCBi
eSBhZGRpbmcgbXVsdGlwbGUKcmVndWxhdG9ycyB0byB0aGUgRFRTLCBhbmQgbWFraW5nIHRoZW0g
ZGVwZW5kZW50IG9uIGVhY2ggb3RoZXIgKGV2ZW4gaWYgb25lCmRvZXNuJ3Qgc3VwcGx5IHRoZSBv
dGhlciksIGp1c3QgYmVjYXVzZSB0aGlzIG1ha2VzIHRoZSByZWd1bGF0b3IgY29yZSBkcml2ZXIK
ZW5hYmxlIHRoZW0gYWxsLiBQb3dlciB1cCBkZWxheXMgZm9yIHRoZSBQSFkgYXJlIGRlc2NyaWJl
ZCBhcyBlbmFibGUtcmFtcC1kZWxheXMKb24gdGhlIHJlZ3VsYXRvcnMgKGFjdHVhbCByZWd1bGF0
b3IgcmFtcCBkZWxheSArIHdhaXQgdGltZSBmb3IgUEhZIHRvIGluaXRpYWxpemUpLgoKQmFzaWNh
bGx5IGp1c3QgaGFja2luZyB0aGUgRFQgc28gdGhhdCB0aGUgTGludXgga2VybmVsIGluIHRoZSBl
bmQgZG9lcyB3aGF0J3MKbmVjZXNzYXJ5LCBpbnN0ZWFkIG9mIERUIGRlc2NyaWJpbmcgdGhlIGFj
dHVhbCBIVy4KCkFkZGluZyBhIHNpbmdsZSBzdXBwbHkgcHJvcGVydHkgdG8gdGhlIHBoeSBub2Rl
LCBhcyB5b3Ugc3VnZ2VzdCB3aWxsIGRvIG5vdGhpbmcKdG8gaGVscCB0aGlzIHNpdHVhdGlvbi4g
SXQgd2lsbCBqdXN0IHJlc3VsdCBpbiBhIG1vcmUgY29tcGxpY2F0ZWQgZHdtYWMtc3VuOGkKZHJp
dmVyIGFuZCB3aWxsIG5vdCBoZWxwIGFueW9uZSBpbiB0aGUgZnV0dXJlLgoKU28gSSB0aGluaywg
bWF5YmUgcGh5IHBvd2VydXAgc2hvdWxkIGJlIG1vdmVkIHRvIGdlbmVyaWMgY29kZSwganVzdCBs
aWtlIHRoZQpwaHkgcmVzZXQgY29kZSB3YXMuIEdlbmVyaWMgY29kZSBjYW4gaGF2ZSBtdWx0aXBs
ZSBzdXBwbGllcyBhbmQgc29tZSBnZW5lcmljCndheSB0byBzcGVjaWZ5IHBvd2VyIHVwIG9yZGVy
IGFuZCB0aW1pbmdzLgoKQnV0IEkgZ3Vlc3MsIHRoaXMgcGF0Y2ggc2VyaWVzIGlzIGEgZGVhZCBl
bmQuCgo+ID4gSXQgbG9va3MgbGlrZSBvdGhlciBldGhlcm5ldCBtYWMgZHJpdmVycyBhbHNvIGlt
cGxlbWVudCBzdXBwbGllcyBvbiBwaHlzCj4gPiBvbiB0aGUgRU1BQyBub2Rlcy4gSnVzdCBncmVw
IHBoeS1zdXBwbHkgdGhyb3VnaCBkdC1iaW5kaW5ncy9uZXQuCj4gPgo+ID4gSGlzdG9yaWNhbCBy
ZWFzb25zLCBvciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPyBJdCBhbG1vc3Qgc2VlbXMgbGlrZSBJ
IG11c3QKPiA+IGJlIG1pc3Npbmcgc29tZXRoaW5nLCBzaW5jZSBwdXR0aW5nIHRoZXNlIHByb3Bl
cnRpZXMgdG8gcGh5IG5vZGVzCj4gPiBzZWVtcyBzbyBvYnZpb3VzLgo+IAo+IFRoaW5ncyBnZXQg
YWRkZWQgb25lIGJ5IG9uZSBhbmQgb25lIG5ldyBwcm9wZXJ0eSBpc24ndCB0aGF0Cj4gY29udHJv
dmVyc2lhbC4gV2UndmUgZ2VuZXJhbGx5IGxlYXJuZWQgdGhlIGxlc3NvbiBhbmQgYXZvaWQgdGhp
cwo+IHBhdHRlcm4gbm93LCBidXQgZXRoZXJuZXQgcGh5cyBhcmUgb25lIG9mIHRoZSBvbGRlciBi
aW5kaW5ncy4KClVuZGVyc3Rvb2QuIFNvIG1heWJlIHRoZSBzb2x1dGlvbiBzdWdnZXN0ZWQgYWJv
dmUgd291bGQgaW1wcm92ZSB0aGUgc2l0dWF0aW9uCmV2ZW50dWFsbHk/CgpyZWdhcmRzLAoJby4K
Cj4gUm9iCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYXJtLWtlcm5lbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
