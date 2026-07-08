Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ygtbI8nYTmpTVQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 01:10:01 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0863C72B0BE
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 01:10:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="ZqLGG/La";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5A24C57B78;
	Wed,  8 Jul 2026 23:10:00 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9A30C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 23:09:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 845BB43E0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 23:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6961F1F00AC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 23:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783552198;
 bh=LR60eLgUfNNIz6B0v46FKwzAtiy9XGoPTayqxcAz4UQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc;
 b=ZqLGG/LaE2yyMqM5XS0hIvwyGP4VAC2nYijzaQlQfIaDqC4xDUQr93yEZe96t90jy
 VymKJ+2dNoXJ0R90xBkWS3du9UT3kY79XAn6bzUKknfEpUTxnHM6QE7X2l+BB0xYbo
 cwLCu/lnPGJjQS3pil9w7fjr6vJN/rv+nWiHl6vwGXiVOcVBJ0Sg0UuLfA7DpObG8X
 3dtK6Nb/81VPz7HN1L7VIbbeezTa9yQCWAGc/Bb0heQOcjAxtvPDGvlr4CsC+tQDDf
 XQ9VtCE1WQQ5Sx8FsNYcHIPYNyyrcoAuBxDyDOZ8Y0d+4eXb8TBqQwXlD7MHuq2KVY
 /XVaqMZw9G9iw==
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5aec139da7eso380536e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Jul 2026 16:09:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RrVYnNZ9L3zqzhGi7B27c9PbFPfV+fzj29CuMK96jOxpZVBFsfDu5A48jNWRPTjSDamUUgQDtkA0MDaeg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz2kGV+EVigWelSa/c8Qho6X1lcKv4V5j5rNy/cq3oBnNnLLOAT
 rU1+SUuefvqm3kare22bEwJ0F8+jNrSAMa3QTlQtUj+clKJIgWI90QCV60D0HJzZm4fai+G/r0h
 8L1Z+khniprE9FijMnwY8YTaaIxvrKR0=
X-Received: by 2002:ac2:4f08:0:b0:5ae:b5d7:7844 with SMTP id
 2adb3069b0e04-5b016d1b33fmr49718e87.5.1783552197150; Wed, 08 Jul 2026
 16:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
In-Reply-To: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 01:09:43 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tBRFXzqa6gXNnZ3-DRUMvs=waSdDvq5h5MPHAQoheqw@mail.gmail.com>
X-Gm-Features: AUfX_mwW-7N7MmlP00AndlWeAaBl8FEBrFYJNUhifSWGKsGcvxauySd-Uj-hISw
Message-ID: <CAD++jL=tBRFXzqa6gXNnZ3-DRUMvs=waSdDvq5h5MPHAQoheqw@mail.gmail.com>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Lee Jones <lee@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] ARM: dts: imx: cleanup st,
 stmpe touch screen related CHECK_DTB warings
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:kernel@pengutronix.de,m:devicetree@vger.kernel.org,m:s.hauer@pengutronix.de,m:lee@kernel.org,m:Frank.Li@nxp.com,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,vger.kernel.org,nxp.com,lists.linux.dev,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0863C72B0BE

T24gV2VkLCBKdWwgOCwgMjAyNiBhdCA5OjQ54oCvUE0gPEZyYW5rLkxpQG9zcy5ueHAuY29tPiB3
cm90ZToKCj4gY2xlYW51cCBzdCxzdG1wZSB0b3VjaCBzY3JlZW4gcmVsYXRlZCBDSEVDS19EVEIg
d2FyaW5ncy4KPgo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgo+
IC0tLQo+IEZyYW5rIExpICgzKToKPiAgICAgICBkdC1iaW5kaW5nczogbWZkOiBzdCxzdG1wZTog
YWRkIGRlcHJlY2F0ZWQgcHJvcGVydGllcwo+ICAgICAgIGR0LWJpbmRpbmdzOiBtZmQ6IHN0LHN0
bXBlOiBsZXQgaW50ZXJydXB0IHByb3BlcnR5IG9wdGlvbmFsCj4gICAgICAgQVJNOiBkdHM6IGlt
eDogcmVtb3ZlIHVuZG9jdW1lbnQgcHJvcGVydGllcyBvZiBzdCxzdG1wZSoKClRob3NlIGxvb2sg
T0sgSSB0aGluazoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3Jn
PgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
