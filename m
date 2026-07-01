Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vpjRJnohRWoj7goAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 16:17:30 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0076EE9A4
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 16:17:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=PiQioDIk;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D951AC7C7CB;
	Wed,  1 Jul 2026 14:17:29 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FE15C56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2026 14:17:28 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493ae59eca6so5377135e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Jul 2026 07:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1782915447; x=1783520247;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZW8+spma2S67V6miLcBHdIf2ZY8X/GF3gl5p74l3kDU=;
 b=PiQioDIk31WugheSqLQakfdYkbPZg/ClbkCa24aJc95zEFP/TC7Ru8Zr0m0eKD/1OD
 y2PqkdlVMPi5nAcwj3IJWAvE859wwgLd/XErDFl1KDBXAWhhDZEOq+b7BRgtYeJL63F3
 xHRc6+TqiZRtwuyMgwKcC68Lm/QWbbo2jBx6bTWhN+IPefzkeRtpfwA+tdiBwCujDrAX
 dHt5K5QjTuY1RCu5/DYNqwf8Bwm7YwwgANkwdEmCL2HBXFFF7C0q6yqCDrFqSR7BSgZe
 lncsXmFFBBr2SKfzMIWo1LJ56F1gBFV0QrKAtUIA9ONQ13hOwjzNUEEp/tdB/ZW2Lns/
 WJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782915447; x=1783520247;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZW8+spma2S67V6miLcBHdIf2ZY8X/GF3gl5p74l3kDU=;
 b=BRRUKxrm9Kip/x0v7+J/v2E7RMKw+uitwXCmjoziF/WzHhifbp6gpJbi5UdEONFAjD
 gnV0SXnty64eeRnnBk/stQzhlFIgZdmyXPkse7vVNqOk3HXXsYD5SQqWlC0wI7RwLSdP
 /2rUT4Jb40gWKk8LcqQrKcLSvo3H4M32DFr16CBfp4e0emeBdzsJZoj+p3aZGXQNF7Qj
 q9usgm3Mw3Uo/Q6cRXz7yXXzlvtV+7qb2ZhhWCTkvAgsc5dwrsCAaOrolH3ExTbVBfvv
 K46FCfWvpTbIPY8TrF2DvOoBa5IB/AGpiycqPmYm6rhg/I55Mq+MeO8bRDzzRh/gK4Y4
 dX/w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8nx/kJn3RldCWjU49XecJkPUtA0ERd031YL0LlxdVUHsVBNx2tde2+a85H1JDItUW9ir3c022PVxHgSg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywr/l9BICO99Fh7wL9yyI0LqZGXQ5TedeI0gWh7d635N6PknDni
 d1vdQ09z9VYifE3Us9OL9tZecZSY3CPEXwwZnMSzK5m9k3GeLWgFQ1CZZSaqFuQeFHw=
X-Gm-Gg: AfdE7cnARiwFu4qfa4519iYM9eqzbg5MhCoGf/bJuuDoA34W9q4Pa/WIZdt85Byon1h
 PYhTvGdSLf5uk8bOcXZjXfH7yIc1PRAIUUAJjxKwi5GV0kYr48Ae0+xaVmZMuF29R1dTQh7dsiS
 LbMZWgftAIx/rJF+j2v4eAxTSBuBcpsX3GwVpqbCQyaqKaFp8a0cBmV1yqKyUd8sG+G3PfuJ/2X
 IpoYU70R3CaR1C2lwkSPhVWiGTcbO0C0oQG1qKwKmqs1ADuedm9gxYoupEnPpYzYx9AW3gbBybW
 UxDgLXeYuGhx07KFbsMedFUAyH/oKhNsY3vBZC8yc0Ov/K3tAf6yenuioSoC5x5gDHs1U6/JVZl
 MscfBa1h42XtnFE4NMgYQxV9lxrm/GV3WiqK7rLCEBYoWLAM2ycJZjEPnDAFCLZjONPOqJqOWXV
 Lrqrn4VmquQQgBMrOg9p+kHsmoqY9cqMHs5O7sAVNRoXQ3z1DdF21I
X-Received: by 2002:a05:600c:524a:b0:493:af0d:484c with SMTP id
 5b1f17b1804b1-493c3df2fb5mr12527785e9.34.1782915447358; 
 Wed, 01 Jul 2026 07:17:27 -0700 (PDT)
Received: from [192.168.0.2] (host93-7-32-195.dimensionesrl.eu. [195.32.7.93])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be81df2asm152552155e9.12.2026.07.01.07.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 07:17:26 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 01 Jul 2026 16:17:22 +0200
Message-Id: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XRy07DMBAF0F+pssbI48c4YcV/IBbjFzXQpnJCo
 Kry7zhh0UJdsRxp7rmW59QMIacwNA+bU5PDlIbU78tg7jaN29L+JbDky9wILpArydlnOrBh3FF
 +E8yTY4Yjj6rzvlOxKalDDjF9reLT8888fNjX4MaFWTa2aRj7fFwrJ7Hs3dYnwTgLkmKLrVOc4
 NHS8T3ZHO5dv1u0NapB1qPReQqau6iBfkeXt03y3K65uiZkIbgWiiA6cPJWuxD1KKANnLzUhKb
 SDv+0QyFao5xEUh1wXyHUBSHhmlCFMAE1WSVA+xqhzwRC5QK6ENagbaVE9NpVCLwk2msCC6Fag
 +Ct7dD//Yt5nr8Bqq48OogCAAA=
X-Change-ID: 20260430-wip-stmark2-dac-7060f49dd94f
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15.2
Cc: Angelo Dureghello <adureghello@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [Linux-stm32] [PATCH v7 0/2] add mcf54415 DAC driver
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,linux-m68k.org,gmail.com,foss.st.com];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:geert@linux-m68k.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andriy.shevchenko@intel.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B0076EE9A4

VGhpcyBwYXRjaHNldCBhZGRzIGEgbWluaW1hbGlzdGljIERBQyBkcml2ZXIgZm9yIHRoZSBOWFAg
bWNmNTQ0MTUvNi83LzgKYnVpbHRpbiBEQUNzLgoKQ3VycmVudGx5IHRoZSBkcml2ZXIgZW5hYmxl
cyB0aGUgcmF3IHdyaXRlIG9ubHkuIEZlYXR1cmUgYXMgZG1hLCBzeW5jLCBvcgpmb3JtYXQgYXJl
IG5vdCBzdXBvcHJ0ZWQgZm9yIHRoaXMgdmVyc2lvbi4KCkFkZGl0aW9uYWwgb3B0aW9ucyBzdXBw
b2VydGVkIGJ5IHRoZSBEQUMgbW9kdWxlIHdpbGwgYmUgYWRkZWQgdG8gdGhlIGRyaXZlcgpsYXRl
ciBvbiwgYXMgbmVlZGVkLgoKVGhlIHNhbWUgcGF0Y2hzZXQgcHJlcGFyZXMgdGhlIG02OGsvY29s
ZGZpcmUgYXJjaGl0ZWN0dXJlIHRvIHN1cHBvcnQKdGhlIGRyaXZlci4KCkJlbG93IHNvbWUgYmFz
aWMgdGVzdHMgZG9uZSBvbiBzdG1hcmsyIG1jZjU0NDE1LWJhc2VkIGJvYXJkLCB2b2x0YWdlIGNo
ZWNrCm9uIERBQzAgYW5kIERBQzE6Cgp+ICMgY2QgL3N5cy9idXMvaWlvL2RldmljZXMvaWlvOmRl
dmljZTAvCi9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpkZXZpY2UwICMgbHMKbmFtZSAgICAgICAg
ICAgICAgIG91dF92b2x0YWdlX3NjYWxlICB1ZXZlbnQKb3V0X3ZvbHRhZ2VfcmF3ICAgIHN1YnN5
c3RlbQovc3lzL2J1cy9paW8vZGV2aWNlcy9paW86ZGV2aWNlMCAjIGNhdCBuYW1lCm1jZjU0NDE1
Ci9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpkZXZpY2UwICMgZWNobyA0MDk1ID4gb3V0X3ZvbHRh
Z2VfcmF3IAovc3lzL2J1cy9paW8vZGV2aWNlcy9paW86ZGV2aWNlMCAjIGVjaG8gMjA0OCA+IG91
dF92b2x0YWdlX3JhdyAKL3N5cy9idXMvaWlvL2RldmljZXMvaWlvOmRldmljZTAgIyBlY2hvIDQw
OTYgPiBvdXRfdm9sdGFnZV9yYXcgCnNoOiB3cml0ZSBlcnJvcjogSW52YWxpZCBhcmd1bWVudAov
c3lzL2J1cy9paW8vZGV2aWNlcy9paW86ZGV2aWNlMCAjIGNhdCBvdXRfdm9sdGFnZV9yYXcgCjIw
NDgKL3N5cy9idXMvaWlvL2RldmljZXMvaWlvOmRldmljZTAgIyAKClNhbWUgYmVoYXZpb3IgZm9y
IC9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpkZXZpY2UxLgoKR2VuZXJhdGVkIGEgc2luZSB3YXZl
IGJ5IHNoZWxsIHNjcmlwdCwgc2luZSBzaGFwZSBpcyBnb29kLgoKaXMgYWN0dWFsbHkgaW4gcHJv
Z3Jlc3M6CgpOb3RlOiB0aGlzIHBhdGNoc2V0IGRlcGVuZHMgb24gbWV3IG1jZl9yZWFkL21jZl93
cml0ZSBpbXBsZW1lbnRhdGlvbiB0aGF0Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LW02OGsvMjA5ZDA2NTMtNjM4Ni00YjY0LTllMTUtZTM1OGY4NDQ1M2FiQGFwcC5mYXN0bWFp
bC5jb20vVC8jdApMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tNjhrLzIwMjYw
NTA2MTQyNjQ0LjMyMzQyNzAtMi1nZXJnQGtlcm5lbC5vcmcvCi0tLQpDaGFuZ2VzIGluIHY3Ogot
IGtlZXBpbmcgY2hhbmdlbG9nIGluIGVhY2ggc2luZ2xlIHBhdGNoLCB3aGVyZSBhbnkKLSBMaW5r
IHRvIHY2OiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA2MTgtd2lwLXN0bWFyazItZGFj
LXY2LTAtNDg3NjFkYmI5NmQ3QGJheWxpYnJlLmNvbQoKQ2hhbmdlcyBpbiB2NjoKLSBSZW1vdmVk
IHBhdGNoZXMgMSB0byA4LCBhbHJlYWR5IHB1c2hlZCBpbiBtNjhrbm9tbXUgZm9yLW5leHQgYnkK
ICBHcmVnIFVuZ2VyZXIgPGdlcmdAbGludXgtbTY4ay5vcmc+Ci0ga2VlcGluZyBjaGFuZ2Vsb2cg
aW4gZWFjaCBzaW5nbGUgcGF0Y2gsIHdoZXJlIGFueQotIExpbmsgdG8gdjU6IGh0dHBzOi8vcGF0
Y2gubXNnaWQubGluay8yMDI2MDYxMC13aXAtc3RtYXJrMi1kYWMtdjUtMC1iNzZiODMzNjZkNWNA
YmF5bGlicmUuY29tCgpDaGFuZ2VzIGluIHY1OgotIGtlZXBpbmcgY2hhbmdlbG9nIGluIGVhY2gg
c2luZ2xlIHBhdGNoLCB3aGVyZSBhbnkKLSBMaW5rIHRvIHY0OiBodHRwczovL3BhdGNoLm1zZ2lk
LmxpbmsvMjAyNjA1MzEtd2lwLXN0bWFyazItZGFjLXY0LTAtN2U2NWFiNDIxNWRkQGJheWxpYnJl
LmNvbQoKQ2hhbmdlcyBpbiB2NDoKLSBrZWVwaW5nIGNoYW5nZWxvZyBpbiBlYWNoIHNpbmdsZSBw
YXRjaCwgd2hlcmUgYW55Ci0gTGluayB0byB2MzogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIw
MjYwNTIyLXdpcC1zdG1hcmsyLWRhYy12My0wLTE2YmUwYWQzNWE2N0BiYXlsaWJyZS5jb20KCkNo
YW5nZXMgaW4gdjM6Ci0ga2VlcGluZyBjaGFuZ2Vsb2cgaW4gZWFjaCBzaW5nbGUgcGF0Y2gsIHdo
ZXJlIGFueQotIExpbmsgdG8gdjI6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDUxMy13
aXAtc3RtYXJrMi1kYWMtdjItMC1mY2RhZTUwY2Y1MWFAYmF5bGlicmUuY29tCgpDaGFuZ2VzIGlu
IHYyOgotIGtlZXBpbmcgY2hhbmdlbG9nIGluIGVhY2ggc2luZ2xlIHBhdGNoLCB3aGVyZSBhbnkK
LSBMaW5rIHRvIHYxOiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA1MDQtd2lwLXN0bWFy
azItZGFjLXYxLTAtODc0YzM2YTQ5MTBkQGJheWxpYnJlLmNvbQoKVG86IEpvbmF0aGFuIENhbWVy
b24gPGppYzIzQGtlcm5lbC5vcmc+ClRvOiBEYXZpZCBMZWNobmVyIDxkbGVjaG5lckBiYXlsaWJy
ZS5jb20+ClRvOiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgpUbzogQW5keSBTaGV2Y2hl
bmtvIDxhbmR5QGtlcm5lbC5vcmc+ClRvOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4
LW02OGsub3JnPgpUbzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29t
PgpUbzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KQ2M6
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LWlpb0B2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbnV4LW02OGtAbGlzdHMubGludXgtbTY4ay5vcmcKQ2M6IGxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwoKLS0tCkFuZ2VsbyBEdXJlZ2hlbGxvICgyKToKICAgICAgaWlvOiBkYWM6IGFk
ZCBtY2Y1NDQxNSBEQUMKICAgICAgbTY4azogZGVmY29uZmlnOiB1cGRhdGUgc3RtYXJrMiBkZWZj
b25maWcKCiBhcmNoL202OGsvY29uZmlncy9zdG1hcmsyX2RlZmNvbmZpZyB8ICAgMiArCiBkcml2
ZXJzL2lpby9kYWMvS2NvbmZpZyAgICAgICAgICAgICB8ICAxMSArKysKIGRyaXZlcnMvaWlvL2Rh
Yy9NYWtlZmlsZSAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvaWlvL2RhYy9tY2Y1NDQxNV9k
YWMuYyAgICAgIHwgMTgwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogNCBm
aWxlcyBjaGFuZ2VkLCAxOTQgaW5zZXJ0aW9ucygrKQotLS0KYmFzZS1jb21taXQ6IGJjNWE4NWE1
NDQxNjMyZjRiZDdhY2QzODYyMGZkY2JlNDg1MmE0NGYKY2hhbmdlLWlkOiAyMDI2MDQzMC13aXAt
c3RtYXJrMi1kYWMtNzA2MGY0OWRkOTRmCgpCZXN0IHJlZ2FyZHMsCi0tICAKQW5nZWxvIER1cmVn
aGVsbG8gPGFkdXJlZ2hlbGxvQGJheWxpYnJlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
