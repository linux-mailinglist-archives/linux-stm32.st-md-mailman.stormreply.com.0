Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFl1AskGcWmPcQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 18:03:05 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E975A45C
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 18:03:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55B50C349C4;
	Wed, 21 Jan 2026 17:03:04 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B74B1C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 17:03:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6131643E97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 17:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C497C2BC9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 17:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769014981;
 bh=pa8aWCTcpI5fQV8rx/plmPidwgBTTPF3cpoGqJ3CbM8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mXbsNauiA8DEehouSx0bo1tQQZObz1DX6hvdtnpcVFOgycqXsZVdgkiON+MmgQlx+
 Pf+71tP3kA81oTJ74sFcGl2OBUsDCKc2Nh+dv0am40ivp34QijdI3hh+fJcszE9gSB
 NkX4DiADcoq/Mz1eeqyEl8wJcg2PpOA1EwFAOdqM/lnsJ3Ml3g6IgSo2oCm+wpiwmW
 jhE4CY4zS01OGoeO5Haj/E0I8mMBVZQ8wQRhFXAim9HX26rqdgbn5KOevD+g07dYTG
 /j/hW/PJWnNPU4Wb4MyzfdeakmPcMTxhwxTs5KzoZocEC3f1SmmWVlFLsSesR43RIR
 9tQs7MRpPhihA==
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b87677a8abeso1840466b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 09:03:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVP9imMtwNsInyH/uWpHtFEIQKJ/1RknKkqEMCa8PnC2KGm3vaT/2ioQEgdhZSHK3rMvPJG++8TelnrGw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwERqHpYLZD5RC2AXicjRRWOOEs6yBcBq6bgVLAYGoEM2bSNuAF
 Y38UKq/EHo/iS1e6SDRSTGY7O3sz02ZkSBCpIeXoML1YeF5N7qiQF8xTxpTnrvV/mwvspes8UDh
 xz+yWB+j0yLkukR1Y2m1LPF+SjUgWMg==
X-Received: by 2002:a17:907:a05:b0:b87:1b62:13ae with SMTP id
 a640c23a62f3a-b87932b8e26mr1653806366b.61.1769014979483; Wed, 21 Jan 2026
 09:02:59 -0800 (PST)
MIME-Version: 1.0
References: <20260121085347.10368-1-marex@nabladev.com>
 <176901406635.3440858.3601461880570246394.robh@kernel.org>
In-Reply-To: <176901406635.3440858.3601461880570246394.robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Jan 2026 11:02:47 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+v3W2bVCUbYtMZMyvkdP7LGrn4vzca_PFHkwgQptJ6rQ@mail.gmail.com>
X-Gm-Features: AZwV_Qix7oj-Of4DdoJ2Jzyev08ewbS4IgrrQfV85apQDNnlZrqyfeVPrtD3VKk
Message-ID: <CAL_Jsq+v3W2bVCUbYtMZMyvkdP7LGrn4vzca_PFHkwgQptJ6rQ@mail.gmail.com>
To: Marek Vasut <marex@nabladev.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: eeprom: at25: Document
	Microchip 25AA010A
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
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:cniedermaier@dh-electronics.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-kernel@vger.kernel.org,m:kernel@dh-electronics.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:rgallaispou@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[dh-electronics.com,vger.kernel.org,kernel.org,linaro.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: A2E975A45C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBKYW4gMjEsIDIwMjYgYXQgMTA6NDjigK9BTSBSb2IgSGVycmluZyAoQXJtKSA8cm9i
aEBrZXJuZWwub3JnPiB3cm90ZToKPgo+Cj4gT24gV2VkLCAyMSBKYW4gMjAyNiAwOTo1MzoxOSAr
MDEwMCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gPiBUaGUgTWljcm9jaGlwIDI1QUEwMTBBIGlzIGEg
MSBLYml0IFNQSSBFRVBST00gd2l0aCAxNiBCeXRlIHBhZ2UuCj4gPiBQcm9kdWN0IHBhZ2UgaXMg
YXQgaHR0cHM6Ly93d3cubWljcm9jaGlwLmNvbS9lbi11cy9wcm9kdWN0LzI1QUEwMTBBCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QG5hYmxhZGV2LmNvbT4KPiA+IC0t
LQo+ID4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+
Cj4gPiBDYzogQW1lbGllIERlbGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4g
PiBDYzogQ2hyaXN0b3BoIE5pZWRlcm1haWVyIDxjbmllZGVybWFpZXJAZGgtZWxlY3Ryb25pY3Mu
Y29tPgo+ID4gQ2M6IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4KPiA+IENjOiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+Cj4gPiBDYzogTWF4aW1lIENv
cXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+ID4gQ2M6IE5laWwgQXJtc3Ryb25n
IDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+ID4gQ2M6IFJhcGhhZWwgR2FsbGFpcy1Qb3Ug
PHJnYWxsYWlzcG91QGdtYWlsLmNvbT4KPiA+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgo+ID4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCj4gPiBDYzoga2VybmVsQGRo
LWVsZWN0cm9uaWNzLmNvbQo+ID4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiA+IENjOiBsaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4gPiAtLS0KPiA+ICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZWVwcm9tL2F0MjUueWFtbCB8IDEgKwo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPgo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyAo
QXJtKSA8cm9iaEBrZXJuZWwub3JnPgoKQWN0dWFsbHksIEkgYXBwbGllZCB0aGlzIG9uZSB0b28u
CgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
