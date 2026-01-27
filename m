Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKM6GF6EeGmqqgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 10:24:46 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0146191A7E
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 10:24:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9D9FC56603;
	Tue, 27 Jan 2026 09:24:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CF1DC555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 09:24:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 12E9860121
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 09:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9F7C2BC87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769505882;
 bh=IAlcWCtQdB6zFcgT1AEpGn9kuon/qBctbh//4Nuyblo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m5B4fFTRykSx1iXEUZ9o6PvTZRS69FB882HHAz9VKjMB4EiGb1+Sjpt4v1YU+X2sJ
 iFcHLvFGJ9tcRarjXkzPGwmmgjOyp9eYPgR79CBtDuerf1x5yCMhvbnxenXuoi4CHX
 67vgFROGS4FNLu0cfQsesjaP/DXhZImHOy7OxNrQnT0kII4qslvsA2WlY5p4ABnUta
 O8KMX4J6OylXZehLVg0k/7CzLbM3YLqQQZ3KzO3nEeeHr4rzzugkF5s04CN8ENSv5T
 Q2cL9PWH71aewyr5fDuTzxdfgDVD2F9COfFaTobjUz8lV9nL3+Wzgvpz1waiKBRMAS
 YbI5GreoSvQnQ==
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-6446c1a7a1cso4381807d50.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 01:24:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWPLjroJO3GhVohNkFmoNvkvc+H/ww4/cVY9HXgzY2mNgeKvM3WraGLCPTJonQya5vYT2btEBJTyn/iaQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzVQEom7qYuuVRkf4co98e3ZswgQfUBlHi6alP75qI7+Qde2w4X
 RkMJZ+It66juGVrZeYM1Vlo1rVMFDr2oheQyzKhrdus2PVSd8ZUcBjVnj6xCglb48hfgpPyomCC
 MNfT/zKo32M2OJ/ezB5awpQaOPjkYn2c=
X-Received: by 2002:a05:690e:128d:b0:649:6ae3:59d8 with SMTP id
 956f58d0204a3-6498fc1489bmr707379d50.16.1769505882102; Tue, 27 Jan 2026
 01:24:42 -0800 (PST)
MIME-Version: 1.0
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
 <20260123-debug_bus-v5-5-90b670844241@foss.st.com>
In-Reply-To: <20260123-debug_bus-v5-5-90b670844241@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:24:31 +0100
X-Gmail-Original-Message-ID: <CAD++jL=MPPM5HWYJzc3ckbnP5GVjfvSobmKE1xx=5Ud6964NZg@mail.gmail.com>
X-Gm-Features: AZwV_QhQdyIiz4UerqYl3hvl_Hh7MKvqx_tg7HoHtzwKBdCqkSeZ5Xn1a3ShfdI
Message-ID: <CAD++jL=MPPM5HWYJzc3ckbnP5GVjfvSobmKE1xx=5Ud6964NZg@mail.gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-gpio@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, jens.wiklander@linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v5 05/12] bus: stm32_firewall: add
 stm32_firewall_get_grant_all_access() API
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
	FORGED_RECIPIENTS(0.00)[m:gatien.chevallier@foss.st.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:suzuki.poulose@arm.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:james.clark@linaro.org,m:linux-stm32@st-md-mailman.stormreply.com,m:legoffic.clement@gmail.com,m:linux-gpio@vger.kernel.org,m:leo.yan@linux.dev,m:mcoquelin.stm32@gmail.com,m:coresight@lists.linaro.org,m:krzk+dt@kernel.org,m:jens.wiklander@linaro.org,m:linux-arm-kernel@lists.infradead.org,m:mike.leach@linaro.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,arm.com,vger.kernel.org,st-md-mailman.stormreply.com,gmail.com,linux.dev,lists.linaro.org,lists.infradead.org];
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
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns,st.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 0146191A7E
X-Rspamd-Action: no action

T24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMTE6NDDigK9BTSBHYXRpZW4gQ2hldmFsbGllcgo8Z2F0
aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+IHdyb3RlOgoKPiBBZGQgdGhlIHN0bTMyX2ZpcmV3
YWxsX2dldF9ncmFudF9hbGxfYWNjZXNzKCkgQVBJIHRvIGJlIGFibGUgdG8gZmV0Y2gKPiBhbGwg
ZmlyZXdhbGwgcmVmZXJlbmNlcyBpbiBhbiBhY2Nlc3MtY29udHJvbGxlcnMgcHJvcGVydHkgYW5k
IHRyeSB0byBncmFudAo+IGFjY2VzcyB0byBhbGwgb2YgdGhlbS4KPgo+IFNpZ25lZC1vZmYtYnk6
IEdhdGllbiBDaGV2YWxsaWVyIDxnYXRpZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4KCkV4Y2Vs
bGVudCwganVzdCB3aGF0IEkgd2FudGVkLgpUaGFua3MgR2F0aWVuIQoKUmV2aWV3ZWQtYnk6IExp
bnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
