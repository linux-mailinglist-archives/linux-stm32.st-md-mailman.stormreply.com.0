Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEZsBUbAeGn6sgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 14:40:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF52995016
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 14:40:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 831EEC555BE;
	Tue, 27 Jan 2026 13:40:21 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A65CC01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 13:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=PJdRV52Sg2t3bV7DwpZwSOiK3NFQ9DZEEcrZUnrZodU=; b=cn
 GsOS2yQvDZsBDp5Wz+Jbu1jU+YHTDmHBhdXeEIzuGNWN40Nd+DG9Tjfc2btNHdwqq56odmbX3jNhY
 VO1ybpvEP03QAAvSkm3RVj6TNE/GutH3KUIEKDhspKWLofy3XS5x8xcwTnRD7rakGj/hKKScIR44p
 i6M87pQKKGEDGAc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1vkjIc-004xPn-HT; Tue, 27 Jan 2026 14:40:06 +0100
Date: Tue, 27 Jan 2026 14:40:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Min Lin <linmin@eswincomputing.com>
Message-ID: <e7183ae1-8b8b-4e77-9f4e-3bc1b4b63556@lunn.ch>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <aWKZvEW7rKFFwZLG@shell.armlinux.org.uk>
 <0d54ddca-9270-40a5-aa82-d8a7b65027ff@gmail.com>
 <1a622916.2d28.19bb105feab.Coremail.lizhi2@eswincomputing.com>
 <d010a6b8-5bf0-40ff-8e76-18362a238d50@lunn.ch>
 <203bb660.2c91.19bfe45d677.Coremail.linmin@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <203bb660.2c91.19bfe45d677.Coremail.linmin@eswincomputing.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Bo Gan <ganboing@gmail.com>, linux-kernel@vger.kernel.org, edumazet@google.com,
 robh@kernel.org, ningyu@eswincomputing.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 weishangjuan@eswincomputing.com, andrew+netdev@lunn.ch,
 =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com
Subject: Re: [Linux-stm32] [PATCH v1 1/2] dt-bindings: ethernet: eswin: add
 clock sampling control
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
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:linmin@eswincomputing.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:ganboing@gmail.com,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:robh@kernel.org,m:ningyu@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:weishangjuan@eswincomputing.com,m:andrew+netdev@lunn.ch,m:lizhi2@eswincomputing.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,google.com,eswincomputing.com,st-md-mailman.stormreply.com,armlinux.org.uk,lunn.ch,redhat.com,davemloft.net,lists.infradead.org,einfochips.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email,armlinux.org.uk:email,infradead.org:email,st-md-mailman.stormreply.com:rdns,einfochips.com:email]
X-Rspamd-Queue-Id: BF52995016
X-Rspamd-Action: no action

T24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgMDM6MDU6NDhQTSArMDgwMCwgTWluIExpbiB3cm90ZToK
PiBIaSBBbmRyZXcsCj4gCj4gVGhhbmsgeW91IGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gcmV2aWV3
IHRoZSBwYXRjaC4KPiAKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZXMtLS0tLQo+ID4gRnJvbTog
IkFuZHJldyBMdW5uIiA8YW5kcmV3QGx1bm4uY2g+Cj4gPiBTZW5kIHRpbWU6VGh1cnNkYXksIDIy
LzAxLzIwMjYgMjE6Mjc6MzQKPiA+IFRvOiDmnY7lv5cgPGxpemhpMkBlc3dpbmNvbXB1dGluZy5j
b20+Cj4gPiBDYzogIkJvIEdhbiIgPGdhbmJvaW5nQGdtYWlsLmNvbT4sICJSdXNzZWxsIEtpbmcg
KE9yYWNsZSkiIDxsaW51eEBhcm1saW51eC5vcmcudWs+LCBkZXZpY2V0cmVlQHZnZXIua2VybmVs
Lm9yZywgYW5kcmV3K25ldGRldkBsdW5uLmNoLCBkYXZlbUBkYXZlbWxvZnQubmV0LCBlZHVtYXpl
dEBnb29nbGUuY29tLCBrdWJhQGtlcm5lbC5vcmcsIHJvYmhAa2VybmVsLm9yZywga3J6aytkdEBr
ZXJuZWwub3JnLCBjb25vcitkdEBrZXJuZWwub3JnLCBuZXRkZXZAdmdlci5rZXJuZWwub3JnLCBw
YWJlbmlAcmVkaGF0LmNvbSwgbWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbSwgYWxleGFuZHJlLnRv
cmd1ZUBmb3NzLnN0LmNvbSwgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bSwgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnLCBuaW5neXVAZXN3aW5jb21wdXRpbmcuY29tLCBsaW5taW5AZXN3aW5jb21w
dXRpbmcuY29tLCBwaW5rZXNoLnZhZ2hlbGFAZWluZm9jaGlwcy5jb20sIHdlaXNoYW5nanVhbkBl
c3dpbmNvbXB1dGluZy5jb20KPiA+IFN1YmplY3Q6IFJlOiBSZTogW1BBVENIIHYxIDEvMl0gZHQt
YmluZGluZ3M6IGV0aGVybmV0OiBlc3dpbjogYWRkIGNsb2NrIHNhbXBsaW5nIGNvbnRyb2wKPiA+
IAo+ID4gPiBXZSBhbHNvIGludGVuZAo+ID4gPiB0byB1cHN0cmVhbSBjb21wbGV0ZSBEVFMgZmls
ZXMgZm9yIEVJQzc3MDAgc28gdGhlIGJpbmRpbmdzIGNhbiBiZSB2YWxpZGF0ZWQKPiA+ID4gYWdh
aW5zdCByZWFsIGhhcmR3YXJlLgo+ID4gCj4gPiBJIHN1Z2dlc3QgeW91IHByaW9yaXRpc2UgdGhp
cy4gQVJNLVNPQyBpcyBwcmV0dHkgZmxleGlibGUgZm9yCj4gPiBhY2NlcHRpbmcgd29yayBpbiBw
cm9ncmVzcyBzdXBwb3J0IGZvciBuZXcgU29Dcy4gQWxsIHlvdSByZWFsbHkgbmVlZAo+ID4gaXMg
Zm9yIHRoZSBib2FyZCB0byBib290IHRvIGEgbG9naW4gcHJvbXB0IG9uIGEgc2VyaWFsIHBvcnQg
dXNpbmcgYW4KPiA+IGluaXRyYW1zZnMuIFNvIHRoZSAuZHRzaSBhbmQgLmR0cyBmaWxlIGNhbiBi
ZSB2ZXJ5IHNsaW0sIENQVXMsIG1lbW9yeQo+ID4gYW5kIFVBUlRzLgo+ID4gCj4gPiBPbmNlIHlv
dSBoYXZlIHRoYXQgbWVyZ2VkIHlvdSBjYW4gd29yayBvbiB0aGUgb3RoZXIgZHJpdmVycywgdGhl
aXIKPiA+IGJpbmRpbmdzLCBldGMuCj4gPiAKPiBUaGUgZWljNzcwMC5kdHNpIGFuZCBlaWM3NzAw
LWhpZml2ZS1wcmVtaWVyLXA1NTAuZHRzIGFyZSBhbHJlYWR5IGluCj4gdjYuMTktcmM2LgoKR3Jl
YXQuCgo+IEJlY2F1c2UgdGhlIGRldmljZSBkcml2ZXJzIHN1Y2ggYXMgRXRoZXJuZXQgcmVseSBv
biB0aGUgY2xvY2sgZHJpdmVyLAo+IG91ciBwbGFuIGlzIHRoYXQgb25jZSB0aGUgY2xvY2sgZHJp
dmVyIGlzIGFwcGxpZWQsIHdlIHdpbGwgYWRkIG90aGVyCj4gZGV2aWNlIG5vZGVzIHN1Y2ggYXMg
RXRoZXJuZXQgYW5kIGVNTUMgaW4gdGhlIG5leHQgdXBzdHJlYW0gcGF0Y2gKPiBvZiB0aGUgRFRT
LiBJcyB0aGlzIHJlYXNvbmFibGU/CgpZZXMsIHRoaXMgaXMgcmVhc29uYWJsZS4gV2hlbiB5b3Ug
c3VibWl0IEV0aGVybmV0IHN1cHBvcnQsIHBsZWFzZQppbmNsdWRlIHRoZSBEVCBwYXRjaGVzIGFz
IHBhcnQgb2YgdGhlIHNlcmllcywgc28gd2UgY2FuIHNlZSB0aGUgZnVsbApwaWN0dXJlLiBXaGVu
IGl0IGNvbWVzIHRvIGFjdHVhbGx5IG1lcmdpbmcgaXQgY291bGQgYmUgdGhlIERUIHBhdGNoZXMK
Z2V0IHNlcGFyYXRlZCBvdXQgYW5kIGdvIGEgZGlmZmVyZW50IHBhdGgsIGJ1dCB3ZSBjYW4gZGVj
aWRlIHRoYXQgd2hlbgp3ZSBnZXQgdG8gdGhhdCBzdGFnZS4KCkdpdmVuIHRoZSBuZXcgaW5mb3Jt
YXRpb24sIGl0IGJlY29tZXMgY2xlYXIgdGhhdCBiYWNrd2FyZHMKY29tcGF0aWJpbGl0eSBpcyBu
b3QgYW4gaXNzdWUuIFNpbmNlIG1haW5saW5lIGRvZXMgbm90IGhhdmUgYW55IHVzZXJzCm9mIHRo
ZSBFdGhlcm5ldCBkcml2ZXIsIHlvdSBzaG91bGQgbWFrZSBub24tYmFja3dhcmRzIGNvbXBhdGli
bGUKY2hhbmdlcyBpbiBvcmRlciB0byBrZWVwIHRoaW5ncyBjbGVhbi4gSnVzdCBlbnN1cmUgdGhl
IGNvbW1pdCBtZXNzYWdlcwpwb2ludCBvdXQgdGhlcmUgYXJlIG5vIHVzZXJzLCBzbyB0aGUgY2hh
bmdlcyBhcmUgc2FmZS4KCglBbmRyZXcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
