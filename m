Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPTFEk3Fu2n1ngIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 10:43:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4FD2C8E98
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 10:43:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ACE7C87ED3;
	Thu, 19 Mar 2026 09:43:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D925C87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 09:43:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B4CCB44216
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 09:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B1DC2BCB3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 09:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773913417;
 bh=bMgGHUQEJT68rcKmPKkkz+YA7h0UjcbeuxER+65CECs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CJpkT6AMgLyEDWog2VuhaeuWut4qbpNvN8wETDsXnnb1T8tX3tRRI5W0KMzj5+V+A
 NfVS7DTuGsd1bEYQjb/u3/mUuMnGn+Xvf6xdH12GPejjt7ef1SS3IsTShlP3DhJzM3
 L5Y8uzD98RWY7dMMKwqTKusE2HOKkzroYrjw2Ro5jyjbx14bOYBgE1vMFsXsDZ8WHS
 dh8yG2jXnVlBWJhEzSkKw2rPB76FZQH4H6+olyhWF3lcbGLi0snE2YeKOyPM6uSUOo
 kBOe/2LOS+MO6y4F0LokKadUMI1tYNh/Lq3y4CzDQu5EV/BmKxamj22l+U7/gjNwhc
 xxESAUopnwpsw==
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-79a3e2e64f4so5767567b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 02:43:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVLsSo4jFIXOIovhhDjUhPycEgcoH/pQ9RJGCgrGFirdNxLgwUN7r80YezcqGB5MtEt5qA6uzqsTfH0uA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwWc4axZ9ULn1g9Cv/OzUSiRNl7bltbjVYGgglANeE0dxyDXe5/
 Owr1BMKqDZnPC7rXZ+FqDh60RoTaRYVMHsEIz2Zgndxr97OYl66k8FPKWBlPeZz/J4bLbg/1TCk
 ijBtXXdC+/dsHXwoWJGEOCYD3+l1xpKw=
X-Received: by 2002:a05:690c:5c0f:b0:799:266:83e0 with SMTP id
 00721157ae682-79a71ad3746mr55108737b3.34.1773913416961; Thu, 19 Mar 2026
 02:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
 <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
 <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
 <CAD++jL=Av5K7Ag95LYou4TMKGR59TmtiQpxcnpcj+4tZFtzRug@mail.gmail.com>
 <ablS_C8oEQFeSU1Q@shell.armlinux.org.uk>
In-Reply-To: <ablS_C8oEQFeSU1Q@shell.armlinux.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 10:43:25 +0100
X-Gmail-Original-Message-ID: <CAD++jLm5_mfx1572Cg+NPhuLoPu6DKDfOwK5XxRc4R_8M7kbYw@mail.gmail.com>
X-Gm-Features: AaiRm51a7-23Ps_LNUqYLhXePq1YU-pfVicusBYk32Lem3Dq79jrtE3Jr1i48f8
Message-ID: <CAD++jLm5_mfx1572Cg+NPhuLoPu6DKDfOwK5XxRc4R_8M7kbYw@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
X-Spamd-Result: default: False [4.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:christophe.roullier@foss.st.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,foss.st.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	NEURAL_SPAM(0.00)[0.692];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo,mail.gmail.com:mid,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: DE4FD2C8E98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMTcsIDIwMjYgYXQgMjoxMeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiBPbiBUdWUsIE1hciAxNywgMjAyNiBhdCAw
MToxMzoxNEFNICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgoKPiA+IEFoYSBJIHVuZGVyc3Rh
bmQuCj4KPiBJJ20gbm90IHNvIHN1cmUuCgpPSyBsZXQncyBoYXNoIGl0IG91dC4KCj4gSSdtIHRy
eWluZyB0byBnZXQgYW4gYW5zd2VyIG9uIHRoaXMsIGJlY2F1c2UgdGhlIG9yaWdpbmFsIHBhdGNo
Cj4gZGVzY3JpcHRpb24gaGVyZSBzYXlzOgo+Cj4gfCBJbiB0aGUgZGVlcGVzdCBsb3ctcG93ZXIg
bW9kZXMsIHRoZSBwaW5jdHJsIGNvbmZpZ3VyYXRpb24gaXMKPiB8IGxvc3QgYW5kIGlzIG5ldmVy
IHJlc3RvcmVkIGlmIHRoZSBpbnRlcmZhY2UgaXMgZG93bi4KPgo+IHN0bW1hYyB1c2VzIHRoZSAi
ZGVmYXVsdCIgcGluY3RybCBzdGF0ZSBhdCBwcm9iZSB0aW1lLiBUaGlzIGNvbW1pdAo+IHNheXMg
dGhhdCBpcyBsb3N0IG92ZXIgc3VzcGVuZC9yZXN1bWUgLSB3aGljaCB0byBtZSBzb3VuZHMgbGlr
ZQo+IGEgcGluY3RybCBkcml2ZXIgYnVnLCBiZWNhdXNlIG9uIHJlc3VtZSwgdGhlIHBpbmN0cmwg
ZHJpdmVyIGlzIG5vdAo+IGVuc3VyaW5nIHRoYXQgdGhlIHBpbmN0cmwgc3RhdGUgaXMgcmVzdG9y
ZWQgdG8gd2hhdGV2ZXIgaXQgd2FzIHdoZW4KPiB0aGUgc3VzcGVuZCBoYXBwZW5lZCAod2hldGhl
ciB0aGUgZHJpdmVyIGV4cGxpY2l0bHkgY2hhbmdlZCBpdCBvcgo+IG5vdC4pCj4KPiBUbyBwdXQg
aXQgYW5vdGhlciB3YXkuLi4KPgo+IE9uIGVudHJ5IHRvIHByb2JlIGZvciBhIG5vbi1waW5jdHJs
IGRyaXZlciwgaWYgRFQgZGVzY3JpYmVzIGEgZGVmYXVsdAo+IHBpbmN0cmwgc3RhdGUsIHRoYXQg
c3RhdGUgd2lsbCBiZSBzZWxlY3RlZCBieSBjb3JlIGNvZGUuCj4KPiBPbiBzdXNwZW5kLCB0aGUg
ZHJpdmVyIGlzIGZyZWUgdG8gc2VsZWN0IGFub3RoZXIgc3RhdGUgaWYgaXQgc28gd2lzaGVzLAo+
IG9yIGRvIG5vdGhpbmcgKGUuZy4gaXQncyB1bmF3YXJlIG9mIHBpbmN0cmwuKQo+Cj4gT24gcmVz
dW1lLCB0aGUgcGluY3RybCBsYXllciwgd2hhdCBpcyBleHBlY3RlZCB0byBoYXBwZW4uIFN1cmVs
eSwgaXQKPiBpcyByZWFzb25hYmxlIGZvciBhIHBpbmN0cmwgdW5hd2FyZSBkcml2ZXIsIG9yIGF0
IGxlYXN0IGEgZHJpdmVyIHdoaWNoCj4gaGFzIF9ub3RfIGNoYW5nZWQgdGhlIHBpbmN0cmwgc3Rh
dGUgdG8gZXhwZWN0IHRoYXQgdGhlIGRlZmF1bHQgcGluY3RybAo+IHN0YXRlIGlzIHN0aWxsIGlu
IGVmZmVjdCB3aGVuIGl0cyByZXN1bWUgZnVuY3Rpb24gaXMgY2FsbGVkIC0gYW5kIGlmCj4gdGhh
dCBpcyBub3QgdGhlIGNhc2UsIHRoZW4gdGhlcmUncyBhIGJ1ZyBoZXJlLgo+Cj4gQW5vdGhlciB3
YXkgdG8gcHV0IGl0Li4uCj4KPiBXZSBzaG91bGRuJ3QgYmUgZXhwZWN0aW5nIGRldmljZSBkcml2
ZXJzIHRvIGhhdmUgdG8gbWVzcyB3aXRoIHBpbmN0cmwKPiBlLmcuIHN3aXRjaGluZyB0byBhIHNs
ZWVwIHN0YXRlIGFuZCB0aGVuIGJhY2sgdG8gYSBkZWZhdWx0IHN0YXRlIGp1c3QKPiB0byBoYXZl
IHBpbmN0cmwgc2V0dGluZ3MgcmVzdG9yZWQgdG8gYSBmdW5jdGlvbmFsIHN0YXRlIG9uIHJlc3Vt
ZS4KCk9LIEkgc2VlIHlvdXIgcG9pbnQsIHRoZSBwaW5jdHJsIGhhcmR3YXJlIHN0YXRlIHNob3Vs
ZCBub3QgY2hhbmdlCmJlaGluZCB0aGUgYmFjayBvZiB0aGUgZHJpdmVyLCBhbmQgaWYgaXQgZG9l
cywgYW5kIHRoYXQgaXMgd29ya2VkCmFyb3VuZCBieSB0aGVzZSBjYWxscyB0byByZXN0b3JlIHRo
ZSBzdGF0ZSB1c2luZyB0aGUgcGluY3RybCBQTQpoZWxwZXJzIGJlY29tZSBhIG1lc3N5IHF1aXJr
LgoKLSBTZWxlY3RpbmcgdGhvc2Ugc3RhdGVzIHRvIHJlY29uZmlndXJlIHBpbnMgaW50byBzcGVj
aWFsIG1vZGVzCiAgZHVyaW5nIHNsZWVwIGlzIE9LLgoKLSBTZWxlY3RpbmcgdGhvc2Ugc3RhdGVz
IHRvIHJlc3RvcmUgdGhlIGhhcmR3YXJlIHN0YXRlIGluc2lkZSB0aGUKICBwaW4gY29udHJvbGxl
ciBpdHNlbGYgaXMgTk9UIE9LLgoKSWYgdGhpcyBpcyBkb25lIGZvciB0aGUgbGF0dGVyIHJlYXNv
biwgeW91J3JlIHJpZ2h0IG9mIGNvdXJzZSwgdGhlcmUgaXMKYSBidWcgaW4gdGhlIHBpbiBjb250
cm9sbGVyLiBDZXJ0YWlubHkgaXQgaXMgZXhwZWN0ZWQgdG8gbWFpbnRhaW4gaXRzCm93biBzdGF0
ZSBvdmVyIGEgc3VzcGVuZC9yZXN1bWUgY3ljbGUuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
