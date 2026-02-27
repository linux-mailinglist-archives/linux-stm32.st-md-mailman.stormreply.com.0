Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANxeBsG4oWkYwAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:31:13 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B218D1B9CEF
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 16:31:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F6E1C87EC5;
	Fri, 27 Feb 2026 15:31:12 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A494C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 15:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jQYmtftgY0RX16tXlqwd88/gJleQAzTbD+On33MM1a8=; b=oAWAh2ZiVjiMgVk8Slge/IOIaN
 A0iQ7hBunYzni7w8Ng0FoIrmJ8RE1VIdtUo/FVCZ2X1IfkDN4o6S1IHt4gZH4/V0V6uoOyInUr+pY
 u1Ewmr6fufghZoByBUwkrfeyFL0NP/FgUcfTtJfzTUYjRxatzEjr75ZBomUxHIxMwh1FK0yKC7ugj
 AU/gxAzceHRHqiHlaGJSD6u8YcoKG+f90jJ1XBABWgMtCVX0qKofWWS7b5489g2uas7cnJuogPSJM
 e09RC5oMf6AAhIwphJUFYAxFULfUqIQrc8lYFeGebgE0q9+aB/Wh0xxlwQQM3FBGza5npmdIitNtK
 5vQLIGtg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53922)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vvznw-0000000010A-2fKv;
 Fri, 27 Feb 2026 15:31:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vvzns-000000003B6-2IHF; Fri, 27 Feb 2026 15:30:56 +0000
Date: Fri, 27 Feb 2026 15:30:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <aaG4sBQysN0Z94E3@shell.armlinux.org.uk>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
 <aZ66uXCwGgH7B_A-@shell.armlinux.org.uk> <aaGgWUpM2A5y11Wh@vaman>
 <20260227152707.k5lobznug3xxxc7h@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260227152707.k5lobznug3xxxc7h@skbuf>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Eric Dumazet <edumazet@google.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/9] net: stmmac: qcom-ethqos:
 further serdes reorganisation
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:olteanv@gmail.com,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:edumazet@google.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	NEURAL_SPAM(0.00)[0.208];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,shell.armlinux.org.uk:mid,stormreply.com:url,stormreply.com:email,armlinux.org.uk:url]
X-Rspamd-Queue-Id: B218D1B9CEF
X-Rspamd-Action: no action

T24gRnJpLCBGZWIgMjcsIDIwMjYgYXQgMDU6Mjc6MDdQTSArMDIwMCwgVmxhZGltaXIgT2x0ZWFu
IHdyb3RlOgo+IEhpIFZpbm9kLAo+IAo+IE9uIEZyaSwgRmViIDI3LCAyMDI2IGF0IDA3OjE3OjA1
UE0gKzA1MzAsIFZpbm9kIEtvdWwgd3JvdGU6Cj4gPiBPbiAyNS0wMi0yNiwgMDk6MDIsIFJ1c3Nl
bGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPiA+ID4gTm90ZTogb25seSA4IHBhdGNoZXMgaW4gdGhp
cyBzZXJpZXMsIG5vdCA5IGFzIHRoZSBzdWJqZWN0IGxpbmUgc2F5cywKPiA+ID4gYXMgdGhlIHNl
dF9jbGtfdHhfcmF0ZSgpIHBhdGNoIGJlY2FtZSBwYXJ0IG9mIHRoZSBmaXJzdCBzZXJpZXMuCj4g
PiA+IAo+ID4gPiBPbiBXZWQsIEZlYiAyNSwgMjAyNiBhdCAwOTowMDo0MUFNICswMDAwLCBSdXNz
ZWxsIEtpbmcgKE9yYWNsZSkgd3JvdGU6Cj4gPiA+ID4gVGhpcyBpcyBwYXJ0IDIgb2YgdGhlIHFj
b20tZXRocW9zIHNlcmllcywgcGFydCAxIGhhcyBub3cgYmVlbiBtZXJnZWQuCj4gPiA+ID4gCj4g
PiA+ID4gVGhpcyBwYXJ0IG9mIHRoZSBzZXJpZXMgZm9jdXNlcyBvbiB0aGUgZ2VuZXJpYyBQSFkg
ZHJpdmVyLCBidXQgdGhlc2UKPiA+ID4gPiBjaGFuZ2VzIGhhdmUgZGVwZW5kZW5jaWVzIG9uIHRo
ZSBldGhlcm5ldCBkcml2ZXIsIGhlbmNlIHdoeQo+ID4gPiA+IGl0IHdpbGwgbmVlZCB0byBnbyB2
aWEgbmV0LW5leHQuIEZ1cnRoZXJtb3JlLCBzdWJzZXF1ZW50IGNoYW5nZXMKPiA+ID4gPiBkZXBl
bmQgb24gdGhlc2UgcGF0Y2hlcy4KPiA+IAo+ID4gVGhpcyBsZ3RtLCBjYW4gd2UgZ2V0IHNpZ25l
ZCB0YWcgc28gdGhhdCB3ZSBjYW4gcHVsbCB0aGlzIGludG8gcGh5IHRyZWUKPiA+IGFzIHdlbGwK
PiAKPiBJIHRoaW5rIHRoaXMgc2VyaWVzIGlzIG9ic29sZXRlLiBJdCBoYXMgYmVlbiBzdXBlcnNl
ZGVkIGluIHRoZSBuZXRkZXYKPiBwYXRjaHdvcmsgYnk6Cj4gCj4gW1BBVENIIFJFU0VORDIgbmV0
LW5leHQgMC84XSBuZXQ6IHN0bW1hYzogcWNvbS1ldGhxb3M6IGZ1cnRoZXIgc2VyZGVzIHJlb3Jn
YW5pc2F0aW9uCj4g4pSc4pSAPltQQVRDSCBSRVNFTkQyIG5ldC1uZXh0IDEvOF0gbmV0OiBzdG1t
YWM6IHFjb20tZXRocW9zOiBtb3ZlIGV0aHFvc19zZXRfc2VyZGVzX3NwZWVkKCkKPiDilJzilIA+
W1BBVENIIFJFU0VORDIgbmV0LW5leHQgMi84XSBwaHk6IHFjb20tc2dtaWktZXRoOiBhZGQgLnNl
dF9tb2RlKCkgYW5kIC52YWxpZGF0ZSgpIG1ldGhvZHMKPiDilJzilIA+W1BBVENIIFJFU0VORDIg
bmV0LW5leHQgMy84XSBuZXQ6IHN0bW1hYzogcWNvbS1ldGhxb3M6IGNvbnZlcnQgdG8gdXNlIHBo
eV9zZXRfbW9kZV9leHQoKQo+IOKUnOKUgD5bUEFUQ0ggUkVTRU5EMiBuZXQtbmV4dCA0LzhdIHBo
eTogcWNvbS1zZ21paS1ldGg6IHJlbW92ZSAuc2V0X3NwZWVkKCkgaW1wbGVtZW50YXRpb24KPiDi
lJzilIA+W1BBVENIIFJFU0VORDIgbmV0LW5leHQgNS84XSBwaHk6IHFjb20tc2dtaWktZXRoOiB1
c2UgUEhZIGludGVyZmFjZSBtb2RlIGZvciBTZXJEZXMgc2V0dGluZ3MKPiDilJzilIA+W1BBVENI
IFJFU0VORDIgbmV0LW5leHQgNi84XSBwaHk6IHFjb20tc2dtaWktZXRoOiByZW1vdmUgcWNvbV9k
d21hY19zZ21paV9waHlfaW50ZXJmYWNlKCkKPiDilJzilIA+W1BBVENIIFJFU0VORDIgbmV0LW5l
eHQgNy84XSBwaHk6IHFjb20tc2dtaWktZXRoOiByZWxheCBvcmRlciBvZiAucG93ZXJfb24oKSB2
cyAuc2V0X21vZGUqKCkKPiDilJTilIA+W1BBVENIIFJFU0VORDIgbmV0LW5leHQgOC84XSBuZXQ6
IHN0bW1hYzogcWNvbS1ldGhxb3M6IHJlbW92ZSBwaHlfc2V0X21vZGVfZXh0KCkgYWZ0ZXIgcGh5
X3Bvd2VyX29uKCkKPiAKPiAod2l0aCB3aGljaCBpdCBpcyBvbmx5IHBhcnRpYWxseSBvdmVybGFw
cGluZykKPiAKPiBJIGd1ZXNzIHlvdSBzaG91bGQgZ2l2ZSB5b3VyIEFja3MgdGhlcmUgYXMgd2Vs
bC4KCk5vIG5lZWQuIExvb2tpbmcgYXQgUFcsIGl0IHNlZW1zIHBhdGNoIDcgaGFzIEFJIHJldmll
dyBpc3N1ZXMsIHNvIHdpbGwKbmVlZCB0byBiZSByZS1zZW50IC0gYWx0aG91Z2ggSSBjYW4ndCBm
YXRob20gd2hhdCB0aGUgQUkgZm91bmQgaW4gcGF0Y2gKNy4gSSd2ZSBhbHJlYWR5IGFkZGVkIFZp
bm9kJ3MgYWNrcyAoc2luY2UgdGhleSB3ZXJlIGp1c3QgcmVzZW5kcyB0byBmaXgKYm90Y2hlZCBz
ZW5kaW5nLCBubyBhY3R1YWwgY2hhbmdlcyBpbiB0aGUgcGF0Y2hlcyB0aGVtc2VsdmVzLikKCi0t
IApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9w
ZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBj
b25uZWN0aXZpdHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
