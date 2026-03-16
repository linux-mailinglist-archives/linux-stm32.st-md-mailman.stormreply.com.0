Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OQaHkQCuGlpYAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 14:14:44 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C9229A139
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 14:14:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1026C87ED8;
	Mon, 16 Mar 2026 13:14:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C878C3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 13:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DrTshH/5XD1DwX0wXvoMVhK/9Oqc9g5Mye/0IL4m/yc=; b=LrceKKVuKrubslp3vHydqm6i8p
 1P/v3Oa8Q70B1SvOBLekVnJBGKwzboYjMm65GO1N8LbHLkTrHDxlIqTxWhYzAZC7USrdTq23QSJmd
 Anu27vbAtIhVhlhVj/66jIN85OLJxGQOYlQdq3bxAH3G9FgNvqQxMZLL7rOuYF9dg6/x+bIRU4YHf
 SBrRwvdtGH+99ATjmbpGfp8RWWY24FnGRXQSzbt9KnquOnBd9sAX/wtqTKyoggQyXME6KXdK4aOgq
 ltezR7567RM5hY3G/yphScuJYe3ra0DOffk7WbdaEdfUpLx1CrfISHdHLDSb2UK/76cU/lRiRp5kY
 A0T88G9w==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44540)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w27mB-000000003pQ-1oCh;
 Mon, 16 Mar 2026 13:14:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w27m8-0000000056Y-1GC9; Mon, 16 Mar 2026 13:14:28 +0000
Date: Mon, 16 Mar 2026 13:14:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christophe ROULLIER <christophe.roullier@foss.st.com>
Message-ID: <abgCNFIiX6In3baa@shell.armlinux.org.uk>
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
 <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
 <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
 <abfHUrOpHnjv3GGW@shell.armlinux.org.uk>
 <4de50fb9-35e6-48e7-8111-c5a94099d4f7@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4de50fb9-35e6-48e7-8111-c5a94099d4f7@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linus Walleij <linusw@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christophe.roullier@foss.st.com,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linusw@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net,lists.infradead.org];
	NEURAL_SPAM(0.00)[0.116];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 19C9229A139
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMTE6MDE6MDJBTSArMDEwMCwgQ2hyaXN0b3BoZSBST1VM
TElFUiB3cm90ZToKPiBIaSBSdXNzZWxsLCBMaW51cywgQWxsLAo+IAo+IExlIDE2LzAzLzIwMjYg
w6AgMTA6MDMsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSBhIMOpY3JpdMKgOgo+ID4gT24gU2F0LCBN
YXIgMTQsIDIwMjYgYXQgMTI6Mzc6MTlBTSArMDAwMCwgUnVzc2VsbCBLaW5nIChPcmFjbGUpIHdy
b3RlOgo+ID4gPiBPbiBTYXQsIE1hciAxNCwgMjAyNiBhdCAxMjo0NDo1NkFNICswMTAwLCBMaW51
cyBXYWxsZWlqIHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgTWFyIDEzLCAyMDI2IGF0IDEyOjA44oCv
UE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCj4gPiA+ID4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4g
d3JvdGU6Cj4gPiA+ID4gPiBPbiBGcmksIE1hciAxMywgMjAyNiBhdCAxMTo1NzoxNkFNICswMTAw
LCBDaHJpc3RvcGhlIFJvdWxsaWVyIHdyb3RlOgo+ID4gPiA+ID4gPiBJbiB0aGUgZGVlcGVzdCBs
b3ctcG93ZXIgbW9kZXMsIHRoZSBwaW5jdHJsIGNvbmZpZ3VyYXRpb24gaXMgbG9zdAo+ID4gPiA+
ID4gPiBhbmQgaXMgbmV2ZXIgcmVzdG9yZWQgaWYgdGhlIGludGVyZmFjZSBpcyBkb3duLgo+ID4g
PiA+ID4gPiBUaGlzIGNvbW1pdCBlbnN1cmVzIHRoYXQgdGhlIHBpbmN0cmwgc3RhdGUgaXMgc2V0
IGluIGFsbCBjYXNlcy4KPiA+ID4gPiA+IFNob3VsZG4ndCB0aGUgcGluIHN0YXRlIGJlIHJlc3Rv
cmVkIGJ5IHRoZSBwaW5jdHJsIGxheWVyPwo+ID4gPiA+IFdoYXQgd2UgaGF2ZSBpbiB0aGUgZGV2
aWNlIGNvcmUgb25seSBhcHBsaWVzICJpbml0IiBhbmQgImRlZmF1bHQiCj4gPiA+ID4gc3RhdGVz
LCBhbmQgcHJvdmlkZXMgdGhlc2UgaGFuZGxlcyBmb3IgdHJhbnNpdGlvbmluZyB0byAic2xlZXAi
Cj4gPiA+ID4gYW5kICJkZWZhdWx0IiBhZ2FpbiAobGlrZSBhIHN0YXRlIG1hY2hpbmUpLgo+ID4g
PiBXaGF0IEkgd2FzIG1lYW5pbmcgaXMgdGhhdCAtIGZvciBhIGRyaXZlciB1c2luZyB0aGUgImRl
ZmF1bHQiIHN0YXRlLAo+ID4gPiBpZiB0aGUgaGFyZHdhcmUgbG9zZXMgdGhlIHBpbmN0cmwgc3Rh
dGUgZHVyaW5nIHNsZWVwLCBpc24ndCBpdCB0aGUKPiA+ID4gcmVzcG9uc2liaWxpdHkgb2YgdGhl
IHBpbmN0cmwgZHJpdmVyIHRvIHJlc3RvcmUgdGhlIHN0YXRlIHJhdGhlcgo+ID4gPiB0aGFuIGxl
YXZpbmcgaXQgaW4gd2hhdGV2ZXIgc3RhdGVzIGl0IGhhcHBlbnMgdG8gYmUgd2hlbiB0aGUgU29D
Cj4gPiA+IGNvbWVzIGJhY2sgZnJvbSBzdXNwZW5kPwo+ID4gPiAKPiA+ID4gSWYgdGhhdCBpcyBu
b3QgdGhlIGNhc2UsIHRoZW4gZG9uJ3Qgd2UgaGF2ZSBhIG1ham9yIGlzc3VlIHdoZXJlCj4gPiA+
IGRyaXZlcnMgdXNpbmcgcGluY3RybCBidXQgZG8gbm90IGlzc3VlIGFueSBwaW5jdHJsIGNhbGxz
IGluIHRoZQo+ID4gPiByZXN1bWUgZnVuY3Rpb24gYXJlIGJ1Z2d5Pwo+ID4gSSB3b3VsZCBsaWtl
IGFuIGFuc3dlciBvbiB0aGlzIGJlZm9yZSB0aGlzIHBhdGNoIGlzIG1lcmdlZCwgYmVjYXVzZQo+
ID4gZXZlbiB3aXRoIHlvdXIgcmV2aWV3ZWQtYnksIEkgZG9uJ3QgdGhpbmsgdGhpcyBwYXRjaCBp
cyBjb3JyZWN0Lgo+ID4gCj4gPiBGb3IgZXhhbXBsZSwgaWYgcGluY3RybCBsb3NlcyB0aGUgcGlu
bXV4IHN0YXRlIGFjcm9zcyBzdXNwZW5kL3Jlc3VtZSwKPiA+IHRoZW4gdGhpcyBwYXRjaCBvbmx5
IHNvbHZlcyB0aGUgY2FzZSB3aGVyZSB0aGUgTklDIGlzIGRvd24gd2hlbgo+ID4gc3VzcGVuZGlu
Zy4KPiA+IAo+ID4gSXQgZG9lcyBub3QgYWRkcmVzcyB0aGUgY2FzZSB3aGVyZSB0aGUgTklDIGlz
IHVwIGJ1dCBXb0wgaXMgZGlzYWJsZWQuCj4gPiBBbHNvLCB3aGF0IGhhcHBlbnMgd2hlbiBXb0wg
aXMgZW5hYmxlZCBhdCB0aGUgTUFDLCB3aGVuIHdlIGV4cGVjdCB0aGUKPiA+IE5JQyB0byBzdGls
bCBiZSBmdW5jdGlvbmFsIC0gd2hpY2ggbWVhbnMgdGhhdCB0aGUgcGlubXV4IHN0YXRlIG11c3QK
PiA+IHJlbWFpbiBhY3RpdmUgb3ZlciBzdXNwZW5kLgo+IAo+IEZvciBtZSB0aGlzIGNhc2UgKHdo
ZW4gTklDIGlzIHVwKSBpcyBhbHJlYWR5IG1hbmFnZWQgYnkgdGhlIGRyaXZlciBhbmQKPiBmdW5j
dGlvbiBzdXNwZW5kL3Jlc3VtZToKPiAKPiBPbiBzdG1tYWNfc3VzcGVuZCA6Cj4gCj4gPT0+wqAg
wqAgwqAgLyogRW5hYmxlIFBvd2VyIGRvd24gbW9kZSBieSBwcm9ncmFtbWluZyB0aGUgUE1UIHJl
Z3MgKi8KPiDCoCDCoCDCoGlmIChwcml2LT53b2xvcHRzKSB7Cj4gwqAgwqAgwqAgwqAgwqBzdG1t
YWNfcG10KHByaXYsIHByaXYtPmh3LCBwcml2LT53b2xvcHRzKTsKPiDCoCDCoCDCoCDCoCDCoHBy
aXYtPmlycV93YWtlID0gMTsKPiDCoCDCoCDCoH0gZWxzZSB7Cj4gwqAgwqAgwqAgwqAgwqBzdG1t
YWNfbWFjX3NldChwcml2LCBwcml2LT5pb2FkZHIsIGZhbHNlKTsKPiAqwqAgwqAgwqAgwqAgwqBw
aW5jdHJsX3BtX3NlbGVjdF9zbGVlcF9zdGF0ZShwcml2LT5kZXZpY2UpOyoKPiDCoCDCoCDCoH0K
PiAKPiBPbiBzdG1tYWNfcmVzdW1lIDoKPiAKPiA9PT7CoCDCoCDCoGlmIChwcml2LT53b2xvcHRz
KSB7Cj4gwqAgwqAgwqAgwqAgwqBtdXRleF9sb2NrKCZwcml2LT5sb2NrKTsKPiDCoCDCoCDCoCDC
oCDCoHN0bW1hY19wbXQocHJpdiwgcHJpdi0+aHcsIDApOwo+IMKgIMKgIMKgIMKgIMKgbXV0ZXhf
dW5sb2NrKCZwcml2LT5sb2NrKTsKPiDCoCDCoCDCoCDCoCDCoHByaXYtPmlycV93YWtlID0gMDsK
PiDCoCDCoCDCoH0gZWxzZSB7Cj4gKsKgIMKgIMKgIMKgIMKgcGluY3RybF9wbV9zZWxlY3RfZGVm
YXVsdF9zdGF0ZShwcml2LT5kZXZpY2UpOyoKPiDCoCDCoCDCoCDCoCDCoC8qIHJlc2V0IHRoZSBw
aHkgc28gdGhhdCBpdCdzIHJlYWR5ICovCj4gwqAgwqAgwqAgwqAgwqBpZiAocHJpdi0+bWlpKQo+
IMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RtbWFjX21kaW9fcmVzZXQocHJpdi0+bWlpKTsKPiDCoCDC
oCDCoH0KPiAKCkkgZG9uJ3Qga25vdyBpZiB0aGVyZSdzIGEgZGlmZmVyZW5jZSBiZXR3ZWVuIHlv
dXIgdHdvIHNlcGVyYXRlIHJlcGxpZXMKdGhhdCBhcHBlYXIgdG8gYmUgc2F5aW5nIHRoZSBzYW1l
IHRoaW5nLgoKSSBhbHNvIGRpZG4ndCByZWFsaXNlIHRoYXQgd2UncmUgYWxyZWFkeSBjaGFuZ2lu
ZyB0aGUgcGluY3RybCBzdGF0ZQpvbiBzdXNwZW5kL3Jlc3VtZSB3aGVuIHRoZSBpbnRlcmZhY2Ug
aXMgdXAgLSB0aGFua3MgZm9yIHBvaW50aW5nIHRoYXQKb3V0LgoKSSB0aGluayBpdCBtYXkgYmUg
YmV0dGVyIHRvIG1vdmUgdGhlIHBpbmN0cmwgY2hhbmdlcyBhZnRlciB0aGUKcHJpdi0+cGxhdC0+
c3VzcGVuZCgpIGNhbGw6CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvc3RtbWFjX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL3N0bW1hY19tYWluLmMKaW5kZXggNDI4YjJlNWJiNGM0Li41OTZmOWUyMzQ5Y2IgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMK
KysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwpA
QCAtODE3NCw2ICs4MTc0LDcgQEAgaW50IHN0bW1hY19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRl
dikKIAlzdHJ1Y3QgbmV0X2RldmljZSAqbmRldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCXN0
cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiA9IG5ldGRldl9wcml2KG5kZXYpOwogCXU4IGNoYW47CisJ
aW50IHJldDsKIAogCWlmICghbmRldiB8fCAhbmV0aWZfcnVubmluZyhuZGV2KSkKIAkJZ290byBz
dXNwZW5kX2JzcDsKQEAgLTgyMDMsNyArODIwNCw2IEBAIGludCBzdG1tYWNfc3VzcGVuZChzdHJ1
Y3QgZGV2aWNlICpkZXYpCiAJCXByaXYtPmlycV93YWtlID0gMTsKIAl9IGVsc2UgewogCQlzdG1t
YWNfbWFjX3NldChwcml2LCBwcml2LT5pb2FkZHIsIGZhbHNlKTsKLQkJcGluY3RybF9wbV9zZWxl
Y3Rfc2xlZXBfc3RhdGUocHJpdi0+ZGV2aWNlKTsKIAl9CiAKIAltdXRleF91bmxvY2soJnByaXYt
PmxvY2spOwpAQCAtODIyNSw4ICs4MjI1LDE0IEBAIGludCBzdG1tYWNfc3VzcGVuZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCiAJCWV0aHRvb2xfbW1zdl9zdG9wKCZwcml2LT5mcGVfY2ZnLm1tc3YpOwog
CiBzdXNwZW5kX2JzcDoKLQlpZiAocHJpdi0+cGxhdC0+c3VzcGVuZCkKLQkJcmV0dXJuIHByaXYt
PnBsYXQtPnN1c3BlbmQoZGV2LCBwcml2LT5wbGF0LT5ic3BfcHJpdik7CisJaWYgKHByaXYtPnBs
YXQtPnN1c3BlbmQpIHsKKwkJcmV0ID0gcHJpdi0+cGxhdC0+c3VzcGVuZChkZXYsIHByaXYtPnBs
YXQtPmJzcF9wcml2KTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CisJfQorCisJaWYgKCFw
cml2LT53b2xvcHRzKQorCQlwaW5jdHJsX3BtX3NlbGVjdF9zbGVlcF9zdGF0ZShwcml2LT5kZXZp
Y2UpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC04MjgwLDYgKzgyODYsOSBAQCBpbnQgc3RtbWFjX3Jl
c3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJc3RydWN0IHN0bW1hY19wcml2ICpwcml2ID0gbmV0
ZGV2X3ByaXYobmRldik7CiAJaW50IHJldDsKIAorCWlmICghcHJpdi0+d29sb3B0cykKKwkJcGlu
Y3RybF9wbV9zZWxlY3RfZGVmYXVsdF9zdGF0ZShwcml2LT5kZXZpY2UpOworCiAJaWYgKHByaXYt
PnBsYXQtPnJlc3VtZSkgewogCQlyZXQgPSBwcml2LT5wbGF0LT5yZXN1bWUoZGV2LCBwcml2LT5w
bGF0LT5ic3BfcHJpdik7CiAJCWlmIChyZXQpCkBAIC04MzAxLDcgKzgzMTAsNiBAQCBpbnQgc3Rt
bWFjX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCW11dGV4X3VubG9jaygmcHJpdi0+bG9j
ayk7CiAJCXByaXYtPmlycV93YWtlID0gMDsKIAl9IGVsc2UgewotCQlwaW5jdHJsX3BtX3NlbGVj
dF9kZWZhdWx0X3N0YXRlKHByaXYtPmRldmljZSk7CiAJCS8qIHJlc2V0IHRoZSBwaHkgc28gdGhh
dCBpdCdzIHJlYWR5ICovCiAJCWlmIChwcml2LT5taWkpCiAJCQlzdG1tYWNfbWRpb19yZXNldChw
cml2LT5taWkpOwoKVGhpcyBtZWFucyB0aGF0IHdlIGRvbid0IHN3aXRjaCB0aGUgcGluY3RybCBz
dGF0ZSB1bnRpbCB3ZSd2ZSBmaW5pc2hlZApzdXNwZW5kaW5nIHRoZSBkZXZpY2UgYXMgbmVjZXNz
YXJ5LCB3aGljaCBzZWVtcyB3YXkgbW9yZSBzYW5lIHRoYW4KdHJ5aW5nIHRvIGRvIGl0IHBhcnQt
d2F5IHRocm91Z2ggc3VzcGVuZGluZyAtIGZvciBleGFtcGxlLCB3aGlsZQpwaHlsaW5rIGFuZCBw
aHlsaWIgaXMgc3RpbGwgYWN0aXZlLgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93
d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRQIGlzIGhlcmUhIDgwTWJw
cyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
