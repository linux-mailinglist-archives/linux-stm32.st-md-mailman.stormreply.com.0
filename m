Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAwwHM7IEGpIdgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 23:21:18 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E69905BA507
	for <lists+linux-stm32@lfdr.de>; Fri, 22 May 2026 23:21:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84D9DC030CD;
	Fri, 22 May 2026 21:21:17 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45524C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 21:21:16 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4904fd4f6aeso1817695e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 14:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1779484875; x=1780089675;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3jZ2LpbUHZS3fbviqQINQwiQlZjuFtm/3mFTRxLA3Dk=;
 b=Tg6wRaKR9AlY2g+tJnRl2GBLV+jd3QhaS+XQ9RH4789s1HaWHn4896vEni3JAXA5x4
 K0/w2633KXJoA1tXr2q3P6/ldGqWTZzWYK/jF5krqLK8mhqgCa7EXl3FtPdAVwgk7bc2
 TKWq75X3mCApfGHxW9DcTcxCA+VwsrkWTBMiyVTER05/wjc4+HRRin58An/LNB1CLhUa
 pj2+HWx3VcBsXKZdn+tfX2mXCTRGENNI01x8U48S/RoF7cmYWC63kM148WGqX1mrW4tk
 R4RB32EG7mYanj07glnTRbcZv+SSJRk49Hra7wqndOKMs4occQTNSTFQSDYjnQqoIdaS
 fzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779484875; x=1780089675;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3jZ2LpbUHZS3fbviqQINQwiQlZjuFtm/3mFTRxLA3Dk=;
 b=IO5JXt9hJc7B3ygyDiN0Z2JFcCKKfobHUMC42bdRlE/JAyFBEKAT581kXtRUKzZfbG
 UU8PHtdlqleb3s4/+kqK/o2c+sV0+h4V9+dkg70TY0/3QobHjPtLseP3OwmU2/OnaP7i
 edWcv6WIKg9hFe0eDob3fgM8zbxoI5pjCE9OwxCv19DhS0m0S+Sjt3njM81nA/BAhwpf
 I8QpI07zWDldpxfkqeaQwK0PZK1b2LnUP+oMWWU/HIB7pUWlekdIsGRDH1NhwCxklpAK
 bwEDbXVJr+Njv83wHg/aJnOWbFqydsXg/pK6+wuYhkdhQjY9Fe54VvyBZyJv/+wDJf7L
 7eDA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/2cKchPJWF95PY2E0BQqAMc5SQ4vdkFhLPGCSlH/4pk6dmyX45cgY36K649CB/44XRjy+NhdBaxU5+cA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy3RdDxU7I0m3KUkc0SEPgnwjzgVGVHWseN/HS30sT06yzjQqrm
 TX4qwiBqyHsZ5dPEBVoamZF7IfA6lfmcFIlMBZkxePU2/XkXHvgFnp+G0zf71c4XmWI=
X-Gm-Gg: Acq92OHjneGaB9t4EnronZT4aEgwuZ2YACybo1GLUFK0J39ng/+KTlIzDI337RpUCBO
 RU5KZG/+WT5MG0ToSnKNwr4aUZAC2zhJDsvmcGCdg4aefY2mGH3Y2ChEqRTvwBXY6lKVeEPHp3f
 /feNBS1+R2iPoqL179Zz996tbnxZPX/lLihX8oGaT4wCLDx+9DleoucEnCeLXimFPtSabAEKGLv
 2NvEXIIq7ARTsf8TM1JcVgCFr2XP4SiBDksPkoDVjs/z7c03Eh39sz55Cp+wx870DzeiMf4pjGi
 q0wpaudVUUQn9uZcxc2oi8+TdEdAHSQjY+At+NRQX9ktiAYIJdo03F0anTigvtub7pdVLKFlecI
 t7Q3hCi4UZ3GPOZqv6zr0I3W7TNjg0pmve6z+8jP7MRge3Uyq6XVWyi/LL8CgllAlt+UBsO8d7I
 tIzYUTNi6qBTDAmDxJHMJf3WPkxAKx6FM=
X-Received: by 2002:a05:600c:46cb:b0:489:1c1f:35f1 with SMTP id
 5b1f17b1804b1-49042482762mr77587885e9.4.1779484875487; 
 Fri, 22 May 2026 14:21:15 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 14:21:15 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:28 +0200
Message-Id: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOTU7DMBAF4KtUXmM0/kuTrnqPisVkPKYG2lR2C
 FRV7o6dLiqgiOWT5n1vLiJzipzFZnURiaeY43AswTysBO3x+Mwy+pKFBt2ANSA/4knm8YDpVUu
 PJNfQQLCd950NorROiUP8XMTd0zXn9/6FaaxMvdjHPA7pvExOut79rU9agmSDoW1asoBq2+P5L
 faJH2k4VG2pOmXuVwN5ZAcUnMLv1frbZG7rDuxvwhQCnLaoAiky6g6h/iFUIdq1JdOg7RT4H8Q
 8z1+hJ30XhAEAAA==
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
Subject: [Linux-stm32] [PATCH v3 00/11] add mcf54415 DAC driver
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_COUNT_THREE(0.00)[4];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.802];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: E69905BA507
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VGhpcyBwYXRjaHNldCBhZGRzIGEgbWluaW1hbGlzdGljIERBQyBkcml2ZXIgZm9yIHRoZSBOWFAg
bWNmNTQ0MTUvNi83LzgKaWJ1aWx0aW4gREFDcy4KCkN1cnJlbnRseSB0aGUgZHJpdmVyIGVuYWJs
ZXMgdGhlIHJhdyB3cml0ZSBvbmx5LiBGZWF0dXJlIGFzIGRtYSwgc3luYywgb3IKZm9ybWF0IGFy
ZSBub3Qgc3Vwb3BydGVkIGZvciB0aGlzIHZlcnNpb24uCgpBZGRpdGlvbmFsIG9wdGlvbnMgc3Vw
cG9lcnRlZCBieSB0aGUgREFDIG1vZHVsZSB3aWxsIGJlIGFkZGVkIHRvIHRoZSBkcml2ZXIKbGF0
ZXIgb24sIGFzIG5lZWRlZC4KClRoZSBzYW1lIHBhdGNoc2V0IHByZXBhcmVzIHRoZSBtNjhrL2Nv
bGRmaXJlIGFyY2hpdGVjdHVyZSB0byBzdXBwb3J0CnRoZSBkcml2ZXIuCgpCZWxvdyBzb2VtIGJh
c2ljIHRlc3RzIGRvbmUgb24gc3RtYXJrMiBtY2Y1NDQxNS1iYXNlZCBib2FyZCwgdm9sdGFnZSBj
aGVjawpvbiBEQUMwIGFuZCBEQUMxOgoKfiAjIGNkIC9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpk
ZXZpY2UwLwovc3lzL2J1cy9paW8vZGV2aWNlcy9paW86ZGV2aWNlMCAjIGxzCm5hbWUgICAgICAg
ICAgICAgICBvdXRfdm9sdGFnZV9zY2FsZSAgdWV2ZW50Cm91dF92b2x0YWdlX3JhdyAgICBzdWJz
eXN0ZW0KL3N5cy9idXMvaWlvL2RldmljZXMvaWlvOmRldmljZTAgIyBjYXQgbmFtZQptY2Y1NDQx
NQovc3lzL2J1cy9paW8vZGV2aWNlcy9paW86ZGV2aWNlMCAjIGVjaG8gNDA5NSA+IG91dF92b2x0
YWdlX3JhdyAKL3N5cy9idXMvaWlvL2RldmljZXMvaWlvOmRldmljZTAgIyBlY2hvIDIwNDggPiBv
dXRfdm9sdGFnZV9yYXcgCi9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpkZXZpY2UwICMgZWNobyA0
MDk2ID4gb3V0X3ZvbHRhZ2VfcmF3IApzaDogd3JpdGUgZXJyb3I6IEludmFsaWQgYXJndW1lbnQK
L3N5cy9idXMvaWlvL2RldmljZXMvaWlvOmRldmljZTAgIyBjYXQgb3V0X3ZvbHRhZ2VfcmF3IAoy
MDQ4Ci9zeXMvYnVzL2lpby9kZXZpY2VzL2lpbzpkZXZpY2UwICMgCgpTYW1lIGJlaGF2aW9yIGZv
ciAvc3lzL2J1cy9paW8vZGV2aWNlcy9paW86ZGV2aWNlMS4KCkdlbmVyYXRlZCBhIHNpbmUgd2F2
ZSBieSBzaGVsbCBzY3JpcHQsIHNpbmUgc2hhcGUgaXMgZ29vZC4KCmlzIGFjdHVhbGx5IGluIHBy
b2dyZXNzOgoKTm90ZTogdGhpcyBwYXRjaHNldCBkZXBlbmRzIG9uIG1ldyBtY2ZfcmVhZC9tY2Zf
d3JpdGUgaW1wbGVtZW50YXRpb24gdGhhdApMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1tNjhrLzIwOWQwNjUzLTYzODYtNGI2NC05ZTE1LWUzNThmODQ0NTNhYkBhcHAuZmFzdG1h
aWwuY29tL1QvI3QKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbTY4ay8yMDI2
MDUwNjE0MjY0NC4zMjM0MjcwLTItZ2VyZ0BrZXJuZWwub3JnLwotLS0KQ2hhbmdlcyBpbiB2MzoK
LSBrZWVwaW5nIGNoYW5nZWxvZyBpbiBlYWNoIHNpbmdsZSBwYXRjaCwgd2hlcmUgYW55Ci0gTGlu
ayB0byB2MjogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNTEzLXdpcC1zdG1hcmsyLWRh
Yy12Mi0wLWZjZGFlNTBjZjUxYUBiYXlsaWJyZS5jb20KCkNoYW5nZXMgaW4gdjI6Ci0ga2VlcGlu
ZyBjaGFuZ2Vsb2cgaW4gZWFjaCBzaW5nbGUgcGF0Y2gsIHdoZXJlIGFueQotIExpbmsgdG8gdjE6
IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDUwNC13aXAtc3RtYXJrMi1kYWMtdjEtMC04
NzRjMzZhNDkxMGRAYmF5bGlicmUuY29tCgpUbzogR3JlZyBVbmdlcmVyIDxnZXJnQGxpbnV4LW02
OGsub3JnPgpUbzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KVG86
IFN0ZXZlbiBLaW5nIDxzZmtpbmdAZmR3ZGMuY29tPgpUbzogQXJuZCBCZXJnbWFubiA8YXJuZEBh
cm5kYi5kZT4KVG86IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT4K
VG86IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+ClRvOiBK
b25hdGhhbiBDYW1lcm9uIDxqaWMyM0BrZXJuZWwub3JnPgpUbzogRGF2aWQgTGVjaG5lciA8ZGxl
Y2huZXJAYmF5bGlicmUuY29tPgpUbzogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KVG86
IEFuZHkgU2hldmNoZW5rbyA8YW5keUBrZXJuZWwub3JnPgpDYzogR3JlZyBVbmdlcmVyIDxnZXJn
QHVjbGludXgub3JnPgpDYzogbGludXgtbTY4a0BsaXN0cy5saW51eC1tNjhrLm9yZwpDYzogbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNj
OiBsaW51eC1paW9Admdlci5rZXJuZWwub3JnCgotLS0KQW5nZWxvIER1cmVnaGVsbG8gKDExKToK
ICAgICAgbTY4azogbWNmNTQ0MXg6IGZpeCBjbG9ja3MgbnVtYmVyaW5nCiAgICAgIG02OGs6IG1j
ZjU0NDF4OiBhZGQgY2xvY2sgZm9yIERBQyBjaGFubmVsIDEKICAgICAgbTY4azogbWNmNTQ0MXg6
IGluaXRpYWxpemUgREFDIGNsb2NrcyBieSBpaW8gREFDIGRyaXZlciBuYW1lCiAgICAgIG02OGs6
IGRlZmNvbmZpZzogdXBkYXRlIHN0bWFyazIgZGVmY29uZmlnCiAgICAgIG02OGs6IGFkZCBEQUMg
bW9kdWxlcyBiYXNlIGFkZHJlc3NlcwogICAgICBtNjhrOiBtY2Y1NDQxeDogYWRkIENDTSByZWdp
c3RlcnMKICAgICAgbTY4azogbWNmNTQ0MXg6IGFkZCBDQ1IgTUlTQ0NSMiBiaXRmaWVsZHMKICAg
ICAgbTY4azogc3RtYXJrMjogdXNlIGlvcG9ydC5oIG1hY3JvcyBmb3IgcmVzb3VyY2VzCiAgICAg
IG02OGs6IHN0bWFyazI6IGFkZCBtY2Y1NDQxeCBEQUMgcGxhdGZvcm0gZGV2aWNlcwogICAgICBt
NjhrOiBzdG1hcmsyOiBlbmFibGUgREFDcyBvdXRwdXRzCiAgICAgIGlpbzogZGFjOiBhZGQgbWNm
NTQ0MTUgREFDCgogYXJjaC9tNjhrL2NvbGRmaXJlL201NDQxeC5jICAgICAgICAgfCAgMjEgKyst
LQogYXJjaC9tNjhrL2NvbGRmaXJlL3N0bWFyazIuYyAgICAgICAgfCAgNDcgKysrKystLS0KIGFy
Y2gvbTY4ay9jb25maWdzL3N0bWFyazJfZGVmY29uZmlnIHwgICAyICsKIGFyY2gvbTY4ay9pbmNs
dWRlL2FzbS9tNTQ0MXhzaW0uaCAgIHwgIDQyICsrKysrKysrCiBkcml2ZXJzL2lpby9kYWMvS2Nv
bmZpZyAgICAgICAgICAgICB8ICAxMSArKwogZHJpdmVycy9paW8vZGFjL01ha2VmaWxlICAgICAg
ICAgICAgfCAgIDEgKwogZHJpdmVycy9paW8vZGFjL21jZjU0NDE1X2RhYy5jICAgICAgfCAyMDcg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiA3IGZpbGVzIGNoYW5nZWQsIDMw
NyBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiA5ZWRmNDE4
M2YwZDMyMTQ2YjcwODIyMGQ1NmVlMmQzNTkwNWJhNTE2CmNoYW5nZS1pZDogMjAyNjA0MzAtd2lw
LXN0bWFyazItZGFjLTcwNjBmNDlkZDk0ZgoKQmVzdCByZWdhcmRzLAotLSAgCkFuZ2VsbyBEdXJl
Z2hlbGxvIDxhZHVyZWdoZWxsb0BiYXlsaWJyZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
