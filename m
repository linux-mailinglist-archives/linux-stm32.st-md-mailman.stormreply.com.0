Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DzVLM3baCmoq8wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:02 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 990815699A8
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:22:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74432C5A4C4;
	Mon, 18 May 2026 09:22:59 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81347C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 10:33:30 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-835386ff122so7459138b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 03:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778754809; cv=none;
 d=google.com; s=arc-20240605;
 b=la8ejTT64wC6WqUjnToVi/BhBakpRcJ9fAeNpV2u2evVIKQhkRC2rIDOjxeONw8sJQ
 21Gjt9ajV8HTryqRivyYhL2kVmtso7yDKB02wWUu9jAbj+mLJJ5wumQSAQ5i7tetYwRI
 pXeYoNJ5VuICDEaKzg7AA+S465bWntuUwZQ3wtc1p7PFKvU4/yb9k36lXhjbgoVC87H0
 G4VarGXH4K43uRwClYj95rMwKafXHB4hBV7JY3F3ntpjnPMApLMdavcaQiTLfA5UeH/S
 /1cCWJWaLe3nQ/px50RwDmwT/QTYaJge0XS5LnJvobp9uyAYIaesoB4x8PS6R89SdWu0
 ul2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Axz5lIhYJJFKudG4NIs2q6TTP3wLlHE34k26hR6vcd0=;
 fh=qF96uLrvTYLuVdRV6kGHN+ZL1Sx+gXDjzdoDepefMNc=;
 b=Nuu1jKnKHXLFpW7xC2ADOx5T032skvEPzo3Nw5Nw670bz4xRa/fwUtgYB8JWfguJvW
 a0LJpULFS5LZLsG2I9sK+b5lRXTCbXjD1VD2haUJUPOB2+Aq/DAt+7XFWFiX5OAAv9xK
 cDSiUfFPWHFZ6XrMdHbXnv4pTu3LhnsA0AsKddJYLcEakSDNVfuBYSdAZv/QwEj3X9Z8
 DRefZ1WGbaEcY1mKpEq1Ii/eT7HNYxXVCT+/tmoUZTPT7p1YL7mckC2b7lEUfvBUKbN9
 D7W+RbA5hc3Sy97DAu6bJmlGZVE0nWXFB7NStTkJSQqZZMk+Mo8cVSs/tdnVk8n/zkJf
 4XoA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778754809; x=1779359609;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Axz5lIhYJJFKudG4NIs2q6TTP3wLlHE34k26hR6vcd0=;
 b=d1/pRLqsWj0TvZW3s+pE493TIPVVbzbijnteDkj12esq4QASo7+eRKKy9S5uIDIrVo
 X9EL8sjKa6pmNZ+5b76vZpxJNGiVAYYtzfsQGavepBR3Q/CdEwuI2nljL5U3Ox80Agzp
 zcl0H6e3vPRUH3JaJ7WBRujHIGYCVdmijMtdBqjGlXBTUJarwOIrir4ZJAMWXoTu5b6g
 ufIZK93/u5FvcczjXF2iv+MmeiT7+1XMRsT339i5OfZymu0MiouZSLydLmRH2lmoD4ag
 c/BvlObghpqnor4S3i8NImA1G+O5fwkuxykRMkcf4FBh2bhJEGwNRecfEf0kKAitB/e+
 oPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778754809; x=1779359609;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Axz5lIhYJJFKudG4NIs2q6TTP3wLlHE34k26hR6vcd0=;
 b=n3R2RPmCtau0L/p3gzw5FTGrWvwyFg+ArRAS8hU/zNtQrLml2gDHUo/D1lLI+7veZI
 LhoJDWQ9SX795+laI0ZyBk87a7talYir/aMhOsscGX1vKAery/Ls2hfSGr8Q5YhKBXQM
 /tO182a+ywfuthiRSHnD441ISWHV54bldAbxN+mc2BuZCkTB94NXtwcWfqkeZE2/Eum/
 npMh7PjO07T1lIGQ8Sp048o0XK7EYuRZFd+9lVBCA5s1c0xreXgkhfc6cl0gJXz6Gt4k
 Qv3art9HMNEe/o0bQuTodGJz4mFC834GYhfCNZGPk3dcgxXL4EvDhFRBSINZm0nMpEMg
 rlwQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/7NBFpbJiZNDMkk3fa4kVF9WFHGeIdhbOMr+XpqVOzYzO/P2NS5c7EZ8KwB2BS/YzQYrMr4DKNn4oxOQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw8XSXoe1NAAcVfopBaR1AGxdGQ7bG4US2bwx9CLbpyi4spQoH9
 GTiNVc5RO2Cp1zO6Q+nKkgrgT7Hg4DY/X5MHeJb87b2FLvgr/CsnB8p+QTwlPYA5ZR6HLGGGh0a
 hE0y8/4ZHDJXAMFkbDcDbCgUVDquhsC4=
X-Gm-Gg: Acq92OEC08PQaAdo/kOzCEBHBGD39SxAMaD3mpPRHEw6f+UzMllj6kSCsfzBjnu6qA6
 diSwtA3sQN4H0WH026x2cA7tXmbaobVa/6+GhmaOlUyR56ZGpdslVvZskaoZ82P4aLajcwFWhhA
 KpT/xwiekalnuihMR+A7t+XO0AhDaa8OD/Kdt6vq2uerlDuHidfwHSapFZx7EVzAKdMmxVZelqM
 HsDRsvnBxEdY5MkeBpaLfCbkVBpFB+UgzRTxxoKpPMCxZ2oxNdX3WkkRLH5y0p2X5WyJ4GPrPjX
 qmYeJAQLaCph7Tw24CRjzI6BTEgKoiMefH19eQ==
X-Received: by 2002:a05:6a00:ad8e:b0:82d:603f:f3a with SMTP id
 d2e1a72fcca58-83f04277f6bmr8500889b3a.24.1778754808499; Thu, 14 May 2026
 03:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
 <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk>
In-Reply-To: <agUknFcDIfwrOCld@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 14 May 2026 17:33:17 +0700
X-Gm-Features: AVHnY4IDc6tthLgrHjXC6SYo89bL-eLMYrCt1lnu5Ycu8ceEQa82GPaz33HiBRo
Message-ID: <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Mon, 18 May 2026 09:22:57 +0000
Cc: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for
	spin locks
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
X-Rspamd-Queue-Id: 990815699A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[94];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:linux-kernel@vger.kernel.org,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:mcoquelin.stm32@gmail.com,m:perex@perex.cz,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,gmail.com,perex.cz,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_SPAM(0.00)[0.996];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

SGkgTWFyaywKCk9uIFRodSwgTWF5IDE0LCAyMDI2IGF0IDg6MjXigK9BTSBNYXJrIEJyb3duIDxi
cm9vbmllQGtlcm5lbC5vcmc+IHdyb3RlOgo+IEhvdyBkb2VzIHNjb3BlZF9ndWFyZCBpbnRlcmFj
dCB3aXRoIGJyZWFrIHN0YXRlbWVudHMgLSBkb2VzIHRoaXMgc3RpbGwKPiBhcHBseSB0byB0aGUg
c3dpdGNoPyAgSSd2ZSBub3QgbG9va2VkIGF0IGhvdyB0aGV5J3JlIGltcGxlbWVudGVkLi4uCgoK
SSBjaGVja2VkIHRoZSBzY29wZWRfZ3VhcmQgbWFjcm8gaW1wbGVtZW50YXRpb24uLi4KYW5kIFlv
dSdyZSByaWdodCB0aGUgYnJlYWsgc3RhdGVtZW50IGluc2lkZSBzY29wZWRfZ3VhcmQgb25seSBl
eGl0cwp0aGUgZ3VhcmQncyBpbXBsaWNpdCBsb29wLCB3aGljaCBpcyBub3Qgd2hhdCBJIGludGVu
ZGVkLgoKU2luY2UgdGhlcmUgYXJlIG5vIGZ1cnRoZXIgc3RhdGVtZW50cyBhZnRlciB0aGUgc3dp
dGNoIGJsb2NrIGluIHRoaXMKZnVuY3Rpb24sIEkgd2lsbCByZXBsYWNlIHRoZSBicmVhayB3aXRo
IHJldHVybiAwIHRvIGNvcnJlY3RseSBleGl0CnRoZSBmdW5jdGlvbi4KCkknbGwgc2VuZCBhIHYy
IG9mIHRoZSB3aG9sZSBzZXJpZXMgd2l0aCB0aGlzIGZpeC4KV291bGQgdGhhdCB3b3JrIGZvciB5
b3U/CgpCZXN0IHJlZ2FyZCwKUGh1YwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
