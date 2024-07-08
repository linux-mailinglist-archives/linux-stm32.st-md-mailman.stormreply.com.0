Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F188792A088
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2024 12:53:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEA94C6DD96;
	Mon,  8 Jul 2024 10:53:03 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A543C6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jul 2024 10:52:56 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3678f36f154so2023302f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jul 2024 03:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720435976; x=1721040776;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9t9CW2ikDJ93nVzHMjsfMYNAYP8IQbMk6FtSVUZ+Oyo=;
 b=Tyki/0YgialQO+PpbnyhxcjMZ25sz6QlfN7NcnBJmT+ZhGhvLSkET0zOuurnGklfwH
 kVhaNd0l/HB8ZOlPTXszjU8jlzJuMTPGNbxKjgUNuL7GRwof0EpWBysqyoTHKllZQ/JV
 awkaBZt3nBvFJCarBxmmPCBq9tkVc1BIqMc6o+PTLDK/htmaKSFT7F3f+W5Rp3DCXl5d
 0SQcJiHFvePad/9C+0r8d60Sukl+duBBIjvrm8hF9pvD55HBJ5AIhBpIJHgUl8sYBnbp
 6Ssdm172Zr4+A7KSjri+86kdES29KLh7cdvFeg0+7Rik7vLZrpggOFyW/2vX42tNwwjn
 ce7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720435976; x=1721040776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9t9CW2ikDJ93nVzHMjsfMYNAYP8IQbMk6FtSVUZ+Oyo=;
 b=BGe5K/fCXTrhmIGf8AW4BfSrkJKUPtFF+8wzPWpuqTVT6k9o4gEJcdxa4uxKJWOiOh
 wyIsOppjNT+p4pfuMw8yTQ6EStoKfaa0LmFm5oKgdHZ5YuJGJi87L3zNdh4dpZu6uE4Z
 DDudDVSQE4u8zV2O6H6Uh5xnrVptEq9W3mU8pTKU+YuNvqIwn0J+sVDu9UygC4kCvzWf
 vrbVZI8Ib4CuNk1Rlh9itA8eCaWqyGIbqGZI2dLOLpWSS3yMIPoXzeXXh+hiN6EhB5dV
 uyQ8Qpit/r3LiyQAd3orqYcFNM8aNX9/TwiogjP1k2TZ9LILnQYwSXa2KjJxWghW9aJx
 1cgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa1ZK4DNUa2RRntF6K2sdaLXG2adiX6WFTfjJChCdGm7I/bCjNkMWnFLcYpxRpVDDQ2CDn/CH1ELaCz3nAaLXPhX3cTdRTzOQFmCL2PzQVHyuFcpLiS7hg
X-Gm-Message-State: AOJu0Yz8KZHi2Q9dACYpyNI9sDYPwwHOH3izMzZOO0qi8PQ5AMuxq3nz
 cMZPDndDcGZIdxk5h9xfEDlkee1yZYdT26LGjrek+yXrhEH3+QZndOkUNggiZFo=
X-Google-Smtp-Source: AGHT+IGdYnypB7xTlH719+DjiVuD4czKnIEonrQHHTOzz00kZsM072lcPEtJDLFCd8IDnJcosZHsxA==
X-Received: by 2002:a5d:698b:0:b0:367:8fee:443b with SMTP id
 ffacd0b85a97d-3679dd56208mr7132968f8f.41.1720435975893; 
 Mon, 08 Jul 2024 03:52:55 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3678a648dd3sm15478080f8f.89.2024.07.08.03.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 03:52:55 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Date: Mon,  8 Jul 2024 12:52:26 +0200
Message-ID: <cover.1720435656.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2672;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=Yb0WIAoaOKNp5Xv4PSSI4KumM0UVBL2yI5MvTxK0YKQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmi8TrEwrhSTsU+WYFtDXfVOsElXp4JJimZYycX
 tewSw9AhzyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZovE6wAKCRCPgPtYfRL+
 TpT8B/4vQpye6kHDXbHQtKqAcG7Sgx9KXOlhnKnRcpDujDsY4SrDDFUOJPa7BlanQ0cSAMjHreK
 rHzfyEKef43R5JBJF5F3jR9u1rUqEEeAiYbT9S9VnekSqSWvIM3urOm4iat7fF9u0rZcq6Vu+iB
 67lAEXjus5D3kI01bmaOWTP07W2orpkPJJB5Wa92l+VIjTTLy0TzjfjWHDjdMdaIwS0sDlnWw5Z
 hFcXNfJnX9eL+HgkJ375kbLNlfZ3fmvCipjYjxtX/R6i+WszdErNUBtImwe7LEf1+8D0xo7drSn
 w2P2Sy2CLGEOZahAreDlzGG6Irq+Q8QsMCPI2lsnw+hBK1XH
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/6] pwm: New abstraction and userspace API
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

SGVsbG8sCgp0aGlzIHNlcmllcyBpbXBsZW1lbnRzIGEgbmV3IGFic3RyYWN0aW9uIHRvIG1vZGVs
IHRoZSBvdXRwdXQgd2F2ZWZvcm0gb2YKYSBQV00uIFRoZSBtYWluIGltcHJvdmVtZW50IGlzIHRo
YXQgaXQgZGVmaW5lcyBhIGR1dHlfb2Zmc2V0IGluc3RlYWQgb2YKYSBwb2xhcml0eSBhbmQgc28g
YWxsb3dzIHRvIG1vZGVsIG1vcmUgd2F2ZSBmb3Jtcy4gVGhlIG1vdGl2YXRpb24gZm9yCnRoaXMg
aXMgdGhhdCB3ZSBuZWVkIGEgUFdNIGNoYW5uZWwgdG8gaGF2ZSBhbiBvZmZzZXQgY29tcGFyZWQg
dG8gYW5vdGhlcgpjaGFubmVsIGZyb20gdGhlIHNhbWUgY2hpcCwgdGhhdCBpcyBzb21ldGhpbmcg
bGlrZSB0aGF0OgoKICAgICAgICAgX18gICAgICAgICAgICAgICAgIF9fICAgICAgICAgICAgICAg
ICBfXwogICAgICAgIC8gIFxfX19fX19fX19fX19fX18vICBcX19fX19fX19fX19fX19fLyAgXF9f
X19fX19fXwogICAgICAgIF4gICAgX18gICAgICAgICAgICBeICAgIF9fICAgICAgICAgICAgXiAg
ICBfXwogICAgICAgIF9fX18vICBcX19fX19fX19fX19fX19fLyAgXF9fX19fX19fX19fX19fXy8g
IFxfX19fXwogICAgICAgIF4gICAgICAgICAgICAgICAgICBeICAgICAgICAgICAgICAgICAgXgoK
VGhlIGtlcm5lbCBBUEkgZm9yIHRoYXQgaXMgc3RpbGwgbWlzc2luZyAoc28gaXQgY2Fubm90IGJl
IHVzZWQgeWV0IGZyb20KdGhlIGlpbyBkcml2ZXIgd2UgaW50ZW5kIHRvIHVzZSBpdCksIGJ1dCB0
aGVyZSBpcyBhIHVzZXJzcGFjZSBBUEkgdGhhdAptYWtlcyB1c2Ugb2YgaXQuCgpUaGlzIGlzIGFj
dHVhbGx5IHRoZSAybmQgc2VyaWVzIHRoYXQgaW1wbGVtZW50cyBhIHVzZXJzcGFjZSBBUEkgdXNp
bmcgYQpjaGFyZGV2LCB0aGUgdXNlcnNwYWNlIGxpYiBmcm9tIHRoZSBsYXN0IGl0ZXJhdGlvbiBp
cyB1cGRhdGVkCmFjY29yZGluZ2x5LiBTZWUKCiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdWtsZWluZWsvbGlicHdtLmdpdAoKVGhlIHNlcmll
cyBiYXNlcyBvbiB0b3Agb2YKCiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvdWtsZWluZWsvbGludXguZ2l0IHB3bS9mb3ItbmV4dAoKcGx1cyB0
aGUgcGF0Y2gKCiAgICAgICAgcHdtOiBNYWtlIGluZm8gaW4gdHJhY2VzIGFib3V0IGFmZmVjdGVk
IHB3bSBtb3JlIHVzZWZ1bAoKYXZhaWxhYmxlIGF0Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXB3bS8yMDI0MDcwNTIxMTQ1Mi4xMTU3OTY3LTItdS5rbGVpbmUta29lbmlnQGJheWxpYnJl
LmNvbS8KLgoKVW5mb3J0dW5hdGVseSB0aGlzIHJlcXVpcmVzIGEgbmV3IHNldCBvZiBjYWxsYmFj
a3MgZm9yIGxvd2xldmVsIGRyaXZlcnMuCkluIHRoaXMgc2VyaWVzIGF4aS1wd21nZW4gYW5kIHN0
bTMyIGFyZSBjb252ZXJ0ZWQgYWNjb3JkaW5nbHkuCgpUaGUgZG9jdW1lbnRhdGlvbiBzaXR1YXRp
b24gaXMgbm90IG9wdGltYWwgeWV0LCBhbmQgSSBleHBlY3QgdGhhdCB0aGUKbG9ja2luZyBwYXRj
aCB0cmlnZ2VycyBhIGxvY2tkZXAgd2FybmluZyBmb3IgdGhlIG1lc29uIGRyaXZlci4gVGhpcyBp
cwpob3dldmVyIGEgZmFsc2UgcG9zaXRpdmUgYW5kIGEgcHJvYmxlbSB0aGF0IG5lZWRzIGFkZHJl
c3NpbmcgaW4gdGhlIGNsawpzdWJzeXN0ZW0uCgpMb29raW5nIGZvcndhcmQgdG8geW91ciBmZWVk
YmFjaywKVXdlIEtsZWluZS1Lw7ZuaWcKClV3ZSBLbGVpbmUtS8O2bmlnICg2KToKICBwd206IEFk
ZCBtb3JlIGxvY2tpbmcKICBwd206IE5ldyBhYnN0cmFjdGlvbiBmb3IgUFdNIHdhdmVmb3Jtcwog
IHB3bTogQWRkIHN1cHBvcnQgZm9yIHB3bWNoaXAgZGV2aWNlcyBmb3IgZmFzdGVyIGFuZCBlYXNp
ZXIgdXNlcnNwYWNlCiAgICBhY2Nlc3MKICBwd206IEFkZCB0cmFjaW5nIGZvciB3YXZlZm9ybSBj
YWxsYmFja3MKICBwd206IGF4aS1wd21nZW46IEltcGxlbWVudGF0aW9uIG9mIHRoZSB3YXZlZm9y
bSBjYWxsYmFja3MKICBwd206IHN0bTMyOiBJbXBsZW1lbnRhdGlvbiBvZiB0aGUgd2F2ZWZvcm0g
Y2FsbGJhY2tzCgogZHJpdmVycy9wd20vY29yZS5jICAgICAgICAgICB8IDY3OCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLQogZHJpdmVycy9wd20vcHdtLWF4aS1wd21nZW4uYyB8
IDE0OCArKysrKy0tLQogZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgICAgICB8IDYwNSArKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tCiBpbmNsdWRlL2xpbnV4L3B3bS5oICAgICAgICAgIHwg
IDUxICsrKwogaW5jbHVkZS90cmFjZS9ldmVudHMvcHdtLmggICB8IDEzNCArKysrKystCiBpbmNs
dWRlL3VhcGkvbGludXgvcHdtLmggICAgIHwgIDI0ICsrCiA2IGZpbGVzIGNoYW5nZWQsIDEzMzQg
aW5zZXJ0aW9ucygrKSwgMzA2IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1
ZGUvdWFwaS9saW51eC9wd20uaAoKCmJhc2UtY29tbWl0OiAxMjBhNTI4MjEzYjY2OTMyMTRlM2Ni
YzI0YTljMzA1MmE0YjEwMjRiCnByZXJlcXVpc2l0ZS1wYXRjaC1pZDogMGUyMTE1M2NkMDEyZjQx
YmE5ZGI1MjM1N2ZkMDgyMTlhZjUzZTI2YwotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
