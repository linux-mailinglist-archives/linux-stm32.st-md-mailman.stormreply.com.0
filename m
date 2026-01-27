Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHPfDtiDeGnnqgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 10:22:32 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B3491A2E
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 10:22:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 835AEC56603;
	Tue, 27 Jan 2026 09:22:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8786FC555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 09:22:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 404C444045
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 09:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2316AC16AAE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769505748;
 bh=1Mzkzhmf17O9Xkx0hZ6VF5j9tJzlhe6IqtMNY1iqJLQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O6ueMY72cyAl/I2bdA2DIP8HfzWCj68lloHCg/doi4W47Fx+TJnJNp+VZN2E9tbZ8
 1C8moFGl/Rrqi1jNm8rmMPDHzVzEgBq/RY4m1N1TNfg2sArtn41PdyjKzB2XN5zm5A
 uTZu67OijsJ/U4qap+5HF0EbxEYLQqlkQcsNJoFhztHO729P3kL9nLOhuEdFzDyErT
 /hXQ352S7HqZwWvxpbeFDr20L8l9a1yfRKkNWY41SWCCDsSA/q9qVayL3Jkxe8AFR/
 Tw8DyHCMyA6Ficx4UsuquFgtYsLhXo6zcMj35g3XiAI47xBHEXEGO6fFLE/kf0Ib/T
 UStg9G3GLJgCA==
Received: by mail-yx1-f48.google.com with SMTP id
 956f58d0204a3-6446c924f9eso4672786d50.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 01:22:28 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWodiRkjoIr8RUsSX4sesIOl2CuvA0M3kGnmGYMX3QFBLM22qk1xxkC5tr8LTWCLcB6b07FaMbsl2Ip2Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyBHj5t20UpKuEjZfwwcN5bguiYET8Xe5HqwsPhJXEi4VMEmMdi
 mFlIY2JC9L+5MKqXLEr6CuoYktkcLRgREu0agiyKqo0yj/gxPlwHV6T1wwNB/5PIEVe9aaP2rxT
 85Mxfvoub3C0Bjfl8sr+JvnxaNOX7UhA=
X-Received: by 2002:a05:690e:241b:b0:645:443d:10a2 with SMTP id
 956f58d0204a3-6498fbebe0emr414264d50.26.1769505747439; Tue, 27 Jan 2026
 01:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
 <20260123-debug_bus-v5-2-90b670844241@foss.st.com>
In-Reply-To: <20260123-debug_bus-v5-2-90b670844241@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:22:16 +0100
X-Gmail-Original-Message-ID: <CAD++jLmr-O-Mb_MEK6LWdhY75=uteLsN9MLrtOvFaeCj2B_Jgw@mail.gmail.com>
X-Gm-Features: AZwV_Qj2UaMXe95o5XuL0t4M8bbZMFmvBg1jJ_pK4foc_hf70_XCTYpnwMAEQeE
Message-ID: <CAD++jLmr-O-Mb_MEK6LWdhY75=uteLsN9MLrtOvFaeCj2B_Jgw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 02/12] dt-bindings: pinctrl: document
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: D0B3491A2E
X-Rspamd-Action: no action

T24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMTE6NDDigK9BTSBHYXRpZW4gQ2hldmFsbGllcgo8Z2F0
aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+IHdyb3RlOgoKPiBIRFAgYmVpbmcgZnVuY3Rpb25h
bCBkZXBlbmRzIG9uIHRoZSBkZWJ1ZyBjb25maWd1cmF0aW9uIG9uIHRoZSBwbGF0Zm9ybQo+IHRo
YXQgY2FuIGJlIGNoZWNrZWQgdXNpbmcgdGhlIGFjY2Vzcy1jb250cm9sbGVycyBwcm9wZXJ0eSwg
ZG9jdW1lbnQgaXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0aWVu
LmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+Cj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIChBcm0pIDxy
b2JoQGtlcm5lbC5vcmc+CgpBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5v
cmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
