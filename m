Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHw4IVia3GkxUAkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 09:25:12 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8BC3E82D9
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 09:25:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C56BC36B3C;
	Mon, 13 Apr 2026 07:25:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03035C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 07:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6UfJz29jZ/mDOwE6MDp0t4YF4VN3Gzp/B3Pai9lhUsA=; b=F3c8B0/QIt2+9CIrfCWknmZZeO
 5Gf3AK+0v92dafXSnLeBS75fQ9GiSAly37Nj7hrIoodHNglk5igk4AQajg8JvH6I7004BiBhj/dqn
 /rA+qCS+ZpUSuEC9nYvPG74mx5IJqqAeh0Zi/PKybmy2TqW9rYLNr5ThCTC0vr/3khdxT61xBmODh
 MQSILXKl68l/YGqt/nrTa/TEUCXf3eMTaHe5UKjXYK97VimUhvO7Q7hpZclik3Z7umtTlU9ggy0dm
 4mS4quRmPdlSpg8MIRb6SDmjM5v63Y2nGJVrST02wNvd+23aoVVATa42Jeyat3wqzvEJm5b7d0gs3
 E4MBzHhw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45994)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wCBfK-000000007vb-44FK;
 Mon, 13 Apr 2026 08:25:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wCBfH-000000008Rc-0zFk; Mon, 13 Apr 2026 08:24:59 +0100
Date: Mon, 13 Apr 2026 08:24:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Message-ID: <adyaS3EauyrNrjMy@shell.armlinux.org.uk>
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <266998d8-7e38-4bae-a4df-2f889538fe88@bootlin.com>
 <aduq7Lvkfrz971Rb@shell.armlinux.org.uk>
 <CAH5Ym4hEX15dmJhGBqhhk--_PoFRKRSyE1AomY4D3ipwAz+pKg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH5Ym4hEX15dmJhGBqhhk--_PoFRKRSyE1AomY4D3ipwAz+pKg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cfsworks@gmail.com,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	NEURAL_SPAM(0.00)[0.213];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,shell.armlinux.org.uk:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 1A8BC3E82D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU3VuLCBBcHIgMTIsIDIwMjYgYXQgMDY6NDI6MDRQTSAtMDcwMCwgU2FtIEVkd2FyZHMgd3Jv
dGU6Cj4gT24gU3VuLCBBcHIgMTIsIDIwMjYgYXQgNzoyM+KAr0FNIFJ1c3NlbGwgS2luZyAoT3Jh
Y2xlKQo+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4gQXMgdGhlIGR3bWFjIDUu
MCBjb3JlIHJlY2VpdmUgcGF0aCBzZWVtcyB0byBsb2NrIHVwIGFmdGVyIHRoZSBmaXJzdAo+ID4g
UkJVLCBJIG5ldmVyIHNlZSBtb3JlIHRoYW4gb25lIG9mIHRob3NlIGF0IGEgdGltZS4KPiA+Cj4g
PiBSaWdodCBub3csIEkgY29uc2lkZXIgdGhpcyBwcmV0dHkgbXVjaCB1bnNvbHZhYmxlIC0gSSd2
ZSBzcGVudCBxdWl0ZQo+ID4gc29tZSB0aW1lIGxvb2tpbmcgYXQgaXQgYW5kIHRyeWluZyB2YXJp
b3VzIGFwcHJvYWNoZXMsIG5vdGhpbmcgc2VlbXMKPiA+IHRvIGZpeCBpdC4gSG93ZXZlciwgYWRk
aW5nIGRtYV9ybWIoKSBpbiB0aGUgZGVzY3JpcHRvciBjbGVhbnVwL3JlZmlsbAo+ID4gcGF0aHMg
ZG9lcyBzZWVtIHRvIGltcHJvdmUgdGhlIHNpdHVhdGlvbiBhIGxpdHRsZSB3aXRoIHRoZSA0ODBN
YnBzCj4gPiBjYXNlLCBiZWNhdXNlIEkgdGhpbmsgaXQgbWVhbnMgdGhhdCB3ZSdyZSByZWFkaW5n
IHRoZSBkZXNjcmlwdG9ycyBpbgo+ID4gYSBtb3JlIHRpbWVseSBtYW5uZXIgYWZ0ZXIgdGhlIGhh
cmR3YXJlIGhhcyB1cGRhdGVkIHRoZW0uCj4gCj4gSGV5IFJ1c3NlbGwsCj4gCj4gSSdkIGxpa2Ug
dG8gcmVwcm8gdGhpcyBidXQgSSBjdXJyZW50bHkgY2FuJ3QgYm9vdCBuZXQtbmV4dC4gTXkgaXNz
dWUKPiBpcyB0aGUgc2FtZSBhcyBbMV0sIGFuZCB0aGUgcGF0Y2ggdG8gZml4IGl0IFsyXSBpc24n
dCB5ZXQgY29tbWl0dGVkCj4gYW55d2hlcmUgYXBwYXJlbnRseS4KPiAKPiBUaGlzIHByZXZlbnRz
IG15IEpldHNvbiBYYXZpZXIgTlggZnJvbSBzdGFydGluZyBhdCBhbGwgKGFuZCBhZnRlcgo+IGVu
b3VnaCBhdHRlbXB0cywgY29ycnVwdHMgZU1NQyk7IEknbSBzdXJwcmlzZWQgeW91J3JlIG5vdCBz
dWZmZXJpbmcKPiB0aGUgc2FtZSBlZmZlY3RzLiBCdXQgYmVjYXVzZSB0aGlzIGJ1ZyBsaXZlcyBp
biB0aGUgSU9NTVUgc3Vic3lzdGVtCj4gKGFuZCBpdCBoYXMgc29tZXdoYXQgaW5jb25zaXN0ZW50
IGVmZmVjdHMpLCBwZXJoYXBzIHRoaXMgaXMganVzdCBhCj4gZGlmZmVyZW50IHdheSBpdCBtYW5p
ZmVzdHM/IENvdWxkIHlvdSBjb25maXJtIHdoZXRoZXIgeW91ciBkd21hYyBoYW5nCj4gaGFwcGVu
cyB3aXRoIElPTU1VIGRpc2FibGVkLCBhbmQvb3Igd2l0aCBbMV0gcmV2ZXJ0ZWQgb3IgWzJdIGFw
cGxpZWQ/Cj4gCj4gSSdtIHVzaW5nIGEgZGVmY29uZmlnIGJ1aWxkIGFuZCBhIGZhaXJseSBtaW5p
bWFsIGNtZGxpbmUgKGp1c3QKPiBjb25zb2xlPSwgcm9vdD0sIGFuZCByb290d2FpdCkuCj4gCj4g
Q2hlZXJzLAo+IFNhbQo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvODgwMGEz
OGItODUxNS00YmJlLWFmMTUtMGRhZTgxMjc0YmY3QG52aWRpYS5jb20vCj4gWzJdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8wLXYxLTY2NGQzYWNhYWJiOSs3OGItaW9tbXVfZ2F0aGVyX2Fs
d2F5c19qZ2dAbnZpZGlhLmNvbS8KCkluIHRoZSBzZWNvbmQgbGluaywgdGhlcmUgaXMgdGhpcyBz
dWItdGhyZWFkOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2VlMmMyMDQ0LWUzMjktNGNk
ZC1hYzM1LTkzNjU4MjRkMzY3N0Bhcm0uY29tLwoKd2hpY2ggd2FzIGNvbW1pdHRlZCBpbnRvIC1y
YyBhczoKCjdlMDU0ODUyNWFiZCBpb21tdTogRW5zdXJlIC5pb3RsYl9zeW5jIGlzIGNhbGxlZCBj
b3JyZWN0bHkKCndoaWNoIGRvZXMgZml4IElPTU1VIHByb2JsZW1zIHdoaWNoIGNhdXNlZCBuZXQt
bmV4dCB3aGljaCByZXBvcnRzIGl0c2VsZgphcyB2Ny4wLXJjNiBmYWlsaW5nIHRvIGJvb3Qgd2l0
aCBleHQ0IGVycm9ycy4gU2VlOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9hZFpUR09qakpy
VkpPY1Q4QHNoZWxsLmFybWxpbnV4Lm9yZy51awoKd2hpY2ggcmVzdWx0ZWQgaW4gaXQgYmVpbmcg
bWVyZ2VkIGludG8gdjcuMC1yYzcganVzdCBiZWZvcmUgVGh1cnNkYXkncwpuZXQgdHJlZSBtZXJn
ZS4gRHVlIHRvIHRoZSB3YXkgbmV0LW5leHQgaXMgb3BlcmF0ZWQsIHRoYXQgbWVhbnMgdGhhdApu
ZXQtbmV4dCBvbiBUaHVyc2RheSBldmVuaW5nIGdhaW5lZCB0aGlzIGZpeC4KCkludm9sdmluZyBM
aW51cyBpbiB0aGUgcHJvYmxlbSBtZWFudCBoZSB3YXMgYXdhcmUgb2YgaXQsIGFuZCBleHBsYWlu
aW5nCmhvdyBuZXRkZXYgd29ya3MgYWxsb3dlZCBoaW0gdG8gZGVsYXkgdGhlIG1lcmdpbmcgb2Yg
dGhlIG5ldCB0cmVlIHRvCmVuc3VyZSBuZXQtbmV4dCBnYWluZWQgdGhlIGZpeC4KCi0tIApSTUsn
cyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0
Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0
aXZpdHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
