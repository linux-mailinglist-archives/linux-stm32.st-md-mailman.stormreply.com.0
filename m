Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAw5ARCIi2lWVgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 20:33:36 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A74ED11EA68
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 20:33:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CE80C87EC0;
	Tue, 10 Feb 2026 19:33:35 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE1A7C87EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 19:33:33 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so13612965e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 11:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770752013; x=1771356813;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xk71nUW+8tIk68OOiZ1p6pMbhgPda0w/fD/dlKzEMWk=;
 b=c/CAjP6o3D+j+ImTh3vdue6kTro9I8snY4C9UKnr9VMAtwOPKunCjeThr99i/QtXwg
 Y1AD1Dcb50f0ehsFtk5xhwMTZkneAW+W9Zk73XkfzYxcgXip/3aJAmDeUuGP1RV5ybOS
 nttlOjr0s4bBhr9O2r4DTKxGfMiuRjtQT4rWxzq0bJO4rmB3U0tu+9ii6W/vSDOCqfzU
 uN/SbzCNxz6+r19sp2RNoy9H1M7hgs9AGGbIcYUsiHcucULrzUOzH2mr++OwaXnInBy5
 sM2F19wiJaFQXzzRCRyItXGOljOrkjKBJzIXkxfQr1EUrw9u6DFoLg8KdG7fLbEum4gp
 gk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770752013; x=1771356813;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xk71nUW+8tIk68OOiZ1p6pMbhgPda0w/fD/dlKzEMWk=;
 b=aYg2pHuxPdyKy6dzIcnhu0Rla8GVVfPGRwB91I93o8rX+M27jWXWkGd65IFVibhgnE
 fzUOGr3lhNWjhjVv/A4YhPmbDTkR1oPBkF1Qyd7Gv0AjGEvzpkNlv95ZLclGcxRaTeP/
 OJ8fSc5PGtfwOFmFUUhFyTfH3NRcdGDk+aCzUk8mDS9RQcjYZCa9W3iaux+OvzDXPVWP
 Afww8O3gwIYSlBJKU3IayhN6VepDUiplrPsLCNR31OcnT3ED5qUnpzbN8wPNKRXtpy7x
 WOEMJMqRSPhJRMWzeghhcBwzi45DfGrWujMDhyv4WzPa+UZ1TJbUeVYHdmGrz1vNIBpZ
 I89w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXajDoQwJ2Rz6jyfaeC3vKFnZMO2BkkObrbChs9zVntDTKnwHOO2NYJLrhIZ9MqDWFnym/w5ZNn4+4bXA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx9+LeuI+2qkDBwqwcV09InAlw+aqmVb9UgYUayziPfr6//kCq1
 dKT+0E/f6IwK+SXgKzqwnBKDE7fyLfYTu8xIVkd0rhrflJlmpYWTQSE/
X-Gm-Gg: AZuq6aLlorS2oNhwOJoinppcwpmVh0VLWxYt8XxGzjo+JUwXK/MXODZgecnGsX7kJVb
 lcPERiqnHJu98st/C64uzE/B3CB//9VR5qV967nvA01MUJkdpaCUnUkYk6PfTzdTmb9YyvzdT1V
 D92RcxcqsmhYZFgzbG69+Qn0MaAsNed08tiMfA+ZVj6BSTZTwKFQBgFP4jO7PXyurVEl/NiKGRH
 2ltlWN2LrvwaYdS535HfQvg615k3VYnz0HOI9RORVMMF3E5EKYMszvEMUTBFtyJ8ulY/wFzm56h
 ofEbO0E/ONhIlgTFi4NzzmzQzmfPoCAu6dDFbWAnkIb4j6oJ7OdqujTBP88ztcW8djWfREyNj7V
 AfEeDepi7r5s+2VYwQfeuFYop0QDFWZN22+2jxdsUqpZX4h1x4uiTcvgSeB896PJFVdNf0nE7dl
 Zt0SS2wKPJtUpdAsYYL5Zb9HMasd41Q0/5MTggQUvnc9ERFPE7
X-Received: by 2002:a05:600c:3b23:b0:480:1e92:dc65 with SMTP id
 5b1f17b1804b1-4832022b9fcmr255795265e9.31.1770752013268; 
 Tue, 10 Feb 2026 11:33:33 -0800 (PST)
Received: from localhost (39.31.66.37.rev.sfr.net. [37.66.31.39])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4376d3a32basm19835831f8f.14.2026.02.10.11.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 11:33:32 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 10 Feb 2026 20:32:54 +0100
MIME-Version: 1.0
Message-Id: <20260210-b4-rcc-upstream-v9-3-17ca1db7613f@gmail.com>
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
Subject: [Linux-stm32] [PATCH v9 3/3] arm64: dts: st: set RCC as an
	access-controller
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,2.162.112.64:email]
X-Rspamd-Queue-Id: A74ED11EA68
X-Rspamd-Action: no action

RnJvbTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoK
UkNDIG5vdyBpbXBsZW1lbnRzIGZpcmV3YWxsIGFjY2VzcyBvcHMgdG8gY2hlY2sgdGhlIGFjY2Vz
cyB0bwpyZXNvdXJjZXMuIEFsbG93IGNsaWVudCBub2RlcyB0byBxdWVyeSB0aGUgUkNDIHdpdGgg
b25lIGZpcmV3YWxsIElELgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVt
ZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2Zm
aWMgPGxlZ29mZmljLmNsZW1lbnRAZ21haWwuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMv
c3Qvc3RtMzJtcDIzMS5kdHNpIHwgMSArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAy
NTEuZHRzaSB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyMzEuZHRzaSBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvc3Qvc3RtMzJtcDIzMS5kdHNpCmluZGV4IDg4ZTIxNGQzOTVhYi4uZTI4M2M3NjBk
OTRmIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyMzEuZHRzaQor
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyMzEuZHRzaQpAQCAtNzc2LDYgKzc3
Niw3IEBAIHJjYzogY2xvY2stY29udHJvbGxlckA0NDIwMDAwMCB7CiAJCQlyZWcgPSA8MHg0NDIw
MDAwMCAweDEwMDAwPjsKIAkJCSNjbG9jay1jZWxscyA9IDwxPjsKIAkJCSNyZXNldC1jZWxscyA9
IDwxPjsKKwkJCSNhY2Nlc3MtY29udHJvbGxlci1jZWxscyA9IDwxPjsKIAkJCWNsb2NrcyA9IDwm
c2NtaV9jbGsgQ0tfU0NNSV9IU0U+LAogCQkJCTwmc2NtaV9jbGsgQ0tfU0NNSV9IU0k+LAogCQkJ
CTwmc2NtaV9jbGsgQ0tfU0NNSV9NU0k+LApkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9zdC9zdG0zMm1wMjUxLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEu
ZHRzaQppbmRleCBhOGU2ZTBmNzdiODMuLjg5ZTBiOGYyZmJmOSAxMDA2NDQKLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9zdC9zdG0zMm1wMjUxLmR0c2kKQEAgLTE3NjEsNiArMTc2MSw3IEBAIHJjYzogY2xvY2stY29u
dHJvbGxlckA0NDIwMDAwMCB7CiAJCQlyZWcgPSA8MHg0NDIwMDAwMCAweDEwMDAwPjsKIAkJCSNj
bG9jay1jZWxscyA9IDwxPjsKIAkJCSNyZXNldC1jZWxscyA9IDwxPjsKKwkJCSNhY2Nlc3MtY29u
dHJvbGxlci1jZWxscyA9IDwxPjsKIAkJCWNsb2NrcyA9IDwmc2NtaV9jbGsgQ0tfU0NNSV9IU0U+
LAogCQkJCTwmc2NtaV9jbGsgQ0tfU0NNSV9IU0k+LAogCQkJCTwmc2NtaV9jbGsgQ0tfU0NNSV9N
U0k+LAoKLS0gCjIuNTMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
