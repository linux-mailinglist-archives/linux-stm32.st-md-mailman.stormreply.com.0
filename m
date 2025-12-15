Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C24E2CBE3DF
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Dec 2025 15:17:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90889C35E2B;
	Mon, 15 Dec 2025 14:17:50 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48642C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 14:17:49 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-641977dc00fso5660820a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 06:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808269; x=1766413069;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jtA7J2/qth5t0PM6hBWIeoPmBTb33drrrwinTXvOw1g=;
 b=rUkTjgpLBAyOf8NVojcso7BSfvWkKDPLX45MHrfDg9cMy//MPM3Kbx9R4adoPvhMNU
 8eD5JfGexEXWrmTuONpdCS1LQPNebd9+/yKeF3RiNF/jTy4WMcqPAiU9h35cRi9SwQ7J
 t4Yt44PuiCA/YTT56/U36/xQmDv17pl2uTs+ZYiIBbf6vxCknuopOFY8DbjvzX87if6m
 BG9PIfBKA+EJkX3FY5ya1pH6iVsW86UJvkcxiZcYWPLnJHulSAnrPP2reUGAZ+vdk6A2
 I4LXG3ZJQijKHGGu++sfhPSaTlX4zLO2P4yLbeDTVh6S0ZFgSDrB2j7VeJKYGJQ/+BQm
 L48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765808269; x=1766413069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jtA7J2/qth5t0PM6hBWIeoPmBTb33drrrwinTXvOw1g=;
 b=cSONPtOM+b3OLm6uHaZJmVxtTNWdvnwGauzcmfAgDohZOT/n55U8q3IFcWZpk7QuOj
 CvXSiHhH0ETzzP0MJY94GosqRT8J4wPAZcGnvwf6i6s2vwnSuC6Prul8Ztb+w2p+TfPu
 +c5a5Vfd0Co7OWK3GBTxL1G3QnXMMgTHEoGMdsBb6jgu55pUPvvVzyxnUx4TQFLI6yEo
 vVKDt3rvjw+VHJPwvX9nTCcqyMe3Vc7wxyV4D3MT76FU8II/yLyOm5ORNAw8OqZkxta1
 hSSmeMC9W/+NyIiTaYDLrOR7jMgiXeGxcBlyq/FonjmR6vn2O2VX7ol8zvCXN3H/kTRq
 0aVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwYdG33SjeliGV0u7bzVun62rql1HJCZw8FVnV8mQnqRI8hSd3lQe8hlLUEldXJM/7Tfe4BlkEn7nyLQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxjcZ4ftMQwqw2xHxYF0G2lXVilI6f9iD8mrn9wZIscizhgr5n7
 70z0rAayxLtCCI3e1Ho5iLzbSiZ/lLxigHNI5AUYRn9nCDeex8Ur5R7UWzVpuY3/mWk=
X-Gm-Gg: AY/fxX5Z7mCqWcMOlafPTtqhVOmabPMryhkFbjCReaWpwQt5yHr0IjbRk5QubovmFrE
 rYVjzGhb353zlgPOTOKCwykknFqlH9ylIJp7K/k+RS5Z5J5A/P/XR8ETwsnY3iJw+c8ceRjYJ0q
 +LuXBKZ+FOX5J0kEPkT0U8e4RP0RNqEBA9KG9P9hKVNX272CAgM3omdHXvQ30iN5Idk6XaTVPDH
 zhETACEPkmnP6JNb9WbWKjB30UFCLmAeI5RbWO3F3EhfHosNleS1mh5AKQ62CzznWm6UGDA/Miw
 RghEGTlqpGJQB7qX1hmK6NuR2zvoiljFS6+kvBesFxrgLP0Yza8ZyjGovs/yU4a5b9dBuObJNbS
 EkK6KLNFbRrrinuIlDXC7ZFyLqEjDXhT37sBC+06SbJOFmZamPf9aeIv6UMfOfZ3Ub60wDVaM5I
 A5/lGWowX7+BiaSUlEerqFupdHA6LPPVm+b5v3u5suNAjLiQ29cqAo5axmXg==
X-Google-Smtp-Source: AGHT+IFv/1u5W9CnoFiaYoPlvVQjDIdpfyxbrw8ig3P6eLn1uHC5BYn5sqa+mcQbAnC/+TOxgPrUcw==
X-Received: by 2002:a05:6402:2747:b0:640:abd5:863d with SMTP id
 4fb4d7f45d1cf-6499b1c2a09mr11674219a12.20.1765808268604; 
 Mon, 15 Dec 2025 06:17:48 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de.
 [46.5.122.62]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-6498210ed32sm13548630a12.29.2025.12.15.06.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 06:17:48 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Date: Mon, 15 Dec 2025 15:16:39 +0100
Message-ID: <b70ad65c88a82cf56c93cf17cf326213f8273e37.1765791463.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=U2aCK4CwX4oX996AKQXtxl/fnEvZCMh7YIAYyx6fXTo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQBhiuTDaNseAt3EsBljDKzQwacM+pSRuQiPAQ
 arTLi9z4TCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUAYYgAKCRCPgPtYfRL+
 TnPbB/93KOuWIwDOJ283H+/wb1IIrgxqlC+DspRkdayu/Cjo2Z3TLbCwKyVMa5P6gZTnCDpH9Si
 8rY5VZw8XaCqtqlLyVXjKit0WM5xeWDSRTlO+Q9WpokHiBxGfYIyP6YwTr+uo5OUlZshddxiDMz
 2SQfGZcAHDksHjUDaPeVnlK7IUY6b0gcAmXFtPxNMEs4g1V8A58bIiOWqeAH6qjmW/P1Cxu7xac
 jYyR+lv+iCEhcIfMPVN9z2+RE8RmB7GbwgvuIPvs3GJJEULWKqdkcmdpkMlwQ48qO2LpQPvrvw2
 Iu45H6xt8WaFrlDiRp+l+5sICtpI1uY89HTZulc2m2fYD7tb
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, op-tee@lists.trustedfirmware.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 09/17] efi: stmm: Make use of tee bus
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
ZSBkcml2ZXIgbmVlZGluZwp0byBiZSBjb252ZXJ0ZWQgdG8gdGhlIGJ1cyBtZXRob2RzLgoKUmV2
aWV3ZWQtYnk6IFN1bWl0IEdhcmcgPHN1bWl0LmdhcmdAb3NzLnF1YWxjb21tLmNvbT4KU2lnbmVk
LW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+
Ci0tLQogZHJpdmVycy9maXJtd2FyZS9lZmkvc3RtbS90ZWVfc3RtbV9lZmkuYyB8IDExICsrKysr
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZmlybXdhcmUvZWZpL3N0bW0vdGVlX3N0bW1fZWZpLmMgYi9k
cml2ZXJzL2Zpcm13YXJlL2VmaS9zdG1tL3RlZV9zdG1tX2VmaS5jCmluZGV4IDU5MDM4MTE4NThi
Ni4uN2IwNGRkNjQ5NjI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Zpcm13YXJlL2VmaS9zdG1tL3Rl
ZV9zdG1tX2VmaS5jCisrKyBiL2RyaXZlcnMvZmlybXdhcmUvZWZpL3N0bW0vdGVlX3N0bW1fZWZp
LmMKQEAgLTUyMCw4ICs1MjAsOSBAQCBzdGF0aWMgdm9pZCB0ZWVfc3RtbV9yZXN0b3JlX2VmaXZh
cnNfZ2VuZXJpY19vcHModm9pZCkKIAllZml2YXJzX2dlbmVyaWNfb3BzX3JlZ2lzdGVyKCk7CiB9
CiAKLXN0YXRpYyBpbnQgdGVlX3N0bW1fZWZpX3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0
YXRpYyBpbnQgdGVlX3N0bW1fZWZpX3Byb2JlKHN0cnVjdCB0ZWVfY2xpZW50X2RldmljZSAqdGVl
X2RldikKIHsKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmdGVlX2Rldi0+ZGV2OwogCXN0cnVjdCB0
ZWVfaW9jdGxfb3Blbl9zZXNzaW9uX2FyZyBzZXNzX2FyZzsKIAllZmlfc3RhdHVzX3QgcmV0Owog
CWludCByYzsKQEAgLTU3MSwyMSArNTcyLDE5IEBAIHN0YXRpYyBpbnQgdGVlX3N0bW1fZWZpX3By
b2JlKHN0cnVjdCBkZXZpY2UgKmRldikKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCB0ZWVf
c3RtbV9lZmlfcmVtb3ZlKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRpYyB2b2lkIHRlZV9zdG1t
X2VmaV9yZW1vdmUoc3RydWN0IHRlZV9jbGllbnRfZGV2aWNlICpkZXYpCiB7CiAJdGVlX3N0bW1f
cmVzdG9yZV9lZml2YXJzX2dlbmVyaWNfb3BzKCk7Ci0KLQlyZXR1cm4gMDsKIH0KIAogTU9EVUxF
X0RFVklDRV9UQUJMRSh0ZWUsIHRlZV9zdG1tX2VmaV9pZF90YWJsZSk7CiAKIHN0YXRpYyBzdHJ1
Y3QgdGVlX2NsaWVudF9kcml2ZXIgdGVlX3N0bW1fZWZpX2RyaXZlciA9IHsKIAkuaWRfdGFibGUJ
PSB0ZWVfc3RtbV9lZmlfaWRfdGFibGUsCisJLnByb2JlCQk9IHRlZV9zdG1tX2VmaV9wcm9iZSwK
KwkucmVtb3ZlCQk9IHRlZV9zdG1tX2VmaV9yZW1vdmUsCiAJLmRyaXZlcgkJPSB7CiAJCS5uYW1l
CQk9ICJ0ZWUtc3RtbS1lZmkiLAotCQkucHJvYmUJCT0gdGVlX3N0bW1fZWZpX3Byb2JlLAotCQku
cmVtb3ZlCQk9IHRlZV9zdG1tX2VmaV9yZW1vdmUsCiAJfSwKIH07CiAKLS0gCjIuNDcuMwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
