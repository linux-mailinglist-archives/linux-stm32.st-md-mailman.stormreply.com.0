Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJEZBmS32GnnhAgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 10:40:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B903D43B9
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 10:40:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B080C87EC5;
	Fri, 10 Apr 2026 08:40:03 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2318CC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2026 08:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZdOnR/1mCgonR7f2wP3H5JqrF/rCMapSujGWUMtD9/A=; b=rqmqyPCMlvW3KvDYDz3/ETNIAh
 G+ESQPCwbBnKWQSJh+ewTI/voRE6d3Ofr1iTuT3bDkAk27P35fRCtsFZbsndaH/5R0K66REmgJSa9
 6DVG3w9ciTeMT7N2D8gBgu388hIIZw6pNykZbUBWSDiL7IR0aL2hPrX8lB4FFeNyxkZ34crCfawWq
 ET2uU1utHtMx1ISS5KHV4cXaCRdUmtsF7xMSq6W4rlj8YdqvT2Z4amTnf9HBxDn9tiMn2tvOV0lU9
 fP2Wv8AVO7k6NoEkFKJOMMsTBV69KWgM7sywkLGQu709m6YCrVMKL6osnzUr1As2obFMhYf3OddEf
 Nyrg83EA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45482)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wB7P7-000000004e2-341K;
 Fri, 10 Apr 2026 09:39:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wB7P4-000000005UF-3z5f; Fri, 10 Apr 2026 09:39:50 +0100
Date: Fri, 10 Apr 2026 09:39:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <adi3Vks-N0a83ylE@shell.armlinux.org.uk>
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk>
 <E1wAPBR-0000000F7ju-1fD9@rmk-PC.armlinux.org.uk>
 <CAMdnO-+TK65AxjTsDd017Mhop+VC3Xf8jtfaTXYpE6wBNZOt4g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMdnO-+TK65AxjTsDd017Mhop+VC3Xf8jtfaTXYpE6wBNZOt4g@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 02/10] net: stmmac: rename
	dev_id to userver
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
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jitendra.vegiraju@broadcom.com,m:andrew@lunn.ch,m:pabeni@redhat.com,m:samuel@sholland.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.865];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,armlinux.org.uk:email,armlinux.org.uk:url,stormreply.com:email,stormreply.com:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: B1B903D43B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBBcHIgMDksIDIwMjYgYXQgMDQ6MDc6NDJQTSAtMDcwMCwgSml0ZW5kcmEgVmVnaXJh
anUgd3JvdGU6Cj4gSGkgUnVzc2VsbCwKPiAKPiBPbiBXZWQsIEFwciA4LCAyMDI2IGF0IDI6Mjfi
gK9BTSBSdXNzZWxsIEtpbmcgKE9yYWNsZSkKPiA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+
IHdyb3RlOgo+ID4KPiA+IFRoZSBTeW5vcHN5cyBEYXRhYm9vayBhbmQgc2V2ZXJhbCBpbXBsZW1l
bnRhdGlvbiBUUk1zIGlkZW50aWZ5IGJpdHMKPiA+IDE1Ojggb2YgdGhlIHZlcnNpb24gcmVnaXN0
ZXIgaW4gZHdtYWMgdjMueHggYW5kIHY0Lnh4IGFzICJ1c2VydmVyIi4KPiA+IFdlIGV2ZW4gcHJp
bnQgaXRzIHZhbHVlIHdpdGggIlVzZXIgSUQiLiBSYXRoZXIgdGhhbiB1c2luZyAiZGV2X2lkIiwK
PiA+IHVzZSAidXNlcnZlciIgaW5zdGVhZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxs
IEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgo+ID4gLS0tCj4gPiAg
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvaHdpZi5jIHwgMTggKysrKysrKysr
LS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvaHdpZi5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvaHdpZi5j
Cj4gPiBpbmRleCAzNzc0YWY2NmRiNDguLjgzMGZmODE2YWI0ZiAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2h3aWYuYwo+ID4gKysrIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvaHdpZi5jCj4gPiBAQCAtMTUsNyArMTUsNyBA
QAo+ID4KPiA+ICBzdHJ1Y3Qgc3RtbWFjX3ZlcnNpb24gewo+ID4gICAgICAgICB1OCBzbnBzdmVy
Owo+ID4gLSAgICAgICB1OCBkZXZfaWQ7Cj4gPiArICAgICAgIHU4IHVzZXJ2ZXI7Cj4gPiAgfTsK
PiBGcm9tIHRoZSBYR01BQyBkYXRhYm9vayB0aGF0IEkgaGF2ZSBhY2Nlc3MgdG8gYml0cygxNTo4
KSBpZGVudGlmeSB0aGUKPiBERVZJRCBmaWVsZCBvZiBNQUNfdmVyc2lvbiByZWdpc3Rlci4KPiBU
aGUgdXNlcnZlciBmaWVsZCBpcyBmcm9tIGJpdHMoMjM6MTYpIG9mIHRoZSBzYW1lIHJlZ2lzdGVy
LiBUaGlzIGlzIGEKPiBjdXN0b21lciBkZWZpbmVkIGZpZWxkIChjb25maWd1cmVkIHdpdGggY29y
ZUNvbnN1bHRhbnQpLgo+IEN1cnJlbnRseSBzdG1tYWMgZG9lc24ndCBjYXJlIGFib3V0IGJpdHMo
MjM6MTYpLgoKVGhhbmtzIGZvciB0aGUgYWRkaXRpb25hbCBpbmZvcm1hdGlvbi4KCkkgZG9uJ3Qg
aGF2ZSBhbnkgWEdNQUMgZG9jdW1lbnRhdGlvbiwgYnV0IHRoaXMgaW5kaWNhdGVzIHRoYXQgaXQg
ZGlmZmVycwpiZXR3ZWVuIFhHTUFDIGFuZCBwcmV2aW91cyBjb3JlcyAtIEdNQUMgYW5kIEdNQUM0
IGNvcmVzLCAxNTo4IGFyZQpkb2N1bWVudGVkIGFzIHVzZXJ2ZXIsIGFuZCAzMToxNiBhcmUgbWFy
a2VkIGFzIHJlc2VydmVkLgoKTm90ZSB0aGF0IHRoZSBkZXZfaW5mbygpIGFsc28gcHJpbnRzIDE1
OjggYXMgIlVzZXIgSUQiIG5vdCAiRGV2aWNlIElEIi4KClRvIGNvbmZpcm0sIGlzIHRoZSBYR01B
QyB2ZXJzaW9uIHJlZ2lzdGVyIGF0IG9mZnNldCAweDIwID8gTGF0ZXIgR01BQwpjb3JlcyBtb3Zl
ZCBpdCB0byAweDExMC4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxp
bnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAx
ME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
