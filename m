Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLyEDiUaF2ov4gcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2026 18:21:57 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C441F5E7AC0
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2026 18:21:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 737C4C8F290;
	Wed, 27 May 2026 16:21:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5B4DC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 16:21:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 85D1F444E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 16:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60CCF1F0155C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 16:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779898913;
 bh=zc/BrRX6BDzOZ1YxVqm6B33Dd86tu453/aG5x7by2Ek=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc;
 b=P41/TPXzjKCimocX2l+68xKVYLMQD2YFpgRnY8N95Jn9yNOi1yXTdaams4CJab49O
 bX2ZaZys0qJ+rca4L6XTxpTwg2SW1F51yFoZOHDInvjFUOAaS2KPfgFRA1UvoLQgVX
 On6byVttJQ3khgpcDI5UnvlOIls7rPsFiOc821kso1A1SJ+Wl0pHSqBjaVtn4Wl3tl
 g8ySCprcy41UoQjBQYm0+IEky/9tU0P/cALgnmFxvT1zYK927Dk9PGxRd/B1Gt0W/n
 zSn35gq7XfCyNMBEBmJOyVU1WPljsJ8qfpisHiRIHdJ0c+cLfQAGBnQgty7dyXDTwX
 RUaLFUHeSe3jQ==
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5a858881ad2so14788500e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 09:21:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ8gMXhKbyCGGbmlJr0fP7ERb1mEGMlTbQj4LIFn5jadjDj9pKKp4AKCWA1DIsCWULBoJUM0TXcerucCFw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxwbtk1AOtkck79Vbx62Mv7xJnX9zCsjv7WSHSCr1eMcskEvBUQ
 9VT0Ada6uBM1F4tDRsiySG58fjGXQyQQMrltNaI+qPmqQuTeCHu5ZQTgJVezjFrbVyA5uudDSI7
 0sECfumyG1+xmijVT955fvE+RrXgpqog=
X-Received: by 2002:a05:6512:2201:b0:5a8:86a6:c476 with SMTP id
 2adb3069b0e04-5aa323843dcmr6639602e87.37.1779898912083; Wed, 27 May 2026
 09:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260523173251.72540-1-manishbaing2789@gmail.com>
 <20260523173251.72540-2-manishbaing2789@gmail.com>
In-Reply-To: <20260523173251.72540-2-manishbaing2789@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 18:21:39 +0200
X-Gmail-Original-Message-ID: <CAD++jL=5GoXqgRCmH=f1btY3eToi3_wMBJEarohJuZhyKxowJg@mail.gmail.com>
X-Gm-Features: AVHnY4JfnnRkXYHTThwWUKLSwG3QzP6v1BK1Sk1xyc9ylqzeUPifpk0-WhZKh-8
Message-ID: <CAD++jL=5GoXqgRCmH=f1btY3eToi3_wMBJEarohJuZhyKxowJg@mail.gmail.com>
To: Manish Baing <manishbaing2789@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-pwm@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, lee@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ukleinek@kernel.org,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: mfd: st,
 stmpe: Add missing properties for PWM subnode
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
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manishbaing2789@gmail.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-pwm@vger.kernel.org,m:conor.dooley@microchip.com,m:lee@kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:ukleinek@kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,microchip.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	NEURAL_SPAM(0.00)[0.669];
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
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,microchip.com:email]
X-Rspamd-Queue-Id: C441F5E7AC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU2F0LCBNYXkgMjMsIDIwMjYgYXQgNzozM+KAr1BNIE1hbmlzaCBCYWluZyA8bWFuaXNoYmFp
bmcyNzg5QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IFRoZSBzdCxzdG1wZS1wd20gYmluZGluZyBpcyBh
bHJlYWR5IGNvdmVyZWQgYnkgdGhlIE1GRCBzY2hlbWEgaW4KPiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bXBlLnlhbWwuIEhvd2V2ZXIsIHRoZQo+IFBXTSBzdWJu
b2RlIHdhcyBtaXNzaW5nIGEgJ3JlcXVpcmVkJyBwcm9wZXJ0aWVzIGJsb2NrLiBUaGlzIGFsbG93
ZWQKPiBEZXZpY2UgVHJlZSBub2RlcyB0byBwYXNzIHZhbGlkYXRpb24gZXZlbiBpZiB0aGUgJ2Nv
bXBhdGlibGUnCj4gc3RyaW5nIHdhcyBvbWl0dGVkLiBUaGlzIG9taXNzaW9uIGNvdWxkIGxlYWQg
dG8gcHJvYmUgZmFpbHVyZXMKPiBhdCBydW50aW1lLgo+Cj4gRml4IHRoZSBzY2hlbWEgYnkgYWRk
aW5nIHRoZSBtaXNzaW5nICdyZXF1aXJlZCcgYmxvY2suCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYW5p
c2ggQmFpbmcgPG1hbmlzaGJhaW5nMjc4OUBnbWFpbC5jb20+Cj4gQWNrZWQtYnk6IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gQWNrZWQtYnk6IFV3ZSBLbGVpbmUt
S8O2bmlnIDx1a2xlaW5la0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzd0BrZXJuZWwub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
