Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8B09127F8
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 16:37:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2299C78002;
	Fri, 21 Jun 2024 14:37:46 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82998C712A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 14:37:42 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-57d15b85a34so2435393a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718980662; x=1719585462;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFQvBp09SYhqBXHYcpVbluB3rmpVFZWSPU/sKj+XFgQ=;
 b=J0qQNomzuSUvBJ48mrn8LGhZ/0KCekgQGdxy/Vv0hppnOCJ6Fvxtlfu3Qsul0Ft+hq
 dAPGck3/VLG+7qO8c0N8njHSuGJlyqcN4fba8IpVcCsrO+pgKikdYXKVRSvT48L4c+GY
 m2CE+ZJsHF/JRhMWqUIjXKXKAzXot2FxZCxAJTcQO4j5stfpspyJYu8mPbpPAOdN+TUe
 qKk5eMCz+FJI7u1AoV7iSeOidsZ4H7sGzvWP7aKWyFYEUkM98TWEqTs3LJT3w8GcU1gp
 ryVCfnVjFrvyLh/z6/Qr0YW7mZbqApQGepe0dZ3OqTGXMOhec7uoNGF+m3VS8sdRLtsA
 IkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718980662; x=1719585462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nFQvBp09SYhqBXHYcpVbluB3rmpVFZWSPU/sKj+XFgQ=;
 b=JSQwkxqLcB7IVPkqGhJrBUrYRtKCnS7dFSHq7v3NKvZKqo5ymPtGQdWKWJLjlYTIcV
 Iiq0X4RM+wkWb249JuEGoBTaHrtpNgCXuvjIw1psbqOYMwEG1HDX6E8zDPbebBVIG8CW
 eJzTTNJ40wLVZFl/Dp4FTf7LAlza50reLh1VvBpQFT3fLEJoemnW8jL3yqPSPm0jDmiV
 9MDwV3yUTnQzCv4iwxPXkUqx6opwWJDNCRqR9T3kNXeTlWExOKSjk3lFPR3Rf7bFuCGI
 Kxlvu774MSTMWX8sXFXsyk7XSmvOmGJWb1fTxqmk4/042EKuUnQEb6SD00ndEgFPsz6J
 pL4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3zcezGBH9csyZdTiSmiY4lCOacu5B5g4zwnWHXnhwTO7ehsk1fOqw2/92gblhsA+k41o1OS6naVFRrzxAfJt8hrWcHgKKhgAxjABHBuqLocM5TPWBi5Am
X-Gm-Message-State: AOJu0Yyjq5GciYuyqJPqsOgjr7hkpK0Hsu3cfC8ccznTSHCYxKM8oStn
 3zQuwPRkIrbyyND74Y0zND/vNzxeb1GdoFYoYMTsqRB48tbr0FMLdvv5yBi1XCQ=
X-Google-Smtp-Source: AGHT+IHhBkbnDwe6DC78mHyYrZoTEMrk9luPtrCGS6uQpBAuAlhQcl4/FTWTW5gRCSAfgVzjizpaQA==
X-Received: by 2002:a17:906:fe4d:b0:a6f:4b7d:599b with SMTP id
 a640c23a62f3a-a6fab64869dmr667183566b.33.1718980661770; 
 Fri, 21 Jun 2024 07:37:41 -0700 (PDT)
Received: from localhost (p5091583d.dip0.t-ipconnect.de. [80.145.88.61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf56ee06sm90550566b.198.2024.06.21.07.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 07:37:41 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Lee Jones <lee@kernel.org>, Thierry Reding <treding@nvidia.com>
Date: Fri, 21 Jun 2024 16:37:13 +0200
Message-ID: <b4d96b79917617434a540df45f20cb5de4142f88.1718979150.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1718979150.git.u.kleine-koenig@baylibre.com>
References: <cover.1718979150.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2498;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=k1b/UZlBPcg27jJ13+cEn2qIvvv2MFL41xaIuM2GWOg=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmdZAdj6nX78OTtkGgf+zjfTRynFlrjHnlSPFLB
 /sXRGO38cqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnWQHQAKCRCPgPtYfRL+
 TpsPCACpUFVr/Itd1iZOgd/j4VQ1XonbgsnD5G7pim5yCA1J/WsMS8mS+NJSuUN83vBBSyk8uEp
 Jr5j0peLUzVb3MKp8PcSn19eXTfXnkitfvvr+UnJ4HzcKZkUp3jCDf4f+WlNZRM/ZCdHJqDafs1
 PGPOGdY3A7h6VtZtSNn40D/sMD9n+bgcS4ZGELGa/mnOQ0seYBXqYyT941X8UpSK60KZHgNAjRp
 dOVhv184I2YtPmfJGMkDM1jvDqtcOn3u/2mY3UyhNzXS5yEc1cBbm7ljRofEEBG87rZ1c1/oloS
 wBhYOqRr2nZ0UpEDKNNMyvaaxLinCMBBY32VQkGyLHg45K94
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: Trevor Gamblin <tgamblin@baylibre.com>, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/3] pwm: stm32: Fix calculation of
	prescaler
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
IFBTQyA9IDEuIFRoZSB2YWx1ZSBmb3IgQVJSIGlzCnRoZW4gY2FsY3VsYXRlZCB0bwoKCUFSUiA9
IDk0MTI0MyAqIDIwODg3NzkzMCAvICgxMDAwMDAwMDAwICogMikgLSAxID0gOTgzMDEKClRoaXMg
dmFsdWUgaXMgYmlnZ2VyIHRoYW4gNjU1MzUgaG93ZXZlciBhbmQgc28gZG9lc24ndCBmaXQgaW50
byB0aGUKcmVzcGVjdGl2ZSByZWdpc3RlciBmaWVsZC4gSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2Ug
dGhlIFBXTSB3YXMKY29uZmlndXJlZCBmb3IgYSBwZXJpb2Qgb2YgMzEzNzMzLjQ4MDYwMjc2MTYg
bnMgKHdpdGggQVJSID0gOTgzMDEgJgoweGZmZmYpLiBFdmVuIGlmIEFSUiB3YXMgY29uZmlndXJl
ZCB0byBpdHMgbWF4aW1hbCB2YWx1ZSwgb25seSBwZXJpb2QgPQo2Mjc0OTUuNjg2MTE2NzY2OSBu
cyB3b3VsZCBiZSBhY2hpZXZhYmxlLgoKRml4IHRoZSBjYWxjdWxhdGlvbiBhY2NvcmRpbmdseSBh
bmQgYWRhcHQgdGhlIGNvbW1lbnQgdG8gbWF0Y2ggdGhlIG5ldwphbGdvcml0aG0uCgpXaXRoIHRo
ZSBjYWxjdWxhdGlvbiBmaXhlZCB0aGUgYWJvdmUgY2FzZSByZXN1bHRzIGluIFBTQyA9IDIgYW5k
IHNvIGFuCmFjdHVhbCBwZXJpb2Qgb2YgOTQxMjI5LjE2NjcxOTUyODUgbnMuCgpGaXhlczogODAw
MmZiZWVmMWU0ICgicHdtOiBzdG0zMjogQ2FsY3VsYXRlIHByZXNjYWxlciB3aXRoIGEgZGl2aXNp
b24gaW5zdGVhZCBvZiBhIGxvb3AiKQpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8
dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc3RtMzIu
YyB8IDE4ICsrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMg
Yi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwppbmRleCAzZTdiMmE4ZTM0ZTcuLmE3ZmYzOWU5ZmMy
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKKysrIGIvZHJpdmVycy9wd20v
cHdtLXN0bTMyLmMKQEAgLTMyMSwxNyArMzIxLDIzIEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX2Nv
bmZpZyhzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2LCB1bnNpZ25lZCBpbnQgY2gsCiAJICogRmlyc3Qg
d2UgbmVlZCB0byBmaW5kIHRoZSBtaW5pbWFsIHZhbHVlIGZvciBwcmVzY2FsZXIgc3VjaCB0aGF0
CiAJICoKIAkgKiAgICAgICAgcGVyaW9kX25zICogY2xrcmF0ZQotCSAqICAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCisJICogICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0g
PCBtYXhfYXJyICsgMQogCSAqICAgTlNFQ19QRVJfU0VDICogKHByZXNjYWxlciArIDEpCiAJICoK
LQkgKiBpc24ndCBiaWdnZXIgdGhhbiBtYXhfYXJyLgorCSAqIFRoaXMgZXF1YXRpb24gaXMgZXF1
aXZhbGVudCB0bworCSAqCisJICogICAgICAgIHBlcmlvZF9ucyAqIGNsa3JhdGUKKwkgKiAgIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gPCBwcmVzY2FsZXIgKyAxCisJICogICBOU0VDX1BF
Ul9TRUMgKiAobWF4X2FyciArIDEpCisJICoKKwkgKiBVc2luZyBpbnRlZ2VyIGRpdmlzaW9uIGFu
ZCBrbm93aW5nIHRoYXQgdGhlIHJpZ2h0IGhhbmQgc2lkZSBpcworCSAqIGludGVnZXIsIHRoaXMg
aXMgZnVydGhlciBlcXVpdmFsZW50IHRvCisJICoKKwkgKiAgIChwZXJpb2RfbnMgKiBjbGtyYXRl
KSAvLyAoTlNFQ19QRVJfU0VDICogKG1heF9hcnIgKyAxKSkg4omkIHByZXNjYWxlcgogCSAqLwog
CiAJcHJlc2NhbGVyID0gbXVsX3U2NF91NjRfZGl2X3U2NChwZXJpb2RfbnMsIGNsa19nZXRfcmF0
ZShwcml2LT5jbGspLAotCQkJCQkodTY0KU5TRUNfUEVSX1NFQyAqIHByaXYtPm1heF9hcnIpOwot
CWlmIChwcmVzY2FsZXIgPiAwKQotCQlwcmVzY2FsZXIgLT0gMTsKLQorCQkJCQkodTY0KU5TRUNf
UEVSX1NFQyAqIChwcml2LT5tYXhfYXJyICsgMSkpOwogCWlmIChwcmVzY2FsZXIgPiBNQVhfVElN
X1BTQykKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
