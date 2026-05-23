Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNHoAOTkEWrirgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 23 May 2026 19:33:24 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBB75C00BF
	for <lists+linux-stm32@lfdr.de>; Sat, 23 May 2026 19:33:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5177C87EDF;
	Sat, 23 May 2026 17:33:22 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F681C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 May 2026 17:33:21 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-8354461da74so3799682b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 May 2026 10:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779557600; x=1780162400;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3F79MqG9jAX2CXiKWut0k15rC5yK9KJ27umq50B/zo=;
 b=ZuCcS8Y/7ZTo1EX2SWjOZ7BqW5PDPcoH32GwVuX1foBJxXOwfiAsOVsgvi25prjDQE
 94cqX53mpktZh7NVldnbhOaHJDNkSySiMZzvHMBZS0x3zGarh82xUJgy+Wb4DOxExTLg
 2S0nHxwrOOlYdkXiedmdgrkIulShYWqXfI8VrHq5rI4UWX3Mv7LtuC4Z6+9YsMG+dPA/
 fkAoHwm0EBjz4YOpdnZ/FsiA9S2HfEOFMMSsIYmjNXgXKLbarPc1sU05ix/qEXNi3bTK
 9MRlVQSUVUB5gMthRQiT86f/jVxzboshW/W1H0bjxXCyQ5O2Q4AwrLPvyJZyvvqTxRNg
 VoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779557600; x=1780162400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t3F79MqG9jAX2CXiKWut0k15rC5yK9KJ27umq50B/zo=;
 b=sJXN8K7Lb0c7+sj7Z8maH8lkmzNZtH/C9SmTon+fN35jThhut6PDEVcdVa/ARNfbE6
 /o/AQ7ZSBcyG4oX8+Ts2jvLQbTUtgdhpZ/qZmBM0Erov3aac8B8qg2/TNYiLK/+rQB5X
 PTQbuMEi8I+lqO5LGNqtelzd2+oVpLZTcuxKmJNQunFYxJ1Cy48PTzb8NRBXV5uCOb9z
 tc8nlEi7p/SfHZbqPbMH1JMBwalCQGmEKsJcTiJxTkLd2XRdFN+sKZcvGTxrYa4EffZx
 XZJE3riGpCSa2rm2hPz+alYEhZlN1JIDgR5iff8wq1Im8WtYO9KVVziQ+jKgGHOyK+3c
 nciw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9G+GmoI4o1tkKST/9sLixU8/tg7TOKU6wCF1s0NKE6a7YmlTfce4AAAK+uHetsbttqR3B1elEpFFmSIw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy1h4QhxYfTC8hFj0joPZ61bP8bAzsLcXEtoGtZzUtZ+nNrjbfy
 tAIioRzcbYWqGbySva48JZactGkgfoPjkNIXlA7oIQHcF5cmOuF5guw0
X-Gm-Gg: Acq92OFIBo4p/sLZ+JOMiiR4+jxyxvwm39OkXOlcpTBo+vQKiHMaAnn0yPeKtslhdzT
 deCkS8GMQP1csaJqk/hKkcN4jtj+q2/oM5hDrfXxXhvEpLQSHMLZARVQdwvtFngWkhVBvQvLV1h
 XeS7Pz2qWfXtlTLkspkAphEuiqxR/GB5aaXU4M7t1CX+ciNrefpWlJrEqUaWCJak2bFMpLee5xi
 gWjMnl3rNBA2hYtMqMWpUnOeT4nGJlsfBIIksQjQDo+TLL4YK1bn7X+4W+CtlqJXMUK3gBsCL3Z
 x9whh5tIqLcxhfAbv00DkXvpWB1luDBvA9OAnQfoPETaXUtXxisZQeBvHvQ9Tub6362g28ycoDz
 fj/taqAoOw1+yjwyI+2c8jJer4f7KLzOJmW0Wai3QMq1z5Bj1g+S0dsUm9ythdSbasQZwtQ96Go
 7VwdvH0cHqEEUwzCJkCwIZHQAYlLqlhVEDelIK41Lp8Id3wrHiDRQwXtCqA0RqYQE3Iw==
X-Received: by 2002:a05:6a00:4483:b0:82a:780f:a187 with SMTP id
 d2e1a72fcca58-8415f5e6690mr8305636b3a.36.1779557600057; 
 Sat, 23 May 2026 10:33:20 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.12]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84164fc646bsm5162945b3a.46.2026.05.23.10.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2026 10:33:19 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lee@kernel.org, ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linusw@kernel.org
Date: Sat, 23 May 2026 17:32:51 +0000
Message-ID: <20260523173251.72540-3-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523173251.72540-1-manishbaing2789@gmail.com>
References: <20260523173251.72540-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 manishbaing2789@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 2/2] dt-bindings: pwm: stmpe: drop legacy
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:ukleinek@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linusw@kernel.org,m:linux-pwm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor.dooley@microchip.com,m:manishbaing2789@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,microchip.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[manishbaing2789@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manishbaing2789@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.692];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: ABBB75C00BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VGhlIHN0LHN0bXBlLXB3bSBiaW5kaW5nIGlzIGFscmVhZHkgY292ZXJlZCBieSB0aGUgTUZEIHNj
aGVtYQpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bXBlLnlhbWwu
IFJlbW92ZSB0aGUKb2Jzb2xldGUgYW5kIHJlZHVuZGFudCB0ZXh0IGJpbmRpbmcgZmlsZS4KClNp
Z25lZC1vZmYtYnk6IE1hbmlzaCBCYWluZyA8bWFuaXNoYmFpbmcyNzg5QGdtYWlsLmNvbT4KQWNr
ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ClJldmlld2Vk
LWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dWtsZWluZWtAa2VybmVsLm9yZz4KLS0tCiAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9wd20vc3Qsc3RtcGUtcHdtLnR4dCAgIHwgMTggLS0tLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTggZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9zdCxzdG1wZS1wd20udHh0
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9zdCxz
dG1wZS1wd20udHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9zdCxz
dG1wZS1wd20udHh0CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmNDAxMzE2ZTAyNDgu
LjAwMDAwMDAwMDAwMAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdt
L3N0LHN0bXBlLXB3bS50eHQKKysrIC9kZXYvbnVsbApAQCAtMSwxOCArMCwwIEBACi09PSBTVCBT
VE1QRSBQV00gY29udHJvbGxlciA9PQotCi1UaGlzIGlzIGEgUFdNIGJsb2NrIGVtYmVkZGVkIGlu
IHRoZSBTVCBNaWNyb2VsZWN0cm9uaWNzIFNUTVBFCi0oU1QgTXVsdGktUHVycG9zZSBFeHBhbmRl
cikgY2hpcHMuIFRoZSBQV00gaXMgcmVnaXN0ZXJlZCBhcyBhCi1zdWJkZXZpY2VzIG9mIHRoZSBT
VE1QRSBNRkQgZGV2aWNlLgotCi1SZXF1aXJlZCBwcm9wZXJ0aWVzOgotLSBjb21wYXRpYmxlOiBz
aG91bGQgYmU6Ci0gIC0gInN0LHN0bXBlLXB3bSIKLS0gI3B3bS1jZWxsczogc2hvdWxkIGJlIDIu
IFNlZSBwd20ueWFtbCBpbiB0aGlzIGRpcmVjdG9yeSBmb3IgYSBkZXNjcmlwdGlvbiBvZgotICB0
aGUgY2VsbHMgZm9ybWF0LgotCi1FeGFtcGxlOgotCi1wd20wOiBwd20gewotCWNvbXBhdGlibGUg
PSAic3Qsc3RtcGUtcHdtIjsKLQkjcHdtLWNlbGxzID0gPDI+OwotfTsKLS0gCjIuNDMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
