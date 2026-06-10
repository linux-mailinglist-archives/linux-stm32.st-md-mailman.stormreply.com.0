Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +U9mA4HKKWqBdQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 22:35:13 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B49066CCC0
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 22:35:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=pp+VY8Cb;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35DF7C5F1CF;
	Wed, 10 Jun 2026 20:35:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7AF4C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 20:35:10 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490c1915793so51917585e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 13:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1781123710; x=1781728510;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0uD+V1MP1IrfqCSKgnnEBQvMXliLpNg3JmnXmkFW/Zc=;
 b=pp+VY8CbhgJBMLlG/+RIto0S/Qed6GsHGS4sydHQk62TbPQMS9TIt79/4IKHsehuIj
 polm4W9kPTbDnxOOeX6Wx6FOzC4OQzU0miUKx/GIMq4uPAm/fJIVQhFnSwIRgUbukbE8
 LHvQHUzs7rwrPZ7BAB1Pn4Q/eJpJypW4jQiC1GkyJBCujn7TfubfMukHXKoCPiAEXOZr
 E0z0b+ZJWWXfv6pXYF0H8hWoV8PrIXppNqX6pN9W6PxZDHeg/wkEI9UiWK/7ktjMuYRh
 YWZEmmwa9O2SRSwP5ownxKIImEtYhuOz5JrmC8nlNySVhyySjDSUoohqEF222/2ISGfW
 yHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781123710; x=1781728510;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0uD+V1MP1IrfqCSKgnnEBQvMXliLpNg3JmnXmkFW/Zc=;
 b=Md3LJw+ijIvXys8+1bLsuLz7zTnIMufYproMIDXdw1MLiL7l9uge97EE71h9LYbLoQ
 WYnLY36P4jaRYXtwWpc47z9KMxo5UO3+erAVzLhskqK00xO92n8Le9tWXRKYvqD0w9mL
 z4WFQ+V/A0JMtQnwz9Lg2U9SWlwtTk6X+jqSU16imWe+9IG8vMn91FZidOigM3YP+ljM
 p6rxQ39wP5e+REwPzNL0XbN5Pr4IPEiuzzWb12qpC70gaKXbx42E/XakNnDAK05R/mbH
 GaDuzWlxuF76B8NFlgiMPblHe6T33g97Nt+/F7y/F+pd/n4PqHel+OjvMSXPJ6ow6E8k
 fmbA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+YdXHeyAt3Oy/wGSrpWy80XWxUt/cC0yVrTWm/wTkisbGWH9TNOvEOriH9W3zrayQc8m3mhHw4ElfWaQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwDGMj6qfCzizxkaZp5b8OHYrj9AC4l7ayoRssNPISVfk3aXZYn
 /wOoFTFo82KjS+S9IOgN8mfjABelgXpD14CxqiJHM6ubBcrY7wB9ObmqAD3h/R1YASU=
X-Gm-Gg: Acq92OEfT1b6ASk3/3szXGrDp/Joez0RFoOLctgH+RtCiJpDl9ZDE/jxSU9WweSjBHc
 NU5S9xuqO2Vr5prP/VHaEca9UWHLGxfLsWIadjn83LskzgdIt/+ep1ekQE1vHqRe4LJ3Bp2IJb0
 AN9Q1BjUscJXEa78rbVlMi9EuR55CcMuvebHhfidF0nF8XMLaJ7zmXOFo9DIPlw/iVtLwF0FPzn
 5UZx43h+789caac3VG2ZFUP0fvXvaG9kClEk0vQXQvRL81O4Ue+/9UDoq0Nw3SmBe52ogfnJC73
 9AZTZDl+k3FonEucHIed9Vx4oSu5rwdXFynAdEAn3HJHvkvcmLaECCajM/sfJyB3fxW3AG939qw
 yLNNsZMulN8innNwsmQ4qcmN/8reYyi15sthhgbLKoELlAI/Ee6WX18dr22qKOZJKwfuBjufNCY
 ee4Iz6sDz1cqg/WDQVGgYjSEDV5sCZPcrmvKl71EiA4Q==
X-Received: by 2002:a05:600c:1f89:b0:490:e1a6:4d13 with SMTP id
 5b1f17b1804b1-490e2d27954mr6307175e9.15.1781123709975; 
 Wed, 10 Jun 2026 13:35:09 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 13:35:09 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:05 +0200
Message-Id: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOy07DMBAF0F+pvMZoxq+krPgPxGJij6mBNpUdA
 lWVf8cJCx5NxfJKc8+dsyicExdxtzmLzGMqqT/UYG82wu/o8MQyhZqFAuXAaJDv6SjLsKf8omQ
 gLxtwEM02hK2JoraOmWP6WMSHx69c3rpn9sPMzBe7VIY+n5bJUc131/VRSZCsKbau9QYI7zs6v
 aYu863v97O2VC3q9Wr0gdiCjxbpd3X+bdTf6xbMJaErAVYZwujR62vrSq1X0XUMFLQl16ys4z/
 rWIm2MV47MluEsEKYH4TGS8JUomFnqTMKbfhLTNP0CU94Sd0CAgAA
X-Change-ID: 20260430-wip-stmark2-dac-7060f49dd94f
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
X-Mailer: b4 0.15.2
Cc: Angelo Dureghello <adureghello@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Greg Ungerer <gerg@uclinux.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 00/10] add mcf54415 DAC driver
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
	FREEMAIL_TO(0.00)[linux-m68k.org,fdwdc.com,arndb.de,gmail.com,foss.st.com,kernel.org,baylibre.com,analog.com];
	FORGED_SENDER(0.00)[adureghello@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:arnd@arndb.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:gerg@uclinux.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B49066CCC0

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
NTA2MTQyNjQ0LjMyMzQyNzAtMi1nZXJnQGtlcm5lbC5vcmcvCi0tLQpDaGFuZ2VzIGluIHY1Ogot
IGtlZXBpbmcgY2hhbmdlbG9nIGluIGVhY2ggc2luZ2xlIHBhdGNoLCB3aGVyZSBhbnkKLSBMaW5r
IHRvIHY0OiBodHRwczovL3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA1MzEtd2lwLXN0bWFyazItZGFj
LXY0LTAtN2U2NWFiNDIxNWRkQGJheWxpYnJlLmNvbQoKQ2hhbmdlcyBpbiB2NDoKLSBrZWVwaW5n
IGNoYW5nZWxvZyBpbiBlYWNoIHNpbmdsZSBwYXRjaCwgd2hlcmUgYW55Ci0gTGluayB0byB2Mzog
aHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNTIyLXdpcC1zdG1hcmsyLWRhYy12My0wLTE2
YmUwYWQzNWE2N0BiYXlsaWJyZS5jb20KCkNoYW5nZXMgaW4gdjM6Ci0ga2VlcGluZyBjaGFuZ2Vs
b2cgaW4gZWFjaCBzaW5nbGUgcGF0Y2gsIHdoZXJlIGFueQotIExpbmsgdG8gdjI6IGh0dHBzOi8v
cGF0Y2gubXNnaWQubGluay8yMDI2MDUxMy13aXAtc3RtYXJrMi1kYWMtdjItMC1mY2RhZTUwY2Y1
MWFAYmF5bGlicmUuY29tCgpDaGFuZ2VzIGluIHYyOgotIGtlZXBpbmcgY2hhbmdlbG9nIGluIGVh
Y2ggc2luZ2xlIHBhdGNoLCB3aGVyZSBhbnkKLSBMaW5rIHRvIHYxOiBodHRwczovL3BhdGNoLm1z
Z2lkLmxpbmsvMjAyNjA1MDQtd2lwLXN0bWFyazItZGFjLXYxLTAtODc0YzM2YTQ5MTBkQGJheWxp
YnJlLmNvbQoKVG86IEdyZWcgVW5nZXJlciA8Z2VyZ0BsaW51eC1tNjhrLm9yZz4KVG86IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+ClRvOiBTdGV2ZW4gS2luZyA8c2Zr
aW5nQGZkd2RjLmNvbT4KVG86IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+ClRvOiBNYXhp
bWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+ClRvOiBBbGV4YW5kcmUgVG9y
Z3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgpUbzogSm9uYXRoYW4gQ2FtZXJvbiA8
amljMjNAa2VybmVsLm9yZz4KVG86IERhdmlkIExlY2huZXIgPGRsZWNobmVyQGJheWxpYnJlLmNv
bT4KVG86IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+ClRvOiBBbmR5IFNoZXZjaGVua28g
PGFuZHlAa2VybmVsLm9yZz4KQ2M6IEdyZWcgVW5nZXJlciA8Z2VyZ0B1Y2xpbnV4Lm9yZz4KQ2M6
IGxpbnV4LW02OGtAbGlzdHMubGludXgtbTY4ay5vcmcKQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcKQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KQ2M6
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtaWlvQHZnZXIu
a2VybmVsLm9yZwoKLS0tCkFuZ2VsbyBEdXJlZ2hlbGxvICgxMCk6CiAgICAgIG02OGs6IG1jZjU0
NDF4OiBmaXggY2xvY2tzIG51bWJlcmluZwogICAgICBtNjhrOiBtY2Y1NDQxeDogYWRkIGNsb2Nr
IGZvciBEQUMgY2hhbm5lbCAxCiAgICAgIG02OGs6IGFkZCBEQUMgbW9kdWxlcyBiYXNlIGFkZHJl
c3NlcwogICAgICBtNjhrOiBtY2Y1NDQxeDogYWRkIENDTSByZWdpc3RlcnMKICAgICAgbTY4azog
bWNmNTQ0MXg6IGFkZCBDQ1IgTUlTQ0NSMiBiaXRmaWVsZHMKICAgICAgbTY4azogc3RtYXJrMjog
dXNlIGlvcG9ydC5oIG1hY3JvcyBmb3IgcmVzb3VyY2VzCiAgICAgIG02OGs6IHN0bWFyazI6IGFk
ZCBtY2Y1NDQxeCBEQUMgcGxhdGZvcm0gZGV2aWNlcwogICAgICBtNjhrOiBzdG1hcmsyOiBlbmFi
bGUgREFDcyBvdXRwdXRzCiAgICAgIGlpbzogZGFjOiBhZGQgbWNmNTQ0MTUgREFDCiAgICAgIG02
OGs6IGRlZmNvbmZpZzogdXBkYXRlIHN0bWFyazIgZGVmY29uZmlnCgogYXJjaC9tNjhrL2NvbGRm
aXJlL201NDQxeC5jICAgICAgICAgfCAgMjEgKystLQogYXJjaC9tNjhrL2NvbGRmaXJlL3N0bWFy
azIuYyAgICAgICAgfCAgNDcgKysrKystLS0KIGFyY2gvbTY4ay9jb25maWdzL3N0bWFyazJfZGVm
Y29uZmlnIHwgICAyICsKIGFyY2gvbTY4ay9pbmNsdWRlL2FzbS9tNTQ0MXhzaW0uaCAgIHwgIDQy
ICsrKysrKysKIGRyaXZlcnMvaWlvL2RhYy9LY29uZmlnICAgICAgICAgICAgIHwgIDExICsrCiBk
cml2ZXJzL2lpby9kYWMvTWFrZWZpbGUgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2lpby9k
YWMvbWNmNTQ0MTVfZGFjLmMgICAgICB8IDIxNiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIDcgZmlsZXMgY2hhbmdlZCwgMzE2IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9u
cygtKQotLS0KYmFzZS1jb21taXQ6IGRjZjkzNTIwMTU3YzE3ZGRmYjFmNDNiNjZmY2RkYTI3NzE0
ZmYxZGQKY2hhbmdlLWlkOiAyMDI2MDQzMC13aXAtc3RtYXJrMi1kYWMtNzA2MGY0OWRkOTRmCgpC
ZXN0IHJlZ2FyZHMsCi0tICAKQW5nZWxvIER1cmVnaGVsbG8gPGFkdXJlZ2hlbGxvQGJheWxpYnJl
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
