Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF09290E6F3
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 11:26:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A464C78002;
	Wed, 19 Jun 2024 09:26:50 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16DA5C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 09:26:46 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42179dafd6bso4497875e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 02:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718789206; x=1719394006;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+qqb0yobL2/RGgvLBdYrDcwIAeg34/SRC7j1a+9BQM=;
 b=0OnENyIsaJdaQvvZh6rjCE0Rtk5RqNh2b2M53OPUB/DALLbP4nzuDWsCOwhGD/ev38
 ds1SV0/EdiEE63y3zCzJnY4OC9f5iwUamAX5MPveN1sOgaEaxVUDzBaJK2mMYg4CZ9S1
 JCWzS/0Q39FcSKh7oMLgKECRBbacBV3lKcWvgjA0H9xnAl7I6VocxBw0kWWazud+H1sr
 Bh9l0/LYtRPwd0KVvng8vw3uAGEk/dSxZ/MRUjLE3Dl31uQUIRt3gZUWOekAbT1px/7z
 MjZpwemu+F1eNjn+6r0NkttT6UylnVNU1uxKg3zHcFxMxEMSJf0kiPYJ7XGNLmxGau5u
 YM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718789206; x=1719394006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7+qqb0yobL2/RGgvLBdYrDcwIAeg34/SRC7j1a+9BQM=;
 b=PR9Ant6wje8nVEZFv7aK46k5U/9/StfXlb7qoY++B9eo+55nIpNQC42SXqnymk+nRS
 M0zQQvjCFwyy8naaJ78f4atPa/9LiNjCHdcFHVJF+GfJZP1dbhf3PcH4NzurByXld2Br
 uEOpjblyNIkr04C6xsPBimjmDUWmwN0mGkBirfmil2xIEmD+8Qgga+v/2/q0MnmC/Tla
 wC0sgJLzGRKcwe5BiXcFsg/ZTbLO97jr98J9NPx8GHC9iSKmLhiCEDR8LrWIDohGUCiN
 NCsn1OwbQNgr6pcLK1nT6VKKEgg/IiE4Mrip39BzdAD86VqxGJI9CDkNOGmxRrg9bXN1
 buFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmWKTKIGNzadNz3q6n43pFilpqM1ycXTeedVu/k+kNEvTL6yzv9KE+y5XA682jVHO73XxFLJ5M/rAdj2JCX8urvSgssmj7OBl9wCxFf9ev+VXRBoviGd62
X-Gm-Message-State: AOJu0YzFA8alwysee+5Ur/JYsP9HW3B/BYrZUHh/p1GuRiqIk43knZmq
 Xp+V6rUFruyM6GZbKPMz8NnApIAhu0+4cEh3mnANs9sRAAb+024gQVbPOpFUJek=
X-Google-Smtp-Source: AGHT+IGfWLTr9ssnbsRhjkvHvT/KYb0ndiiJ29jhEvmScaQZp69vPy0UokUJtxlEqZze+8ABe7aCoQ==
X-Received: by 2002:a05:600c:319c:b0:424:71e6:258b with SMTP id
 5b1f17b1804b1-42471e6273bmr40938175e9.6.1718789206193; 
 Wed, 19 Jun 2024 02:26:46 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075114dcfsm16587999f8f.114.2024.06.19.02.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 02:26:45 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lee Jones <lee@kernel.org>, Thierry Reding <treding@nvidia.com>
Date: Wed, 19 Jun 2024 11:26:25 +0200
Message-ID: <e6a1aa8343971c0b8f77d9e4d88c08b26279bf09.1718788826.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1718788826.git.u.kleine-koenig@baylibre.com>
References: <cover.1718788826.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2596;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=uprloTlZWW2ITNEvdDXN3a5XnP9pblOhaEltw1mAAZI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmcqRH6SJGfFE/V8DVVjzbmOURvUhFQT3Nwp0Hw
 XiLMsfjVsuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnKkRwAKCRCPgPtYfRL+
 ThXDCACwzZkJ8F2VHE/jJurLEZHTn+Is/zOVkDK5pPfy6uPLFPgQ3wTiaffvjAojLi8o7SCenwc
 PTNzMByX0+QENQYaYOgU+aFImVfTMNOFytVtNlozMHJFc8iAttlSnpVgYcAJLwnfvL89sC6XdvA
 4fNIeL29SRmOv2DbKR+JQFdDXUFKNbCecR3xbxhEmIwB6M8xAq3gfbLzT56M/N4JrdkMdpYfL0F
 tehelyoRLei/rPaRuqnx6q4oYk/YgB/nAkDayV+xexI9ls75YJTbTncg1CEldC3CNJJRSN5j/rD
 aIiTU5NiM9HiVv0hVmREkOTdZqZw5h1nmlOlUlCrdy/eW1mB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-pwm@vger.kernel.org, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] pwm: stm32: Fix calculation of prescaler
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

QSBzbWFsbCBwcmVzY2FsZXIgaXMgYmVuZWZpY2lhbCwgYXMgdGhpcyBpbXByb3ZlcyB0aGUgcmVz
b2x1dGlvbiBvZiB0aGUKZHV0eV9jeWNsZSBjb25maWd1cmF0aW9uLiBIb3dldmVyIGlmIHRoZSBw
cmVzY2FsZXIgaXMgdG9vIHNtYWxsLCB0aGUKbWF4aW1hbCBwb3NzaWJsZSBwZXJpb2QgYmVjb21l
cyBjb25zaWRlcmFibHkgc21hbGxlciB0aGFuIHRoZSByZXF1ZXN0ZWQKdmFsdWUuCgpPbmUgc2l0
dWF0aW9uIHdoZXJlIHRoaXMgZ29lcyB3cm9uZyBpcyB0aGUgZm9sbG93aW5nOiBXaXRoIGEgcGFy
ZW50CmNsb2NrIHJhdGUgb2YgMjA4ODc3OTMwIEh6IGFuZCBtYXhfYXJyID0gMHhmZmZmID0gNjU1
MzUsIGEgcmVxdWVzdCBmb3IKcGVyaW9kID0gOTQxMjQzIG5zIGN1cnJlbnRseSByZXN1bHRzIGlu
IFBTQyA9IDEuIFRoZSB2YWx1ZSBmb3IgQVJSIGlzCnRoZW4gY2FsY3VsYXRlZCB0bwoKCVBTQyA9
IDk0MTI0MyAqIDIwODg3NzkzMCAvICgxMDAwMDAwMDAwICogMikgLSAxID0gOTgzMDEKClRoaXMg
dmFsdWUgaXMgYmlnZ2VyIHRoYW4gNjU1MzUgaG93ZXZlciBhbmQgc28gZG9lc24ndCBmaXQgaW50
byB0aGUKcmVzcGVjdGl2ZSByZWdpc3Rlci4gSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgdGhlIFBX
TSB3YXMgY29uZmlndXJlZCBmb3IKYSBwZXJpb2Qgb2YgMzEzNzMzLjQ4MDYwMjc2MTYgbnMgKHdp
dGggQVJSID0gOTgzMDEgJiAweGZmZmYpLiBFdmVuIGlmCkFSUiB3YXMgY29uZmlndXJlZCB0byBp
dHMgbWF4aW1hbCB2YWx1ZSwgb25seSBwZXJpb2QgPSA2Mjc0OTUuNjg2MTE2NzY2OQpucyB3b3Vs
ZCBiZSBhY2hpZXZhYmxlLgoKRml4IHRoZSBjYWxjdWxhdGlvbiBhY2NvcmRpbmdseSBhbmQgYWRh
cHQgdGhlIGNvbW1lbnQgdG8gbWF0Y2ggdGhlIG5ldwphbGdvcml0aG0uCgpXaXRoIHRoZSBjYWxj
dWxhdGlvbiBmaXhlZCB0aGUgYWJvdmUgY2FzZSByZXN1bHRzIGluIFBTQyA9IDIgYW5kIHNvIGFu
CmFjdHVhbCBwZXJpb2Qgb2YgOTQxMjI5LjE2NjcxOTUyODUgbnMuCgpGaXhlczogODAwMmZiZWVm
MWU0ICgicHdtOiBzdG0zMjogQ2FsY3VsYXRlIHByZXNjYWxlciB3aXRoIGEgZGl2aXNpb24gaW5z
dGVhZCBvZiBhIGxvb3AiKQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KLS0tCiBk
cml2ZXJzL3B3bS9wd20tc3RtMzIuYyB8IDE3ICsrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3B3bS9wd20tc3RtMzIuYyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCmluZGV4IDNlN2Iy
YThlMzRlNy4uMmRlNzE5NWU0M2E5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIu
YworKysgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwpAQCAtMzIxLDE3ICszMjEsMjQgQEAgc3Rh
dGljIGludCBzdG0zMl9wd21fY29uZmlnKHN0cnVjdCBzdG0zMl9wd20gKnByaXYsIHVuc2lnbmVk
IGludCBjaCwKIAkgKiBGaXJzdCB3ZSBuZWVkIHRvIGZpbmQgdGhlIG1pbmltYWwgdmFsdWUgZm9y
IHByZXNjYWxlciBzdWNoIHRoYXQKIAkgKgogCSAqICAgICAgICBwZXJpb2RfbnMgKiBjbGtyYXRl
Ci0JICogICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKwkgKiAgIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSDiiaQgbWF4X2FycgogCSAqICAgTlNFQ19QRVJfU0VDICogKHBy
ZXNjYWxlciArIDEpCiAJICoKLQkgKiBpc24ndCBiaWdnZXIgdGhhbiBtYXhfYXJyLgorCSAqIFRo
aXMgZXF1YXRpb24gaXMgZXF1aXZhbGVudCB0bworCSAqCisJICogICAgIHBlcmlvZF9ucyAqIGNs
a3JhdGUKKwkgKiAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0g4omkIHByZXNjYWxlciArIDEKKwkg
KiAgIE5TRUNfUEVSX1NFQyAqIG1heF9hcnIKKwkgKgorCSAqIEFzIHRoZSBsZWZ0IGhhbmQgc2lk
ZSBtaWdodCBub3QgYmUgaW50ZWdlciBidXQgdGhlIHJpZ2h0IGhhbmQgc2lkZQorCSAqIGlzLCB0
aGUgZGl2aXNpb24gbXVzdCBiZSByb3VuZGVkIHVwIHdoZW4gZG9pbmcgaW50ZWdlciBtYXRoLiBU
aGVyZQorCSAqIGlzIG5vIHZhcmlhbnQgb2YgbXVsX3U2NF91NjRfZGl2X3U2NCgpIHRoYXQgcm91
bmRzIHVwLCBzbyB3ZSdyZQorCSAqIHRyYWRpbmcgdGhhdCBhZ2FpbnN0IHRoZSArMSB3aGljaCBy
ZXN1bHRzIGluIGEgbm9uLW9wdGltYWwgcHJlc2NhbGVyCisJICogb25seSBpZiB0aGUgZGl2aXNp
b24ncyByZXN1bHQgaXMgaW50ZWdlci4KIAkgKi8KIAogCXByZXNjYWxlciA9IG11bF91NjRfdTY0
X2Rpdl91NjQocGVyaW9kX25zLCBjbGtfZ2V0X3JhdGUocHJpdi0+Y2xrKSwKIAkJCQkJKHU2NClO
U0VDX1BFUl9TRUMgKiBwcml2LT5tYXhfYXJyKTsKLQlpZiAocHJlc2NhbGVyID4gMCkKLQkJcHJl
c2NhbGVyIC09IDE7Ci0KIAlpZiAocHJlc2NhbGVyID4gTUFYX1RJTV9QU0MpCiAJCXJldHVybiAt
RUlOVkFMOwogCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
