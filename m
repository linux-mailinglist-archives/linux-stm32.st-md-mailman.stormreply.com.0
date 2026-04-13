Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL2yODWb3GkxUAkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 09:28:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 882173E83A5
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 09:28:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C1ABC36B3C;
	Mon, 13 Apr 2026 07:28:53 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9438CC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 07:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vBAkUVC0LMguyggH1Fj4JtxZi9KWJ36XVZrJatk2ddU=; b=vGVrmcFPQ6S49Z9B7XUiJ2/XJx
 TCePPJ2Ig0JP/H6FFr0MQ4Icbi5GdYptvkxEcqqALfQeLVdCu4ZXrmo81ZP75Pa/c8jnMjIbTOMOo
 fFuRQyBW0FruqRiC4GKGfZh3sw13Dfp51fGH2wi8gewQXzrEVxWTmVT9xCmdVeRkcaG4y4LwwInqB
 umUXdX8MsLxLHlkf8/YsQiT+lqJ0H7GgARReY0yz3qUPLWvXfKPpHUnWS3THK0j5dvSoAhgknRDjU
 lfwY0Mssi9nMN9WvYBY7p5D0+hyn5iEuoKj2WyOFPYNOOiLJJNYFvVxiAabutE3z3WDzKWIu9Ef2R
 JqTNF7Dw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37492)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wCBix-000000007wY-3NJR;
 Mon, 13 Apr 2026 08:28:47 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wCBiw-000000008Rt-2JjB; Mon, 13 Apr 2026 08:28:46 +0100
Date: Mon, 13 Apr 2026 08:28:46 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Message-ID: <adybLvNCLw8jT5Yo@shell.armlinux.org.uk>
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <266998d8-7e38-4bae-a4df-2f889538fe88@bootlin.com>
 <aduq7Lvkfrz971Rb@shell.armlinux.org.uk>
 <CAH5Ym4hEX15dmJhGBqhhk--_PoFRKRSyE1AomY4D3ipwAz+pKg@mail.gmail.com>
 <adyaS3EauyrNrjMy@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adyaS3EauyrNrjMy@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: enable RPS and RBU
	interrupts
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cfsworks@gmail.com,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.162];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,shell.armlinux.org.uk:mid,armlinux.org.uk:email,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 882173E83A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgMDg6MjQ6NTlBTSArMDEwMCwgUnVzc2VsbCBLaW5nIChP
cmFjbGUpIHdyb3RlOgo+IE9uIFN1biwgQXByIDEyLCAyMDI2IGF0IDA2OjQyOjA0UE0gLTA3MDAs
IFNhbSBFZHdhcmRzIHdyb3RlOgo+ID4gT24gU3VuLCBBcHIgMTIsIDIwMjYgYXQgNzoyM+KAr0FN
IFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo+ID4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6
Cj4gPiA+IEFzIHRoZSBkd21hYyA1LjAgY29yZSByZWNlaXZlIHBhdGggc2VlbXMgdG8gbG9jayB1
cCBhZnRlciB0aGUgZmlyc3QKPiA+ID4gUkJVLCBJIG5ldmVyIHNlZSBtb3JlIHRoYW4gb25lIG9m
IHRob3NlIGF0IGEgdGltZS4KPiA+ID4KPiA+ID4gUmlnaHQgbm93LCBJIGNvbnNpZGVyIHRoaXMg
cHJldHR5IG11Y2ggdW5zb2x2YWJsZSAtIEkndmUgc3BlbnQgcXVpdGUKPiA+ID4gc29tZSB0aW1l
IGxvb2tpbmcgYXQgaXQgYW5kIHRyeWluZyB2YXJpb3VzIGFwcHJvYWNoZXMsIG5vdGhpbmcgc2Vl
bXMKPiA+ID4gdG8gZml4IGl0LiBIb3dldmVyLCBhZGRpbmcgZG1hX3JtYigpIGluIHRoZSBkZXNj
cmlwdG9yIGNsZWFudXAvcmVmaWxsCj4gPiA+IHBhdGhzIGRvZXMgc2VlbSB0byBpbXByb3ZlIHRo
ZSBzaXR1YXRpb24gYSBsaXR0bGUgd2l0aCB0aGUgNDgwTWJwcwo+ID4gPiBjYXNlLCBiZWNhdXNl
IEkgdGhpbmsgaXQgbWVhbnMgdGhhdCB3ZSdyZSByZWFkaW5nIHRoZSBkZXNjcmlwdG9ycyBpbgo+
ID4gPiBhIG1vcmUgdGltZWx5IG1hbm5lciBhZnRlciB0aGUgaGFyZHdhcmUgaGFzIHVwZGF0ZWQg
dGhlbS4KPiA+IAo+ID4gSGV5IFJ1c3NlbGwsCj4gPiAKPiA+IEknZCBsaWtlIHRvIHJlcHJvIHRo
aXMgYnV0IEkgY3VycmVudGx5IGNhbid0IGJvb3QgbmV0LW5leHQuIE15IGlzc3VlCj4gPiBpcyB0
aGUgc2FtZSBhcyBbMV0sIGFuZCB0aGUgcGF0Y2ggdG8gZml4IGl0IFsyXSBpc24ndCB5ZXQgY29t
bWl0dGVkCj4gPiBhbnl3aGVyZSBhcHBhcmVudGx5Lgo+ID4gCj4gPiBUaGlzIHByZXZlbnRzIG15
IEpldHNvbiBYYXZpZXIgTlggZnJvbSBzdGFydGluZyBhdCBhbGwgKGFuZCBhZnRlcgo+ID4gZW5v
dWdoIGF0dGVtcHRzLCBjb3JydXB0cyBlTU1DKTsgSSdtIHN1cnByaXNlZCB5b3UncmUgbm90IHN1
ZmZlcmluZwo+ID4gdGhlIHNhbWUgZWZmZWN0cy4gQnV0IGJlY2F1c2UgdGhpcyBidWcgbGl2ZXMg
aW4gdGhlIElPTU1VIHN1YnN5c3RlbQo+ID4gKGFuZCBpdCBoYXMgc29tZXdoYXQgaW5jb25zaXN0
ZW50IGVmZmVjdHMpLCBwZXJoYXBzIHRoaXMgaXMganVzdCBhCj4gPiBkaWZmZXJlbnQgd2F5IGl0
IG1hbmlmZXN0cz8gQ291bGQgeW91IGNvbmZpcm0gd2hldGhlciB5b3VyIGR3bWFjIGhhbmcKPiA+
IGhhcHBlbnMgd2l0aCBJT01NVSBkaXNhYmxlZCwgYW5kL29yIHdpdGggWzFdIHJldmVydGVkIG9y
IFsyXSBhcHBsaWVkPwo+ID4gCj4gPiBJJ20gdXNpbmcgYSBkZWZjb25maWcgYnVpbGQgYW5kIGEg
ZmFpcmx5IG1pbmltYWwgY21kbGluZSAoanVzdAo+ID4gY29uc29sZT0sIHJvb3Q9LCBhbmQgcm9v
dHdhaXQpLgo+ID4gCj4gPiBDaGVlcnMsCj4gPiBTYW0KPiA+IAo+ID4gWzFdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC84ODAwYTM4Yi04NTE1LTRiYmUtYWYxNS0wZGFlODEyNzRiZjdAbnZp
ZGlhLmNvbS8KPiA+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMC12MS02NjRkM2Fj
YWFiYjkrNzhiLWlvbW11X2dhdGhlcl9hbHdheXNfamdnQG52aWRpYS5jb20vCj4gCj4gSW4gdGhl
IHNlY29uZCBsaW5rLCB0aGVyZSBpcyB0aGlzIHN1Yi10aHJlYWQ6Cj4gCj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsL2VlMmMyMDQ0LWUzMjktNGNkZC1hYzM1LTkzNjU4MjRkMzY3N0Bhcm0u
Y29tLwo+IAo+IHdoaWNoIHdhcyBjb21taXR0ZWQgaW50byAtcmMgYXM6Cj4gCj4gN2UwNTQ4NTI1
YWJkIGlvbW11OiBFbnN1cmUgLmlvdGxiX3N5bmMgaXMgY2FsbGVkIGNvcnJlY3RseQo+IAo+IHdo
aWNoIGRvZXMgZml4IElPTU1VIHByb2JsZW1zIHdoaWNoIGNhdXNlZCBuZXQtbmV4dCB3aGljaCBy
ZXBvcnRzIGl0c2VsZgo+IGFzIHY3LjAtcmM2IGZhaWxpbmcgdG8gYm9vdCB3aXRoIGV4dDQgZXJy
b3JzLiBTZWU6Cj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9hZFpUR09qakpyVkpPY1Q4
QHNoZWxsLmFybWxpbnV4Lm9yZy51awo+IAo+IHdoaWNoIHJlc3VsdGVkIGluIGl0IGJlaW5nIG1l
cmdlZCBpbnRvIHY3LjAtcmM3IGp1c3QgYmVmb3JlIFRodXJzZGF5J3MKPiBuZXQgdHJlZSBtZXJn
ZS4gRHVlIHRvIHRoZSB3YXkgbmV0LW5leHQgaXMgb3BlcmF0ZWQsIHRoYXQgbWVhbnMgdGhhdAo+
IG5ldC1uZXh0IG9uIFRodXJzZGF5IGV2ZW5pbmcgZ2FpbmVkIHRoaXMgZml4Lgo+IAo+IEludm9s
dmluZyBMaW51cyBpbiB0aGUgcHJvYmxlbSBtZWFudCBoZSB3YXMgYXdhcmUgb2YgaXQsIGFuZCBl
eHBsYWluaW5nCj4gaG93IG5ldGRldiB3b3JrcyBhbGxvd2VkIGhpbSB0byBkZWxheSB0aGUgbWVy
Z2luZyBvZiB0aGUgbmV0IHRyZWUgdG8KPiBlbnN1cmUgbmV0LW5leHQgZ2FpbmVkIHRoZSBmaXgu
CgpJJ2xsIGFsc28gc3RhdGUgd2hhdCBJJ3ZlIHN0YXRlZCBwcmV2aW91c2x5IGFib3V0IHRoZSBp
cGVyZjMgcHJvYmxlbToKaXQgc2VlbXMgdG8gZ28gYmFjayBhIGxvbmcgdGltZSwgY2VydGFpbmx5
IGJlZm9yZSBJIHN0YXJ0ZWQgY2xlYW5pbmcKdXAgdGhlIHN0bW1hYyBkcml2ZXIgd2hpY2ggaXMg
bm93IHdlbGwgb3ZlciBhIHllYXIgYWdvLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6
Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRQIGlzIGhlcmUhIDgw
TWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
