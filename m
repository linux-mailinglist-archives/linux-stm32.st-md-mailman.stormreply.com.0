Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLQlIImhtGmxrQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Mar 2026 00:45:13 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6C128AB9A
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Mar 2026 00:45:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B69FC87EDB;
	Fri, 13 Mar 2026 23:45:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DE36C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 23:45:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 370C3443C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 23:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17350C2BCB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 23:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773445510;
 bh=fOd/44im5/CXSgmKExZ34EPLx9erpANLJRLxew2LJbo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KAPg71Qz3FD5nku0YGMR2OE6VVa3P4OhlQgxEFExEHqeUTE6By0F/cjfBpI4vlHR9
 k8zQvOSlLhWoiCbVOhmK/Rhyj6KeuLDGvkkXUmoUTccIuL5YkFFlyJBtg9HvOdVZCk
 WLJ5olds50xF6Sbb5RZEO/Hqo49M46/DUqKrcN7mYA5b1IsO9gYLN1oGahgc2IWys5
 1N5aWnfg4p+E8Iul8lIqye6yGOT0Re1eQK0K0Va81wS/IdTsh1eJM/NdZD1iDnWqGc
 zXriWP5NKH0q/C0Oa8U76CqrEvi/WFPaB0faqF1dDEIsPdsTFh2VQ7bguH6pgHLGeZ
 XmJIBLCRbvmLw==
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-798578e2918so27575937b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 16:45:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWhIqAy6ar8H48p+1TN/W9RzMW1BgHQTXIuKrSTtxgrAcjYjIdGmVhpGpbXw3WBKmtzlpxhazwk6uf8qA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwXYM9p/okVfyQK3t9BRgodmsmLE5gsLnCxgqEfqx7hhunZT2cP
 9ILuHvwE1IgAqPtzSm/draJdG7k1MRz/gyAWVyuu8DoG7s3kPC7UGl22qZNNmRfwz+5VCMAcx6M
 xjQp1z7Fw4uZ+SrSkm9nXax8oLZZCxps=
X-Received: by 2002:a05:690c:34c9:b0:798:23f:7c4e with SMTP id
 00721157ae682-79a1c1bf4eamr55367137b3.45.1773445509360; Fri, 13 Mar 2026
 16:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
 <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
In-Reply-To: <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 14 Mar 2026 00:44:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
X-Gm-Features: AaiRm50-LY2Xhs76thbvINckDs7OJCXfCO8--wEHvQ5qpVOHRa3ZyCR2c8VTkN0
Message-ID: <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:christophe.roullier@foss.st.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: DC6C128AB9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgMTI6MDjigK9QTSBSdXNzZWxsIEtpbmcgKE9yYWNsZSkK
PGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gT24gRnJpLCBNYXIgMTMsIDIwMjYgYXQg
MTE6NTc6MTZBTSArMDEwMCwgQ2hyaXN0b3BoZSBSb3VsbGllciB3cm90ZToKPiA+IEluIHRoZSBk
ZWVwZXN0IGxvdy1wb3dlciBtb2RlcywgdGhlIHBpbmN0cmwgY29uZmlndXJhdGlvbiBpcyBsb3N0
Cj4gPiBhbmQgaXMgbmV2ZXIgcmVzdG9yZWQgaWYgdGhlIGludGVyZmFjZSBpcyBkb3duLgo+ID4g
VGhpcyBjb21taXQgZW5zdXJlcyB0aGF0IHRoZSBwaW5jdHJsIHN0YXRlIGlzIHNldCBpbiBhbGwg
Y2FzZXMuCj4KPiBTaG91bGRuJ3QgdGhlIHBpbiBzdGF0ZSBiZSByZXN0b3JlZCBieSB0aGUgcGlu
Y3RybCBsYXllcj8KCldoYXQgd2UgaGF2ZSBpbiB0aGUgZGV2aWNlIGNvcmUgb25seSBhcHBsaWVz
ICJpbml0IiBhbmQgImRlZmF1bHQiCnN0YXRlcywgYW5kIHByb3ZpZGVzIHRoZXNlIGhhbmRsZXMg
Zm9yIHRyYW5zaXRpb25pbmcgdG8gInNsZWVwIgphbmQgImRlZmF1bHQiIGFnYWluIChsaWtlIGEg
c3RhdGUgbWFjaGluZSkuCgpJIHdvdWxkIGxvdmUgdG8gaGFuZGxlIHRoaXMgaW4gdGhlIFBNIGNv
cmUsIGJ1dCBkZXZpY2VzIGFyZSBhCmJpdCBzZW5zaXRpdmUgdG8gd2hlcmUgdGhpcyBpcyBhcHBs
aWVkIHdydCBlLmcuIHNvbWUgcmVnaXN0ZXIKd3JpdGVzIHRoYXQgbmVlZCB0byBoYXBwZW4gYmVm
b3JlL2FmdGVyIHRoaXMgcGluIHRyYW5zaXRpb24gZXRjCnNvIGl0J3MgY2FsbGVkIGV4cGxpY2l0
bHkgbGlrZSB0aGlzIGZyb20gZWFjaCBkcml2ZXJzIHN1c3BlbmQoKQphbmQgcmVzdW1lKCkgaG9v
a3MuCgpTbyBGV0lXOgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5v
cmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
