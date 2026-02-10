Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJcXMw6Ii2lWVgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 20:33:34 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E31111EA61
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 20:33:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F693C87EC0;
	Tue, 10 Feb 2026 19:33:34 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB85BC87EC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 19:33:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4806dffc64cso52461315e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 11:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770752012; x=1771356812;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qIMZFFlxNoDMAobvvtg+Lzsbavm4DstY/euvQFPaAC4=;
 b=BsWR38HSDZ3Y8F0F7eeONZXWWeYbrXDU8gUiuwdsWaHlNwJR1P5b88/mdL/Okwdhtz
 TpUg1BcoCwSm0veuenvBVo1kR2VXXLOoO/sB6v63foxHVJekXv6AZx4Bnk6+ovIZVbJj
 yX7yyI1c+PM7chehAmEYPUxSkRVMIwWqDqaGGjt/V53Lned+eaDFXr0mK1SAis/axXoc
 44y+rza9Wgbt2McQ3eUSpTl98vFo36O5cldlqrU4N+z9mlEgSG1gsUydG7uIVNn+q8zS
 5ZNmtFqp+tj3/G4NPVD5Zf0Z6X2I/7uddBu8pifihnBVaWCAtSDNPMjh197vhYt3QMLA
 kC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770752012; x=1771356812;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qIMZFFlxNoDMAobvvtg+Lzsbavm4DstY/euvQFPaAC4=;
 b=VsQP23F+H/zmhnL64bM9fbembeaoUb0bucwWeO/8+fdNz2qUYgPVN9PtDovY227AIU
 LOKy/8HiYHyUDJ/l7oLp72FqTHii3jrpsR/Fws8MPB7EKlClsEKROG3gjgrbsDXUVsJV
 hFhapbPwXyHRrNDiNaKhI+BI6cykVZj/zBiugp+SGixzCLjA0LJCR7Nz36ntmjITvs6e
 O8bWG4Zii6gWBBJiu6mRPnW4a4hhAPzi4+9tY4BfizKoMK+CH1nu40qG/SAvi1E6u/+U
 ZY4tWXNuKTd0Lm7v8rvbgVqPU2iqiLfGcNZb5M1qPk1a9Q6mgDmbcRKWYjdYU1K4rXLu
 3nWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCOR5gQF/PLA1SIcutF0XXhJG5vnG+MWlYoyumArBplx0iyX0FFrbXGfwvUVPwP1UZfbmWeBTnULxFYQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzOBe/D0J6toL5cxPk9vpMsaAC4Z7TYybLGzyirVNN7JyJrrttn
 UI0MRjowMg2OVx2CeBriFZLOy6670QAK0VsHMWTj/yE7Cb6BNzFpE2Nm
X-Gm-Gg: AZuq6aKHriwbTRcxUu1moey3QON+RntLru0r4MCBgJ7arEmHFRpH/4h7ixTNx7QJ0D2
 IqcWsmNUdn7zHe4mZID0DNmHBt/KVMYIPElGKpo7vO8bMEYuZeyOfGC3mjp2LkL+U2GM2p7rmXt
 ID7daDN3Srg4gAQlRF1Z+WhYddfZ7iWUEWIcf4vxztNTeantK3AlKnPuYCpjWB2G4j+DISvcSrE
 D4+TbOko8th9FR2k/jAXjtjiS8sHvXVZ6RcQcyWlTO0NnMkvreVe7gamPCiOfweJc2vgpijxfdp
 Q4MkHGurp3afEgO3jZ5Hj/yNM0lkMvzM/tfWPwgTn239u/Axyp9W6rFPyGXq1RqRu4aDc3azAj1
 oBMhvyo5OXxYZi4j8icYYECIjKI29uD7d0Zkh86Khh2bT3n8Chd5UE4VWuCCvHuUPZZHFu/QMmR
 c/4OosYeY5d7PgBl4gpSJReMY6A3s2acEnGVEaZwi4IupfcYVfv92IA44X/d4=
X-Received: by 2002:a05:600c:1548:b0:480:1e9e:f9c with SMTP id
 5b1f17b1804b1-48320933613mr219892995e9.10.1770752012271; 
 Tue, 10 Feb 2026 11:33:32 -0800 (PST)
Received: from localhost (39.31.66.37.rev.sfr.net. [37.66.31.39])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7d55c9sm75779815e9.8.2026.02.10.11.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 11:33:31 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 10 Feb 2026 20:32:53 +0100
MIME-Version: 1.0
Message-Id: <20260210-b4-rcc-upstream-v9-2-17ca1db7613f@gmail.com>
References: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
In-Reply-To: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.15-dev-47773
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v9 2/3] clk: stm32mp25: add firewall
	grant_access ops
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
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com,foss.st.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:gabriel.fernandez@foss.st.com,m:devicetree@vger.kernel.org,m:clement.legoffic@foss.st.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:legoffic.clement@gmail.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:legofficclement@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[legofficclement@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,foss.st.com,st-md-mailman.stormreply.com,gmail.com,lists.infradead.org];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[legofficclement@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 9E31111EA61
X-Rspamd-Action: no action

RnJvbTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoK
T24gU1RNMzJNUDI1LCB0aGUgUkNDIHBlcmlwaGVyYWwgbWFuYWdlcyB0aGUgc2VjdXJlIGxldmVs
IG9mIHJlc291cmNlcwp0aGF0IGFyZSB1c2VkIGJ5IG90aGVyIGRldmljZXMgc3VjaCBhcyBjbG9j
a3MuCkRlY2xhcmUgdGhpcyBwZXJpcGhlcmFsIGFzIGEgZmlyZXdhbGwgY29udHJvbGxlci4KClNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0
LmNvbT4KUmV2aWV3ZWQtYnk6IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJyaWVsLmZlcm5hbmRlekBm
b3NzLnN0LmNvbT4KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5j
bGVtZW50QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDI1LmMg
fCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFu
Z2VkLCAzOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jbGsvc3RtMzIvY2xrLXN0bTMybXAyNS5jIGIvZHJpdmVycy9jbGsvc3RtMzIvY2xrLXN0bTMy
bXAyNS5jCmluZGV4IDUyZjBlOGExMjkyNi4uYWY0YmMwNmQ3MDNhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDI1LmMKKysrIGIvZHJpdmVycy9jbGsvc3RtMzIvY2xr
LXN0bTMybXAyNS5jCkBAIC00LDggKzQsMTAgQEAKICAqIEF1dGhvcjogR2FicmllbCBGZXJuYW5k
ZXogPGdhYnJpZWwuZmVybmFuZGV6QGZvc3Muc3QuY29tPiBmb3IgU1RNaWNyb2VsZWN0cm9uaWNz
LgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9idXMvc3RtMzJfZmlyZXdhbGwuaD4KICNpbmNsdWRl
IDxsaW51eC9idXMvc3RtMzJfZmlyZXdhbGxfZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvY2xr
LXByb3ZpZGVyLmg+CisjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgv
aW8uaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KIApAQCAtMTYwMiw2ICsx
NjA0LDExIEBAIHN0YXRpYyBpbnQgc3RtMzJfcmNjX2dldF9hY2Nlc3Modm9pZCBfX2lvbWVtICpi
YXNlLCB1MzIgaW5kZXgpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgc3RtMzJtcDI1X3Jj
Y19ncmFudF9hY2Nlc3Moc3RydWN0IHN0bTMyX2ZpcmV3YWxsX2NvbnRyb2xsZXIgKmN0cmwsIHUz
MiBmaXJld2FsbF9pZCkKK3sKKwlyZXR1cm4gc3RtMzJfcmNjX2dldF9hY2Nlc3MoY3RybC0+bW1p
bywgZmlyZXdhbGxfaWQpOworfQorCiBzdGF0aWMgaW50IHN0bTMybXAyNV9jaGVja19zZWN1cml0
eShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCB2b2lkIF9faW9tZW0gKmJhc2UsCiAJCQkJICAgIGNv
bnN0IHN0cnVjdCBjbG9ja19jb25maWcgKmNmZykKIHsKQEAgLTE5NzAsNiArMTk3Nyw3IEBAIE1P
RFVMRV9ERVZJQ0VfVEFCTEUob2YsIHN0bTMybXAyNV9tYXRjaF9kYXRhKTsKIAogc3RhdGljIGlu
dCBzdG0zMm1wMjVfcmNjX2Nsb2Nrc19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogeworCXN0cnVjdCBzdG0zMl9maXJld2FsbF9jb250cm9sbGVyICpyY2NfY29udHJvbGxlcjsK
IAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCXZvaWQgX19pb21lbSAqYmFzZTsK
IAlpbnQgcmV0OwpAQCAtMTk4Miw3ICsxOTkwLDM2IEBAIHN0YXRpYyBpbnQgc3RtMzJtcDI1X3Jj
Y19jbG9ja3NfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAocmV0KQog
CQlyZXR1cm4gcmV0OwogCi0JcmV0dXJuIHN0bTMyX3JjY19pbml0KGRldiwgc3RtMzJtcDI1X21h
dGNoX2RhdGEsIGJhc2UpOworCXJldCA9IHN0bTMyX3JjY19pbml0KGRldiwgc3RtMzJtcDI1X21h
dGNoX2RhdGEsIGJhc2UpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlyY2NfY29udHJv
bGxlciA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnJjY19jb250cm9sbGVyKSwg
R0ZQX0tFUk5FTCk7CisJaWYgKCFyY2NfY29udHJvbGxlcikKKwkJcmV0dXJuIC1FTk9NRU07CisK
KwlyY2NfY29udHJvbGxlci0+ZGV2ID0gZGV2OworCXJjY19jb250cm9sbGVyLT5tbWlvID0gYmFz
ZTsKKwlyY2NfY29udHJvbGxlci0+bmFtZSA9IGRldl9kcml2ZXJfc3RyaW5nKGRldik7CisJcmNj
X2NvbnRyb2xsZXItPnR5cGUgPSBTVE0zMl9QRVJJUEhFUkFMX0ZJUkVXQUxMOworCXJjY19jb250
cm9sbGVyLT5ncmFudF9hY2Nlc3MgPSBzdG0zMm1wMjVfcmNjX2dyYW50X2FjY2VzczsKKworCXBs
YXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHJjY19jb250cm9sbGVyKTsKKworCXJldCA9IHN0bTMy
X2ZpcmV3YWxsX2NvbnRyb2xsZXJfcmVnaXN0ZXIocmNjX2NvbnRyb2xsZXIpOworCWlmIChyZXQp
IHsKKwkJZGV2X2VycihkZXYsICJDb3VsZG4ndCByZWdpc3RlciBhcyBhIGZpcmV3YWxsIGNvbnRy
b2xsZXI6ICVkXG4iLCByZXQpOworCQlyZXR1cm4gcmV0OworCX0KKworCXJldHVybiAwOworfQor
CitzdGF0aWMgdm9pZCBzdG0zMm1wMjVfcmNjX2Nsb2Nrc19yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKK3sKKwlzdHJ1Y3Qgc3RtMzJfZmlyZXdhbGxfY29udHJvbGxlciAqcmNj
X2NvbnRyb2xsZXIgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKKworCXN0bTMyX2ZpcmV3
YWxsX2NvbnRyb2xsZXJfdW5yZWdpc3RlcihyY2NfY29udHJvbGxlcik7CiB9CiAKIHN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMybXAyNV9yY2NfY2xvY2tzX2RyaXZlciA9IHsKQEAg
LTE5OTEsNiArMjAyOCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMybXAy
NV9yY2NfY2xvY2tzX2RyaXZlciA9IHsKIAkJLm9mX21hdGNoX3RhYmxlID0gc3RtMzJtcDI1X21h
dGNoX2RhdGEsCiAJfSwKIAkucHJvYmUgPSBzdG0zMm1wMjVfcmNjX2Nsb2Nrc19wcm9iZSwKKwku
cmVtb3ZlID0gc3RtMzJtcDI1X3JjY19jbG9ja3NfcmVtb3ZlLAogfTsKIAogc3RhdGljIGludCBf
X2luaXQgc3RtMzJtcDI1X2Nsb2Nrc19pbml0KHZvaWQpCgotLSAKMi41My4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
