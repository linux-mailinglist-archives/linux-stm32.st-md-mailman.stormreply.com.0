Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMGWOGFgl2kAxgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Feb 2026 20:11:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 760A0161DC4
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Feb 2026 20:11:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FFF4C8F273;
	Thu, 19 Feb 2026 19:11:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D59BC87ECA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 19:11:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4596443D79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 19:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E82C2BCC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 19:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771528286;
 bh=Rb0+DBfdVleoRslWweeISPOle2jWWZ3LQCLlNVSSpQ8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=M2Zh9tp2BvoGWIdJjmFDvecrf8pKPZCqMsw3++rmfdWVCo1tlChq5LvqX3L/ZHsNA
 VsDjA6pKM7mYUvD7iYnp2GO8Xw9OVG/8mpe0Gv9CuoLD/KypGeUGYA/lb4n10ny1pU
 CqcSkUNm3JEQD372x4GQi939dFBqs8m4uRRQ5rpRb9nYjb72ofZe+YlT8uvnW0wovM
 CrVWZWZdNeS62BWkCPSzBE79jqerH3Cyyd1/WiXX5OK27OmjeVYCqCeqY1zl327Btd
 UljS6NGpyZehGnT8dQAazFNbhZ+0NmrjeNJXMeaFJ6B2Fg1VnlytX6vJblot6s866I
 z0D5kaYo7/7iA==
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-79088484065so12106267b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 11:11:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWAziVfL7YhnTkWNP/MXEPZGY/8HSVjG09MNqH79fr9KtrONINWtX58/0uCGvkNSb2C1FyszFceCqZP2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwwLiCgafN2JbgrhBjPWarRa0BUT1JLjjyp9tXf/UuYnmItJW4k
 tk7ysVdvZAMCmOT7Ur7x0SqJAnYMWGeaBML4YdTN+JWyv3tU24gdTkvVlZ3ExXRkoeS5wCesMUd
 LmjZxOJ003pCfmEFGw2SR8bfPtBnM6a8=
X-Received: by 2002:a05:690c:ed5:b0:797:f635:c896 with SMTP id
 00721157ae682-797f717b02cmr50185397b3.9.1771528285140; Thu, 19 Feb 2026
 11:11:25 -0800 (PST)
MIME-Version: 1.0
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
 <20260218083618.67805-3-christophe.roullier@foss.st.com>
 <aZV-b6TdLMdI8dm4@shell.armlinux.org.uk>
In-Reply-To: <aZV-b6TdLMdI8dm4@shell.armlinux.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 20:11:13 +0100
X-Gmail-Original-Message-ID: <CAD++jLnF=8MvW4CbXmPZR=w8tAUZiL9M3N73WB++DaYYwhToDQ@mail.gmail.com>
X-Gm-Features: AaiRm50ZmYrtHjO9YzusnFCmg5M5z6i9LzHE-qxCdbPPiIH94xxykSK7yFLYpYI
Message-ID: <CAD++jLnF=8MvW4CbXmPZR=w8tAUZiL9M3N73WB++DaYYwhToDQ@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:christophe.roullier@foss.st.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,foss.st.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.873];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st.com:email]
X-Rspamd-Queue-Id: 760A0161DC4
X-Rspamd-Action: no action

T24gV2VkLCBGZWIgMTgsIDIwMjYgYXQgOTo1NeKAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiBPbiBXZWQsIEZlYiAxOCwgMjAyNiBhdCAw
OTozNjoxN0FNICswMTAwLCBDaHJpc3RvcGhlIFJvdWxsaWVyIHdyb3RlOgo+ID4gd2hlbiBzeXN0
ZW0gc3VzcGVuZCBvciB1bmJpbmQsIG5lZWQgdG8gc2V0IHBpbnMKPiA+IHRvIGxvdyBwb3dlciBz
dGF0ZSB0byBzYXZlIElPIHBvd2VyIGNvbnN1bXB0aW9uLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IENocmlzdG9waGUgUm91bGxpZXIgPGNocmlzdG9waGUucm91bGxpZXJAZm9zcy5zdC5jb20+Cj4g
PiAtLS0KPiA+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFp
bi5jIHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19t
YWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5j
Cj4gPiBpbmRleCAwNjdiMTdmMDNjZDA5Li4zZDRmMGU0Y2I1M2ZiIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ID4gKysr
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ID4g
QEAgLTgwNzEsNiArODA3MSw5IEBAIHZvaWQgc3RtbWFjX2R2cl9yZW1vdmUoc3RydWN0IGRldmlj
ZSAqZGV2KQo+ID4gICAgICAgbXV0ZXhfZGVzdHJveSgmcHJpdi0+bG9jayk7Cj4gPiAgICAgICBi
aXRtYXBfZnJlZShwcml2LT5hZl94ZHBfemNfcXBzKTsKPiA+Cj4gPiArICAgICAvKiBTZWxlY3Qg
c2xlZXAgcGluIHN0YXRlICovCj4gPiArICAgICBwaW5jdHJsX3BtX3NlbGVjdF9zbGVlcF9zdGF0
ZShkZXYpOwo+ID4gKwo+Cj4gSSdtIG5vdCBjb252aW5jZWQgdGhpcyBpcyBjb3JyZWN0LCB0aGVy
ZSdzIG5vdGhpbmcgdG8gbWF0Y2ggaXQgaW4gdGhlCj4gcHJvYmUgZnVuY3Rpb24sIGV4Y2VwdCB3
aGF0IHRoZSBkcml2ZXIgbW9kZWwgY29yZSBkb2VzLiBIb3dldmVyLCB0aGUKPiBkcml2ZXIgbW9k
ZWwgY29yZSBhbHNvIGRvZXNuJ3QgY2xlYW4gdXAgdGhlIHN0YXRlIGlmIHByb2JlIGZhaWxzLgoK
SSB0aGluayBpdCBsb29rcyByaWdodCwgaWYgdGhpcyBzdGF0ZSBpcyBpbmRlZWQgZm9yIHRoZSBz
bGVlcCBzdGF0ZSBvZiB0aGUKZGV2aWNlIHBpbnMsIGFuZCB0aGlzIGlzIHdoYXQgeW91IHdhbnQg
dG8gaGFwcGVuIGF0IHJlbW92ZSgpLgoKVGhlIG5vbi1jbGVhbnVwIG9mIHRoZSBwaW4gc3RhdGVz
IGlzIGEgKG1heWJlIHVnbHkpIGZlYXR1cmU6IHRoZXJlCmlzIGFuICJpbml0IiBhbmQgYSAiZGVm
YXVsdCIgc3RhdGUuIElmIHRoZSAiaW5pdCIgc3RhdGUgZG9lcyBub3QgZXhpc3QgdGhlCiJkZWZh
dWx0IiBzdGF0ZSBpcyBzZWxlY3RlZCBpbiB0aGUgZGQuYyBjYWxsLgoKVGhlc2Ugc3RhdGVzIGFy
ZSBqdXN0IHNvbWUgdmFsdWVzIGluIGRldi0+cGlucywgYWxsb2NhdGVkIHdpdGgKZGV2bV9remFs
bG9jKCksIGFuZCBkZXZtX3BpbmN0cmxfZ2V0KCkgZm9yIGUuZy4gZGV2LT5waW5zLT5wLApzbyBJ
SVVDIHRoaXMgd2lsbCBiZWZyZWU6ZWQgb24gZHJpdmVyIGRldGFjaCwKYWxzbyBpZiB0aGUgcHJv
YmUoKSBmYWlscywgYXQgbGVhc3QgdGhhdCBpcyB3aGF0IHRoZSBvcmlnaW5hbCBkZXZyZXMKZGVz
aWduIGRvY3VtZW50IHNheXMKRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RyaXZlci1tb2RlbC9k
ZXZyZXMucnN0CgpUaGVyZSBpcyByZWFsbHkgbm8gb3RoZXIgY2xlYW51cCB0aGF0IGNhbiBoYXBw
ZW46IHRoZXJlIGlzIG5vCmJlZm9yZS1kZWZhdWx0LW9yLWluaXQgc3RhdGUgd2UgY2FuIHJldmVy
dCB0byAodGhhdCB3b3VsZCBiZSB0aGUKcG93ZXItb24gdmFsdWVzKSwgc28gdGhlcmUgYXJlIGp1
c3QgdGhlc2Ugc3RhdGVzIGluIHNvbWUgcG9pbnRlcnMKdGhhdCBjb3VsZCBiZSBhY2Nlc3NlZCBi
eSBlLmcuIHBpbmN0cmxfcG1fc2VsZWN0X3NsZWVwX3N0YXRlKCkKdGhhdCBnZXQgZnJlZTplZCB1
cCwgYW5kIG11eGluZyBhbmQgcGluIGNvbmZpZyB0aGF0IGhhcHBlbmVkCmluIHRoZSBwaW4gY29u
dHJvbCBoYXJkd2FyZSBqdXN0IHN0YXlzIGFyb3VuZC4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
