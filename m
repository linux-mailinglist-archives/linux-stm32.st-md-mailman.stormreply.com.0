Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4011B8B5C55
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2024 17:04:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5FCFC71298;
	Mon, 29 Apr 2024 15:04:51 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E07EC7128C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 15:04:45 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-78f05341128so332452385a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2024 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714403084; x=1715007884;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cX0Nt2WjhKwJC/tEnFmYRvlB1MfFk2LmbDG81TIdFVM=;
 b=DF+DoNXnFzoH65JNh+o2uu4XbD5Du3V2p7tfAUwnW9IjukJuDvX7kQULu1w3wGkcci
 ycs6ERLBGNhJ8uvGnyA1ow7hbgAGjU9ecGns+VMiBJzp7L6UCwqNv45CAVPQ244qdpqC
 WjkM7AIgGL/pp3EL0EKwKx3WxqeRJgwvJYaYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714403084; x=1715007884;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cX0Nt2WjhKwJC/tEnFmYRvlB1MfFk2LmbDG81TIdFVM=;
 b=hZOhS/1MJBMyIavjIQzLcMswIUhGdHJlVBpHqa+LmJaBGzPr8g8FIb5cuVVHFtDBR/
 igAkjkoXX/pzevFheVNogPDP9rPwAaL9uGvA62VlXfvrAnVnCmdaqCnfmB1V8JW2BBR1
 IYKLepYX5nZOcgJnPLA0m0s7EwZrdfMgVi8u93gYxgDX18zErj+rKgC/4v3iq0Av1Vch
 TVZVqOPf+anW+Y+exSj/4qnDuzunr0t84Gl7t/e3Irm1CQvegjeKjzrlllj/WmJUCyq9
 ZN+rReAL6sfCk7fiD/LOVfrJ8QAojBY+SBsWFGZLo3uLB8YbCVm5hxCc3n3ItzWYKPPl
 GG7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqCPzLdoxvar06eCTe35vjP9h2cQZNoG3+jUaUD/yMegRyJ+Kg+nN8iGnPD/pkAgKeppjSZyQrc+2kINeQDdvZ7rJhTnj15mbm1pOnl0auM8gN0PjpLC6m
X-Gm-Message-State: AOJu0YwudDhg0ql+QETZGdS1EBZk8Psk5l4ibJlVZ0+I+rY0tC5tflRs
 k/Yedo1vPUzGbZ6qjHT65fc0RbEb8YVbdGD6GTsNVTESkudoGyKDfVWkeHsi1g==
X-Google-Smtp-Source: AGHT+IHWuK1oddmDBavr6+ksLu5/g3HWffeblwIQsTBH58X6jA8tyFIvmLIj97Bf7YP3AKSemxlfBQ==
X-Received: by 2002:a05:620a:4eb:b0:790:8e96:7841 with SMTP id
 b11-20020a05620a04eb00b007908e967841mr10130143qkh.60.1714403083799; 
 Mon, 29 Apr 2024 08:04:43 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com.
 [35.245.152.114]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 08:04:43 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:40 +0000
MIME-Version: 1.0
Message-Id: <20240429-fix-cocci-v3-1-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
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
Subject: [Linux-stm32] [PATCH v3 01/26] media: pci: mgb4: Refactor struct
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

VGhlIHN0cnVjdCByZXNvdXJjZSBlbmQgZmllbGQgc2lnbmlmaWVzIHRoZSBlbmQgYWRkcmVzcyBu
b3QgdGhlCnJlbGF0aXZlIG9mZnNldCBmcm9tIHRoZSBzdGFydCBmaWVsZCBpLmUgc2l6ZSA9PSAo
ZW5kIC0gc3RhcnQpICsgMS4KCkFtZW5kIHRoZSAuZW5kIGZpZWxkIHRvIHNwZWNpZnkgdGhlIGVu
ZCBhZGRyZXNzIG5vdCB0aGUgcmVsYXRpdmUgc2l6ZQpmcm9tIHRoZSBvZmZzZXQgYXMgaXMgY3Vy
cmVudGx5IGdpdmVuLgoKRml4ZXMgY29jY2kgY2hlY2s6CmRyaXZlcnMvbWVkaWEvcGNpL21nYjQv
bWdiNF9yZWdzLmM6MTM6MjItMjU6IFdBUk5JTkc6IFN1c3BpY2lvdXMgY29kZS4gcmVzb3VyY2Vf
c2l6ZSBpcyBtYXliZSBtaXNzaW5nIHdpdGggcmVzCgpSZXZpZXdlZC1ieTogTWFydGluIFTFr21h
IDxtYXJ0aW4udHVtYUBkaWdpdGVxYXV0b21vdGl2ZS5jb20+ClJldmlld2VkLWJ5OiBCcnlhbiBP
J0Rvbm9naHVlIDxicnlhbi5vZG9ub2dodWVAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogUmlj
YXJkbyBSaWJhbGRhIDxyaWJhbGRhQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL21lZGlhL3Bj
aS9tZ2I0L21nYjRfY29yZS5jIHwgNCArKy0tCiBkcml2ZXJzL21lZGlhL3BjaS9tZ2I0L21nYjRf
cmVncy5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wY2kvbWdiNC9tZ2I0X2NvcmUuYyBi
L2RyaXZlcnMvbWVkaWEvcGNpL21nYjQvbWdiNF9jb3JlLmMKaW5kZXggOWJjZjEwYTc3ZmQzLi42
MDQ5OGE1YWJlYmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvcGNpL21nYjQvbWdiNF9jb3Jl
LmMKKysrIGIvZHJpdmVycy9tZWRpYS9wY2kvbWdiNC9tZ2I0X2NvcmUuYwpAQCAtNDkzLDEzICs0
OTMsMTMgQEAgc3RhdGljIGludCBtZ2I0X3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25z
dCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCiAJc3RydWN0IG1nYjRfZGV2ICptZ2JkZXY7CiAJ
c3RydWN0IHJlc291cmNlIHZpZGVvID0gewogCQkuc3RhcnQJPSAweDAsCi0JCS5lbmQJPSAweDEw
MCwKKwkJLmVuZAk9IDB4ZmYsCiAJCS5mbGFncwk9IElPUkVTT1VSQ0VfTUVNLAogCQkubmFtZQk9
ICJtZ2I0LXZpZGVvIiwKIAl9OwogCXN0cnVjdCByZXNvdXJjZSBjbXQgPSB7CiAJCS5zdGFydAk9
IDB4MTAwMCwKLQkJLmVuZAk9IDB4MTgwMCwKKwkJLmVuZAk9IDB4MTdmZiwKIAkJLmZsYWdzCT0g
SU9SRVNPVVJDRV9NRU0sCiAJCS5uYW1lCT0gIm1nYjQtY210IiwKIAl9OwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tZWRpYS9wY2kvbWdiNC9tZ2I0X3JlZ3MuYyBiL2RyaXZlcnMvbWVkaWEvcGNpL21n
YjQvbWdiNF9yZWdzLmMKaW5kZXggNTNkNGU0NTAzYTc0Li4zMWJlZmQ3MjJkNzIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvbWVkaWEvcGNpL21nYjQvbWdiNF9yZWdzLmMKKysrIGIvZHJpdmVycy9tZWRp
YS9wY2kvbWdiNC9tZ2I0X3JlZ3MuYwpAQCAtMTAsNyArMTAsNyBAQAogaW50IG1nYjRfcmVnc19t
YXAoc3RydWN0IHJlc291cmNlICpyZXMsIHN0cnVjdCBtZ2I0X3JlZ3MgKnJlZ3MpCiB7CiAJcmVn
cy0+bWFwYmFzZSA9IHJlcy0+c3RhcnQ7Ci0JcmVncy0+bWFwc2l6ZSA9IHJlcy0+ZW5kIC0gcmVz
LT5zdGFydDsKKwlyZWdzLT5tYXBzaXplID0gcmVzb3VyY2Vfc2l6ZShyZXMpOwogCiAJaWYgKCFy
ZXF1ZXN0X21lbV9yZWdpb24ocmVncy0+bWFwYmFzZSwgcmVncy0+bWFwc2l6ZSwgcmVzLT5uYW1l
KSkKIAkJcmV0dXJuIC1FSU5WQUw7CgotLSAKMi40NC4wLjc2OS5nM2M0MDUxNjg3NC1nb29nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
