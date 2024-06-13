Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCC6906619
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jun 2024 10:02:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2326C78011;
	Thu, 13 Jun 2024 08:02:53 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AA82C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2024 08:02:46 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a6ef8bf500dso80658866b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2024 01:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718265766; x=1718870566;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dnouXYbKR9C+V842Lu/FlejmK+Q61rSDTEmMAMuXs1s=;
 b=RMsbiLiqE4OaWmShKUnuon2dHSUsSd+pn2hFrMV+lMgZIr4zyE6CqtYvnqzysOQR1M
 upNU+6T841XikQotV/JYKdwerie81tEd8a6gIdS13CO1NUqLZYLRunDwUZxFlEM/pVH5
 DuCF8hstLY8Rtn7GSH5Pwd7ldYyJP+a+lRDCKsqFIRjgDbgIZ3EShK5THCa719NpbT9Y
 YrLR3rpMDZQyo8XGneXybmP8He70Y919aPjfRmFGhKruAoMAxoWwU/C5NDnK8/Ch2m6A
 clnOJyj2lvGvOCUO02/jWJ+zzJhm6rQZSd4X7MU1j4LuvSFccbDPmkTnxwsKZR+mGDvN
 IwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718265766; x=1718870566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dnouXYbKR9C+V842Lu/FlejmK+Q61rSDTEmMAMuXs1s=;
 b=NFk/LOao2KeYaSPxK419g6/1vOng810xl2+3S2PzZQVl74fZRoU8wraUqGIY/VUBv1
 Vs7pnbOyWzarGeG/Zw+i9+KuiQ3E/d9JGw31de8guYzwbfekpdWQgd3+8dsvPVg4QNyA
 1/OwvnH7nxgNQu069xlWgCWXI5AIe+kLxzQcsEBrmcC15QYf+WvOXSW5iOk03zAHMsy6
 YuYT8OJIdMoAi22YFhGqBDhXF4xQX/9Iofmch+S0AlzJH+TCYD5w693TEY0OooDtOa1x
 tPB3jtBy1ENj1abx/r/+V1uWHmtlrDiQ3P6zXZrslV591Epchh1WVUN/38RyfNyRiYA2
 18pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0uF3otffbW+mTeHQIi1waWdVGEITr3Pa1R9YbignJq0rQ1coCDcnjwJ2Ta0r7QcR1UBpL7vUsNHprNCxKzGzldCmBW68cVQ4DbLCYChYZqSxK5vA9avLi
X-Gm-Message-State: AOJu0Yy+oMPE+ApX19QMPM6gPxuR4ducFwRHd+Rd8OFjy/ni/+kkQRhC
 IUDbB3gFGyDHntNYG/kbc+/je0aaHAQ3R/DpxqOSnWhA9BJKa1X/+2OAYT758Zc=
X-Google-Smtp-Source: AGHT+IH86WCh6FavzI/k/EBoqWjp08iSHXRHSe5UpMmzW1WT6el5RzkD13yWrMvY7VJuYybyeeoG4w==
X-Received: by 2002:a17:906:1593:b0:a6f:5490:5897 with SMTP id
 a640c23a62f3a-a6f54905e7cmr93609066b.8.1718265765718; 
 Thu, 13 Jun 2024 01:02:45 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db620csm44646566b.71.2024.06.13.01.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 01:02:45 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 13 Jun 2024 10:02:28 +0200
Message-ID: <20240613080229.2292413-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1788;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=bO/WQwRtL8e0k3atwcPVBR73XZDenAQhduePCTumyEs=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhrSs5VOn1vxc9vQiZ1m/gqu6yqfT21rqDKcf7F5abHi07
 ZvOBbOgTkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAm8iyT/X9u0I3D/B/WnlEv
 KBGax3Z9Qlu0XnrX0spYYU4Rv3nyR7doHrhdba+wP1ri81tF3gcOqcG73NbevWzN8c47ZruhgXw
 vT0KBukW8Z6S6rN2RqCBvdyWXgMXHT+yP38Ypw933xErGypdV/qrwZca9NdPSO2SqayMnpb0Ou5
 UvqfZGmndn1RTvU0q8+UVnrpjwlcypZ/rK+aqhoXZS/lt9oY3rJBgF3/Q+2S7Vue6Pi8jel96mf
 35OsDnAd1pQQNon4Avj/C39BxVPvvmQ5GC0OnKizIXUX3NaVhpmswmuesv072Dr5RzfPaJFr2ZV
 6MjlGf32n37YQ/DPzMT5Qtymhw2MH9z5yJO1r2hBN38cAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32mp135f-dk: Document output
	pins for PWMs
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

VG8gc2ltcGxpZnkgaWRlbnRpZnlpbmcgdGhlIHBpbnMgd2hlcmUgdGhlIFBXTSBvdXRwdXQgaXMg
cm91dGVkIHRvLAphZGQgYSBjb21tZW50IHRvIGVhY2ggUFdNIGRldmljZSBhYm91dCB0aGUgcmVz
cGVjdGl2ZSBwaW4gb24gdGhlCmV4cGFuc2lvbiBjb25uZWN0b3IuCgpTaWduZWQtb2ZmLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KLS0tCiBhcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kay5kdHMgfCA0ICsrKysKIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9z
dG0zMm1wMTM1Zi1kay5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kay5k
dHMKaW5kZXggNTY3ZTUzYWQyODVmLi5mMWI1MGU0YzEwNTkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRrLmR0cworKysgYi9hcmNoL2FybS9ib290L2R0cy9z
dC9zdG0zMm1wMTM1Zi1kay5kdHMKQEAgLTI3Myw2ICsyNzMsNyBAQCAmdGltZXJzMyB7CiAJL2Rl
bGV0ZS1wcm9wZXJ0eS9kbWEtbmFtZXM7CiAJc3RhdHVzID0gImRpc2FibGVkIjsKIAlwd20gewor
CQkvKiBQV00gb3V0cHV0IG9uIHBpbiA3IG9mIHRoZSBleHBhbnNpb24gY29ubmVjdG9yIChDTjgu
NykgdXNpbmcgVElNM19DSDQgZnVuY3Rpb24gKi8KIAkJcGluY3RybC0wID0gPCZwd20zX3BpbnNf
YT47CiAJCXBpbmN0cmwtMSA9IDwmcHdtM19zbGVlcF9waW5zX2E+OwogCQlwaW5jdHJsLW5hbWVz
ID0gImRlZmF1bHQiLCAic2xlZXAiOwpAQCAtMjg4LDYgKzI4OSw3IEBAICZ0aW1lcnM0IHsKIAkv
ZGVsZXRlLXByb3BlcnR5L2RtYS1uYW1lczsKIAlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCXB3bSB7
CisJCS8qIFBXTSBvdXRwdXQgb24gcGluIDMxIG9mIHRoZSBleHBhbnNpb24gY29ubmVjdG9yIChD
TjguMzEpIHVzaW5nIFRJTTRfQ0gyIGZ1bmN0aW9uICovCiAJCXBpbmN0cmwtMCA9IDwmcHdtNF9w
aW5zX2E+OwogCQlwaW5jdHJsLTEgPSA8JnB3bTRfc2xlZXBfcGluc19hPjsKIAkJcGluY3RybC1u
YW1lcyA9ICJkZWZhdWx0IiwgInNsZWVwIjsKQEAgLTMwMyw2ICszMDUsNyBAQCAmdGltZXJzOCB7
CiAJL2RlbGV0ZS1wcm9wZXJ0eS9kbWEtbmFtZXM7CiAJc3RhdHVzID0gImRpc2FibGVkIjsKIAlw
d20geworCQkvKiBQV00gb3V0cHV0IG9uIHBpbiAzMiBvZiB0aGUgZXhwYW5zaW9uIGNvbm5lY3Rv
ciAoQ044LjMyKSB1c2luZyBUSU04X0NIMyBmdW5jdGlvbiAqLwogCQlwaW5jdHJsLTAgPSA8JnB3
bThfcGluc19hPjsKIAkJcGluY3RybC0xID0gPCZwd204X3NsZWVwX3BpbnNfYT47CiAJCXBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7CkBAIC0zMTYsNiArMzE5LDcgQEAgdGltZXJA
NyB7CiAmdGltZXJzMTQgewogCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJcHdtIHsKKwkJLyogUFdN
IG91dHB1dCBvbiBwaW4gMzMgb2YgdGhlIGV4cGFuc2lvbiBjb25uZWN0b3IgKENOOC4zMykgdXNp
bmcgVElNMTRfQ0gxIGZ1bmN0aW9uICovCiAJCXBpbmN0cmwtMCA9IDwmcHdtMTRfcGluc19hPjsK
IAkJcGluY3RybC0xID0gPCZwd20xNF9zbGVlcF9waW5zX2E+OwogCQlwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiLCAic2xlZXAiOwoKYmFzZS1jb21taXQ6IDE2MTNlNjA0ZGYwY2QzNTljZjJhN2Zi
ZDliZTdhMGJjZmFjZmFiZDAKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
