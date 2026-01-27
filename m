Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ErHCmeDeGmqqgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 10:20:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E3A919BB
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 10:20:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A1A0C56603;
	Tue, 27 Jan 2026 09:20:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41851C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 09:20:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CE0FA4427F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 09:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96A1C2BCB7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769505635;
 bh=p0IYKPvLat3QfnpDZR/OU3ZqUxwUEKvk7ycHfQxUWZc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Vbv6PsAcMvUdBF01LOt0+TN5btOmRSbzCatgsMvnx4lfsrDRysDt16czedra04lJH
 pDKAJ5n3pDEMgnCRArvyJCKrQ4jDXf5Rr3gqSKtbT3fmD+lHRtV2wj2X91POQj4Kb2
 PSaKME6xYEp7yahOmFSxcwd5RfmHoR2PP9yjAzRrJ9I7A7AJHPrMqrJ+q4BDp1tjNt
 kcwvt7SSEQo9t5zVKTmvvKArxUTvH4rOt+P/0iuGK6ao3+QWWeuI0TpgqyL0x/bwJu
 6rhdMtxd/qrxtgv9AiHYW3hH+u25GNWozBWvp/sZ77G543QL1MAzMnSWZ3bbowoKVI
 pTq55Djhp2y6A==
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-7942b9663f8so48451947b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 01:20:35 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVWqLSA/G8Xa96yyG290ZcfEPo01vPrKxD82+c62YcEF/uwueH38Mq1OoI6WrzT5B7ulFYQ0VxfCtjJQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxzM/1Rqja0dg3xcnadBO90fe2HkbPTmwOjqL29jEA5KCH+EQ4M
 1esElrqcltnGKX9JIAEf+K/oFtL91pMItq2FVo37F9u7s9vUNUbc6L9fJoIwjW+Jzk64vTCKo9h
 8J/FP9AMKhwlzB27MxYcVfrYyfatwCOw=
X-Received: by 2002:a05:690e:408c:b0:649:58f1:6cdc with SMTP id
 956f58d0204a3-6498fc54ed4mr526512d50.66.1769505634986; Tue, 27 Jan 2026
 01:20:34 -0800 (PST)
MIME-Version: 1.0
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
 <20260121-debug_bus-v3-2-4d32451180d0@foss.st.com>
In-Reply-To: <20260121-debug_bus-v3-2-4d32451180d0@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:20:24 +0100
X-Gmail-Original-Message-ID: <CAD++jL=kUV4ApYB4xYRKK_qH4Z-i2PUuis+1pd+w+nbtWC-FvQ@mail.gmail.com>
X-Gm-Features: AZwV_QiHuD4uxcaT0lvjfGOgtaMK3IHUr5k1uRq3DPN_dABfrTBvSM80ZXPyZJI
Message-ID: <CAD++jL=kUV4ApYB4xYRKK_qH4Z-i2PUuis+1pd+w+nbtWC-FvQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 02/12] dt-bindings: pinctrl: document
 access-controllers property for stm32 HDP
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
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: A9E3A919BB
X-Rspamd-Action: no action

T24gV2VkLCBKYW4gMjEsIDIwMjYgYXQgMTozNeKAr1BNIEdhdGllbiBDaGV2YWxsaWVyCjxnYXRp
ZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IEhEUCBiZWluZyBmdW5jdGlvbmFs
IGRlcGVuZHMgb24gdGhlIGRlYnVnIGNvbmZpZ3VyYXRpb24gb24gdGhlIHBsYXRmb3JtCj4gdGhh
dCBjYW4gYmUgY2hlY2tlZCB1c2luZyB0aGUgYWNjZXNzLWNvbnRyb2xsZXJzIHByb3BlcnR5LCBk
b2N1bWVudCBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEdhdGllbiBDaGV2YWxsaWVyIDxnYXRpZW4u
Y2hldmFsbGllckBmb3NzLnN0LmNvbT4KPiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJv
YmhAa2VybmVsLm9yZz4KCkFja2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9y
Zz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
