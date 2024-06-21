Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2807C9127F9
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 16:37:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4ACBC712A2;
	Fri, 21 Jun 2024 14:37:46 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80BF1C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 14:37:39 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-57cb9a370ddso2368425a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718980659; x=1719585459;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sCbJNOTuJGsqKdB7zNbbdfijNKNOI3FnRNRi5W5pqIQ=;
 b=M89pXOZ8uzhUdSf5TT2ZGyCemLF59+RVxsWIGp466qlIEmeG4YQYZu5H6GP0BrHJV/
 bLCdDwd6ZAyp+8m0HGNlCE3n/5v5jmG9MgQuBpFesFiO7bARtwOK58c62k7tCCpiTkO1
 PtbRfyUgIQpiAT5hqGgl2AJaVlHNg55okMv65VIB2tHsLZSsoePDTY5hyP+X9ndVURsX
 sHHkIrOEyw6BwxSvK2DKN7CmFGmkkkbQNpnba1Od5PJOkgVXZGxh7xF2i9BSgsOvfBa3
 eFjQ9m0VtxU44DJhSx4m9rwYB761I9r6o2rlmfb7uHo1b/kXM/rH30iwZF0SLZQhlL3R
 Z/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718980659; x=1719585459;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sCbJNOTuJGsqKdB7zNbbdfijNKNOI3FnRNRi5W5pqIQ=;
 b=brlKWiB84BFWrzNpsjZo1v80tMvV9nL66bVmSY0+s4pngVijNRK/qTbapVc2FdYqr+
 JJJ2lHkiuEm4MOs7CrGAzXxZazv+CV/EfLDoqJL2P9QM3LNVPY6191A/hwRYJuVmMzQb
 6xV9euF7VzYiqOwAxDvVXT904uKQSg0SbDf+yMLdZVgfLiO2zE6A2E0M4VWbbs0cpM0M
 uAfFLMXcWJxx+ZbpWH52Ead87Y3Pwl9Ut7t61fxYZw7B/CB/S3xKf4AeeY0EO5UcfG2E
 LLgSytLMduuRHZfTACq/t/Q/0yycJQxItLC0zESK/KXHa0E0n2bxUmj9qpgQ/01ceKg/
 huxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3XgKuTAIvR4IbujxL5St/rY4bJs09Ywm/l/p0VwgRtc4k3HlXxfnqmISZLlImXXDVldDspyVjZfkC2PPQu3y8+HPvcfgtA8dSTb4hKghOxzc6SKqaVTfp
X-Gm-Message-State: AOJu0YzXVk8VedmQbfVDs/8ZFkQVMGl4GnHbh+Q3lJrbPqE98dS60tkJ
 dPSS00ktOv8XccGlRuvkGAtaWbacjr/scMqVOjLuu0Rx2Gc2lkek3BG5ZooPPcM=
X-Google-Smtp-Source: AGHT+IGj+a5jR9jmqLTqTUfmbBqHYLSyfqY+3cZmxYKiY8quiqSK3c+KV6fBId1CTMhvmSdp7zLT5A==
X-Received: by 2002:a50:d60b:0:b0:57c:9ccd:c626 with SMTP id
 4fb4d7f45d1cf-57d07ebe975mr5731033a12.39.1718980658914; 
 Fri, 21 Jun 2024 07:37:38 -0700 (PDT)
Received: from localhost (p5091583d.dip0.t-ipconnect.de. [80.145.88.61])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d3042d2d0sm1020881a12.41.2024.06.21.07.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 07:37:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Lee Jones <lee@kernel.org>, Thierry Reding <treding@nvidia.com>
Date: Fri, 21 Jun 2024 16:37:11 +0200
Message-ID: <cover.1718979150.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=2s2QMeRsz59n4HUKQa1LkEGYXgnYnEKBgDahMGwGihs=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmdZAYvhSvoLAkKPad0LU83EOCUebiVuN7fzmCa
 r6nzz22pAqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnWQGAAKCRCPgPtYfRL+
 TjVAB/9K/UDQBSIaQ/z44a28qmTh8/ejQ1KhruJna+3pbACeUiHNQ0j9e2dQ2F1lhI+0bJlbh5L
 sqPK7tbTCBm+Qb4rq8M0XTBxlpFVywDWMyCnkwzkRBd6QaDMJP7nPHrS89Ym5kmah0FXF6X2dB1
 FaxENqn4dqfKIOvylAq+0MbD3FsOcQQdssfDN0Kij9VKtGXmt1leVRaSD4QmT9ihTWjSpwalkNP
 HVbCdRQVQRuEZhexX18oy36Kl5kownOxOij7RqIsSWLmFEidg2bhkUeCeeJ1OPZqU07TgPKFRCh
 oGIIbMTv0vtC9gAmdWOnCNhCVDwWYs/PGDAfWp5cefuUsj9o
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: Trevor Gamblin <tgamblin@baylibre.com>, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/3] pwm: stm32: Three fixes
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

SGVsbG8sCgp0aGlzIHNlcmllcyBjb250YWlucyB0d28gZml4ZXMgZm9yIHRoZSAuYXBwbHkoKSBj
YWxsYmFjayBhbmQgYSB0cml2aWFsCmNoYW5nZSB0byBmaXggYW4gZXJyb3IgbWVzc2FnZSBpbiBw
cm9iZS4KCihJbXBsaWNpdCkgdjEgY2FuIGJlIGZvdW5kIGF0Cmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXB3bS9jb3Zlci4xNzE4Nzg4ODI2LmdpdC51LmtsZWluZS1rb2VuaWdAYmF5bGli
cmUuY29tCkNoYW5nZXMgc2luY2UgdGhlbjoKCiAtIEltcHJvdmUgd29ya2luZyBvZiB0aGUgY29t
bWl0IGxvZyBvZiBwYXRjaCAjMiAoYXMgbm90aWNlZCBieSBteXNlbGYKICAgYWZ0ZXIgc3VibWlz
c2lvbiBvZiB2MSkKIC0gRHJvcCBDYzogc3RhYmxlIG9uIHBhdGNoICMyLCBhcyB0aGUgZmF1bHR5
IGNvbW1pdCBpc24ndCBpbiBhIHJlbGVhc2UKICAgeWV0LgogLSBwYXRjaCAjMyBpcyBuZXcgKGJ1
dCB3YXMgc2VudCBvdXQgYWxyZWFkeSBzZXBhcmF0ZWx5KQogLSBGaXggLmFwcGx5IGluIHBhdGNo
ICMyIGZvciBzb21lIG1vcmUgY29ybmVyIGNhc2VzLgogLSBBZGRlZCBUcmV2b3IncyBSZXZpZXdl
ZC1ieSBmb3IgcGF0Y2ggIzEuIChJIGRpZG4ndCBhcHBseSBpdCB0byBwYXRjaAogICAjMiBhcyB0
aGlzIGNoYW5nZWQgc2luY2UgdGhlbi4pCgpUaGUgaXNzdWUgaW4gcGF0Y2ggIzIgd2FzIGZvdW5k
IHdpdGggQ09ORklHX1BXTV9ERUJVRyBlbmFibGVkLiBUaGUKcHJvYmxlbWF0aWMgc2V0dGluZyB3
YXMgcGVyaW9kID0gOTQxMjQ0IG5zIHdpdGggaW5wdXQgY2xrIHJhdGUgPQoyMDg4Nzc5MzAgSHou
IEZvciB0aGlzIHNldHRpbmcgdGhlc2UgaGFyZHdhcmUgcmVnaXN0ZXIgdmFsdWVzIHdlcmUKY2Fs
Y3VsYXRlZDoKCglQU0MgPSAzCglBUlIgPSAweGJmZmUKCnJlc3VsdGluZyBpbiBhIHJlYWwgcGVy
aW9kIG9mIDk0MTIzOC43NDE2ODk5NDMgbnMuIEhvd2V2ZXIgYSByZXF1ZXN0IGZvcgo5NDEyMzkg
bnMgcmVzdWx0ZWQgaW4KCglQU0MgPSAyCglBUlIgPSAweGZmZmQKCndoaWNoIGNvcnJlc3BvbmRz
IHRvIDk0MTIyOS4xNjY3MTk1Mjg1IEh6LiBNeSBlcnJvciBpbiByZWFzb25pbmcgd2FzCnRoYXQg
SSB0aG91Z2h0IEknZCBuZWVkCgogICAgICAgIHBlcmlvZF9ucyAqIGNsa3JhdGUKICAgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIOKJpCBtYXhfYXJyCiAgIE5TRUNfUEVSX1NFQyAqIChw
cmVzY2FsZXIgKyAxKQoKYnV0IGluIGZhY3QgdGhlIG5lY2Vzc2FyeSBlcXVhdGlvbiBpcwoKICAg
ICAgICBwZXJpb2RfbnMgKiBjbGtyYXRlCiAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LSA8IG1heF9hcnIgKyAxCiAgIE5TRUNfUEVSX1NFQyAqIChwcmVzY2FsZXIgKyAxKQoKVGhlIHZh
bHVlIG9mIHRoZSBMSFMgZnJhY3Rpb24gZm9yIHRoZSBhYm92ZSBtZW50aW9uZWQgcmVxdWVzdAoo
cGVyaW9kID0gOTQxMjQ0IG5zLCBjbGsgcmF0ZSA9IDIwODg3NzkzMCkgd2l0aCBQU0MgPSAyIGlz
CgoJOTQxMjQ0ICogMjA4ODc3OTMwIC8gKDEwMDAwMDAwMDAgKiAzKSA9IDY1NTM1LjAzMjc4MTY0
ID4gMHhmZmZmID0gbWF4X2FycgoKQnV0IGFzIGl0J3Mgc3RpbGwgcm91bmRlZCBkb3duIHRvIDY1
NTM1IGl0J3MgYSB2YWxpZCBjb25maWd1cmF0aW9uLgoKQmVzdCByZWdhcmRzClV3ZQoKVXdlIEts
ZWluZS1Lw7ZuaWcgKDMpOgogIHB3bTogc3RtMzI6IFJlZnVzZSB0b28gc21hbGwgcGVyaW9kIHJl
cXVlc3RzCiAgcHdtOiBzdG0zMjogRml4IGNhbGN1bGF0aW9uIG9mIHByZXNjYWxlcgogIHB3bTog
c3RtMzI6IEZpeCBlcnJvciBtZXNzYWdlIHRvIG5vdCBkZXNjcmliZSB0aGUgcHJldmlvdXMgZXJy
b3IgcGF0aAoKIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIHwgMjMgKysrKysrKysrKysrKysrKy0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoK
CmJhc2UtY29tbWl0OiAxNjEzZTYwNGRmMGNkMzU5Y2YyYTdmYmQ5YmU3YTBiY2ZhY2ZhYmQwCi0t
IAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
