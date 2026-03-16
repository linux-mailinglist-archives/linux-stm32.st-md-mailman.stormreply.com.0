Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGJ8J2LHt2kRVQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 10:03:30 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 360C32969E5
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 10:03:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8175C3F95E;
	Mon, 16 Mar 2026 09:03:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C70BFC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x21XFiKWNX9OSKttQyxY4H13HZnCZYTMHuJhv60Nsyw=; b=MhTkSR+ONSdKHyO99rOR4NelmK
 EeNzxCC17brplbhzSS4XLCIaP23lo0lY470qFfFb7lUvkfraYhazE/cArAGUT5rMnJ+ThXRcDP9tJ
 N/B3Ol/B5g33wzaBR1lULFs2QvXrxWpNWvw9aF7XEQc/GZdXF6U8Au0rH3jYpnVkPQphbmneEWdIW
 OBKKs7I31VMXi/z6vKI9/RfGYBdry5Ofs18cQty9iafbqMJgaCx4x2uYk1ZEy/zC0NpvvNiDxsgr5
 IO4xiCkEgdmjZ6h2e/U/NIa5bFVZnAMO1wN216HbavaGtd5i9J2kyirLJo3BPFWYuCp0vf/h+JwZi
 SoKzALbA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44006)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w23r3-000000003Wg-3LDr;
 Mon, 16 Mar 2026 09:03:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w23r0-000000004wi-3A9F; Mon, 16 Mar 2026 09:03:14 +0000
Date: Mon, 16 Mar 2026 09:03:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linusw@kernel.org>
Message-ID: <abfHUrOpHnjv3GGW@shell.armlinux.org.uk>
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
 <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
 <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
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
	NEURAL_HAM(-0.00)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,shell.armlinux.org.uk:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 360C32969E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU2F0LCBNYXIgMTQsIDIwMjYgYXQgMTI6Mzc6MTlBTSArMDAwMCwgUnVzc2VsbCBLaW5nIChP
cmFjbGUpIHdyb3RlOgo+IE9uIFNhdCwgTWFyIDE0LCAyMDI2IGF0IDEyOjQ0OjU2QU0gKzAxMDAs
IExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gPiBPbiBGcmksIE1hciAxMywgMjAyNiBhdCAxMjowOOKA
r1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo+ID4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3Jv
dGU6Cj4gPiA+IE9uIEZyaSwgTWFyIDEzLCAyMDI2IGF0IDExOjU3OjE2QU0gKzAxMDAsIENocmlz
dG9waGUgUm91bGxpZXIgd3JvdGU6Cj4gPiA+ID4gSW4gdGhlIGRlZXBlc3QgbG93LXBvd2VyIG1v
ZGVzLCB0aGUgcGluY3RybCBjb25maWd1cmF0aW9uIGlzIGxvc3QKPiA+ID4gPiBhbmQgaXMgbmV2
ZXIgcmVzdG9yZWQgaWYgdGhlIGludGVyZmFjZSBpcyBkb3duLgo+ID4gPiA+IFRoaXMgY29tbWl0
IGVuc3VyZXMgdGhhdCB0aGUgcGluY3RybCBzdGF0ZSBpcyBzZXQgaW4gYWxsIGNhc2VzLgo+ID4g
Pgo+ID4gPiBTaG91bGRuJ3QgdGhlIHBpbiBzdGF0ZSBiZSByZXN0b3JlZCBieSB0aGUgcGluY3Ry
bCBsYXllcj8KPiA+IAo+ID4gV2hhdCB3ZSBoYXZlIGluIHRoZSBkZXZpY2UgY29yZSBvbmx5IGFw
cGxpZXMgImluaXQiIGFuZCAiZGVmYXVsdCIKPiA+IHN0YXRlcywgYW5kIHByb3ZpZGVzIHRoZXNl
IGhhbmRsZXMgZm9yIHRyYW5zaXRpb25pbmcgdG8gInNsZWVwIgo+ID4gYW5kICJkZWZhdWx0IiBh
Z2FpbiAobGlrZSBhIHN0YXRlIG1hY2hpbmUpLgo+IAo+IFdoYXQgSSB3YXMgbWVhbmluZyBpcyB0
aGF0IC0gZm9yIGEgZHJpdmVyIHVzaW5nIHRoZSAiZGVmYXVsdCIgc3RhdGUsCj4gaWYgdGhlIGhh
cmR3YXJlIGxvc2VzIHRoZSBwaW5jdHJsIHN0YXRlIGR1cmluZyBzbGVlcCwgaXNuJ3QgaXQgdGhl
Cj4gcmVzcG9uc2liaWxpdHkgb2YgdGhlIHBpbmN0cmwgZHJpdmVyIHRvIHJlc3RvcmUgdGhlIHN0
YXRlIHJhdGhlcgo+IHRoYW4gbGVhdmluZyBpdCBpbiB3aGF0ZXZlciBzdGF0ZXMgaXQgaGFwcGVu
cyB0byBiZSB3aGVuIHRoZSBTb0MKPiBjb21lcyBiYWNrIGZyb20gc3VzcGVuZD8KPiAKPiBJZiB0
aGF0IGlzIG5vdCB0aGUgY2FzZSwgdGhlbiBkb24ndCB3ZSBoYXZlIGEgbWFqb3IgaXNzdWUgd2hl
cmUKPiBkcml2ZXJzIHVzaW5nIHBpbmN0cmwgYnV0IGRvIG5vdCBpc3N1ZSBhbnkgcGluY3RybCBj
YWxscyBpbiB0aGUKPiByZXN1bWUgZnVuY3Rpb24gYXJlIGJ1Z2d5PwoKSSB3b3VsZCBsaWtlIGFu
IGFuc3dlciBvbiB0aGlzIGJlZm9yZSB0aGlzIHBhdGNoIGlzIG1lcmdlZCwgYmVjYXVzZQpldmVu
IHdpdGggeW91ciByZXZpZXdlZC1ieSwgSSBkb24ndCB0aGluayB0aGlzIHBhdGNoIGlzIGNvcnJl
Y3QuCgpGb3IgZXhhbXBsZSwgaWYgcGluY3RybCBsb3NlcyB0aGUgcGlubXV4IHN0YXRlIGFjcm9z
cyBzdXNwZW5kL3Jlc3VtZSwKdGhlbiB0aGlzIHBhdGNoIG9ubHkgc29sdmVzIHRoZSBjYXNlIHdo
ZXJlIHRoZSBOSUMgaXMgZG93biB3aGVuCnN1c3BlbmRpbmcuCgpJdCBkb2VzIG5vdCBhZGRyZXNz
IHRoZSBjYXNlIHdoZXJlIHRoZSBOSUMgaXMgdXAgYnV0IFdvTCBpcyBkaXNhYmxlZC4KQWxzbywg
d2hhdCBoYXBwZW5zIHdoZW4gV29MIGlzIGVuYWJsZWQgYXQgdGhlIE1BQywgd2hlbiB3ZSBleHBl
Y3QgdGhlCk5JQyB0byBzdGlsbCBiZSBmdW5jdGlvbmFsIC0gd2hpY2ggbWVhbnMgdGhhdCB0aGUg
cGlubXV4IHN0YXRlIG11c3QKcmVtYWluIGFjdGl2ZSBvdmVyIHN1c3BlbmQuCgpUaGlzIGlzIGlu
IGFkZGl0aW9uIHRvIGEgbW9yZSBnZW5lcmFsIGNvbmNlcm4gdGhhdCBhbG1vc3QgZXZlcnkgZHJp
dmVyCmluIHRoZSBrZXJuZWwgaXMgbGlrZWx5IGJyb2tlbiBpZiB3ZSBuZWVkIHRvIHN3aXRjaCBw
aW5tdXggbW9kZXMgb24KcmVzdW1lIHRvIGVuc3VyZSB0aGF0IHRoZSAiZGVmYXVsdCIgcGlubXV4
IHN0YXRlIGlzIHJlc3RvcmVkIHVwb24KcmVzdW1lLCB3aGljaCBzZWVtcyB0byBiZSB3aGF0IHlv
dSdyZSBzYXlpbmcgYnkgZ2l2aW5nIGEgci1iIGZvciB0aGlzCnBhdGNoLgoKLS0gClJNSydzIFBh
dGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVz
LwpGVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0
eSBhdCBsYXN0IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
