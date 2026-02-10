Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GrnMg2Ii2lWVgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 20:33:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E79711EA5A
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 20:33:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E23BC87EC2;
	Tue, 10 Feb 2026 19:33:33 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03EE6C87EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 19:33:32 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-4359a16a400so1160308f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 11:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770752011; x=1771356811;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6oQpYXC+oOVLX3B1mt394dx6/WutKhxIvgHdxTMSixY=;
 b=e7NXVsqb1uGPmV8r3oliaXt3PnOuOTws1cdgK8eVDGg3rwOg1OqGCC79FY3SQhfvEd
 dMOyaxGzG5br+1+0qx3atRqDD2EZcOS+s3yd1NU6AtlciS1dtm5arRacLQrmE6eco4Jr
 XnMkyeBMOldRnEcah/fkvV/jX1F+XJZEp6NpD4ZQJ9BvsGuXWy3ITF+4C9YNRm7DSZZq
 i9o3RfvU+5O7EaWIjSZyM5a7OO80dbSGJMhuffcHeNvOct9o+zXkkWrDYXQo+ca0jjy9
 ShaH1VyaqiJABVZ7sEA47tLGQfk7BuLn2N/8lFS58QaRSsoLs2C2MwuE0VRXD7NkUn5u
 m1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770752011; x=1771356811;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6oQpYXC+oOVLX3B1mt394dx6/WutKhxIvgHdxTMSixY=;
 b=adGd/RL6f64r9SY60vysWAAUMAfaJBREJtG/WomuokkY829NCfIuOjvow32qCMlNcp
 MYDsq1bCuv6jB1gsY9ONK8Eo/bdToVYFAzeKWzA99dx9GKqhd5KHjlZBeOOXd6eTWRJi
 FhjxC0g+uOCEymYEzpS8Vi3pwgPNT3NJiYQ5TC+cH7Y+ekNcjrpAhkYbpGC/7780XQd7
 QSG16UalVrlmLMz4RvNXZI3zRKQlZoQSX3ITfoBgpi8oIdH7H0H/AEfpuhXuLm+XxySH
 G27D3i9JnJysnPF91kkutMFpMfMv1+DQ5RvKqkOeHW+QOirhhVExpomffiRgQvIj/kR9
 Rtrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdjI41wKHAjvnkk7dsYb6LHvFOvXdamUQBWuMieGVFaoEPjsI9BmecZTZJi3VdcUdYEb0Itmfx5ifGAw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxbTxdHhT5Q7gTMqa3TXvauC2KNRixGLWpuR5mSSwx/q3tf6Vty
 BIPW40+HpxWtdQsAHwGt5zvnGlbMkpIK2WSEfftvPV89VWL/dBNh6sZ0
X-Gm-Gg: AZuq6aJci62AJTFBWvCv4xebq6oLMuxzOOFj3xGcLt1uAUkycgdimEuKe1PRE5rGp6b
 9hfh2vz3BmEOlZaII3XFKNHExozeqZb5ZISOKvkuyScU4PDxV3xqgIPwstYwGb6D5xYES8oIh5v
 GQvRXXL8WgUvTzpRH4jBdQdomR5mqpxBsWKnfgLXPy3W6aoSFb8o9E7rVTGsAF2ytuGj9xeCXlC
 yqq6K4XwQOLO7R19GgMKy/Za3X5UEiexwnek7AM/zuV3jYIaUBZzMscRUG7bA6BRXq0Hm0XIvey
 dG8cGuciJXUUgmxCFDGE9eWyVr6Rjr9PwyYeTOQPv6OsMDBmq9+74t08vAMHmZF2C8mbaJoE/jK
 godRlh6W4GS07wjiVSqaKWGr7QDz0cz9qmwB8hlVj2EWnd3c8Wab6HFh/mu1xL6nUl5RXG9D2aN
 3AsmJ8aIZ4zWl4jMhs+D+DODMfJS5d39WbX9DMB4x63ilOH2u3+4nyQO7nGnI=
X-Received: by 2002:a05:600c:6290:b0:483:a21:774a with SMTP id
 5b1f17b1804b1-48320225afemr247617395e9.26.1770752011383; 
 Tue, 10 Feb 2026 11:33:31 -0800 (PST)
Received: from localhost (39.31.66.37.rev.sfr.net. [37.66.31.39])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d82a4c4sm143519295e9.10.2026.02.10.11.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 11:33:31 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 10 Feb 2026 20:32:52 +0100
MIME-Version: 1.0
Message-Id: <20260210-b4-rcc-upstream-v9-1-17ca1db7613f@gmail.com>
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
Subject: [Linux-stm32] [PATCH v9 1/3] dt-bindings: stm32: stm32mp25: add
 `#access-controller-cells` property
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,st.com:email]
X-Rspamd-Queue-Id: 8E79711EA5A
X-Rspamd-Action: no action

RnJvbTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoK
UkNDIGlzIGFibGUgdG8gY2hlY2sgdGhlIGF2YWlsYWJpbGl0eSBvZiBhIGNsb2NrLgpBbGxvdyB0
byBxdWVyeSB0aGUgUkNDIHdpdGggYSBmaXJld2FsbCBJRC4KClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KQWNrZWQtYnk6IFJv
YiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50
IExlIEdvZmZpYyA8bGVnb2ZmaWMuY2xlbWVudEBnbWFpbC5jb20+Ci0tLQogRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3N0LHN0bTMybXAyNS1yY2MueWFtbCB8IDcgKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjUtcmNjLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDI1LXJj
Yy55YW1sCmluZGV4IDFlM2I1ZDIxOGJiMC4uODgyZGU4NjA4MjAwIDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDI1LXJjYy55YW1s
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1w
MjUtcmNjLnlhbWwKQEAgLTMxLDYgKzMxLDExIEBAIHByb3BlcnRpZXM6CiAgICcjcmVzZXQtY2Vs
bHMnOgogICAgIGNvbnN0OiAxCiAKKyAgJyNhY2Nlc3MtY29udHJvbGxlci1jZWxscyc6CisgICAg
Y29uc3Q6IDEKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIENvbnRhaW5zIHRoZSBmaXJld2FsbCBJ
RCBhc3NvY2lhdGVkIHRvIHRoZSBwZXJpcGhlcmFsLgorCiAgIGNsb2NrczoKICAgICBpdGVtczoK
ICAgICAgIC0gZGVzY3JpcHRpb246IENLX1NDTUlfSFNFIEhpZ2ggU3BlZWQgRXh0ZXJuYWwgb3Nj
aWxsYXRvciAoOCB0byA0OCBNSHopCkBAIC0xMjIsNiArMTI3LDcgQEAgcmVxdWlyZWQ6CiAgIC0g
cmVnCiAgIC0gJyNjbG9jay1jZWxscycKICAgLSAnI3Jlc2V0LWNlbGxzJworICAtICcjYWNjZXNz
LWNvbnRyb2xsZXItY2VsbHMnCiAgIC0gY2xvY2tzCiAKIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQpAQCAtMTM1LDYgKzE0MSw3IEBAIGV4YW1wbGVzOgogICAgICAgICByZWcgPSA8MHg0NDIw
MDAwMCAweDEwMDAwPjsKICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+OwogICAgICAgICAjcmVz
ZXQtY2VsbHMgPSA8MT47CisgICAgICAgICNhY2Nlc3MtY29udHJvbGxlci1jZWxscyA9IDwxPjsK
ICAgICAgICAgY2xvY2tzID0gIDwmc2NtaV9jbGsgQ0tfU0NNSV9IU0U+LAogICAgICAgICAgICAg
ICAgICAgPCZzY21pX2NsayBDS19TQ01JX0hTST4sCiAgICAgICAgICAgICAgICAgICA8JnNjbWlf
Y2xrIENLX1NDTUlfTVNJPiwKCi0tIAoyLjUzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
