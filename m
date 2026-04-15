Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBt9BR2I32nSUgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 14:44:13 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7D9404609
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 14:44:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6D6CC8F286;
	Wed, 15 Apr 2026 12:44:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9D60C8F275
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UyQKCDTxnGTJw71Mu2rprj6cyd6GgdGyAa8DuKAW8c4=; b=Cswnx1KXs9lvtqeyPXB2GfbbT+
 3gXcHhOdEPK2RGQNkTR97u+pDvuccO8W39CMIXcn83fgqWIwZsUcJCsev36tvt4tjFScphSivRC+n
 tigbE7SrhL54KMcqh2FLg6EFvK1oQo189TZ8zw66E3PrluqxvTdg1LEx1YIQXbwq2r/j6qw8gKdwT
 MwkfaRT3TjbM4SSls8cXz6s1GhSD3uxsCnv9v1YT0DC+fU9sYYPYAvRWHfmCKANjvdvpoyuWh9BLw
 5Zt6Pd8gpcqiQUTwdWp0vB2oxEqDEP9d2aDPH88PVMaM0PipMEspk0VWKEfeq1XW0vdkJoU05a9Pl
 Y/k36gEg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38004)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wCzb9-0000000025E-0kHQ;
 Wed, 15 Apr 2026 13:44:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wCzb5-000000002E2-1vhk; Wed, 15 Apr 2026 13:43:59 +0100
Date: Wed, 15 Apr 2026 13:43:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Message-ID: <ad-ID2WaPgPJqdsa@shell.armlinux.org.uk>
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <20260413110222.49fc3759@kernel.org>
 <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
 <CAH5Ym4i7VV53hQGY3AjAUW3B8g_ffgmw69kPhPrk2CmcRbguuQ@mail.gmail.com>
 <ad5LlXzeQ8j14Mjg@shell.armlinux.org.uk>
 <ad7nsUQvksJF7JFK@shell.armlinux.org.uk>
 <CAH5Ym4jA8w9=UxMT4vKJpnXkuDHtkFtMcg4u2sy_0S+8wgy-9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH5Ym4jA8w9=UxMT4vKJpnXkuDHtkFtMcg4u2sy_0S+8wgy-9w@mail.gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cfsworks@gmail.com,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.728];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,armlinux.org.uk:email,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 8B7D9404609
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgMDc6MTI6MzRQTSAtMDcwMCwgU2FtIEVkd2FyZHMgd3Jv
dGU6Cj4gT24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgNjoxOeKAr1BNIFJ1c3NlbGwgS2luZyAoT3Jh
Y2xlKQo+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4gT2theSwganVzdCBhIHF1
aWNrIG5vdGUgdG8gc2F5IHRoYXQgbnZpZGlhJ3MgNS4xMC4yMTYtdGVncmEga2VybmVsCj4gPiBz
dXJ2aXZlcyBpcGVyZjMgLWMgLVIgdG8gdGhlIGlteDYuCj4gCj4gSGkgUnVzc2VsbCwKPiAKPiBB
dywgeW91IGJlYXQgbWUgdG8gaXQhIEkgd2FzIGFib3V0IHRvIHJlcG9ydCB0aGF0IDUuMTAuMTA0
LXRlZ3JhIGlzCj4gdW5hZmZlY3RlZC4gQW5kIG15IGlwZXJmMyBzZXJ2ZXIgaXMgYSBtdWx0aS1H
YkUgYW1kNjQgbWFjaGluZS4KPiAKPiA+IER1bXBpbmcgdGhlIHJlZ2lzdGVycyBhbmQgY29tcGFy
aW5nLCBhbmQgdGhlbiBmb3JjaW5nIHRoZSBSUVMgYW5kIFRRUwo+ID4gdmFsdWVzIHRvIDB4MjMg
KCsxID0gMzYsICoyNTYgPSA5MjE2IGJ5dGVzKSBhbmQgMHg4ZiAoKzEgPSAxNDQsCj4gPiAqMjU2
ID0gMzY4NjQgeXRlcykgcmVzcGVjdGl2ZWx5IHNlZW1zIHRvIHNvbHZlIHRoZSBwcm9ibGVtLiBV
bmRlcgo+ID4gbmV0LW5leHQsIHRoZXNlIGJvdGggZW5kIHVwIGJlaW5nIDB4ZmYgKCsxID0gMjU2
LCAqMjU2ID0gNjU1MzYgYnl0ZXMuKQo+ID4gU3VzcGljaW91c2x5LCAzNiAqIDQgPSAxNDQsIGFu
ZCBJIGFsc28gc2VlIHRoYXQgdGhpcyBrZXJuZWwgcHJvZ3JhbXMKPiA+IGFsbCBmb3VyIG9mIHRo
ZSBNVEwgcmVjZWl2ZSBvcGVyYXRpb24gbW9kZSByZWdpc3RlcnMsIGJ1dCBvbmx5IHRoZQo+ID4g
Zmlyc3QgTVRMIHRyYW5zbWl0IG9wZXJhdGlvbiBtb2RlIHJlZ2lzdGVyLiBIb3dldmVyLCBETUEg
Y2hhbm5lbHMgMS0zCj4gPiBhcmVuJ3QgaW5pdGlhbGlzZWQuCj4gCj4gV293LCBncmVhdCEgSSB3
b25kZXIgaWYgdGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgTVRMIEZJRk9zIGFyZSBzbWFsbGVyCj4g
dGhhbiB0aGF0LCBzbyB3aGVuIHRoZSBETUEgc3VmZmVycyBhIG1vbWVudGFyeSBoaWNjdXAsIHRo
ZSBGSUZPcyBhcmUKPiBhbGxvd2VkIHRvIG92ZXJmbG93LCBwdXR0aW5nIHRoZSBoYXJkd2FyZSBp
biBhIGJhZCBzdGF0ZS4KPiAKPiBUaG91Z2ggSSBzdXNwZWN0IHRoaXMgaXMgb25seSBoYWxmIG9m
IHRoZSBwcm9ibGVtOiBkbyB5b3Ugc3RpbGwgc2VlCj4gUkJVcz8gRXZlcnl0aGluZyB5b3UndmUg
c2hhcmVkIHNvIGZhciBzdWdnZXN0cyB0aGUgRE1BIGZhaWx1cmVzIGFyZQo+IF9ub3RfIGJlY2F1
c2UgdGhlIHJ4IHJpbmcgaXMgZHJ5aW5nIHVwLgoKWWVzLiBOb3RlIHRoYXQgUkJVcyB3aWxsIGhh
cHBlbiBub3QgYmVjYXVzZSBvZiBETUEgZmFpbHVyZXMsIGJ1dCBpZgp0aGUga2VybmVsIGZhaWxz
IHRvIGtlZXAgdXAgd2l0aCB0aGUgcGFja2V0IHJhdGUuIFJCVSBtZWFucyAid2UgcmVhZAp0aGUg
bmV4dCBkZXNjcmlwdG9yLCBhbmQgaXQgd2Fzbid0IG93bmVkIGJ5IGhhcmR3YXJlIi4KCj4gPiBM
b29raW5nIGJhY2sgYXQgNS4xMCwgSSBkb24ndCBzZWUgYW55IGNvZGUgdGhhdCB3b3VsZCBhY2Nv
dW50IGZvciB0aGVzZQo+ID4gdmFsdWVzIGJlaW5nIHByb2dyYW1tZWQgZm9yIFRRUyBhbmQgUlFT
LCBpdCBsb29rcyBsaWtlIHRoZSBjYWxjdWxhdGlvbnMKPiA+IGFyZSBiYXNpY2FsbHkgdGhlIHNh
bWUgYXMgd2UgaGF2ZSB0b2RheS4KPiAKPiBOb3RlIHRoYXQgTnZpZGlhIGhhdmUgdGhlaXIgb3du
ICJudmV0aGVybmV0IiBkcml2ZXIgZm9yIHRoZWlyIHZlbmRvcgo+IGtlcm5lbCwgd2hpY2ggYXBw
ZWFycyB0byBwaWNrIHRoZSBGSUZPIHNpemVzIGZyb20gaGFyZGNvZGVkIHRhYmxlcyBpbgo+IGl0
cyBlcW9zX2NvbmZpZ3VyZV9tdGxfcXVldWUoKSBbMV0gZnVuY3Rpb24uCgpUaGF0IGhhczoKCglj
b25zdCBudmV1MzJfdCByeF9maWZvX3N6WzJVXVtPU0lfRVFPU19NQVhfTlVNX1FVRVVFU10gPSB7
CgkJeyBGSUZPX1NaKDlVKSwgRklGT19TWig5VSksIEZJRk9fU1ooOVUpLCBGSUZPX1NaKDlVKSwK
CQkgIEZJRk9fU1ooMVUpLCBGSUZPX1NaKDFVKSwgRklGT19TWigxVSksIEZJRk9fU1ooMVUpIH0s
CgkJeyBGSUZPX1NaKDM2VSksIEZJRk9fU1ooMlUpLCBGSUZPX1NaKDJVKSwgRklGT19TWigyVSks
CgkJICBGSUZPX1NaKDJVKSwgRklGT19TWigyVSksIEZJRk9fU1ooMlUpLCBGSUZPX1NaKDE2VSkg
fSwKCX07Cgljb25zdCBudmV1MzJfdCB0eF9maWZvX3N6WzJVXVtPU0lfRVFPU19NQVhfTlVNX1FV
RVVFU10gPSB7CgkJeyBGSUZPX1NaKDlVKSwgRklGT19TWig5VSksIEZJRk9fU1ooOVUpLCBGSUZP
X1NaKDlVKSwKCQkgIEZJRk9fU1ooMVUpLCBGSUZPX1NaKDFVKSwgRklGT19TWigxVSksIEZJRk9f
U1ooMVUpIH0sCgkJeyBGSUZPX1NaKDhVKSwgRklGT19TWig4VSksIEZJRk9fU1ooOFUpLCBGSUZP
X1NaKDhVKSwKCQkgIEZJRk9fU1ooOFUpLCBGSUZPX1NaKDhVKSwgRklGT19TWig4VSksIEZJRk9f
U1ooOFUpIH0sCgl9OwoKd2hlcmUgZWFjaCBvZiB0aG9zZSB2YWx1ZXMgaXMgdGhlIFJRUy9UUVMg
dmFsdWUgdG8gdXNlIGluIEtpQjoKCiNkZWZpbmUgRklGT19TWih4KQkJKCgoKHgpICogMTAyNFUp
IC8gMjU2VSkgLSAxVSkKClRoaXMgZG9lc24ndCBjb3JyZXNwb25kIHdpdGggdGhlIHZhbHVlcyBJ
J20gc2VlaW5nIHByb2dyYW1tZWQgaW50bwp0aGUgaGFyZHdhcmUgdW5kZXIgdGhlIDUuMTAuMjE2
LXRlZ3JhIGtlcm5lbC4gSSdtIHNlZWluZyBUUVMgPSAxNDMKKDM2S2lCKSwgYW5kIFJRUyA9IDM1
ICg5S2lCKS4gWWVzLCB0aGVzZSB2YWx1ZXMgZXhpc3QgaW4gdGhlIHRhYmxlcwphYm92ZSBmcm9t
IGEgcXVpY2sgbG9vaywgYnV0IHRoZXkncmUgbm90IGluIHRoZSByaWdodCBwbGFjZSEKCkZvciBl
eGFtcGxlLCB0eF9maWZvX3N6W10gZG9lc24ndCBjb250YWluIGFuIGVudHJ5IGZvciAzNktpQi4K
cnhfZmlmb19zelswXVswLi4zXSBsb29rcyBwbGF1c2libGUuCgpJdCdzIGNlcnRhaW5seSBub3Qg
YSBjYXNlIG9mIG1pc3JlYWRpbmcgdGhlIHJlZ2lzdGVyIHZhbHVlcywgdGhpcyBpcwp3aGF0IGRl
dm1lbTIgc2FpZDoKClZhbHVlIGF0IGFkZHJlc3MgMHgwMjQ5MGQwMDogMHgwMDhmMDAwYQpWYWx1
ZSBhdCBhZGRyZXNzIDB4MDI0OTBkMzA6IDB4MDIzNzllYjAKCndoZXJlIFRRUyBpcyBiaXRzIDI0
OjE2IG9mIHRoZSByZWdpc3RlciBhdCBvZmZzZXQgMHhkMDAgLSB3aGljaCBpcwoweDhmLCBhbmQg
UlFTIGlzIGJpdHMgMjk6MjAgb2YgdGhlIHJlZ2lzdGVyIGF0IDB4ZDMwLCB3aGljaCBpcwoweDIz
LgoKTm93LCBhcyBmb3IgRklGTyBzaXplcywgaWYgd2Ugc3VtIHVwIGFsbCB0aGUgZW50cmllcywg
dGhlbiB3ZQpnZXQ6CgpTVU0ocnhfZmlmb19zaXplWzBdW10pID0gNjBLaUIKU1VNKHJ4X2ZpZm9f
c2l6ZVsxXVtdKSA9IDY0S2lCClNVTSh0eF9maWZvX3NpemVbMF1bXSkgPSA2MEtpQgpTVU0odHhf
Zmlmb19zaXplWzFdW10pID0gNjRLaUIKCkZyb20gd2hhdCBJIGdhdGhlciBpbiBjb3JlX2xvY2Fs
LmgsIGxfbWFjX3ZlciBjb250YWlucyBvbmUgb2YgdGhyZWUKdmFsdWVzIC0gMCA9IExlZ2FjeSBF
UU9TLCAxID0gT3JpbiBFUU9TLCAyID0gT3JpbiBNR0JFLCBhbmQgd2hpY2gKc2V0IG9mIHZhbHVl
cyBpcyBzZWxlY3RlZCBieSBiaXQgMCBvZiB0aGF0LiBEZWNvZGluZyB0aGlzIGZ1cnRoZXIsCkxl
Z2FjeSBFUU9TIGlzIElQIHZlcnNpb24gdjUuMCwgT3JpbiBFUU9TIGlzIHY1LjMsIGFuZCBPcmlu
IE1HQkUKaXMgdjMuMSBhbmQgdjQuMC4KClNvLCBJIHdvbmRlciB3aGV0aGVyIHRoZXJlJ3Mgc29t
ZXRoaW5nIGluICJMZWdhY3kgRVFPUyIgdGhhdCBjb25zdW1lcwo0S2lCIG9mIEZJRk8gdGhhdCBp
c24ndCBkb2N1bWVudGVkIGluIGlNWDhNIChJUCB2NS4xKS4KCklzIGFueW9uZSBhd2FyZSBvZiBw
dWJsaWMgU29DIGRvY3VtZW50YXRpb24gdGhhdCBjb3ZlcnMgdGhlIHY1LjAgSVAKdmVyc2lvbj8K
Ci0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZl
bG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2Vu
dCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
