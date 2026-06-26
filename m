Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZKBvG8kFP2r+OAkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Jun 2026 01:05:45 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F6E6D079E
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Jun 2026 01:05:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=nYxRBYz2;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 791D3C597BF;
	Fri, 26 Jun 2026 23:05:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0C8FC424DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2026 23:05:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4F4AC43F16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2026 23:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206151F00ACF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2026 23:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782515141;
 bh=CASER/cI9b9IcBcUdv5RWilxLQkJ9A/bPWjit9BYmok=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc;
 b=nYxRBYz2anD9ShSO7oDshQQwChbWmVCxYdnfHnb7G+x2PQRXsCtDBY/C5wQLtSE13
 FwdnJsi5Fqa2Y6+NvysaWxqd6DcCjALSXRG4+PX9zB7esE/PPWF0VMr0Kp+708WaWm
 N7O2IeV1w0VWvVSKAsqnwQZ4Gn/6klIm7+geKLdX+l+WF9hYcg2GfCRNabW5kYqixZ
 sG8fkavFkE34hnnrUkwNf9G26Z+mdMRBLwiA1yykwqjo3B2ecBrAS6AykTlD4iHJ1q
 MrElwu+8qgZBQj0FAtfpwsT4kglvPaWgKD/aBbjRgd0tc2fTuyZJPbMFV3fnB6w7+x
 DYIa0Th8oKcxA==
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5aea0fff535so1424632e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2026 16:05:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RqhzwOb5384iOHo7UjB1iE7qLtg0Zkt3VfL37mLvm8XiGhIuBgoXuk52NPMC/8s9I1vfpR8vneVHtyKGQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwKaOQqZbT9aJLs1TJcbdvcXMHRay/ksZZsOnuWdb9DeuNRgR1n
 wcdkpa7ktXDhpqmLhlWO9ZfFKHINKqKKOyRDcR4Ajd7bm/3uMCCVt7EzQanP7TafTchq/4y/HGi
 Y7ExtY+fW+Srm3XERqSbMbnYRms4+NHs=
X-Received: by 2002:a05:6512:2c05:b0:5ae:a9ec:bb38 with SMTP id
 2adb3069b0e04-5aea9ecbc48mr295117e87.64.1782515139887; Fri, 26 Jun 2026
 16:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260626183140.3499179-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260626183140.3499179-1-Frank.Li@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 27 Jun 2026 01:05:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLks=LP73virVRs+9pF76R9qv0Ccgq7k7YUbptN4gHt8Lw@mail.gmail.com>
X-Gm-Features: AVVi8CcD2cFZ0DbaMYH43Hl9zilL9SByXS-2f9JIaqrnE4P2JDWL4l6YJSprn1k
Message-ID: <CAD++jLks=LP73virVRs+9pF76R9qv0Ccgq7k7YUbptN4gHt8Lw@mail.gmail.com>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Lee Jones <lee@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, open list <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] dt-bindings: mfd: st,
	stmpe: document st, stmpe610 compatible
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:lee@kernel.org,m:Frank.Li@nxp.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,nxp.com,gmail.com,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
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
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nxp.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7F6E6D079E

SGkgRnJhbmssCgp0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpPbiBGcmksIEp1biAyNiwgMjAyNiBh
dCA4OjMx4oCvUE0gPEZyYW5rLkxpQG9zcy5ueHAuY29tPiB3cm90ZToKCj4gRnJvbTogRnJhbmsg
TGkgPEZyYW5rLkxpQG54cC5jb20+Cj4KPiBUaGUgU1RNUEU2MTAgaGFzIGxvbmcgYmVlbiBzdXBw
b3J0ZWQgYnkgdGhlIFNUTVBFIEkyQyBNRkQgZHJpdmVyLCBidXQgaXRzCj4gY29tcGF0aWJsZSBz
dHJpbmcgd2FzIG5ldmVyIGRvY3VtZW50ZWQuCj4KPiBBZGQgdGhlIG1pc3Npbmcgc3Qsc3RtcGU2
MTAgY29tcGF0aWJsZSBzdHJpbmcgdG8gZml4IGJlbG93IENIRUNLX0RUQlMKPiB3YXJuaW5nczoK
PiAgIGlteDUzLW01M2V2ay5kdGI6IC9zb2MvYnVzQDYwMDAwMDAwL2kyY0A2M2ZjNDAwMC90b3Vj
aHNjcmVlbkA0MTogZmFpbGVkIHRvIG1hdGNoIGFueSBzY2hlbWEgd2l0aCBjb21wYXRpYmxlOiBb
J3N0LHN0bXBlNjEwJ10KPgo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAu
Y29tPgooLi4uKQoKPiAgICBjb21wYXRpYmxlOgo+ICAgICAgZW51bToKPiAgICAgICAgLSBzdCxz
dG1wZTYwMQo+ICsgICAgICAtIHN0LHN0bXBlNjEwCgpUaGVyZSBpcyBubyBTVE1QRTYwMS4KCkl0
J3MgYSBtaXMtc3BlbGxlZCBTVE1QRTYxMCwgc28gcGxlYXNlIGRlbGV0ZSB0aGUgcm93IGFib3Zl
IGFuZAplZGl0IHRoZSBjb21taXR0IG1lc3NhZ2UgYWNjb3JkaW5nbHkuCgpZb3VycywKTGludXMg
V2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
