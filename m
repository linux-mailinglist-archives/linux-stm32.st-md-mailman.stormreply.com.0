Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHtIG1tKhGk/2QMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 08:44:27 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA380EF8A7
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 08:44:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9396EC87ED4;
	Thu,  5 Feb 2026 07:44:26 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D2CBC87ECF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Feb 2026 07:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=Ntdpc/kmU25S8F1eDNB57650TuUB4jKAVLcNz3WP428=; b=JD9cFskb0ndPxsKG6mTXNaig4G
 AjzKOFM/uI2N0j2aUVwUgcC3SwPYbKsfsc1pabUNvUYnLLVx209LS6nhZAnvXY5BX8ICUrdVb19fB
 wewmjBHYAs1usCTPHRkN+XodwpBydq99GjSElbGrZ60yAKYLCsDkDcI2lDDLpJbL4ceI7O3CDkc9e
 gcwDxAN6xJeO50QVSckVR8cfFj13SswOLKmnJ2uunwIVKPVIny+RCf1Dqu85I4ryNCdQe+UbEhdnH
 /3DMcq2+DuBck+ZT3iQb9/jkiVArfTRJLr/lktcrqnP/yb2Z08mPU/+Yf0zqn1Ed+RylgHGgzBWXu
 ch73Pyqg==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vnu28-0074Ju-66; Thu, 05 Feb 2026 08:44:12 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Date: Thu, 05 Feb 2026 08:44:11 +0100
Message-ID: <3561842.ZfL8zNpBrT@diego>
In-Reply-To: <aYPHjS0wrtXlRb1a@shell.armlinux.org.uk>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
 <20297648.sWSEgdgrri@diego>
 <aYPHjS0wrtXlRb1a@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Re: [PATCH net-next 5/6] net: stmmac: rk: use
 rk_encode_wm16() for clock selection
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
X-Spamd-Result: default: False [3.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[sntech.de:s=gloria202408];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sntech.de : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[heiko@sntech.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[sntech.de:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sntech.de:email,armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: EA380EF8A7
X-Rspamd-Action: no action

SGkgUnVzc2VsbCwKCkFtIE1pdHR3b2NoLCA0LiBGZWJydWFyIDIwMjYsIDIzOjI2OjIxIE1pdHRl
bGV1cm9ww6Rpc2NoZSBOb3JtYWx6ZWl0IHNjaHJpZWIgUnVzc2VsbCBLaW5nIChPcmFjbGUpOgo+
IE9uIFdlZCwgRmViIDA0LCAyMDI2IGF0IDExOjAzOjUxUE0gKzAxMDAsIEhlaWtvIFN0w7xibmVy
IHdyb3RlOgo+ID4gQW0gTWl0dHdvY2gsIDQuIEZlYnJ1YXIgMjAyNiwgMTA6MTQ6MzggTWl0dGVs
ZXVyb3DDpGlzY2hlIE5vcm1hbHplaXQgc2NocmllYiBSdXNzZWxsIEtpbmcgKE9yYWNsZSk6Cj4g
PiA+IFVzZSBya19lbmNvZGVfd20xNigpIGZvciBSTUlJIGNsb2NrIGdhdGluZyBjb250cm9sLCBh
bmQgYWxzbyBmb3IgdGhlCj4gPiA+IGlvX2Nsa3NlbCBiaXQgdXNlZCB0byBzZWxlY3QgdGhlIHRy
YW5zbWl0IGNsb2NrIGJldHdlZW4gQ1JVLWRlcml2ZWQKPiA+ID4gYW5kIElPLWRlcml2ZWQgY2xv
Y2sgc291cmNlcy4KPiA+ID4gCj4gPiA+IEJvdGggb2YgdGhlc2Ugd2VyZSBjb25maWd1cmVkIHZp
YSB0aGUgInNldF9jbG9ja19zZWxlY3Rpb24iIG1ldGhvZCBpbgo+ID4gPiB0aGUgU29DIHNwZWNp
ZmljIG9wZXJhdGlvbnMsIGJ1dCB0aGVyZSBpcyBubyByZXF1aXJlbWVudCB0byBjaGFuZ2UgdGhl
Cj4gPiA+IGlvX2Nsa3NlbCBleGNlcHQgd2hlbiBlbmFibGluZyBjbG9ja3MuCj4gPiA+IAo+ID4g
PiBJdCBpcyBhbHNvIHBvc3NpYmxlIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byB1bmdhdGUgdGhlIFJN
SUkgY2xvY2sgaWYgd2UKPiA+ID4gYXJlIG9wZXJhdGluZyBpbiBSR01JSSBtb2RlLCBidXQgdGhp
cyBjb21taXQgbWFrZXMgbm8gY2hhbmdlIHRoZXJlLgo+ID4gPiAKPiA+ID4gU3BsaXQgdXAgdGhl
IGNvbmZpZ3VyYXRpb24gb2YgdGhlc2UgYXMgc2VwYXJhdGUgZnVuY3Rpb25zLCBhbmQgcmVtb3Zl
Cj4gPiA+IHRoZSBzZXRfY2xvY2tfc2VsZWN0aW9uKCkgbWV0aG9kLiBTaW5jZSB0aGVzZSBjbG9j
a2luZyBiaXRzIGFyZSBpbiB0aGUKPiA+ID4gc2FtZSByZWdpc3RlciB0aGF0IHdlIGNhbGwgdGhl
ICJzcGVlZCIgcmVnaXN0ZXIsIG1vdmUgdGhlIGxvZ2ljIGZvcgo+ID4gPiB3cml0aW5nIHRoYXQg
cmVnaXN0ZXIgaW50byBya193cml0ZV9zcGVlZF9ncmZfcmVnKCkuCj4gPiA+IAo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3Jn
LnVrPgo+ID4gPiAtLS0KPiA+ID4gIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWMtcmsuYyAgICB8IDE3NCArKysrKysrKy0tLS0tLS0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA3NSBpbnNlcnRpb25zKCspLCA5OSBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYwo+ID4gPiBpbmRleCA0
MDk5Y2JjNWQwZGUuLmVkOWFkYWM3MGYwYSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYwo+ID4gPiArKysgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCj4gPiA+IEBAIC0yNyw4ICsyNywx
NyBAQAo+ID4gPiAgc3RydWN0IHJrX3ByaXZfZGF0YTsKPiA+ID4gIAo+ID4gPiAgc3RydWN0IHJr
X2Nsb2NrX2ZpZWxkcyB7Cj4gPiA+ICsJLyogaW9fY2xrc2VsX2NydV9tYXNrIC0gaW9fY2xrc2Vs
IGJpdCBpbiBjbG9jayBHUkYgcmVnaXN0ZXIgd2hpY2gsCj4gPiA+ICsJICogd2hlbiBzZXQsIHNl
bGVjdHMgdGhlIHR4IGNsb2NrIGZyb20gQ1JVLgo+ID4gPiArCSAqLwo+ID4gPiArCXUxNiBpb19j
bGtzZWxfY3J1X21hc2s7Cj4gPiA+ICsJLyogaW9fY2xrc2VsX2lvX21hc2sgLSBpb19jbGtzZWwg
Yml0IGluIGNsb2NrIEdSRiByZWdpc3RlciB3aGljaCwKPiA+ID4gKwkgKiB3aGVuIHNldCwgc2Vs
ZWN0cyB0aGUgdHggY2xvY2sgZnJvbSBJTy4KPiA+ID4gKwkgKi8KPiA+IAo+ID4gbml0OiBjb21t
ZW50IHN0aWxlIGRvZXMgbm90IHNlZW0gdG8gZm9sbG93IHRoZSBrZXJuZWwgY29kaW5nIHN0eWxl
Cj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2
YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3MvY29kaW5nLXN0eWxlLnJz
dCNuNjIyCj4gCj4gbmV0ZGV2IGhhcyBoaXN0b3JpY2FsbHkgaGFkIHRoaXMgc3R5bGUgd2hpY2gg
aXMgc2VwYXJhdGUgZnJvbSB0aGUgcmVzdAo+IG9mIHRoZSBrZXJuZWwuIFRoZSBmaWxlIGFscmVh
ZHkgdXNlcyB0aGlzIGNvbW1lbnQgc3R5bGUsIHNvIGl0IGlzCj4gZW50aXJlbHkgY29ycmVjdCB0
byBrZWVwIHRvIHRoZSBzdHlsZSB3aGljaCBhbHJlYWR5IGV4aXN0cyBpbiB0aGlzCj4gZmlsZSwg
cmF0aGVyIHRoYW4gbWl4aW5nIHN0eWxlcyBhbmQgdHVybmluZyBpdCBpbnRvIGEgbWVzcy4KCnRo
YW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uIFRoZW4gdGhlIGNvbW1lbnQgc3R5bGUgaXMgb2J2
aW91c2x5IGZpbmUuCgpSZWdhcmRzCkhlaWtvCgoKPiA+IFJldmlld2VkLWJ5OiBIZWlrbyBTdHVl
Ym5lciA8aGVpa29Ac250ZWNoLmRlPgo+ID4gVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVp
a29Ac250ZWNoLmRlPiAjcHgzMCxyazMzMjgscmszNTY4LHJrMzU4OAo+IAo+IAoKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
