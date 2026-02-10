Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJpvAA2Ii2lWVgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 20:33:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C66411EA53
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 20:33:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D1DAC87EC0;
	Tue, 10 Feb 2026 19:33:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48A43C87EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 19:33:31 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4362507f0bcso110159f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 11:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770752010; x=1771356810;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=erTmcC4BRsN72TnU7ILsQhSKr9ooULobI3aSeUy7isI=;
 b=ZeMvTdJeFBA2AhAv9BIzg7+aiEmgLSU6rBS5ZJKw1cinIoifua2vYLDPUPqAish2G/
 Yvo0AkzNd3Zor8oLKUTOtgdsEX/TwnAOwDCN6C6+LTmp9DJGQMzrRxy7Ax06/qPtZfqc
 WEc15nmmQel5p1EvsrxMBrtqJwJLWuv/0N6vcTerMDlEOcrY9U4CfPT3r+bemgvJ3vSp
 lzdNP7R8/N9kNBoxeKtSHMUbabMROgyaqtnCqYuNleUwN8BOFkoWT5k6faqG3Cd3eaCm
 dtjbO4yEfKlNRXtjM5l/O01lREWX+ZJHngcwXPRW89GvmI+OYENz3wYM8nQAIcwbYVFk
 07Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770752010; x=1771356810;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erTmcC4BRsN72TnU7ILsQhSKr9ooULobI3aSeUy7isI=;
 b=qiGgkGU1KNsTsgh/8PqxvwEB6KJGKm0OYM9cxwj0r2LCSCbqt6+ePtjHf9trmwkgre
 j6Zsek2duQMU9lnpfKJtz3x/adXrtEhfiElruEhjkQhjs9UrkOqVk5+/QiYoQeGA6oKH
 Xh01oEYebuRk1Tg3z1s6JUcoFNewh6Y2sviQqfBHN/CZFOYPrJwuFhjO8/dzzE+mtkJA
 sUoQ78I6A0a4MlqrDFS7OdRyRdAmwvim4f2aDinm9gXFWk5+DCrYvhUXLn6tT0OqBjit
 rG4OBY6SMfFtRCMPyh/7jejrmVc2HL2tknrnwApwFE/y3lV+ZsUKUM0PfRIXn5Utz9rE
 w7rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4J7Ag6LLp/hBGYQfd+oUUMyMdohowNi6dEecQJzAxur9SrzNp4zvcp7RLk2qJv2WNf6NlOJ22aNitvQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz/xNQfHNuC+6/hpdgr44CPDWztVtUqm8y4ykWehOok8MNw62Fs
 EPAmtmGQrvxSYQdk6sohS6rYmD8g3115QK73BmhLJtuhkHVCPpSJkv8X
X-Gm-Gg: AZuq6aJL68CMgROgFMOVjLiXkyxOaWGhc3AjWvPBypQyj2Ie63iZU8yyUcNz3vctP8L
 ik1Wfv0PSEaqJ22+u7McjT/dlDen2LV+UQT/dqas9+S4Q8GQNdjXAxyHIB2ER+B3m/msj1e76a7
 N3Btfq7/V7btKSEPgX6A7HPYH1xaP6rbjFWjAEBHdFZajkS4A2glGH00YH5Y9BrN3kyBu3E2REB
 rknPUIObjcApM3apqvoQKMvhhThWFDueT1W6yiOfuR1BKJvQJ/ul5sHaQ6HPbLTbGLWZxKPDk4M
 uCxgsBgGNTfTRfNv/6xn/8IBLHxxH8O9pl/uK5YSjDvgsV+LuWJIeVGC+Gn47OO4biJg1ls4HGU
 afVX2ENKl/aFdcUKgcIsE3KpwXkVUAUcm7aXbbGEblVOQxgJpB2imYONJY+dfhuvBWous/MUZ3Q
 5pEOI3tom8popRqm/U1gmooirE523WC7Vn3W/5mccR1u8xzoIF
X-Received: by 2002:a05:6000:1847:b0:435:8dd5:ad4f with SMTP id
 ffacd0b85a97d-43779e433b6mr5594134f8f.9.1770752010474; 
 Tue, 10 Feb 2026 11:33:30 -0800 (PST)
Received: from localhost (39.31.66.37.rev.sfr.net. [37.66.31.39])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4362972fc26sm34029966f8f.22.2026.02.10.11.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 11:33:30 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 10 Feb 2026 20:32:51 +0100
Message-Id: <20260210-b4-rcc-upstream-v9-0-17ca1db7613f@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WPQW7DIBBFr2KxLhVgwGOveo+qiwGGBCmOU3DcV
 pHvXmovainLP9J7evNghXKiwobmwTItqaTpWkf/0jB/xuuJeAp1MyWUEb203Gmevef3W5kz4cg
 BgbDFaFEEVqlbppi+N+P7x74zfd6reN6PzGEh7qdxTPPQCBM7gh5d37XSWBMAraLWmSDJK2E1G
 CInHDsGDc0xJ6ZMX3i5/DeFSGAAUMkIwwLsr+Ocyjzln+3RpdtCdolSTz8tHRdcheg1CQlRi7f
 TiOnyWqM3V1UeeP3MQ+Vdq4K2sZPYwpFf1/UXYDjcDnYBAAA=
X-Change-ID: 20250916-b4-rcc-upstream-8a8ea3af6a0d
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
Subject: [Linux-stm32] [PATCH v9 0/3] Register the STM32MP25 RCC driver as
 an access controller.
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,gmail.com,foss.st.com];
	FORGED_SENDER(0.00)[legofficclement@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:gabriel.fernandez@foss.st.com,m:devicetree@vger.kernel.org,m:clement.legoffic@foss.st.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:legoffic.clement@gmail.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:legofficclement@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 9C66411EA53
X-Rspamd-Action: no action

VGhlIFNUTTMyTVAyNSBSQ0MgcGVyaXBoZXJhbCBhcyBhbiBhY2Nlc3MgY29udHJvbGxlciBpcyBh
bGxvd2VkIHRvIGtub3cKd2hldGhlciB0aGUgY2xvY2tzIGFyZSBzZWN1cmVkIG9yIG5vdC4KVGhl
IFNUTTMyTVAyNSBSQ0MgcGVyaXBoZXJhbCBrbm93cyBhYm91dCB0aGUgY2xvY2sgc2VjdXJlIGNv
bmZpZ3VyYXRpb24Kb2YgYWxsIG5vbiBSSUYtYXdhcmUgcGVyaXBoZXJhbC4KSW4gcGFyYWxsZWwg
YWxsIHRoZSBSSUYtYXdhcmUgcGVyaXBoZXJhbCBjb25maWd1cmF0aW9uIGluZm9ybWF0aW9uCmFy
ZSBrbm93biBieSB0aGUgUklGU0MgcGVyaXBoZXJhbCB3aGljaCBpcyBhbHJlYWR5IGFuIGFjY2Vz
cwpjb250cm9sbGVyLgoKQ2hhbmdlcyBpbiB2OToKLSBSZWJhc2Ugb24gdjYuMTkuMAotIEFkZCBH
YWJyaWVsIEZlcm5hbmRleidzIFJldmlld2VkLWJ5Ci0gTGluayB0byB2ODogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI1MDkyNC1iNC1yY2MtdXBzdHJlYW0tdjgtMC1iMzJkNDZmNzFhMzhA
Z21haWwuY29tCgpDaGFuZ2VzIGluIHY4OgotIFVzZSB1cHBlcmNhc2UgZm9yIHBlcmlwaGVyYWwg
bmFtZSBpbiBjb21taXQgbWVzc2FnZQotIEFkZCB0aGUgJyNhY2Nlc3MtY29udHJvbGxlci1jZWxs
cycgcHJvcGVydHkgdG8gdGhlIFJDQyBpbgogIHN0bTMybXAyMzEuZHRzaQotIExpbmsgdG8gdjc6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA5MjItYjQtcmNjLXVwc3RyZWFtLXY3LTAt
MmRmYzRlMDE4ZjQwQGdtYWlsLmNvbQoKVGhlIHY3IGlzIGEgc3Vic2V0IG9mIHRoZSB2NiBhbmQg
b3RoZXIgcHJpb3IgdmVyc2lvbnMsIHNwbGl0IHRvIHNpbXBsaWZ5CnRoZSByZXZpZXcgYW5kIG1l
cmdpbmcgcHJvY2Vzcy4KCkNoYW5nZXMgaW4gdjc6Ci0gTm9uZQotIExpbmsgdG8gdjY6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDkwOS1iNC1kZHJwZXJmbS11cHN0cmVhbS12Ni0y
LWNlMDgyY2M4MDFiNUBnbWFpbC5jb20vCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2Zm
aWMgPGxlZ29mZmljLmNsZW1lbnRAZ21haWwuY29tPgotLS0KQ2zDqW1lbnQgTGUgR29mZmljICgz
KToKICAgICAgZHQtYmluZGluZ3M6IHN0bTMyOiBzdG0zMm1wMjU6IGFkZCBgI2FjY2Vzcy1jb250
cm9sbGVyLWNlbGxzYCBwcm9wZXJ0eQogICAgICBjbGs6IHN0bTMybXAyNTogYWRkIGZpcmV3YWxs
IGdyYW50X2FjY2VzcyBvcHMKICAgICAgYXJtNjQ6IGR0czogc3Q6IHNldCBSQ0MgYXMgYW4gYWNj
ZXNzLWNvbnRyb2xsZXIKCiAuLi4vYmluZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDI1LXJjYy55YW1s
ICAgICAgICAgICB8ICA3ICsrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDIzMS5k
dHNpICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUx
LmR0c2kgICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDI1
LmMgICAgICAgICAgICAgICAgICB8IDQwICsrKysrKysrKysrKysrKysrKysrKy0KIDQgZmlsZXMg
Y2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotLS0KYmFzZS1jb21taXQ6
IDA1ZjdlODlhYjk3MzE1NjVkOGE2MmUzYjVkMWVjMjA2NDg1ZWViMGIKY2hhbmdlLWlkOiAyMDI1
MDkxNi1iNC1yY2MtdXBzdHJlYW0tOGE4ZWEzYWY2YTBkCnByZXJlcXVpc2l0ZS1jaGFuZ2UtaWQ6
IDIwMjUwOTE2LWI0LWZpcmV3YWxsLXVwc3RyZWFtLWRmZTg1ODhhMjFmODp2OApwcmVyZXF1aXNp
dGUtcGF0Y2gtaWQ6IGU0YTcwOGQ5YzZkZjU3MjVjOTU5OGZiZDIxNjk2MzZlNGU3ZGM0NmIKCkJl
c3QgcmVnYXJkcywKLS0gIApDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRAZ21h
aWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
