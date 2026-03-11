Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAV/Ouk1sWm0rwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 10:29:13 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F10D2607B1
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 10:29:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EF2FC8F288;
	Wed, 11 Mar 2026 09:29:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EC60C8F26C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 09:29:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 61DCD443DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 09:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408B0C2BCB4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 09:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773221351;
 bh=ZLpTE+Y/R0Tdv9vswPnMcKu+W093lttl1jCB5Rb2dPo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=F0UoSS6HeTeib+b99NgLUia+OyIhq3d974Aaz/MUtDwtuUEhhCks7o29mfOMjAVKX
 g4uzGajiuIujzHTAQG2mA2a756hkcje6PBx9L7ejmnbdBtG24PCHfWqqllyFhml1ef
 r7UmSxCrN/ZzCnAyj7mOocSqVm4PRXRyR9zHiUaHi1iTuO2rD3QxaNEs6dH5wMcLSx
 j5fJu2sglWpDCXdVDVnd/6YktG/5jvPa4Iu+duoFPHRIcI9VQ18cdOSO/fFER+sa11
 awiguuyqGhaomMJgXyyy/vixRpx+Z9ONK1cEEOXXE5oNJKJ/3T9+FwBV/RmSJjo2Jg
 ex8YQGMIDgbgQ==
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-64ca4dfdd88so13620983d50.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 02:29:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUmB8XR1751q4CE/LlVVbhACWhvKaqYvBdh7Q9biCgL2tfGOzc8UY/hmLVbrmUEW7LQVnE2dcs2SHkQ5A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyuAJWASyx7CmD6KJK5bP3xSXaWXmFVQ75tHkBw3dEOqStq5w32
 vFJTjwHa9hR3nMszL8Cgjp+iHwl2e9U+AN1DnjDesUqng9GwAqTlBGqmnoHgjqnyudnxCO69weU
 2PnXxIpTVRBi2FZYegqzOC/Mn07b8JPM=
X-Received: by 2002:a53:c751:0:b0:64a:d479:bfbd with SMTP id
 956f58d0204a3-64d6568df17mr1064855d50.7.1773221350597; Wed, 11 Mar 2026
 02:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
 <ed019efc-d1e0-4e77-bf9c-79da40f0c707@foss.st.com>
In-Reply-To: <ed019efc-d1e0-4e77-bf9c-79da40f0c707@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 10:28:59 +0100
X-Gmail-Original-Message-ID: <CAD++jLkkVcRrT=NRyFD6s9=MYaOQSWun0v4z3z01BZoQ2tTvDA@mail.gmail.com>
X-Gm-Features: AaiRm52uciv83L8ui1qjVsq1iiproIcpV5iHuMJHrm82sToGHhfR4T4DzXQs8RY
Message-ID: <CAD++jLkkVcRrT=NRyFD6s9=MYaOQSWun0v4z3z01BZoQ2tTvDA@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 cristian.marussi@arm.com, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Clark <james.clark@linaro.org>, Sudeep Holla <sudeep.holla@kernel.org>,
 linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 Leo Yan <leo.yan@linux.dev>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, jens.wiklander@linaro.org
Subject: Re: [Linux-stm32] [PATCH v6 00/12] bus: add stm32 debug bus and
 coresight support for stm32mp1x platforms
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
X-Rspamd-Queue-Id: 8F10D2607B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.torgue@foss.st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:cristian.marussi@arm.com,m:coresight@lists.linaro.org,m:mike.leach@linaro.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:suzuki.poulose@arm.com,m:james.clark@linaro.org,m:sudeep.holla@kernel.org,m:linux-gpio@vger.kernel.org,m:legoffic.clement@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:mathieu.poirier@linaro.org,m:linux-kernel@vger.kernel.org,m:leo.yan@linux.dev,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:jens.wiklander@linaro.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[st-md-mailman.stormreply.com,kernel.org,arm.com,lists.linaro.org,linaro.org,vger.kernel.org,gmail.com,lists.infradead.org,linux.dev];
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
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

T24gVHVlLCBNYXIgMTAsIDIwMjYgYXQgMTA6MDfigK9BTSBBbGV4YW5kcmUgVE9SR1VFCjxhbGV4
YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPiB3cm90ZToKCj4gUGF0Y2ggMSB0byAxMSBhcHBsaWVk
IG9uIHN0bTMyLW5leHQuIExpbnVzLCBsZXQgbWUga25vdyBpZiBJIHRha2UgdGhlCj4gcGluY3Ry
bCBvbmUgb3IgeW91IHByZWZlciB0byB0YWtlIGl0LgoKQUZBSVUgeW91ICpoYXZlKiB0byB0YWtl
IGl0IGJlY2F1c2UgdGhlcmUgYXJlIGNvbXBpbGUtdGltZSBkZXBlbmRlbmNpZXM/CgpJIHByb3Zp
ZGVkIG15IFJldmlld2VkLWJ5IHNvIGdvIGFoZWFkIGFuZCBhcHBseSBpdCEKCllvdXJzLApMaW51
cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
