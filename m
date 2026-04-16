Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMvxH0Mn4GkIdAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 02:03:15 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFE440924E
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 02:03:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CF3DC3F944;
	Thu, 16 Apr 2026 00:03:14 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA43BC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2026 00:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b1XEqYLz+VFVxVLLY5sh99l0d3isS+L35SSH4/U236E=; b=K147q+AkNu7v6MOBFr/Kx4ZCS/
 T0csGRKPmVl/FJDc2YFb2Bzm5v5cwtje9EpZ6KgxOUb2amWuMMo0wFreTVxnU9hsCKzKZb8RoaQHl
 brC5TGP5MX2BvqHZZbg0QvpD/1swD/EJRWAX42+71zg6jBg1xF4SJQXJbyRXn3kAnIFt1JH+uCXpc
 9v1IJV3rorGpFxGr8ACW0UEYa0ON60Wya88Na71bjBSjJsSzSDVSulraB1IHGeRO1fSdrFIsbSJPj
 fIH6YoeI2nxlJ8Jq5a5ex2QOji0i6GP8TDSCVBqVReHYCT7BbDB7H9x04siYBRQdMsk7X7FYrgbbp
 2bzSa/2g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55132)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wDACE-000000002d7-1Y8c;
 Thu, 16 Apr 2026 01:03:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wDACA-000000002fX-2zo6; Thu, 16 Apr 2026 01:02:58 +0100
Date: Thu, 16 Apr 2026 01:02:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Message-ID: <aeAnMTU6iiPPE0_W@shell.armlinux.org.uk>
References: <20260413110222.49fc3759@kernel.org>
 <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
 <CAH5Ym4i7VV53hQGY3AjAUW3B8g_ffgmw69kPhPrk2CmcRbguuQ@mail.gmail.com>
 <ad5LlXzeQ8j14Mjg@shell.armlinux.org.uk>
 <ad7nsUQvksJF7JFK@shell.armlinux.org.uk>
 <CAH5Ym4jA8w9=UxMT4vKJpnXkuDHtkFtMcg4u2sy_0S+8wgy-9w@mail.gmail.com>
 <ad-ID2WaPgPJqdsa@shell.armlinux.org.uk>
 <CAH5Ym4jKdzDeYwCfkMLmUz0FsiD2vFwfuAvqFE=uvMtPmakeMQ@mail.gmail.com>
 <ad_o4aDP0UBY_8i4@shell.armlinux.org.uk>
 <CAH5Ym4j3GePEMEMmg1Z27gYfQ0N8Sc1BMW1rnvNZ4aLQ+cfFyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH5Ym4j3GePEMEMmg1Z27gYfQ0N8Sc1BMW1rnvNZ4aLQ+cfFyQ@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux Network Development Mailing List <netdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ASN_FAIL(0.00)[89.6.209.52.asn.rspamd.com:server fail];
	FORGED_RECIPIENTS(0.00)[m:cfsworks@gmail.com,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.702];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shell.armlinux.org.uk:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 8DFE440924E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBBcHIgMTUsIDIwMjYgYXQgMDE6NTA6NTNQTSAtMDcwMCwgU2FtIEVkd2FyZHMgd3Jv
dGU6Cj4gT24gV2VkLCBBcHIgMTUsIDIwMjYgYXQgMTI6MzfigK9QTSBSdXNzZWxsIEtpbmcgKE9y
YWNsZSkKPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4gPiBJdCdzIG5vdCBh
IHF1ZXN0aW9uIGFib3V0IGhvdyBJIGRlZmluZSBSQlUgLSB0aGlzIGlzIGRlZmluZWQgYnkgU3lu
b3BzeXMKPiA+IGFuZCBJJ20gdXNpbmcgaXQgKmV4YWN0bHkqIHRoYXQgd2F5IGFzIHN0YXRlZCBp
biB0aGUgZG9jdW1lbnRhdGlvbi4KPiA+Cj4gPiAiVGhpcyBiaXQgaW5kaWNhdGVzIHRoYXQgdGhl
IGhvc3Qgb3ducyB0aGUgTmV4dCBEZXNjcmlwdG9yIGluIHRoZQo+ID4gUmVjZWl2ZSBMaXN0IGFu
ZCB0aGUgRE1BIGNhbm5vdCBhY3F1aXJlIGl0LiBUaGUgUmVjZWl2ZSBQcm9jZXNzIGlzCj4gPiBz
dXNwZW5kZWQuIC4uLiBUaGlzIGJpdCBpcyBzZXQgb25seSB3aGVuIHRoZSBwcmV2aW91cyBSZWNl
aXZlCj4gPiBEZXNjcmlwdG9yIGlzIG93bmVkIGJ5IHRoZSBETUEuIgo+ID4KPiA+IEluIG90aGVy
IHdvcmRzLCBETUEgaGFzIHByb2Nlc3NlZCB0aGUgcHJldmlvdXMgcmVjZWl2ZSBkZXNjcmlwdG9y
IHdoaWNoCj4gPiBfd2FzXyBvd25lZCBieSB0aGUgaGFyZHdhcmUsIHdyaXR0ZW4gYmFjayB0byBj
bGVhciB0aGUgT1dOIGJpdCwgYW5kCj4gPiB0aGVuIGZldGNoZXMgdGhlIG5leHQgZGVzY3JpcHRv
ciBhbmQgZmluZHMgdGhhdCB0aGUgT1dOIGJpdCBpcyBhbHNvCj4gPiBjbGVhci4KPiAKPiBJJ20g
b25seSB0cnlpbmcgdG8gbGVhdmUgb3BlbiB0aGUgcG9zc2liaWxpdHkgdGhhdCB0aGUgU3lub3Bz
eXMKPiB0ZWNobmljYWwgd3JpdGVyIGFuZCB0aGUgaGFyZHdhcmUgaW1wbGVtZW50YXRpb24gdGVh
bSB3ZXJlbid0Cj4gY29tbXVuaWNhdGluZyBjbGVhcmx5LiBXZSBhbHJlYWR5IGhhdmUgYSBzaXR1
YXRpb24gd2hlcmUgUlBTIGlzbid0Cj4gYmVoYXZpbmcgYXMgZG9jdW1lbnRlZCAoZXZlbiBpZiB0
aGF0J3MgbGlrZWx5IGp1c3QgaGFyZHdhcmUKPiBtaXNjb25maWd1cmF0aW9uKSwgc28gd2hpbGUg
SSdtIGN1cnJlbnRseSBwcmV0dHkgc3VyZSBSQlUgY2FycmllcyBubwo+IG90aGVyIChhY3R1YWwp
IG1lYW5pbmcgdGhhbiAiRE1BIGNhdWdodCB1cCB0byBPV049MCwiIEknbSBvbmx5IGFib3V0Cj4g
NzUlIGNvbmZpZGVudC4KCkl0IGRvZXNuJ3QgbWFrZSBzZW5zZSBmb3IgUlBTIHRvIGJlIHNldCB0
aG91Z2guIFJQUyBpcyAiUmVjZWl2ZSBQcm9jZXNzClN0b3BwZWQiIGFuZCBpdCdzIGRvY3VtZW50
ZWQgYXMgYmVpbmcgcmFpc2VkIHdoZW4gdGhlIHJlY2VpdmUgcHJvY2VzcwplbnRlcnMgdGhlIHN0
b3BwZWQgc3RhdGUuCgpJZiB3ZSBsb29rIGF0IHRoZSBETUEgRGVidWcgU3RhdHVzIDAgcmVnaXN0
ZXIgYXQgMHgxMDBjLCB0aGVuIHRoaXMKZ2l2ZXMgdXMgYSBmb3VyIGJpdCBiaXRmaWVsZCBmb3Ig
Y2hhbm5lbHMgMCwgMSBhbmQgMi4gRnVydGhlciBjaGFubmVscwphcmUgaW4gMHgxMDEwLiBJJ3Zl
IGFkZGVkIGNvZGUgdG8gZHVtcCB0aGVzZSB3aGVuIFJCVSBvY2N1cnM6Cgpkd2MtZXRoLWR3bWFj
IDI0OTAwMDAuZXRoZXJuZXQgZXRoMDogZGVidWcgc3RhdHVzOiAweDAwMDA2NDAwIDB4MDAwMDAw
MDAKCmJpdHMgMTE6OCBhcmUgUlBTMCwgd2hpY2ggaW5kaWNpYXRlcyB0aGF0IHRoZSBETUEgY2hh
bm5lbCAwIHJlY2VpdmUKcHJvY2VzcyBzdGF0ZSBpcyAiU3VzcGVuZGVkIChSeCBEZXNjcmlwdG9y
IFVuYXZhaWxhYmxlKSIuIElmIHRoaXMgd2VyZQowLCB0aGVuIGl0IHdvdWxkIGJlICJTdG9wcGVk
IChSZXNldCBvciBTdG9wIFJlY2VpdmUgQ29tbWFuZCBpc3N1ZWQpIi4KClNvLCBSUFMgaXNuJ3Qg
YmVpbmcgcmFpc2VkIGJlY2F1c2UgdGhlIHByb2Nlc3Mgc3RhdGUgaXNuJ3QgZW50ZXJpbmcKdGhl
IHN0b3BwZWQgc3RhdGUsIHdoaWNoIG1ha2VzIHNlbnNlIC0gYmVjYXVzZSB3ZSBoYXZlbid0IGlz
c3VlZCBhCnN0b3AgY29tbWFuZCwgbm9yIGhhdmUgd2UgY2F1c2VkIGEgcmVzZXQsIGFuZCB0aGUg
ZG9jdW1lbnRlZCByZWNvdmVyeQpmcm9tIHRoaXMgY29uZGl0aW9uIGlzIHRvIG1lcmVseSBhZHZh
bmNlIHRoZSB0YWlsIHBvaW50ZXIsIHJhdGhlciB0aGFuCmlzc3VpbmcgYSBjb21tYW5kIHRvIHJl
LXN0YXJ0IHRoZSByZWNlaXZlIHByb2Nlc3MuCgpXaGVuIHRoaXMgaXMgZG9uZSAoYmVjYXVzZSBz
dG1tYWNfcngoKSBjb250aW51ZXMgdG8gcGVyaW9kaWNhbGx5IHJ1bgpiZWNhdXNlIG9mIE5BUEkp
IFJQUzAgZG9lcyBjaGFuZ2UgYmFjayB0byAzICJSdW5uaW5nIChXYWl0aW5nIGZvciBSeApwYWNr
ZXQpIiBidXQgaXQgc2VlbXMgdGhhdCBhbHRob3VnaCB0aGVyZSBhcmUgcGFja2V0cyB3YWl0aW5n
IHRvIGJlCndyaXR0ZW4gb3V0LCB0aGF0IG5ldmVyIGhhcHBlbnMgKHRoZSBRdWV1ZSAwIFJlY2Vp
dmUgRGVidWcgcmVnaXN0ZXIKaW5kaWNhdGVzIHRoYXQgdGhlcmUgYXJlIHBhY2tldHMgaW4gdGhl
IHJlY2VpdmUgcXVldWUsIHRoZSByZWNlaXZlCnF1ZXVlIGZpbGwgbGV2ZWwgaXMgYWJvdmUgdGhl
IGZsb3cgY29udHJvbCBhY3RpdmF0ZSB0aHJlc2hvbGQsIGFuZAp0aGUgTUFDIGl0c2VsZiBoYW1t
ZXJzIHRoZSBuZXR3b3JrIHdpdGggcGF1c2UgZnJhbWVzIGFzIGEgcmVzdWx0LikKClRodXMsIEkg
dGhpbmsgdGhhdCB0aGUgZmFjdCB0aGF0IFJQUyBpc24ndCBiZWluZyBzaWduYWxsZWQgaXMgZW50
aXJlbHkKcmVhc29uYWJsZSBhbmQgY29uc2lzdGVudCB3aXRoIHRoZSBhdmFpbGFibGUgZG9jdW1l
bnRhdGlvbi4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9y
Zy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMg
dXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
