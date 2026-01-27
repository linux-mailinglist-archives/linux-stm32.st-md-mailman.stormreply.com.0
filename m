Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sE4fD/DfeGkGtwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 16:55:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D25E997330
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 16:55:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 704C5C56603;
	Tue, 27 Jan 2026 15:55:27 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E779CC01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 15:55:25 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-432d2c96215so5115783f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 07:55:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769529325; cv=none;
 d=google.com; s=arc-20240605;
 b=KifAYSeKhFp0Rvv9F6TVHP906ZRK3D/I6GfLYNXvkv84OiuxN5eVTMW/uowocUqX3l
 +R9OCFoXDjhGz5mekq2Bjtm7eholLEtml2HvWui2XRSnpN0xSiFuLslaAUAvAKHXtLzT
 tGUOzGfCluUuLUvk5eCjJHsOs2xrgRf37Vfzn2sBIzrhtYErRoBZU3pGN13kU1WfGZ42
 ezwA931FPEyOkP5wAR65hI7mmGMRSvHz2Jcg463yKci5ysHCMdUe4TXqeI9q5X6+arLQ
 ciBntafp6Yxw7saVi4ZcyYI09kVdmIheW4SkevV32CnpKvnRPfTIOneF4jRnzlI8jiRs
 Rmqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=mdjGxuEW0WnDn6G9gnMVeIPJ3u/i1K8ZcFBcJ8h4M4U=;
 fh=GjPzxyiBT2ahpkxVrSm/Oib/8XmW8Ly3FkNb9lwxDWc=;
 b=ZtryJeg8BrnTgtTKBwQdMSqqXD3WKwNHv2BovPQCWVAVy92y49xvuH4Tcit1/LXQ7E
 COEKyykJJvQREI06FZ5qcdsDqpSca1uiA0HEev+ZgsuvpgF7EfjZ9NKJkHF63yaEtu9z
 XjAa8GvXr2BQVyz2QaahyUXg+rbKZtuu3y22VBM2QRBB7CTkHafrcSew1BPZRObLeXnR
 4WNEnDycCeeLJfwru0rys8r4BVjIK8okdVmdNCCmskq4NxWJywvS1w10iwTCJQFcpueP
 npiI+GcBI0m7I8JOBT4h1jQ7jtMHpEFcTPAV7Q1+dX8zmZG8BQt8kClmuQ/XfTRm+yUT
 zlQw==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769529325; x=1770134125;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mdjGxuEW0WnDn6G9gnMVeIPJ3u/i1K8ZcFBcJ8h4M4U=;
 b=D3bupFBim4Rjn45RXAqFpLQ+4zrzXW+toHzQSb5aJ/FCpk2vflmIMWLdR35kp/gBX4
 amhLXq7ktREm/38GhFdH5fl+LEA2UGz7gQZT0lU7uux/NJJCCijurRTGBPnL8bn8fcMm
 f9xSe+GG48pkCRSxxrA5xLYmoiQQcHPnZE8BWpnOJQXWa5qyAl2i6dLoQn4Kh33GeFqf
 V5netUs9ZxRATBGoID3c4wnHFxsD2LpRNmDu3vWIF+vJrWTq/Gm8Q7K8qTAU4tSjKZZp
 WlhERcbKwtFZJtp39ewmAih/GsCtEOdyL0uVKt20hr/Ir8+nkAM5vSt9/YVLv1a0EiqK
 Ns4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769529325; x=1770134125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mdjGxuEW0WnDn6G9gnMVeIPJ3u/i1K8ZcFBcJ8h4M4U=;
 b=Bm21yJgRnf0aC9C+X5q6dM5TygwFzNzogfFFe+jaxBi4SCryOlVynpHHZ1g259wYqm
 QXS+Ee/snxYdosqMOUiCVFwepoikCxTKLMYi3509E+Wx6vGNKRCrCyAqLTKKn/dwTQLZ
 iADFT9dge0xuvFPi+mTvwOk9ez55Ach4SIIFbjngm3G31GGRe1GqW2GmP+R1mVsjSE7A
 A4dOXULRZtCxyD7OIJCwwBFj6CYAmxUzLnmkd6daEk/ylQ8BpJOHp3xkCOOWAH3Gr5pG
 pqEX/vd1TV4Wxnw0rXA41uxgLr49YJZ2V6IOYSstny3T7w/nBQsBVl+Hf5nVUdDS301n
 1oJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGqEy+PtrEZE/CUVZLcDrPy+ZN9P/LZ2Ep2lbaA5KrfFgTZLts18craPJ79+W8O/HB1yFd623dJl0gnw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxYlnsnXrRm6EiX6Wh4RdpsXYucRmrJgM/euYtveuXYb6SKZcda
 uhMGxBP1m5w0hPptXLi+0ByHMUXEmW9PUQ+dxY2Dcxl+tpr3DjdzBnPKJzW9fewSShSiBIxHbQP
 +mkz3qXBfe7cM0a1IcH38jsaRqSyaLdE=
X-Gm-Gg: AZuq6aJg4NkuAxck56Nshbd3FB5cNE0mryZJu+HyUdhB+lRCa/si27N/eLUQuJl2bXc
 YanP1+Frltm7DDEQL6j2ABQ4KtMagtZ7GSgDk2C9XuWBLRJiTgu8S5rH6y4q15RknkTwFHY+RGW
 Sb9p6EGt/18al3lOwuMHEq3qGZhLJlsIYrBUXnlN7Mt6jsdGGnoy14EImObuUqQWAI1hVHbbDIs
 E6O813mgYKJDyDLiR95CyMfeg3ZRWZFUKbYXSvmQLA/Vh/GkGfNRDckaCnXXB7+5xdEvbiJrmW1
 0eKuBjfLMR9i3BdD0fkoS/RYp7bR30+TOIXDX/kndYcAOZo2sPLtOL4VVw==
X-Received: by 2002:a05:6000:186e:b0:42b:55a1:2158 with SMTP id
 ffacd0b85a97d-435dd0304a0mr3286115f8f.17.1769529324882; Tue, 27 Jan 2026
 07:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk>
 <CA+V-a8t5RKY9vyFDg0V3AWcBovBdWbcvqdPeiPYmHRA8v2=UGQ@mail.gmail.com>
 <CAMuHMdXOMMyYrbPr8H3O+oj7QeGg324jXdV1QUaUhQF4sxTyfg@mail.gmail.com>
In-Reply-To: <CAMuHMdXOMMyYrbPr8H3O+oj7QeGg324jXdV1QUaUhQF4sxTyfg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 Jan 2026 15:54:57 +0000
X-Gm-Features: AZwV_QiFFOxc86MsSOA1lIfzqIqjtoa3ZePZV2eq56xOKDzBCZT0iVVI9LGkicc
Message-ID: <CA+V-a8sQTRZOFk=KASum4Gi4cKK7NdLZu1W0n4ZyWPuKGSc9uQ@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH net-next] net: stmmac: Preserve
 bootloader MAC address across unconditional reset
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:linux-kernel@vger.kernel.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:netdev@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:fabrizio.castro.jz@renesas.com,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:biju.das.jz@bp.renesas.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:geert@glider.be,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,pengutronix.de,glider.be,bp.renesas.com,st-md-mailman.stormreply.com,armlinux.org.uk,renesas.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,mail.gmail.com:mid,linux-m68k.org:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: D25E997330
X-Rspamd-Action: no action

SGkgR2VlcnQsCgpPbiBUdWUsIEphbiAyNywgMjAyNiBhdCAxOjU34oCvUE0gR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4K
PiBPbiBUdWUsIDI3IEphbiAyMDI2IGF0IDE0OjM5LCBMYWQsIFByYWJoYWthciA8cHJhYmhha2Fy
LmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gT24gTW9uLCBKYW4gMjYsIDIwMjYgYXQgNjox
MeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo+ID4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4g
d3JvdGU6Cj4gPiA+IE9uIE1vbiwgSmFuIDI2LCAyMDI2IGF0IDA1OjI1OjAzUE0gKzAwMDAsIFBy
YWJoYWthciB3cm90ZToKPiA+ID4gd2hlcmUgImxvY2FsLW1hYy1hZGRyZXNzIiBzdGF0ZXMgdGhl
IE1BQyBhZGRyZXNzIHRvIGJlIHVzZWQgZm9yIGV0aDAsCj4gPiA+IGFzIHNwZWNpZmllZCBieSB0
aGUgYm9vdCBsb2FkZXIuCj4gPiA+Cj4gPiBUaGFua3MgZm9yIHRoZSBwb2ludGVyLCBJIHdpbGwg
dXNlIHRoZSBhYm92ZS1tZW50aW9uZWQgbWV0aG9kIHdpdGgKPiA+IHdoaWNoIHdlIHdvbid0IGJl
IG5lZWRpbmcgdGhpcyBwYXRjaCBvbiB0aGUgUlovVDJIIHBsYXRmb3JtLgo+Cj4gVGhpcyBzaG91
bGQgYWxyZWFkeSB3b3JrIG91dC1vZi10aGUtYm94LCBhcwo+IGFyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yenQyaC1uMmgtZXZrLWNvbW1vbi5kdHNpIGFscmVhZHkgaGFzOgo+Cj4gICAgIGFs
aWFzZXMgewo+ICAgICAgICAgICAgIGV0aGVybmV0MyA9ICZnbWFjMTsKPiAgICAgICAgICAgICBl
dGhlcm5ldDIgPSAmZ21hYzI7Cj4KPiBTbyBqdXN0IG1ha2Ugc3VyZSB0byBzZXQgdGhlICJldGgy
YWRkciIgYW5kICJldGgzYWRkciIgZW52aXJvbm1lbnQKPiB2YXJpYWJsZXMgaW4gVS1Cb290Lgo+
CkFncmVlZCwgaXQgd2FzIGp1c3QgdGhhdCB0aGUgYWxpYXNlcyBpbiBMaW51eCBhbmQgdS1ib290
IGRpZG4ndCBtYXRjaAp1cCAoSXZlIG5vdGlmaWVkIHRoZSBCU1AgdGVhbSB0byB1cGRhdGUgaXQg
YWNjb3JkaW5nbHkpLgoKQ2hlZXJzLApQcmFiaGFrYXIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
