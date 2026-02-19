Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPUoNqJjl2mnxgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Feb 2026 20:25:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51746161F5A
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Feb 2026 20:25:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0321C8F273;
	Thu, 19 Feb 2026 19:25:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A06F7C87ECA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 19:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dPP/cIarqO1P9h9eWlYa372Rs/GIxWfK5Giq5Q6Jtr8=; b=o14AFEFWgr4pXheJHwdZbvcLVX
 H7IWEeMLSvtYiqinwiXG68B+CxFS5PshaScxPl5Kc/wg4ZXrMcK+OZsRvuW/O2pNbPNPZLTEZvTe5
 YL2XTPxup0UUF0P34vmXe3UZkj/ZChdsE+KslfVEM7eS/hb1UNw//4S/P0dpenrlFIvPfR/DZDZBo
 ceRP++HlA46ZXqXNlGFBfDAq4MMA/Mo5LV3WHNSBPe9n3DE0QRAUAxTTsTx5vFd4r8xAtKEiTHHqv
 yI1ViidDr/qHM031HgJ4BqBvEUVNNd7LAtsMkce2iVxNSkQMoXFXjWMMtpq8vrEeC10MX+W9ikSKm
 wisGstpA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46806)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vt9e9-000000001EC-0CuB;
 Thu, 19 Feb 2026 19:25:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vt9e5-000000003ZS-1kp1; Thu, 19 Feb 2026 19:25:05 +0000
Date: Thu, 19 Feb 2026 19:25:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linusw@kernel.org>
Message-ID: <aZdjke4eOwF-wTZO@shell.armlinux.org.uk>
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
 <20260218083618.67805-3-christophe.roullier@foss.st.com>
 <aZV-b6TdLMdI8dm4@shell.armlinux.org.uk>
 <CAD++jLnF=8MvW4CbXmPZR=w8tAUZiL9M3N73WB++DaYYwhToDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD++jLnF=8MvW4CbXmPZR=w8tAUZiL9M3N73WB++DaYYwhToDQ@mail.gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] net: stmmac: restore pinctrl when
	driver remove.
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
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:christophe.roullier@foss.st.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,foss.st.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.891];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,armlinux.org.uk:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 51746161F5A
X-Rspamd-Action: no action

T24gVGh1LCBGZWIgMTksIDIwMjYgYXQgMDg6MTE6MTNQTSArMDEwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBXZWQsIEZlYiAxOCwgMjAyNiBhdCA5OjU14oCvQU0gUnVzc2VsbCBLaW5nIChP
cmFjbGUpCj4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPiBPbiBXZWQsIEZlYiAx
OCwgMjAyNiBhdCAwOTozNjoxN0FNICswMTAwLCBDaHJpc3RvcGhlIFJvdWxsaWVyIHdyb3RlOgo+
ID4gPiB3aGVuIHN5c3RlbSBzdXNwZW5kIG9yIHVuYmluZCwgbmVlZCB0byBzZXQgcGlucwo+ID4g
PiB0byBsb3cgcG93ZXIgc3RhdGUgdG8gc2F2ZSBJTyBwb3dlciBjb25zdW1wdGlvbi4KPiA+ID4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBSb3VsbGllciA8Y2hyaXN0b3BoZS5yb3Vs
bGllckBmb3NzLnN0LmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jIHwgMyArKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4gPiA+IGluZGV4IDA2N2IxN2YwM2NkMDku
LjNkNGYwZTRjYjUzZmIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiA+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ID4gPiBAQCAtODA3MSw2ICs4MDcxLDkg
QEAgdm9pZCBzdG1tYWNfZHZyX3JlbW92ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiA+ICAgICAg
IG11dGV4X2Rlc3Ryb3koJnByaXYtPmxvY2spOwo+ID4gPiAgICAgICBiaXRtYXBfZnJlZShwcml2
LT5hZl94ZHBfemNfcXBzKTsKPiA+ID4KPiA+ID4gKyAgICAgLyogU2VsZWN0IHNsZWVwIHBpbiBz
dGF0ZSAqLwo+ID4gPiArICAgICBwaW5jdHJsX3BtX3NlbGVjdF9zbGVlcF9zdGF0ZShkZXYpOwo+
ID4gPiArCj4gPgo+ID4gSSdtIG5vdCBjb252aW5jZWQgdGhpcyBpcyBjb3JyZWN0LCB0aGVyZSdz
IG5vdGhpbmcgdG8gbWF0Y2ggaXQgaW4gdGhlCj4gPiBwcm9iZSBmdW5jdGlvbiwgZXhjZXB0IHdo
YXQgdGhlIGRyaXZlciBtb2RlbCBjb3JlIGRvZXMuIEhvd2V2ZXIsIHRoZQo+ID4gZHJpdmVyIG1v
ZGVsIGNvcmUgYWxzbyBkb2Vzbid0IGNsZWFuIHVwIHRoZSBzdGF0ZSBpZiBwcm9iZSBmYWlscy4K
PiAKPiBJIHRoaW5rIGl0IGxvb2tzIHJpZ2h0LCBpZiB0aGlzIHN0YXRlIGlzIGluZGVlZCBmb3Ig
dGhlIHNsZWVwIHN0YXRlIG9mIHRoZQo+IGRldmljZSBwaW5zLCBhbmQgdGhpcyBpcyB3aGF0IHlv
dSB3YW50IHRvIGhhcHBlbiBhdCByZW1vdmUoKS4KPiAKPiBUaGUgbm9uLWNsZWFudXAgb2YgdGhl
IHBpbiBzdGF0ZXMgaXMgYSAobWF5YmUgdWdseSkgZmVhdHVyZTogdGhlcmUKPiBpcyBhbiAiaW5p
dCIgYW5kIGEgImRlZmF1bHQiIHN0YXRlLiBJZiB0aGUgImluaXQiIHN0YXRlIGRvZXMgbm90IGV4
aXN0IHRoZQo+ICJkZWZhdWx0IiBzdGF0ZSBpcyBzZWxlY3RlZCBpbiB0aGUgZGQuYyBjYWxsLgo+
IAo+IFRoZXNlIHN0YXRlcyBhcmUganVzdCBzb21lIHZhbHVlcyBpbiBkZXYtPnBpbnMsIGFsbG9j
YXRlZCB3aXRoCj4gZGV2bV9remFsbG9jKCksIGFuZCBkZXZtX3BpbmN0cmxfZ2V0KCkgZm9yIGUu
Zy4gZGV2LT5waW5zLT5wLAo+IHNvIElJVUMgdGhpcyB3aWxsIGJlZnJlZTplZCBvbiBkcml2ZXIg
ZGV0YWNoLAo+IGFsc28gaWYgdGhlIHByb2JlKCkgZmFpbHMsIGF0IGxlYXN0IHRoYXQgaXMgd2hh
dCB0aGUgb3JpZ2luYWwgZGV2cmVzCj4gZGVzaWduIGRvY3VtZW50IHNheXMKPiBEb2N1bWVudGF0
aW9uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2RldnJlcy5yc3QKPiAKPiBUaGVyZSBpcyByZWFs
bHkgbm8gb3RoZXIgY2xlYW51cCB0aGF0IGNhbiBoYXBwZW46IHRoZXJlIGlzIG5vCj4gYmVmb3Jl
LWRlZmF1bHQtb3ItaW5pdCBzdGF0ZSB3ZSBjYW4gcmV2ZXJ0IHRvICh0aGF0IHdvdWxkIGJlIHRo
ZQo+IHBvd2VyLW9uIHZhbHVlcyksIHNvIHRoZXJlIGFyZSBqdXN0IHRoZXNlIHN0YXRlcyBpbiBz
b21lIHBvaW50ZXJzCj4gdGhhdCBjb3VsZCBiZSBhY2Nlc3NlZCBieSBlLmcuIHBpbmN0cmxfcG1f
c2VsZWN0X3NsZWVwX3N0YXRlKCkKPiB0aGF0IGdldCBmcmVlOmVkIHVwLCBhbmQgbXV4aW5nIGFu
ZCBwaW4gY29uZmlnIHRoYXQgaGFwcGVuZWQKPiBpbiB0aGUgcGluIGNvbnRyb2wgaGFyZHdhcmUg
anVzdCBzdGF5cyBhcm91bmQuCgpXaGF0IHdlIHNlZW0gdG8gZW5kIHVwIHdpdGggaXMgdGhhdCBv
biBwcm9iZSBmYWlsdXJlLCB3ZSBzZXQgdGhlIHBpbnMKdG8gaW5pdCBvciBkZWZhdWx0IHN0YXRl
LiBIb3dldmVyLCBvbiByZW1vdmUsIGl0J3MgdXAgdG8gdGhlIGRyaXZlciB0bwpkZWNpZGUgd2hl
dGhlciB0byBwdXQgdGhlIHBpbnMgaW50byBzbGVlcCBzdGF0ZSBvciBub3QuCgpTaG91bGRuJ3Qg
YSBkcml2ZXIgYmUgY29uc2lzdGVudCwgYW5kIHBsYWNlIHRoZSBwaW5zIGludG8gdGhlIHNhbWUK
c3RhdGUgaW4gYm90aCB0aGVzZSBzY2VuYXJpb3M/CgpDb252ZXJzZWx5LCBJJ20gc2xpZ2h0bHkg
d29ycmllZCB0aGF0IHB1dHRpbmcgcGlucyBpbnRvIHNsZWVwIHN0YXRlCndoZW4gd2UncmUgbm90
IHBvd2VyaW5nIGRvd24gbWF5IGJlIGJhZCBpZiB0aGV5J3JlIGFsbG93ZWQgdG8gdGhlbgpmbG9h
dCwgd2hpY2ggY291bGQgY2F1c2UgdGhlIFBIWSB0byBpbnRlcmZlcmUgb24gdGhlIG5ldHdvcmsu
CgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2
ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMgaGVyZSEgODBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNl
bnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
