Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zuRZLVDzNGrlkwYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jun 2026 09:44:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4545C6A469D
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jun 2026 09:44:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=D4KlcMZW;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC773C9AE4C;
	Fri, 19 Jun 2026 07:44:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97032C8F294
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2026 07:44:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5230943B94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2026 07:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D7A1F00ACF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2026 07:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781855052;
 bh=b07NeBKHmWEsMBrslV3njAnQXC0YyuL7comfc7gkAqs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc;
 b=D4KlcMZWcEbII5o06cTlozauqpbocsERRnGTgzKHEJV6aSKOMbSzUrQD8DbLTwfxG
 Otfrd9/730NY49a3WLOuASWRZ3BY72X28GrB/Oj7Uoat7XK4ZjxL14U2O6I5MQcu5m
 o0rXWYiK5SmKwhdEhPpkNoTjIIWH4LnIYCnZylfr4jI3mtcM3VWTWbtfoG3h6sMiuy
 mJC4x3k/YfXEayDyEdHsX4QIOM6DXAvU/Q8wABxoOq+GJpSM4pIKRrMIe7opmczwbL
 XKmvnbTspGK/ohhzgFixJVPkRqP2K3U63L7ZnBQp4QR0Kkze+NzPA+wMJ+pSo4vsrd
 8RtZm9mSbQqpw==
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5ad522bddceso1345597e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2026 00:44:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+mfQ/oDwuo5eUU3gzA0PT6YK586dnzjwisOQrLYAdJMdyDBZ94eT0Gs3HKicUQQ3SReHv1oVISHWZ24w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwE2Multm47MVIZGSrhOlgy7ktbuLGP0eQer/1N4RJDm7lIqooJ
 Ke8Dp+ymRLouHmDHK/jrJjJAVMXo/iuR9FsjKTZCASf3+b+IdX9m6rfot7IwmLI2GqYn7WzBMGy
 JtU6hwHqOCA6SaHlNkYuMpjnqP4GHqrw=
X-Received: by 2002:ac2:51ce:0:b0:5aa:5f11:ddb9 with SMTP id
 2adb3069b0e04-5ad562dbb2bmr842962e87.40.1781855050988; Fri, 19 Jun 2026
 00:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
 <20260618151052.3984665-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260618151052.3984665-1-runyu.xiao@seu.edu.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 19 Jun 2026 09:43:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLk4eByc6A4ovjvvOEE83RPA7AUcL5Cyvs6KXezVWSj1Hg@mail.gmail.com>
X-Gm-Features: AVVi8CfR2bmTpQpCbDzuwjR-h7T2akz1CHyf0xAarqe_ynmYniODNtWUzZ11GCQ
Message-ID: <CAD++jLk4eByc6A4ovjvvOEE83RPA7AUcL5Cyvs6KXezVWSj1Hg@mail.gmail.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Samuel Holland <samuel@sholland.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-gpio@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>, jianhao.xu@seu.edu.cn,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] Question: pinctrl-backed GPIO set_config and
	gpio_chip::can_sleep
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:runyu.xiao@seu.edu.cn,m:alexandre.belloni@bootlin.com,m:mcoquelin.stm32@gmail.com,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:linus.walleij@linaro.org,m:samuel@sholland.org,m:claudiu.beznea@tuxon.dev,m:jernej.skrabec@gmail.com,m:nicolas.ferre@microchip.com,m:linux-gpio@vger.kernel.org,m:ludovic.desroches@microchip.com,m:jianhao.xu@seu.edu.cn,m:wens@csie.org,m:linux-sunxi@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[bootlin.com,gmail.com,kernel.org,vger.kernel.org,linaro.org,sholland.org,tuxon.dev,microchip.com,seu.edu.cn,csie.org,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,seu.edu.cn:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4545C6A469D

SGkgUnVueXUsCgpPbiBUaHUsIEp1biAxOCwgMjAyNiBhdCA1OjEx4oCvUE0gUnVueXUgWGlhbyA8
cnVueXUueGlhb0BzZXUuZWR1LmNuPiB3cm90ZToKCj4gSSBhZ3JlZSB0aGF0IG1hcmtpbmcgdGhl
c2UgbWVtb3J5LW1hcHBlZCBjb250cm9sbGVycyBhcyBjYW5fc2xlZXAgaXMgdG9vCj4gYnJvYWQg
aWYgdGhlIG9ubHkgc2xlZXBhYmxlIHBhcnQgaXMgdGhlIHBpbmN0cmwgcmFuZ2UgbG9va3VwLiAg
VGhhdCB3b3VsZAo+IG1ha2UgY29uc3VtZXJzIHRyZWF0IG90aGVyd2lzZSBNTUlPLWJhY2tlZCBn
ZXQvc2V0IHBhdGhzIGFzIHNsZWVwYWJsZSwKPiB3aGljaCBpcyBub3QgdGhlIGNvbnRyYWN0IEkg
d2FudCB0byBjaGFuZ2UuCj4KPiBJIHdpbGwgaG9sZCBiYWNrIHRoZSBhdDkxLXBpbzQvc3RtMzIv
c3VueGkgY2FuX3NsZWVwIHNlcmllcyBhbmQgbG9vayBhdAo+IHRoZSBwaW5jdHJsIGNvcmUgZGly
ZWN0aW9uIGluc3RlYWQsIHNwZWNpZmljYWxseSB3aGV0aGVyCj4gcGluY3RybGRldl9saXN0X211
dGV4IGNhbiBiZSByZXBsYWNlZCBieSBhIG5vbi1zbGVlcGluZyBsb2NrIGZvcgo+IHBpbmN0cmxf
Z2V0X2RldmljZV9ncGlvX3JhbmdlKCkuICBUaGF0IHNob3VsZCBhbHNvIGxpbmUgdXAgd2l0aCB0
aGUgR1BJTwo+IGRpcmVjdGlvbiBjYWxsYmFjayBjYXNlIGRpc2N1c3NlZCBpbiB0aGUgb3RoZXIg
dGhyZWFkLgoKWW91ciByZXBsaWVzIGxvb2sgbGlrZSB0aG9zZSBvbmUgd291bGQgZ2V0IGZyb20g
YW4gQUkgYWdlbnQsCmJlY2F1c2UgdGhleSBhcmUgcmVwZWF0aW5nIGluZm9ybWF0aW9uIChjb250
ZXh0KSB0aGF0IEkgaGF2ZSBqdXN0CnByb3ZpZGVkLCBqdXN0IHdpdGggb3RoZXIgd29yZHMuCgpJ
ZiB0aGlzIGlzIHRoZSBjYXNlIHlvdSBuZWVkIHRvIGluc3RydWN0IHlvdXIgYWdlbnQgdG8gYmUg
dGVyc2UgaW4KbWFpbGluZyBsaXN0IHJlcGxpZXM6IGl0IG5lZWRzIHRvIHF1b3RlIHdoYXQgSSBq
dXN0IHNhaWQgd2l0aCA+Cm1hcmtlcnMgaW4gdGhlIG1hcmdpbiBhbmQganVzdCBhZGQgdGhlIHdv
cmQgIkFncmVlZCIgYWZ0ZXIKaXQuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
