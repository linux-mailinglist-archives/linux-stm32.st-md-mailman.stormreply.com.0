Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIteLrml32miXAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 16:50:33 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9B0405844
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 16:50:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2319C36B2A;
	Wed, 15 Apr 2026 14:50:32 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 078E2C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 14:50:30 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43d01d6b50cso6999067f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 07:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776264630; x=1776869430;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sUfEqAnWlQl1ZqiKV3YCAggYCvmAvG9tDObdHVC4vFQ=;
 b=leDjBBq96RrQUGfb2s/aVZ33uOTQAi4He4Hy2PkTY+qgHWTTbhejt1QtU15TIpuUHL
 pXX/l+kxWBmhbQYh5hbxeyqnOe328PZxq9PVb5u1OUbTFm6h2Ajql4yzyWPsmDb+pJkW
 ZQ1BmICcPp7b3QH9QGsAC/w65mTbiCeGgA+oxJDlJX3zlABwADfpIOf6wRvGegTEKf9u
 AJknv2OVPFWABTIqJql78czld9J8qkt9s4ZDa8K9B6om4bVZQDOLWI28BQOu27dYDMG+
 qqPyKR2exb3UI5BHXhggnkS/hhFiEmMhvSe/1rm+vj/RDoRS9YPSlFLXrZdSUIoJvvOx
 /TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776264630; x=1776869430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sUfEqAnWlQl1ZqiKV3YCAggYCvmAvG9tDObdHVC4vFQ=;
 b=pUcR3ydLZ7ZXg9nsFDnyHRuPCtofyCpNGgjMR+12wXX//hJl2RxtuTnBZBamynabIg
 lU1KD1iiHC8E7Ovh508UdlKXDJqXL89ISxu/2MLQPdwEovI1JLW/EpP7QAgPquYwHWmb
 FTxCvXviYnU/LCcfX/w9/saCkaFeo1eIM+b5u6qxCz0cjQnCBLSgFk25xattro01/hZO
 2f7c+Pq2g0lfoBuN9akDTVazwiAWdwx+bwL1gocCHh4YViWGuO9P9i75eh+ntLj8/1i+
 9owOKKaU6tKV26/LomgQa9/tfYtfJMmXhi/MAb4kOtCxh0d9fysz5DTdimzVZKnDiQ/k
 PcxQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/pcu+3VKJWKMt8gXZh/HceiPNafC+mPB4Tgx13MYJ2krVJS6jnCkjcTyPKj2E4ZgPxqjpqaeddeh58kA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzd++t3O0nAKqFowBqcMNzi8SL65dVK47TsyWLmmb1La4tWd/Ws
 2sLj52tUS0NehNrWe8QuY061opCE/j39ABiewLMCcg/P10rtAN8llEaK7fYEZuVJwP8=
X-Gm-Gg: AeBDieug1tKP+Kltw2ixSOYA5YDoQaMBEYksbXGSCNkSWeB92hKpYj4swE/DCBEgovP
 snWI7U8LTKsUPdkBA61i2uNWuVgfMD1bc7Wy6J5yeP5G6AFzcGhT2aP6ha2lQpyzdUpuO9Z4yMW
 pc+ATnwPfwm8RvTEUK2iXqjgiHOAnFKiJpw9oZ3cC2EXFtzKn5vY92nKl1aI5ei6bPNNLBxMjSO
 YoLmykI++7qUdd9OANPbW35yrDCwwvubJ6FxuVTIVaFBIkW+es+6wDa6Hd7keyJZ5V2o4pexuSc
 VpfMvvxZp1tdgjbaE5h98T1w2XozG6gShTURQ5r7dlwlVgCk3dxJCPccQ6a+Ym4mUZffEHsVTaV
 zvznP8tK2v9prqWzJ0hHrCwCUF+W6BdGNLdTYcvU8xi2bFkRobSQ3YqlU2JmuPFEeznIy0rgX4v
 Wehta8V8WlQ1E28FcYKuS/OHWtQU8alP7yjP5xp3QWT7q20aeZBYMNyA49WKeUS78CqG4AoohsW
 C1tHbBCCYsn1Mk=
X-Received: by 2002:a05:600c:796:b0:488:e7e4:8425 with SMTP id
 5b1f17b1804b1-488e7e48437mr87884605e9.23.1776264630228; 
 Wed, 15 Apr 2026 07:50:30 -0700 (PDT)
Received: from localhost
 (p200300f65f20eb084c777289617ec110.dip0.t-ipconnect.de.
 [2003:f6:5f20:eb08:4c77:7289:617e:c110])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-488f4352af8sm1813025e9.0.2026.04.15.07.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2026 07:50:29 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 15 Apr 2026 16:50:11 +0200
Message-ID: <cover.1776264104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=Ev/XoHpc/zuPC3jNLuLXs/GGVRgRWnbEC5JNIWTtnCQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp36Wjy7gOvxddwOd586qrs+Qr4Imv1lEkngzDs
 a0aP4AneEOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCad+lowAKCRCPgPtYfRL+
 TuWdB/sHjGdz6bLApfg5wvD90asOZlq5wB95iiT/6qRsVYZNCaJZvEINb9YE4OEuA2dTiBjambl
 b6WdQWEge1t3Wo4OZ52Doxb8A3k18jC6nvZOptwlnTK91Q9fXC8RNq1J1ozziVeRfXq+dAI7HMQ
 8en5ZtFdJ/DF9/q9wIZtpXjPVJwQ751TKrA98Lqvjkbs7kzbrLqnVOHnnAcolIoxzP5+r14HpY5
 EsoWfhrDwAfycXsU8De7046F6a+uS875tdeB+Lx4Ehcf1MgsV8b/378tlBM4AE/iZI2ic6WGgu6
 /RnTXNof99lHnCe70yk1qU9UXAZew5PooAETyvnRFB9uMBBm
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-pwm@vger.kernel.org, Andrea della Porta <andrea.porta@suse.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v1 0/2] pwm: stm32: A rounding fix and a
	cleanup
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_RECIPIENTS(0.00)[m:fabrice.gasnier@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-pwm@vger.kernel.org,m:andrea.porta@suse.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,gmail.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.836];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-stm32];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,baylibre.com:mid]
X-Rspamd-Queue-Id: 3F9B0405844
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG8sCgpJIGV4dGVuZGVkIHB3bXRlc3RwZXJmIChwYXJ0IG9mIGxpYnB3bVsxXSkgdG8gYWxs
b3cgdGVzdGluZyBpbnZlcnNlZApwb2xhcml0eSB3YXZlIGZvcm1zLiBJJ20gbm90IHN1cmUgaWYg
SSBzaG91bGQgbGlrZSBpdCBvciBub3QsIGJ1dCB0aGlzCmltbWVkaWF0ZWx5IHNob3dlZCBhIHJv
dW5kaW5nIGlzc3VlIGluIHRoZSBzdG0zMiBwd20gZHJpdmVyLiBUaGlzIGlzCmZpeGVkIGluIHRo
ZSBmaXJzdCBjb21taXQuCgpUaGUgMm5kIGNvbW1pdCBpcyBqdXN0IGEgY2xlYW51cCB0aGF0IEkg
aGF2ZSBvbiBteSB0b2RvIGxpc3QgZm9yIGEKd2hpbGUuIFRoaXMgcmVxdWlyZWQgdGhlIGFkZGl0
aW9uIG9mIG11bF91NjRfdTY0X2Rpdl91NjRfcm91bmR1cCgpIHdoaWNoCmV4aXN0cyBzaW5jZSB2
Ni4xOS1yYzF+NzBeMn45MC4KCkkgaW50ZW5kIHRvIHNlbmQgdGhlIGZpeCB0byBMaW51cyBiZWZv
cmUgNy4xLCBidXQgd2lsbCBnaXZlIGl0IGEgYml0IG9mCnRpbWUgaW4gbmV4dCBiZWZvcmUuIFRo
ZSBjbGVhbnVwIHdpbGwgd2FpdCB1bnRpbCB0aGUgbmV4dCBtZXJnZSB3aW5kb3cuCgpCZXN0IHJl
Z2FyZHMKVXdlCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdWtsZWluZWsvbGlicHdtLmdpdAoKVXdlIEtsZWluZS1Lw7ZuaWcgKDIpOgogIHB3bTog
c3RtMzI6IEZpeCByb3VuZGluZyBpc3N1ZSBmb3IgcmVxdWVzdHMgd2l0aCBpbnZlcnRlZCBwb2xh
cml0eQogIHB3bTogc3RtMzI6IE1ha2UgdXNlIG9mIG11bF91NjRfdTY0X2Rpdl91NjRfcm91bmR1
cCgpCgogZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgfCA0OSArKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDMy
IGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiAwMjhlZjljOTZlOTYxOTcwMjY4ODdjMGYwOTI0
MjQ2NzkyOThhYWU4Ci0tIAoyLjQ3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
