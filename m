Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VrIoCsWMl2lv0QIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Feb 2026 23:20:53 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B6F1631A0
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Feb 2026 23:20:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15FC9C8F273;
	Thu, 19 Feb 2026 22:20:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCD5DC87ECA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 22:20:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CA4A76183C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 22:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048EDC2BCB3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 22:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771539649;
 bh=7rG7l1d8wcnIU2PDqonrIOzyrgRE6wVd+m8ziks3L0Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=p0OytsKo9aM3h0I2mAzXD0d9QBuPUjESQz2hN5IxlVe0oyTYccDGkSw89sv2wisHV
 LtGXf/QYGh4XSeU8rPaMVFxD30tEN9H0y4JNf5E0PvIZRrT6UaUDXVj1nKKEkjcJXu
 eoG+W8TE5QTZYptGQGOebU4xNLBAkc3YRvSEM4D+nnyk5RzwO+ehrVkeo57n9OiZhg
 py+cd87+XtH+nbefwlGzpKL9fu2CcMbfHbzlPRqaRaBjs+4fLC1aimeQ9LpNOxkimh
 wANgYekA1SvSogHc29vGGf/TYzkBcZ2ePCYTj9sQe0/OHqGjNNXhRHaZBvkhgK57eK
 qFAln6ISZU1Vw==
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-797d857e3f4so14861277b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 14:20:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVe70NDp/ihg2hg7IVCkPmKNJXrzA+SqXR5WffgxnrN3A3Lx2SzHiNgswJXYaIq+npS+ceUOz02dZJvAg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzbXQdCwaI/wfwFelNfOllhwEynKmPZxQpBfsF874UW+ew4pD0v
 EjifLZOlzXHTSutRnoaReJ0deF126jXZHvHni2x2hkXhWeGNGO77rqYXcCLRnvqLbOu6AR1sYwE
 qlMJNf3/DnYYNlzWopsFjAj+Ns/KurKk=
X-Received: by 2002:a05:690c:4913:b0:797:a162:f7d7 with SMTP id
 00721157ae682-797ac668393mr155417627b3.62.1771539648217; Thu, 19 Feb 2026
 14:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
 <20260218083618.67805-3-christophe.roullier@foss.st.com>
 <aZV-b6TdLMdI8dm4@shell.armlinux.org.uk>
 <CAD++jLnF=8MvW4CbXmPZR=w8tAUZiL9M3N73WB++DaYYwhToDQ@mail.gmail.com>
 <aZdjke4eOwF-wTZO@shell.armlinux.org.uk>
In-Reply-To: <aZdjke4eOwF-wTZO@shell.armlinux.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 23:20:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLmkGtsr9jdzSeyRbHeh_abgz1osn2czEcBOzJ1n1JSh_A@mail.gmail.com>
X-Gm-Features: AaiRm510EWGZUrBhAzIL44W1hn8wAZ_A5KLa10hcXdNoXBhGJk2lSRSIAxMNPUY
Message-ID: <CAD++jLmkGtsr9jdzSeyRbHeh_abgz1osn2czEcBOzJ1n1JSh_A@mail.gmail.com>
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
	NEURAL_HAM(-0.00)[-0.874];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 68B6F1631A0
X-Rspamd-Action: no action

T24gVGh1LCBGZWIgMTksIDIwMjYgYXQgODoyNeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiBPbiBUaHUsIEZlYiAxOSwgMjAyNiBhdCAw
ODoxMToxM1BNICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgoKPiA+IFRoZXJlIGlzIHJlYWxs
eSBubyBvdGhlciBjbGVhbnVwIHRoYXQgY2FuIGhhcHBlbjogdGhlcmUgaXMgbm8KPiA+IGJlZm9y
ZS1kZWZhdWx0LW9yLWluaXQgc3RhdGUgd2UgY2FuIHJldmVydCB0byAodGhhdCB3b3VsZCBiZSB0
aGUKPiA+IHBvd2VyLW9uIHZhbHVlcyksIHNvIHRoZXJlIGFyZSBqdXN0IHRoZXNlIHN0YXRlcyBp
biBzb21lIHBvaW50ZXJzCj4gPiB0aGF0IGNvdWxkIGJlIGFjY2Vzc2VkIGJ5IGUuZy4gcGluY3Ry
bF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUoKQo+ID4gdGhhdCBnZXQgZnJlZTplZCB1cCwgYW5kIG11
eGluZyBhbmQgcGluIGNvbmZpZyB0aGF0IGhhcHBlbmVkCj4gPiBpbiB0aGUgcGluIGNvbnRyb2wg
aGFyZHdhcmUganVzdCBzdGF5cyBhcm91bmQuCj4KPiBXaGF0IHdlIHNlZW0gdG8gZW5kIHVwIHdp
dGggaXMgdGhhdCBvbiBwcm9iZSBmYWlsdXJlLCB3ZSBzZXQgdGhlIHBpbnMKPiB0byBpbml0IG9y
IGRlZmF1bHQgc3RhdGUuCgpJbmRlZWQuCgo+IEhvd2V2ZXIsIG9uIHJlbW92ZSwgaXQncyB1cCB0
byB0aGUgZHJpdmVyIHRvCj4gZGVjaWRlIHdoZXRoZXIgdG8gcHV0IHRoZSBwaW5zIGludG8gc2xl
ZXAgc3RhdGUgb3Igbm90Lgo+Cj4gU2hvdWxkbid0IGEgZHJpdmVyIGJlIGNvbnNpc3RlbnQsIGFu
ZCBwbGFjZSB0aGUgcGlucyBpbnRvIHRoZSBzYW1lCj4gc3RhdGUgaW4gYm90aCB0aGVzZSBzY2Vu
YXJpb3M/CgpJIHRoaW5rIHlvdSdyZSByaWdodC4gSnVzdCB2ZXJ5IGZldyBkZXZpY2UgdHJlZXMg
ZGVmaW5lIHRoZSAic2xlZXAiCnN0YXRlICh0aGUgaW5mYW1vdXMgInNvIGZhciBzbyBnb29kLi4u
Iikgc28gaXQgaGFzIG5vdCBiZWVuIGFkcmVzc2VkLgoKPiBDb252ZXJzZWx5LCBJJ20gc2xpZ2h0
bHkgd29ycmllZCB0aGF0IHB1dHRpbmcgcGlucyBpbnRvIHNsZWVwIHN0YXRlCj4gd2hlbiB3ZSdy
ZSBub3QgcG93ZXJpbmcgZG93biBtYXkgYmUgYmFkIGlmIHRoZXkncmUgYWxsb3dlZCB0byB0aGVu
Cj4gZmxvYXQsIHdoaWNoIGNvdWxkIGNhdXNlIHRoZSBQSFkgdG8gaW50ZXJmZXJlIG9uIHRoZSBu
ZXR3b3JrLgoKVGhhdCdzIGEgZ29vZCBwb2ludC4KCkl0J3MgcGVyZmVjdGx5IGxlZ2FsIHRvIGRl
ZmluZSBhbnkgcmFuZG9tIHN0YXRlIGZvciB0aGUgZHJpdmVyLCBzdWNoCmFzICJyZWxheGVkIiBv
ciAidW51c2VkIi4gSXQgaGFkIHRoZSBvbmx5IGRvd25zaWRlIHRoYXQgdGhlIGRldmljZQpkcml2
ZXIgY29yZSB3aWxsIG5vdCBoZWxwIG91dCBpbiBsb29raW5nIHVwIHRoZSBzdGF0ZSBieSBkZWZh
dWx0LgoKSSdkIGJlIGhhcHB5IHRvIHRha2UgYSBwYXRjaCB0aGF0IGUuZy4gbG9va3MgZm9yIGFu
ICJ1bnVzZWQiCnN0YXRlIGFuZCBwdXQgdGhlIHBpbnMgaW50byB0aGF0IHN0YXRlIGlmIHByb2Jl
IGZhaWxzLCBvciB3aGVuCnJlbW92ZSgpIGlzIGNhbGxlZCwgc28gd2UgZ2V0IHNvbWV0aGluZyBl
dmVyeW9uZSBjYW4gdXNlIGZvcgp0aGlzLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
