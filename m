Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAtzJ8nr2GlCjwgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 14:23:37 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FAD3D6E2E
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 14:23:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC2BFC87EC6;
	Fri, 10 Apr 2026 12:23:36 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2145AC87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 12:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VvvpJ/qL3MAP3HugIiBTVzG72IPcnHfG1iqnkHNtFTQ=; b=U0tX3hmjJcm8tsXTtdEAC8/h1W
 LON04cNtMGN8ZEK5ppHySEkXKvnn92S3XIVyNP8bh0+prT160P9lajYz9nNr8GP8yRL0I4fafk5PN
 KLYE90UPlcZ+rAW09ET5aYUFiMcrf2ESf2opJ6EHeZR7tvkvUdkZBuy4wz616K+HvIg5cSYnIMXQn
 gV4s34DVxbYM+8GjhifF6nnLLBlsYESvPpqIzHE0OGETx49mCX1fLnsuBVrvHliHlozGUAG9p5iWU
 yGoT4MXjdD9iuGw9ng9OZEZUktWdzOkiOVDGVEWRZugPHSXmgRE4pR4a+MTa5RaFtrbsII9YxQee2
 mRZSapog==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52432)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wBAtN-000000004xu-3ZEF;
 Fri, 10 Apr 2026 13:23:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wBAtJ-000000005cT-2CP5; Fri, 10 Apr 2026 13:23:17 +0100
Date: Fri, 10 Apr 2026 13:23:17 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Message-ID: <adjrtRSepmac2hpN@shell.armlinux.org.uk>
References: <20260401041929.12392-1-CFSworks@gmail.com>
 <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
 <CAH5Ym4g3pbU_bWzMwJMdhEFv4K2sp3pty3g04=0=9Z80_LzW1w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH5Ym4g3pbU_bWzMwJMdhEFv4K2sp3pty3g04=0=9Z80_LzW1w@mail.gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: Re: [Linux-stm32] [PATCH net v4 0/2] stmmac crash/stall fixes when
 under memory pressure
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
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:cfsworks@gmail.com,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:fancer.lancer@gmail.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:peppe.cavallaro@st.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:fancerlancer@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,gmail.com,lunn.ch,google.com,st.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org,renesas.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	NEURAL_SPAM(0.00)[0.915];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,armlinux.org.uk:url,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,shell.armlinux.org.uk:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 31FAD3D6E2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBBcHIgMDIsIDIwMjYgYXQgMTA6Mzk6MzJBTSAtMDcwMCwgU2FtIEVkd2FyZHMgd3Jv
dGU6Cj4gT24gVGh1LCBBcHIgMiwgMjAyNiBhdCAxMDoxNuKAr0FNIFJ1c3NlbGwgS2luZyAoT3Jh
Y2xlKQo+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4gSSd2ZSB0ZXN0ZWQgdGhp
cyBvbiBteSBKZXRzb24gWGF2aWVyIHBsYXRmb3JtLiBPbmUgb2YgdGhlIGlzc3VlcyBJJ3ZlCj4g
PiBoYWQgaXMgdGhhdCBydW5uaW5nIGlwZXJmMyByZXN1bHRzIGluIHRoZSByZWNlaXZlIHNpZGUg
c3RhbGxpbmcgYmVjYXVzZQo+ID4gaXQgcnVucyBvdXQgb2YgZGVzY3JpcHRvcnMuIEhvd2V2ZXIs
IGRlc3BpdGUgdGhlIHJlY2VpdmUgcmluZwo+ID4gZXZlbnR1YWxseSBiZWluZyByZS1maWxsZWQg
YW5kIHRoZSBoYXJkd2FyZSBhcHByb3ByaWF0ZWx5IHByb2RkZWQsIGl0Cj4gPiBzdGVhZGZhc3Rs
eSByZWZ1c2VzIHRvIHJlc3RhcnQsIGRlc3BpdGUgdGhlIGRlc2NyaXB0b3JzIGhhdmluZyBiZWVu
Cj4gPiB1cGRhdGVkLgo+IAo+IEhpIFJ1c3NlbGwsCj4gCj4gSnVzdCB0byBtYWtlIHN1cmUgSSB1
bmRlcnN0YW5kIGNvcnJlY3RseTogYmVmb3JlIG15IHBhdGNoZXMsIHlvdSd2ZQo+IGJlZW4gb2Jz
ZXJ2aW5nIHRoaXMgcHJvYmxlbSBvbiBYYXZpZXIgZm9yIGEgd2hpbGUgKG5vIGludGVycnVwdHMs
IHJpbmcKPiBnb2VzIGRyeSk7IHdpdGggbXkgcGF0Y2hlcywgdGhlIHJpbmcgaXMgcmVmaWxsZWQs
IGJ1dCB0aGUgZHdtYWM1Cj4gZG9lc24ndCByZXN1bWUgRE1BLiAoQWgsIGp1c3Qgc2F3IHlvdXIg
Zm9sbG93LXVwIGVtYWlsLikKPiAKPiA+IEFueSBpZGVhcz8KPiAKPiBPZmYgdGhlIHRvcCBvZiBt
eSBoZWFkLCBteSBoeXBvdGhlc2lzIGlzIHRoYXQgZHdtYWM1IGhhcyBhbiBhZGRpdGlvbmFsCj4g
dHJpcHdpcmUgd2hlbiB0aGUgcmVjZWl2ZSBETUEgaXMgZXhoYXVzdGVkLCBhbmQgdGhlCj4gc3Rt
bWFjX3NldF9yeF90YWlsX3B0cigpL3N0bW1hY19lbmFibGVfZG1hX3JlY2VwdGlvbigpIGF0IHRo
ZSBlbmQgb2YKPiBzdG1tYWNfcnhfcmVmaWxsKCkgYXJlbid0IHN1ZmZpY2llbnQgdG8gd2FrZSBp
dCBiYWNrIHVwLgo+IAo+IEkgdGhpbmsgdGhpcyBpcyBuZXcgdG8gZHdtYWM1LCBiZWNhdXNlIG15
IFJLMzU4OCAoZHdtYWM0LjIwIGlpcmMpCj4gaGFwcGlseSByZXN1bWVzIGFmdGVyIHRoZSBzYW1l
IGNvbmRpdGlvbi4KPiAKPiBZb3UgZ2F2ZSBhIGxvdCBvZiBpbmZvOyB0aGFua3MhIEknbGwgdHJ5
IHRvIHNjcmFwZSB1cCBzb21lCj4gZG9jdW1lbnRhdGlvbiBvbiBkd21hYzUgdG8gc2VlIGlmIHRo
ZXJlJ3Mgc29tZXRoaW5nIG1vcmUKPiBzdG1tYWNfcnhfcmVmaWxsKCkgb3VnaHQgdG8gYmUgZG9p
bmcuIEkgdGhpbmsgSSBoYXZlIGEgWGF2aWVyIE5YCj4gYXJvdW5kIGhlcmUgc29tZXdoZXJlLCBJ
J2xsIHNlZSBpZiBJIGNhbiByZXBybyB0aGUgcHJvYmxlbS4KCkkndmUgYWRkZWQgZG1hX3JtYigp
IGludG8gZHdtYWM0X3dyYmFja19nZXRfdHhfc3RhdHVzKCkgYW5kCmR3bWFjNF93cmJhY2tfZ2V0
X3J4X3N0YXR1cygpLCBhbmQgd2l0aCB0aGF0IEkndmUgaGFkIGFuIGlwZXJmMwppbnN0YW5jZSBm
aW5hbGx5IGNvbXBsZXRlLi4uIGJ1dCBvbmx5IG9uY2U6Cgpyb290QHRlZ3JhLXVidW50dTp+IyBp
cGVyZjMgLWMgMTkyLjE2OC4yNDguMSAtUgpDb25uZWN0aW5nIHRvIGhvc3QgMTkyLjE2OC4yNDgu
MSwgcG9ydCA1MjAxClJldmVyc2UgbW9kZSwgcmVtb3RlIGhvc3QgMTkyLjE2OC4yNDguMSBpcyBz
ZW5kaW5nClsgIDVdIGxvY2FsIDE5Mi4xNjguMjQ4LjE3NCBwb3J0IDQyMjMyIGNvbm5lY3RlZCB0
byAxOTIuMTY4LjI0OC4xIHBvcnQgNTIwMQpbIElEXSBJbnRlcnZhbCAgICAgICAgICAgVHJhbnNm
ZXIgICAgIEJpdHJhdGUKWyAgNV0gICAwLjAwLTEuMDAgICBzZWMgIDUwLjggTUJ5dGVzICAgNDI2
IE1iaXRzL3NlYwpbICA1XSAgIDEuMDAtMi4wMCAgIHNlYyAgNTQuOSBNQnl0ZXMgICA0NjAgTWJp
dHMvc2VjClsgIDVdICAgMi4wMC0zLjAwICAgc2VjICA1NC4wIE1CeXRlcyAgIDQ1MyBNYml0cy9z
ZWMKWyAgNV0gICAzLjAwLTQuMDAgICBzZWMgIDUzLjggTUJ5dGVzICAgNDUyIE1iaXRzL3NlYwpb
ICA1XSAgIDQuMDAtNS4wMCAgIHNlYyAgNTIuNCBNQnl0ZXMgICA0MzggTWJpdHMvc2VjClsgIDVd
ICAgNS4wMC02LjAwICAgc2VjICA1NC4zIE1CeXRlcyAgIDQ1NSBNYml0cy9zZWMKWyAgNV0gICA2
LjAwLTcuMDAgICBzZWMgIDUzLjcgTUJ5dGVzICAgNDUyIE1iaXRzL3NlYwpbICA1XSAgIDcuMDAt
OC4wMCAgIHNlYyAgNTIuOCBNQnl0ZXMgICA0NDMgTWJpdHMvc2VjClsgIDVdICAgOC4wMC05LjAw
ICAgc2VjICA1My43IE1CeXRlcyAgIDQ1MSBNYml0cy9zZWMKWyAgNV0gICA5LjAwLTEwLjAwICBz
ZWMgIDU0LjMgTUJ5dGVzICAgNDU1IE1iaXRzL3NlYwotIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAt
IC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtClsgSURdIEludGVydmFsICAgICAgICAgICBUcmFuc2Zl
ciAgICAgQml0cmF0ZSAgICAgICAgIFJldHIKWyAgNV0gICAwLjAwLTEwLjAxICBzZWMgICA1Mzcg
TUJ5dGVzICAgNDUwIE1iaXRzL3NlYyAgIDEzICAgICAgICAgICAgIHNlbmRlcgpbICA1XSAgIDAu
MDAtMTAuMDAgIHNlYyAgIDUzNSBNQnl0ZXMgICA0NDggTWJpdHMvc2VjICAgICAgICAgICAgICAg
ICAgcmVjZWl2ZXIKCmlwZXJmIERvbmUuCgpTbywgaXQgc2VlbXMgYmV0dGVyLCBidXQgbm90IGNv
bXBsZXRlbHkgc29sdmVkLgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjNF9kZXNjcy5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWM0X2Rlc2NzLmMKaW5kZXggMjk5NGRmNDFlYzJjLi4xMTlmMzFjOTRiNjEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjNF9kZXNj
cy5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjNF9kZXNj
cy5jCkBAIC0xNywxMCArMTcsMTIgQEAgc3RhdGljIGludCBkd21hYzRfd3JiYWNrX2dldF90eF9z
dGF0dXMoc3RydWN0IHN0bW1hY19leHRyYV9zdGF0cyAqeCwKIAkJCQkgICAgICAgc3RydWN0IGRt
YV9kZXNjICpwLAogCQkJCSAgICAgICB2b2lkIF9faW9tZW0gKmlvYWRkcikKIHsKLQl1MzIgdGRl
czMgPSBsZTMyX3RvX2NwdShwLT5kZXMzKTsKKwl1MzIgdGRlczM7CiAJaW50IHJldCA9IHR4X2Rv
bmU7CiAKIAkvKiBHZXQgdHggb3duZXIgZmlyc3QgKi8KKwlkbWFfcm1iKCk7CisJdGRlczMgPSBs
ZTMyX3RvX2NwdShwLT5kZXMzKTsKIAlpZiAodW5saWtlbHkodGRlczMgJiBUREVTM19PV04pKQog
CQlyZXR1cm4gdHhfZG1hX293bjsKIApAQCAtNzAsMTIgKzcyLDEyIEBAIHN0YXRpYyBpbnQgZHdt
YWM0X3dyYmFja19nZXRfdHhfc3RhdHVzKHN0cnVjdCBzdG1tYWNfZXh0cmFfc3RhdHMgKngsCiBz
dGF0aWMgaW50IGR3bWFjNF93cmJhY2tfZ2V0X3J4X3N0YXR1cyhzdHJ1Y3Qgc3RtbWFjX2V4dHJh
X3N0YXRzICp4LAogCQkJCSAgICAgICBzdHJ1Y3QgZG1hX2Rlc2MgKnApCiB7Ci0JdTMyIHJkZXMx
ID0gbGUzMl90b19jcHUocC0+ZGVzMSk7Ci0JdTMyIHJkZXMyID0gbGUzMl90b19jcHUocC0+ZGVz
Mik7Ci0JdTMyIHJkZXMzID0gbGUzMl90b19jcHUocC0+ZGVzMyk7CisJdTMyIHJkZXMxLCByZGVz
MiwgcmRlczM7CiAJaW50IG1lc3NhZ2VfdHlwZTsKIAlpbnQgcmV0ID0gZ29vZF9mcmFtZTsKIAor
CWRtYV9ybWIoKTsKKwlyZGVzMyA9IGxlMzJfdG9fY3B1KHAtPmRlczMpOwogCWlmICh1bmxpa2Vs
eShyZGVzMyAmIFJERVMzX09XTikpCiAJCXJldHVybiBkbWFfb3duOwogCkBAIC0xMDcsNiArMTA5
LDcgQEAgc3RhdGljIGludCBkd21hYzRfd3JiYWNrX2dldF9yeF9zdGF0dXMoc3RydWN0IHN0bW1h
Y19leHRyYV9zdGF0cyAqeCwKIAogCW1lc3NhZ2VfdHlwZSA9IEZJRUxEX0dFVChSREVTMV9QVFBf
TVNHX1RZUEVfTUFTSywgcmRlczEpOwogCisJcmRlczEgPSBsZTMyX3RvX2NwdShwLT5kZXMxKTsK
IAlpZiAocmRlczEgJiBSREVTMV9JUF9IRFJfRVJST1IpIHsKIAkJeC0+aXBfaGRyX2VycisrOwog
CQlyZXQgfD0gY3N1bV9ub25lOwpAQCAtMTUyLDYgKzE1NSw3IEBAIHN0YXRpYyBpbnQgZHdtYWM0
X3dyYmFja19nZXRfcnhfc3RhdHVzKHN0cnVjdCBzdG1tYWNfZXh0cmFfc3RhdHMgKngsCiAJaWYg
KHJkZXMxICYgUkRFUzFfVElNRVNUQU1QX0RST1BQRUQpCiAJCXgtPnRpbWVzdGFtcF9kcm9wcGVk
Kys7CiAKKwlyZGVzMiA9IGxlMzJfdG9fY3B1KHAtPmRlczIpOwogCWlmICh1bmxpa2VseShyZGVz
MiAmIFJERVMyX1NBX0ZJTFRFUl9GQUlMKSkgewogCQl4LT5zYV9yeF9maWx0ZXJfZmFpbCsrOwog
CQlyZXQgPSBkaXNjYXJkX2ZyYW1lOwoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93
d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRQIGlzIGhlcmUhIDgwTWJw
cyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
