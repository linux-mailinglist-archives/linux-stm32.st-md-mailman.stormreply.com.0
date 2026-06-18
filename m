Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8QgJDFddNGo+WAYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 23:04:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5A16A2B60
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 23:04:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=L18kI8I7;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=none
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C801C9AE31;
	Thu, 18 Jun 2026 21:04:22 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D5FBC7C7CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 21:04:20 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5ad583dc38eso5799e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 14:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1781816659; x=1782421459;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E9z0pIRRQq0JjZLgtfI21RJrv64iSxf66JeOGPUHps0=;
 b=L18kI8I7Jo+olAqi9bc5mMfZm10L2rlLOuSR65+7z1ApTSI/RBAp8mSR2/WaheIs25
 TuYJ2DDf/QT5iL4uwz0L5PJGkMYDOT4Nxvf27O/KdZ28qmKgPvD5wQermdRvRhf6UrO3
 1YQoGRG2KgC5qWRCHVya1Bf2O2DFTBwIkVxxomAKZx/Cfq56eYidg/28VUIeu4NOj1gQ
 XjyGIL6NnkVGlvAf/2xWJjW69G4L6KW/rNIQn3K3ONZQXhQ5CiIgVKALluutyvTY+jjl
 c4/cBiOq4kLMRxbSvir/MpGOUeednJT63dTk3YNqdC7t4PjnfcoUptkPwbHJZM7L/IIt
 vdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781816659; x=1782421459;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E9z0pIRRQq0JjZLgtfI21RJrv64iSxf66JeOGPUHps0=;
 b=LTDb6Nr97QaNicljieFz+9hH4OkfGAGRTGPVRU2JfBiMSGALEXhD+Du5I7q4hsv4D6
 3DW2lsqNlLpXbkstZncZdOJYSrUNgneXB/1LQg00kwd7+D55/hHXr7KEnE38o5HffNJw
 NuJ4KsY5qp2yc2Zz5rFNkbN0NA7LOqYi7+TZ5VkZ96L6AOVW8HC5sFhx0sijqOl2e83M
 qaamA/uwg+sKPlWsjH3njocYP+56BabXWd9yPcPNVi4lsqWYb3Sf0zYMzyiUWmYUt0P7
 l+4P6ykpml1zceMHSUOp+Jjczy9hOcPYYvgWqe1gNmTsd9UA22zQRkxHv8Tna1Kd8Ifm
 HWWQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8qYIdmLiCjqsfms8xmX/t0pUaMrKvQhjyfFydZ9KHoyAy25DOvJaj7nimQuWJvM01pzVw/NiT9WbAYBg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz3xDrg1ZcFRix6FoFxYMY11rItXOGktCR7tqDqQ7ePvm6baE0M
 XPIq2zwcufC8CiWQ8FOOsQKovzBvTMAgTGdKbxzBkJNoc109bBo4EymyQvzZzt95tdY=
X-Gm-Gg: AfdE7cle1JSe88oPYFQgtAp69Q/E0S2eK9rJM54v+ihtZK9KSewxZo0jABB32hz6z2y
 EIXaOXSlPT1pKA/leegYlnWXhpYEAtxzu+mg/6xTOziw0dT6ySps7VsccCO99oED1MUEe+vGf61
 8IM0vIqJHmtzLdtX0GvvQUnmvs/FR6oDOl8mxkVGMy6EMgSCOdPTCr9O7sswoRvr/i2WPKBgKy6
 6LRNDhP8fAHCzGQaHRFHjO9jG4HS4ukPKjvofTIB9qZJF12+MUneHAahBIHTQxKh3GiqdCKXQNf
 mT+5+Hn/vB0aJ0daiOHKUuSVQYWWmnx10+gd3bcyPnqtgVpi0zjE29Al4P8vOdNmBHRcaDoMOJu
 mvyGgWt0HkHh+M+B3yPrKhlLI7DV1tdJP202bhgxQzBW/40D/s4IcLNGSNH0M9OrNaERjkiYmt/
 6MNz08Ym9IUorIpaZ/4nuV
X-Received: by 2002:a05:6512:8013:20b0:5aa:b6a:738e with SMTP id
 2adb3069b0e04-5ad57715b49mr98736e87.44.1781816659260; 
 Thu, 18 Jun 2026 14:04:19 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ad57493145sm108586e87.69.2026.06.18.14.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 14:04:18 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Thu, 18 Jun 2026 23:04:14 +0200
Message-Id: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XRy07DMBAF0F+pvMZo/JokXfEfiMX4RQ20qZwQq
 Kr8O05YFKgrlleae64ln9kQcgoD227OLIcpDak/lIB3G+Z2dHgOPPmSmQSJoBXwj3Tkw7in/Cq
 5J8cbQIi6877TkZXWMYeYPlfx8ek7D+/2JbhxYZaLXRrGPp/WyUkud7f1SXLgQVFssXUaSDxYO
 r0lm8O96/eLtlaNUPVqdJ6CAReNoN/V5W2Tuqwb0NeEKgQYqUlEJ5y6tS5lvSrQBiCvDGFTWRf
 /rItCtI12Ckl3AnyF0D8IJa4JXYgmoCGrpTC+RpgLgaLyA6YQtkHbKoXojftDzPP8Ben+oGRFA
 gAA
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
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 0/2] add mcf54415 DAC driver
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:geert@linux-m68k.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: AF5A16A2B60

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
NTA2MTQyNjQ0LjMyMzQyNzAtMi1nZXJnQGtlcm5lbC5vcmcvCi0tLQpDaGFuZ2VzIGluIHY2Ogot
IFJlbW92ZWQgcGF0Y2hlcyAxIHRvIDgsIGFscmVhZHkgcHVzaGVkIGluIG02OGtub21tdSBmb3It
bmV4dCBieQogIEdyZWcgVW5nZXJlciA8Z2VyZ0BsaW51eC1tNjhrLm9yZz4KLSBrZWVwaW5nIGNo
YW5nZWxvZyBpbiBlYWNoIHNpbmdsZSBwYXRjaCwgd2hlcmUgYW55Ci0gTGluayB0byB2NTogaHR0
cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNjEwLXdpcC1zdG1hcmsyLWRhYy12NS0wLWI3NmI4
MzM2NmQ1Y0BiYXlsaWJyZS5jb20KCkNoYW5nZXMgaW4gdjU6Ci0ga2VlcGluZyBjaGFuZ2Vsb2cg
aW4gZWFjaCBzaW5nbGUgcGF0Y2gsIHdoZXJlIGFueQotIExpbmsgdG8gdjQ6IGh0dHBzOi8vcGF0
Y2gubXNnaWQubGluay8yMDI2MDUzMS13aXAtc3RtYXJrMi1kYWMtdjQtMC03ZTY1YWI0MjE1ZGRA
YmF5bGlicmUuY29tCgpDaGFuZ2VzIGluIHY0OgotIGtlZXBpbmcgY2hhbmdlbG9nIGluIGVhY2gg
c2luZ2xlIHBhdGNoLCB3aGVyZSBhbnkKLSBMaW5rIHRvIHYzOiBodHRwczovL3BhdGNoLm1zZ2lk
LmxpbmsvMjAyNjA1MjItd2lwLXN0bWFyazItZGFjLXYzLTAtMTZiZTBhZDM1YTY3QGJheWxpYnJl
LmNvbQoKQ2hhbmdlcyBpbiB2MzoKLSBrZWVwaW5nIGNoYW5nZWxvZyBpbiBlYWNoIHNpbmdsZSBw
YXRjaCwgd2hlcmUgYW55Ci0gTGluayB0byB2MjogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIw
MjYwNTEzLXdpcC1zdG1hcmsyLWRhYy12Mi0wLWZjZGFlNTBjZjUxYUBiYXlsaWJyZS5jb20KCkNo
YW5nZXMgaW4gdjI6Ci0ga2VlcGluZyBjaGFuZ2Vsb2cgaW4gZWFjaCBzaW5nbGUgcGF0Y2gsIHdo
ZXJlIGFueQotIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDUwNC13
aXAtc3RtYXJrMi1kYWMtdjEtMC04NzRjMzZhNDkxMGRAYmF5bGlicmUuY29tCgpUbzogSm9uYXRo
YW4gQ2FtZXJvbiA8amljMjNAa2VybmVsLm9yZz4KVG86IERhdmlkIExlY2huZXIgPGRsZWNobmVy
QGJheWxpYnJlLmNvbT4KVG86IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+ClRvOiBBbmR5
IFNoZXZjaGVua28gPGFuZHlAa2VybmVsLm9yZz4KVG86IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+ClRvOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBn
bWFpbC5jb20+ClRvOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3Qu
Y29tPgpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtaWlvQHZnZXIu
a2VybmVsLm9yZwpDYzogbGludXgtbTY4a0BsaXN0cy5saW51eC1tNjhrLm9yZwpDYzogbGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpDYzogbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCgotLS0KQW5nZWxvIER1cmVnaGVsbG8gKDIpOgogICAgICBpaW86
IGRhYzogYWRkIG1jZjU0NDE1IERBQwogICAgICBtNjhrOiBkZWZjb25maWc6IHVwZGF0ZSBzdG1h
cmsyIGRlZmNvbmZpZwoKIGFyY2gvbTY4ay9jb25maWdzL3N0bWFyazJfZGVmY29uZmlnIHwgICAy
ICsKIGRyaXZlcnMvaWlvL2RhYy9LY29uZmlnICAgICAgICAgICAgIHwgIDExICsrKwogZHJpdmVy
cy9paW8vZGFjL01ha2VmaWxlICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9paW8vZGFjL21j
ZjU0NDE1X2RhYy5jICAgICAgfCAxODMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiA0IGZpbGVzIGNoYW5nZWQsIDE5NyBpbnNlcnRpb25zKCspCi0tLQpiYXNlLWNvbW1pdDog
ZDQzYzc2YjFmZDg1Y2Y2ZjlhNTMxNDVlZDM5N2QxMGU3NmY5OTIxMwpjaGFuZ2UtaWQ6IDIwMjYw
NDMwLXdpcC1zdG1hcmsyLWRhYy03MDYwZjQ5ZGQ5NGYKCkJlc3QgcmVnYXJkcywKLS0gIApBbmdl
bG8gRHVyZWdoZWxsbyA8YWR1cmVnaGVsbG9AYmF5bGlicmUuY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
