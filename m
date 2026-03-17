Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ0ZGamcuGkzggEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 01:13:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFAC2A2315
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 01:13:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A132BC87ED8;
	Tue, 17 Mar 2026 00:13:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16B84C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 00:13:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BBDC443365
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 00:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5E8C19425
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 00:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773706405;
 bh=Kn3hnu/kLCbXlV8YMtYksGThcWoS4aEUofiHoSMyjcY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DLWuFyMQwRBw5QfxxZ9pDNRCM7ePNYEUYJSI8OtmacY7caIsqPhh7HVesTEWfOJIc
 qRwfqeeFUgmuEl0VUYPsaNIXVQlVQOsOZ001680+VJnWrM0BirrXFZgku3dPY0aPPw
 fiewEoChiNUAP17jexi2qrcg7rhQA8h0Ds2mR4EqEY8YpeOXmSMyLIWEwHW1/pAIIf
 dKMhJ5dMUeLACw0vwbVSFm9j945KpG3vfgHoTwzjzUTMluNHDy5llb4P8zyTRB1k39
 GnC3UmFZKAF5vbP8A2nKjh2/tNuA5sjkebFiJYWfg8NGFc1Zi30QSpftH1BPD3/HfX
 dbZaVxa+pnLYw==
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-7982c3b7dfcso48622887b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 17:13:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWFqcGP1NUglnQOwDM8EFGL6EtsoMyeSQ+8/YpDZWnnVaxXzec2YaJ3VqxS73GCg7MAqJYoyfobOP6WDA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyLB6b0wqyO67l31zU2AIXoDOoiJ7p/xnc+bPnspIVDC0xpPlCl
 GU7jbOsiGYLKoAcUuAVH34cXmcin89xIpUBwfkl3VR9U8zNIA6KPIYUrkIms+cARIXqCbLSC8gt
 cFbAEV43lKmjJ1CIH+Q793FhYozcktEI=
X-Received: by 2002:a05:690c:3387:b0:799:266:83cf with SMTP id
 00721157ae682-79a1c1b51acmr158135067b3.43.1773706404888; Mon, 16 Mar 2026
 17:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
 <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
 <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
In-Reply-To: <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Mar 2026 01:13:14 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Av5K7Ag95LYou4TMKGR59TmtiQpxcnpcj+4tZFtzRug@mail.gmail.com>
X-Gm-Features: AaiRm539yxW1CnWC8D8QmZdr1BxL5U68_GUe3uuuPSgXK1xikaSSDcXUyqDMApY
Message-ID: <CAD++jL=Av5K7Ag95LYou4TMKGR59TmtiQpxcnpcj+4tZFtzRug@mail.gmail.com>
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
	NEURAL_SPAM(0.00)[0.691];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 0AFAC2A2315
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU2F0LCBNYXIgMTQsIDIwMjYgYXQgMTozN+KAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiBPbiBTYXQsIE1hciAxNCwgMjAyNiBhdCAx
Mjo0NDo1NkFNICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+ID4gT24gRnJpLCBNYXIgMTMs
IDIwMjYgYXQgMTI6MDjigK9QTSBSdXNzZWxsIEtpbmcgKE9yYWNsZSkKPiA+IDxsaW51eEBhcm1s
aW51eC5vcmcudWs+IHdyb3RlOgo+ID4gPiBPbiBGcmksIE1hciAxMywgMjAyNiBhdCAxMTo1Nzox
NkFNICswMTAwLCBDaHJpc3RvcGhlIFJvdWxsaWVyIHdyb3RlOgo+ID4gPiA+IEluIHRoZSBkZWVw
ZXN0IGxvdy1wb3dlciBtb2RlcywgdGhlIHBpbmN0cmwgY29uZmlndXJhdGlvbiBpcyBsb3N0Cj4g
PiA+ID4gYW5kIGlzIG5ldmVyIHJlc3RvcmVkIGlmIHRoZSBpbnRlcmZhY2UgaXMgZG93bi4KPiA+
ID4gPiBUaGlzIGNvbW1pdCBlbnN1cmVzIHRoYXQgdGhlIHBpbmN0cmwgc3RhdGUgaXMgc2V0IGlu
IGFsbCBjYXNlcy4KPiA+ID4KPiA+ID4gU2hvdWxkbid0IHRoZSBwaW4gc3RhdGUgYmUgcmVzdG9y
ZWQgYnkgdGhlIHBpbmN0cmwgbGF5ZXI/Cj4gPgo+ID4gV2hhdCB3ZSBoYXZlIGluIHRoZSBkZXZp
Y2UgY29yZSBvbmx5IGFwcGxpZXMgImluaXQiIGFuZCAiZGVmYXVsdCIKPiA+IHN0YXRlcywgYW5k
IHByb3ZpZGVzIHRoZXNlIGhhbmRsZXMgZm9yIHRyYW5zaXRpb25pbmcgdG8gInNsZWVwIgo+ID4g
YW5kICJkZWZhdWx0IiBhZ2FpbiAobGlrZSBhIHN0YXRlIG1hY2hpbmUpLgo+Cj4gV2hhdCBJIHdh
cyBtZWFuaW5nIGlzIHRoYXQgLSBmb3IgYSBkcml2ZXIgdXNpbmcgdGhlICJkZWZhdWx0IiBzdGF0
ZSwKPiBpZiB0aGUgaGFyZHdhcmUgbG9zZXMgdGhlIHBpbmN0cmwgc3RhdGUgZHVyaW5nIHNsZWVw
LCBpc24ndCBpdCB0aGUKPiByZXNwb25zaWJpbGl0eSBvZiB0aGUgcGluY3RybCBkcml2ZXIgdG8g
cmVzdG9yZSB0aGUgc3RhdGUgcmF0aGVyCj4gdGhhbiBsZWF2aW5nIGl0IGluIHdoYXRldmVyIHN0
YXRlcyBpdCBoYXBwZW5zIHRvIGJlIHdoZW4gdGhlIFNvQwo+IGNvbWVzIGJhY2sgZnJvbSBzdXNw
ZW5kPwoKQWhhIEkgdW5kZXJzdGFuZC4KClNvbWUgcGluIGNvbnRyb2xsZXJzIGFyZSBhd2FyZSBv
ZiB0aGUgZGlmZmVyZW50IHN0YXRlcyBmcm9tIGFuCmVsZWN0cm9uaWMgcG9pbnQgb2Ygdmlldywg
c28gZGlmZmVyZW50IHN0YXRlcyBhcmUgcHJvZ3JhbW1lZCBpbnRvCnRoZSBoYXJkd2FyZSBmb3Ig
c3VzcGVuZC9zbGVlcCBhbmQgImFjdGl2ZSIuIFRoaXMgcHJvZ3JhbW1pbmcKY2FuIGJlIGJvdGgg
aW1wbGljaXQgKGZpeGVkIGluIHRoZSBwaW4gY29udHJvbGxlciBoYXJkd2FyZSkgb3IKcHJvZ3Jh
bW1hYmxlIGJ5IHRoZSBvcGVyYXRpbmcgc3lzdGVtLiBUaGVuIGEgaGFyZHdhcmUKbGluZSB0ZWxs
cyB0aGUgcGluIGNvbnRyb2xsZXIgd2hlbiB0aGUgc3lzdGVtIGdvZXMgdG8gc2xlZXAgc28gaXQK
YXV0b25vbW91c2x5IGFwcGx5IHNvbWUgc2xlZXAgbW9kZSBzZXR0aW5ncyB0byB0aGUgcGlucwph
bmQgcmV2ZXJzZSB0aGlzIGJhY2sgd2hlbiB3YWtpbmcgdXAuIFRoZXNlIHBpbiBjb250cm9sbGVy
cwp0aGVtc2VsdmVzIGFyZSAiYWx3YXlzIG9uIiwgaW4gYSBzcGVjaWZpYyBwb3dlciBkb21haW4g
dGhhdApuZXZlciBzaHV0cyBkb3duIHNvIHRoZXkgY2FuIGtlZXAgdHJhY2sgb2YgdGhpcy4KCklu
IG90aGVyIGNhc2VzIHRoZSBwaW4gY29udHJvbGxlciBsYWNrcyB0aGlzIGF1dG9ub21vdXMgYWJp
bGl0eQphbmQgdGhlbiBlYWNoIGRyaXZlciBuZWVkIHRvIHRyYW5zaXRpb24gaXRzIHBpbiBzdGF0
ZSB0byB0aGUKcmlnaHQgb25lIHdoZW4gZ29pbmcgdG8gc2xlZXAgYW5kIGNvbWluZyBiYWNrIHVw
LgoKSW4gc29tZSBmdXJ0aGVyIGNhc2VzIHRoZSBwaW4gY29udHJvbGxlciBkb2VzIHNvbWUgcG93
ZXIKbWFuYWdlbWVudCBidXQgaXQncyBzdWItb3B0aW1hbCBzdWNoIGFzIGxlYXZpbmcgSTJDIGJ1
cyBsaW5lcwpmbG9hdGluZyBvbiBwdWxsLXVwIHdoZW4gdGhleSBzaG91bGQgYmUgcHVsbGVkIHRv
IFZERAp0byBtaW5pbWl6ZSBsZWFrcyBkdXJpbmcgc2xlZXAgKGZvciBleGFtcGxlKS4gVGhlIGRl
ZmF1bHQKaXMgT0sgYnV0IHdpdGggc29tZSBwaW4gY29udHJvbCBzdGF0ZSBpbnRlcnZlbnRpb24g
d2UgY2FuIGRvCmJldHRlciwgc29tZXRpbWVzLgoKPiBJZiB0aGF0IGlzIG5vdCB0aGUgY2FzZSwg
dGhlbiBkb24ndCB3ZSBoYXZlIGEgbWFqb3IgaXNzdWUgd2hlcmUKPiBkcml2ZXJzIHVzaW5nIHBp
bmN0cmwgYnV0IGRvIG5vdCBpc3N1ZSBhbnkgcGluY3RybCBjYWxscyBpbiB0aGUKPiByZXN1bWUg
ZnVuY3Rpb24gYXJlIGJ1Z2d5PwoKU2FkbHksIGluIG15IGV4cGVyaWVuY2UsIHRoZSBwb3dlciBt
YW5hZ2VtZW50IGZlYXR1cmVzIG9mIGFuClNvQyBpcyB0aGUgbGFzdCBzdGVwIG9yIGFuICJhZnRl
cnRob3VnaHQiIHdoZW4gY29tcGFuaWVzCnVwc3RyZWFtIHRoZWlyIGNoYW5nZXMgdG8gdGhlIExp
bnV4IGtlcm5lbCwgdGhpcyBjb21lcyBsYXN0CmFuZCBvZnRlbiBuZXZlci4gVGhlIGNvZGUgaXMg
dGhlcmUgaW4gdGhlIGRvd25zdHJlYW0gKHZlbmRvcikKa2VybmVscy4gUnVubmluZyB0aGUgbWFp
bmxpbmUga2VybmVsIHdvcmtzIGJ1dCBlYXRzIHBvd2VyIDooCgpJIHRoaW5rIHdoYXQgd2Ugc2Vl
IHdoZW4gd2UgZG86CiQgZ2l0IGdyZXAgIHBpbmN0cmxfcG1fc2VsZWN0X3NsZWVwX3N0YXRlIHx3
YyAtbAoxMDcKYXJlIHRoZSBjb21wYW5pZXMgdGhhdCBoYXZlIGFjdHVhbGx5IGdvdHRlbiBhcm91
bmQgdG8gZG8gdGhpcwpwcm9wZXJseSBhbmQgdGVzdCBpdC4gVGhlcmUgYXJlIHNvbWUgdmVyeSBn
ZW5lcmljIGhhcmR3YXJlIGJsb2NrcwpzdWNoIGFzIHRoZSBkZXNpZ253YXJlIFVTQiBjb250cm9s
bGVyIGluIHRoYXQgbGlzdC4KClNvbWUgU29DcyBtYXkgYmVuZWZpdCBmcm9tIGF1dG9ub21vdXMg
cG93ZXIgc3RhdGUgY29udHJvbAppbiB0aGUgaGFyZHdhcmUsIGFsbCBBQ1BJIHBsYXRmb3JtcyBm
b3IgZXhhbXBsZSwgSSAqdGhpbmsqIGhhdmUKdGhlIGFtYml0aW9uIHRoYXQgZmlybXdhcmUvQklP
UyBkZWFscyB3aXRoIHRoaXMgYW5kIHdlIG5lZWQgbm90CnRoaW5rIGFib3V0IGl0LiBGb3IgZGV2
aWNldHJlZSBJIHRoaW5rIGl0IGRlcGVuZHMsIGl0J3MgdXAgdG8gdGhlClNvQyBob3cgbXVjaCBp
cyBhdXRvbm9tb3VzIGFuZCBob3cgbXVjaCBuZWVkcyB0byBiZQppbml0aWF0ZWQgYnkgdGhlIGRy
aXZlci4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
