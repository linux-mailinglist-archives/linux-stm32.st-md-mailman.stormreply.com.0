Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 089ED8AABBE
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Apr 2024 11:49:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C28DFC6DD9B;
	Fri, 19 Apr 2024 09:49:21 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CB1FC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 09:49:20 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-78f02c96c52so109303085a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 02:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1713520159; x=1714124959;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TtlViaUk+ppF2YvB3wdQyftKniyUzK8Ej92YBlwMILc=;
 b=BGY6NxBHIushor+oIrkb2YN5kl+9Qt9WYmnCiRXiGaJnf+oAuPFaLZPb3Af4gr7CqS
 qkGvqQzYjkEIdYgnRsowACZzlQEQh2thWoNIh7qDOf/VcbLDt0Xhb/g2YtHYLIpPzuH3
 SPBsIgNUBGUD6TFgcCVNbp1XE7NgoP3P+N940=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713520159; x=1714124959;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TtlViaUk+ppF2YvB3wdQyftKniyUzK8Ej92YBlwMILc=;
 b=Hz8O3wbU8G9/TuSp1Kv3yplLVgtBh0HL6aRZIFjNsgxy/o+O6myEXjQd/ZTKBgPTOe
 Dk0w90n+l8p2yc3XetfslzBwf2TWGjWopR1YwJnvvlfCRSCUUZ2hhIrVog6WHiGscXMK
 v7MgUnyeKoE2ozC7+w47+gdAhFZWJTbL+FnUO6YQnng2sZNxlkI790ZyQep+1j4fWH/f
 TBn27g3NfZRGNmWXxMAMRdyW/qP5WvvzkyLqOGbtUQF7GCNDa7flGAXq56p6/fGNTOv7
 nNUXSm9hoDtOXosL8g8CRZERHBRbI2dUySgf13TSrlc24o36/qcfjCFD53h8Uc+s37Nj
 ojEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV050jkAPEyzitNjJ4daUDevOwzkXoC5kyIeEE9kRlHyvE3Kx/gaEEZO1styzqGlLSxuLul5iGjpf9WVCLtqYimYpk3LIoIwaQsEinL20gWQKiIaC0OWQtF
X-Gm-Message-State: AOJu0YzpuigrGf/bdqpv3TGg3gVyQsBB9epCNEXQdzihlfg+PIO+leZw
 /H02IHPlZGlIV83PxEMQ7fXpiJY1MvzC+vVw57Ffyy4NQQefD2d22OUkGSMNXA==
X-Google-Smtp-Source: AGHT+IHcSLXPGR/K0waZNqFgMaXNzaf95X9YYFUFUCHgvEpSUHJvLAV/8QVHrr+4o4OmwTvG9tzrkg==
X-Received: by 2002:a05:620a:1da6:b0:78d:5065:c5df with SMTP id
 pj38-20020a05620a1da600b0078d5065c5dfmr1595944qkn.18.1713520159351; 
 Fri, 19 Apr 2024 02:49:19 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 02:49:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:47 +0000
MIME-Version: 1.0
Message-Id: <20240419-fix-cocci-v2-1-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
Cc: linux-arm-msm@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 01/26] media: pci: mgb4: Refactor struct
	resources
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

VGhlIHN0cnVjdCByZXNvdXJjZSBlbmQgZmllbGQgaXMgaW5jbHVzaXZlIG5vdCBleGNsdXNpdmUs
IHRoaXMgaXMsIHRoZQpzaXplIGlzIChlbmQgLSBzdGFydCkgKzEuCgpVcGRhdGUgdGhlIGRlZmlu
aXRpb25zIGFuZCB1c2UgdGhlIGdlbmVyaWMgcmVzb3VyY2Vfc2l6ZSgpIGZ1bmN0aW9uLgoKRml4
ZXMgY29jY2kgY2hlY2s6CmRyaXZlcnMvbWVkaWEvcGNpL21nYjQvbWdiNF9yZWdzLmM6MTM6MjIt
MjU6IFdBUk5JTkc6IFN1c3BpY2lvdXMgY29kZS4gcmVzb3VyY2Vfc2l6ZSBpcyBtYXliZSBtaXNz
aW5nIHdpdGggcmVzCgpSZXZpZXdlZC1ieTogTWFydGluIFTFr21hIDxtYXJ0aW4udHVtYUBkaWdp
dGVxYXV0b21vdGl2ZS5jb20+ClNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gUmliYWxkYSA8cmliYWxk
YUBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9tZWRpYS9wY2kvbWdiNC9tZ2I0X2NvcmUuYyB8
IDQgKystLQogZHJpdmVycy9tZWRpYS9wY2kvbWdiNC9tZ2I0X3JlZ3MuYyB8IDIgKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvcGNpL21nYjQvbWdiNF9jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3BjaS9t
Z2I0L21nYjRfY29yZS5jCmluZGV4IDliY2YxMGE3N2ZkMy4uNjA0OThhNWFiZWJmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL21lZGlhL3BjaS9tZ2I0L21nYjRfY29yZS5jCisrKyBiL2RyaXZlcnMvbWVk
aWEvcGNpL21nYjQvbWdiNF9jb3JlLmMKQEAgLTQ5MywxMyArNDkzLDEzIEBAIHN0YXRpYyBpbnQg
bWdiNF9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2Vf
aWQgKmlkKQogCXN0cnVjdCBtZ2I0X2RldiAqbWdiZGV2OwogCXN0cnVjdCByZXNvdXJjZSB2aWRl
byA9IHsKIAkJLnN0YXJ0CT0gMHgwLAotCQkuZW5kCT0gMHgxMDAsCisJCS5lbmQJPSAweGZmLAog
CQkuZmxhZ3MJPSBJT1JFU09VUkNFX01FTSwKIAkJLm5hbWUJPSAibWdiNC12aWRlbyIsCiAJfTsK
IAlzdHJ1Y3QgcmVzb3VyY2UgY210ID0gewogCQkuc3RhcnQJPSAweDEwMDAsCi0JCS5lbmQJPSAw
eDE4MDAsCisJCS5lbmQJPSAweDE3ZmYsCiAJCS5mbGFncwk9IElPUkVTT1VSQ0VfTUVNLAogCQku
bmFtZQk9ICJtZ2I0LWNtdCIsCiAJfTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGNpL21n
YjQvbWdiNF9yZWdzLmMgYi9kcml2ZXJzL21lZGlhL3BjaS9tZ2I0L21nYjRfcmVncy5jCmluZGV4
IDUzZDRlNDUwM2E3NC4uMzFiZWZkNzIyZDcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3Bj
aS9tZ2I0L21nYjRfcmVncy5jCisrKyBiL2RyaXZlcnMvbWVkaWEvcGNpL21nYjQvbWdiNF9yZWdz
LmMKQEAgLTEwLDcgKzEwLDcgQEAKIGludCBtZ2I0X3JlZ3NfbWFwKHN0cnVjdCByZXNvdXJjZSAq
cmVzLCBzdHJ1Y3QgbWdiNF9yZWdzICpyZWdzKQogewogCXJlZ3MtPm1hcGJhc2UgPSByZXMtPnN0
YXJ0OwotCXJlZ3MtPm1hcHNpemUgPSByZXMtPmVuZCAtIHJlcy0+c3RhcnQ7CisJcmVncy0+bWFw
c2l6ZSA9IHJlc291cmNlX3NpemUocmVzKTsKIAogCWlmICghcmVxdWVzdF9tZW1fcmVnaW9uKHJl
Z3MtPm1hcGJhc2UsIHJlZ3MtPm1hcHNpemUsIHJlcy0+bmFtZSkpCiAJCXJldHVybiAtRUlOVkFM
OwoKLS0gCjIuNDQuMC43NjkuZzNjNDA1MTY4NzQtZ29vZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
