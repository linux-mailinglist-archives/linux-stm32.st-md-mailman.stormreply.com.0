Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJInH86ttGmDrwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Mar 2026 01:37:34 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F98628AF94
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Mar 2026 01:37:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACB30C87ED6;
	Sat, 14 Mar 2026 00:37:33 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4F7FC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Mar 2026 00:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eZWqpZg1vOaiKoR4DSlmunCSlEkK8XZEpM9MEr5G5jo=; b=gvEPv2PX110hBhxslOImfIn0f9
 LWAqEeoOdUn5h2RMYq340b79VLWjiw8QYQT8S9fpGdRrjvWvRXJhojIqIPrYBOtaPIfTAsVbmbnT0
 LchiVCn6TZbpvagNcWV2HN9SKb1EYKqM6Z4jH5qMBbd8Q9AnoU7NgPSkFh+GeDGq1xVTc8gOqtNKr
 EblEw+cHjU2I0ypHpYMQU4Z+W2NuLabkTO3euT5SO6bX/teM6DkzXhlhjbiphjuH98pVp1xy3FI5T
 7q/ta1QFx5ut7ow/Wv187iiSm2oPibYZ3AiX1bHmgMXmM2Xk0eHDUAZ6AFv8UGuNl+wlncRxUk/Bg
 py9Xu4KQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48042)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w1D0M-000000001eZ-3hM7;
 Sat, 14 Mar 2026 00:37:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w1D0J-000000000FZ-3Cxy; Sat, 14 Mar 2026 00:37:19 +0000
Date: Sat, 14 Mar 2026 00:37:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linusw@kernel.org>
Message-ID: <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
 <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 0F98628AF94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU2F0LCBNYXIgMTQsIDIwMjYgYXQgMTI6NDQ6NTZBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBGcmksIE1hciAxMywgMjAyNiBhdCAxMjowOOKAr1BNIFJ1c3NlbGwgS2luZyAo
T3JhY2xlKQo+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4gT24gRnJpLCBNYXIg
MTMsIDIwMjYgYXQgMTE6NTc6MTZBTSArMDEwMCwgQ2hyaXN0b3BoZSBSb3VsbGllciB3cm90ZToK
PiA+ID4gSW4gdGhlIGRlZXBlc3QgbG93LXBvd2VyIG1vZGVzLCB0aGUgcGluY3RybCBjb25maWd1
cmF0aW9uIGlzIGxvc3QKPiA+ID4gYW5kIGlzIG5ldmVyIHJlc3RvcmVkIGlmIHRoZSBpbnRlcmZh
Y2UgaXMgZG93bi4KPiA+ID4gVGhpcyBjb21taXQgZW5zdXJlcyB0aGF0IHRoZSBwaW5jdHJsIHN0
YXRlIGlzIHNldCBpbiBhbGwgY2FzZXMuCj4gPgo+ID4gU2hvdWxkbid0IHRoZSBwaW4gc3RhdGUg
YmUgcmVzdG9yZWQgYnkgdGhlIHBpbmN0cmwgbGF5ZXI/Cj4gCj4gV2hhdCB3ZSBoYXZlIGluIHRo
ZSBkZXZpY2UgY29yZSBvbmx5IGFwcGxpZXMgImluaXQiIGFuZCAiZGVmYXVsdCIKPiBzdGF0ZXMs
IGFuZCBwcm92aWRlcyB0aGVzZSBoYW5kbGVzIGZvciB0cmFuc2l0aW9uaW5nIHRvICJzbGVlcCIK
PiBhbmQgImRlZmF1bHQiIGFnYWluIChsaWtlIGEgc3RhdGUgbWFjaGluZSkuCgpXaGF0IEkgd2Fz
IG1lYW5pbmcgaXMgdGhhdCAtIGZvciBhIGRyaXZlciB1c2luZyB0aGUgImRlZmF1bHQiIHN0YXRl
LAppZiB0aGUgaGFyZHdhcmUgbG9zZXMgdGhlIHBpbmN0cmwgc3RhdGUgZHVyaW5nIHNsZWVwLCBp
c24ndCBpdCB0aGUKcmVzcG9uc2liaWxpdHkgb2YgdGhlIHBpbmN0cmwgZHJpdmVyIHRvIHJlc3Rv
cmUgdGhlIHN0YXRlIHJhdGhlcgp0aGFuIGxlYXZpbmcgaXQgaW4gd2hhdGV2ZXIgc3RhdGVzIGl0
IGhhcHBlbnMgdG8gYmUgd2hlbiB0aGUgU29DCmNvbWVzIGJhY2sgZnJvbSBzdXNwZW5kPwoKSWYg
dGhhdCBpcyBub3QgdGhlIGNhc2UsIHRoZW4gZG9uJ3Qgd2UgaGF2ZSBhIG1ham9yIGlzc3VlIHdo
ZXJlCmRyaXZlcnMgdXNpbmcgcGluY3RybCBidXQgZG8gbm90IGlzc3VlIGFueSBwaW5jdHJsIGNh
bGxzIGluIHRoZQpyZXN1bWUgZnVuY3Rpb24gYXJlIGJ1Z2d5PwoKLS0gClJNSydzIFBhdGNoIHN5
c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRQ
IGlzIGhlcmUhIDgwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBs
YXN0IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
