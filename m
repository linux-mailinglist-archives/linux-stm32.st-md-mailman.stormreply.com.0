Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U8inNHk5RGolqwoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 23:47:37 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC666E8356
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 23:47:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Y9NGkgHZ;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11977C6C858;
	Tue, 30 Jun 2026 21:47:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33BA0C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 21:47:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id EDFB543E66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 21:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19F51F00A3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 21:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782856053;
 bh=2JxJYxohjUwYJZXlwl2tLOoasJsXfNDAaAFi3yYBE98=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc;
 b=Y9NGkgHZLpaRaQ/GYEiL6lK3CAMGUofQgj6W749BCmhAJwGfv7PfPOzT0Lrhf9wjJ
 odK6K1HXY8GRgj9N0Sr7mmgq0f3iFRok76msFEnfPsxjMEo6RZQEViSTYAL6veHifz
 xuSoGxrVGpPRx6LldqQUky3tXsZaFP6sjDlLALL6dYen6EzJbGI/TBQ76DExATBq2Y
 7m+anBtqBIyk8bXp9kkzI+Ybu4R2I20wbiThaT9wIbS4UgPlRNGZ5mPo11lNsHIa7n
 necjaN5baTVa1Ncu9tnTWyy6NvA/XMLVvhyBTV4bELdcdzANXN5pT/+kamfV54zJHE
 wz7eCnP1bsnlw==
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5aeb8c19017so3262565e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 14:47:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RrGhmEXKayN/e4xWDRbIpbwgJDjbCyQb+a85me6BhTuGPpoCDzSgXKZtdDAtBHPoDTzexh9f8QDfbz/Hg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzHZu9AwehmKsi0TzFz2vkUdliQimGDsJg5fWdXWwxodtqIu0zP
 K3dAgHQ66dlIGLIF9HuU3I4Kg9Y5YVXqGmkVnhW4spA6L0VtBnL8z3YzwbpW38LVpiPQYIywqSc
 XCvwbYXWsBKSbfen+v0+tGHhn83hb43s=
X-Received: by 2002:a05:6512:3349:b0:5ae:b24c:7723 with SMTP id
 2adb3069b0e04-5aebdb8affamr1374084e87.17.1782856052738; Tue, 30 Jun 2026
 14:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260629223735.2559722-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260629223735.2559722-1-Frank.Li@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 23:47:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLmx7sJCsxMOp63OfHzBHL8Ps7i7PAQK=6ebx-e05rzcgA@mail.gmail.com>
X-Gm-Features: AVVi8CfiTow26248TidhGIW7dw9G825VZt5ZIC_cLTjC4s5J8jEFZkDnZkIzjiU
Message-ID: <CAD++jLmx7sJCsxMOp63OfHzBHL8Ps7i7PAQK=6ebx-e05rzcgA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 1/1] dt-bindings: mfd: st,
 stmpe: fix typo st, stmpe601 (should be st, stmpe610)
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nxp.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5EC666E8356

T24gVHVlLCBKdW4gMzAsIDIwMjYgYXQgMTI6MzfigK9BTSA8RnJhbmsuTGlAb3NzLm54cC5jb20+
IHdyb3RlOgoKPiBGcm9tOiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KPgo+IFRoZSBjb21w
YXRpYmxlIHN0cmluZyAic3Qsc3RtcGU2MDEiIGlzIGEgdHlwbyBhbmQgZG9lcyBub3QgY29ycmVz
cG9uZCB0bwo+IGFueSBleGlzdGluZyBTVE1QRSBkZXZpY2UgaW4gZWl0aGVyIHRoZSBkcml2ZXIg
b3IgRFRTIGZpbGVzLiBUaGUgY29ycmVjdAo+IGNvbXBhdGlibGUgc3RyaW5nIGlzICJzdCxzdG1w
ZTYxMCIuCj4KPiBGaXggdGhlIHR5cG8gdG8gZW5zdXJlIHByb3BlciBzY2hlbWEgbWF0Y2hpbmcg
YW5kIGVsaW1pbmF0ZSB0aGUKPiBmb2xsb3dpbmcgQ0hFQ0tfRFRCUyB3YXJuaW5nOgo+ICAgaW14
NTMtbTUzZXZrLmR0YjogL3NvYy9idXNANjAwMDAwMDAvaTJjQDYzZmM0MDAwL3RvdWNoc2NyZWVu
QDQxOiBmYWlsZWQgdG8gbWF0Y2ggYW55IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnc3Qsc3Rt
cGU2MTAnXQo+Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+CgpG
aXhlczogZTEwMDM4Y2UxYmE5ICgiZHQtYmluZGluZ3M6IG1mZDogQ29udmVydCBTVE1QRSB0byBZ
QU1MIHNjaGVtYSIpCgpXaXRoIHRoYXQgYWRkZWQ6ClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51c3dAa2VybmVsLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
