Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yErpF37wFmpcxwcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2026 15:24:14 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1B65E4E45
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2026 15:24:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B6A3C8F290;
	Wed, 27 May 2026 13:24:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23D1CC8F28E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 13:24:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CE57F44182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 13:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27BA1F0155C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 13:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779888250;
 bh=ynx0YVdRpScOcVOUl3nY0Y9gWTKj9Ts8mNFO+WkHlNc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc;
 b=M4ZoD6+JXZamGLbvvzX/8mFPVFodp59z3BYZHOJ1maZT37ITWJ1ws8ONO9jIbUftd
 LhBznDJJWgJ/U3q/e786ivP8rwVQtbr3RJRmy6qBsz0ICUZOKF6QS/jIpX3pL85Hki
 SBmpqnhbtAvifobPfoWvZGlHFvxvtwHbn014qxWtP3eC7ft5ucRqNyM7sDgcHxJLzZ
 CjuHGcMnd1dOC7Ya72IC7X4enemClLRXmDi8GBQi7DjBa5i3d4hQ/BgtcnHmfcskwr
 iSmD9SSLkwPopili/8IrKg0QYxQQW1DIGqW3wIH4gZu6D00pC5ZOrV7RLY/I77dU83
 JWF0LkIvryJTQ==
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5aa474d3be0so1788381e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 06:24:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ8+3xiNmgeymgkXwbFQm1jy4+zolKGvvW4oCLe4FJl+zpu43MlGCmg6PfmwBqmSHzf4fAdP7tAbHhB5ag==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzrAFW4651VKzFStKzQzcLLagScloaGvtVTz0d0JARQkpO3DQXv
 uU5gDcmdXOV0NgXmIcLDL71hKgbw6E+CJWOjjOaq3rXj5NEoszBwoMlzbwqtZNh4WaF2a/XuBpA
 d2XgfuoAQlS4pOE5Xd0GZSVtTzKfw1Mo=
X-Received: by 2002:a05:6512:31c4:b0:5a8:7317:5417 with SMTP id
 2adb3069b0e04-5aa32369f4amr7061708e87.9.1779888249425; Wed, 27 May 2026
 06:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260508184626.15938-1-manishbaing2789@gmail.com>
In-Reply-To: <20260508184626.15938-1-manishbaing2789@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 15:23:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLk0QWoTCXEqZbm_ECV2YQdL6PBZp2+EMSVH6DrmPx=dKw@mail.gmail.com>
X-Gm-Features: AVHnY4LJ4ZgmIO12q-22xaSmmAdfwCpy1pxkuhOelzvqfy6Ynt81zGPLoHbXLKo
Message-ID: <CAD++jLk0QWoTCXEqZbm_ECV2YQdL6PBZp2+EMSVH6DrmPx=dKw@mail.gmail.com>
To: Manish Baing <manishbaing2789@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 thierry.reding@gmail.com, ukleinek@kernel.org, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: pwm: stmpe: drop legacy
	binding
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manishbaing2789@gmail.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-pwm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:thierry.reding@gmail.com,m:ukleinek@kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:thierryreding@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	NEURAL_SPAM(0.00)[0.740];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: ED1B65E4E45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpLCBNYXkgOCwgMjAyNiBhdCA4OjQ24oCvUE0gTWFuaXNoIEJhaW5nIDxtYW5pc2hiYWlu
ZzI3ODlAZ21haWwuY29tPiB3cm90ZToKCj4gVGhlIHN0LHN0bXBlLXB3bSBiaW5kaW5nIGlzIGFs
cmVhZHkgY292ZXJlZCBieSB0aGUgTUZEIHNjaGVtYQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZmQvc3Qsc3RtcGUueWFtbC4gUmVtb3ZlIHRoZQo+IG9ic29sZXRlIGFuZCBy
ZWR1bmRhbnQgdGV4dCBiaW5kaW5nIGZpbGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYW5pc2ggQmFp
bmcgPG1hbmlzaGJhaW5nMjc4OUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVp
aiA8bGludXN3QGtlcm5lbC5vcmc+CgpJZiB0aGUgUFdNIG1haW50YWluZXIgaXMgYnVzeSBtYXli
ZSBSb2IgY2FuIHF1ZXVlIHRoaXMgcGF0Y2g/CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
