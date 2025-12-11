Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77999CB6A32
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Dec 2025 18:16:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46555C60460;
	Thu, 11 Dec 2025 17:16:05 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15A4BC3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Dec 2025 17:16:04 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so2971715e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Dec 2025 09:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473363; x=1766078163;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UMKKApEFn5c8w14X+9lJPDLyCyjEvXThCatdwXgudow=;
 b=X8Vw3Fy8mdW2qlSaBO7U8MSvsfVcHDLLBKsjIpSmErR1lVz5VoKjR1D/QwEABhGKXF
 EXbDfBT9py+3LVcCMoFlbycGRtMyupw+JRTVW4X+C/dSLjH+FbkOws/JbGqbevQWg0ri
 AoTvTzs3Yw4NJXSNDMOcN86hJHYMW8v7LZq668gvsVG8c01z3oXx2nKyHu7QAIIpwReD
 0NcixcEP3YCARtUySBB2Pk+0Ze0QrnVeDbj8b03qtfFBpUme74EtFViJhPI0lUHQwtWo
 CbibljLw8rdGAX/Uk6nJznF5EBJkY2F8Cuf3S6aUzv1yg4drWijsnubkbX3ILIjy7H/s
 htsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765473363; x=1766078163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UMKKApEFn5c8w14X+9lJPDLyCyjEvXThCatdwXgudow=;
 b=SpM2otHsKTSUvesl9yoKxFOwF8oV3QjVjB2sPeRq3uKQuVR3n6VqrrP/uKobLU1QZG
 k3RPosppM9oLlR6QyP3QNNT4C86DAasfDBoq24T2WzXIpFgXLfesF0wx5wkjVGpviC0U
 YOdg3ByFrkYxum/chYC6LajYHV/VBVeAnvMI5mUSV/2VTAv7Kz758ZsMfr6qb0Y8Bfx3
 fEjIFE1ZIWepe8ZUQmgj9OUjyjv7+sshnOE9WkhZztjvV/WcaPqWIk7+CSISnbKzdP4T
 cvZr1aZWCT2lJAlW3lDEEqlGZgj+h1mFHF7SRk5c80Z00rlYEs0EaW5w9sOczELargbt
 NmWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURdi+gnvR2RD+sRLFXp84WfBVOls3IZ+ObS2+YKLAkf2/rtrtxR5lQSaz1/Uz1SvZDs19JiJJBF50Pqg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw3h+0QdUh02/rJVCX2W3lRdLynEf1r2ckaS0eq0WjTiWJcuzxT
 eDMb51XgSSIxa5x5oUdrW4qi5yyASfseYlS2IwqsaJUj5wmJfNsS6JPsinGwa9SpVyk=
X-Gm-Gg: AY/fxX6/3ceqvO276lLIgCawbON94ZMK/tjnwKf7JMfbPsU3CyNsoR3GaguI8shn4kk
 vX0r96p8p12V/5UBSBDyYd/Ncmr0XBFmMNmOcDBmZplP9Yoy6aj+Wa6A0CUgmFT+PJHBb2c3Xb2
 zv0zsNbhA/UX8VZq0kXjh3I1YvWdhC5X+/08G8IbiwZLd/0wZqv1ncMrcwC+141Sup7NPuGgUR+
 +EIOOG81rHQQ1uzaGmHmE3OP7nraDpvibRM7VWGBwHQLt8Ob9D1Gt1PeQGrHvB6YaagG5nUDshY
 fxeS1xevdaxLgd3BjWNcl4woGwyeQGL7q4T5mOQlIOv6Uh+YukF3U1aMdvc80/TMhefAqrWK4CO
 vM+PcC1vgX1FnuN3g+EBjUiAdSNl8xC4BwL9c6GhJpHpLyV9Zl2q6TwhHFYLTQgbLb85rAgIfZo
 Y/XdhFUvTGZllinbkAIhEu+jUKJBpdxNLWp5YHEeHP4MvGLoFHMWpPMx2oU//rcM+ATsaJF9eBc
 YE=
X-Google-Smtp-Source: AGHT+IHR5wjI76zu9sSNjB/TR53h9qMqGGV22PiW6Sdd0Ha2DeU4S6wSatCpyfSEE7httE0vZDzqrQ==
X-Received: by 2002:a7b:c8c8:0:b0:477:a71c:d200 with SMTP id
 5b1f17b1804b1-47a89ecc772mr21399785e9.11.1765473363525; 
 Thu, 11 Dec 2025 09:16:03 -0800 (PST)
Received: from localhost
 (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de.
 [2003:f6:5f00:6608:b665:17f2:bd01:7279])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-47a89da4756sm47522465e9.6.2025.12.11.09.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 09:16:03 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jan Kiszka <jan.kiszka@siemens.com>
Date: Thu, 11 Dec 2025 18:15:03 +0100
Message-ID: <9e3d9ab0f7987f313237b51911865f0cccae8eb5.1765472125.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=qEDk8mMFP/XEe464QAjK/gPzKwVOi+IAVX6mgf9QBHw=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOvwrs/+p/EDhPyVo0hsuMP6NMvstZvfqWF6GI
 tijtgKig1OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTr8KwAKCRCPgPtYfRL+
 TsBoB/wNEFSwNDkrKKSZy5aBqOoPmgOHHGWeulZsknyP3eoMH8etCfP7O5OsQJHFzYBTbcaeW6u
 ullpwQB4VirhqNZF9P+gKDCKywT9I9jIWFaS7dkKKzEQ1YCt0H4nGxR094WM6gq4PAUWPdnjGzY
 LC1E95XggFZrSmDz+c4c61Ifzcg7EpDMDlkoaDDSz8D5QHMKZG/uGMMQAujC5kP8C0yREbR+diO
 ZGXnzGlKJr+qOIIXYrnvnZLxZJFd8X9AaDf16BFDO7erlIo8VpODXbUJkxIT3/VgPeZx3SWUTql
 a9O+gvtyLIm9AgLef3J5+UoIw4BpKfDQAJByZVX6gOhes9a2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-efi@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v1 09/17] efi: stmm: Make use of tee bus
	methods
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

VGhlIHRlZSBidXMgZ290IGRlZGljYXRlZCBjYWxsYmFja3MgZm9yIHByb2JlIGFuZCByZW1vdmUu
Ck1ha2UgdXNlIG9mIHRoZXNlLiBUaGlzIGZpeGVzIGEgcnVudGltZSB3YXJuaW5nIGFib3V0IHRo
ZSBkcml2ZXIgbmVlZGluZwp0byBiZSBjb252ZXJ0ZWQgdG8gdGhlIGJ1cyBtZXRob2RzLgoKU2ln
bmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5j
b20+Ci0tLQogZHJpdmVycy9maXJtd2FyZS9lZmkvc3RtbS90ZWVfc3RtbV9lZmkuYyB8IDExICsr
KysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvZWZpL3N0bW0vdGVlX3N0bW1fZWZpLmMg
Yi9kcml2ZXJzL2Zpcm13YXJlL2VmaS9zdG1tL3RlZV9zdG1tX2VmaS5jCmluZGV4IDU5MDM4MTE4
NThiNi4uN2IwNGRkNjQ5NjI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Zpcm13YXJlL2VmaS9zdG1t
L3RlZV9zdG1tX2VmaS5jCisrKyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL3N0bW0vdGVlX3N0bW1f
ZWZpLmMKQEAgLTUyMCw4ICs1MjAsOSBAQCBzdGF0aWMgdm9pZCB0ZWVfc3RtbV9yZXN0b3JlX2Vm
aXZhcnNfZ2VuZXJpY19vcHModm9pZCkKIAllZml2YXJzX2dlbmVyaWNfb3BzX3JlZ2lzdGVyKCk7
CiB9CiAKLXN0YXRpYyBpbnQgdGVlX3N0bW1fZWZpX3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldikK
K3N0YXRpYyBpbnQgdGVlX3N0bW1fZWZpX3Byb2JlKHN0cnVjdCB0ZWVfY2xpZW50X2RldmljZSAq
dGVlX2RldikKIHsKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmdGVlX2Rldi0+ZGV2OwogCXN0cnVj
dCB0ZWVfaW9jdGxfb3Blbl9zZXNzaW9uX2FyZyBzZXNzX2FyZzsKIAllZmlfc3RhdHVzX3QgcmV0
OwogCWludCByYzsKQEAgLTU3MSwyMSArNTcyLDE5IEBAIHN0YXRpYyBpbnQgdGVlX3N0bW1fZWZp
X3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldikKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCB0
ZWVfc3RtbV9lZmlfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRpYyB2b2lkIHRlZV9z
dG1tX2VmaV9yZW1vdmUoc3RydWN0IHRlZV9jbGllbnRfZGV2aWNlICpkZXYpCiB7CiAJdGVlX3N0
bW1fcmVzdG9yZV9lZml2YXJzX2dlbmVyaWNfb3BzKCk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogTU9E
VUxFX0RFVklDRV9UQUJMRSh0ZWUsIHRlZV9zdG1tX2VmaV9pZF90YWJsZSk7CiAKIHN0YXRpYyBz
dHJ1Y3QgdGVlX2NsaWVudF9kcml2ZXIgdGVlX3N0bW1fZWZpX2RyaXZlciA9IHsKIAkuaWRfdGFi
bGUJPSB0ZWVfc3RtbV9lZmlfaWRfdGFibGUsCisJLnByb2JlCQk9IHRlZV9zdG1tX2VmaV9wcm9i
ZSwKKwkucmVtb3ZlCQk9IHRlZV9zdG1tX2VmaV9yZW1vdmUsCiAJLmRyaXZlcgkJPSB7CiAJCS5u
YW1lCQk9ICJ0ZWUtc3RtbS1lZmkiLAotCQkucHJvYmUJCT0gdGVlX3N0bW1fZWZpX3Byb2JlLAot
CQkucmVtb3ZlCQk9IHRlZV9zdG1tX2VmaV9yZW1vdmUsCiAJfSwKIH07CiAKLS0gCjIuNDcuMwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
