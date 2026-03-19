Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAnqIZEavGlEsQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 16:47:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 260EE2CDF47
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 16:47:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD806C87ED2;
	Thu, 19 Mar 2026 15:47:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA8C5C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 15:47:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A3B3640513
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 15:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8510EC19424
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773935245;
 bh=sn6G42C6ms/Cda1VII3wEKGhH41j/ZPchSciY2v4JFk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tS/NlSKvAa7qYSbyogmwp7UKQP+DhxdUI2KmdFzwlwG/50YDtxyd4qUHAySbGfb1a
 cissTZ98fHnVSdmJb2zXqt3iOR8TVBx2DOjhuJLjIzsfdDEr2yEjs0FStxkuYg9ijM
 ATjqKiPLwrW/uenVCRVeZfx+vSLX4gvJKCEEb7saWn5ywwmi6KRbW65EluzfjGgJTQ
 iENopa1kYS2KQ7WAdGM+rcf9wgbGS4szwgTt1P/mu0jKJsBfaS/jnrWgmNUsuWve7d
 YyacUmGsRUFcgd4PyqJGwvKxCQBB6KV2FC3DkuZPuQC9ll2ucn3b6fsIeOLh3BEnL+
 wB3ny/8yrq45w==
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-79853c0f5b9so11207587b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 08:47:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWkcH2psv8aKSQ20cjbdAp+v6eRJTE8AS3Rju4X8ek/O7R3CCfB7vQWVCwxLHsF8WicY04SAXqPeKaDGg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyYY1eis0pqPNjRkErQ7nDYKp8ONASmszjayCo/AiIMEiiSi+FR
 snO1sfPMBmmKQkQz5BsguMXo2NeU+gVN9+ZCAot7A4npe6SyQk8Bg2uXY8LHryJUEIYxn1tHLQE
 /+a6exhi8VDd2/GLX/DDhQ7JXXXBtxGw=
X-Received: by 2002:a05:690c:698a:b0:79a:2ea7:36b7 with SMTP id
 00721157ae682-79a71c5eac1mr75575047b3.51.1773935244913; Thu, 19 Mar 2026
 08:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-pinctrl_stm32_hdp_fix_dep-v1-1-3a6f6f02eb3e@foss.st.com>
In-Reply-To: <20260317-pinctrl_stm32_hdp_fix_dep-v1-1-3a6f6f02eb3e@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 16:47:13 +0100
X-Gmail-Original-Message-ID: <CAD++jL=pnQZ0JGCGcQ+onSNSoyDRGZNbF+Xb6fc4SRVCb0EMyw@mail.gmail.com>
X-Gm-Features: AaiRm53Xw7sQVazNFteoei5Van2VALJ94JUtdNLzjJjiUVYFFb7707DGpRAOz0A
Message-ID: <CAD++jL=pnQZ0JGCGcQ+onSNSoyDRGZNbF+Xb6fc4SRVCb0EMyw@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: fix HDP driver dependency
	on GPIO_GENERIC
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
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amelie.delaunay@foss.st.com,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:legoffic.clement@gmail.com,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	NEURAL_SPAM(0.00)[0.668];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st.com:email]
X-Rspamd-Queue-Id: 260EE2CDF47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMTcsIDIwMjYgYXQgMTE6MDfigK9BTSBBbWVsaWUgRGVsYXVuYXkKPGFtZWxp
ZS5kZWxhdW5heUBmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFRoZSBIRFAgZHJpdmVyIHVzZXMgdGhl
IGdlbmVyaWMgR1BJTyBjaGlwIEFQSSwgYnV0IHRoaXMgY29uZmlndXJhdGlvbgo+IG1heSBub3Qg
YmUgZW5hYmxlZC4KPiBFbnN1cmUgaXQgaXMgZW5hYmxlZCBieSBzZWxlY3RpbmcgdGhlIGFwcHJv
cHJpYXRlIG9wdGlvbi4KPgo+IEZpeGVzOiA0YmNmZjljMDViOWQgKCJwaW5jdHJsOiBzdG0zMjog
dXNlIG5ldyBnZW5lcmljIEdQSU8gY2hpcCBBUEkiKQo+IFNpZ25lZC1vZmYtYnk6IEFtZWxpZSBE
ZWxhdW5heSA8YW1lbGllLmRlbGF1bmF5QGZvc3Muc3QuY29tPgoKUGF0Y2ggYXBwbGllZCBmb3Ig
Zml4ZXMuIFRoaXMgc2hvdWxkIGhhdmUgYmVlbiB0aGVyZSBhbGwgdGhlIHRpbWUKYW5kIG5vdCBz
cGVjaWZpY2FsbHkgcmVsYXRlZCB0byB0aGUgSERQIGFzIGZhciBhcyBJIGNhbiB0ZWxsLgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
