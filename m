Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MGNDQlTHGqTMgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 17:26:01 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F7616D0B
	for <lists+linux-stm32@lfdr.de>; Sun, 31 May 2026 17:25:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EED7C8F29C;
	Sun, 31 May 2026 15:25:59 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78CF3C8F296
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 15:25:58 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-45efa0326fdso852254f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 31 May 2026 08:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1780241158; x=1780845958;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DG2xp1hSIJeTvHYY9toNTecy4Wvd4sNJMjvyyolvm+4=;
 b=T0dtuFVsdXVyQ7NV6ZK6Eptx5Y6TD34cP8xIPCTNunr+kad3MM2aHopL5K9Oe/YMfi
 RyLzKoZcwUOJMq+SRL1R5PezJ3uvzDsPe2SqA+Mb9a1HYGzgAV4KxHVJAZupEF1v3Gi4
 5E62GC53x9k2ZsoPWQuS60TYwIbGZj2SgsvYmiqOxqBeo7W0nLGgFAzccBbgvoUazf0I
 eSbZ5F4xAG04Xxx9NYb1VXy707XJA3f7Ao5PjDyMA+JTFXymSl29hx53ZRae1WawbGDN
 6ks+aaOgqIjlvRN4vB/y+QRF/k8L9YH2FhMqi+PUZwPp4elWvQc2vmQYyLGGNeSVKmlI
 z7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780241158; x=1780845958;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DG2xp1hSIJeTvHYY9toNTecy4Wvd4sNJMjvyyolvm+4=;
 b=QK/+Yy4wd28JjMf0hKuqLL0JMRNCyrOL151l/OJ8p7TqcG3uxiBTkRZ57nglF+w4o/
 mD02K9/3W/EoQ1VJkZtHBStsBA/Sok9iHUsKA229RUvI1dfCstIlmK9Fqg+8zDtbJfyA
 th9Ful+KxNc2Yd/fnPVv6mhp063FZSBMitqps3ZhS7izDgsGEvnmjwfSkUDYB6hdLyZF
 oTkBAUrneNALXd8XJLYCOsQjgtyqBi3YTMe8T9ntv3i2YiSVhW9wlWXpBH3rVwDx/KHM
 jqjRwKkbnFH65L1qa84d3o+qsxhnuuV1Q0GfytncZTFc73bqrFcOMWNYxxG/+rXdmxYp
 PxGA==
X-Forwarded-Encrypted: i=1;
 AFNElJ++nzvNMKJqN9Xw4dNdwCbzNI/nFwwZPn1G6rvcM+SYKNlAHtI3Gh942NL8hmVB76mWIjHNDkr6bGcq7A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxuyl8D8cOEIeei8MUq2o8+DDZ9hMSweVeeres22G0YIF26PzKu
 rbuf6cHCmpFybQGCVdMpMpNk4idtI2g1NH6m3OPhixHLrLZ8vVm69n6F9j6slIGHJ4s=
X-Gm-Gg: Acq92OGCEoBfMIKoG6k0PB4hqIFsKg12bkJ979yJkTJZTuaTSTSEm0JkneayAGY+3xc
 WWK0bQC+o00qK/LkMHmw96cRtKZDDB2A6CQKORc/Xr7YokKDASXSAHjoPwx/GRTCdtVIETtVIGu
 LiJ9mNaAmMZmXppasCu4a2+6+iEGTLaX3JUivELTEXA2fHy3C/A9lI+5JLrTrjzh1a4gMPdvBd3
 u2+cygjq0cBfsr8MgjKNJCdL4jsrx4YORjVTrohHNI3xhP4BUJ7ssHimzUuErjEkdpPtGL12/Mp
 X30GrCVuqBVrL7C6cLlEMSypQB8BQTF3D54QTDZGDiV0sbmdhiKeZbGy0CSRmltM/3QQpiQPk8Q
 6xilGGEJsubJ/8TBWK9Ql6wXTX35qFF+Ra4hvxisg0FLUXzurYv2VBQ+ADbwXMoDnmC7tiT/8bI
 RR9ZydClVpUhWmw4GyKFEC+fDiY/ErieGBe5dzppib4g==
X-Received: by 2002:a05:6000:2581:b0:45e:f8d0:d22c with SMTP id
 ffacd0b85a97d-45ef8d0d485mr12474042f8f.25.1780241157769; 
 Sun, 31 May 2026 08:25:57 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2026 08:25:57 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:25:53 +0200
Message-Id: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOzU7DMBAGX6XyGaP1bxJOvAfisFmvqYE2lR0CV
 ZV3xwkHBKTi+Ek7M3sRhXPiIu52F5F5SiUNxzrszU7QHo9PLFOoW2jQHqwB+Z5OsowHzC9aBiT
 ZgIdouxA6G0WlTplj+liND49fu7z1z0zjolku9qmMQz6vyUkvd9ftk5Yg2WBsfUsWUN33eH5Nf
 eZbGg6LbUWdMttopIDsgKJT+BNdfpvMd92B/aswVQFOW1SRFJlrda23UeV7BgzGoW826uqfuqq
 KtrFkPNpOQfilmOf5E18HIxq/AQAA
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
Subject: [Linux-stm32] [PATCH v4 00/11] add mcf54415 DAC driver
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
	NEURAL_SPAM(0.00)[0.585];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 492F7616D0B
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
MDUwNjE0MjY0NC4zMjM0MjcwLTItZ2VyZ0BrZXJuZWwub3JnLwotLS0KQ2hhbmdlcyBpbiB2NDoK
LSBrZWVwaW5nIGNoYW5nZWxvZyBpbiBlYWNoIHNpbmdsZSBwYXRjaCwgd2hlcmUgYW55Ci0gTGlu
ayB0byB2MzogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNTIyLXdpcC1zdG1hcmsyLWRh
Yy12My0wLTE2YmUwYWQzNWE2N0BiYXlsaWJyZS5jb20KCkNoYW5nZXMgaW4gdjM6Ci0ga2VlcGlu
ZyBjaGFuZ2Vsb2cgaW4gZWFjaCBzaW5nbGUgcGF0Y2gsIHdoZXJlIGFueQotIExpbmsgdG8gdjI6
IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDUxMy13aXAtc3RtYXJrMi1kYWMtdjItMC1m
Y2RhZTUwY2Y1MWFAYmF5bGlicmUuY29tCgpDaGFuZ2VzIGluIHYyOgotIGtlZXBpbmcgY2hhbmdl
bG9nIGluIGVhY2ggc2luZ2xlIHBhdGNoLCB3aGVyZSBhbnkKLSBMaW5rIHRvIHYxOiBodHRwczov
L3BhdGNoLm1zZ2lkLmxpbmsvMjAyNjA1MDQtd2lwLXN0bWFyazItZGFjLXYxLTAtODc0YzM2YTQ5
MTBkQGJheWxpYnJlLmNvbQoKVG86IEdyZWcgVW5nZXJlciA8Z2VyZ0BsaW51eC1tNjhrLm9yZz4K
VG86IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+ClRvOiBTdGV2ZW4g
S2luZyA8c2ZraW5nQGZkd2RjLmNvbT4KVG86IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
ClRvOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+ClRvOiBBbGV4
YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgpUbzogSm9uYXRoYW4g
Q2FtZXJvbiA8amljMjNAa2VybmVsLm9yZz4KVG86IERhdmlkIExlY2huZXIgPGRsZWNobmVyQGJh
eWxpYnJlLmNvbT4KVG86IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+ClRvOiBBbmR5IFNo
ZXZjaGVua28gPGFuZHlAa2VybmVsLm9yZz4KQ2M6IEdyZWcgVW5nZXJlciA8Z2VyZ0B1Y2xpbnV4
Lm9yZz4KQ2M6IGxpbnV4LW02OGtAbGlzdHMubGludXgtbTY4ay5vcmcKQ2M6IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgt
aWlvQHZnZXIua2VybmVsLm9yZwoKLS0tCkFuZ2VsbyBEdXJlZ2hlbGxvICgxMSk6CiAgICAgIG02
OGs6IG1jZjU0NDF4OiBmaXggY2xvY2tzIG51bWJlcmluZwogICAgICBtNjhrOiBtY2Y1NDQxeDog
YWRkIGNsb2NrIGZvciBEQUMgY2hhbm5lbCAxCiAgICAgIG02OGs6IG1jZjU0NDF4OiBpbml0aWFs
aXplIERBQyBjbG9ja3MgYnkgaWlvIERBQyBkcml2ZXIgbmFtZQogICAgICBtNjhrOiBkZWZjb25m
aWc6IHVwZGF0ZSBzdG1hcmsyIGRlZmNvbmZpZwogICAgICBtNjhrOiBhZGQgREFDIG1vZHVsZXMg
YmFzZSBhZGRyZXNzZXMKICAgICAgbTY4azogbWNmNTQ0MXg6IGFkZCBDQ00gcmVnaXN0ZXJzCiAg
ICAgIG02OGs6IG1jZjU0NDF4OiBhZGQgQ0NSIE1JU0NDUjIgYml0ZmllbGRzCiAgICAgIG02OGs6
IHN0bWFyazI6IHVzZSBpb3BvcnQuaCBtYWNyb3MgZm9yIHJlc291cmNlcwogICAgICBtNjhrOiBz
dG1hcmsyOiBhZGQgbWNmNTQ0MXggREFDIHBsYXRmb3JtIGRldmljZXMKICAgICAgbTY4azogc3Rt
YXJrMjogZW5hYmxlIERBQ3Mgb3V0cHV0cwogICAgICBpaW86IGRhYzogYWRkIG1jZjU0NDE1IERB
QwoKIGFyY2gvbTY4ay9jb2xkZmlyZS9tNTQ0MXguYyAgICAgICAgIHwgIDIxICsrLS0KIGFyY2gv
bTY4ay9jb2xkZmlyZS9zdG1hcmsyLmMgICAgICAgIHwgIDQ3ICsrKysrLS0tCiBhcmNoL202OGsv
Y29uZmlncy9zdG1hcmsyX2RlZmNvbmZpZyB8ICAgMiArCiBhcmNoL202OGsvaW5jbHVkZS9hc20v
bTU0NDF4c2ltLmggICB8ICA0MiArKysrKysrCiBkcml2ZXJzL2lpby9kYWMvS2NvbmZpZyAgICAg
ICAgICAgICB8ICAxMSArKwogZHJpdmVycy9paW8vZGFjL01ha2VmaWxlICAgICAgICAgICAgfCAg
IDEgKwogZHJpdmVycy9paW8vZGFjL21jZjU0NDE1X2RhYy5jICAgICAgfCAyMTEgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiA3IGZpbGVzIGNoYW5nZWQsIDMxMSBpbnNlcnRp
b25zKCspLCAyNCBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiA5ZWRmNDE4M2YwZDMyMTQ2
YjcwODIyMGQ1NmVlMmQzNTkwNWJhNTE2CmNoYW5nZS1pZDogMjAyNjA0MzAtd2lwLXN0bWFyazIt
ZGFjLTcwNjBmNDlkZDk0ZgoKQmVzdCByZWdhcmRzLAotLSAgCkFuZ2VsbyBEdXJlZ2hlbGxvIDxh
ZHVyZWdoZWxsb0BiYXlsaWJyZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
