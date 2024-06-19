Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D03E090E7F4
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 12:12:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A535C78016;
	Wed, 19 Jun 2024 10:12:15 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB1ADC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 10:12:12 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52c32d934c2so6807973e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 03:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718791932; x=1719396732;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHeUArdSKpP0gigzpdr9jDKMc/RdHGYl+hgWmyzctFg=;
 b=UEX95ApnDP/ONnRH9HbQBNsvWStX+0MqGENCaMrHKt2ggTucWXEFYPAOW2GtYPrN3Z
 CMMtu5mrl2xYIlAof2hqoH8Swk28RUYCpJnjFIUj4cyBJk+z1EvKxsovejI61uO1D2Ah
 mvJJisTCIiIOiY08d9e3sQcLu5WIR3Az6bfsQT3UfEhydeak5WngypeFln3OQpa7tn8j
 DEQ7QRVJaZ7qMgFMCrSPIR/b7ownVfRhaU+PIz1dNqWLCgavY+YLk6KuXcVfokJ/nlgh
 PeLitW7BdJBr3YBaRU/xmhLW5WgqaqMdBDop/FpDi0oxbZFGpiUm6pstf2eAq8+trxef
 rFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718791932; x=1719396732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHeUArdSKpP0gigzpdr9jDKMc/RdHGYl+hgWmyzctFg=;
 b=UQ79qYUwx5jNVFbJra089DP8qcheNoZH68JXPwzAdwo5cQU1s2hB8/ylQAWkhCYZ3H
 iDKl1cQz1M/k4zSp0llbSW/rOywBATDpLGm2zZfq2F2Silj/WtPHwlpPwymR2gOug9C8
 AW8iwHoPVdQI/Llgsu3dQ8R4sz+qzH5zEZnXbbAlEhg0AFVcCBbN3G8WfmAv/bNwce1w
 AUmG+TCjjS5sUB3PC4HyGXNyo6nu3OYsc1juAk0V4pTYK5tlB9BwImfYaudj2QGJIDAU
 jim6MOYWfsplr/DqLVD2udIkxbPXQwhlZ56Xa39PRlVXuiyTtJqmpzoScP4VbPxiaOkh
 9s1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpwDO8MH1v+5j7MHGiHXYzAjhAvO0FI0Xse7TJG3Wmk5UhUCtBcwBP5flJore6TbE8arkUEvHyoOtgOR++2tqAN3TMvFcmm3moconFAHLjfzm172y8k2lO
X-Gm-Message-State: AOJu0YwBxfDqIhrzCyOMM34QxO76WTii/EY67r9uor4h27aYOjbUSVOr
 OhqBCNlXoXRIQIDMFJ8NdDlBP8e4zs1wWRz2aq6gQG7J+XtTcvRfrfVZTtZEUZo=
X-Google-Smtp-Source: AGHT+IGyBLZDsIe+RLHY2gT0ffX4UdQ+4/orS3dRcY6M6qSnO9AgKtn+LaqX7vFTMoagllxCj9bhpg==
X-Received: by 2002:a19:c205:0:b0:52c:aa0f:622d with SMTP id
 2adb3069b0e04-52ccaa37500mr1184800e87.30.1718791931979; 
 Wed, 19 Jun 2024 03:12:11 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f602e802sm224164165e9.11.2024.06.19.03.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 03:12:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 William Breathitt Gray <wbg@kernel.org>, Lee Jones <lee@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 19 Jun 2024 12:11:44 +0200
Message-ID: <126bd153a03f39e42645573eecf44ffab5354fc7.1718791090.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=ls4kxFHqkBG+kx3WnRXHImWHnlbY3kjK18Z2TnMQLqo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmcq7mxkltqOid2paUGt3syPB6S0GwVABYwtite
 mZw5LibI4+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnKu5gAKCRCPgPtYfRL+
 ThvbCACIw0IFO0iRtD++sN85YjotjckPff1mDVwNLBVaYqLdD/VtfYCUK2skkHC67BNifelJo3I
 G2/mOes1u137ttN4EbhqeW5MG9RqBa19yYwx31nH8RvOUywSbqyhYfdgeuDqtr/A1NDvL6eOnjU
 U9uwZf7FjLh4mnnTehhIJJoGBFAKprGxIbVI7QjjBJiP0/WEB0U/GF85mbSjXauaQBq5Iw2yynC
 DEczOF7dcKrtl1IzqBaF08lPGfHzGpX0WUbX064/snRbhcVXQ5ruP93BFjUM+67ecHXsEymcTHy
 dTqkyaIFtvIUw3HjwSHexHs0tMC4xNcCb6dgUX0okdcKZ6W3
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Scherer <T.Scherer@eckelmann.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/5] counter: stm32-timer-cnt: Use
	TIM_DIER_CCxIE(x) instead of TIM_DIER_CCxIE(x)
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

VGhlc2UgdHdvIGRlZmluZXMgaGF2ZSB0aGUgc2FtZSBwdXJwb3NlIGFuZCB0aGlzIGNoYW5nZSBk
b2Vzbid0CmludHJvZHVjZSBhbnkgZGlmZmVyZW5jZXMgaW4gZHJpdmVycy9jb3VudGVyL3N0bTMy
LXRpbWVyLWNudC5vLgoKVGhlIG9ubHkgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSB0d28gaXMgdGhh
dAoKCVRJTV9ESUVSX0NDX0lFKDEpID09IFRJTV9ESUVSX0NDMklFCgp3aGlsZQoKCVRJTV9ESUVS
X0NDeElFKDEpID09IFRJTV9ESUVSX0NDMUlFCgouIFRoYXQgbWFrZXMgaXQgbmVjZXNzYXJ5IHRv
IGhhdmUgYW4gZXhwbGljaXQgIisgMSIgaW4gdGhlIHVzZXIgY29kZSwKYnV0IElNSE8gdGhpcyBp
cyBhIGdvb2QgdGhpbmcgYXMgdGhpcyBpcyB0aGUgY29kZSBsb2NhdGF0aW9uIHRoYXQKImtub3dz
IiB0aGF0IGZvciBzb2Z0d2FyZSBjaGFubmVsIDEgeW91IGhhdmUgdG8gdXNlIFRJTV9ESUVSX0ND
MklFCihiZWNhdXNlIHNvZnR3YXJlIGd1eXMgc3RhcnQgY291bnRpbmcgYXQgMCwgd2hpbGUgdGhl
IHJlbGV2YW50IGhhcmR3YXJlCmRlc2lnbmVyIHN0YXJ0ZWQgYXQgMSkuCgpTaWduZWQtb2ZmLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KLS0tCiBk
cml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
b3VudGVyL3N0bTMyLXRpbWVyLWNudC5jIGIvZHJpdmVycy9jb3VudGVyL3N0bTMyLXRpbWVyLWNu
dC5jCmluZGV4IDA2NjRlZjk2OWY3OS4uMTg2ZTczZDZjY2I0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2NvdW50ZXIvc3RtMzItdGltZXItY250LmMKKysrIGIvZHJpdmVycy9jb3VudGVyL3N0bTMyLXRp
bWVyLWNudC5jCkBAIC00NjUsNyArNDY1LDcgQEAgc3RhdGljIGludCBzdG0zMl9jb3VudF9ldmVu
dHNfY29uZmlndXJlKHN0cnVjdCBjb3VudGVyX2RldmljZSAqY291bnRlcikKIAkJCXJldCA9IHN0
bTMyX2NvdW50X2NhcHR1cmVfY29uZmlndXJlKGNvdW50ZXIsIGV2ZW50X25vZGUtPmNoYW5uZWws
IHRydWUpOwogCQkJaWYgKHJldCkKIAkJCQlyZXR1cm4gcmV0OwotCQkJZGllciB8PSBUSU1fRElF
Ul9DQ19JRShldmVudF9ub2RlLT5jaGFubmVsKTsKKwkJCWRpZXIgfD0gVElNX0RJRVJfQ0N4SUUo
ZXZlbnRfbm9kZS0+Y2hhbm5lbCArIDEpOwogCQkJYnJlYWs7CiAJCWRlZmF1bHQ6CiAJCQkvKiBz
aG91bGQgbmV2ZXIgcmVhY2ggdGhpcyBwYXRoICovCkBAIC00NzgsNyArNDc4LDcgQEAgc3RhdGlj
IGludCBzdG0zMl9jb3VudF9ldmVudHNfY29uZmlndXJlKHN0cnVjdCBjb3VudGVyX2RldmljZSAq
Y291bnRlcikKIAogCS8qIGNoZWNrIGZvciBkaXNhYmxlZCBjYXB0dXJlIGV2ZW50cyAqLwogCWZv
ciAoaSA9IDAgOyBpIDwgcHJpdi0+bmNoYW5uZWxzOyBpKyspIHsKLQkJaWYgKCEoZGllciAmIFRJ
TV9ESUVSX0NDX0lFKGkpKSkgeworCQlpZiAoIShkaWVyICYgVElNX0RJRVJfQ0N4SUUoaSArIDEp
KSkgewogCQkJcmV0ID0gc3RtMzJfY291bnRfY2FwdHVyZV9jb25maWd1cmUoY291bnRlciwgaSwg
ZmFsc2UpOwogCQkJaWYgKHJldCkKIAkJCQlyZXR1cm4gcmV0OwotLSAKMi40My4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
