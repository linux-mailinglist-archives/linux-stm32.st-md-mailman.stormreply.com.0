Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMP6Eg5TuWnYAgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 14:11:42 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7BD2AA957
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 14:11:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83FECC87EC5;
	Tue, 17 Mar 2026 13:11:41 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAC0FC7A831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 13:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wVX+e0F9KN8dfj/SwmnvICc5jP1yDHnEZ0Sn7ozoJNs=; b=EPue8tD3UjFJLyx+/NIDJIFQFG
 CCdoKdaIuUH7eJ+4tYTn/wTRk4U9UzHLkBcTwnYjtu/CHI3q1EnJ8OewQDOdHV574I/ua1i2KjrRW
 nkCrgvXJhhR+/9zsyJiTVlb6FfW43WjKokDq1KCt8MwUtRl/Xhx5k4HHazKF6A89/7AuzUZm8xC2T
 h9C/Ubvqtb3MjEYh2KUtoCR5RwEzeUDZXmkoBRnbDG+n2B3ALsAKXB2hM/XIu6N40n7ORJVbrI9t3
 3SASwFucwlFauZh+LFefZI35v/Uq8R7ND0OoYkbdR1cOhEutZM7ZBFcrngrETuzhPl+i1e5P8SoyB
 ajRZrEMw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59600)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w2UCl-000000005EG-45Ud;
 Tue, 17 Mar 2026 13:11:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w2UCi-00000000649-1jir; Tue, 17 Mar 2026 13:11:24 +0000
Date: Tue, 17 Mar 2026 13:11:24 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linusw@kernel.org>
Message-ID: <ablS_C8oEQFeSU1Q@shell.armlinux.org.uk>
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
 <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
 <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
 <CAD++jL=Av5K7Ag95LYou4TMKGR59TmtiQpxcnpcj+4tZFtzRug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD++jL=Av5K7Ag95LYou4TMKGR59TmtiQpxcnpcj+4tZFtzRug@mail.gmail.com>
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:christophe.roullier@foss.st.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,foss.st.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.063];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,armlinux.org.uk:url,st-md-mailman.stormreply.com:rdns,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: CD7BD2AA957
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMTcsIDIwMjYgYXQgMDE6MTM6MTRBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBTYXQsIE1hciAxNCwgMjAyNiBhdCAxOjM34oCvQU0gUnVzc2VsbCBLaW5nIChP
cmFjbGUpCj4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPiBPbiBTYXQsIE1hciAx
NCwgMjAyNiBhdCAxMjo0NDo1NkFNICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+ID4gPiBP
biBGcmksIE1hciAxMywgMjAyNiBhdCAxMjowOOKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo+
ID4gPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+ID4gPiBPbiBGcmksIE1hciAx
MywgMjAyNiBhdCAxMTo1NzoxNkFNICswMTAwLCBDaHJpc3RvcGhlIFJvdWxsaWVyIHdyb3RlOgo+
ID4gPiA+ID4gSW4gdGhlIGRlZXBlc3QgbG93LXBvd2VyIG1vZGVzLCB0aGUgcGluY3RybCBjb25m
aWd1cmF0aW9uIGlzIGxvc3QKPiA+ID4gPiA+IGFuZCBpcyBuZXZlciByZXN0b3JlZCBpZiB0aGUg
aW50ZXJmYWNlIGlzIGRvd24uCj4gPiA+ID4gPiBUaGlzIGNvbW1pdCBlbnN1cmVzIHRoYXQgdGhl
IHBpbmN0cmwgc3RhdGUgaXMgc2V0IGluIGFsbCBjYXNlcy4KPiA+ID4gPgo+ID4gPiA+IFNob3Vs
ZG4ndCB0aGUgcGluIHN0YXRlIGJlIHJlc3RvcmVkIGJ5IHRoZSBwaW5jdHJsIGxheWVyPwo+ID4g
Pgo+ID4gPiBXaGF0IHdlIGhhdmUgaW4gdGhlIGRldmljZSBjb3JlIG9ubHkgYXBwbGllcyAiaW5p
dCIgYW5kICJkZWZhdWx0Igo+ID4gPiBzdGF0ZXMsIGFuZCBwcm92aWRlcyB0aGVzZSBoYW5kbGVz
IGZvciB0cmFuc2l0aW9uaW5nIHRvICJzbGVlcCIKPiA+ID4gYW5kICJkZWZhdWx0IiBhZ2FpbiAo
bGlrZSBhIHN0YXRlIG1hY2hpbmUpLgo+ID4KPiA+IFdoYXQgSSB3YXMgbWVhbmluZyBpcyB0aGF0
IC0gZm9yIGEgZHJpdmVyIHVzaW5nIHRoZSAiZGVmYXVsdCIgc3RhdGUsCj4gPiBpZiB0aGUgaGFy
ZHdhcmUgbG9zZXMgdGhlIHBpbmN0cmwgc3RhdGUgZHVyaW5nIHNsZWVwLCBpc24ndCBpdCB0aGUK
PiA+IHJlc3BvbnNpYmlsaXR5IG9mIHRoZSBwaW5jdHJsIGRyaXZlciB0byByZXN0b3JlIHRoZSBz
dGF0ZSByYXRoZXIKPiA+IHRoYW4gbGVhdmluZyBpdCBpbiB3aGF0ZXZlciBzdGF0ZXMgaXQgaGFw
cGVucyB0byBiZSB3aGVuIHRoZSBTb0MKPiA+IGNvbWVzIGJhY2sgZnJvbSBzdXNwZW5kPwo+IAo+
IEFoYSBJIHVuZGVyc3RhbmQuCgpJJ20gbm90IHNvIHN1cmUuIE15IHBvaW50IGlzIHRoYXQgaWYg
YSBkcml2ZXIgYmluZHMsIGFuZCBwaW5jdHJsCmVuZHMgdXAgdXNpbmcgdGhlIGRlZmF1bHQgcGlu
Y3RybCBzZXR0aW5ncywgdGhlbiBzaG91bGQgaXQgbm90CmJlIHRoZSBjYXNlIHRoYXQgYWZ0ZXIg
YSBzdXNwZW5kL3Jlc3VtZSBjeWNsZSwgdGhlIHBpbmN0cmwKc2V0dGluZ3MgcmVtYWluIGNvbmZp
Z3VyZWQgaW4gdGhlIGRlZmF1bHQgc3RhdGUgd2l0aCBubyBkcml2ZXIKaW50ZXJ2ZW50aW9uPwoK
VGhpcyBpcyBteSBwb2ludCAtIGEgZHJpdmVyIHRoYXQgaXMgdW5hd2FyZSBvZiBwaW5jdHJsIHNo
b3VsZCBub3QKaGF2ZSB0byBkbyBhbnl0aGluZyBzcGVjaWFsIGluIGl0cyByZXN1bWUgcGF0aCB0
byBlbnN1cmUgdGhhdCB0aGUKcGluY3RybCBzdGF0ZSB0aGF0IHdhcyBjb25maWd1cmVkIGJ5IGdl
bmVyaWMgY29kZSBhdCBwcm9iZSB0aW1lCmlzIG1haW50YWluZWQgYWZ0ZXIgYSByZXN1bWUgLSB0
aGF0IHN0YXRlIHNob3VsZCBub3QgYmUgbG9zdC4KCkknbSB0cnlpbmcgdG8gZ2V0IGFuIGFuc3dl
ciBvbiB0aGlzLCBiZWNhdXNlIHRoZSBvcmlnaW5hbCBwYXRjaApkZXNjcmlwdGlvbiBoZXJlIHNh
eXM6Cgp8IEluIHRoZSBkZWVwZXN0IGxvdy1wb3dlciBtb2RlcywgdGhlIHBpbmN0cmwgY29uZmln
dXJhdGlvbiBpcwp8IGxvc3QgYW5kIGlzIG5ldmVyIHJlc3RvcmVkIGlmIHRoZSBpbnRlcmZhY2Ug
aXMgZG93bi4KCnN0bW1hYyB1c2VzIHRoZSAiZGVmYXVsdCIgcGluY3RybCBzdGF0ZSBhdCBwcm9i
ZSB0aW1lLiBUaGlzIGNvbW1pdApzYXlzIHRoYXQgaXMgbG9zdCBvdmVyIHN1c3BlbmQvcmVzdW1l
IC0gd2hpY2ggdG8gbWUgc291bmRzIGxpa2UKYSBwaW5jdHJsIGRyaXZlciBidWcsIGJlY2F1c2Ug
b24gcmVzdW1lLCB0aGUgcGluY3RybCBkcml2ZXIgaXMgbm90CmVuc3VyaW5nIHRoYXQgdGhlIHBp
bmN0cmwgc3RhdGUgaXMgcmVzdG9yZWQgdG8gd2hhdGV2ZXIgaXQgd2FzIHdoZW4KdGhlIHN1c3Bl
bmQgaGFwcGVuZWQgKHdoZXRoZXIgdGhlIGRyaXZlciBleHBsaWNpdGx5IGNoYW5nZWQgaXQgb3IK
bm90LikKClRvIHB1dCBpdCBhbm90aGVyIHdheS4uLgoKT24gZW50cnkgdG8gcHJvYmUgZm9yIGEg
bm9uLXBpbmN0cmwgZHJpdmVyLCBpZiBEVCBkZXNjcmliZXMgYSBkZWZhdWx0CnBpbmN0cmwgc3Rh
dGUsIHRoYXQgc3RhdGUgd2lsbCBiZSBzZWxlY3RlZCBieSBjb3JlIGNvZGUuCgpPbiBzdXNwZW5k
LCB0aGUgZHJpdmVyIGlzIGZyZWUgdG8gc2VsZWN0IGFub3RoZXIgc3RhdGUgaWYgaXQgc28gd2lz
aGVzLApvciBkbyBub3RoaW5nIChlLmcuIGl0J3MgdW5hd2FyZSBvZiBwaW5jdHJsLikKCk9uIHJl
c3VtZSwgdGhlIHBpbmN0cmwgbGF5ZXIsIHdoYXQgaXMgZXhwZWN0ZWQgdG8gaGFwcGVuLiBTdXJl
bHksIGl0CmlzIHJlYXNvbmFibGUgZm9yIGEgcGluY3RybCB1bmF3YXJlIGRyaXZlciwgb3IgYXQg
bGVhc3QgYSBkcml2ZXIgd2hpY2gKaGFzIF9ub3RfIGNoYW5nZWQgdGhlIHBpbmN0cmwgc3RhdGUg
dG8gZXhwZWN0IHRoYXQgdGhlIGRlZmF1bHQgcGluY3RybApzdGF0ZSBpcyBzdGlsbCBpbiBlZmZl
Y3Qgd2hlbiBpdHMgcmVzdW1lIGZ1bmN0aW9uIGlzIGNhbGxlZCAtIGFuZCBpZgp0aGF0IGlzIG5v
dCB0aGUgY2FzZSwgdGhlbiB0aGVyZSdzIGEgYnVnIGhlcmUuCgpBbm90aGVyIHdheSB0byBwdXQg
aXQuLi4KCldlIHNob3VsZG4ndCBiZSBleHBlY3RpbmcgZGV2aWNlIGRyaXZlcnMgdG8gaGF2ZSB0
byBtZXNzIHdpdGggcGluY3RybAplLmcuIHN3aXRjaGluZyB0byBhIHNsZWVwIHN0YXRlIGFuZCB0
aGVuIGJhY2sgdG8gYSBkZWZhdWx0IHN0YXRlIGp1c3QKdG8gaGF2ZSBwaW5jdHJsIHNldHRpbmdz
IHJlc3RvcmVkIHRvIGEgZnVuY3Rpb25hbCBzdGF0ZSBvbiByZXN1bWUuCgotLSAKUk1LJ3MgUGF0
Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMv
CkZUVFAgaXMgaGVyZSEgODBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5
IGF0IGxhc3QhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
