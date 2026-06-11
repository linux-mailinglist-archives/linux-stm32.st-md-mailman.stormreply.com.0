Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xJNNDOd1KmrLpgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:46:31 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B5E66FFC8
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 10:46:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=nFQEdgRH;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 640D4C424DE;
	Thu, 11 Jun 2026 08:46:30 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC4FAC424DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 08:46:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BE5D36001D;
 Thu, 11 Jun 2026 08:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4AC41F00893;
 Thu, 11 Jun 2026 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781167587;
 bh=2IIKlhb3svN4EPd89ooG0cnVxCK3GU+JlZ80wFVg5BE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date;
 b=nFQEdgRHCPlaDppgNORMWkZO4wA854yfVwzCTMLEFdNqjtJ7ksYrCCAthGYjPQiGp
 rpX+y/d8juuDwYat3Rij5nuou/Hbl11diPdFieep+eOn2PNZ2g1rHbJVjnGcKpikwD
 WyEIv1xUzV0tMHKYIyjEc/T6zO8Z5tSi5tfLRUwMiOhHfXxGl8zQCEh+UFeXkoxh76
 XNjctmygrPSqtLV9asIrsf0LWuquijaxdu9zAnPg3drK5DTTasjx2Ec4H3OC0bBbQE
 O0u0wfmfYHMdgxILcA5T3LIglS18amCXgz5SlG5vc25S7WTzNfMw7JEEl6OJpin3ko
 64l/KQLzvkx0Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, ukleinek@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, linusw@kernel.org, 
 Manish Baing <manishbaing2789@gmail.com>
In-Reply-To: <20260523173251.72540-2-manishbaing2789@gmail.com>
References: <20260523173251.72540-2-manishbaing2789@gmail.com>
Message-Id: <178116758438.933112.378885249487702601.b4-ty@b4>
Date: Thu, 11 Jun 2026 09:46:24 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev-ad80c
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v4 1/2] dt-bindings: mfd: st,
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:ukleinek@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linusw@kernel.org,m:manishbaing2789@gmail.com,m:linux-pwm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor.dooley@microchip.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3B5E66FFC8

T24gU2F0LCAyMyBNYXkgMjAyNiAxNzozMjo1MCArMDAwMCwgTWFuaXNoIEJhaW5nIHdyb3RlOgo+
IFRoZSBzdCxzdG1wZS1wd20gYmluZGluZyBpcyBhbHJlYWR5IGNvdmVyZWQgYnkgdGhlIE1GRCBz
Y2hlbWEgaW4KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bXBl
LnlhbWwuIEhvd2V2ZXIsIHRoZQo+IFBXTSBzdWJub2RlIHdhcyBtaXNzaW5nIGEgJ3JlcXVpcmVk
JyBwcm9wZXJ0aWVzIGJsb2NrLiBUaGlzIGFsbG93ZWQKPiBEZXZpY2UgVHJlZSBub2RlcyB0byBw
YXNzIHZhbGlkYXRpb24gZXZlbiBpZiB0aGUgJ2NvbXBhdGlibGUnCj4gc3RyaW5nIHdhcyBvbWl0
dGVkLiBUaGlzIG9taXNzaW9uIGNvdWxkIGxlYWQgdG8gcHJvYmUgZmFpbHVyZXMKPiBhdCBydW50
aW1lLgo+IAo+IFsuLi5dCgpBcHBsaWVkLCB0aGFua3MhCgpbMS8yXSBkdC1iaW5kaW5nczogbWZk
OiBzdCxzdG1wZTogQWRkIG1pc3NpbmcgcHJvcGVydGllcyBmb3IgUFdNIHN1Ym5vZGUKICAgICAg
Y29tbWl0OiBiMDdmNzkwNGUwNTIzMTcwODU2ODc2ZTQ0MTJiZTg1MjM3N2Q0OTJhCgotLQpMZWUg
Sm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
