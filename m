Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDmFACuxw2nAtAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 10:55:55 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CC03227E0
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 10:55:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22F6EC87ED3;
	Wed, 25 Mar 2026 09:55:54 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E81C3C87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2026 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MrD/JzDrD0dZqQ/BKgHkwNPVPT9uW7xqNUxn9RdOSf0=; b=Z8x233+7/xEqjXlOVVGBNMEXlx
 4PiPESHRrXr707uK287cImoqPmojVVBPJjpiVHLP8K9o5bXrO+huTt6l5UZtjgdow0hyYQyewI6qB
 dT32Wx231olUTVkjaMDCdoE0HxdSh2PQBNWYNqzhPUpbLfVZa9mGfdcGMV6l99/nbaqi3JuWsCE/O
 p65OUFIr0EM7afi/FmlgJMmDaIqpLw0LAdkUkZv4NoWGSyxcYpeFInUdc/MoOof2CTfOowrMacfuq
 gDu3gemEl3fmL1dH19WvcRcuwPUBqM40rzNdpubjfZ82DGouFaBdNzPUIFR3/uSAiM2CSbcVfvIKb
 0QuMRIrA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54494)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w5Kxf-0000000039n-2tj3;
 Wed, 25 Mar 2026 09:55:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w5Kxc-000000005wp-1R1H; Wed, 25 Mar 2026 09:55:36 +0000
Date: Wed, 25 Mar 2026 09:55:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linusw@kernel.org>
Message-ID: <acOxGC7c5L6UwL8H@shell.armlinux.org.uk>
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
 <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
 <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
 <CAD++jL=Av5K7Ag95LYou4TMKGR59TmtiQpxcnpcj+4tZFtzRug@mail.gmail.com>
 <ablS_C8oEQFeSU1Q@shell.armlinux.org.uk>
 <CAD++jLm5_mfx1572Cg+NPhuLoPu6DKDfOwK5XxRc4R_8M7kbYw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD++jLm5_mfx1572Cg+NPhuLoPu6DKDfOwK5XxRc4R_8M7kbYw@mail.gmail.com>
Cc: linux-kernel@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] net: stmmac: fix pinctrl
 management during suspend/resume
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:christophe.roullier@foss.st.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,foss.st.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.813];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,shell.armlinux.org.uk:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 79CC03227E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXIgMTksIDIwMjYgYXQgMTA6NDM6MjVBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBUdWUsIE1hciAxNywgMjAyNiBhdCAyOjEx4oCvUE0gUnVzc2VsbCBLaW5nIChP
cmFjbGUpCj4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPiBJJ20gdHJ5aW5nIHRv
IGdldCBhbiBhbnN3ZXIgb24gdGhpcywgYmVjYXVzZSB0aGUgb3JpZ2luYWwgcGF0Y2gKPiA+IGRl
c2NyaXB0aW9uIGhlcmUgc2F5czoKPiA+Cj4gPiB8IEluIHRoZSBkZWVwZXN0IGxvdy1wb3dlciBt
b2RlcywgdGhlIHBpbmN0cmwgY29uZmlndXJhdGlvbiBpcwo+ID4gfCBsb3N0IGFuZCBpcyBuZXZl
ciByZXN0b3JlZCBpZiB0aGUgaW50ZXJmYWNlIGlzIGRvd24uCj4gPgo+ID4gc3RtbWFjIHVzZXMg
dGhlICJkZWZhdWx0IiBwaW5jdHJsIHN0YXRlIGF0IHByb2JlIHRpbWUuIFRoaXMgY29tbWl0Cj4g
PiBzYXlzIHRoYXQgaXMgbG9zdCBvdmVyIHN1c3BlbmQvcmVzdW1lIC0gd2hpY2ggdG8gbWUgc291
bmRzIGxpa2UKPiA+IGEgcGluY3RybCBkcml2ZXIgYnVnLCBiZWNhdXNlIG9uIHJlc3VtZSwgdGhl
IHBpbmN0cmwgZHJpdmVyIGlzIG5vdAo+ID4gZW5zdXJpbmcgdGhhdCB0aGUgcGluY3RybCBzdGF0
ZSBpcyByZXN0b3JlZCB0byB3aGF0ZXZlciBpdCB3YXMgd2hlbgo+ID4gdGhlIHN1c3BlbmQgaGFw
cGVuZWQgKHdoZXRoZXIgdGhlIGRyaXZlciBleHBsaWNpdGx5IGNoYW5nZWQgaXQgb3IKPiA+IG5v
dC4pCj4gPgo+ID4gVG8gcHV0IGl0IGFub3RoZXIgd2F5Li4uCj4gPgo+ID4gT24gZW50cnkgdG8g
cHJvYmUgZm9yIGEgbm9uLXBpbmN0cmwgZHJpdmVyLCBpZiBEVCBkZXNjcmliZXMgYSBkZWZhdWx0
Cj4gPiBwaW5jdHJsIHN0YXRlLCB0aGF0IHN0YXRlIHdpbGwgYmUgc2VsZWN0ZWQgYnkgY29yZSBj
b2RlLgo+ID4KPiA+IE9uIHN1c3BlbmQsIHRoZSBkcml2ZXIgaXMgZnJlZSB0byBzZWxlY3QgYW5v
dGhlciBzdGF0ZSBpZiBpdCBzbyB3aXNoZXMsCj4gPiBvciBkbyBub3RoaW5nIChlLmcuIGl0J3Mg
dW5hd2FyZSBvZiBwaW5jdHJsLikKPiA+Cj4gPiBPbiByZXN1bWUsIHRoZSBwaW5jdHJsIGxheWVy
LCB3aGF0IGlzIGV4cGVjdGVkIHRvIGhhcHBlbi4gU3VyZWx5LCBpdAo+ID4gaXMgcmVhc29uYWJs
ZSBmb3IgYSBwaW5jdHJsIHVuYXdhcmUgZHJpdmVyLCBvciBhdCBsZWFzdCBhIGRyaXZlciB3aGlj
aAo+ID4gaGFzIF9ub3RfIGNoYW5nZWQgdGhlIHBpbmN0cmwgc3RhdGUgdG8gZXhwZWN0IHRoYXQg
dGhlIGRlZmF1bHQgcGluY3RybAo+ID4gc3RhdGUgaXMgc3RpbGwgaW4gZWZmZWN0IHdoZW4gaXRz
IHJlc3VtZSBmdW5jdGlvbiBpcyBjYWxsZWQgLSBhbmQgaWYKPiA+IHRoYXQgaXMgbm90IHRoZSBj
YXNlLCB0aGVuIHRoZXJlJ3MgYSBidWcgaGVyZS4KPiA+Cj4gPiBBbm90aGVyIHdheSB0byBwdXQg
aXQuLi4KPiA+Cj4gPiBXZSBzaG91bGRuJ3QgYmUgZXhwZWN0aW5nIGRldmljZSBkcml2ZXJzIHRv
IGhhdmUgdG8gbWVzcyB3aXRoIHBpbmN0cmwKPiA+IGUuZy4gc3dpdGNoaW5nIHRvIGEgc2xlZXAg
c3RhdGUgYW5kIHRoZW4gYmFjayB0byBhIGRlZmF1bHQgc3RhdGUganVzdAo+ID4gdG8gaGF2ZSBw
aW5jdHJsIHNldHRpbmdzIHJlc3RvcmVkIHRvIGEgZnVuY3Rpb25hbCBzdGF0ZSBvbiByZXN1bWUu
Cj4gCj4gT0sgSSBzZWUgeW91ciBwb2ludCwgdGhlIHBpbmN0cmwgaGFyZHdhcmUgc3RhdGUgc2hv
dWxkIG5vdCBjaGFuZ2UKPiBiZWhpbmQgdGhlIGJhY2sgb2YgdGhlIGRyaXZlciwgYW5kIGlmIGl0
IGRvZXMsIGFuZCB0aGF0IGlzIHdvcmtlZAo+IGFyb3VuZCBieSB0aGVzZSBjYWxscyB0byByZXN0
b3JlIHRoZSBzdGF0ZSB1c2luZyB0aGUgcGluY3RybCBQTQo+IGhlbHBlcnMgYmVjb21lIGEgbWVz
c3kgcXVpcmsuCj4gCj4gLSBTZWxlY3RpbmcgdGhvc2Ugc3RhdGVzIHRvIHJlY29uZmlndXJlIHBp
bnMgaW50byBzcGVjaWFsIG1vZGVzCj4gICBkdXJpbmcgc2xlZXAgaXMgT0suCj4gCj4gLSBTZWxl
Y3RpbmcgdGhvc2Ugc3RhdGVzIHRvIHJlc3RvcmUgdGhlIGhhcmR3YXJlIHN0YXRlIGluc2lkZSB0
aGUKPiAgIHBpbiBjb250cm9sbGVyIGl0c2VsZiBpcyBOT1QgT0suCj4gCj4gSWYgdGhpcyBpcyBk
b25lIGZvciB0aGUgbGF0dGVyIHJlYXNvbiwgeW91J3JlIHJpZ2h0IG9mIGNvdXJzZSwgdGhlcmUg
aXMKPiBhIGJ1ZyBpbiB0aGUgcGluIGNvbnRyb2xsZXIuIENlcnRhaW5seSBpdCBpcyBleHBlY3Rl
ZCB0byBtYWludGFpbiBpdHMKPiBvd24gc3RhdGUgb3ZlciBhIHN1c3BlbmQvcmVzdW1lIGN5Y2xl
LgoKVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4gU28sIGdvaW5nIGJhY2sgdG8gdGhlIG9y
aWdpbmFsIHBhdGNoOgoKIkluIHRoZSBkZWVwZXN0IGxvdy1wb3dlciBtb2RlcywgdGhlIHBpbmN0
cmwgY29uZmlndXJhdGlvbiBpcyBsb3N0CiBhbmQgaXMgbmV2ZXIgcmVzdG9yZWQgaWYgdGhlIGlu
dGVyZmFjZSBpcyBkb3duLgogVGhpcyBjb21taXQgZW5zdXJlcyB0aGF0IHRoZSBwaW5jdHJsIHN0
YXRlIGlzIHNldCBpbiBhbGwgY2FzZXMuIgoKVGhpcyBjb21taXQgbWVzc2FnZSBzZWVtcyB0byBi
ZSBzdWdnZXN0aW5nIHRoYXQgdGhlIHN3aXRjaCB0byBzbGVlcAptb2RlIGFuZCBiYWNrIHRvIGRl
ZmF1bHQgbW9kZSBpcyB0byBlbnN1cmUgdGhhdCB0aGUgcGluY3RybCBkcml2ZXIKZm9yIHRoaXMg
cGxhdGZvcm0gY29ycmVjdGx5IHJlLXNldHMgdGhlIHBpbmN0cmwgc3RhdGUgYmFjayB0byB0aGUK
ZGVmYXVsdCBzdGF0ZSAtIHdoaWNoIHN1Z2dlc3RzIHRoYXQgdGhpcyBwYXRjaCBpcyB0aGUgd3Jv
bmcgYXBwcm9hY2gKYW5kIHRoZXJlIGlzIGEgYnVnIHNvbWV3aGVyZSBpbiB0aGUgcGluIGNvbnRy
b2xsZXIgbGF5ZXIuCgpUaGF0IHNhaWQsIGZvciBwbGF0Zm9ybXMgdGhhdCBkbyBwcm92aWRlIGEg
c2xlZXAgc3RhdGUgZm9yIHN0bW1hYywgaXQKbWFrZXMgc2Vuc2UgdG8gc3dpdGNoIHRoZSBwaW5j
dHJsIHRvIHRoYXQgc3RhdGUgZXZlbiB3aGVuIHRoZSBuZXRpZgppcyBkb3duLiBTbywgSSB0aGlu
ayB0aGVyZSdzIGFjdHVhbGx5IHR3byBzZXBhcmF0ZSBpc3N1ZXM6CgoxLiB0aGUgcGluIGNvbnRy
b2xsZXIgbm90IHJlc3RvcmluZyB0aGUgc3RhdGUgdGhhdCB3YXMgc2V0IGF0IHN1c3BlbmQuCgoy
LiBub3Qgc3dpdGNoaW5nIHRvIHNsZWVwIHN0YXRlIHdoZW4gc3VwcG9ydGVkIHdoZW4gdGhlIG5l
dGlmIGlzIGRvd24uCgphbmQgZml4aW5nICgyKSB3aWxsIG1hc2sgKDEpIHdoaWNoIHdpbGwgYmUg
YmFkLiBTbywgSSB0aGluayAoMSkgbmVlZHMKdG8gYmUgZml4ZWQgZmlyc3Qgd2hpbGUgd2UgaGF2
ZSBhbiBlYXN5LXRvLXRlc3QgY2FzZSwgYW5kIG15IHN1Z2dlc3RlZApyZXBsYWNlbWVudCBwYXRj
aCBpcyBhIGJldHRlciBhcHByb2FjaCBmb3IgKDIpLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTog
aHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRQIGlzIGhl
cmUhIDgwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
