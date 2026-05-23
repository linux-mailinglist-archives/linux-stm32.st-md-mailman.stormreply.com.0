Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Je06AtTkEWrirgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 23 May 2026 19:33:08 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 843535C0089
	for <lists+linux-stm32@lfdr.de>; Sat, 23 May 2026 19:33:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DE26C87EDF;
	Sat, 23 May 2026 17:33:06 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE5BCC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 May 2026 17:33:04 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-841882f8f4bso88097b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 May 2026 10:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779557583; x=1780162383;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HjZOf7bVbm6B+eRTHEBmeDXi1tZwk3zjXWzPdrWiVjQ=;
 b=K2y9Zj/Wryy7TnNQQWYQUdlQgVD+hrNbxp3KmtPlZmw1yJPq8X5/SkOWzAVOxWaO41
 gGlJsJnhOkgH/bxwrcBovHCmN/gsAIXrmIb+l4l05SGCSskyAW+nogqqF4mBBabvAiPC
 22Ge1vXmH3PkvOeiXveRN1GhpRPI7EF7K8cTTnSsiOVU2/T42rTvQzGh1AlNTSSmGJv5
 528DncaFGjyihEseX58RyimwtlLl0dBd43yyhmcGmnNhgbBjTahAr7uYxbf0VCQD/Wi+
 zyfqjZA96jK0i7hgM0OJrBLRk8+4YY+LGISzGGECaSh3+v0DJW+LzPnUAUIUk7mPDAxQ
 ghAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779557583; x=1780162383;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HjZOf7bVbm6B+eRTHEBmeDXi1tZwk3zjXWzPdrWiVjQ=;
 b=o3SGjuYR6F9sZifKlApK/c4B1InZ4wjQQLpxIf1cjPlQDATfAmEInHWSmVST+gupI+
 HUJwZiJUVXOtE2Z5x+Lp+PNVMkvsv3gCGASeJYoYtSlryDcv5x06sgWhTn+TEH2NFmzN
 /POuEo5bP7MDGfsjfs9gC4T7Q/nzdqFKUCWQC3RZMn+luI0tJtM9RUKsRjIASGUMAqkf
 MpFdGFnqISg9YbCbOG1AGY+GnfOVfw6UnvF7ZwzhEfS0aYM3WkdJinsjcZd0CUUPfcka
 jLXkIEeHKhDmad6eqvGaMJJrZtCZ7O6vPwxI3BPjAOw92gcB+NCmuw/X769dir908MxU
 EXLg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+UcZDxO4yWeE5MgK8j/WUhJ861XTd7icM+FZQ70TX9GvjyQ6o8sH7KUIj6L+DAedfB7WFWh5bJHEW8+Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzaww7A6bduumvBQzsQx+WdhA7G1ci2t/TSdtCgGylPVf5xTzyy
 oXH5yUBLBf9rJsSUatwbasCbfTfWuznBhWomuyrBR+9E9krkyxCuO019
X-Gm-Gg: Acq92OEd/GFubl4whU+pzvFwYKFfqPYQ7RnyaOweYcvqy4jXL5D9pb5IeqwdoAKdwvH
 h8VgJSGGZLCAKDXjQYWzup2v+YINBWXzO8MlyiwFkhQcAyQpeagY8h0voUWXUrueH1UWEre/GGM
 WyO+Ln4dFBrn3eYDCRoQY1EvaAr0sB0JWaJUCQmWbQAarLhqcRWaW+ep7MxHrQqnZ3oZd8+IZ3b
 4KvYP3lDZNQrcINkyfhcsMn3eMqKaugy4WSjcM9ZsWH5xNnu4hVYPR2r14BRmaH7IX9S0HWtUEL
 u/qRIWteZmGIVyPVYTJm9X7YGL3qHwZVsb0Z8lN0W4tpIltVlFz7OhaWtykuu+FH5oKPMJfXubV
 iYW12Jt9J2FOM1bmzV3tQIsI5aRTiYU16Ff/cAPnozs8M1Y2ZAPBGNXVkm+9QWJka2gE+HzeZ3V
 haz+FjxJHTCq2e38oosVSLwUOw3MPxyFyT1bzJE4doJSBmEkQrCZWmEtHhJR7pRrEjHw==
X-Received: by 2002:a05:6a00:a383:b0:82f:21ee:270e with SMTP id
 d2e1a72fcca58-8415f6d0bb4mr8246436b3a.42.1779557582864; 
 Sat, 23 May 2026 10:33:02 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.12]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84164fc646bsm5162945b3a.46.2026.05.23.10.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2026 10:33:02 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lee@kernel.org, ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linusw@kernel.org
Date: Sat, 23 May 2026 17:32:49 +0000
Message-ID: <20260523173251.72540-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, manishbaing2789@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/2] dt-bindings: mfd/pwm: Split st,
	stmpe cleanup into separate patches
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:ukleinek@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linusw@kernel.org,m:linux-pwm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manishbaing2789@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[manishbaing2789@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manishbaing2789@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.705];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 843535C0089
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8sCgpUaGlzIHNlcmllcyBzcGxpdHMgdGhlIHByZXZpb3VzIHNpbmdsZSBwYXRjaCBpbnRv
IHR3byBkaXN0aW5jdCBjaGFuZ2VzCnRvIGF2b2lkIGNyb3NzLXN1YnN5c3RlbSBtZXJnZSBjb29y
ZGluYXRpb24sIGFzIHJlcXVlc3RlZCBieSBVd2UuCgpUaGUgZmlyc3QgcGF0Y2ggYWRkcmVzc2Vz
IGEgdmFsaWRhdGlvbiBnYXAgaW4gdGhlIE1GRCBZQU1MIHNjaGVtYSwKYW5kIHRoZSBzZWNvbmQg
cGF0Y2ggZHJvcHMgdGhlIHJlZHVuZGFudCBsZWdhY3kgUFdNIHRleHQgYmluZGluZy4KCkNoYW5n
ZXMgaW4gdjQ6Ci0gU3BsaXQgc2luZ2xlIHBhdGNoIGludG8gYSAyLXBhdGNoIHNlcmllcyBiYXNl
ZCBvbiBmZWVkYmFjayBmcm9tIFV3ZQogIEtsZWluZS1Lw7ZuaWcgdG8gcHJldmVudCBjcm9zcy1z
dWJzeXN0ZW0gbWVyZ2UgY29uZmxpY3RzLgoKQ2hhbmdlcyBpbiB2MzoKLSBBZGRlZCAncmVxdWly
ZWQnIHByb3BlcnRpZXMgdG8gdGhlIHB3bSBzdWJub2RlIGluIHN0LHN0bXBlLnlhbWwKICB0byBj
bG9zZSBhIHZhbGlkYXRpb24gZ2FwIGlkZW50aWZpZWQgYnkgdGhlIFNhc2hpa28uCi0gVXBkYXRl
ZCBjb21taXQgbWVzc2FnZSBhbmQgZGVzY3JpcHRpb24gdG8gcmVmbGVjdCBNRkQgc3Vic3lzdGVt
IGNoYW5nZXMKCkNoYW5nZXMgaW4gdjI6Ci0gRHJvcCB0aGUgVFhUIGZpbGUgaW5zdGVhZCBvZiBj
b252ZXJ0aW5nIHRvIFlBTUwsIGFzIHRoZQogIGZ1bmN0aW9uYWxpdHkgaXMgYWxyZWFkeSBjb3Zl
cmVkIGJ5IHN0LHN0bXBlLnlhbWwuCi0gVXBkYXRlIHRoZSBjb21taXQgc3ViamVjdCBhbmQgZGVz
Y3JpcHRpb24gdG8gcmVmbGVjdCB0aGUgZHJvcC4KCk1hbmlzaCBCYWluZyAoMik6CiAgZHQtYmlu
ZGluZ3M6IG1mZDogc3Qsc3RtcGU6IEFkZCBtaXNzaW5nIHByb3BlcnRpZXMgZm9yIFBXTSBzdWJu
b2RlCiAgZHQtYmluZGluZ3M6IHB3bTogc3RtcGU6IGRyb3AgbGVnYWN5IGJpbmRpbmcKCiAuLi4v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtcGUueWFtbCAgICAgIHwgIDQgKysrKwogLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3N0LHN0bXBlLXB3bS50eHQgICB8IDE4IC0tLS0tLS0t
LS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9u
cygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9wd20vc3Qsc3RtcGUtcHdtLnR4dAoKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
